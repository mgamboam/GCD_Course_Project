## Getting and Cleaning Data Course Project
# By: Mario Gamboa

# 0. Download the files from the web, unzip and upload into tables...----
# Location of dataset
urlDS = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dirData = "data"

# Check/create data folder
if(!file.exists("data")) { dir.create("data") }

# Check for/download the raw data file
if (!file.exists("data/SamsungGSData.zip")) {
      download.file(url = urlDS,
            destfile = "data/SamsungGSData.zip", method = "curl")
}

#Check if the data has been unzipped, if it hasn't, then unzip it
if (!file.exists("UCI HAR Dataset")){
      unzip(zipfile = "data/SamsungGSData.zip", overwrite = T)
}

# 1. Merges the training and the test sets to create one data set.-------
# Load the data into datasets, only if the combined dataset doesn't already exist!
if(!exists("featureSet")){featureSet <- read.table("./UCI HAR Dataset/features.txt") }
if(!exists("actLabels")){ actLabels <- read.table("./UCI HAR Dataset/activity_labels.txt") }

if(!exists("xFullSet")){
      xTestSet <- read.table("./UCI HAR Dataset/test/X_test.txt") 
      xTrainSet <- read.table("./UCI HAR Dataset/train/X_train.txt") 
      xFullSet <- rbind(xTestSet, xTrainSet)
      remove(list=c("xTestSet", "xTrainSet")) # Clean some memory
      names(xFullSet) <- featureSet$V2       # Clean titles on the Dataset
}

if(!exists("yFullSet")) {
      yTestSet <- read.table("./UCI HAR Dataset/test/y_test.txt") 
      yTrainSet <- read.table("./UCI HAR Dataset/train/y_train.txt") 
      yFullSet <- rbind(yTestSet, yTrainSet)
      remove(list=c("yTestSet", "yTrainSet")) # Clean some memory
}
if(!exists("sbjFullSet")){
      sbjTrainSet <- read.table("./UCI HAR Dataset/train/subject_train.txt") 
      sbjTestSet <- read.table("./UCI HAR Dataset/test/subject_test.txt") 
      sbjFullSet <- rbind(sbjTestSet, sbjTrainSet)
      remove(list=c("sbjTestSet", "sbjTrainSet")) # Clean some memory
}


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. ----
# Columns that contain the 'mean' and 'standard' deviation for the measurements
# list of columns that have mean or standard in their name
colSel <- grep("\\bmean|\\bstd", names(xFullSet))

# Create tidy dataset with all the information combined
tidySet <- cbind(Subject=sbjFullSet$V1,Activity=yFullSet$V1, xFullSet[,colSel])
remove(list=c("sbjFullSet", "yFullSet","xFullSet")) # Clean some memory

# 3. Uses descriptive activity names to name the activities in the data set -----
library(plyr)
tidySet$Activity <- as.factor(tidySet$Activity)
tidySet$Activity <- mapvalues(tidySet$Activity, from = levels(tidySet$Activity), to = levels(actLabels$V2))


# 4. Appropriately labels the data set with descriptive variable names. -----
# Remove - ( ) and other special characters from column names so they are easier to process
names(tidySet) <- gsub("-|\\(|\\)","",names(tidySet))

# Write the dataset to a CSV file
write.csv(tidySet, "data/tidySet1.csv", append=FALSE)

# 5. Creates a second, independent tidy data set with the average of each variable ---- 
# for each activity and each subject. 
tidySet2 <- aggregate(.~Subject+Activity, tidySet, mean)

# Write results to a separate file
write.csv(tidySet, "data/tidySet2.csv", append=FALSE)
