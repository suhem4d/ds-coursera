#load files

activity<-read.csv(file="./UCI_HAR_Dataset/activity_labels.txt",header=FALSE)
subtest<-read.csv(file="./UCI_HAR_Dataset/test/subject_test.txt",header=FALSE)
xtest<-read.csv(file="./UCI_HAR_Dataset/test/X_test.txt",header=FALSE,sep="")
ytest<-read.csv(file="./UCI_HAR_Dataset/test/y_test.txt",header=FALSE)
subtrain<-read.csv(file="./UCI_HAR_Dataset/train/subject_train.txt",header=FALSE)
xtrain<-read.csv(file="./UCI_HAR_Dataset/train/X_train.txt",header=FALSE,sep="")
ytrain<-read.csv(file="./UCI_HAR_Dataset/train/y_train.txt",header=FALSE)

#Step1:
#merge test and train files columnwise(cbind)
testdata<-cbind(xtest,ytest,subtest)
traindata<-cbind(xtrain,ytrain,subtrain)

#Step2:
#merge train and test data (rbind)
mergedDataSet<- rbind(testdata,traindata)

#Step3:
#extract only mean and std columns
"1 tBodyAcc-mean()-X
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
6 tBodyAcc-std()-Z
41 tGravityAcc-mean()-X
42 tGravityAcc-mean()-Y
43 tGravityAcc-mean()-Z
44 tGravityAcc-std()-X
45 tGravityAcc-std()-Y
46 tGravityAcc-std()-Z
81 tBodyAccJerk-mean()-X
82 tBodyAccJerk-mean()-Y
83 tBodyAccJerk-mean()-Z
84 tBodyAccJerk-std()-X
85 tBodyAccJerk-std()-Y
86 tBodyAccJerk-std()-Z
121 tBodyGyro-mean()-X
122 tBodyGyro-mean()-Y
123 tBodyGyro-mean()-Z
124 tBodyGyro-std()-X
125 tBodyGyro-std()-Y
126 tBodyGyro-std()-Z
161 tBodyGyroJerk-mean()-X
162 tBodyGyroJerk-mean()-Y
163 tBodyGyroJerk-mean()-Z
164 tBodyGyroJerk-std()-X
165 tBodyGyroJerk-std()-Y
166 tBodyGyroJerk-std()-Z
201 tBodyAccMag-mean()
202 tBodyAccMag-std()
214 tGravityAccMag-mean()
215 tGravityAccMag-std()
227 tBodyAccJerkMag-mean()
228 tBodyAccJerkMag-std()
240 tBodyGyroMag-mean()
241 tBodyGyroMag-std()
253 tBodyGyroJerkMag-mean()
254 tBodyGyroJerkMag-std()
266 fBodyAcc-mean()-X
267 fBodyAcc-mean()-Y
268 fBodyAcc-mean()-Z
269 fBodyAcc-std()-X
270 fBodyAcc-std()-Y
271 fBodyAcc-std()-Z
345 fBodyAccJerk-mean()-X
346 fBodyAccJerk-mean()-Y
347 fBodyAccJerk-mean()-Z
348 fBodyAccJerk-std()-X
349 fBodyAccJerk-std()-Y
350 fBodyAccJerk-std()-Z
424 fBodyGyro-mean()-X
425 fBodyGyro-mean()-Y
426 fBodyGyro-mean()-Z
427 fBodyGyro-std()-X
428 fBodyGyro-std()-Y
429 fBodyGyro-std()-Z
503 fBodyAccMag-mean()
504 fBodyAccMag-std()
516 fBodyBodyAccJerkMag-mean()
517 fBodyBodyAccJerkMag-std()
529 fBodyBodyGyroMag-mean()
530 fBodyBodyGyroMag-std()
542 fBodyBodyGyroJerkMag-mean()
543 fBodyBodyGyroJerkMag-std()"
library(dplyr)
mergedSubSet <- subset(mergedDataSet, select = c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,
                                                 162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,
                                                 270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,
                                                 530,542,543,562,563))


#Step4:
# descriptive activity name

