# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

# Load all relevant files using read.table function to create data tables
# X_train and X_test are the measurement files
X_train <- read.table("~/RData/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
X_test <- read.table("~/RData/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")

# y_train and y_test are the activities keys for X_train and X_test respectively 
# there is a one to one match to the rows in the respective measurement files
# Activities are integer values 1-6
y_test <- read.table("~/RData/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
y_train <- read.table("~/RData/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")

# subject_test and subject_train files
# subject values are 1-30
# participants remain anonymous numbers. there is no decode to get the names
subject_test <- read.table("~/RData/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")
subject_train <- read.table("~/RData/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")

# activity_labels decodes the activity keys 1-6 with an activity label
activity_labels <- read.table("~/RData/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")

#features decodes the columns to give meaningful column names to the measurements
features <- read.table("~/RData/UCI HAR Dataset/features.txt", quote="\"", comment.char="")

# useful column names for activity_labels
names(activity_labels)<-c("activityID","activityName")
#useful column names for features
names(features)<-c("colID","colName")

# Apply the names directly to the measurements tables by replacing the names
names(X_test)<-features$colName
names(X_train)<-features$colName

# subject_all <- rbind(subject_train,subject_test)

# Add subjectID column to X_test and X_train using subject_test and subject_train 
X_test["subjectID"]<- c(subject_test)
X_train["subjectID"]<- c(subject_train)

# Add activityID column to X_test and X_train using y_test and y_train 
X_test["activityID"]<- c(y_test)
X_train["activityID"]<- c(y_train)

# combine all the rows into a single set
X_all <- rbind(X_train,X_test)

# Load my favorite library, dyplyr, in order to use well-formed functions
library("dplyr", lib.loc="~/R/win-library/3.3")

# Add the activity names as a column in each and create two new sets with everything needed
fullDataSet <- inner_join(X_all,activity_labels, by="activityID")

# subset of columns with the Activity,means,and standard deviation columns only
ActivityMeanStd <- select(fullDataSet,activityName,subjectID,contains("mean()"),contains("std()"))

# group_by first two columns 
# summarize_each using the mean function 
grp_cols<-names(ActivityMeanStd)[1:2]
dots <- lapply(grp_cols, as.symbol)
SummaryDataSet<- ActivityMeanStd %>% group_by_(.dots=dots) %>% summarise_each(funs(mean))

# Output summary file
# 30 subjects * 6 activities = 180 rows of summary data
write.csv(SummaryDataSet,"RData/SummaryDataSet.csv")
