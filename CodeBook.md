# Code Book

This code book describes the `tidyagg.txt` summary data file created from source data in the [Smartphone-Based Recognition of Human Activities and Postural Transitions Data Set] (http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions) using the run_analysis.R script.

## Comment on Tidy Data
I have created this data set using the tidy data principles established by **Hadley Wickham** in his seminal [paper] (http://vita.had.co.nz/papers/tidy-data.html).  For a given subject and activity, metrics representing the various activity measurements are provided for each of the 30 subject-activity combinations.  The file contains 180 records (30 subjects x 6 activities) and 68 variables, beginning with the SubjectID and Activity.
* Intuitive, "human readable" variable naming
* Activity names used instead of codes
* File structure to suit further analysis of metrics with subject-activity pairs as the units of observation

## Subject and Activity

These variables identify the unique subject-activity pair the variables relate to:

* SubjectID: the integer subject ID, ranging from 1 to 30.

* Activity (6):
  * Walking
  * Walking Upstairs
  * Walking Downstairs
  * Sitting
  * Standing
  * Laying

## Study Design: Measurement Means and Standard Deviations
In addition to the subject and activity variables, the tidy data set includes 66 measurement variables, representing the `averages`, aggregated by subject and activity, of the mean and standard deviations as recorded in the original data set.  Only those measurement variables that include "mean()" or "std()" in the field names are extracted from the original data file.  More information about how the data was original collected is available in the data source's [zip file] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and [on the source's website] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  Units for these measurements are normalized and bounded within [-1,1], the units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2), and the gyroscope units are rad/seg. 

* Time domain body acceleration mean and standard deviation along the X, Y, and Z axes:
  ** timeBodyAccMean-X
  ** timeBodyAccMean-Y
  ** timeBodyAccMean-Z
  ** timeBodyAccStdDev-X
  ** timeBodyAccStdDev-Y
  ** timeBodyAccStdDev-Z

* Time domain gravity acceleration mean and standard deviation along the X, Y, and Z axes:
  ** timeGravityAccMean-X
  ** timeGravityAccMean-Y
  ** timeGravityAccMean-Z
  ** timeGravityAccStdDev-X
  ** timeGravityAccStdDev-Y
  ** timeGravityAccStdDev-Z

* Time domain body acceleration jerk mean and standard deviation along the X, Y, and Z axes:
  ** timeBodyAccJerkMean-X
  ** timeBodyAccJerkMean-Y
  ** timeBodyAccJerkMean-Z
  ** timeBodyAccJerkStdDev-X
  ** timeBodyAccJerkStdDev-Y
  ** timeBodyAccJerkStdDev-Z

* Time domain body gyroscope mean and standard deviation along the X, Y, and Z axes:
  ** timeBodyGyroMean-X
  ** timeBodyGyroMean-Y
  ** timeBodyGyroMean-Z
  ** timeBodyGyroStdDev-X
  ** timeBodyGyroStdDev-Y
  ** timeBodyGyroStdDev-Z

* Time domain body gyroscope jerk mean and standard deviation along the X, Y, and Z axes:
  ** timeBodyGyroJerkMean-X
  ** timeBodyGyroJerkMean-Y
  ** timeBodyGyroJerkMean-Z
  ** timeBodyGyroJerkStdDev-X
  ** timeBodyGyroJerkStdDev-Y
  ** timeBodyGyroJerkStdDev-Z

* Time domain body acceleration magnitude mean and standard deviation:
  ** timeBodyAccMagMean
  ** timeBodyAccMagStdDev

* Time domain gravity acceleration magnitude mean and standard deviation:
  ** timeGravityAccMagMean
  ** timeGravityAccMagStdDev

* Time domain body acceleration jerk magnitude mean and standard deviation:
  ** timeBodyAccJerkMagMean
  ** timeBodyAccJerkMagStdDev

* Time domain body gyroscope magnitude mean and standard deviation:
  ** timeBodyGyroMagMean
  ** timeBodyGyroMagStdDev

* Time domain body gyroscope jerk magnitude mean and standard deviation:
  ** timeBodyGyroJerkMagMean
  ** timeBodyGyroJerkMagStdDev

* Frequency domain body acceleration mean and standard deviation along the X, Y, and Z axes:
  ** freqBodyAccMean-X
  ** freqBodyAccMean-Y
  ** freqBodyAccMean-Z
  ** freqBodyAccStdDev-X
  ** freqBodyAccStdDev-Y
  ** freqBodyAccStdDev-Z

* Frequency domain body jerk mean and standard deviation along the X, Y, and Z axes:
  ** freqBodyAccJerkMean-X
  ** freqBodyAccJerkMean-Y
  ** freqBodyAccJerkMean-Z
  ** freqBodyAccJerkStdDev-X
  ** freqBodyAccJerkStdDev-Y
  ** freqBodyAccJerkStdDev-Z

* Frequency domain body gyroscope mean and standard deviation along the X, Y, and Z axes:
  ** freqBodyGyroMean-X
  ** freqBodyGyroMean-Y
  ** freqBodyGyroMean-Z
  ** freqBodyGyroStdDev-X
  ** freqBodyGyroStdDev-Y
  ** freqBodyGyroStdDev-Z

* Frequency domain body acceleration magnitude mean and standard deviation:
  ** freqBodyAccMagMean
  ** freqBodyAccMagStdDev

* Frequency domain body acceleration jerk magnitude mean and standard deviation:
  ** freqBodyAccJerkMagMean
  ** freqBodyAccJerkMagStdDev

* Frequency domain body gyroscope magnitude mean and standard deviation:
  ** freqBodyGyroMagMean
  ** freqBodyGyroMagStdDev

* Frequency domain gyroscope jerk magnitude mean and standard deviation:
  ** freqBodyGyroJerkMagMean
  ** freqBodyGyroJerkMagStdDev