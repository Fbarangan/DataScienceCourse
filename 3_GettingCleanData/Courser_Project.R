library(plyr)
library(dplyr)

#--Start..Create and prepare folder where the data will reside------------------
# Make sure working directory is set to the correct  file path

getwd()

if (!file.exists("./dataRaw")) {
        dir.create("./dataRaw")
}

# File and file destination assignment Make sure to go back to that file/folder and unzip file. see ReadMe file for details.

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

destfile = "./dataRaw/activityRaw.zip"

# File download. Find this folder and unzip.
download.file(fileUrl, destfile)

##--End...Create and prepare folder where the data will reside------------------

#---Start...Read tables---------------------------------------------------------
# read tables
#     test folder ( test folder :  X-test,  y_test, subject_test ). Make sure to plug in correct path of the files

test <- read.table("./dataRaw/UCI_HAR_Dataset/test/X_test.txt")
testActivities <- read.table("./dataRaw/UCI_HAR_Dataset/test/y_test.txt")
testVolunteer <- read.table("./dataRaw/UCI_HAR_Dataset/test/subject_test.txt")

#    train folder ( test folder :  X-test,  y_test, subject_test ). Make sure to plug in correct path of the files. Don't forget the (.) period !!!

train <- read.table("./dataRaw/UCI_HAR_Dataset/train/X_train.txt")
trainActivities <- read.table("./dataRaw/UCI_HAR_Dataset/train/y_train.txt")
trainVolunteer <- read.table("./dataRaw/UCI_HAR_Dataset/train/subject_train.txt")

# read supporting labels folder ( features labels and activity labels)

featuresVariables <- read.table("./dataRaw/UCI_HAR_Dataset/features.txt")
activityNames <- read.table("./dataRaw/UCI_HAR_Dataset/activity_labels.txt")

#---End...Read tables-----------------------------------------------------------


#---Start...Read tables-----------------------------------------------------------

# Clean activityNames and label into activityCode and ActivityLabel
colnames(activityNames)[2] = "activityLabel"

#Isolate column -> ActivityLabel from the activityNames table. This will be coerced into a vector
activityLabel <- activityNames$activityLabel
# Clean activityLabel: removed "-", and to lower case
activityLabel <- tolower(activityLabel)
activityLabel <- gsub("\\_", " ", activityLabel)

# re-create column 1 and rename it into activityCode which will be used for later merge
activityCode <-  c(1:6)

# recreate activityNames by combining activityCode and ActivityLabel using cbind
activityNames <- cbind(activityCode, activityLabel)
activityNames <- data.frame(activityNames)


#---End...Cleaning activityName-------------------------------------------------

#---Start...Cleaning featuresVariable table-------------------------------------
# I might leave the "()" but may be cause issue later on sine it is standard notation in R
head(featuresVariables)
colnames(featuresVariables)[2] = "featureLabel"
#Isolate column -> ActivityLabel from the activityNames table. This will be coerced into a vector
featureLable <- featuresVariables$featureLabel
# Clean featureLabel: removed "()", and to lower case. will leave "-"
featureLable <- gsub("\\()", " ", featureLable)

# re-create column 1 and rename it into activityCode which will be used for later merge
featureCode <- c(1:561)

# recreate featureVariable by combining featureCode and featureLabel using cbind
featuresVariables <- cbind(featureCode, featureLable)
featuresVariables <- tbl_df(as.data.frame(featuresVariables))

#---End...Cleaning featuresVariable table---------------------------------------

#---Start...Clean test and train Activities tables------------------------------
head(testActivities)
colnames(testActivities)[1] = "activityCode"
testActivities <- tbl_df(as.data.frame(testActivities))

head(trainActivities)
colnames(trainActivities)[1] = "activityCode"
trainActivities <- tbl_df(as.data.frame(trainActivities))

#---End...Clean test and train Activities tables--------------------------------

#---Start...clean train and test Table------------------------------------------
colnames(testVolunteer)[1] = "testVolunteer"
testVolunteer <- tbl_df(as.data.frame(testVolunteer))

colnames(trainVolunteer)[1] = "trainVolunteer"
trainVolunteer <- tbl_df(as.data.frame(trainVolunteer))
#---End...clean train and test Table--------------------------------------------


#---Start...Changing variable names into meaning names--------------------------
names(test) <- featuresVariables$featureLable
names(train) <- featuresVariables$featureLable
#---End...Changing variable names into meaning names--------------------------

#---Start...Selecting columns names with mean and std Combine tables-------------
testcolumnSelection <- grep("mean|std", names(test))
#---End...Selecting columns names with mean and std Combine tables------------

#---Start...Merge test and train tables----------------------------------------
combineTesttrain <- rbind(test,train)

combine_testActivities_test_Volunteer <- data.frame(testActivities, testVolunteer)
colnames(combine_testActivities_test_Volunteer)[2]= "Volunteers"

combine_trainActivities_train_Volunteer <- data.frame(trainActivities, trainVolunteer)
colnames(combine_trainActivities_train_Volunteer)[2] = "Volunteers"

# combine above tables

combinedTable <- rbind(combine_testActivities_test_Volunteer, combine_trainActivities_train_Volunteer)


# combine activity label
 for (i in testcolumnSelection) {
         newtestTable <- cbind(newtestTable, combineTesttrain[i])

 }


newtestTable$activityCode <- mapvalues(newtestTable$activityCode,
                                       from = levels(factor(newtestTable$activityCode)),
                                       to= activityLabel)

#---End...of Merge test and train tables----------------------------------------


# New table caculating mean of each variable
TidyTtable <- aggregate(newtestTable, list(newtestTable$Volunteers,
                                           newtestTable$activityCode),
                                        mean)
# Clean and remove na
TidyTtable$Volunteers <- NULL
TidyTtable$activityCode <- NULL
View(TidyTtable)

# Rename column
colnames(TidyTtable)[1] = "Volunteer"
colnames(TidyTtable)[2] = "Activity"

##---End...--------------------------------------------------------------------
# Write table
write.table(file= "humanActivity.txt", x = TidyTtable, row.names = FALSE)
