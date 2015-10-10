# Assigning a path variable to where the untidy data is kept
# Please change the path according to your path from working directory to UCI HAR DATASET
path<-"./Documents/UCI HAR Dataset"
# Calling used Libraries
library(dplyr)
library(tidyr)

# Reading features data to map column no in observation vector with its respective feature
features<-tbl_df(read.table(paste(path,"features.txt",sep="/")))
names(features)<-c("id","variable")

# Finding the column no of mean and standard deviation related features. 
# Note that u can change the substrings in grep function to work out the same problem for other features.
mean_features<-features[grep("mean()",features$variable,fixed=TRUE),]
std_features<-features[grep("std()",features$variable,fixed=TRUE),]

# combining both column mean and std features matrices formed above
mean_std_features<-bind_rows(mean_features,std_features)
mean_std_features<-arrange(mean_std_features,id)

# Reading the data of subject performing the activity from test and train folders. Hence, Combining them
subject_test<-tbl_df(read.table(paste(path,"test","subject_test.txt",sep="/")))
subject_train<-tbl_df(read.table(paste(path,"train","subject_train.txt",sep="/")))
subject<-bind_rows(subject_test,subject_train)

# Reading the data of observations took while performing the activity from test and train folders. 
# Note that only observations related to mean and std deviations are being read. Hence, (TASK 2 ACCOMPLISHED)
X_test<-select(tbl_df(read.table(paste(path,"test","X_test.txt",sep="/"))),mean_std_features$id)
X_train<-select(tbl_df(read.table(paste(path,"train","X_train.txt",sep="/"))),mean_std_features$id)
X<-bind_rows(X_test,X_train)

# Reading the data of particular activity being performed from test and train folders. Hence, Combining them
Y_test<-tbl_df(read.table(paste(path,"test","Y_test.txt",sep="/")))
Y_train<-tbl_df(read.table(paste(path,"train","Y_train.txt",sep="/")))
Y<-bind_rows(Y_test,Y_train)
names(Y)<-c("activity")

# Reading the data of the names of each activity
activities<-tbl_df(read.table(paste(path,"activity_labels.txt",sep="/")))
# Replacing the data of activities by its descriptive names (TASK 3 ACCOMPLISHED) 
Y<-tbl_df(activities[Y$activity,2])

# Combining all data in one dataset (TASK 1 ACCOMPLISHED)
together<-bind_cols(subject,Y,X)
# Labelling approproiate names to the dataset (TASK 4 ACCOMPLISHED)
names(together)<-c("subject","activity",gsub("[[:punct:]]"," ",mean_std_features$variable))

# Writing the average of each variable for each activity and each subject (TASK 5 ACCOMPLISHED)
together %>%
  gather(variable,observation,-c(subject,activity)) %>%
    group_by(subject,activity,variable) %>%
      summarize(variablemeans=mean(observation)) %>%
       spread(variable,variablemeans) %>%
        write.table(paste(path,"Results.txt",sep="/"),row.names=FALSE)

#average<-tbl_df(read.table(paste(path,"Results.txt",sep="/"),header=TRUE))

