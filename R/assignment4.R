#' @title Test correlations
#' @description Test the correlations between the response variable and all the other explanatory variables provided.
#' @param data the dataset to test on
#' @param y the name of the quantitative response variable (str)
#' @param x a vector of names of quantitative explanatory variables. If not provided, then automatically use all the quantitative variables.
#' @param ... optional parameters passed to import functions
#' @export
#' @return
#' \describe{
#' \item{y}{The name of response variable}
#' \item{x}{A vector of names of explanatory variables}
#' \item{df}{A dataframe of correlations}
#' }
#' @examples
#' # x is missing
#' ryx(mtcars, 'mpg')
#'
#' # give x
#' ryx(mtcars, 'mpg', c('hp', 'wt'))
ryx <- function(data, y, x){
  if(missing(x)){
    x <- names(data)[sapply(data, class)=="numeric"]
    x <- setdiff(x, y)
  }
  df <- data.frame()
  for (var in x){
    res <- cor.test(data[[y]], data[[var]])
    df_temp <- data.frame(variable = var,
                          r = res$estimate,
                          p = res$p.value)
    df <- rbind(df, df_temp)
    df <- df[order(-abs(df$r)),]
  }

  df$sigif <- ifelse(df$p < .001, "***",
                     ifelse(df$p < .01, "**",
                            ifelse(df$p < .05, "*", " ")))
  results <- list(y=y, x=x, df=df)
  class(results) <- "ryx"
  return(results)
}
