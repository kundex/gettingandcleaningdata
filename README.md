Peer-graded Assignment: <br>Getting and Cleaning Data Course Project
========================================

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.

## About the dataset

This work is based on the "Human Activity Recognition Using Smartphones Dataset" Version 1.0:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

There you can find more specific information about the dataset.

## Description of the steps for perfoming the dataset analysis

- **Loading the Data: ** 
Defining and retrieving all input data and metadata derived from folder [/UCI HAR Dataset].
- **Merging the training and the test sets to create one data set and labeling the data set with descriptive variable names:** Subjects, Activities (Labels) and the datasets itself, all for training and test data respectively, are merged together.
- **Extracting only the measurements on the mean and standard deviation for each measurement:** 
Via string search all relevant measurements are identified - the others are deleted.
- **Using descriptive activity names to name the activities in the data set:** 
The descriptive activity names are matched with a provided code-value file.
- **Creating a second, independent tidy data set with the average of each variable for each activity and each subject:**
Using the tidyverse package, a summarized tidy dataset with mean values is provided.


**More specific information about variable descriptions, the data transformation process and the R code itself are documented in the files [CodeBook.md] and [run_analysis.R].**

