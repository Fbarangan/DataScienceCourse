# Quiz 2
# data : https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg
install.packages("jpeg")

library(jpeg)

if(!file.exists("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes"))
{dir.create("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"

jpg <- download.file(fileUrl, destfile = "/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/jpg.jpg" , mode = "wb")

img <- readJPEG("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/jpg.jpg", native = TRUE)
quantile(img, probs = c(0.3,0.8))

