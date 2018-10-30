# Render Markdown ---------------------------------------------------------
# Stand Alone Script to render markdown files in '/markdown' folder

if (!require(here)) install.packages("here")
library(here)
library(rmarkdown)

rmarkdown::render(
  input = here("markdown", "eda_report.Rmd"),
  output_file = paste0("kivu-ebola-conflict.html"),
  output_dir = here("reports"),
  quiet = TRUE)

list.files(here("reports"))
