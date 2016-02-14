# Summarizing the Date
# ------Getting the Data from the Web------------------

# File "/Desktop/DataScience/3_GettingCleanData/RCodesFromLecture"
#

if (file.exists("./Desktop/DataScience/3_GettingCleanData/RCodesFromLecture/data"))
        {dir.create ("./Desktop/DataScience/3_GettingCleanData/RCodesFromLecture/data")}
fileUrl <- "https://data/baltimorecity.gov/Community/Restaurants/k5ry-ef3g"

download.file(fileUrl, destfile = "./Desktop/DataScience/3_GettingCleanData/RCodesFromLecture/data/restaurant.csv",
              method = "curl")
restData <- read.csv(./Desktop/DataScience/3_GettingCleanData/RCodesFromLecture/data/restaurant.csv")

#-----End-----
