# The R script called run_analysis.R does the following. 
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# -------------------------------------------------------------
# 1.Merges the training and the test sets to create one data set.
# At first data is read in this 1 section and 
# then training and the test sets are combined in sections 3 and 4.

# Read training data
# Each row identifies the subject who performed the activity for each window sample.
subject_training <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
# Training labels
activity_training <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
# Training set
features_training <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)

# Test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activity_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
features_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)

# List of all features.
feature_names <- read.table("UCI HAR Dataset/features.txt")

# Links the class labels with their activity name
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

# -------------------------------------------------------------
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

# The mean and standard deviation using grep
columns_mean_std <- grep("mean\\(|std\\(", feature_names$V2)


# -------------------------------------------------------------
# 3.Uses descriptive activity names to name the activities in the data set

# Change letters into lower case and remove "_" 
activity_labels$V2 <- tolower(gsub("_", "", activity_labels$V2))

# Combine the training and the test sets (activity_training and activity_test)
activity <- rbind(activity_training, activity_test)

# Put descriptively labels
activity[, 1] <- activity_labels[activity[, 1], 2]
names(activity) <- "Activity"

# -------------------------------------------------------------
# 4.Appropriately labels the data set with descriptive variable names.

# Combine the training and the test sets 
features <- rbind(features_training, features_test)

# Extract only the mean and standard deviation
features <- features[, columns_mean_std] 

# Label the variables using feature names
names(features) <- feature_names[columns_mean_std, "V2"]

# Change abbreviation into their full form
# and first letter into capital 
# and remove special marks
names(features) <- gsub("Acc", "Acceleration", names(features))
names(features) <- gsub("Mag", "Magnitude", names(features))
names(features) <- gsub("Freq", "Frequency", names(features))
names(features) <- gsub("\\-", "", names(features))
names(features) <- gsub("std", "StandardDeviation", names(features))
names(features) <- gsub("mean", "Mean", names(features))
names(features) <- gsub("\\(|\\)", "", names(features))
names(features) <- gsub("^t", "Time", names(features))
names(features) <- gsub("^f", "Frequency", names(features))

# Combine the training and the test sets
subject <- rbind(subject_training, subject_test)
names(subject) <- "Subject"

# Combine all three sets into single tidy data set
tidydata <- cbind(features,activity,subject)

# -------------------------------------------------------------
# 5.From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable 
# for each activity and each subject.

# Mean values of each variable for all subject and activity combination
melt_variable <- melt(tidydata, id.vars = c("Subject", "Activity"))
tidydata_mean <- dcast(melt_variable, Subject+Activity ~ variable, mean)

write.table(tidydata_mean, "tidydata_mean.txt", row.name = FALSE)
# -------------------------------------------------------------
