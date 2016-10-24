# datacleansing
Course Project

----------------------------------------
Getting and Cleaning Data
Week 4 Project
----------------------------------------
Pre-work

Understand Review Criteria and Assignment

Review Criteria
1. The submitted data set is tidy
2. The Github repo contains the required scripts
3. Github contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable
5. The work submitted for this project is the work of the student who submitted it

Assignment Goals
1. Merges the training and test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately lables the data set with descriptive variable names
5. Create a second independent tidy data set with the average of each variable for each activity and each subject

Pre-work with files

Download files specified by URL - it is a large zip file
Extract all files from the zip file in my default working area (RData directory)
Load each text file into RStudio for exploration and understanding
Determine which files are useful to complete this assignment
Design a plan on how to connect all of the useful files to produce the desired output

Pre-work Conclusions

Useful Files are identified in the README.txt file included in the downloaded zip
A usage note was added to the description of each file
Many other files were included in the downloaded zip file but are not needed for this exercise
==================================================================================
- 'features.txt': List of all features. Used to name the 561 columns of measurements. 
- 'activity_labels.txt': Links the class labels with their activity name. Used to name the six activities.
- 'train/X_train.txt': Training set. Used as measures data arranged in 561 columns 
- 'train/y_train.txt': Training labels. Used to attach activityID (1-6) for each row in X_train.
- 'test/X_test.txt': Test set. Used as measures data arranged in 561 columns
- 'test/y_test.txt': Test labels. Used to attach activityID (1-6) to each row in X_test.
- 'test/subject_test.txt': List of subjects. Used to attach a subjectID (1-30) to each row in X_test
- 'test/subject_train.txt': List of subjects. Used to attach a subjectID (1-30) to each row in X_train  
NOTE: each file is loaded into a variable of the same name
example: actvity_labels.txt is loaded into a variable named activity_labels


Approach 

Load all useful files into data tables with recognizable names
Give nice column names to the large data files using featues.txt to supply the names
Add columns to the data files that identify the subject and activity. Name new columns subjectID and activityID
Merge the two files test,train together to create a large data set with all rows from test and train measurements
Add nice activity names column called activityName from the file called activity_labels
Create a new data table with only the relevant columns defined in the instructions
Create a summary table that reduces the number of rows from 10K to 30*6=180 and takes the averages of each column
Output summary table into a csv file for upload
Final edits to this README file
Final edits to CODEBOOK file
Load README, CODEBOOK, Summary file to Github

