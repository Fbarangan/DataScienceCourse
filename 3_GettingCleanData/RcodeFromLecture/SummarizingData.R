# Summarizing the Data
# ------Getting the Data from the Web------------------

# File "/Desktop/DataScience/3_GettingCleanData/RCodesFromLecture"
# Make sure to set correct working directory
getwd()

library(XML)

if (!file.exists("/Users/kfcbarangan/Desktop/DataScience/3_GettingCleanData/RcodeFromLecture/data"))
{dir.create ("/Users/kfcbarangan/Desktop/DataScience/3_GettingCleanData/RcodeFromLecture/data")}

fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=Download"

# NOTE FOR Mac ou don't have to indicate METHOD when downloading

download.file(fileUrl, destfile = "/Users/kfcbarangan/Desktop/DataScience/3_GettingCleanData/RcodeFromLecture/data/restaurant.csv")
restData <- read.csv("/Users/kfcbarangan/Desktop/DataScience/3_GettingCleanData/RcodeFromLecture/data/restaurant.csv")
restData

#Look at a bit of the Data
head(restData, n =3)
tail(restData, n=3)
# Make Summary
summary(restData)
# More in depth
str(restData)
#Quantiles of qualitative variables. na.rm = TRUE-> to exlude NA or missing values
quantile(restData$councilDistrict, na.rm = TRUE)
quantile(restData$councilDistrict, probs= c(0.5, 0.75, 0.9))

#Make Table include NA's
table(restData$zipCode, useNA = "ifany")
table(restData$councilDistrict, restData$zipCode)

#check for missing values
sum(is.na (restData$councilDistrict))
# will yield TRUE or FALSE
any(is.na (restData$councilDistrict))
all(restData$zipCode > 0)

# Row and column Sums
colSums(is.na (restData))
all(colSums(is.na(restData)) > 0)

# Value with specific characteristics
tabel(restData$zipCode %in% c("21212"))







#-----End-----
