plot_model <- function(model_fit, clean_data) {
  plot_helper_function(x=1)
  ggplot(clean_data) +
    geom_point(aes(x = temp, y = ozone)) +
    geom_abline(intercept = model_fit[1], slope = model_fit[2])
}


plot_helper_function <- function(x) {
x
}
