## Starting by reading data, assuming data has been unziped in ./UCI HAR Dataset/
Test_Data <- read.table ("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
Train_Data <- read.table ("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
Features_List <- read.table ("./UCI HAR Dataset/features.txt",header=FALSE)
Activity_Table <- read.table("./UCI HAR Dataset/activity_labels.txt")
Test_Labels <- read.table ("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
Train_Labels <- read.table ("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
Subject_Train <- read.table ("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
Subject_Test <- read.table ("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)

##1.-Merges the training and the test sets to create one data set, and assign their column names
Merged_Data <- rbind(Test_Data,Train_Data)
colnames(Merged_Data) <-Features_List[,2]

##2.-Extracts only the measurements on the mean and standard deviation for each measurement.
##Create the vector index by searching for "mean" or "std" in variable names, and apply it
mean_std_index <- grep("mean|std",Features_List[,2],ignore.case=TRUE)
Mean_Std_Data <- Merged_Data [,mean_std_index]

##3.-Uses descriptive activity names to name the activities in the data set
##1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING
Train_Labels_Names <-as.character(factor(Train_Labels[,1],labels=Activity_Table[,2]))
Test_Labels_Names <-as.character(factor(Test_Labels[,1],labels=Activity_Table[,2]))

## at this point we also tidy up all data, including all 561 variables
##(it could also be done only to mean and std by using mean_std_index)

##first column will be "Subject ID"
TIDY_DATA <- rbind(Subject_Test,Subject_Train)
colnames(TIDY_DATA) <- "Subject.ID"

##second column will be Activity.Description
TIDY_DATA$Activity.Description <- c(Test_Labels_Names,Train_Labels_Names)

##and then we add all 561 column variables from merged Data Set
TIDY_DATA <- cbind(TIDY_DATA,Merged_Data)

##4.-Appropriately labels the data set with descriptive variable names
## it has already been done during previous steps, can be check with str() or colnames()

##5.-Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
DATA_SET_2 <-aggregate (TIDY_DATA, by=list(Subject.ID=TIDY_DATA$Subject.ID,Activity.Description=TIDY_DATA$Activity.Description),FUN=mean)
DATA_SET_2 <- DATA_SET_2 [,c(-3,-4)]

##alternative method could be with melt, and cast, shown below
##library(reshape2)
##Melt_Data <- melt(TIDY_DATA,id=c("Subject.ID","Activity.Description"),measure.vars=Features_List[,2])
##DATA_SET_2 <- dcast(Melt_Data, Subject.ID + Activity.Description ~ variable, mean)

write.table (DATA_SET_2, file='ASSIGNMENT_TIDY_DATA_SET.txt', row.names=TRUE)

