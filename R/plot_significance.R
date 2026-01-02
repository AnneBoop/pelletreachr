#' Plot Pellet Reaching Variables with Significance
#'
#' Creates line plots per variable with individual rats, group averages, and significance labels.
#'
#' @param data_long A long-format dataframe with columns:
#'   Rat_number, Gender, Variable, Time, Score
#' @param sig_labels A dataframe with columns: Variabele, p_waarde, label
#' @param y_limits Numeric vector of length 2, y-axis limits
#' @param extra_space Numeric, vertical space for significance label
#'
#' @returns A combined ggplot object (patchwork)
#' @export
#'
#' @examples
#' \dontrun{
#' plot_results(df_long, sig_labels2)
#' }
#'
#'
plot_significance<- function(data_long) {

  # Check input
  required_cols <- c("Rat_number", "Gender", "Variable", "Time", "Score")
  helper_check_required_columns(data_long, required_cols)

  variables <- unique(data_long$Variable)
  plots_list <- list()

  for (var_name in variables) {
    df_plot <- data_long[data_long$Variable == var_name, ]

    title_map <- c(
      "First_trial_success_pct"   = "Eerste poging geslaagd (%)",
      "Total_success_pct"         = "Totaal geslaagd (%)",
      "Total_fail_pct"            = "Totaal mislukt (%)",
      "Total_pellet_to_box_pct"   = "Pellets naar box (%)"
    )

    n_rats <- length(unique(df_plot$Rat_number))

    y_limits <- c(0, 110)

    p <- ggplot2::ggplot(df_plot, ggplot2::aes(x = Time, y = Score, group = Rat_number)) +
      ggplot2::geom_line(ggplot2::aes(color = factor(Rat_number),
                                      linetype = Gender),
                         size = 1, alpha = 0.8) +
      ggplot2::geom_point(ggplot2::aes(color = factor(Rat_number),
                                       shape = Rat_number),
                          size = 2) +
      ggplot2::stat_summary(ggplot2::aes(group = Gender),
                            fun = mean, geom = "line",
                            color = "black", size = 1.5) +
      ggplot2::scale_color_viridis_d(option = "D", begin = 0, end = 0.9, name = "Rat nummer") +
      ggplot2::scale_shape_manual(values = 0:(n_rats-1)) +
      ggplot2::scale_linetype_manual(values = c("M" = "solid", "F" = "dashed")) +
      ggplot2::labs(
        title = title_map[var_name],
        y = "Percentage (%)",
        x = NULL,
        color = "Rat nummer",
        shape = "Rat nummer",
        linetype = "Geslacht"
      ) +
      ggplot2::scale_y_continuous(limits = y_limits) +
      ggplot2::theme_minimal(base_size = 14) +
      ggplot2::theme(
        plot.title = ggplot2::element_text(hjust = 0.5, size = 16),
        legend.position = "bottom"
      )

    plots_list[[var_name]] <- p
  }

  # Combine plots in 2 columns using patchwork
  final_plot <- patchwork::wrap_plots(plots_list, ncol = 2)
  return(final_plot)
}
