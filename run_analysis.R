timestamp()

# 1. We read the subject of both set and combing them. Same with the activitis levels

print("Reading subjects")
subject_training <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = " ", header = F)
subjecy_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep = " ", header = F)
subject <- rbind(subject_training, subjecy_test)
subject_training <- NULL
subjecy_test <- NULL
print(" subject length:")
print(length(subject[,1]))

print("Reading activities")
activity_training <- read.table("./UCI HAR Dataset/train/y_train.txt", sep = " ", header = F)
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt", sep = " ", header = F)
activity <- rbind(activity_training, activity_test)
activity_training <- NULL
activity_test <- NULL
print(" activity length:") 
print(length(activity[,1]))


# 2. We read the feature vectors, merge them and take only what we want. The sets are fixed width with 16 characters
# We choose what we need
#1 tBodyAcc-mean()-X
#2 tBodyAcc-mean()-Y
#3 tBodyAcc-mean()-Z
#4 tBodyAcc-std()-X
#5 tBodyAcc-std()-Y
#6 tBodyAcc-std()-Z
#121 tBodyGyro-mean()-X
#122 tBodyGyro-mean()-Y
#123 tBodyGyro-mean()-Z
#124 tBodyGyro-std()-X
#125 tBodyGyro-std()-Y
#126 tBodyGyro-std()-Z

print("Reading feature vector training")
feature_vector_training <- read.fwf("./UCI HAR Dataset/train/X_train.txt", widths = c(rep(16,6),rep(-16,(120-6)),rep(16,6),rep(-16,(561-126))))

print("Reading feature vector test")
feature_vector_test <- read.fwf("./UCI HAR Dataset/test/X_test.txt", widths = c(rep(16,6),rep(-16,(120-6)),rep(16,6),rep(-16,(561-126))))

feature_vector <- rbind(feature_vector_training, feature_vector_test)
feature_vector_training <- NULL
feature_vector_test <- NULL
print(" feature vector length:") 
print(length(feature_vector[,1]))


#3. We joint them in a tidy fashion
tidy_vector <- cbind(subject, activity)
tidy_vector <- cbind(tidy_vector, feature_vector)
subject <- NULL
activity <- NULL
feature_vector <- NULL

print(" tidy_vector length:")
print(length(tidy_vector[,1]))

#4. Name it properly
names(tidy_vector) <- c("Subject", "Activity", "BodyAcc-mean()-X", "BodyAcc-mean()-Y", "BodyAcc-mean()-Z", "BodyAcc-std()-X", "BodyAcc-std()-Y", "BodyAcc-std()-Z", "BodyGyro-mean()-X", "BodyGyro-mean()-Y", "BodyGyro-mean()-Z", "BodyGyro-std()-X", "BodyGyro-std()-Y", "BodyGyro-std()-Z")


#5. Change the activity labels
tidy_vector$Activity <- factor(tidy_vector$Activity, 1:6, c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

print(head(tidy_vector))

#6. We write it
write.csv(tidy_vector, file="tidy_vector.csv", row.names=F)


#7. And now the last tidy sumary

tidy_summary <- aggregate(tidy_vector[,3:14], list(tidy_vector$Subject, tidy_vector$Activity), mean)
names(tidy_summary) <- c("Subject", "Activity", "MEAN:BodyAcc-mean()-X", "MEAN:BodyAcc-mean()-Y", "MEAN:BodyAcc-mean()-Z", "MEAN:BodyAcc-std()-X", "MEAN:BodyAcc-std()-Y", "MEAN:BodyAcc-std()-Z", "MEAN:BodyGyro-mean()-X", "MEAN:BodyGyro-mean()-Y", "MEAN:BodyGyro-mean()-Z", "MEAN:BodyGyro-std()-X", "MEAN:BodyGyro-std()-Y", "MEAN:BodyGyro-std()-Z")

print(head(tidy_summary))
write.csv(tidy_summary, file="tidy_summary.csv", row.names=F)

# The End

