#Load 'dplyr' 
library(dplyr)


###Training data###
#Read in training data with subject labels and activity labels
subject_train_data <-read.table("subject_train.txt")
x_train_data <-read.table("X_train.txt")
y_train_data <-read.table("Y_train.txt")

#Transform main table into tabular data frame
x_train_data <- tbl_df(x_train_data)

#Set up column names for main training table
column_labels <-read.table("features.txt")
colnames(x_train_data) <- as.character(column_labels$V2)

#remove duplicated columns
x_train_data <- x_train_data[,!duplicated(colnames(x_train_data))]

#extract columns with mean() or std()
selected_training_data_mean<- select(x_train_data,contains("mean()"))
selected_training_data_std <- select(x_train_data,contains("std()"))

#add names to subject and activity columns
colnames(y_train_data) <- "activity"
colnames(subject_train_data) <- "subject_id"

#combine training data set
sel_tr_data <-cbind(subject_train_data,selected_training_data_mean,
                    selected_training_data_std,y_train_data)



###Test data###
#Read in test data with subject labels and activity labels
subject_test_data <-read.table("subject_test.txt")
x_test_data <-read.table("X_test.txt")
y_test_data <-read.table("Y_test.txt")

#Transform main table into tabular data frame
x_test_data <- tbl_df(x_test_data)

#Set up column names for main test table
column_labels <-read.table("features.txt")
colnames(x_test_data) <- as.character(column_labels$V2)


#remove duplicated columns
x_test_data <- x_test_data[,!duplicated(colnames(x_test_data))]

#extract columns with mean() or std()
selected_test_data_mean<- select(x_test_data,contains("mean()"))
selected_test_data_std <- select(x_test_data,contains("std()"))

#add names to subject and activity columns
colnames(y_test_data) <- "activity"
colnames(subject_test_data) <- "subject_id"

#combine test data set
sel_ts_data <-cbind(subject_test_data,selected_test_data_mean,
                    selected_test_data_std,y_test_data)


#remove unnecessary data
rm(column_labels,selected_training_data_mean,selected_training_data_std,
   subject_train_data,x_train_data,y_train_data,selected_test_data_mean,selected_test_data_std,
   subject_test_data,x_test_data,y_test_data)



###Combined Data###
#combine both sets
all_data <- rbind(sel_tr_data,sel_ts_data)
all_data <-tbl_df(all_data)

#Label activities
all_data$activity <- gsub("1", "Walking",all_data$activity)
all_data$activity <- gsub("2", "Walking_Upstairs",all_data$activity)
all_data$activity <- gsub("3", "Walking_Downstairs",all_data$activity)
all_data$activity <- gsub("4", "Sitting",all_data$activity)
all_data$activity <- gsub("5", "Standing",all_data$activity)
all_data$activity <- gsub("6", "Laying",all_data$activity)



###Create a Tidy Data Set###
core_data <- select(all_data, -subject_id,-activity)
final_data_set <- aggregate (core_data,list(Activity=all_data$activity,Subject=all_data$subject_id),mean)
write.table(final_data_set,file="run_analysis.txt", row.names= FALSE)
