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

# Value with specific characteristics. Will return a TRUE and FALSE value
table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212", "21213"))

# Will return allrow with 21212 and 21213 in colum Zipcode
restData[restData$zipCode %in% c("21212", "21213"),]

# Cross Tabs  where's the data??
data(UCBAdmissions)
DF = as.data.frame(UCBadmissions)
summary(DF)

xt <- xtab (Freg ~ Gender + Admit, data=DF)
xt

#Flat Tables
warpbreaks$replicate <- rep(1:9, len = 54)
xt = xtab(breaks ~. , data = warpbreaks)

ftable(xt)

# Size of data set
fakeData = rnorm(1e5)
object.size(fakeData)

print(object.size(fakeData), units = "Mb)












#-----End-----
