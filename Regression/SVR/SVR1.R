#SVR

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Fitting SVR to the dataset
#install.packages('e1071')
library(e1071)
regressor = svm(formula = Salary ~ .,
                data = dataset ,
                type = 'eps-regression')

# Predicting a  new result with Linear Regression
y_pred = predict(regressor, data.frame(Level = 6.5))


# Visualising the SVR results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = "red") + 
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = "blue") +
  ggtitle('Truth or Bluff (SVR)') +
  xlab("level") +
  ylab("Salary")

