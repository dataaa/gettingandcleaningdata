gettingandcleaningdata
----------------------

Work associated with Coursera course "Getting and Cleaning Data"

run_analysis.R
===============

Included here is a single script, run_analysis.R, which will perform
the five required steps on some sample data. The sample data are
sourced from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

No user input is required during the running of the script. Simply
place run_analysis.R in the data directory, UCI HAR Dataset, and
source the script in R, with source("run_analysis.R"). The script will
run and produce the cleaned set set, summary_data.txt.

Please see the associated codebook for a description of the variables
in the data file.

The script basically performs 5 operations:
- It takes the training and test data, and various other auxilliary files, and after some fitting of jigsaw pieces together (as visualised here: https://class.coursera.org/getdata-007/forum/thread?thread_id=49#comment-570 ), merges the two data sets into one.
- It extracts only the mean and standard deviation measurements, and discards the rest.
- It replaces the activity indices with names, to make the activities undertaken more understandable.
- It cleans the variable names to make them more straightforward to understand
- It produces a summary table, averaging all the variables for each activity and each subject, and writing them to a data file, summary_data.txt
