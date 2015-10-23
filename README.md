# Getting and Cleaning Data - Course Project
### Data Science Specialization - John Hopkins University
### Course offered through Coursera

### Analysis script and Code Book written by A.Sund - October 22nd, 2015

## General Overview
###The Getting and Cleaning Data course focuses on obtaining raw data from the internet through a variety of sources and "cleaning" this data to make it readable to anyone who chooses to analyze it.

###This project was developed to take in raw data with descriptive data, and combine the two to make a "tidy" dataset as outlined by Hadley Wickham's Tidy Data Paper.  A full description of the data can be found at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)  

###To download the dataset, click the following Link:
###[Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

###Don't forget to check out [Hadley Wickham's paper](http://vita.had.co.nz/papers/tidy-data.pdf)!


## Importing and Running the Script
###After downloading and unzipping the dataset from the above link, download (or copy) the run_analysis.R (script) file into your UCI HAR Dataset (unzipped) directory.  It is important that the script is not in any subdirectories of UCI HAR Dataset, because it will datamine the subdirectories from the main directory.

## Summary of the Script
####The project requirements as outlined by the Coursera shell for the Getting and Cleaning Data project are as follows:
* Merge the training and the test sets to create one data set.
* Extract only the measurements on the mean and standard deviation for each measurement.
* Use descriptive activity names to name the activities in the data set
*Appropriately labels the data set with descriptive variable names.
* Create a second, independent tidy data set with the average of each variable for each activity and each subject.

## Also...
###For any additional information, please read through the CodeBook.md file in this repository.