#' Read from a file to a data.frame faster
#' 
#' A function to read in data from a file into a data.frame using \code{\link{scan}}, which should be much faster than
#' \code{\link{read.table}}. This is still not as fast as \code{\link{fread}} from \code{data.table}, but it outputs
#' a data.frame, so I use when I need a data.frame but the files are big!
#' @param path Path to file that you wish to read into a data.frame
#' @param sep Seperator character used in file. Default is "," for a .csv file
#' @param header Is there a header line in the file?
#' @return a data.frame with the file data
#' @export
fast_read <- function(path, sep = ",", header = TRUE) {

  if (header) skip<-1 else skip<-0
  ## Read in a single line of the file to get the variable types for the columns
  types <- read.table(path, nrows=2, sep=sep, stringsAsFactors=FALSE, header=header)[2,]
  ## convert integers to double
  types[,sapply(types[1,], is.integer)]<-as.double(types[,sapply(types[1,], is.integer)])
  types<-as.list(types)
  
  dat <- scan(path, what = types, sep=sep, skip = skip, quiet = TRUE) 
  attr(dat, "row.names") <- .set_row_names(length(dat[[1]]))
  class(dat) <- "data.frame"
  return(dat)
}