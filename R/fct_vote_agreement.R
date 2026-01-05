#' Calculate pairwise voting agreement between MPs
#'
#' @description Efficiently calculates voting agreement rates between MPs,
#' returning only the top N connections per MP to keep the network manageable.
#'
#' @param mp_votes_df Data frame from get_mp_votes() containing voting records
#' @param max_connections Maximum number of connections to keep per MP (default: 10)
#' @param min_agreement Minimum agreement rate to include (0-1, default: 0.7)
#'
#' @return A data frame with columns: mp1, mp2, agreement_rate
#'
#' @import dplyr
#' @import tidyr
#' @importFrom data.table data.table setDT setkey
#'
#' @noRd

calculate_vote_agreement <- function(mp_votes_df, max_connections = 10, min_agreement = 0.7) {
  
  # Create MP names
  mp_votes_clean <- mp_votes_df %>%
    tidyr::unite("mp_name", c("firstName", "lastName"), sep = " ", remove = FALSE) %>%
    dplyr::filter(vote %in% c("YES", "NO")) %>%
    dplyr::mutate(
      vote_binary = ifelse(vote == "YES", 1, 0),
      vote_key = paste(sitting, votingNumber, sep = "_")
    ) %>%
    dplyr::select(MP, mp_name, vote_key, vote_binary)
  
  # Get unique MPs
  unique_mps <- mp_votes_clean %>%
    dplyr::distinct(MP, mp_name)
  
  # Convert to wide format for efficient comparison
  vote_matrix <- mp_votes_clean %>%
    tidyr::pivot_wider(
      id_cols = vote_key,
      names_from = MP,
      values_from = vote_binary
    )
  
  # Get MP columns (exclude vote_key)
  mp_cols <- setdiff(names(vote_matrix), "vote_key")
  
  # Calculate pairwise agreement using vectorized operations
  # This is more efficient than expand_grid + rowwise
  agreement_list <- list()
  
  for (i in seq_along(mp_cols)) {
    mp1_id <- mp_cols[i]
    mp1_votes <- vote_matrix[[mp1_id]]
    
    # Calculate agreement with all other MPs at once
    agreements <- sapply(mp_cols[-i], function(mp2_id) {
      mp2_votes <- vote_matrix[[mp2_id]]
      
      # Only compare where both voted
      valid_pairs <- !is.na(mp1_votes) & !is.na(mp2_votes)
      
      if (sum(valid_pairs) == 0) {
        return(NA_real_)
      }
      
      sum(mp1_votes[valid_pairs] == mp2_votes[valid_pairs]) / sum(valid_pairs)
    })
    
    # Create data frame for this MP
    mp1_agreements <- data.frame(
      mp1_id = mp1_id,
      mp2_id = mp_cols[-i],
      agreement_rate = agreements,
      stringsAsFactors = FALSE
    )
    
    # Filter by minimum agreement and keep top N
    mp1_agreements <- mp1_agreements %>%
      dplyr::filter(!is.na(agreement_rate), agreement_rate >= min_agreement) %>%
      dplyr::arrange(desc(agreement_rate)) %>%
      dplyr::slice_head(n = max_connections)
    
    agreement_list[[i]] <- mp1_agreements
  }
  
  # Combine all agreements
  all_agreements <- dplyr::bind_rows(agreement_list)
  
  # Join with MP names
  all_agreements <- all_agreements %>%
    dplyr::mutate(
      mp1_id = as.integer(mp1_id),
      mp2_id = as.integer(mp2_id)
    ) %>%
    dplyr::left_join(unique_mps, by = c("mp1_id" = "MP")) %>%
    dplyr::rename(mp1_name = mp_name) %>%
    dplyr::left_join(unique_mps, by = c("mp2_id" = "MP")) %>%
    dplyr::rename(mp2_name = mp_name) %>%
    dplyr::select(mp1_id, mp1_name, mp2_id, mp2_name, agreement_rate)
  
  return(all_agreements)
}


#' Prepare network data for visNetwork
#'
#' @description Converts MP data and agreement data into nodes and edges
#' for visNetwork visualization
#'
#' @param df_mps Data frame from get_mps() with MP information
#' @param agreements Data frame from calculate_vote_agreement()
#' @param filter_club Optional club name to filter by (default: NULL for all)
#'
#' @return A list with 'nodes' and 'edges' data frames for visNetwork
#'
#' @import dplyr
#'
#' @noRd

prepare_network_data <- function(df_mps, agreements, filter_club = NULL) {
  
  # Create MP names in df_mps
  df_mps_named <- df_mps %>%
    dplyr::mutate(mp_name = paste(firstName, lastName, sep = " "))
  
  # Filter by club if specified
  if (!is.null(filter_club) && filter_club != "All") {
    df_mps_named <- df_mps_named %>%
      dplyr::filter(club == filter_club)
    
    # Filter agreements to only include MPs in the selected club
    agreements <- agreements %>%
      dplyr::filter(
        mp1_name %in% df_mps_named$mp_name,
        mp2_name %in% df_mps_named$mp_name
      )
  }
  
  # Define party colors (matching existing color scheme)
  party_colors <- c(
    "PiS" = "#012b7f",
    "KO" = "#d41c3c",
    "PSL-TD" = "#3cb43c",
    "Polska2050-TD" = "#f9c300",
    "Lewica" = "#a81849",
    "Razem" = "#870f57",
    "Konfederacja" = "#1b263f",
    "Republikanie" = "#749cbc",
    "niez." = "#000000"
  )
  
  # Prepare nodes
  nodes <- df_mps_named %>%
    dplyr::select(id, mp_name, club, numberOfVotes) %>%
    dplyr::mutate(
      label = mp_name,
      title = paste0("<b>", mp_name, "</b><br>",
                     "Party: ", club, "<br>",
                     "Votes cast: ", numberOfVotes),
      color = party_colors[club],
      color = ifelse(is.na(color), "#999999", color),
      value = numberOfVotes / 10,  # Size based on activity
      group = club
    ) %>%
    dplyr::rename(mp_id = id)
  
  # Prepare edges
  edges <- agreements %>%
    dplyr::mutate(
      from = mp1_id,
      to = mp2_id,
      value = agreement_rate * 5,  # Width based on agreement
      title = paste0("Agreement: ", round(agreement_rate * 100, 1), "%"),
      color = list(opacity = 0.4)
    ) %>%
    dplyr::select(from, to, value, title, color)
  
  return(list(nodes = nodes, edges = edges))
}

