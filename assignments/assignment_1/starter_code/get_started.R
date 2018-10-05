##########################################################################
# Preamble
##########################################################################

setwd("C:/YOUR_WORKING_DIRECTORY_PATH") # Set working directory
rm(list=ls()) # Empty workspace

##########################################################################
# Load packages
##########################################################################
library(tidyverse) # Collection of all the good stuff like dplyr, ggplot2 ect.
library(magrittr) # For extra-piping operators (eg. %<>%)
library(data.table) # Good format to work with large datasets
library(igraph) # Central graph library
library(tidygraph) # Incas you like the tidy way of graph analysis
library(ggraph) # For ggplot-like graph plotting


##########################################################################
# Load data
##########################################################################

el.advice <- fread("../data/Krack-High-Tec-edgelist-Advice.txt", data.table = FALSE)
el.friendship <- fread("../data/Krack-High-Tec-edgelist-Friendship.txt", data.table = FALSE)
el.reports <- fread("../data/Krack-High-Tec-edgelist-ReportsTo.txt", data.table = FALSE)
attributes <- fread("../data/Krack-High-Tec-Attributes.csv", data.table = FALSE)

##########################################################################
# Some cl
##########################################################################

colnames(el.advice) <- c('ego', 'alter', 'advice_tie')
colnames(el.friendship) <- c('ego', 'alter', 'friendship_tie')
colnames(el.reports) <- c('ego', 'alter', 'reports_tie')
colnames(attributes)<-tolower(colnames(attributes))

##########################################################################
# Inspect the data
##########################################################################

head(el.advice)
head(el.friendship)
head(el.reports)
head(attributes)

##########################################################################
# Create a graph object for the different networks
##########################################################################

g.reports <- graph_from_data_frame(d = el.reports %>% filter(reports_tie != 0) %>% select(ego, alter),
                                  vertices = attributes,
                                  directed = TRUE)

# Label the edgetype
E(g.reports)$type = "reports"

g.reports

#... go on for the other graphs

##########################################################################
# visualize (first simple shot)
##########################################################################

plot(g.reports, 
     vertex.color=V(g.reports)$dept, 
     vertex.label=NA)
# makes sense... an organigramm