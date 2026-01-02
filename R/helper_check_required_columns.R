#' Check Required Columns in a Dataframe
#'
#'This helper function checks whether a dataframe contains all required columns.
#' If any columns are missing, the function stops and returns an error message.
#'
#' @param df A dataframe to check.
#' @param required_cols A character vector of column names that must be present in df.
#'
#' @returns Returns TRUE if all required columns are present. Stops with an error otherwise, and gives the missing columns.
#' @export
#'
#' @examples
#' df <- data.frame(a = 1:3, b = 4:6)
#' required_cols <- c("a", "b")
#' helper_check_required_columns(df, required_cols)
#'
#' # This will produce an error because column "c" is missing:
#' \dontrun{
#' helper_check_required_columns(df, c("a", "b", "c"))
#' }
#'
helper_check_required_columns <- function(filtered_data, required_cols) {
  missing_cols <- setdiff(required_cols, colnames(filtered_data))
  if (length(missing_cols) > 0) {
    stop(paste("Dataframe is missing the following required columns:",
               paste(missing_cols, collapse = ", ")))
  }
  TRUE
}
