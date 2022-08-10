fit_model <- function(clean_data) {
  lm(ozone ~ temp, clean_data) %>%
    coefficients()
}
