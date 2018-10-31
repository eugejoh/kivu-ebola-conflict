# EDA Functions -----------------------------------------------------------

# Missing Values ----------------------------------------------------------
describe_df <- function(input, ...) {
  if (!missing(...)) out <- input %>% select(...)
  else out <- input
  
  out %>%
    map_dfc( ~ sum(is.na(.))) %>%
    gather(key = col_name, value = missing) %>%
    mutate(NA_percent = round(100 * missing / nrow(input), 2),
           exist_percent = 100 - NA_percent)
}

# Data Types --------------------------------------------------------------
type_df <- function(input, ...) {
  if (!missing(...)) out <- input %>% select(...)
  else out <- input
  
  out %>% 
    map_dfc(~class(.)) %>%
    gather(key = col_name, value = data_type)
}

