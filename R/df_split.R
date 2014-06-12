#' Split large data.frame into a list of data.frames
#' 
#' This function splits an input data.frame into a list of data.frames such that each data.frame in the list has at most 
#' \code{nrows} rows.
#' @param df A data.frame object to split
#' @param nrows The number of rows each smaller data.frame should have. If the data.frame cannot be split evenly into that 
#' number of rows, the final data.frame in the list will be smaller than the others.
#' @return A list of data.frames
#' @details I usually use this to split data.frames with many rows into smaller ones which I can save with 
#' \code{\link{df_list2csv}}. This allows me to process each csv individually later to save memory.
#' @export
df_split <- function(df, nrows){
  df.split <- split(df, gl(n = ceiling(nrow(df)/nrows), k = nrows, length=nrow(df)))
  return(df.split)
}