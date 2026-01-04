#' Save a ggplot object to PDF
#'
#' This function saves a ggplot object to a PDF file with customizable dimensions and resolution.
#'
#' @param plot_object A ggplot object
#' @param filename Name of the output file
#' @param width Width of the PDF in inches (default 14)
#' @param height Height of the PDF in inches (default 12)
#' @param dpi Resolution of the PDF in dots per inch (default 300)
#'
#' @returns Invisubly returns th filename of the saved PDF
#' @export
#'
#' @examples
#' #' \dontrun{
#' library(ggplot2)
#' p <- ggplot(mtcars, aes(mpg, wt)) + geom_point()
#' plot_to_pdf(p, "mtcars_plot.pdf")
#' }
#'
plot_to_pdf <- function(plot_object, filename, width = 14, height = 12, dpi = 300) {
  ggplot2::ggsave(filename, plot = plot_object, width = width, height = height, dpi = dpi)
}
