#GetAndCleanDataProject


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

Here are the data for the project: 
ß
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#Coursera project

The run_analysis.R script expects the data in a sub directory UCI HAR Dataset (generated when unzipping the Dataset)
It requires reshape2 and plyr (loaded automatically in the script)
It saves the tidy_data.txt as a table output file at the end of the script.
