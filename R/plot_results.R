#' Plot Pellet Reaching Results
#'
#' @param data_long Long-format dataframe from `make_long_format()`.
#' @param sig_labels A dataframe with p-values and significance labels.
#'
#' @returns A combined ggplot object.
#' @export

plot_results <- function(data) {

  required_cols <- c(
    "Blinding_group",
    "Variable",
    "Time",
    "Score"
  )

  helper_check_required_columns(data, required_cols)

  ggplot2::ggplot(
    data,
    ggplot2::aes(
      x = Time,
      y = Score,
      fill = Blinding_group
    )
  ) +
    ggplot2::geom_boxplot() +
    ggplot2::facet_wrap(~ Variable, scales = "free_y") +
    ggplot2::theme_bw()
}
