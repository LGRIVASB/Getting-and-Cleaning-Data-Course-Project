Getting and Cleaning Data **"Course Project: Code Book"**
========================================

## Data Set Description
The data is taken from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). This dataset provide the following files for the analysis:

1. **features.txt** - List of all features
2. **activity_labels.txt** - Links the class labels with their activity name
3. **train/X_train.txt** and **test/X_test.txt** - Training and test set.
4. **train/y_train.txt** and **test/y_test.txt** - Training and test labels.

## Transform Messy Data to Tidy Data

The following steps were conducted to form a tidy dataset:  

##### 1. Assign each data to variables

+ _**features**_ <- The features selected for this database comes from the file **features.txt** which contains 561 rows and 2 columns.
+ _**actLabels**_ <- List of activities performed when the corresponding measurements were taken and its codes (labels) comes from the file **activity_labels.txt** which contains 6 rows and 2 columns.
+ _**testSet_Subjects**_ <- contains test subjects data comes from the file **subject_test.txt** which contains 2947 rows and 1 column.
+ _**testSet_X**_ <- contains recorded features test data comes from the file **X_test.txt** which contains 2947 row and 561 columns.
+ _**testSet_Y**_ <- contains test data of activities code labels comes from the file **y_test.txt** which contains 2947 rows and 1 columns.
+ _**trainSet_Subjects**_ <- contains train subjects data comes from the file **subject_train.txt** which contains 7352 rows and 1 column.
+ _**trainSet_X**_ <- contains recorded features train data comes from the file **X_train.txt** which contains 7352 rows and 561 columns.
+ _**trainSet_Y**_ <- contains train data of activities code labels comes from the file **y_train.txt** which contains 7352 rows and 1 columns.

##### 2. Dealing with duplicates

Created a loop to convert features labels to unique variable names by adding a temporary ID.

##### 3. Merges the training and the test sets to create one data set

+ _**mergeSet_X**_ (10299 rows, 561 columns) is created by merging testSet_X and trainSet_X using _rbind()_ function.
+ _**mergeSet_Y**_ (10299 rows, 1 column) is created by merging testSet_Y and trainSet_Y using _rbind()_ function.
+ _**mergeSet_Subjects**_ (10299 rows, 1 column) is created by merging testSet_Subjects and trainSet_Subjects using _rbind()_ function.
+ _**mergedData**_ (10299 rows, 563 column) is created by merging mergeSet_Subjects, mergeSet_Y and mergeSet_X using _cbind()_ function.

##### 4. Adding descriptive activities names

Used Join to combine **mergedData** with **actLabels**. Added the corresponding column of activities description from actLabels. 

##### 5. Extracts only the measurements on the mean and standard deviation for each variable

+ _**tidyData**_ (10299 rows, 68 columns) is created by subsetting **mergedData**, selecting only columns: Subject, Activity and the measurements on the mean and standard deviation (std) for each variable.

##### 6. Removing temporary ID from the features names

Removed the temporary ID that were use to deal with the duplicate names from the features variables. The function **strsplit** was use it on the names of each columns in **tidyData** set.

##### 7. Appropriately labels the data set with descriptive variable names

+ All **Acc** in column’s name replaced by Accelerometer
+ All **Gyro** in column’s name replaced by Gyroscope
+ All **BodyBody** in column’s name replaced by Body
+ All **Mag** in column’s name replaced by Magnitude
+ All start with character **f** in column’s name replaced by Frequency
+ All start with character **t** in column’s name replaced by Time
+ Renamed **-mean()** to Mean
+ Renamed **-std()** to StandardDeviation

##### 8. From the data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject
+ _**secondTidyData**_ (180 rows, 68 columns) is created by sumarizing **tidyData** taking the means of each variable for each activity and each subject, after groupped by subject and activity.
+ Export secondTidyData into **secondTidyData.txt** file.