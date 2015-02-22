---
title: "CodeBook"
author: "Zeydy Ortiz"
date: "Saturday, February 21, 2015"
output: html_document
---

This document describes the data, the variables, and transformations that were performed to clean up the data for the "Getting and Cleaning Data" course project

---
Data
---
The data for this project was downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data represents data collected from accelerometers from the Samsung Galaxy S smartphone. A full description is available:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

After downloading the data and unzipping, changed directory to:
"./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/""
where the following files and directories were extracted:
* test - directory for test dataset
* train - directory for training dataset
* activity_labels.txt - labels for the activities
* features.txt - column labels for the variables
* features_info.txt - description of the variables
* README.txt - information about the files in the dataset

---
Variables
---
Variables are described in the 'features_info.txt' file included in the dataset.  From the description:
"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain
 signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order
 low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body
 and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of
 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and 
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, 
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

---
Transformations
---
To create the tidy data set, I did the following:
(1) Merged the training and the test sets to create one data set.
(2) Extracted only the measurements on the mean and standard deviation for each measurement. 
(3) Used descriptive activity names to name the activities in the data set using names from activity_label.txt
(4) Labeled the data set with descriptive variable names by expanding on the short names from features.txt.  In particular, the following substitions were made:
- prefix 't' -> "time"
- prefix 'f' -> "frequency"
- "Acc" -> "Acceleration"
- "Gyro" -> "Gyration"
- "Mag" -> "Magnitude"
- "std" -> "StdDev"
(5) Included in the tidy data set only the average of each variable (mean.variable.name) for each activity and each subject.



This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}
summary(cars)
```

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
