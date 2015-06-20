# run_analysis.R
Getting and Cleaning Data project
## This script will read the following files so make sure 
those files are exist in the same directory
1. X_train.txt
2. X_test.txt
3. y_train.txt
4. y_test.txt
5. features.txt
6. subject_train.txt
7. subject_test.txt

## Program working flow
* First the code will read in the features.txt and store these 
name to vname variable
* Use read.table to read in both X_train.txt and X_test.txt file with 
col.names = vname so each column has a title
* Combine these 2 data sets using rbind
* Extract column names with "mean"
* Extract column names with "std"
* Combind the above 2 sub data set to form a single data set
* Read in "Activity" from both y_train.txt and y_test.txt files separately
* Combind the Activity data sets to form a single data set 
* Replace the Activity with a descriptive name 
* Combine Subject, Activity and function data set together to form a single tidy data set 
* Convert the above data set to data.table data set 
* Use lappy to get the mean values for each function by Activity and Subject
* Write the final data set to a file
