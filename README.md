##Included Files

README.md: Current file. List requirements for running the
        analysis (including where to find the original data),
        and gives an overall explanation as to what 
        the analysis does.

CodeBook.md: Gives an overview of the data, lists the specific
        transformations applied to the original data through the 
        use of 'run_analysis.R', and lists variables.
        
'run_analysis.R': Code for applying the transformations to the
        original data set.
            


##Requirements

Before running the 'run_analysis.R' script, several preparations must be made. The first is a required download and installation of the R-package 'dplyr'. The second requirement is the download of the original dataset, which can be found at the following address:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The dataset should be unzipped and the following seven files should be copied to the working directory:

    1."features.txt"
    2."subject_test.txt"
    3."subject_train.txt"
    4."X_test.txt"
    5."X_train.txt"
    6."y_test.txt"
    7."y_train.txt"  


##Running 'run_analysis.R'

After the steps in the Requirements section (above) have been completed, the 'run_analysis.R' code may be ran.
The 'run_analysis.R' code will perform the following steps:

1. Combine the test and training data sets into one set.
2. For each of the 30 subjects, provide the mean and standard
    deviation of each of the 6 activities over the 66 variables.
    (This results in a table of 180 observations and 68 total
    columns.)
3. Adds descriptive activity names to the activities.
4. Labels the 68 total variables with descriptive names.
5. Prints out a tidy data set in the form of the text file, 
    'run_analysis.txt' (This file will be written to the working
    directory.)


###Further information

Further information about the original data can be found at the following address:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

