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
  * feature_labels <- features.txt raw dataset.
  * activity_labels <- activity_labels.txt raw dataset.
  * subject_train <- subject_train.txt raw dataset.
  * activity_train <- y_train.txt raw dataset.
  * feature_train <- X_train.txt raw dataset.
  * subject_test <- subject_test.txt raw dataset.
  * activity_test <- y_test.txt raw dataset.
  * features_test <- X_test.txt raw dataset.
* Output
  * Filename: uci_tidy_dataset.txt tidy data.

##Main Tranformation Variables In run_analysis.R Script
* subject <- Merged data for subject_train and subject_test.
* activity <- Merged data for activity_train and activity_test.
* features <- Merged data for feature_train and features_test.
* complete_data <- Features with activity and subject columns.
* relevant_columns <- List of relevent columns, that is all of those having Mean and Std within their column names.
* required_columns <- List of relevent columns plus Activity and Subject.
* final_data <- Data Frame with only required columns.
* tidy_data <- Final tidy data.

##How To Execute run_analysis.R Script
* Copy run_analysis.R script into your working set directory.
* In R command line type: source("run_analysis.R")
* Script will install all necessary libraries. All files should be in workset directory previously in a folder named UCI HAR Dataset.
