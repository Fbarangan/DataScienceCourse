# Question 4

# GDP Data source "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

# Educational Data set   "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

#Original data source  http://data.worldbank.org/data-catalog/GDP-ranking-table
#                       http://data.worldbank.org/data-catalog/ed-stats

# Quantitative Financial Modelling & Trading Framework for R  http://www.quantmod.com/
# Use Base R instead of Studio. It is saying it is curently not compatible with my R Studio Version

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

