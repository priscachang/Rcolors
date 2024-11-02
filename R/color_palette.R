#' Generate and Customize a Color Palette for Graphing
#'
#' Provides a curated selection of beautiful color palettes with simplified color names,
#' optional brightness adjustment, and preview options.
#'
#' @param n Number of colors to generate (default is 3).
#' @param color_name Easy name for color, e.g., "blue", "purple" (default is "set3").
#' @param preview_shape Shape of preview: "bar", "circle" (default is "bar").
#'
#' @return A vector of customized color codes.
#' @export
#' @examples
#' color_palette(5, color_name = "blue", preview_shape = "circle")
color_palette <- function(n = 3, color_name = "set3", preview_shape = "bar") {
  library("RColorBrewer")

  if (n <= 0) {
    stop("Invalid color number. Please try again.")
  }

  if (preview_shape != "bar" && preview_shape != "circle") {
    stop("Invalid preview shape. Please use bar or circle.")
  }

  # Define a lookup list for easy color names
  color_map <- list(
    blue = "Blues",
    light_blue = "PuBu",
    dark_blue = "PuBuGn",
    purple = "Purples",
    lavender = "PuRd",
    violet = "BuPu",
    green = "Greens",
    teal = "GnBu",
    mint = "BuGn",
    red = "Reds",
    pink = "RdPu",
    light_pink = "OrRd",
    coral = "YlOrRd",
    orange = "Oranges",
    yellow = "YlGnBu",
    mustard = "YlOrBr",
    brown = "BrBG",
    beige = "PiYG",
    gray = "Greys",
    dark_gray = "PRGn",
    light_gray = "PuOr",
    diverging = "Spectral",
    qualitative = "Set3",
    sequential = "BuGn",
    rainbow = "RdYlBu",
    autumn = "OrRd",
    sunset = "YlOrRd",
    ocean = "PuBuGn",
    forest = "YlGn",
    fire = "YlOrRd",
    sky = "Blues",
    earth = "BrBG",
    sand = "YlOrBr",
    turquoise = "PuBuGn",
    aqua = "BuGn",
    seafoam = "GnBu",
    gold = "YlOrBr",
    bronze = "OrRd",
    olive = "YlGn",
    slate = "Greys",
    navy = "Blues",
    magenta = "RdPu",
    peach = "YlOrRd",
    mint_green = "BuGn",
    desert = "YlOrBr",
    frost = "Blues",
    spring = "YlGn",
    autumn_forest = "OrRd",
    pastel = "Pastel1",
    retro = "Paired",
    columbia = "Columbia"
  )

  # Map easy name to the corresponding RColorBrewer palette name
  palette_name <- color_map[[color_name]]

  # Validate palette name
  if (is.null(palette_name) || (!palette_name %in% rownames(brewer.pal.info) && palette_name != "Columbia")) {
    stop("Invalid color name. Please use one of the following: ", paste(names(color_map), collapse = ", "))
  }

  # Ensure n is within palette's max colors
  if (palette_name == "Columbia"){
    max_colors <- 7
  }else {
    max_colors <- brewer.pal.info[palette_name, "maxcolors"]
  }

  if (n > max_colors) {
    stop(paste("Palette", palette_name, "supports up to", max_colors, "colors."))
  }

  # Generate color palette
  if (palette_name == "Columbia"){
    colors <- c("#FFFFFF", "#D4285B", "#259B9A", "#7B2A8D", "#6CACE4", "#009EFF", "#012169")
  }else{
    colors <- brewer.pal(n = n, name = palette_name)
  }

  # Preview color palette
  if (preview_shape == "bar") {
    barplot(rep(1, n), col = colors, border = NA,
            main = paste("Preview of", color_name, "palette with", n, "colors"))
  } else if (preview_shape == "circle") {
    plot(1:n, rep(1, n), pch = 21, cex = 3, bg = colors,
         xlim = c(0.5, n + 0.5), axes = FALSE, xlab = "", ylab = "", main = paste("Preview:", color_name))
  }

  return(colors)
}
