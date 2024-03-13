
# Description -------------------------------------------------------------

# R script to process uploaded raw data into a tidy, analysis-ready data frame

# Load packages -----------------------------------------------------------

library(tidyverse)
library(openwashdata)
library(readxl)
library(janitor)

# Read data -------------------------------------------------------------

data_in <- read_csv("data-raw/cw_Functionality_WP_data.csv") |>
  as_tibble()

codebook <- read_excel("data-raw/cw_Functionality_codebook.xlsx") |>
  clean_names()

# Tidy data ---------------------------------------------------------------

## codebook -----------------------------------------------------------

## write a codebook to join to dataframe so that variables can be recoded from
## numbers to text

codebook_join <- codebook |>
  select(variable_name, codes, code_description) |>
  filter(code_description != "-") |>
  fill(variable_name) |>
  mutate(codes = as.double(codes))


## input data -----------------------------------------------------------------



# select numeric / non-numeric columns
# https://www.perplexity.ai/search/In-R-use-KvQARK3FRviNDvlGqdqP9w

data_non_numeric <- data_in |>
  mutate(id = row_number()) |>
  select(id, where(~ !is.numeric(.)))

# join codebook to numeric variables for recoding

data_numeric_recoded <- data_in |>
  mutate(id = row_number()) |>
  relocate(id) |>
  select(where(is.numeric)) |>
  pivot_longer(cols = -id, names_to = "variable_name", values_to = "codes") |>
  left_join(codebook_join) |>
  mutate(codes = as.character(codes)) |>
  mutate(code_description = case_when(
    is.na(code_description) ~ codes,
    .default = code_description)
  ) |>
  select(-codes) |>
  pivot_wider(names_from = variable_name, values_from = code_description)

# coerce character columns that could be numeric to numeric columns

data_numeric <- data_numeric_recoded  |>
  map_lgl(~ all(varhandle::check.numeric(.)))

data_numeric_colnames <- names(data_numeric)[data_numeric]

data_numeric_recoded_final <- data_numeric_recoded  |>
  mutate(across(all_of(data_numeric_colnames), as.numeric))

# join non-numeric and recoded data

rwpfunctionality <- data_numeric_recoded_final |>
  left_join(data_non_numeric, by = "id")


# Write data -------------------------------------------------------------

usethis::use_data(rwpfunctionality, overwrite = TRUE)

fs::dir_create(here::here("inst", "extdata"))

write_csv(rwpfunctionality, here::here("inst", "extdata", "rwpfunctionality.csv"))

openxlsx::write.xlsx(rwpfunctionality, here::here("inst", "extdata", "rwpfunctionality.xlsx"))

