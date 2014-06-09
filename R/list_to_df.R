#' Turn a list into a dplyr 'column-list'
#' 
#' A function to turn a list into a \code{dplyr} 'column-list' which will allow it to be manipulated using \code{dplyr} 
#' functions, particularly \code{\link[dplyr]{summarise}} and \code{\link[dplyr]{do}}.
#' @param listfordf A list of R objects which you wish to convert for use in \code{dplyr}. Can be named or unnamed.
#' @return a \code{dplyr} \code{\link[dplyr]{tbl_df}} object 
#' @details The idea for this function came from Andrew Macdonald, and was written by Hadley Wickham as a comment on \url{https://gist.github.com/aammd/9ae2f5cce9afd799bafb}
#' @export
list_to_df <- function(listfordf){
  if(!is.list(listfordf)) stop("it should be a list")
  
  df <- list(list.element = listfordf)
  class(df) <- c("tbl_df", "data.frame")
  attr(df, "row.names") <- .set_row_names(length(listfordf))
  
  if (!is.null(names(listfordf))) {
    df$name <- names(listfordf)
  }
  
  df
}
