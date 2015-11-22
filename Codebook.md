## Codebook for tidy data from Samsung motion sensor observations

The script “run_analysis.R” attached to this repo reads observations from the Samsung motion sensor data and creates:

1. a tidy data frame of mean and standard deviation values, with a row per selected variable per observation (“melt_data”)
2. a tidy aggregate data file of the means by activity by subject by variable (“meandata.txt”)

The raw data is transformed from having many columns representing the variables to representing the values of the variables by row.


## MELTDATA columns

column_name	descrption				units/possible values
==============	===============================		==================================
activity_label	activity during observation	 	LAYING, SITTING, STANDING, WALKING,
							WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

subject_id	ID of volunteer for observaton		integer 1 to 30

variable	text of the variable measured		see “Derivation of Variable Names” below for name pattern

value		numeric measure of the variable		normalized value of the variable on scale [-1,1] 
		for the observation
							

## MEANDATA.TXT columns

column_name	descrption				units/possible values
==============	===============================		==================================
activity_label	activity during observation	 	LAYING, SITTING, STANDING, WALKING,
							WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

subject_id	ID of volunteer for observaton		integer 1 to 30

variable_name	text of the variable measured		see “Derivation of Variable Names” below for name pattern

mean_value	numeric mean of the measure of the 	mean of normalized value of the variable on scale [-1,1] 
		variable for the observation



## Derivation of Variable Names (a.k.a. “Features”) from Samsung sensor data documentation

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


