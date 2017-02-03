# Coursera Class Project for "Getting and Cleaning Data"

The objective of the class project for [Getting and Cleaning Data] (https://www.coursera.org/learn/data-cleaning) was to read in the ["Human Activity Recognition Using Smartphones" data set] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), perform a summary analysis on the data set, and output a tidy data set.

Steps:
* Sets a working directory using your input
* Downloads a zip file containing the necessary raw data files for processing
* Loads both the training and test datasets
* Load the activity labels
* Load the feature names and replaces the test and train column names with these names
* Extracts only those columns which include a mean or standard deviation
* Merges the above data into one data set
* Merges the two datasets
* Renames the subject and activity column names
* Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair


Note: Before running the R Script, you must first replace the existing file path used for this specific analysis with your own chosen project folder path name that contains your R Script.  Once this has been changed, the R Script will then create a sub-folder called "Project" to "house" the data files that are then downloaded and unzipped.

Once the steps above are completed, you can run the R script [run_analysis.R] (https://github.com/JDCBean/Coursera-Getting-and-Cleaning-Data/blob/master/run_analysis.R).

The output of the R script is a tidy data set in tab-delimited form, called "tidyagg.txt".  To read in the tidyagg.txt file, use the following:

```
tidyagg <- read.table(
  "./tidyagg.txt",
  sep="\t", header=TRUE)
```

You can read more about the data and the analysis in the [code book] (https://github.com/JDCBean/Coursera-Getting-and-Cleaning-Data/blob/master/CodeBook.md).
