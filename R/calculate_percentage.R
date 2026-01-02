#' Calculate Pellet Reaching Percentages
#'
#' This function calculates percentage-based performance metrics.
#' It assumes input data contains raw count columns.
#'
#' @param data A dataframe containing pellet reaching count data.
#'
#' @returns A dataframe with percentage columns added.
#' @export
#' @examples
#' # example code
#' df <- data.frame(
#'    "First trial success" = c(10, 12),
#'   "Total grasps" = c(20, 20),
#'   "Total success" = c(15, 18),
#'   "Total fail" = c(5, 2),
#'   "Total pellet to box" = c(14, 16),
#'   check.names = FALSE
#' )
#'
#' calculate_percentage(df)
calculate_percentage <- function(data) {

  if (!inherits(data, "data.frame")) {
    stop("Input must be a dataframe.")
  }

  required_cols <- c(
    "First trial success",
    "Total grasps",
    "Total success",
    "Total fail",
    "Total pellet to box"
  )

  helper_check_required_columns(data, required_cols)

  data$First_trial_success_pct <-
    (data$`First trial success` / data$`Total grasps`) * 100

  data$Total_success_pct <-
    (data$`Total success` / data$`Total grasps`) * 100

  data$Total_fail_pct <-
    (data$`Total fail` / data$`Total grasps`) * 100

  data$Total_pellet_to_box_pct <-
    (data$`Total pellet to box` / data$`Total grasps`) * 100

  return(data)
}
