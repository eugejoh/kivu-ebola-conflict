# Data Import -------------------------------------------------------------
# 29/10/2018

# Load Packages -----------------------------------------------------------
if (!require(here)) install.packages("here")
library(here)
source('~/Documents/GitHub/kivu-ebola-conflict/00_load_packages.R')
# list.files("data") # List files in '/data'

# Import EVD Outbreak Data ------------------------------------------------
d_evd <- readr::read_csv(file = here::here("data", "Data_ Ebola Outbreak, North Kivu, Democratic Republic of the Congo (DRC) - August 2018 - MOH-By-Health-Zone.csv"))

# Import DRC Conflict Data ------------------------------------------------
d_drc <- readr::read_csv(file = here::here("data", "2018-08-01-2018-11-26-Democratic_Republic_of_Congo.csv"))


# Secondary Headers -------------------------------------------------------
names_2nd <- unlist(d_evd[1,]) #save for reference

evd <- d_evd[-1,] #remove first row

