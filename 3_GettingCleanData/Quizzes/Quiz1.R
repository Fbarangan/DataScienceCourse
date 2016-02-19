# Question 1

library(dplyr)

if(file.exists("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes"))
  {dir.create("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes")}
  
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"  

# Note for MAc if the above file download extraction does not work remove the METHOD

download.file(fileUrl, destfile = "/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/acs.csv")
acsData <- read.csv("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/acs.csv")

head(acsData)
tail(acsData)
names(acsData)
dim(acsData)
summary(acsData)
