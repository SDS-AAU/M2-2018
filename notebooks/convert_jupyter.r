###########################################################
# Rmd to jupyter converter
###########################################################
# Note: This script is only a convenience function to convert .rmd's to jupyter. Check the details here:
# https://github.com/lecy/RMD-to-Jupyter/blob/master/README.md 

### Set WD automatically
require(rstudioapi); setwd(dirname(rstudioapi::getActiveDocumentContext()$path)); getwd()

### Define the function
library(tools)
rmd2jupyter <- function( filename, path=getwd() ) 
{
  path_in <- paste( path, "/", filename, " ", sep="" )
  path_out <- paste(path, "/", file_path_sans_ext(filename), ".ipynb", sep="")
  full_shell <- paste("notedown ", path_in, " --rmagic --run > ", path_out, sep="")
  shell(full_shell)
}

### Select the right filename
dir()

### Convert to jupyter
rmd2jupyter( "M2_1_network_analysis_intro.Rmd" )


notedown Desktop/x.Rmd  --rmagic --run > Desktop/x.ipynb
