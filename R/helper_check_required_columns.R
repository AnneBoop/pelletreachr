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
#'  df <- data.frame(a = 1, b = 2)
#' helper_check_required_columns(df, c("a", "b")) # returns TRUE
#' \dontrun{
#' helper_check_required_columns(df, c("a", "c")) # would throw an error
#' }
helper_check_required_columns <- function(df, required_cols) {
  missing_cols <- setdiff(required_cols, colnames(df))
  if (length(missing_cols) > 0) {
    stop(paste("Dataframe is missing the following required columns:",
               paste(missing_cols, collapse = ", ")))
  }
  TRUE
}
