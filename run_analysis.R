library("reshape2")
library("plyr")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
extract_features <- grepl("mean|std", features)
id_labels   = c("subject", "ActivitityID", "ActivityLabel")

loadData<-function(type) {
  X <- read.table(paste("./UCI HAR Dataset/",type,"/X_",type,".txt",sep=""))
  y <- read.table(paste("./UCI HAR Dataset/",type,"/y_",type,".txt",sep=""))
  subject <- read.table(paste("./UCI HAR Dataset/",type,"/subject_",type,".txt",sep=""))
  names(X) = features
  X = X[,extract_features]
  y <- join(y,activity_labels)
  names(y) = id_labels[2:3]
  names(subject) = id_labels[1]
  data <- cbind(as.data.table(subject), y, X)
  data
}

test_data<-loadData("test")
train_data<-loadData("train")
final_data = rbind(test_data, train_data)


data_labels = setdiff(colnames(final_data), id_labels)
melt_data      = melt(final_data, id.vars = id_labels, measure.vars = data_labels)
tidy_data   = dcast(melt_data, subject + ActivityLabel ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt")
