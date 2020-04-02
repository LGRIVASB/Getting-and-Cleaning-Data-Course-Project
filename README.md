Getting and Cleaning Data **"Course Project: Read Me"**
========================================

## Data Set Description

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from *the accelerometers from the Samsung Galaxy S smartphone*.

This dataset provide the following files for the analysis:

1. **features.txt** - List of all features
2. **activity_labels.txt** - Links the class labels with their activity name
3. **train/X_train.txt** and **test/X_test.txt** - Training and test set.
4. **train/y_train.txt** and **test/y_test.txt** - Training and test labels.

The features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were used for this analysis are: 

1. **mean()**: Mean value
2. **std()**: Standard deviation


## Files
This repository contains the following files:

1. **CodeBook.md** : a code book that describes the variables, the data, and any necessary transformations to clean up the data.

2. **run_analysis.R** : an script for the data preparation. I used as reference  the 5 steps required as described in the course project’s definition:

    + _Merges the training and the test sets_ to create one data set.
    + _Extracts the measurements on the mean and standard deviation_ for each
    measurement.
    + _Uses descriptive activity names_ to name the activities in the data set
    + _Appropriately labels the data set_ with descriptive variable names.
    + From the data set in step 4, _creates a second independent tidy data set_
    with the average of each variable for each activity and each subject.
    
3. **secondTidyData.txt** is the exported second tidy data set after going through all the sequences described above.

 