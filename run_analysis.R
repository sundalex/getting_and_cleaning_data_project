# Getting and Cleaning Data - Course Project
# Data Science Specialization - John Hopkins University
# Course offered through Coursera

# A. Sund - October 22nd, 2015

###########################################################################################
# 1. Merge training and test sets to create one data set

# Set working directory to the location where the UCI HAR Dataset was unzipped
setwd('/Users/AJ/Documents/UCI HAR Dataset/');

# Load Appropriate Libraries for manipulation
library(dplyr)
library(data.table)
library(tidyr)

# Load Labels/Features from Main Folder
features <- read.table("features.txt",header=FALSE)
actLabels <- read.table("activity_labels.txt",header=FALSE)
actLabels[,2] <- as.character(actLabels[,2])

# Load Test Set
subject_test <- read.table("test/subject_test.txt",header=FALSE)
X_test <- read.table("test/X_test.txt",header=FALSE)
y_test <- read.table("test/y_test.txt",header=FALSE)

# Load Train Set
subject_train <- read.table("train/subject_train.txt",header=FALSE)
X_train <- read.table("train/X_train.txt",header=FALSE)
y_train <- read.table("train/y_train.txt",header=FALSE)

# Merge Test and Train Data into one large dataset
testwhole <- cbind(subject_test, y_test, X_test)
trainwhole <- cbind(subject_train, y_train, X_train)
datasetwhole <- rbind(testwhole,trainwhole)

###########################################################################################
# 2. Extract only the measurements on the mean and standard deviation for each measurement

# Find Indexes for all features containing the words mean
# and std for standard deviation
means <- grep("mean",features[,2])
stdevs <- grep("std",features[,2])
meansAndstdevs <- c(means, stdevs)

# Get the names of the features in vector form for naming purposes
featurenames <- as.vector(features[,2])
meanStdFeatures <- featurenames[c(means, stdevs)]
datasetnames <- c("Subject_ID","Exercise", meanStdFeatures)

# Combine All Test and Train datasets and use only
# data which contain mean and std measurements
testy <- cbind(subject_test, y_test, X_test[meansAndstdevs])
trainy <- cbind(subject_train, y_train, X_train[meansAndstdevs])

# Dataset is now all the Test and Train data (with mean and stdev) combined in one dataset
dataset <- rbind(testy,trainy)

###########################################################################################
# 3. Create descriptive activity names to name the activities in the data set

# Name the columns of the dataset based off of their
# respective measurement names
colnames(dataset) <- datasetnames

# Clone the datasets to preserve original data frame
datasetclone <- dataset

# Replace exercise number with corresponding exercise name
# use key from activity labels document!
dimsetty <- dim(datasetclone)
for (i in 1:dimsetty[1]) {
        if (dataset[i,2] == 1)
                datasetclone[i,2] <- actLabels[1,2]
        if (dataset[i,2] == 2)
                datasetclone[i,2] <- actLabels[2,2]
        if (dataset[i,2] == 3)
                datasetclone[i,2] <- actLabels[3,2]
        if (dataset[i,2] == 4)
                datasetclone[i,2] <- actLabels[4,2]
        if (dataset[i,2] == 5)
                datasetclone[i,2] <- actLabels[5,2]
        if (dataset[i,2] == 6)
                datasetclone[i,2] <- actLabels[6,2]
}

###########################################################################################
# 4. Appropriately label the data set with descriptive variable names. 

# Clean up Variable names and make them more descriptive
colNames <- datasetnames
for (i in 1:length(colNames)) 
{
        colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
        colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
        colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
        colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
        colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
        colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
        colNames[i] = gsub("^(t)","time",colNames[i])
        colNames[i] = gsub("\\()","",colNames[i])
        colNames[i] = gsub("^(f)","freq",colNames[i])
        colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
        colNames[i] = gsub("-std$","StdDev",colNames[i])
        colNames[i] = gsub("-mean","Mean",colNames[i])
};

###########################################################################################
# 5. Create a second, independent tidy data set with the average of each variable for each
#    activity and each subject

# Find all Unique subjects to loop through - We have 30 subjects total
uniqueSubs <- unique(datasetclone[,1])

# Creates a blank data frame with Appropriate column names
# Will populate this blank data frame using loops
my_tidy_data <- read.table(text = "",col.names = colNames)

# Initialize a Row Counter to Zero for indexing into blank data frame
count = 0

# Calculate the mean of all measurements for each specific activity, for each subject.
for (person in uniqueSubs){
        for (activity in actLabels[,2]){
                my_subset <- subset(datasetclone, datasetclone$Subject_ID == person & datasetclone$Exercise == activity)
                meany <- sapply(my_subset[,3:length(my_subset)],mean)
                meany <- as.numeric(meany)
                count = count + 1
                my_tidy_data[count,1] <- person
                my_tidy_data[count,2] <- as.character(activity)
                my_tidy_data[count,3:length(my_subset)] <- meany
        }
}

# Make a descriptive table with classes of each column and then view the resulting tidy dataset
tidyset <- tbl_df(my_tidy_data)
View(tidyset)

# Write the Tidy Data set to a txt file
write.table(my_tidy_data, file = "Tidy_Data_Set.txt", row.names = FALSE, col.names = TRUE)

# Reading the Dataset back into file
tidy_dataset <- read.table("Tidy_Data_set.txt", header = TRUE)


