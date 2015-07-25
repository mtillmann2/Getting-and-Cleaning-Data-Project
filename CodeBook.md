##The Data

The output file, 'run_analysis.txt, is printed to the working
directory after running 'run_analysis.R' This output file is a brief
summation of the 'Human Activity Recognition Using Smartphones
Dataset,' which can be found at
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
Further information on how the original data was collected can be
found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Through the analysis, the original data will be distilled into the
six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,
SITTING, STANDING, LAYING) performed by 30 subjects,for a total of
180 records. Each record of the 'run_analysis.txt' dataset contains
the average of the measurements for each activity across 66
variables, pulled from the original data. (Only columns that
contained the mean or standard deviation of a measured variable were
chosen for this analysis). The original data was normalized and
bound to a range of [-1,1]. Therefore the analysis data is bound to
a range of [-1,1] as well.

##Transformations on the Original Data

The transformations on the original data set used functions from the
'dplyr' package, so the first step was to load that package into R.
Next the training data was read in, along with subject labels and
activity labels ('subject_train.txt','X_train.txt',
and 'Y_train.txt'). Next the main table ,'X_train.txt' was
transformed into a tabular data frame, in order to make it easier to
work with. Discriptive column names were added from 'features.txt', 
duplicate columns were removed, and the mean() and std() columns for
each type of measurement were extracted as columns of interest.
Subject and Activity columns were added from 'subject_train.txt' and
'Y_train.txt', respectively. The training data was then combined
into one data set. The same process was done for the test data,
using 'subject_test.txt','X_test.txt', and 'Y_test.txt', which
created a combined test data set. The two data sets (training and
test) were combined, and activities from the 'Activity' column were
given descriptive names.Finally, the data was aggregated and
exported to the text file 'run_analysis.txt'.



##Variables

    [1] "Activity" : One of six activities (Laying, Sitting, 
                    Standing,Walking, Walking_Downstairs,
                    Walking_Upstairs)                   
    [2] "Subject" : Distinct Id used for each of the 30 volunteers 
                    (integer from  1:30)

####Time (mean)
    
    [3] "tBodyAcc-mean()-X"           
    [4] "tBodyAcc-mean()-Y"          
    [5] "tBodyAcc-mean()-Z"           
    [6] "tGravityAcc-mean()-X"       
    [7] "tGravityAcc-mean()-Y"        
    [8] "tGravityAcc-mean()-Z"       
    [9] "tBodyAccJerk-mean()-X"       
    [10] "tBodyAccJerk-mean()-Y"      
    [11] "tBodyAccJerk-mean()-Z"       
    [12] "tBodyGyro-mean()-X"  
    [13] "tBodyGyro-mean()-Y"          
    [14] "tBodyGyro-mean()-Z"         
    [15] "tBodyGyroJerk-mean()-X"      
    [16] "tBodyGyroJerk-mean()-Y"     
    [17] "tBodyGyroJerk-mean()-Z"      
    [18] "tBodyAccMag-mean()"  
    [19] "tGravityAccMag-mean()"       
    [20] "tBodyAccJerkMag-mean()"     
    [21] "tBodyGyroMag-mean()"   
    [22] "tBodyGyroJerkMag-mean()" 

####Frequency (mean)

    [23] "fBodyAcc-mean()-X"         
    [24] "fBodyAcc-mean()-Y"          
    [25] "fBodyAcc-mean()-Z"          
    [26] "fBodyAccJerk-mean()-X"      
    [27] "fBodyAccJerk-mean()-Y"       
    [28] "fBodyAccJerk-mean()-Z"      
    [29] "fBodyGyro-mean()-X"          
    [30] "fBodyGyro-mean()-Y"         
    [31] "fBodyGyro-mean()-Z"          
    [32] "fBodyAccMag-mean()"         
    [33] "fBodyBodyAccJerkMag-mean()"  
    [34] "fBodyBodyGyroMag-mean()"    
    [35] "fBodyBodyGyroJerkMag-mean()" 

####Time (std)

    [36] "tBodyAcc-std()-X"           
    [37] "tBodyAcc-std()-Y"           
    [38] "tBodyAcc-std()-Z"           
    [39] "tGravityAcc-std()-X"      
    [40] "tGravityAcc-std()-Y"        
    [41] "tGravityAcc-std()-Z"        
    [42] "tBodyAccJerk-std()-X"       
    [43] "tBodyAccJerk-std()-Y"       
    [44] "tBodyAccJerk-std()-Z"       
    [45] "tBodyGyro-std()-X"         
    [46] "tBodyGyro-std()-Y"          
    [47] "tBodyGyro-std()-Z"        
    [48] "tBodyGyroJerk-std()-X"      
    [49] "tBodyGyroJerk-std()-Y"      
    [50] "tBodyGyroJerk-std()-Z"      
    [51] "tBodyAccMag-std()"    
    [52] "tGravityAccMag-std()"       
    [53] "tBodyAccJerkMag-std()"     
    [54] "tBodyGyroMag-std()"         
    [55] "tBodyGyroJerkMag-std()"

####Frequency (std)

    [56] "fBodyAcc-std()-X"           
    [57] "fBodyAcc-std()-Y"        
    [58] "fBodyAcc-std()-Z"           
    [59] "fBodyAccJerk-std()-X" 
    [60] "fBodyAccJerk-std()-Y"       
    [61] "fBodyAccJerk-std()-Z" 
    [62] "fBodyGyro-std()-X"          
    [63] "fBodyGyro-std()-Y" 
    [64] "fBodyGyro-std()-Z"          
    [65] "fBodyAccMag-std()"    
    [66] "fBodyBodyAccJerkMag-std()"  
    [67] "fBodyBodyGyroMag-std()"   
    [68] "fBodyBodyGyroJerkMag-std()" 
