##Loading dplyr library. This library has methods which are used in this script

library(dplyr);

##Download file from the location as as specified in the assignment and save in 
##data folder inside workspace 
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","./data/fuci.zip")

##Unzip the file. Extacted files will be under "./data/UCI HAR Dataset"
unzip("./data/fuci.zip",exdir = "./data")

##Extract featurs and activity data and stored them in the variables 
features<-read.table("./data/UCI HAR Dataset/features.txt")
activity<-read.table("./data/UCI HAR Dataset/activity_labels.txt")

##extract files X_test.txt and X_train.txt from test and train folder respectively and combine them as xall
xtest<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
xtrain<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
xall<-rbind(xtest,xtrain)
  

##Assign the column names to xall data set by from features
names(xall)<-features$V2;
names<-names(xall);

##Extracts only the measurements on the mean and standard deviation for 
## each measurement as datauseX. 

stdnames<-names[grep("std\\(\\)",names)];
meannames<-names[grep("mean\\(\\)",names)];
selnames<-c(meannames,stdnames);
datauseX<-subset(xall,select=selnames)

##extract files Y_test.txt and Y_train.txt from test and train folder 
##respectively and combine them as yall

ytest<-read.table("./data/UCI HAR Dataset/test/Y_test.txt");
ytrain<-read.table("./data/UCI HAR Dataset/train/Y_train.txt");
yall<-rbind(ytest,ytrain);

##join yall dataset with activity data set to get the descriptive 
##names of the activities
datauseY<-inner_join(yall,activity);

##Add the Activity column to datauseX data set
datauseX$Activity <-datauseY$V2;

##extract files subject_test.txt and subject_train.txt from test and train folder
##respectively and combine them as sall

stest<-read.table("./data/UCI HAR Dataset/test/subject_test.txt");
strain<-read.table("./data/UCI HAR Dataset/train/subject_train.txt");
sall<-rbind(stest,strain);

##Add the Subject column to datauseX data set

datauseX$Subject<-sall$V1;

##Using group_by from dplyr package, create a grouped dataset by
##Subject and Activity
grouped <-group_by(datauseX,Subject,Activity);

##create a second, independent tidy data set with the average
## of each variable for each activity and each subject using summarise_each
summarised <- summarise_each(grouped,funs(mean));
names(summarised)<-gsub("\\(\\)","",names(summarised));

#save the tidy data set to a file.
write.table(summarised,"./data/tidy.txt",row.name=FALSE);

##End



