fit_model_group <- function(data_grouped) {
  setDT(data_grouped)
  lm(y ~ x, data_grouped) %>%
    coefficients()

}
