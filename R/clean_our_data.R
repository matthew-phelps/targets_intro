clean_our_data <- function(our_data_raw) {
  x <- as.data.table(our_data_raw)
  clean_data_helper_function(x = 1)
  # Data cleaning
  x[!is.na(Ozone)]

  janitor::clean_names(x)
}


clean_data_helper_function <- function(x) {
  x + 1
}
