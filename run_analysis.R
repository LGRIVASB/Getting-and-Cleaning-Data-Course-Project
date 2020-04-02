library(dplyr)
library(plyr)

#DOWNLOAD DATA

if(!file.exists("./data/QuizData")){
  dir.create("./data/QuizData")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/QuizData/dataset.zip")

#UNZIP DATA
unzip("./data/QuizData/dataset.zip", exdir = "./data/QuizData")

#READING DATA
#Labels and Features for data
actLabels <- read.table("./data/QuizData/UCI HAR Dataset/activity_labels.txt", col.names = c("activityId", "Activity"))
features <- read.table("./data/QuizData/UCI HAR Dataset/features.txt", col.names = c("n", "variable"))

#Test Data
testSet_Subjects <- read.table("./data/QuizData/UCI HAR Dataset/test/subject_test.txt")
testSet_X <- read.table("./data/QuizData/UCI HAR Dataset/test/X_test.txt")
testSet_Y <- read.table("./data/QuizData/UCI HAR Dataset/test/y_test.txt")

#Train Data
trainSet_Subjects <- read.table("./data/QuizData/UCI HAR Dataset/train/subject_train.txt")
trainSet_X <- read.table("./data/QuizData/UCI HAR Dataset/train/X_train.txt")
trainSet_Y <- read.table("./data/QuizData/UCI HAR Dataset/train/y_train.txt")

#Converting to unique temporary id variable names
features$variable <- as.character(features$variable)
for(i in 1:nrow(features)){
  features[i, 2] <- paste(features[i, 2], as.character(i), sep = "|")
  
}

#Merged data

mergeSet_X <- rbind(testSet_X, trainSet_X)
mergeSet_Y <- rbind(testSet_Y, trainSet_Y)
mergeSet_Subjects <- rbind(testSet_Subjects, trainSet_Subjects)

#Columns Labels
names(mergeSet_X) <- features$variable
names(mergeSet_Y) <- "activityId"
names(mergeSet_Subjects) <- "Subject"

#Merged train, test and subject data
mergedData <- cbind(mergeSet_Subjects, mergeSet_Y, mergeSet_X)

#Adding descriptive activities names 

mergedData <- join(mergedData, actLabels)


#Extracting measurements (mean and standard deviation)
tidyData <- select(mergedData, "Subject", "Activity", contains("-mean()"), contains("-std()"))


#Removing the temporary unique id from the names of each columns
splitNames = strsplit(names(tidyData), "\\|")

firstElement <- function(x){
  x[1]
}

colnames(tidyData) <- sapply(splitNames, firstElement)

#Adding descriptive labels to the data set
names(tidyData)
names(tidyData)<-gsub("^t", "Time", names(tidyData))
names(tidyData)<-gsub("^f", "Frequency", names(tidyData))
names(tidyData)<-gsub("Acc", "Accelerometer", names(tidyData))
names(tidyData)<-gsub("Gyro", "Gyroscope", names(tidyData))
names(tidyData)<-gsub("BodyBody", "Body", names(tidyData))
names(tidyData)<-gsub("Mag", "Magnitude", names(tidyData))
names(tidyData)<-gsub("-mean()", "Mean", names(tidyData), ignore.case = TRUE)
names(tidyData)<-gsub("-std()", "StandardDeviation", names(tidyData), ignore.case = TRUE)

#Second Tidy Data Set

secondTidyData <- tidyData %>%
  group_by(Subject, Activity) %>%
  summarise_all(funs(mean))

#Saving second tidy data
write.table(secondTidyData, "./data/QuizData/secondTidyData.txt", row.name=FALSE)


