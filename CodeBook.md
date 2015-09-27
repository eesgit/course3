 The data for the project was here:
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 There are the following files in the dataset:

 'features_info.txt': Shows information about the variables used on the feature vector.

 'features.txt': List of all features.

 'activity_labels.txt': Links the class labels with their activity name.

 'train/X_train.txt': Training set.

 'train/y_train.txt': Training labels.

 'test/X_test.txt': Test set.

 'test/y_test.txt': Test labels.

 The following files are available for the train and test data. Their descriptions are equivalent. 

 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

 activity_labels.txt:
 1 WALKING
 2 WALKING_UPSTAIRS
 3 WALKING_DOWNSTAIRS
 4 SITTING 
 5 STANDING 
 6 LAYING


 The R script called run_analysis.R does the following. 
 
 1.Merges the training and the test sets to create one data set.
 
 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
 
 3.Uses descriptive activity names to name the activities in the data set
 
 4.Appropriately labels the data set with descriptive variable names. 
 
 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Libraries
 Before the R srcipt can be run the following libraries have to load:
 data.table and reshape2.

## Data sets and variables:
subject_training is load from subject_train.txt
activity_training is load from y_train.txt
features_training is load from X_train.txt
subject_test is load from subject_test.txt
activity_test is load from y_test.txt
features_test is load from X_test.txt
feature_names is load from features.txt
activity_labels is load from activity_labels.txt


activity is combined the activity training and test sets (activity_training + activity_test)
features is combined the features training and test sets (features_training + features_test)
subject is combined the subject training and test sets (subject_training + subject_test)


tidydata is combined all three sets (features + activity +subject)


melt_variable is molten data set of section 4.
tidydata_mean is a final tidy data, which is cast from molten data set.


columns_mean_std is grep (the mean and standard deviation) of column V2 of feature_names.


tidydata_mean.txt is the data set file of section 5. It is tidy data set with the average 
of each variable for each activity and each subject.
