branching_pipe <- function() {
  list(
    tar_group_by(data_grouped, get_grouped_data(n = 1e2), group_id),

    tar_target(
      model_fit_group,
      fit_model(data_grouped),
      pattern = map(data_grouped)
    ),

    tar_target(
      model_plot_group,
      plot_model(model_fit_group, data_grouped),
      pattern = map(model_fit_group),iteration = "list"

    )
  )
}
