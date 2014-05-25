The script run_analysis.R is to be used to generate a tidy aggregate dataset
from the Human Activity Recognition Using Smartphones raw data. 

The script merges the training and the test sets to create a single data set,
and aggregates the data for standard deviation and means by the subject id and activity id.

For the sake of this project, the variables considered are those with
"-std" or "-mean" in their name. 

Activity are labeled based on `activity_labels.txt



To run the script download the source data from

    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

unzip it in the script directory so that the layout looks like (in a unix like shell)

    $ ls -1
      README.md
      UCI HAR Dataset/
      run_analysis.R

then run the script with

    $ r -f run_analysis.R

The ouput file will be created in the same directory and will have a
name

    average-data-by-subject-and-activity.txt

The file can be read in R through `read.table`.

