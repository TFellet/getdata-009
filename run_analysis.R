
# -----------------------------------------------------------------------------
# This R script reads the data from the Human Activity Recognition Using 
# Smartphones Dataset, combines the training and test dataset, set appropriate
# labels everywhere, and then create a smaller dataset containing only 
# the mean mesurement for each subject and activity.
# You can access the dataset from here : 
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# -----------------------------------------------------------------------------


# The plyr library is required to create the tidy dataset at the end
library(plyr)

# --------------------------------- Step 1 ------------------------------------

# The dataset is about 60 MB to download,
# and about 270 MB unzipped, make sure you have enough free space

# Merges the training and the test sets to create one data set.

# Location of the dataset, by default in your working directory
# You can either :
# - Place the dataset in your working directory
# - Change your working directory before sourcing this script
location.dataset = "./UCI HAR Dataset";

# download the dataset if the script does not find the dataset folder
if (!file.exists(location.dataset)) {
    URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    location.zip = "./dataset.zip"
    download.file(URL, destfile=location.zip)
    unzip(location.zip)
    unlink(location.zip)
    rm(location.zip)
}

# Location of the differents folders and files, based on the dataset location
location.train <- paste(location.dataset, "/train/", sep="");
location.test <- paste(location.dataset, "/test/", sep="");
location.output <- paste(location.dataset, "/tidy.txt", sep="");
location.activity <- paste(location.dataset, "/activity_labels.txt", sep="");
location.features <- paste(location.dataset, "/features.txt", sep="");

# Get the files names in the specified directory
files.train <- list.files(location.train, full.names = T);
files.train <- files.train[2:4];

files.test <- list.files(location.test, full.names = T);
files.test <- files.test[2:4];

# Apply read.table function on all the names the read all the files
data.train <- lapply(files.train, read.table, colClasses="numeric", nrow=7352);
data.test <- lapply(files.test, read.table, colClasses="numeric", nrow=2947);

# Change the names to avoid duplicates names
names(data.train[[1]]) <- names(data.test[[1]]) <- "subject";
names(data.train[[3]]) <- names(data.test[[3]]) <- "activity";

# Bind together the differents files in each folder
train <- cbind(data.train[[1]], data.train[[3]], data.train[[2]]);
test <- cbind(data.test[[1]], data.test[[3]], data.test[[2]]);

# Bind together the training and the test sets
data <- rbind(train, test);

# Clean the unused variables the free some memory
rm(files.train, files.test, data.train, data.test, train, test);



# --------------------------------- Step 2 ------------------------------------

# Extracts only the measurements on the mean and standard deviation 
# for each measurement.

# Read the others useful files
activity_labels <- read.table(location.activity);
features <- read.table(location.features, stringsAsFactors = F);

# Convert the dataframes into vectors
activity_labels <- activity_labels[[2]];
features <- features[[2]];

# Keeps only the mesurements of mean or standard deviation
mean_or_std <- grep("mean|std", features);

# Add +2 to ignore the columns for the subject and activity
data <- data[,c(1, 2, mean_or_std + 2)];



# --------------------------------- Step 3 ------------------------------------

# Uses descriptive activity names to name the activities in the data set
data[,2] <- activity_labels[data[,2]];



# --------------------------------- Step 4 ------------------------------------

# Appropriately labels the data set with descriptive variable names
names(data) <- c("subject", "activity", features[mean_or_std]);



# --------------------------------- Step 5 ------------------------------------

# From the data set in step 4, creates a second, independent tidy data set with
# the average of each variable for each activity and each subject.

tidy <- ddply(data, .(subject, activity), function(x) colMeans(x[,3:81]));

# Export the tidy dataset as a csv in the dataset folder
write.table(tidy, location.output, sep=",", row.names=FALSE);

# Clean up the unused variables
rm(activity_labels, features, mean_or_std);
rm(location.activity, location.features);
rm(location.dataset, location.train, location.test, location.output);
