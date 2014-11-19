# Getting and Cleaning Data Course Project

## Introduction

This R script reads the data from the Human Activity Recognition Using Smartphones Dataset and performs multiple operation on this dataset: 

1. Combines the training and test dataset in one dataset
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
6. Save the tidy dataset from step 5 as a text file

You can access the dataset from here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Files in this repo

This repository contains the following files:

* README.md - this file, explaining how to use the script
* run_analysis.R - The script used to perform all the steps above
* CodeBook.md - A Code Book that explain the code and describes the variables
* tidy.txt - The tidy dataset obtained at the end of the script execution


If you want to know more about the original dataset, you can visit this website and download the dataset: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 
Inside the dataset folder there is a readme.txt which describes more extensively the data collection and the differents files.

If you want to know more about the code, please refer to the CodeBook.md