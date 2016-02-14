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

#-----End-----
