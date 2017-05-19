---
title: "ReadMe"
author: "Hemali"
date: "5/19/2017"
output: html_document
---
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

===================================================
The tidydata dataset includes the following files:

- 'activity_labels.txt': Links the class labels with their activity name.

-'train/subject_test.txt' :Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.
=========================================
Notes:
1)In order to build the tidy data set we have combined test files and train files columnwise with subject and training lables test and train files respectively.

2)We have combined test and train data row wise in the next step. This gives us the final data set to work with this assignment.

3) The data set of our interest inlcudes mean and std deviation measurements. We are extracting columns of our interest in the step #3

4) Step#4 modifies the activity level, with replacing nuremic value with descriptive values for ease of use.

5) Step#5 gives meaningful names to the dataset variables. It also checks for an appropriate class type for each column.

6)Step#6 creates tidy datset of mean value for each meansurment of each activity of every subject and stores final dataset in a tidydata.txt file.

=========================================
License:
==========================================
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
