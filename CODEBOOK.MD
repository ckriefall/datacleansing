Overview
Project description and Source of data

Raw Data
8 files used in this project

- 'features.txt': List of all features. Used to name the 561 columns of measurements. 
Number of columns
2

Number of rows
561

List of Columns (two unnamed columns)
integer id
string name 

Description of Data

Sample data
1	1	tBodyAcc-mean()-X
2	2	tBodyAcc-mean()-Y
3	3	tBodyAcc-mean()-Z
4	4	tBodyAcc-std()-X
5	5	tBodyAcc-std()-Y
6	6	tBodyAcc-std()-Z

Simple checks
clean data, no NA values

Summary of findings
Use as column names for the measures in large files: X_train, X_test




- 'activity_labels.txt': Links the class labels with their activity name. Used to name the six activities.
Number of columns
2

Number of rows
6

List of Columns (two unnamed columns)
integer id
string name 

Description of Data

Sample data 
1	1	WALKING
2	2	WALKING_UPSTAIRS
3	3	WALKING_DOWNSTAIRS
4	4	SITTING
5	5	STANDING
6	6	LAYING

Simple checks
clean data, no NA values

Summary of findings
Use to decode the activity integers into activity names

- 'train/X_train.txt': Training set. Used as measures data arranged in 561 columns 
Number of columns
561

Number of rows
7352

List of Columns (561 unnamed columns)


Description of Data
These are the measures collected

Sample data (first four columns out of 561)
1         0.2571778       -0.02328523       -0.01465376       -0.9384040
2         0.2860267       -0.01316336       -0.11908252       -0.9754147
3         0.2754848       -0.02605042       -0.11815167       -0.9938190
4         0.2702982       -0.03261387       -0.11752018       -0.9947428
5         0.2748330       -0.02784779       -0.12952716       -0.9938525
6         0.2792199       -0.01862040       -0.11390197       -0.9944552

Simple checks
clean data, no NA values

Summary of findings
- Measures taken
- All decimal data

- 'train/y_train.txt': Training labels. Used to attach activityID (1-6) for each row in X_train.
Number of columns
- 1

Number of rows
- 7352

List of Columns (561 unnamed columns)

Description of Data
- These are the activity IDs that match the rows of measures in X_train

Sample data
1  5
2  5
3  5
4  5
5  5
6  5

Simple checks
clean data, no NA values

Summary of findings
Measures taken


- 'test/X_test.txt': Test set. Used as measures data arranged in 561 columns
Number of columns
- 561

Number of rows
- 2947

List of Columns (561 unnamed columns)

Description of Data
- These are the measures collected

Sample data (first four columns out of 561)
1         0.2885845       -0.02029417        -0.1329051       -0.9952786
2         0.2784188       -0.01641057        -0.1235202       -0.9982453
3         0.2796531       -0.01946716        -0.1134617       -0.9953796
4         0.2791739       -0.02620065        -0.1232826       -0.9960915
5         0.2766288       -0.01656965        -0.1153619       -0.9981386
6         0.2771988       -0.01009785        -0.1051373       -0.9973350

Simple checks
clean data, no NA values

Summary of findings
Measures taken
All decimal data

- 'test/y_test.txt': Test labels. Used to attach activityID (1-6) to each row in X_test.
Number of columns
- 1

Number of rows
- 7352

List of Columns (1 unnamed columns)
integer

Description of Data
- These are the activity IDs that match the rows of measures in X_train
- values span 1:6

Sample data
1  5
2  5
3  5
4  5
5  5
6  5

Simple checks
clean data, no NA values

Summary of findings
Integer identifier of activity for each row in X_train

- 'test/subject_test.txt': List of subjects. Used to attach a subjectID (1-30) to each row in X_test
Number of columns
- 1

Number of rows
- 7352

List of Columns (1 unnamed columns)
integer

Description of Data
- These are the activity IDs that match the rows of measures in X_train
- values span 1:30

Sample data
1  1
2  1
3  1
4  1
5  1
6  1

Simple checks
clean data, no NA values

Summary of findings
Integer identifier of subject for each row in X_train



