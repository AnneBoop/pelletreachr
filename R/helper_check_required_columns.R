helper_check_required_columns <- function(df, required_cols) {
  missing_cols <- setdiff(required_cols, colnames(df))
  if (length(missing_cols) > 0) {
    stop(paste("Dataframe mist de volgende vereiste kolommen:",
               paste(missing_cols, collapse = ", ")))
  }
  TRUE
}
