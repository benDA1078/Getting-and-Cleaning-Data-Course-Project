Data that will be used: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# 1.) Always a good rule of thumb to download two versions. One in RStudio (URL) and another onto your local files

# 2.) Before beginning to clean the data be sure to install the following packages to makwe the process easy 
  install.packages("data.table")
    library(data.table")
  install.packages("jsonlite")
    library(jsonlite)
  ## Kept running into an issue with separating the variables into columns so after research in Stack Overflow and GitHub use the following package 12-7-2022
      install.packghes("reshape2")
        library(reshape2)

# 3.) Next is to download the following that will be used for its data. I later changed the name to "smartphone" cause its the study that I am understanding of this project 
## However be sure to unzip the files cause I ran into an issue with not unzipping the files causing issues that would have been simple from the beginning
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, file.path(path, "dataFiles.zip"))
  unzip(zipfile = "dataFiles.zip")
  smartphone <- unzip 

# 4.) Load the activity labels & features 
    activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
    features <- read.table("UCI HAR Dataset/features.txt")
      ## If messing up and want to remove data use the (remove()) function to delete 

# 5.) Exctract ONLY the data on MEAN and STANDARD DEVIATION
  featuresWanted <- grep(".*mean.*|.*std.*", features[,2])

# 6.) Load the datasets
  ## If you downloaded the zip.file onto your local files. The two folders that are going to be used is "test" & "train" 
  ## Also include the file location ("UCI HAR Dataset/ ->)
    train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresWanted]
    trainactivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
    trainsubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
    # Use ("cbind") to merge the two data together. Same will go for "test"
      train <- cbind(trainactivities, trainsubjects, train)
      
    test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresWanted]
    testactivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
    testsubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
    test <- cbind(testactivities, testsubjects, test)

# 7.) Merge the Datasets and Labels 
  Data <- rbind(train, test)
  colnames(data) <- c("subject", "activity", featuresWanted)
