#' Concatenate all csv files in a directory into one csv file
#' 
#' This function uses unix commands to concatenate csv files in a directory into one csv file. Only works if all csv files have
#' the same columns. All headers except for those in the first file will be stripped
#' @param dir Name of directory to look for csv files
#' @param outfile Filename for concatenated csv file
#' @return A character vector of length one containing the path of the concatenated file
#' @details I often produce many csv files from large R analyses as a method for dealing with limited physical memory. e.g.
#' I output the results of each chunk of an analysis as a csv file, then remove the objects from memory, freeing it for 
#' subsequent analysis. I use this to put these csv files back into one csv. Using unix commands is way faster than R for this.
#' @export
csv_cat <- function(dir, outfile) {
  newfile <- paste(dir,"/",outfile,".csv")
  system(paste("awk 'FNR==1 && NR!=1{next;}{print}' ", dir, "/*.csv > ", newfile))
  return(newfile)
}