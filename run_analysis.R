## run_analysis
## This script uses the Samsung accelerometer/gyroscope data to create
## a tidy data frame of the mean and standard deviation features (i.e. variables),
## and a tidy summary data frame of the means of these features.
## Assumptions: the packages "dplyr" and "reshape2" are loaded.

## Read the feature names, i.e. data column names
features <- read.table("features.txt",col.names = c("feature_id","feature_name"))

## Read the X_test and X_train data using the feature names as column names
x_test <- read.table("X_test.txt",col.names = features$feature_name)
x_train <- read.table("X_train.txt",col.names = features$feature_name)

## Read the test and train subject identifiers
subject_test <- read.table("subject_test.txt",col.names = c("subject_id"))
subject_train <- read.table("subject_train.txt",col.names = c("subject_id"))

## Read the test and train activity identifiers
y_test <- read.table("y_test.txt",col.names = c("activity_id"))
y_train <- read.table("y_train.txt",col.names = c("activity_id"))

## Combine the components to create full test and train data frames
test <- cbind(subject_test,y_test,x_test)
train <- cbind(subject_train,y_train,x_train)

## Append the test and train dataframes together
data <- rbind(test,train)

## Read the activity identifiers and labels, and merge the activity_labels to the data
activity <- read.table("activity_labels.txt",col.names=c("activity_id","activity_label"))
data2 <- merge(data,activity,by.x="activity_id",by.y="activity_id")

## Create a set of the selected variables (activity/subject variables, means, standard deviations)
selected_data<-data2[,grepl("activity_label",colnames(data2)) 
                    | grepl("subject",colnames(data2)) 
                    | grepl("mean()", colnames(data2)) 
                    | grepl("std()", colnames(data2))]

## Melt the data to create a tall data set with a row per categories per variable
library(reshape2)
melt_data <- melt(selected_data,id=c("activity_label","subject_id"))
## Improve the readability of the variable (feature) names by replacing periods with underscore
melt_data$variable <- gsub("...","_",melt_data$variable,fixed = TRUE)
melt_data$variable <- gsub("..","",melt_data$variable,fixed = TRUE)

## Rename for good variable names
library(dplyr)
melt_data <- rename(melt_data,variable_name = variable)

## Create a data frame of the means by activity by subject by variable
mean_data <- aggregate(value ~ activity_label + subject_id + variable_name, data=melt_data, mean)

## Rename for good variable names
mean_data <- rename(mean_data,mean_value = value)

## Sort the data for presentation
mean_data <- arrange(mean_data,activity_label,subject_id,variable_name)

## Write out the summary mean data
write.table(mean_data, file = "meandata.txt", row.names = FALSE)
