## Course Project:

## Set up directory for project
## Replace the path below following the first "setwd" command to indicate the working directory where your
## R Script has been saved.  Once you have indicated the full path, the program will create a 
## subdirectory called "Project" and set your working directory to that subfolder to store your data.
setwd("C:\\Users\\asus\\Documents\\Coursera.org - Data Science - 3. Getting and Cleaning Data")
if(!file.exists("Project")) {dir.create("Project")}
setwd("./Project")
path <- getwd()
path # Check to see the path is as you expected

## Download zip file from site
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
downloaded <- "Dataset.zip"
download.file(url, file.path(path, downloaded))
install.packages("downloader") # useful package for easy unzipping of zip files
library(downloader)
unzip(downloaded)
# Note: The unzipped file is placed in sub-directory called "UCI HAR Dataset", and
#       the test and training files are each in their own separate sub-directories under this folder,
#       called "test" and "train"
pathunzipped <- file.path(path,"UCI HAR Dataset")
list.files(pathunzipped, recursive = TRUE)

## Read training and test files (*.txt)
subject_train <- read.table(file.path(pathunzipped,"train","subject_train.txt")) # Subject ID for activity done - training set
subject_test <- read.table(file.path(pathunzipped,"test","subject_test.txt"))    # Subject ID for activity done - test set
X_train <- read.table(file.path(pathunzipped,"train","X_train.txt"))             # Training set
X_test <- read.table(file.path(pathunzipped,"test","X_test.txt"))                # Test set
y_train <- read.table(file.path(pathunzipped,"train","y_train.txt"))             # Training set labels
y_test <- read.table(file.path(pathunzipped,"test","y_test.txt"))                # Test set labels       


## Load activity names
activity_labels <- read.table(file.path(pathunzipped, "activity_labels.txt"))    # Description of each type of activity

## Load feature names
features <- read.table(file.path(pathunzipped,"features.txt"))
View(features)
headers <- features[,2]
View(headers)
## name columns of test and train features
names(X_test) <- headers
names(X_train) <- headers

## Extracts only the measurements on the mean and standard deviation for each measurement.
X_test_mean_and_std <- X_test[,(grepl("mean\\(\\)|std\\(\\)", headers))]
X_train_mean_and_std <- X_train[,(grepl("mean\\(\\)|std\\(\\)", headers))]


## Merge the training and the test sets and create one data set
subject_all <- rbind(subject_test, subject_train)
X_all <- rbind(X_test_mean_and_std, X_train_mean_and_std)
y_all <- rbind(y_test, y_train)

## combine all vectors/data.frames into one data.frame
merged <- cbind(subject_all, y_all, X_all)
names(merged)[1] <- "SubjectID"  ## Add "SubjectID" as name for first column
names(merged)[2] <- "Activity"   ## Add "Activity" as name for second column

## aggregate (mean) by subjectid and activity
agg <- aggregate(. ~ SubjectID + Activity, data=merged, FUN = mean)

# Appropriately label the data set with descriptive activity names. 
agg$Activity <- factor(agg$Activity, labels=activity_labels[,2])

# Updating the colNames vector to include the new column names after merge
colNames  = colnames(agg); 

# Cleaning up the variable names
for (i in 1:length(colNames)) 
{
  colNames[i] = gsub("\\()","",colNames[i])
  colNames[i] = gsub("-std","StdDev",colNames[i])
  colNames[i] = gsub("-mean","Mean",colNames[i])
  colNames[i] = gsub("^(t)","time",colNames[i])
  colNames[i] = gsub("^(f)","freq",colNames[i])
  colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
  colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
  colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
  colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMag",colNames[i])

  };

# Reassigning the new descriptive column names to the final data set
colnames(agg) = colNames;
View(agg)

# Writing out text file based on final, aggregated tidy data set
write.table(agg, file="./tidyagg.txt", sep="\t", row.names=FALSE)