- 'test/subject_train.txt': List of subjects. Used to attach a subjectID (1-30) to each row in X_train  
Number of columns
- 1

Number of rows
- 2947

List of Columns (1 unnamed columns)
integer

Description of Data
- These are the activity IDs that match the rows of measures in X_train
- values span 1:30

Sample data
1  1
2  1
3  1
4  1
5  1
6  1

Simple checks
clean data, no NA values

Summary of findings
Integer identifier of subject for each row in X_train





CodeBook for Course Project of Programming with R

Raw Data

The raw data for this project is accelerometer data collected from the Samsung Galaxy S smartphone, and was provided to us at the links below:

Data file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

CodeBook: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This data included both the raw sampled data (folder ../Inertial Signals) and features apparently based on the raw data. For the purpose of this project, I am only looking at the features, not the raw data.
There are 3 types of files:
x: rows of feature measurements
y: the activity labels corresponding to each row of X. Encoded as numbers.
subject: the subjects on which each row of X was measured. Encoded as numbers.
In addition, to determine which features are required, we look at the list of features:
features.txt
The encoding from activity labels ids to descriptive names.
activity_labels.txt

Data load
The Y, S and X data is loaded from each of the training and test datasets, directly as their final type.
Only the columns of interest from X are loaded, that is the mean() and sd() columns. We determine the columns by examining the feature names (from features.txt) for patterns -mean() or -std().
All of these files are fixed format text files.

Transformation
The activity descriptions are joined to the activity label data (y).
The corresponding training and test datasets are concatenated, and then columns for subject and activitylabel (description) are appended (by row number) to the data.
This result is output as result_combinedDataSet.csv.
The data is further subsetted to only include the activity, subject, and the mean() features. Again these are determined by looking for -mean() in the feature name.
The data is then reduced with ddply() to (activity,subject) -> colMeans()
As it was not specified, missing combinations of activity and subject are output, with value NA.
The column names are tidied by removing the mean() string, etc.

This result is output as tidyData.txt

Output File Columns Definition of tidyData.txt

