require(dplyr)
# Read in column titles 
cname <- read.table("features.txt")
vname <- as.vector(cname)
rm(cname)
vname <- vname$V2
# Read in training and test set 
#   and give col names from features.txt
f1 <- read.table("./train/X_train.txt",col.names = vname)
f2 <- read.table("./test/X_test.txt", col.names = vname)
# Read in training and test lables 
#  and give a descriptive name to the only column
c1 <- read.table("./train/y_train.txt", col.names = c("Activity"))
c2 <- read.table("./test/y_test.txt", col.names = c("Activity"))

# Combine training lable with training set
dc1 <- cbind(c1,f1)
# Combine test lable with test set
dc2 <- cbind(c2,f2)

# Convert dc1 and dc2 to tbl_df for better data manipulation
dt1 <- tbl_df(dc1)
dt2 <- tbl_df(dc2)
dt <- rbind(dt1,dt2)

# Filter out columns with mean or std 
dt_mean <- select(dt, contains("mean"))
dt_std <- select(dt, contains("std"))

# df_t contains only mean or std names for the col names
dt_f <- cbind(dt_mean,dt_std)