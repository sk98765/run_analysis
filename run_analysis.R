require(dplyr)
require(data.table)
# Read in column titles 
cname <- read.table("features.txt")
vname <- as.vector(cname)
rm(cname)
vname <- vname$V2

# Read in training and test set 
#   and give col names from features.txt
f1 <- read.table("X_train.txt",col.names = vname)
f2 <- read.table("X_test.txt", col.names = vname)

# Combine training and test data set
#  ff also has column names 
ff <- rbind(f1,f2)
rm(f1,f2)

# Extract only mean and std columns to 
#  a subset 
ff_mean <- ff[,grep("mean",colnames(ff))]
ff_std <- ff[,grep("std",colnames(ff))]

ff_tidy <- cbind(ff_mean,ff_std)
rm(ff,ff_mean,ff_std)

# Read in training and test lables 
#  and give a descriptive name to the only column
c1 <- read.table("y_train.txt", col.names = c("Activity"))
c2 <- read.table("y_test.txt", col.names = c("Activity"))

c_act <- rbind(c1,c2)
rm(c1,c2)

# Give descriptive name to c_act 
#  1 WALKING
#  2 WALKING_UPSTAIRS
#  3 WALKING_DOWNSTAIRS
#  4 SITTING
#  5 STANDING
#  6 LAYING
# Convert dc1 and dc2 to tbl_df for better data manipulation
c_act[c_act$Activity == 1,] <- "WALKING"
c_act[c_act$Activity == 2,] <- "WALKING_UPSTAIRS"
c_act[c_act$Activity == 3,] <- "WALKING_DOWNSTAIRS"
c_act[c_act$Activity == 4,] <- "SITTING"
c_act[c_act$Activity == 5,] <- "STANDING"
c_act[c_act$Activity == 6,] <- "LAYING"

# Read in subject from training and test set
s1 <- read.table("subject_train.txt", col.names = c("Subject"))
s2 <- read.table("subject_test.txt", col.names = c("Subject"))

s_subject <- rbind(s1,s2)
rm(s1,s2)

# Combine c_act with ff_tidy
df_tidy <- cbind(s_subject,c_act,ff_tidy)
rm(s_subject,c_act,ff_tidy)

dt2 <- as.data.table(df_tidy)
rm(df_tidy)

final_dt <- dt2[, lapply(.SD, mean), by = .(Activity, Subject)]


