library(tidyverse)
library(openwashdata)
# import data -------------------------------------------------------------

data_in <- read_csv("data-raw/cw_Functionality_WP_data.csv") |>

data_out <- data_in



# export data -------------------------------------------------------------




## code to prepare `DATASET` dataset goes here

usethis::use_data(data_out, overwrite = TRUE)
