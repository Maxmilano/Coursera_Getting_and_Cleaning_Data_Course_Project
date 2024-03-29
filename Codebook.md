Codebook
========================================================

The CodeBook explains what the data set has: names of variables, a quick explanation of what they are, type of the variable (char, integer, etc.).

### Data Source:
 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Variables:

After the analysis by run_analysis.R the variables are: 

Tidy_Data.txt :         180 obs. of  68 variables

Subject: (Integer vector) Subjects ID of the original experiments, both the test and the training. Number from 1 to 30.

Activity: (Factor Vector) The activites conducted by the subjects, respectively, WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING  LAYING 

All remaining variables (numeric vectors): they present the mean of the particular activity of a sensor for all the trials of the subject. Names of the variables can be discerned with the following information by the feature_info.txt file in the original dataset.
In particular

"_The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz_. 

_Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag)_. 

_Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)_. 

_These signals were used to estimate variables of the feature vector for each pattern:_  
_'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions._" (All credits to the original datasets and Authors, cfr. Readme.MD)

All the variables have been reduced to the one with information on mean and standard deviation. In the dataset, the suffix "Mean" and "Std" therefore reflects what was estimated for that variable.

Example: 

```{r}
"tBodyAccMeanX"
```

reads "Mean time domain signal for Body Acceleration in the direction of the axis X"

#### Note:

The variables from 3 to 80 have been formatted for readibility:

* mean reads Mean

* std reads Std
 
* () brackets omitted

* variables with BodyBody corrected as Body


Check the run_analysis.R for detailed description of all the tranformation applied to the original data.
