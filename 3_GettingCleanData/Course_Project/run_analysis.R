# Course_Project for "Getting and Cleaning Data

library(plyr)
library(dplyr)

# Create folder where the data will reside
# Make sure working directory is set to the correct  file path
if (!file.exists("paste you PATH here"))
        {dir.create("paste you PATH here")}

# File assignment. Mke sure to back to that file/folder and unzip file. see ReadMe file for details.
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# read tables 
#     test folder ( test folder :  X-test,  y_test, subject_test ). Make sure to plug in correct path of the files

test <- read.table("/paste you PATH here/test/X_test.txt")
test <- read.table("/paste you PATH here/test/Y_test.txt")
testSubject <- read.table("/paste you PATH here/test/subject_test.txt")

# read train folder
#    train folder ( test folder :  X-test,  y_test, subject_test ). Make sure to plug in correct path of the files
training <- read.table("/paste you PATH here/train/X_train.txt")
trainingLabel <- read.table("/paste you PATH here/train/Y_train.txt")
trainingSubject <- read.table("/paste you PATH here/train/subject_train.txt")

# read supporting labels folder ( features and activity)
features <- read.table("/paste you PATH here/features.txt")
activityLabel <- read.table(""/paste you PATH here/activity_labels.txt")


       


