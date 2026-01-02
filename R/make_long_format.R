#' Convert Pellet Reaching Data to Long Format
#'
#' @param data A dataframe with percentage columns.
#'
#' @returns A long-format dataframe for plotting
#' @export
#'
#' @examples
#' \dontrun{
#' df <- data.frame(
#'   Rat_number = c(1,2),
#'   Blinding_group = c("A","B"),
#'   First_trial_success_pct_Baseline = c(50, 60),
#'   First_trial_success_pct_Post = c(70, 80),
#'   Total_success_pct_Baseline = c(60, 65),
#'   Total_success_pct_Post = c(75, 85),
#'   Total_fail_pct_Baseline = c(10, 5),
#'   Total_fail_pct_Post = c(5, 2),
#'   Total_pellet_to_box_pct_Baseline = c(55, 60),
#'   Total_pellet_to_box_pct_Post = c(80, 90)
#' )
#'
#' df_long <- make_long_format(df)
#' head(df_long)
#' }

make_long_format <- function(data) {

  if (!inherits(data, "data.frame")) {
    stop("Input must be a dataframe.")
  }
  required_cols <- c(
    "Rat_number",
    "Blinding_group",
    "Stroke_status",
    "First_trial_success_pct",
    "Total_success_pct",
    "Total_fail_pct",
    "Total_pellet_to_box_pct"
  )

  helper_check_required_columns(data, required_cols)

  data_long <- tidyr::pivot_longer(
    data,
    cols = c(
      First_trial_success_pct,
      Total_success_pct,
      Total_fail_pct,
      Total_pellet_to_box_pct
    ),
    names_to = "Variable",
    values_to = "Score"
  )

  data_long$Time <- ifelse(
    data_long$Stroke_status == "Baseline",
    "Baseline",
    "Post corticale laesie"
  )

  return(data_long)
}
