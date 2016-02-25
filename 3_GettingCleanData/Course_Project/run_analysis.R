# Course_Project for "Getting and Cleaning Data

library(plyr)
library(dplyr)

# Create folder where the data will reside
# Make sure working directory is set to the correct path
if (!file.exists("paste you PATH here"))
        {dir.create("paste you PATH here")}

# File assignment
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"


