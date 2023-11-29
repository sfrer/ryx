#' @title Visualize \code{ryx} object
#' @description Visualize the correlations of the given response and explanatory variables.
#' @param x A \code{ryx} object
#' @param ... Optional parameters passed to import functions
#' @return NULL
#' @import ggplot2
#' @export
#' @examples
#' x=ryx(mtcars, 'mpg', c('wt', 'hp'))
#' plot(x)

plot.ryx=function(x, ...){
  #Error message
  if (!inherits(x, "ryx")){
    stop("X must be class ryx.")
  }
  require(ggplot2)
  x$df$color=ifelse(x$df$r>0, "positive", "negative")
  ggplot(data=x$df, aes(x=reorder(variable, abs(r)), y=abs(r), color=color))+
    geom_point(size=2)+
    geom_segment(aes(y=0, yend=abs(r),
                     x=reorder(variable, abs(r)), xend=reorder(variable, abs(r))),
                 color="gray")+
    scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1))+
    labs(x="Variables", y="Correlation (absolute value)",
         title=paste("Correlations with", x$y),
         color="Direction")+
    scale_color_manual(values = c("red", "blue"))+
    theme(panel.background = element_rect(fill = "white"),
          panel.grid.minor.x = element_line(linetype = "dashed", color="gray"),
          panel.border = element_rect(color = "black", fill = NA),
          legend.key = element_rect(fill = "white"))+
    coord_flip()
}

