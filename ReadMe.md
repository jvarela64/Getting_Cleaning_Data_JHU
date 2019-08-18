---
title: "ReadMe.md"
author: "Joel Varela Donado"
date: "August 18, 2019"
output: html_document
---

# Getting and Cleaning Data Course
## ReadMe for **run_analysis.r** script

There is only one script, **run_analysis.r**

### Requirements
1. **dplyr** library is required. The script will install the package and load the library.
2. The working directory is the root directory of the unzipped **UCI HAR Dataset**, obtainable from [link] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Instructions
Only need to source **run_analysis.r**, it will run and perform the following steps:

1. Read the data files containing subjects and measurements
2. Gives corresponding names to the variables
3. Replaces all activities number IDs for named data labels
4. Filters the data frames to keep only variables for Mean and Standard Deviation
5. Adds SubjectId and Activity variables to the data frames
6. Merges the two data frames about test and train data
7. Uses functions in the **dplyr** library to group and find the avg of each measurement
8. Outputs the **MeanOfMeasuresByActivityAndSubject.txt** with the result of the new data set from the previous step

### More Information
Please see the **Codebook.md** in this same repo for a detailed description of the variables and measurements in the data set.

### Resulting Data Frame File: **MeanOfMeasuresByActivityAndSubject.txt**