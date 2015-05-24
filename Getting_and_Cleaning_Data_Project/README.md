This folder contains solution of the Project solved within the "Getting and Cleaning Data" course provided by Coursera.

Content
- README.md - you just read it
- CodeBook.MD - description of attributes and functions
- run_analysis.R - the main file containing the Project solution

Setup
- Prior the usage of these files, make sure you have your RStudio ready.
- load the run_analysis.R to your RStudio. The file has dependencies to "plyr" package.

Process
The sections below describe the functionalities of the run_analysis.R script file.
 
Task 1 - Merges the training and the test sets to create one data set
- Having the datasets loaded to R, the tables are medged by rows
- names are assigned to variables
- Columns are merged to get one data frame 

Task 2 - Extracts only the measurements on the mean and standard deviation for each loop measurement.
- extraction of features names based on the strings "mean()" or "std()" contained using grep
- selection of names and creation of a subset called Data

Task 3 - Uses activity descriptive names to name the Activities in the data set
- loading the activity_labels.txt to activityLabels 
- normalizing the variables of Data dataset according to new activity labels.

Task 4 - Appropriately labels the data set with descriptive variable names.
- Replacements in the namings using gsub function

Task 5 - From the data set in step 4 Creates a second, independent tidy data set with the average of each loop variable: for each activity and each loop subject.
- using plyr to extract the data to "tidy_data.txt"
