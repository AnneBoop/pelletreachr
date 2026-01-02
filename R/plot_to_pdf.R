plot_to_pdf <- function(plot_object, filename, width = 14, height = 12, dpi = 300) {
  ggplot2::ggsave(filename, plot = plot_object, width = width, height = height, dpi = dpi)
}
