# Question 2
# Data  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
# Original data from  http://data.worldbank.org/data-catalog/GDP-ranking-table

if(!file.exists("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes"))
{dir.create("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

GDPRaw <- download.file(fileUrl, destfile = "/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/GDPRaw.csv")

GDP <- read.csv("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/GDPRaw.csv", stringsAsFactors = FALSE, header = FALSE)
