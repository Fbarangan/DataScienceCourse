# Question 4

# GDP Data source "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

# Educational Data set   "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

#Original data source  http://data.worldbank.org/data-catalog/GDP-ranking-table
#                       http://data.worldbank.org/data-catalog/ed-stats

#File creation
if(!file.exists("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes"))
{dir.create("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes")}

fileUrlGDP <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileUrlEDStats <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

GDPRaw <- download.file(fileUrlGDP, destfile = "/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/GDPRaw.csv")

EDStatsPRaw <- download.file(fileUrlEDStats, destfile = "/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/EDStatsRaw.csv")

# GDP Data info
GDP <- read.csv("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/GDPRaw.csv", stringsAsFactors = FALSE, header = FALSE)

GDPHeaders <- GDP <- read.csv("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/GDPRaw.csv")

names(GDP)
names(GDPHeaders)
# rename header
colnames(GDP)[1] = "countrycode"

# EDUStats

EDUStat <- read.csv("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/EDStatsRaw.csv", stringsAsFactors = FALSE, header = FALSE)

EDUStatHeaders <- read.csv("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/EDStatsRaw.csv")

names(EDUStat)
names(EDUStatHeaders)
#rename CountryCode to countrycode
colnames(EDUStat)[1] = "countrycode"
colnames(EDUStat)[10] = "specialnotes"

# combine 2 table
GDPEDUCombined <- merge(GDP, EDUStat, by = "countrycode" )

# will pull all with word "Fiscal" and June
FiscalYearJune <- grep("[Ff]iscal | [Jj]une", GDPEDUCombined$specialnotes)

#
FiscalYearJune <- grep("Fiscal year end: June", GDPEDUCombined$specialnotes)

FiscalYearJuneNumber <-  length(FiscalYearJune)
FiscalYearJuneNumber

#---End-----
