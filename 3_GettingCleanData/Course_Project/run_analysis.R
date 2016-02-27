# Course_Project for "Getting and Cleaning Data

library(plyr)
library(dplyr)

#------------------------------------
# Create and prepare folder where the data will reside
# Make sure working directory is set to the correct  file path
getwd()
if (!file.exists("paste you PATH here"))
        {dir.create("paste you PATH here")}

# File assignment. Make sure to go back to that file/folder and unzip file. see ReadMe file for details.
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#------------------------------------

# ------------------------------------
# read tables 
#     test folder ( test folder :  X-test,  y_test, subject_test ). Make sure to plug in correct path of the files

test <- read.table("/paste you PATH here/test/X_test.txt")
testActivities <- read.table("/paste you PATH here/test/Y_test.txt")
testVolunteer <- read.table("/paste you PATH here/test/subject_test.txt")

#    train folder ( test folder :  X-test,  y_test, subject_test ). Make sure to plug in correct path of the files
training <- read.table("/paste you PATH here/train/X_train.txt")
trainingActivities <- read.table("/paste you PATH here/train/Y_train.txt")
trainingVolunteer <- read.table("/paste you PATH here/train/subject_train.txt")

# read supporting labels folder ( features and activity)
featuresVariables <- read.table("/paste you PATH here/features.txt")
activityNames <- read.table(""/paste you PATH here/activity_labels.txt")
# ------------------------------------

#------------------------------------
# Cleaning and preparing feature and activityNames table

#    Cleaning the  "feature table and removing excessive "()" using gsub replacing it with empty space just on column V2
#     Will leave the rest of the naming convention for the features.
featuresVariable <- gsub("\\()", "", featuresVariable$V2)

#     Cleaning the activityNames table: changing into lowercase, removal of "_"
activityNames <- sub("_", " ", activityNames$V2)
activityNames <- tolower(activityNames$V2)

# Coerce and convert activity name back into a data frame which will be use to merge with the test/train data labeling
# add it back into a data fram
ActivityCode <- c(1:6)
activityNames <- cbind(ActivityCode, activityNames)
activityNames <- as.data.frame(activityNames)

# Convert the variable name of the test and training data into a meaningful names
# Will relace it from the features name which both equal to 561 variables.
names(test) <- features
names(training) <- features

# rename V1 of table's test and training to "ActivityCode" before merging with ActivityNames Table to change
# ActtivityCode into meaning naming conventon (e.g. walking,etc)
colnames(trainingActivities)[1] = "ActivityCode"
colnames(testActivities)[1] = "ActivityCode"

# combine all the rows of the two tables, test and training using rbind
testtrain <- rbind(test,training)

# merge testtrain and 




       


