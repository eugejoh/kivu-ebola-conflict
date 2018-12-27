#source(here::here("01_data_import.R"))
# Fixing Data Types -------------------------------------------------------
evd[1:2] <- lapply(evd[1:2],as.Date) 
#sorry for hard coding, i'm sure there's a better way to do this #EJ I think this way is really clever, didn't know about this method!
evd[6:16] <- sapply(evd[6:16],as.numeric)

# dplyr method 
# evd %>% mutate_at(vars(1:2), as.Date)
# evd %>% mutate_at(vars(6:16), as.numeric)

# Descriptions ------------------------------------------------------------
unique_provinces <- unique(evd$province)
unique_healthzones <- unique(evd$health_zone)

province_healthzone <- unique(evd[,c('province','health_zone')])
report_date_range <- paste(format(min(evd$report_date), "%B %d %Y"), "to", 
                           format(max(evd$report_date), "%B %d %Y"))



# Missing data ------------------------------------------------------------
# still thinking about how to do this: output a list of dates + health
# zones and ID which piece of information is missing in each. 

#identifying which rows have missing data
nas <- d_evd[!complete.cases(d_evd),]

# identifying how many missing values in each row
na_sum <- sapply(d_evd, function(i) sum(is.na(i)))

na_index <- lapply(d_evd, function(i) which(is.na((i))))
na_index <- na_index[unlist(lapply(na_index, function(x) length(x) > 0))] #remove ones with no missing

# Quick epicurve ----------------------------------------------------------

epi_curve <- ggplot(evd) + 
  geom_line(aes(y=total_cases, 
                x = report_date, 
                color = health_zone)) +
  facet_wrap(~ province) +
  theme_minimal() +
  labs(title = "EVD Epi Curve")


