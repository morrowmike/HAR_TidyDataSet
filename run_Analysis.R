run_Analysis <- function() {
  # read in test and training data from text files
  testActivities <-read.table("test/y_test.txt")        
  testData <-read.table("test/X_test.txt")
  trainActivities <- read.table("train/y_train.txt")
  trainData <-read.table("train/X_train.txt")
  
  # first merge the activities with the observations for test and train data
  # then merge testData and trainData together in one data frame
  testData<- cbind(testActivities,testData)
  trainData<- cbind(trainActivities,trainData)
  combinedData <- rbind(testData,trainData)
  
  # read in descriptive variable names from the features files and use them to label the data
  namesData <-read.table("features.txt") 
  #names is the second column in this data.frame
  namesVector <- as.character(namesData[,2])
  namesVector <- append(namesVector,"Activity",after=0)
  names(combinedData) <- namesVector
  
  # read in activity labels from the activity_labels file and replace numeric activities with descriptive names
  activityLabels <- read.table("activity_labels.txt")
  combinedData <- merge(activityLabels,combinedData,by.x = "V1",by.y = "Activity")
  namesVector<-names(combinedData)
  
  # identify all columns which contain the phrase "mean()" or "std()" and eliminate other variables
  # also keep the second column because this includes the activities
  keepCols <- c(2,grep("mean()",namesVector,fixed=TRUE), grep("std()",namesVector,fixed=TRUE))
  combinedData<-combinedData[,keepCols]
  
  # remove all special characters from names and 
  # capitalize the "M" in mean and the "S" in std to make them easier to read and
  # eliminate the "BodyBody" string in variables, replacing with "Body"
  namesVector<-names(combinedData)
  namesVector<-gsub("\\(","",namesVector)
  namesVector<-gsub("\\)","",namesVector)
  namesVector<-gsub("\\-","",namesVector)
  namesVector<-gsub("mean","Mean",namesVector)
  namesVector<-gsub("std","Std",namesVector)
  namesVector<-gsub("BodyBody","Body",namesVector)
  names(combinedData)<-namesVector
  
  #create aggregated mean by activity
  tidyData <- aggregate(combinedData[2:ncol(combinedData)],list(combinedData$V2),mean)
  names(tidyData)[1]<-"Activity"
  tidyData
  
}