
# Install/Load Packages ---------------------------------------------------

install_packs <- function(pkg) {
  new_pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new_pkg)) {
    install.packages(new_pkg, dependencies = TRUE)
  }
  sapply(pkg, require, character.only = TRUE)
}


packs <- c("lubridate", "here", "tidyverse", "beepr", "pryr", 
           "microbenchmark", "grid", "gridExtra", "scales", 
           "forcats", "data.table","corrplot", "htmlwidgets", 
           "dygraphs", "leaflet", "DT")

install_packs(packs)

rm(packs)