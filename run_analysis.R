# load and merge data

# shared data
activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt')

x_test  <- read.table('UCI HAR Dataset/test/X_test.txt')
y_test  <- read.table('UCI HAR Dataset/test/y_test.txt')
y_test_labels <- activity_labels[y_test[,1],2]
subject_test  <- read.table('UCI HAR Dataset/test/subject_test.txt')
all_test <- cbind(subject_test, y_test, y_test_labels, x_test)

x_train <- read.table('UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('UCI HAR Dataset/train/y_train.txt')
y_train_labels <- activity_labels[y_train[,1],2]
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')
all_train <- cbind(subject_train, y_train, y_train_labels, x_train)

# do this here to avoid mismatching names
feature_names <- read.table('UCI HAR Dataset/features.txt')[,2]
all_names <- c('my_subject_id', 'my_activity_id', 'my_activity_label', 
               as.character(feature_names))
names(all_test) <- all_names
names(all_train) <- all_names

merged_data <- rbind(all_test, all_train)


mn <- names(merged_data)
mean_or_std <- names(merged_data)[grep('my_|std|mean',mn)]

needed_data_only <- merged_data[,mean_or_std]
grouped_data <- aggregate.data.frame(needed_data_only, list(needed_data_only$my_subject_id, needed_data_only$my_activity_label), mean)
# finally adjust columns and names
final_data <- grouped_data[,c(-3,-4,-5)]
names(final_data)[1:2] <- c("Subject", "Activity")
write.table(final_data, 'average-data-by-subject-and-activity.txt')
# read 