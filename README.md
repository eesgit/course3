# The R script code is in run_analysis.R

# The raw data files downloaded and unzipped from
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Libraries should be loaded are library data.table, because code use rbind function and 
# library reshape2, because melt and dcast.

# The R script does the following: 

# 1.Merges the training and the test sets to create one data set.
At first data is read in this 1 section and 
then training and the test sets are combined in sections 3 and 4.

# 2.Extracts only the measurements on the mean and standard deviation for each measurement 
using grep function. The abbreviation of standard deviation is std.

# 3.Uses descriptive activity names to name the activities in the data set.
The letters are changed into lower case and removed "_". 
The activity training and test sets are combined and 
descriptively labels are updated. The labels are in activity_labels.txt.

# 4.Appropriately labels the data set with descriptive variable names.
The features training and test sets are combined and 
names are updated. The names are in features.txt.
After that abbreviations are changed into their full form
and first letters into capitals 
and removed special marks.
Also the subject training and test sets are combined and it is named "Subject".
Finally all three sets are combined into single tidy data set.

# 5.From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.
The data set in step 4 is melt and this molten data is cast into a final tidy data set.
Finally this tidy data set is saved into output file tidydata_mean.txt
