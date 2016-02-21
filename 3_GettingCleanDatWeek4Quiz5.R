# I


install.packages("quantmod")
library(quantmod)
getwd()

amzn <- getSymbols("AMZN", auto.assign = FALSE)
str(sampleTimes)
head(sampleTimes)

summary(sampleTimes)
formattedValues <- format(sampleTimes, "%a %Y")
head(formattedValues)

length(grep("2012", formattedValues))
length(grep("Mon 2012", formattedValues))
