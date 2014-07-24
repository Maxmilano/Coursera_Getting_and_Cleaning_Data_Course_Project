README
==================================
This repo contains the final course project for the course "Getting and Cleaning Data" of the Data Science Specialization by Johns Hopkins Bloomberg School of Public Health and Coursera.

The files inside are:

README.md = /

Codebook.md =  Describes the variables in the final dataset, Tidy_Data.txt.

run_analysis.R = Performs the following passages:

 Preliminary Step: Download and unzip the source data.

 Step 1: Merges the Training and Test datasets into the single dataset rawData

 Step 2: Trim the dataset rawData by keeping only the variables related with mean and standard deviation, renaming it     reduced_rawData

 Step 3: Substitute the activities labels with their descriptive form

 Step 4: Modifies the variable names to make them more fitting with the "tidiness" principle, and labels them to the the dataset reduced_rawData 

 Step 5: Creates the new dataset "tidy" with the average of each variable for each activity and each subject of reduced_rawData, and prints it to a .txt file

Comments are present to help the understanding of the logic of the code.

All credits for the original dataset goes to:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.