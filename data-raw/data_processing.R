
# Description -------------------------------------------------------------

# R script to process uploaded raw data into a tidy, analysis-ready data frame

# Load packages -----------------------------------------------------------

library(tidyverse)
library(openwashdata)

# Read data -------------------------------------------------------------

rwpfunctionality <- read_csv("data-raw/cw_Functionality_WP_data.csv") |>
  as_tibble()

# Tidy data ---------------------------------------------------------------




# Write data -------------------------------------------------------------

usethis::use_data(rwpfunctionality, overwrite = TRUE)

fs::dir_create(here::here("inst", "extdata"))

write_csv(rwpfunctionality, here::here("inst", "extdata", "rwpfunctionality.csv"))

openxlsx::write.xlsx(rwpfunctionality, here::here("inst", "extdata", "rwpfunctionality.xlsx"))

