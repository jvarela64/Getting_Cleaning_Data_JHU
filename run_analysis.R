# Reading in the data files containing subjects and measurements
set_train = read.table(".\\train\\X_train.txt")
label_train = read.table(".\\train\\Y_train.txt")
subject_train = read.table(".\\train\\subject_train.txt")
set_test = read.table(".\\test\\X_test.txt")
label_test = read.table(".\\test\\Y_test.txt")
subject_test = read.table(".\\test\\subject_test.txt")
activity_labels = read.table("activity_labels.txt")
variable_names = read.table("features.txt")

# Giving corresponding names to the variables
names(set_test) = variable_names[, 2]
names(set_train) = variable_names[, 2]
names(subject_train) = c("subjectId")
names(subject_test) = c("subjectId")

# Replacing all activities for names in the labels data
for (i in 1:nrow(label_train))
{
    label_train[i, 1] = as.character(activity_labels[label_train[i, 1], 2])
}
for (i in 1:nrow(label_test))
{
    label_test[i, 1] = as.character(activity_labels[label_test[i, 1], 2])
}

# Filtering to only the mean() and std() columns to work with a smaller size
set_test = set_test[, grep("mean()|std()", names(set_test))]
set_train = set_train[, grep("mean()|std()", names(set_train))]

# Adding a SubjectId and Activity Column to each test and train
# measurement data frame
set_test$Activity = label_test[[1]]
set_test$SubjectId = subject_test[[1]]
set_train$Activity = label_train[[1]]
set_train$SubjectId = subject_train[[1]]

# Merge the two tables to create one data set
set_TestAndTrain = rbind(set_test, set_train)

# Use functions from the dplyr library to group and find the avg of each measurement
install.packages("dplyr")
library(dplyr)
MeasuresByActivityAndSubject = group_by(set_TestAndTrain, Activity, SubjectId)
MeanOfMeasuresByActivityAndSubject = summarize_all(MeasuresByActivityAndSubject, mean)
write.table(MeanOfMeasuresByActivityAndSubject, "MeanOfMeasuresByActivityAndSubject.txt", row.names = FALSE)