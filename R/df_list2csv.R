#' Save a list of data.frames as seperate csv's
#' 
#' This function takes a list of data.frames and saves them as numbered csv files. Often used in conjunction with
#' \code{\link{df_split}}.
#' @param df_list A list of data.frame objects
#' @param filename The base filename which forms the first part of the csv file's name, followed by the number of the list item
#' @param digits The number of digits to coerce the list item number to before appending to filename. The default is
#' the same number of digits in the length of the list. e.g. 999 items = 3 digits, giving 001, 002, ... 999. This keeps files 
#' sorted in the correct order.
#' @return The base filename for the csv files.
#' @export
df_list2csv <- function(df_list, filename, digits = nchar(as.character(length(df_list)))){
  for (i in 1:length(df_list)){
    fullpath<-paste(filename, "_", sprintf(paste("%0", digits ,"d", sep = ""), i),".csv",sep="")
    write.csv(df_list[[i]], fullpath, row.names=FALSE)
    print(paste("File number", i, "of", length(df_list), "saved."))
  }
  return(filename)
}