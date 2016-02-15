# Creating new Variable ?
# Common values to create
# missingness indicators
#"Cutting up" quantitative variables
#Applying transforms

# Sample data  https://data.baltimorecity.gov/Community/Restaurants/k5ry=ef3g

# Getting data from the web

if(!file.exists ("./place location")) {dir.create ("./place data here")}
fileUrl <- " https://data.baltimorecity.gov/Community/Restaurants/k5ry=ef3g/row.csv?accessType=DOWNLOAD"

# It may work not to put method ="curl" for Mac OSX
download.file(fileUrl, destfile = "./yourdatahere/restaurant.cvs",  method = "curl" )
restData <- read.csv (./yourdatahere/restaurant.cvs")

# Creating Sequences
# Sometimesyou need an index for your Data set

s1 <- seq(1,10, by = 2) ; S1

s2 <- seq(1,10 length = 3) ; s2

x <- c(1,3,25,100); seq(along = x)
  # Dont' know why the outpu is " [1] 1 2 3 4 5

#Subsetting variables
# Will return and count number of TRUE and FALSE
restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

# Creating binary variables
 restData$zipWrong = ifelse (restData$zipCode <0, TRUE, FALSE)

# Will return a table , TRUE or FALSE value and its count
 table(restData$zipWrong, restData$zipCode <0)

# Creating categorical variables

restData$zipGroups  = cut(restData$zipCode, breaks = quantile (restData$zipCode))
table(restData$zipGroups)

# When table is first variable in the function is the rows; the second value are the columns
table(restData$zpGroups, restData$zipCode)

# Easier cutting
install.packages("Hmisc")
library(Hmisc)

restData$zipgroups = cut2(restData$zipCode, g = 4)
table(restData$zipGroups)

# Creating factor variable
restData$zcf <- factor(restData$zipCode)
restData$zcf
class(restData$zcf)

# Level of factor variables
yesno <- sample(c("yes", "no"), size = 10, replace = TRUE )
yesnofac = factor(yesno, level = c("yes", "no"))
relevel(yesnofac, ref = "yes")

as.numeric(yesnofac)

# Cutting produces factor variable
library(Hmisc)

restData$zipGroups = cut2(restData$zipCode, g=4)
table(restData$zipGroups)

# Using the mutate function
library(dplyr)
restData2 = mutate(restData, zipGroups = cut2(zipCode, g=4))

# Common Transform
# avs(x) absolute value

# sqrt(x) square root

# ceiling(x) ceiling(3.475) is 4

# floor(x) floor(3.475) is 4

# round(x, digits = n)  round(3.475, digits = 2) is 3.48

# signif (x, digits = n ) signif (3.475, digits = 2) is 3.5





