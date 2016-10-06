#CodeBook-Getting and Cleaning Data Course Project

##Variables

Following variables are used in this analysis


| Variables  | Source                                         | Class      | Usage                                        |
|------------|------------------------------------------------|------------|----------------------------------------------|
| features   | ./data/UCI HAR Dataset/features.txt            | data.frame | Initialise features                          |
| activity   | ./data/UCI HAR Dataset/activity_labels.txt     | data.frame | Initialise activities                        |
| xtest      | ./data/UCI HAR Dataset/test/X_test.txt         | data.frame | X_test  data                                 |
| xtrain     | ./data/UCI HAR Dataset/train/X_train.txt       | data.frame | X_train data                                 |
| xall       | rbind(xtest,xtrain)                            | data.frame | All X data                                   |
| names      | names(xall)                                    | character  | Names of X                                   |
| stdnames   | names[grep("std\\(\\)",names)]                 | character  | Feature names with standard deviation        |
| meannames  | names[grep("mean\\(\\)",names)]                | character  | Fetaure names with mean                      |
| selnames   | c(meannames,stdnames)                          | character  | Names with std deviation and mean            |
| datauseX   | subset(xall,select=selnames)                   | data.frame | X data with selected means and std deviation |
| ytest      | ./data/UCI HAR Dataset/test/Y_test.txt         | data.frame | Y_test data                                  |
| ytrain     | ./data/UCI HAR Dataset/train/Y_train.txt       | data.frame | Y_train data                                 |
| datauseY   | inner_join(yall,activity)                      | data.frame | All Y train data                             |
| stest      | ./data/UCI HAR Dataset/test/subject_test.txt   | data.frame | subject_test data                            |
| strain     | ./data/UCI HAR Dataset/train/subject_train.txt | data.frame | subject_train data                           |
| sall       | rbind(stest,strain)                            | data.frame | subject all data                             |
| grouped    | group_by(datauseX,Subject,Activity)            | grouped_df | Data grouped by Subject and Activity         |
| summarised | summarise_each(grouped,funs(mean))             | grouped_df | Summarised data with mean                    |