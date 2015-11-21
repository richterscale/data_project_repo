# This repo contains the code and documentation for transforming the Samsung motion sensor data
# into a tidy data set with the mean and standard deviation features (i.e. variables) row-wise.
# It further creates a tidy summary data set of the means of these features by subject and activity.
# and writes this summary data set to the working directory.

## Preparation

### These Samsung data files must be in the working directory:
* features.txt
* x_test.txt
* x_train.txt
* subject_test.txt
* subject_train.txt
* y_test.txt
* y_train.txt
* activity_labels.txt

### These R packages need to be installed:
* dplyr
* reshape2

## Execution
* run the script “run_analysis.R” in the working directory

## Output
* A dataframe “melt_data” which provides rows per variable per observation
* An aggregate file “meandata.txt” of the means of each variable by activity by subject

## Script outline
1. Read the features file to get a list of features (i.e. variable column names).
2. Read the X test and train files using the features as column names.
3. Read the test and train subject files to get a list of subjects for the observations.
4. Read the Y test and train files to get a list of activity IDs for the observations.
5. Combine the subject, Y, and X to get test and train data frames with all columns per observation.
6. Combine the test and train data frames to create a complete data frame.
7. Merge the data frame with activity labels to create a readable activity column.
8. Create a data frame of selected columns, including activity, subject, mean, and standard deviation columns.
9. “Melt” the selected data frame into a data frame “melt_data” with rows per feature (variable).
10. Clean up the variable names to remove excess periods created by R reading parentheses and dashes in column names.
11. Create an aggregate dataframe of the feature (variable) means by activity by subject.
12. Write the aggregate dataframe to “meandata.txt” in the working directory.