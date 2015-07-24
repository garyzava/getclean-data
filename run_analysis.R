##########################################################################################################################
#Filename: run_analysis.R
#Course: Getting and Cleaning Data
#Program Assignment 1
#Author: Gary
#Inputs: UCI HAR Datasets - train and test data
#Brief Description: Merge train and test raw data and convert it to a tidy dataset
#Output: uci_tidy_dataset.txt
#Date: 2015-07-15
#Version: 1.0
##########################################################################################################################

#Verify if require libraries are installed
if (!require("data.table")) {
  install.packages("data.table",dependecies=true)
}

if (!require("dplyr")) {
  install.packages("dplyr",dependecies=true)
}

#Read Labels (features and activities), train and test data
feature_labels <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
feature_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
features_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)

# I) - Merge the training and the test sets to create one data set.
subject <- rbind(subject_train, subject_test)
activity <- rbind(activity_train, activity_test)
features <- rbind(feature_train, features_test)

#Name the column names from the features file in variable feature_labels
colnames(features) <- t(feature_labels[2])

#Add activity and subject as a column to features
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
complete_data <- cbind(features,activity,subject)

# II) - Extract only the measurements on the mean and standard deviation for each measurement
relevant_columns <- grep(".*Mean.*|.*Std.*", names(complete_data), ignore.case=TRUE)

#Adding activity and subject columns
required_columns <- c(relevant_columns, 562, 563)
final_data <- complete_data[,required_columns]

# III) - Use descriptive activity names to name the activities in the data set
final_data$Activity <- as.character(final_data$Activity)
for (i in 1:6){
  final_data$Activity[final_data$Activity == i] <- as.character(activity_labels[i,2])
}
#Set the activity variable in the data as a factor
final_data$Activity <- as.factor(final_data$Activity)

# IV) - Appropriately labels the data set with descriptive variable names. 
names(final_data)<-gsub("Acc", "Accelerometer", names(final_data))
names(final_data)<-gsub("Gyro", "Gyroscope", names(final_data))
names(final_data)<-gsub("BodyBody", "Body", names(final_data))
names(final_data)<-gsub("Mag", "Magnitude", names(final_data))
names(final_data)<-gsub("^t", "Time", names(final_data))
names(final_data)<-gsub("^f", "Frequency", names(final_data))
names(final_data)<-gsub("tBody", "TimeBody", names(final_data))
names(final_data)<-gsub("-mean()", "Mean", names(final_data), ignore.case = TRUE)
names(final_data)<-gsub("-std()", "STD", names(final_data), ignore.case = TRUE)
names(final_data)<-gsub("-freq()", "Frequency", names(final_data), ignore.case = TRUE)
names(final_data)<-gsub("angle", "Angle", names(final_data))
names(final_data)<-gsub("gravity", "Gravity", names(final_data))

# V) - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#Set the subject variable in the data as a factor
final_data$Subject <- as.factor(final_data$Subject)
final_data <- data.table(final_data)
#New tidy data as a set with average for each activity and subject
tidy_data <- aggregate(. ~Subject + Activity, final_data, mean)
#Sort tidy data according to subject and activity
tidy_data <- tidy_data[order(tidy_data$Subject,tidy_data$Activity),]
#A new independent tidy data into a text file with | as column separator
write.table(tidy_data, file = "./uci_tidy_dataset.txt", sep="|", row.names = FALSE)
