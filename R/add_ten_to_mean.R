#' Add Ten to Mean
#'
#' This function calculates the mean of a numeric vector and adds 10 to it.
#'
#' @param x A numeric vector.
#'
#' @return A numeric value that is the mean of `x` plus 10.
#' @export
#'
#' @examples
#' add_ten_to_mean(c(1, 2, 3, 4, 5))
add_ten_to_mean <- function(x) {
  if (!is.numeric(x)) {
    stop("Input must be a numeric vector")
  }
  mean(x) + 10
}
