
# Description -------------------------------------------------------------

# R script to process uploaded raw data into a tidy, analysis-ready data frame

# Load packages -----------------------------------------------------------

library(tidyverse)
library(openwashdata)
library(readxl)
library(janitor)
library(dplyr)

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
  left_join(data_non_numeric, by = "id") |>
  select(-org)

# change date format

rwpfunctionality$subdate_wp <- format(as.Date(rwpfunctionality$subdate_wp,
                                              format = "%m/%d/%Y"),
                                      "%Y-%m-%d")

# Adjust functional3, wc_admin_index_wp, wc_finance_index_wp,
# wc_maint_index_wp and wc_mgmt_index_wp

data_adjusted_1 <- rwpfunctionality %>%
  mutate(functional3 = case_when(
    functional3 == "Fully functional: water is available, sufficient quantity is available - 20L in 5 minutes - and no downtime reported in prior 2 weeks" ~ "Functional",
    functional3 == "Not functional (no water available today OR (water available, but insufficient quantity AND downtime reported in prior 2 weeks))" ~ "Abandoned or not functional",
    functional3 == "Abandoned (no water available >1 year)" ~ "Abandoned or not functional",
    .default = "Partially functional")
  )

rwpfunctionality <- data_adjusted_1

data_adjusted_2 <- rwpfunctionality |>
  mutate(wc_admin_index_wp = case_when(
    wc_admin_index_wp == "Inadequate - WC hasn't met in >6 months" ~ "Inadequate",
    wc_admin_index_wp == "Minimum - WC has reported to have met within 6 months" ~ "Minimum",
    wc_admin_index_wp == "Moderate -  WC has reported to have met within 6 months, and has at least 1/3 female members"
      ~ "Moderate",
    wc_admin_index_wp == "Advanced -  WC has reported to have met within 6 months, has at least 1/3 female members, AND has record of a meeting within previous 6 months"
     ~ "Advanced"))

rwpfunctionality <- data_adjusted_2

data_adjusted_3 <- rwpfunctionality |>
  mutate(wc_finance_index_wp = case_when(
    wc_finance_index_wp == "Inadequate -  WC does not collect fees" ~ "Inadequate",
    wc_finance_index_wp == "Minimum - WC reports a fee collection system" ~ "Minimum",
    wc_finance_index_wp == "Moderate -  WC reports collecting fees and reports having savings"
    ~ "Moderate",
    wc_finance_index_wp == "Advanced -  WC reports collecting fees and reports having savings, can demonstrate a fee collection or balance, and reports that money is kept in a cash box, bank account, mobile money, or borehole banking"
    ~ "Advanced"))

rwpfunctionality <- data_adjusted_3

data_adjusted_4 <- rwpfunctionality |>
  mutate(wc_maint_index_wp = case_when(
    wc_maint_index_wp == "Inadequate - WC cannot identify a person for water point maintenance" ~ "Inadequate",
    wc_maint_index_wp == "Minimum - WC cannot identify a person for water point maintenance" ~ "Minimum",
    wc_maint_index_wp == "Moderate - WC can identify a repair person and that person has had training. Plus, the community has access to tools and spare parts"
    ~ "Moderate",
    wc_maint_index_wp == "Advanced - WC can identify a repair person and that person has had training. Plus, the community has access to tools and spare parts AND reported that someone has performed preventive maintenence within the past year"
    ~ "Advanced"))

rwpfunctionality <- data_adjusted_4

data_adjusted_5 <- rwpfunctionality |>
  mutate(wc_mgmt_index_wp = case_when(
    wc_mgmt_index_wp == "Inadequate - WC is inadequate in any of the above indices" ~ "Inadequate",
    wc_mgmt_index_wp == "Minimum - WC meets minimum level in all above indices [\"Operational\" Committee]" ~ "Minimum",
    wc_mgmt_index_wp == "Moderate -  WC meets moderate level in all above indices"
    ~ "Moderate",
    wc_mgmt_index_wp == "Advanced -  WC meets moderate level in all above indices AND advanced level in at least one of the above"
    ~ "Advanced"))

rwpfunctionality <- data_adjusted_5

# Write data -------------------------------------------------------------

usethis::use_data(rwpfunctionality, overwrite = TRUE)

fs::dir_create(here::here("inst", "extdata"))

write_csv(rwpfunctionality, here::here("inst", "extdata", "rwpfunctionality.csv"))

openxlsx::write.xlsx(rwpfunctionality, here::here("inst", "extdata", "rwpfunctionality.xlsx"))

