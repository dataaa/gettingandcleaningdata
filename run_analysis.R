# Script to read data from the UCI HAR dataset and clean it

# Read in variable names
var.names <- read.table('features.txt', header=FALSE, stringsAsFactors=FALSE)
# Add two variable names for Subject and Activity
var.names <- cbind(t(var.names[,2]),"Subject","Activity")

# Read in the training data, storing in a 7352 x 563 data frame
train.files <- list.files(path='train',pattern='.txt',full.names=TRUE)
data <- lapply(train.files, read.table)
train.data <- data.frame(data[2],data[1],data[3])
# Add our variable names as a header
names(train.data) <- var.names

# Read in the test data, storing in a 2947 x 563 data frame
test.files <- list.files(path='test',pattern='.txt',full.names=TRUE)
data <- lapply(test.files, read.table)
test.data <- data.frame(data[2],data[1],data[3])
names(test.data) <- var.names

# Step 1
# Merge the two datasets, to assemble a 10299 x 563 data frame
all.data <- rbind(train.data,test.data)
# No longer need train.data or test.data, so clean up
rm(train.data, test.data)

# Step 2
# Extract only the information pertaining to the mean and standard deviation of each measurement (taken to mean those measurements with mean() or std() in the variable name
std.cols <- grep('std()',names(all.data))  # returns column indices
mean.cols <- grep('mean()', names(all.data)) # returns column indices
# Add these two vectors together, and keep the "Subject" and "Activity" columns
sm.cols <- sort(c(std.cols,mean.cols,562,563))
# Select only the required columns
sm.data <- all.data[,sm.cols]

# Step 3
# Replace activity values with descriptive activities from activity_labels.txt
act.labels <- read.table('activity_labels.txt', header=FALSE, stringsAsFactors = FALSE, col.names=c("Index", "Activity"))
sm.data$Activity <- act.labels[,2][match(sm.data$Activity, act.labels[,1])]

# Step 4
# Replace the labels of the data set with more descriptive terms
# Make a temporary vector to store column names
var.names.tmp <- names(sm.data)
var.names.tmp <- gsub("\\(\\)","",var.names.tmp)  #remove all parentheses
var.names.tmp <- gsub("-","",var.names.tmp)  #remove all dashes
var.names.tmp <- gsub("^f","freq",var.names.tmp)  #replace initial f with freq
var.names.tmp <- gsub("^t","time",var.names.tmp)  #replace initial t with time
var.names.tmp <- gsub("mean","Mean",var.names.tmp)  #capitalise Mean
var.names.tmp <- gsub("std","Std",var.names.tmp)  #capitalise Std
# Feed these names back in to sm.data
names(sm.data) <- var.names.tmp

# Step 5
# Collate the data using aggregate and the dot notation
summary.data <- aggregate(. ~ Subject+Activity, data=sm.data, na.rm=TRUE, mean)
# Write out the summary data
write.table(summary.data, 'project.RData', sep=' ', row.name = FALSE)
