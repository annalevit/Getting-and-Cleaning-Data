
---
title: "README of the Getting and Cleaning Data course project"
author: "Anna Levit"
date: "Friday, May 22, 2015"
---


## Sourse of the original data and description:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

______________________________________________________________________________________
One script named run_analysis.R performing the clean up of the data is submitted and can be found in the same repo.

The original data should be downloaded and unziped into a working folder on your local machine. The run_analysis.R script should be saved in the same working directory. Then the script should be run. In order to do this, execute the command source('run_analysis.R') in RStudio.



run_analysis.R does the following. 

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The two tidy data sets are written into files UCI_HAR_tidy_data.txt and UCI_HAR_tidy_data_2.txt respectively into your working folder. The detailed description of the transformations made and the resulting data sets can be found in the CodeBook.md file in the same repo.
=======
# Getting-and-Cleaning-Data
for course project
>>>>>>> 863e781a6acb70e1a39dee7f29739ad6821ea1e7
