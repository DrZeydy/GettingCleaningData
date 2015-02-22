run_analysis <- function(){
  library(dplyr)
  library(reshape2)
  
  ## 1. Merge the training and test sets to create one data set
  ## Train data set: "./train/X_train.txt"
  ## Test data set:  "./test/X_test.txt"
  setwd("C:/zol/R/data//getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/") ## delete
  features <- read.table("./features.txt", stringsAsFactors=FALSE)
  allData <- rbind(read.table("./train/X_train.txt"), read.table("./test/X_test.txt"))
  names(allData) <- make.names(features[,2], unique=TRUE, allow_ = TRUE)
  ## subjects
  subjects <- rbind(read.table("./train/subject_train.txt"), read.table("./test/subject_test.txt"))
  names(subjects) <- "Subject"
  ## activity
  activity <- rbind(read.table("./train/y_train.txt"), read.table("./test/y_test.txt"))
  names(activity) <- "Activity"
  
  allData <- cbind(subjects, activity, allData)
  
  ## 2. Extract only the measurements on the mean and standard deviation for each measurement
  extractedData <- select(allData, Subject, Activity, contains(".mean."), contains("std"))
  
  ## 3. Use descriptive activity names to name the activities in the data set
  activityLabels <- read.table("./activity_labels.txt")
  extractedData$Activity <- activityLabels[extractedData$Activity,2]
  
  ## 4. Appropriately label data set with descriptive variable names
  ## Changing variable names to expand on original labels
  ## This was a pain to code and very inefficient move of data.  
  ## Please comment if there is a better way.
  extractedData <- rename(extractedData, Mean.time.Body.Acceleration.X = tBodyAcc.mean...X)
  extractedData <- rename(extractedData, Mean.time.Body.Acceleration.Y = tBodyAcc.mean...Y)
  extractedData <- rename(extractedData, Mean.time.Body.Acceleration.Z = tBodyAcc.mean...Z)
  extractedData <- rename(extractedData, Mean.time.Gravity.Acceleration.X = tGravityAcc.mean...X)
  extractedData <- rename(extractedData, Mean.time.Gravity.Acceleration.Y = tGravityAcc.mean...Y)
  extractedData <- rename(extractedData, Mean.time.Gravity.Acceleration.Z = tGravityAcc.mean...Z)
  extractedData <- rename(extractedData, Mean.time.Body.Acceleration.Jerk.X = tBodyAccJerk.mean...X)
  extractedData <- rename(extractedData, Mean.time.Body.Acceleration.Jerk.Y = tBodyAccJerk.mean...Y)
  extractedData <- rename(extractedData, Mean.time.Body.Acceleration.Jerk.Z = tBodyAccJerk.mean...Z)  
  extractedData <- rename(extractedData, Mean.time.Body.Gyration.X = tBodyGyro.mean...X)
  extractedData <- rename(extractedData, Mean.time.Body.Gyration.Y = tBodyGyro.mean...Y)
  extractedData <- rename(extractedData, Mean.time.Body.Gyration.Z = tBodyGyro.mean...Z)  
  extractedData <- rename(extractedData, Mean.time.Body.Gyration.Jerk.X = tBodyGyroJerk.mean...X)
  extractedData <- rename(extractedData, Mean.time.Body.Gyration.Jerk.Y = tBodyGyroJerk.mean...Y)
  extractedData <- rename(extractedData, Mean.time.Body.Gyration.Jerk.Z = tBodyGyroJerk.mean...Z)  
  extractedData <- rename(extractedData, Mean.time.Body.Acceleration.Magnitude = tBodyAccMag.mean..)
  extractedData <- rename(extractedData, Mean.time.Gravity.Acceleration.Magnitude = tGravityAccMag.mean..)
  extractedData <- rename(extractedData, Mean.time.Body.Acceleration.Jerk.Magnitude = tBodyAccJerkMag.mean..)
  extractedData <- rename(extractedData, Mean.time.Body.Gyration.Magnitude = tBodyGyroMag.mean..)
  extractedData <- rename(extractedData, Mean.time.Body.Gyration.Jerk.Magnitude = tBodyGyroJerkMag.mean..)
  extractedData <- rename(extractedData, Mean.frequency.Body.Acceleration.X = fBodyAcc.mean...X)
  extractedData <- rename(extractedData, Mean.frequency.Body.Acceleration.Y = fBodyAcc.mean...Y)
  extractedData <- rename(extractedData, Mean.frequency.Body.Acceleration.Z = fBodyAcc.mean...Z)
  extractedData <- rename(extractedData, Mean.frequency.Body.Acceleration.Jerk.X = fBodyAccJerk.mean...X)
  extractedData <- rename(extractedData, Mean.frequency.Body.Acceleration.Jerk.Y = fBodyAccJerk.mean...Y)
  extractedData <- rename(extractedData, Mean.frequency.Body.Acceleration.Jerk.Z = fBodyAccJerk.mean...Z)  
  extractedData <- rename(extractedData, Mean.frequency.Body.Gyration.X = fBodyGyro.mean...X)
  extractedData <- rename(extractedData, Mean.frequency.Body.Gyration.Y = fBodyGyro.mean...Y)
  extractedData <- rename(extractedData, Mean.frequency.Body.Gyration.Z = fBodyGyro.mean...Z)
  extractedData <- rename(extractedData, Mean.frequency.Body.Acceleration.Magnitude = fBodyAccMag.mean..)
  extractedData <- rename(extractedData, Mean.frequency.Body.Acceleration.Jerk.Magnitude = fBodyBodyAccJerkMag.mean..)
  extractedData <- rename(extractedData, Mean.frequency.Body.Gyration.Magnitude = fBodyBodyGyroMag.mean..)
  extractedData <- rename(extractedData, Mean.frequency.Body.Gyration.Jerk.Magnitude = fBodyBodyGyroJerkMag.mean..)
  
  extractedData <- rename(extractedData, StdDev.time.Body.Acceleration.X = tBodyAcc.std...X)
  extractedData <- rename(extractedData, StdDev.time.Body.Acceleration.Y = tBodyAcc.std...Y)
  extractedData <- rename(extractedData, StdDev.time.Body.Acceleration.Z = tBodyAcc.std...Z)
  extractedData <- rename(extractedData, StdDev.time.Gravity.Acceleration.X = tGravityAcc.std...X)
  extractedData <- rename(extractedData, StdDev.time.Gravity.Acceleration.Y = tGravityAcc.std...Y)
  extractedData <- rename(extractedData, StdDev.time.Gravity.Acceleration.Z = tGravityAcc.std...Z)
  extractedData <- rename(extractedData, StdDev.time.Body.Acceleration.Jerk.X = tBodyAccJerk.std...X)
  extractedData <- rename(extractedData, StdDev.time.Body.Acceleration.Jerk.Y = tBodyAccJerk.std...Y)
  extractedData <- rename(extractedData, StdDev.time.Body.Acceleration.Jerk.Z = tBodyAccJerk.std...Z)  
  extractedData <- rename(extractedData, StdDev.time.Body.Gyration.X = tBodyGyro.std...X)
  extractedData <- rename(extractedData, StdDev.time.Body.Gyration.Y = tBodyGyro.std...Y)
  extractedData <- rename(extractedData, StdDev.time.Body.Gyration.Z = tBodyGyro.std...Z)  
  extractedData <- rename(extractedData, StdDev.time.Body.Gyration.Jerk.X = tBodyGyroJerk.std...X)
  extractedData <- rename(extractedData, StdDev.time.Body.Gyration.Jerk.Y = tBodyGyroJerk.std...Y)
  extractedData <- rename(extractedData, StdDev.time.Body.Gyration.Jerk.Z = tBodyGyroJerk.std...Z)
  extractedData <- rename(extractedData, StdDev.time.Body.Acceleration.Magnitude = tBodyAccMag.std..)
  extractedData <- rename(extractedData, StdDev.time.Gravity.Acceleration.Magnitude = tGravityAccMag.std..)
  extractedData <- rename(extractedData, StdDev.time.Body.Acceleration.Jerk.Magnitude = tBodyAccJerkMag.std..)
  extractedData <- rename(extractedData, StdDev.time.Body.Gyration.Magnitude = tBodyGyroMag.std..)
  extractedData <- rename(extractedData, StdDev.time.Body.Gyration.Jerk.Magnitude = tBodyGyroJerkMag.std..)
  extractedData <- rename(extractedData, StdDev.frequency.Body.Acceleration.X = fBodyAcc.std...X)
  extractedData <- rename(extractedData, StdDev.frequency.Body.Acceleration.Y = fBodyAcc.std...Y)
  extractedData <- rename(extractedData, StdDev.frequency.Body.Acceleration.Z = fBodyAcc.std...Z)
  extractedData <- rename(extractedData, StdDev.frequency.Body.Acceleration.Jerk.X = fBodyAccJerk.std...X)
  extractedData <- rename(extractedData, StdDev.frequency.Body.Acceleration.Jerk.Y = fBodyAccJerk.std...Y)
  extractedData <- rename(extractedData, StdDev.frequency.Body.Acceleration.Jerk.Z = fBodyAccJerk.std...Z)  
  extractedData <- rename(extractedData, StdDev.frequency.Body.Gyration.X = fBodyGyro.std...X)
  extractedData <- rename(extractedData, StdDev.frequency.Body.Gyration.Y = fBodyGyro.std...Y)
  extractedData <- rename(extractedData, StdDev.frequency.Body.Gyration.Z = fBodyGyro.std...Z)
  extractedData <- rename(extractedData, StdDev.frequency.Body.Acceleration.Magnitude = fBodyAccMag.std..)
  extractedData <- rename(extractedData, StdDev.frequency.Body.Acceleration.Jerk.Magnitude = fBodyBodyAccJerkMag.std..)
  extractedData <- rename(extractedData, StdDev.frequency.Body.Gyration.Magnitude = fBodyBodyGyroMag.std..)
  extractedData <- rename(extractedData, StdDev.frequency.Body.Gyration.Jerk.Magnitude = fBodyBodyGyroJerkMag.std..)
  
  ## 5. Create a second, independent tidy data set with the average of each variable for each
  ##    activity and each subject.  Create a txt file with write.table() using row.name=FALSE
  measure_vars <- as.character(names(extractedData[3:68]))
  meltedData <- melt(extractedData,id=c("Subject","Activity"), measure.vars=measure_vars)
  
  ## This is the "long" format of the data where each row has the 
  ## Subject, Activity, variable and mean value of the variable
  tidyData <- dcast(meltedData, Subject + Activity + variable ~ ., mean)
  names(tidyData)[4] <- "mean.variable.value"
  write.table(tidyData, file="./tidydata.txt", row.name=FALSE)
}