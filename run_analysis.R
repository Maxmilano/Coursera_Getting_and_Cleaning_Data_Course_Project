###Preliminary step: Set the working directory, download the file and unzip the data

setwd("~/Data_Science/Getting_and_cleaning_data/data/Assignment")

FileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip '
       
download.file(FileUrl, destfile="./dataset.zip"))       

unzip("dataset.zip")

###Step 1: Merging the training and the test sets to create one data set.

 ##Step 1.0.1 Read the data that we need

x_train <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)

x_test <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)

activity_labels <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

dim(x_train)  #Check if the number of variables coincides

dim(x_test)

 ##Step 1.0.2 Agglomerate the train and test sets with labels and subjects. This can be done easily by creating new columns and assigning the desired dataset to the new column.

x_train[, 562] <- read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
x_train[, 563] <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

x_test[, 562] <- read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
x_test[, 563] <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

 ##Step 1.0.3 Finally merge the two extended dataset into the raw dataset

rawData <- rbind(x_train, x_test)

View(rawData)

###Step 2: Extracting only the measurements on the mean and standard deviation for each measurement.

 ##Step 2.0.1 Read the features file

features <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE, stringsAsFactors = FALSE)
dim(features)

 ##Step 2.0.2 Subset the variables with mean and standard deviation. All praise to the grep function.

columns <- grep("(-mean\\(\\)|-std\\(\\))", features[,2])
features <- features[columns,]
dim(features)   #We can check how the feature data frame was reduced

 ##Step 2.0.3 Subset the raw data by keeping the columns that are still in the features data table. Problem is, keep the labels and subject columns!

columns <- c(columns, 562, 563)

rawData <- rawData[,columns]

reduced_rawData <- rawData

###Step 3: Use descriptive activity names to name the activities in the data set

 ##Step 3.0.1 The activity label file was already read, so we just need to paste the labels

reduced_rawData$562 = factor(reduced_rawData$562, levels=c(1,2,3,4,5,6), labels=activity_labels$V2)

###Step 4: Appropriately label the data set with descriptive variable names.

 ##Step 4.0.1 first we use the features names, and we also change the name for the activity labels and subjects columns

colnames(reduced_rawData) <- c(features$V2, "ActivityLabel", "Subject")

 ##Step 4.0.2 Second, we can also try to make the variables names more readable by acting on the features data and reapplying colnames

features[,2] <- gsub('-mean', 'Mean', features[,2])
features[,2] <- gsub('-std', 'Std', features[,2])
features[,2] <- gsub('[-()]', '', features[,2])
features[,2] <- gsub("BodyBody", 'Body', features[,2])
colnames(reduced_rawData) <- c(features$V2, "ActivityLabel", "Subject")
View(reduced_rawData)

###Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

 ##Step 5.0.1 Using the aggregate function to subset a new dataset, and eliminating the last two columns, that have no sense

tidy <- aggregate(reduced_rawData, by=list(activity = reduced_rawData$ActivityLabel, subject=reduced_rawData$Subject), mean)
tidy$Subject <- NULL
tidy$ActivityLabel <- NULL
names(tidy)[names(tidy) == 'activity'] <- 'Activity'  #Here I just wanted capital letters for these columns
names(tidy)[names(tidy) == 'subject'] <- 'Subject'
tidy <- tidy[, c(2,1,3:68)]                           #Here I just wanted the Subject column to be the first

 ##Step 5.0.2 Print the tidy dataset to a file. I've chosen a .csv

write.table(tidy, "Tidy_Data.csv", sep=",")


