## Load your packages, e.g. library(targets).
source("./packages.R")

## Load your R files
lapply(list.files("./R", full.names = TRUE), source)

# Put the plan here, inside tar_plan():
tar_plan(
  tar_target(our_data_raw, get_our_data()),
  tar_target(clean_data, clean_our_data(our_data_raw)),
  tar_target(model_fit, fit_model(clean_data)),
  tar_target(model_plot, plot_model(model_fit, clean_data))
)
