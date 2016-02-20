#Quiz # 3
#Quiz # 3
#  GDP data "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
# Educational Data ->  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

#  GDP Data
#
#
library(dplyr)
if(!file.exists("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes"))
{dir.create("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
destfile <- "/Users/`/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/GRP.csv"

GDP <- download.file(fileUrl, destfile = destfile)
GDP <- read.csv("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/GRP.csv", stringsAsFactors = FALSE , header = FALSE)



GDPStrip <- GDP[6:236,]
GDPStripDF <-  tbl_df(GDPStrip)

#Rename
names(GDPStripDF) <- c("Shortcode", "GDP", "X.1", "Economy", "Amount", "V4","V5","V6", "V7","V8")


# Change all appplicable to integer
GDPStripDF$GDP <- as.integer(GDPStripDF$GDP)
GDPStripDF$Amount <- as.factor(GDPStripDF$Amount)
GDPStripDF$Amount <- as.numeric(GDPStripDF$Amount)


head(GDPStripDF)
View(GDPStripDF)

# test calc
ave(GDPStripDF$Amount)

# select column
GDPStripDFSelect <- select(GDPStripDF, Shortcode,GDP,Economy,Amount)

# Final clean table
GDPStripDFSelect
View(GDPStripDFSelect)


#
# Educational Data
if(!file.exists("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes"))
{dir.create("/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
destfile <- "/Users/~/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/EDU.csv"

EDU <- download.file(fileUrl, destfile = destfile)
EDU <- read.csv(destfile, stringsAsFactors = FALSE, header = FALSE )

head(EDU)
str(EDU)
names(EDU)

EDUStrip <- EDU[2:235,]

EDUDataFrame <- tbl_df(EDUStrip)
colnames(EDUDataFrame)[1] = "Shortcode"


EDUSelect <-  select(EDUDataFrame, Shortcode, V3)

# Rename V3
names(EDUSelect) <- c("Shortcode", "IncomeGroup")

# remove heading and Final table
EDUSelect
View(EDUSelect)

# Merge/combine data
GDPEDUMerge <- inner_join(GDPStripDFSelect, EDUSelect, by = "Shortcode" )


# 189, St.Kitts

# Question 4
# Do melt
 GDPEDUMergeMelt <-  melt(GDPEDUMerge, id.vars =  c("Shortcode","GDP","IncomeGroup"), measure.vars = c("Amount"))

 HighIncomeOECD <- filter(GDPEDUMergeMelt, IncomeGroup == "High income: OECD")
    ave(HighIncomeOECD$GDP)
    # 32.96667
 HighIncomenonOECD <- filter(GDPEDUMergeMelt, IncomeGroup == "High income: nonOECD")
    ave(HighIncomenonOECD$GDP)
 # will create NA error, there are NA values
 # remove NA
    HighIncomenonOECDNoNA <- HighIncomenonOECD[(!is.na(HighIncomenonOECD)),]

 # select 1:37
    HighIncomenonOECDNoNASelect <- HighIncomenonOECDNoNA[1:23,]

    ave(HighIncomenonOECDNoNASelect$GDP)
       #  91.91304


HighIncomenonOECD[(!is.na(HighIncomenonOECD)),]

# 5

 Question5 <- GDPEDUMerge[1:189,]
 Question5Select <- select(Question5, GDP, IncomeGroup)

# quantile
 GDPEDUMergeQuantile <-  quantile(GDPEDUMerge$GDP, na.rm = TRUE)
  Question5SelectTable <- table(Question5Select)

  # oher way of doing it
  table(GDPEDUMerge$IncomeGroup,GDPEDUMerge$GDP)

 prod1 <-
