# read list of feature names
features <- read.table("data/uci-har-dataset/features.txt")
featureList <- features$V2

# rename variable names
featureList <- gsub("-", ".", featureList)
featureList <- gsub("\\(\\)", "", featureList)

# select columns of only mean and standard deviation
featureSelected <- grep("(mean|std)(\\.|$)", featureList, value=TRUE)

# read training data
xTrain <- read.table("data/uci-har-dataset/train/X_train.txt",
                     col.names = featureList)
# subset xTrain with only mean and std variables
xTrainSelected <- xTrain[, featureSelected]
yTrain <- read.table("data/uci-har-dataset/train/y_train.txt", 
                     colClasses = "factor",
                     col.names = "activityLabel")
subTrain <- read.table("data/uci-har-dataset/train/subject_train.txt",
                       colClasses = "factor",
                       col.names = "subject")
dataTrain <- cbind(xTrainSelected, yTrain, subTrain)

# read testing data
xTest <- read.table("data/uci-har-dataset/test/X_test.txt",
                    col.names = featureList)
# subset xTest with only mean and std variables
xTestSelected <- xTest[, featureSelected]
yTest <- read.table("data/uci-har-dataset/test/y_test.txt", 
                    colClasses = "factor",
                    col.names = "activityLabel")
subTest <- read.table("data/uci-har-dataset/test/subject_test.txt",
                       colClasses = "factor",
                       col.names = "subject")
dataTest <- cbind(xTestSelected, yTest, subTest)


# merge training and testing data into one data frame
dataAll <- rbind(dataTrain, dataTest)

# read activity labels
activityLabels <- read.table("data/uci-har-dataset/activity_labels.txt",
                             colClasses = "character",
                             col.names = c("code", "activityLabel"))
# recode activity labels in data
library(plyr)
dataAll$activityLabel <- mapvalues(dataAll$activityLabel, 
                     from = activityLabels$code, 
                     to = activityLabels$activityLabel)


# create an independent tidy data set
library(tidyr)
dataAvg <- 
        dataAll %>%
        gather(measure, value, 1:66) %>%
        group_by(activityLabel, subject, measure) %>%
        summarise(measure.mean = mean(value, na.rm = TRUE)) %>%
        spread(measure, measure.mean)

# output the tidy dataset to csv
write.csv(dataAvg, file = "output/avgMeasurement.csv", row.names = FALSE)
