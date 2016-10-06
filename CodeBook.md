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


##Data

Following data is used in this analysis

| Data                    | Definition                                                                          |
|-------------------------|-------------------------------------------------------------------------------------|
| features.txt            | List of all features.                                                               |
| activity_labels.txt     | Links the class labels with their activity name.                                    |
| train/X_train.txt       | Training set.                                                                       |
| train/y_train.txt       | Training labels.                                                                    |
| test/X_test.txt         | Test set.                                                                           |
| test/y_test.txt         | Test labels.                                                                        |
| test/subject_test.txt   | Identifies the test subjects who performed the activity for each window sample.     |
| train/subject_train.txt | Identifies the training subjects who performed the activity for each window sample. |


##Transformations

Following are the examples of various transformations that are present in the script.
Please note, some of the transformations are repeated so the following lists the distinct ones.

| Transformations                     | Description                                                                                                          |
|-------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| rbind(xtest,xtrain)                 | Row bind , combine data frames by row                                                                                |
| inner_join(yall,activity)           | Return all rows from x where there are matching values in y, and all columns from x and y.                           |
| subset(xall,select=selnames)        | Return subsets of vectors, matrices or data frames which meet conditions.                                            |
| group_by(datauseX,Subject,Activity) | group_by function takes an existing tbl and converts it into a grouped tbl where operations are performed "by group" |
| summarise_each(grouped,funs(mean))  | Apply one or more functions to one or more columns. Grouping variables are always excluded from modification.        |

##End