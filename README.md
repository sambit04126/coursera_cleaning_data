# Heading
Getting and Cleaning Data Course Project
——-
##Requirement

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

——-
##Description

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data for the project is sourced from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


——-
##Contents

*README.md
*CodeBook.md
*run_analysis.R
*tidy.csv

###README.md

Explains about the content of the repo.

###CodeBook.md

A code book that describes the variables, the data, and any transformations or work that is performed to clean up the data.

###run_analysis.R

This is the main script, which collects the data and transforms it into a tidy form.
It follows the following steps.

*Merges the training and the test sets to create one data set.
*Extracts only the measurements on the mean and standard deviation for each measurement.
*Uses descriptive activity names to name the activities in the data set
*Appropriately labels the data set with descriptive variable names.
*From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


###tidy.csv

This is the final output after the transformation.


——-

##How the script works ?

1.Loads dplyr library. This library has methods which are used in this script
2.Download file from the location as as specified in the assignment and save in data folder inside workspace 
3.Unzip the file. Extacted files will be under "./data/UCI HAR Dataset"
4.Extract featurs and activity data and stored them in the variables 
5.extract files X_test.txt and X_train.txt from test and train folder respectively and combine them as xall
6.Assign the column names to xall data set by from features
7.Extracts only the measurements on the mean and standard deviation for each measurement as datauseX. 
8.Extracts files Y_test.txt and Y_train.txt from test and train folder respectively and combine them as yall
9.Joins yall dataset with activity data set to get the descriptive names of the activities.
10.Adds the Activity column to datauseX data set
11.Extracts files subject_test.txt and subject_train.txt from test and train folder respectively and combine them as sall
12.Add the Subject column to datauseX data set
13.Using group_by from dplyr package, creates a grouped dataset by Subject and Activity
14.Creates a second, independent tidy data set with the average, of each variable for each activity and each subject using summarise_each
15.Saves the tidy data set to a file.

##End