
library(dplyr)
## Reads and merges the training and the test sets to create one data set of each type.
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")

subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")

act_test<-read.table("UCI HAR Dataset/test/y_test.txt")
act_train<-read.table("UCI HAR Dataset/train/y_train.txt")

X<-rbind(X_test,X_train)
subject<-rbind(subject_test,subject_train)
act<-rbind(act_test,act_train)

## Extracts only the measurements on the mean and standard deviation for each measurement. 
features<-read.table("UCI HAR Dataset/features.txt")
ind_mean_features<-grep("mean",features[,2])
ind_std_features<-grep("std",features[,2])
ind_good_features<-append(ind_mean_features, ind_std_features, after = length(ind_mean_features))
ind_good_features<-sort(ind_good_features)
dt_mean_std<-X[,ind_good_features]
## Labels the data set with descriptive variable names. 
names(dt_mean_std)<-features[ind_good_features,2]
names(dt_mean_std) <- tolower(names(dt_mean_std))

## Replaces activities integer lables by descriptive activity names
act_lables<-read.table("UCI HAR Dataset/activity_labels.txt")
for (i in act_lables[,1]){ act[,1]<-gsub(i,act_lables[i,2],act[,1]) }

## Merges the sets into one tidy data set
dt<-cbind(subject,act,dt_mean_std)
## Labels the data set with descriptive variable names.
names(dt) <- gsub("\\(|\\)", "", names(dt))
names(dt) <- gsub("-", "", names(dt))
names(dt)[1]<-"subject"
names(dt)[2]<-"activity"

## Writes the tidy set into file
write.table(dt, "UCI_HAR_tidy_data.txt")

## Creates a second, independent tidy data set with the average of each variable 
## for each activity and each subject and writes it into file.
temp_gr<-group_by(dt,subject,activity)
dt2<-summarise_each(temp_gr,funs(mean))
write.table(dt2,"UCI_HAR_tidy_data_2.txt",row.name=FALSE) 

