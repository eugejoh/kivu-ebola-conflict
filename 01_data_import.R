# Data Import -------------------------------------------------------------
# 29/10/2018

# Load Packages -----------------------------------------------------------
if (!require(here)) install.packages("here")
library(here) 
source('~/Documents/GitHub/kivu-ebola-conflict/00_load_packages.R')
# list.files("data") # List files in '/data'

# Import EVD Outbreak Data ------------------------------------------------
d_evd <- read.csv(file = here::here("data", "Data_ Ebola Outbreak, North Kivu, Democratic Republic of the Congo (DRC) - August 2018 - MOH-By-Health-Zone.csv"))

# note from maria: added here::here because it wasn't quite working on my side without it 

# Import DRC Conflict Data ------------------------------------------------
d_drc <- read.csv(file = here::here("data", "2018-08-01-2018-10-16-Democratic_Republic_of_Congo.csv"))
