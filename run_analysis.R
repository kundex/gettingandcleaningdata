options(scipen=999) # non-scientific number format
options(digits=2) # round to 2 decimal places
library(tidyverse) # includes ggplot2, tibble, tidyr, readr, purrr, dplyr

if(!file.exists("UCI HAR Dataset")){
  url <- ("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
  download.file(url, destfile = "activity.zip")
  unzip("activity.zip")
  file.remove("activity.zip")
}
# Test Data
set_test <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
lbl_test <- read.csv("./UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)
sbj_test <- read.csv("./UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

# Training Data
set_train <- read.csv("./UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
lbl_train <- read.csv("./UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)
sbj_train <- read.csv("./UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

# Feature Names Extraction
ftr <- read.csv("./UCI HAR Dataset/features.txt", sep="", header=FALSE)
ftr_nms <- as.vector(ftr$V2)

# Activity Names Extraction
act <- read.csv("./UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
act_nms <- as.vector(act$V2)

test <- bind_cols(sbj_test, lbl_test, set_test)
train <- bind_cols(sbj_train, lbl_train, set_train)
all <- bind_rows(test, train)

colnames(all) <- c("Subject", "Label", ftr_nms)
# Tidy up!
rm("lbl_train", "sbj_train", "set_train", "lbl_test", "sbj_test", "set_test", "test", "train", "ftr", "ftr_nms")

all_extr <- bind_cols(all[c("Subject", "Label")], all[grep("std", colnames(all))], all[grep("mean", colnames(all))])
# Tidy up!
rm("all")

label <- factor(all_extr$Label)
levels(label) <- act_nms
all_extr$Label <- label

average_all_extr <- all_extr %>% 
  group_by(Subject, Label) %>% 
  summarise_all(funs(mean))

write_csv(average_all_extr, "tidy_average_data.csv")