mergedSubSet$V1.1<-gsub("1","WALKING",mergedSubSet$V1.1)
mergedSubSet$V1.1<-gsub("2"," WALKING_UPSTAIRS",mergedSubSet$V1.1)
mergedSubSet$V1.1<-gsub("3"," WALKING_DOWNSTAIRS",mergedSubSet$V1.1)
mergedSubSet$V1.1<-gsub("4"," SITTING",mergedSubSet$V1.1)
mergedSubSet$V1.1<-gsub("5"," STANDING",mergedSubSet$V1.1)
mergedSubSet$V1.1<-gsub("6"," LAYING",mergedSubSet$V1.1)

#step5:
names(mergedSubSet)<-c("tBodyAcc-mean-X",
                       "tBodyAcc-mean-Y",
                       "tBodyAcc-mean-Z",
                       "tBodyAcc-std-X",
                       "tBodyAcc-std-Y",
                       "tBodyAcc-std-Z",
                       "tGravityAcc-mean-X",
                       "tGravityAcc-mean-Y",
                       "tGravityAcc-mean-Z",
                       "tGravityAcc-std-X",
                       "tGravityAcc-std-Y",
                       "tGravityAcc-std-Z",
                       "tBodyAccJerk-mean-X",
                       "tBodyAccJerk-mean-Y",
                       "tBodyAccJerk-mean-Z",
                       "tBodyAccJerk-std-X",
                       "tBodyAccJerk-std-Y",
                       "tBodyAccJerk-std-Z",
                       "tBodyGyro-mean-X",
                       "tBodyGyro-mean-Y",
                       "tBodyGyro-mean-Z",
                       "tBodyGyro-std-X",
                       "tBodyGyro-std-Y",
                       "tBodyGyro-std-Z",
                       "tBodyGyroJerk-mean-X",
                       "tBodyGyroJerk-mean-Y",
                       "tBodyGyroJerk-mean-Z",
                       "tBodyGyroJerk-std-X",
                       "tBodyGyroJerk-std-Y",
                       "tBodyGyroJerk-std-Z",
                       "tBodyAccMag-mean",
                       "tBodyAccMag-std",
                       "tGravityAccMag-mean",
                       "tGravityAccMag-std",
                       "tBodyAccJerkMag-mean",
                       "tBodyAccJerkMag-std",
                       "tBodyGyroMag-mean",
                       "tBodyGyroMag-std",
                       "tBodyGyroJerkMag-mean",
                       "tBodyGyroJerkMag-std",
                       "fBodyAcc-mean-X",
                       "fBodyAcc-mean-Y",
                       "fBodyAcc-mean-Z",
                       "fBodyAcc-std-X",
                       "fBodyAcc-std-Y",
                       "fBodyAcc-std-Z",
                       "fBodyAccJerk-mean-X",
                       "fBodyAccJerk-mean-Y",
                       "fBodyAccJerk-mean-Z",
                       "fBodyAccJerk-std-X",
                       "fBodyAccJerk-std-Y",
                       "fBodyAccJerk-std-Z",
                       "fBodyGyro-mean-X",
                       "fBodyGyro-mean-Y",
                       "fBodyGyro-mean-Z",
                       "fBodyGyro-std-X",
                       "fBodyGyro-std-Y",
                       "fBodyGyro-std-Z",
                       "fBodyAccMag-mean",
                       "fBodyAccMag-std",
                       "fBodyBodyAccJerkMag-mean",
                       "fBodyBodyAccJerkMag-std",
                       "fBodyBodyGyroMag-mean",
                       "fBodyBodyGyroMag-std",
                       "fBodyBodyGyroJerkMag-mean",
                       "fBodyBodyGyroJerkMag-std",
                       "Activity",
                       "Subject")

lapply(mergedSubSet,class)

#fixing class type for 3 columns from 'list' to 'numeric'
#install.packages("taRifx")
library( taRifx )
mergedSubSet <- japply( mergedSubSet, which(sapply(mergedSubSet, class)=="list"), as.numeric )
#convert subject to character class from integer class
mergedSubSet$Subject<-as.character(mergedSubSet$Subject)


#Step6
#calculate average of each measure for each activity of each subject
library(dplyr)

avgdataset<-mergedSubSet %>% 
  group_by(Activity,Subject) %>% 
  summarise_each (funs(mean))

write.table(avgdataset,file="./UCI_HAR_Dataset/tidydata.txt",row.names = FALSE,col.names = TRUE)


