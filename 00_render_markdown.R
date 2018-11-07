# Render Markdown ---------------------------------------------------------
# Stand Alone Script to render markdown files in '/markdown' folder

if (!require(here)) install.packages("here")
library(here)
library(rmarkdown)

rmarkdown::render(
  input = here::here("markdown", "eda_report.Rmd"),
  output_file = paste0("kivu-ebola-conflict.html"),
  output_dir = here::here("reports"),
  quiet = TRUE)

list.files(here::here("reports"))