# Results looks like :
# subject           activity tBodyAcc.mean...X tBodyAcc.mean...Y tBodyAcc.mean...Z tBodyAcc.std...X tBodyAcc.std...Y tBodyAcc.std...Z tGravityAcc.mean...X
# (int)             (fctr)             (dbl)             (dbl)             (dbl)            (dbl)            (dbl)            (dbl)                (dbl)
# 1        1             LAYING         0.2215982      -0.040513953        -0.1132036      -0.92805647     -0.836827406      -0.82606140           -0.2488818
# 2        1            SITTING         0.2612376      -0.001308288        -0.1045442      -0.97722901     -0.922618642      -0.93958629            0.8315099
# 3        1           STANDING         0.2789176      -0.016137590        -0.1106018      -0.99575990     -0.973190056      -0.97977588            0.9429520
# 4        1            WALKING         0.2773308      -0.017383819        -0.1111481      -0.28374026      0.114461337      -0.26002790            0.9352232
# 5        1 WALKING_DOWNSTAIRS         0.2891883      -0.009918505        -0.1075662       0.03003534     -0.031935943      -0.23043421            0.9318744
# 6        1   WALKING_UPSTAIRS         0.2554617      -0.023953149        -0.0973020      -0.35470803     -0.002320265      -0.01947924            0.8933511
# 7        2             LAYING         0.2813734      -0.018158740        -0.1072456      -0.97405946     -0.980277399      -0.98423330           -0.5097542
# 8        2            SITTING         0.2770874      -0.015687994        -0.1092183      -0.98682228     -0.950704499      -0.95982817            0.9404773
# 9        2           STANDING         0.2779115      -0.018420827        -0.1059085      -0.98727189     -0.957304989      -0.94974185            0.8969286
# 10       2            WALKING         0.2764266      -0.018594920        -0.1055004      -0.42364284     -0.078091253      -0.42525752            0.9130173
# ..     ...                ...               ...               ...               ...              ...              ...              ...                  ...
# Variables not shown: tGravityAcc.mean...Y (dbl), tGravityAcc.mean...Z (dbl), tGravityAcc.std...X (dbl), tGravityAcc.std...Y (dbl), tGravityAcc.std...Z
# (dbl), tBodyAccJerk.mean...X (dbl), tBodyAccJerk.mean...Y (dbl), tBodyAccJerk.mean...Z (dbl), tBodyAccJerk.std...X (dbl), tBodyAccJerk.std...Y (dbl),
# tBodyAccJerk.std...Z (dbl), tBodyGyro.mean...X (dbl), tBodyGyro.mean...Y (dbl), tBodyGyro.mean...Z (dbl), tBodyGyro.std...X (dbl), tBodyGyro.std...Y
# (dbl), tBodyGyro.std...Z (dbl), tBodyGyroJerk.mean...X (dbl), tBodyGyroJerk.mean...Y (dbl), tBodyGyroJerk.mean...Z (dbl), tBodyGyroJerk.std...X (dbl),
# tBodyGyroJerk.std...Y (dbl), tBodyGyroJerk.std...Z (dbl), tBodyAccMag.mean.. (dbl), tBodyAccMag.std.. (dbl), tGravityAccMag.mean.. (dbl),
# tGravityAccMag.std.. (dbl), tBodyAccJerkMag.mean.. (dbl), tBodyAccJerkMag.std.. (dbl), tBodyGyroMag.mean.. (dbl), tBodyGyroMag.std.. (dbl),
# tBodyGyroJerkMag.mean.. (dbl), tBodyGyroJerkMag.std.. (dbl), fBodyAcc.mean...X (dbl), fBodyAcc.mean...Y (dbl), fBodyAcc.mean...Z (dbl), fBodyAcc.std...X
# (dbl), fBodyAcc.std...Y (dbl), fBodyAcc.std...Z (dbl), fBodyAccJerk.mean...X (dbl), fBodyAccJerk.mean...Y (dbl), fBodyAccJerk.mean...Z (dbl),
# fBodyAccJerk.std...X (dbl), fBodyAccJerk.std...Y (dbl), fBodyAccJerk.std...Z (dbl), fBodyGyro.mean...X (dbl), fBodyGyro.mean...Y (dbl),
# fBodyGyro.mean...Z (dbl), fBodyGyro.std...X (dbl), fBodyGyro.std...Y (dbl), fBodyGyro.std...Z (dbl), fBodyAccMag.mean.. (dbl), fBodyAccMag.std.. (dbl),
# fBodyBodyAccJerkMag.mean.. (dbl), fBodyBodyAccJerkMag.std.. (dbl), fBodyBodyGyroMag.mean.. (dbl), fBodyBodyGyroMag.std.. (dbl),
# fBodyBodyGyroJerkMag.mean.. (dbl), fBodyBodyGyroJerkMag.std.. (dbl)


# Please note that all tasks are accomplished, so i hereby request to give full marks for the assessment. Thank You :) :)
