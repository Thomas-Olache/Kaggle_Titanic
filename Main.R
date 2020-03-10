#Author: Thomas Olache

#Load the Libraries
source(file.path("C:", "Users", "telep", "Documents", "Kaggle_Titanic_Prime", "Libraries.R"))

#Load the Data
#Split the training dataset into both a training and a validation set
train <- read.csv("train.csv")
#The test set does not have any result value
test <- read.csv("test.csv")

#The submission file is how your submission file should look
final_result <- read.csv("gender_submission.csv")

#Exploratory Data Analysis

##Look at the data structure
head(train)

str(train)

train$Survived <- as.factor(train$Survived)
train$Pclass <- as.factor(train$Pclass)

##Histogram
ggplot(data = train) + geom_histogram(mapping = aes(x = Age), binwidth = 10)
train %>% count(cut_width(Age, 10))

##Cluster
df <- train %>% na.omit()
