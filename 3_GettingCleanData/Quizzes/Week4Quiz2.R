# Question 2
# Data  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
# Original data from  http://data.worldbank.org/data-catalog/GDP-ranking-table

library(dplyr)
library(stringr)

if(!file.exists("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes"))
{dir.create("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

GDPRaw <- download.file(fileUrl, destfile = "/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/GDPRaw.csv")

GDP <- read.csv("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/GDPRaw.csv", stringsAsFactors = FALSE, header = FALSE)

# data info
names(GDP)
colnames(GDP)[1] = "shortcode"
colnames(GDP)[5] = "millionsdollar"
GDP <- GDP[c(5:330), c(1,5)]

milliondollars <- gsub(",", "", GDP$millionsdollar)
milliondollars <- as.numeric(milliondollars)

# column combine
GDP <- cbind(GDP, milliondollars)
GDP <- tbl_df(GDP)
GDP <- select(GDP, shortcode, milliondollars)

#Clean Na
good <- complete.cases(GDP)

GDPClean <- GDP[good,]

GDPCleanFinal <- select(GDPClean, mean(milliondollars))

# Question 3
colnames(GDP)[4] = "country"
GDPCountryName <-   GDP$country
grep("^United", GDPCountryName)
