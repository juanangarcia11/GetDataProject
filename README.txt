==================================================================
COURSERA "GET DATA COURSE PROJECT"
==================================================================


The purpose from the course project is to create the "R" code toprocess the data obtained from:
 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

by creating one R script called run_analysis.R that does the following:

1.-Merges the training and the test sets to create one data set.
2.-Extracts only the measurements on the mean and standard deviation for each measurement. 
3.-Uses descriptive activity names to name the activities in the data set
4.-Appropriately labels the data set with descriptive variable names. 
5.-Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


To do that the script assumes the data has been unzip in the main directory and therefore "./UCI HAR Dataset" is the Data directory.

The scrip follows the process described below after reading raw data; more information from the raw data can be obtain from README file in the zip package

1.- Merges both test and train sets by using rbind(), and assigns column names from "Features"
2.- grep() funcion helps to create a index vector to perform task number 2, and select mean and standard deviation data
3.- factor transformation using Activity Table is done at this point to identify activities by name and not by id number

NOTE: It was not 100% clear if the Tidy Data Set referred to only the "mean" and "standard deviation" measurements or the full Data set. In this case I considered the full one. In the other case process would be the same, but using the index vector of step 2

4.- By labeling the Columns, and add "Subject ID" and "Activity Descriptions" Columns, we have a quite tidy dataset. colnames(), cbind() are main functions used
5.- Script shows two different ways to create the second tidy data set; one using aggregate() and cleaning usefuless columns, and the second by using melt () and cast().
6.- Tidy Data Set from the process is "ASSIGNMENT_TIDY_DATA_SET.txt"



==================================================================
RELATED FILE DESCRIPTIONS
==================================================================

"run_analysis.R" --> the R script
"codebook.txt" --> the description of the tidy data set; variables, units, values ....
"ASSIGNMETN_TIDY_DATA_SET.txt" ---> the tidy data set obtained from the raw data as described before



==================================================================
June 2014
==================================================================