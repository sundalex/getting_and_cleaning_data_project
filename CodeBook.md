# CodeBook for Course Project

# Getting and Cleaning Data - Course Project
Data Science Specialization - John Hopkins University
Course offered through Coursera

Analysis script and Code Book written by A.Sund - October 22nd, 2015

### Document Purpose
To provide details about the experiment which was conducted to create the data set, as well as describe the details about how the script manipulates the data and produces a tidy data set.

###From the Conductors of the Experiment
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

- Triaxial Angular velocity from the gyroscope.

- A 561-feature vector with time and frequency domain variables. 

- Its activity label. 

- An identifier of the subject who carried out the experiment.

Files included in the data set:
- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

### Part 1 (as outlined in run_analysis.R script)
Read the following files into data frames:
- features.txt

- activity_labels.txt

- train/X_train.txt

- train/y_train.txt

- test/X_test.txt

- test/y_test.txt

All of the test and train files are merged together and column names are assigned to each measurement based on the features.txt data frame.

### Part 2
We're only interested in the mean and std measurements of the dataset. Find the indexes of all features containing the words "mean" or "std".  Remove all columns not containing mean or std in column headings.

###Part 3
Loop through the dataset and replace activity number with their respective labels. Use the key in the activity labels.txt document to achieve this.

###Part 4
Using the gsub function, loop through all of the feature names and replace them with more descriptive titles based on keywords.  Gsub will find patterns and substitute in a given a text of the user's choosing.  Discretion was advised here.

###Part 5
To produce a tidy dataset with an average (mean) of all measurements for each specific activity for each subject, the script loops through all each subject and activity and calculates a mean.

The resulting data frame contains all the averages for all 30 subjects, for each of the 6 activities.

###Additionally
The script finishes by writing the resulting tidy data set to a text file, and provides code for how to read this file back into R.