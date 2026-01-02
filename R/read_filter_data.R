#' Read and Filter Behavioral data from the Pellet Reaching Test
#'
#' Reads an excel file containing behavioral data and filters the dataset to
#' to include only rats with complete grasp data across all conditions.
#' The function also checks whether all required columns are present using the
#' 'helper_check_required_columns' function.
#'
#' @param file Path to the Excel file.
#' @param sheet Sheet name or index to read from.
#'
#' @returns A filtered dataframe containing only valid observations.
#' @export
#'
#' @examples
#' \dontrun{
#' df <- read_filter_data(
#'   file = "data/behavioral_data.xlsx",
#'   sheet = 1
#' )
#' }

read_filter_data <- function(file, sheet) {
 data <- readxl::read_excel(file, sheet = sheet)

  required_cols <- c(
    "First trial success",
    "Total grasps",
    "Total success",
    "Total fail",
    "Total pellet to box",
    "Rat_number",
    "Blinding_group"
  )

  # Check of alle vereiste kolommen aanwezig zijn
  helper_check_required_columns(data, required_cols)

  # Keep only rats with 20 grasps in all conditions
  data <- dplyr::ungroup(
    dplyr::filter(
      dplyr::group_by(data, Rat_number),
      all(`Total grasps` == 20)
    )
  )

  return(data)
}

