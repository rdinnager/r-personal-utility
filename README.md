r-personal-utility
==================

Utility functions I use frequently in R. 

list\_to\_df: A function to convert a list to a tbl_df object from the `dplyr` package. It was written by Hadley Wickham as a comment on [this gist](https://gist.github.com/aammd/9ae2f5cce9afd799bafb).

fast\_read: A function to read in data to a data.frame faster using `scan` instead of read.table. Not as fast as `data.table`'s `fread` but it returns a data.frame, which is usually what I want.

csv\_cat: A function to concatenate all csv files in a directory using unix commands (much faster than R).

df\_split: A function to split data.frames into a list of smaller data.frames.

df\_list2csv: A function to take a list of data.frames and save them to individual sequentially numbered csv files.

More functions will be added as I need them.

Installation:  

```
require(devtools)  
install_github("r-personal-utility", "rdinnager")  
```
