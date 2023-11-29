#' @title Summary \code{ryx} object
#' @description Summary the correlations of the given response and explanatory variables.
#' @param x A \code{ryx} object
#' @param digits (optional) Number of significant digits to use for percentages.
#' @param ... Optional parameters passed to import functions
#' @return NULL
#' @export
#' @examples
#' x=ryx(mtcars, 'mpg', c('wt', 'hp'))
#' summary(x, digits=4)
summary.ryx=function(x, digits=3, ...){
  #Error message
  if (!inherits(x, "ryx")){
    stop("X must be class ryx.")
  }
  #First line
  cat(paste0("Correlating ", x$y," with ", paste(x$df$variable, collapse=" "), ".\n"))
  #Second line; problem: median does not match
  cat(paste0("The median absolute correlation was ", round(abs(median(x$df$r)), digits),
             " with a range from ",round(min(x$df$r), digits)," to ", round(max(x$df$r),digits), ".\n"))
  #Third line
  cat(paste(length(x$df$p[x$df$p<0.05]), "out of", nrow(x$df),
            "variables where significant at the p < 0.05 level.\n"))
}
