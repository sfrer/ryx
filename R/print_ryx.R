#' @title Print \code{ryx} object
#' @description Print the correlations of the given response and explanatory variables.
#' @param x A \code{ryx} object
#' @param digits (optional) Number of significant digits to use for percentages.
#' @param ... Optional parameters passed to import functions
#' @return NULL
#' @export
#' @examples
#' x=ryx(mtcars, 'mpg', c('wt', 'hp'))
#' print(x, digits=4)
print.ryx=function(x, digits=3, ...){
  #Error message
  if (!inherits(x, "ryx")){
    stop("X must be class ryx.")
  }
  #Print the title
  cat(paste("Correlations of", x$y, "with\n"))
  print(x$df, row.names = FALSE, digits = digits)
}
