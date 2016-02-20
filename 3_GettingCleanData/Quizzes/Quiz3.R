#Quiz # 3
#Quiz # 3
#  GDP data "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
# Educational Data ->  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

#  GDP Data
#
#
library(dplyr)
if(!file.exists("/Users/kfcbarangan/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes"))
{dir.create("/Users/kfcbarangan/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
destfile <- "/Users/kfcbarangan/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/GRP.csv"

GDP <- download.file(fileUrl, destfile = destfile)
GDP <- read.csv("/Users/kfcbarangan/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/GRP.csv", sep = ",", header = )

GDPDataFrame <- tbl_df(GDP)
# Get info
head(GDP)
str(GDP)
names(GDPDataFrame)

GDPSelect <- select(GDPDataFrame , -X.1,  -(X.4:X.8))


# Select columns


colnames(GDPSelect)[1] = "Shortcode"


# Educational Data
if(!file.exists("/Users/kfcbarangan/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes"))
{dir.create("/Users/kfcbarangan/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
destfile <- "/Users/kfcbarangan/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/EDU.csv"

EDU <- download.file(fileUrl, destfile = destfile)
EDU <- read.csv(destfile)

head(EDU)
str(EDU)
names(EDU)

EDUDataFrame <- tbl_df(EDU)
colnames(EDUDataFrame)[1] = "Shortcode"

EDUSelect <-  select(EDUDataFrame, Shortcode, Income.Group)


# Merge/combine data
GDPEDUMerge <- inner_join(GDPSelect, EDUSelect, by = "Shortcode" )
    GDPEDUMergetest <- arrange(GDPEDUMerge, desc(Gross.domestic.product.2012))

# Removed missing Values
GDPEDUMerge2 <- filter(GDPEDUMerge, Gross.domestic.product.2012 != "")

# Sort descending
GDPEDUMerge4  <- arrange(GDPEDUMerge2, desc(X.3))
GDPEDUMerge3 <- arrange(GDPEDUMerge2, desc(Gross.domestic.product.2012))
GDPEDUMerge3
ShowAnswer <- GDPEDUMerge3[13,]
Answer <- write.csv(file == GDPEDUMerge4,  "/Users/kfcbarangan/Desktop/DataScienceCourse/3_GettingCleanData/Quizzes/Answer3.csv", sep = ",")
