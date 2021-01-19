# import data 

data = read.csv('Data.csv')
print(data)

# handle missing values 

data$Age = ifelse( is.na(data$Age), 
                  ave(data$Age, FUN = function(x)mean(x, na.rm = TRUE)), 
                      data$Age) 

# data$Age -> data['Age']
# ifelse(test, true, false)
# test values are data['Age'] is 'Nan'
# if true, 'ave' of 'data['Age'] returns to the rows 
# Fun is calling a function and the function(x) is the mean(x) 
# x is the input vector 
# na.rm = true: the function whether or not to remove NA
# if false (else), then, keep the values

data$Salary = ifelse( is.na(data$Salary), 
                   ave(data$Salary, FUN = function(x)mean(x, na.rm = TRUE)), 
                   data$Salary)

# encoding categorical variables 

data$Country = factor(data$Country, 
                      levels = c('France', 'Spain', 'Germany'), 
                      labels = c(1, 2, 3))

# F1 is jump to 'HELP' and easy to check args
# factor(): to encode a vector as a factor (for categorical to numerical)
# factor(vector of data, levels, labels)
# c() is a vector 
# c('France', 'Spain', 'Germany') is creating 1D vector/array
# labels is an optional character vector of labels for the levels 
# France corresponds as 1, Spain is 2 and Germany is 3 

data$Purchased = factor(data$Purchased, 
                     levels = c('Yes', 'No'), 
                     labels = c(1, 0))

# split dataset into train and test *must have 'caTools' from library
set.seed(123)
split = sample.split(data$Purchased, SplitRatio = 0.8)
train = subset(data, split == TRUE)
test = subset(data, split == FALSE)

# why 0.8? because a lot of train like 0.95 is too much and might beyond the focus 
# set.seed() is random_state in python 
# sample.split(Y, train_ratio -> returns True )
# subset(object to be subsetted, table name == True or False)
# returned values from split ration (for train) is true, so train is True
# then, false is for test 

# feature scaling 
train[, 2:3] = scale(train[, 2:3])
test[, 2:3] = scale(test[, 2:3])

# [row, columns] 
# [, between 2 and 3] * R starts from 1 
# [,] no space is all in R