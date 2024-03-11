library(tidyverse)
library(openwashdata)
# import data -------------------------------------------------------------

data_in <- read_csv("data-raw/cw_Functionality_WP_data.csv")

rwpfunctionality <- data_in

rwpfunctionality |> names()


# export data -------------------------------------------------------------




## code to prepare `DATASET` dataset goes here

usethis::use_data(rwpfunctionality, overwrite = TRUE)
