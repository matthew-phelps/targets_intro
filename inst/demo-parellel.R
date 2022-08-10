# This script demos using parellel processes in targets without branching. It
# also demos the use of the shiny app to monitor progress of long running
# chains.
tar_dir({
  tar_script({
    sleep_run <- function(..., t = 60) {
      Sys.sleep(t)
    }
    library(targets)
    library(future.callr)
    future::plan(callr)
    list(
      tar_target(settings, sleep_run(t = 1)),
      tar_target(data1, sleep_run(settings, t = 1)),
      tar_target(data2, sleep_run(settings, t = 999)),
      tar_target(data3, sleep_run(settings, t = 30)),
      tar_target(model1, sleep_run(data1, t = 2)),
      tar_target(model2, sleep_run(data2)),
      tar_target(model3, sleep_run(data3, t = 999)),
      tar_target(figure1, sleep_run(model1)),
      tar_target(figure2, sleep_run(model2)),
      tar_target(figure3, sleep_run(model3)),
      tar_target(conclusions, sleep_run(c(
        figure1, figure2, figure3
      )))
    )
  })

  # Launch the app in a background process.
  # You may need to refresh the browser if the app is slow to start.
  # The graph automatically refreshes every 10 seconds
  tar_watch(
    seconds = 60,
    display = "graph",
    outdated = FALSE,
    targets_only = TRUE
  )

  # Now run the pipeline and watch the graph change.
  px <- tar_make_future(workers = 3)
})
