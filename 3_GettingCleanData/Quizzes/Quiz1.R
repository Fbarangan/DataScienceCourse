# Question 1

library(dplyr)

# Creat directory

if(file.exists("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes"))
  {dir.create("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

# Note for MAc if the above file download extraction does not work remove the METHOD

# Download and read file to your local machine
download.file(fileUrl, destfile = "/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/acs.csv")
acsData <- read.csv("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/acs.csv")

# Check info

head(acsData)
tail(acsData)
names(acsData)
dim(acsData)
summary(acsData)

# Select colum using dply select function
agricultureLogical <- select(acsData, ACR, AGS)

# Convert to data frame,
agricultureLogicalDataFrame <- as.data.frame(agricultureLogical)

# use which function (e.g. X [which(X$var2),]
# Don't forget to plave the comma to indicate that you are pulling a row

agricultureLogical <- agricultureLogicalDataFrame[which((agricultureLogicalDataFrame$ACR == 3 & agricultureLogicalDataFrame$AGS == 6)), ]

head(agricultureLogical)



