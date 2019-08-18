---
title: "Codebook.md"
author: "Joel Varela Donado"
date: "August 17, 2019"
output: html_document
---

# Getting and Cleaning Data Course
## Code book for run_analysis.rd script

### Objects used for Reading In the Data Files

There are two data sets, for training and testing. There is also set and labeled data, named accordingly.
From the Train folder, following is the Training data set:

* set_train: Measures
* label_train: Activity Labels for each measure in the Set
* subject_train: Identifies the subjects performing the activities by unique number

From the Test folder, following is the Test data set: 

* set_test: Measures
* label_test: Activity Labels for each measure in the Set
* subject_test: Identifies the subjects performing the activities by unique number

We also gather the additional variables names and activities labels from other text files:

* activity_labels: Identifies the labeled activities code with descriptive names
* variable_names: Identifies each variable in the Train and Test 

### Operations on the R Objects

After reading the data files, the data is cleaned and modified with the following operations:

1. Variables are given appropriate names for both the measures and subject Ids
2. Activities values are replaced from and ID number to their descriptive names
3. The data set is filtered using grep to have only variables about mean and standard deviation variables, this
reduces the size of the data set
4. Each data frame of measurements is appended a new variable for SubjectId and Activity
5. The test and train data sets are merged into one data frame using rbind.

* **set_TestAndTrain**: Contains the merged data sets with only the mean and standard deviation variables

### The final result: New tidy data set
The last data set is named **MeanOfMeasuresByActivityAndSubject** and it contains the mean of all the variables in the previous data set, by activity and subject.
This data set is created using the **dplyr** library, taking advantage of the **group_by** and **summarize_all**  functions.

### Variable Names 
The variables are composed of 3 properties, and the values are from the accelerometer and gyroscope 3-axial raw signals. They were captured over a period of time, (prefix 't' to denote time) and at a constant rate of 50 Hz. They were then filtered, and separated into Body or Gravity acceleration.

A Jerk signal was calculated using a time derivative. The magnitude signals were calculated using the Euclidean norm.

A Fast Fourier Transform (FFT) was applied to some of these signals and marked accordingly.

A feature vector for each variable also has an XYZ appendix at the end.
Each variable was then operated on, with mean() and std() suffixes for Averages and Standard Deviation.

* Prefix t: time
* Prefix f: Fast Fourier Transform
* Body: signal was measured from the body of the subject
* Gravity: signal was measured due to gravity acceleration
* Acc: measure from Accelerometer
* Gyro: measure from Gyroscope
* Jerk: signal calculated from time derivative of linear acceleration and angular velocity
* Mag: magnitude from Euclidean norm
* mean(): Average measure
* std(): Standard Deviation

