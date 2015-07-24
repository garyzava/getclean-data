#Getting and Cleaning Data Assignment

##Course Project Objetives
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##About The Raw Data
Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
More on http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##About The R Script
* Name: run_analysis.R
* Description: Solves the course project objetives

##Steps To Work
1. Download the raw data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Save contents within your R working directory in a folder name: UCI HAR Dataset
3. Save script file run_analysis.R in your your R working directory.
4. Execute script as follows: source("run_analysis.R")

##How The Script Works
* It first verify or install all necessary libraries
* Load with read.table command all raw datasets
* For the first step -Merge the training and the test sets to create one data set-, it appends subject, activity and feature train and test datasets using rbind command. Then rename all features column name using features.txt data set. Finally create a new date frame adding activity and subject as a column to features
* In second step -Extract only the measurements on the mean and standard deviation for each measurement-, using grep extract relevant column, that is mean and standard dev columns.
* Third step -Use descriptive activity names to name the activities in the data set-, it renames headers using gsub and names command
* Final step, aggregates data to get the mean of each metric using aggreage command and getting the output in a file named uci_tidy_dataset.txt, that separated with pipes "|".

##Dependencies
* R Library: data.table
* R Library: dplyr
* Raw Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* R program or RStudio

Enjoy!
