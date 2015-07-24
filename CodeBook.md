#CodeBook

##Raw Data
* Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Description Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Raw Datasets
Raw data used for this script:
* features.txt: Contains all feature labels 
* activity_labels.txt: Contains all activity labels 
* subject_train.txt: Contains all subject training data. 
* train/y_train.txt: Contains all activity training data.
* train/X_train.txt: Contains all feature training data.
* test/subject_test.txt: Contains all subject test data 
* test/y_test.txt: Contains all activity test data.
* test/X_test.txt: Contains all feature test data.

##run_analysis.R Script Main Variables Used
* Inputs
  * feature_labels <- features.txt
  * activity_labels <- activity_labels.txt
  * subject_train <- subject_train.txt
  * activity_train <- y_train.txt
  * feature_train <- X_train.txt
  * subject_test <- subject_test.txt
  * activity_test <- y_test.txt
  * features_test <- X_test.txt
* Output
  * Filename: uci_tidy_dataset.txt

##Tranformations In Script
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##How To Execute Script
* In R command line type: source("run_analysis.R")
* Script will install all necessary libraries. All files should be in workset directory previously.