OrdinalPosition	ColumnName	Description
1	activityName	Recognizable name of Activity measured. Source file is activity_labels.txt. Values are 6 recognizable activity names.
2	subjectID	Anonyomous ID used for each subject that was tested. Source files are subject_test and subject_train. Values 1:30
3	tBodyAcc-mean()-X	Total Body Acceleration X axis mean
4	tBodyAcc-mean()-Y	Total Body Acceleration Y axis mean
5	tBodyAcc-mean()-Z	Total Body Acceleration Z axis mean
6	tGravityAcc-mean()-X	Total Gravity Acceleration X axis mean
7	tGravityAcc-mean()-Y	Total Gravity Acceleration Y axis mean
8	tGravityAcc-mean()-Z	Total Gravity Acceleration Z axis mean
9	tBodyAccJerk-mean()-X	Total Body Acceleration Jerk X axis mean
10	tBodyAccJerk-mean()-Y	Total Body Acceleration Jerk Y axis mean
11	tBodyAccJerk-mean()-Z	Total Body Acceleration Jerk Z axis mean
12	tBodyGyro-mean()-X	Total Body Gyro X axis mean
13	tBodyGyro-mean()-Y	Total Body Gyro Y axis mean
14	tBodyGyro-mean()-Z	Total Body Gyro Z axis mean
15	tBodyGyroJerk-mean()-X	Total Body Gyro Jerk X axis mean
16	tBodyGyroJerk-mean()-Y	Total Body Gyro Jerk Y axis mean
17	tBodyGyroJerk-mean()-Z	Total Body Gyro Jerk Z axis mean
18	tBodyAccMag-mean()	Total Body Acceleration Magnitude mean
19	tGravityAccMag-mean()	Total Gravity Acceleration Magnitude mean
20	tBodyAccJerkMag-mean()	Total Body Acceleration Jerk Magnitude mean
21	tBodyGyroMag-mean()	Total Body Gyro Magnitude mean
22	tBodyGyroJerkMag-mean()	Total Body Gyro Jerk Magnitude mean
23	fBodyAcc-mean()-X	Force Body Acceleration X axis mean
24	fBodyAcc-mean()-Y	Force Body Acceleration Y axis mean
25	fBodyAcc-mean()-Z	Force Body Acceleration Z axis mean
26	fBodyAccJerk-mean()-X	Force Body Acceleration Jerk X axis mean
27	fBodyAccJerk-mean()-Y	Force Body Acceleration Jerk Y axis mean
28	fBodyAccJerk-mean()-Z	Force Body Acceleration Jerk Z axis mean
29	fBodyGyro-mean()-X	Force Body Gyro  X axis mean
30	fBodyGyro-mean()-Y	Force Body Gyro  Y axis mean
31	fBodyGyro-mean()-Z	Force Body Gyro  Z axis mean
32	fBodyAccMag-mean()	Force Body Acceleration Magnitude mean
33	fBodyBodyAccJerkMag-mean()	Force Body Acceleration Jerk Magnitude mean
34	fBodyBodyGyroMag-mean()	Force Body Gyro Magnitude mean
35	fBodyBodyGyroJerkMag-mean()	Force Body Gyro Jerk Magnitude mean
36	tBodyAcc-std()-X	Total Body Acceleration X axis standard deviation
37	tBodyAcc-std()-Y	Total Body Acceleration Y axis standard deviation
38	tBodyAcc-std()-Z	Total Body Acceleration Z axis standard deviation
39	tGravityAcc-std()-X	Total Gravity Acceleration X axis standard deviation
40	tGravityAcc-std()-Y	Total Gravity Acceleration Y axis standard deviation
41	tGravityAcc-std()-Z	Total Gravity Acceleration Z axis standard deviation
42	tBodyAccJerk-std()-X	Total Body Acceleration Jerk X axis standard deviation
43	tBodyAccJerk-std()-Y	Total Body Acceleration Jerk Y axis standard deviation
44	tBodyAccJerk-std()-Z	Total Body Acceleration Jerk Z axis standard deviation
45	tBodyGyro-std()-X	Total Body Gyro X axis standard deviation
46	tBodyGyro-std()-Y	Total Body Gyro Y axis standard deviation
47	tBodyGyro-std()-Z	Total Body Gyro Z axis standard deviation
48	tBodyGyroJerk-std()-X	Total Body Gyro Jerk X axis standard deviation
49	tBodyGyroJerk-std()-Y	Total Body Gyro Jerk Y axis standard deviation
50	tBodyGyroJerk-std()-Z	Total Body Gyro Jerk Z axis standard deviation
51	tBodyAccMag-std()	Total Body Acceleration Magnitude standard deviation
52	tGravityAccMag-std()	Total Gravity Acceleration Magnitude standard deviation
53	tBodyAccJerkMag-std()	Total Body Acceleration Jerk Magnitude standard deviation
54	tBodyGyroMag-std()	Total Body Gyro Magnitude standard deviation
55	tBodyGyroJerkMag-std()	Total Body Gyro Jerk Magnitude standard deviation
56	fBodyAcc-std()-X	Force Body Acceleration X axis standard deviation
57	fBodyAcc-std()-Y	Force Body Acceleration Y axis standard deviation
58	fBodyAcc-std()-Z	Force Body Acceleration Z axis standard deviation
59	fBodyAccJerk-std()-X	Force Body Acceleration Jerk X axis standard deviation
60	fBodyAccJerk-std()-Y	Force Body Acceleration Jerk Y axis standard deviation
61	fBodyAccJerk-std()-Z	Force Body Acceleration Jerk Z axis standard deviation
62	fBodyGyro-std()-X	Force Body Gyro  X axis standard deviation
63	fBodyGyro-std()-Y	Force Body Gyro  Y axis standard deviation
64	fBodyGyro-std()-Z	Force Body Gyro  Z axis standard deviation
65	fBodyAccMag-std()	Force Body Acceleration Magnitude standard deviation
66	fBodyBodyAccJerkMag-std()	Force Body Acceleration Jerk Magnitude standard deviation
67	fBodyBodyGyroMag-std()	Force Body Gyro Magnitude standard deviation
68	fBodyBodyGyroJerkMag-std()	Force Body Gyro Jerk Magnitude standard deviation
