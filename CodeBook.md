## Description

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

## Variables

This section explains each variable name in the final feature vector.

### activityLabel

Activity label of the experiment. There are six possible values: 

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

### subject

An identifier of the subject who carried out the experiment.

### Measurements

Columns 3 to 68 are experimental measurements. Variable name is the name of the measurement for a particular activity and subject. There are two pieces of information in the measurement name:
1. signal name from which the measurement is derived from;
2. estimation method.

The following signals were used to estimate variables of the feature vector for each pattern. 

'.XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* fBodyAcc.XYZ
* fBodyAccJerk.XYZ
* fBodyAccMag
* fBodyBodyAccJerkMag 
* fBodyBodyGyroJerkMag
* fBodyBodyGyroMag
* fBodyGyro.XYZ
* tBodyAcc.XYZ
* tBodyAccJerk.XYZ 
* tBodyAccJerkMag
* tBodyAccMag
* tBodyGyro.XYZ
* tBodyGyroJerk.XYZ
* tBodyGyroJerkMag
* tBodyGyroMag
* tGravityAcc.XYZ
* tGravityAccMag

The set of estimation method that were used to process these signals are: 

* mean: Mean value
* std: Standard deviation

Value of variables 3 to 68 are the average of the measurement over all experiment sessions, for a particular subject and activity.
