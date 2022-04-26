# libraries required for analysis:

library(tidyverse)
library(ggplot2)
library(dplyr)
library(psych)
library(caTools)
library(caret)
library(randomForest)
library(corrplot)
library(MASS)



# load the data:

data<- read.csv('heart.csv',header = TRUE,sep = ',')
 #there are 303 rows and 14 columns in the data.

# display the first few rows of data:

head(data)

# understanding the data

glimpse(data)
# many categorical variables are mentioned as integers. 

summary(data)

# Research Question1: who is more vulnerable to heart disease, male or female?
# Research Question2: what is the main cause of heart disease in male and female.
# Research Question3: Is there any association between chest pain and heart disease?

# Checking for missing values:
sum(is.na(data))
# there are no missing values in the data.

# Count the patients with or without heart disease:
data %>% count(target)
# There are 165 people with heart disease and 138 people without heart disease.

# The proportion of males and females in the data:

data %>% group_by(sex)%>% summarise(percent= 100*n()/nrow(data))
#There are 31.7% female and 68.3% males in the dataset.

# Check the percentage of males and females having heart disease to get the answer for research question 1.
sub_female <- table(data[data$sex==0,]$target)
sub_male<- table(data[data$sex==1,]$target)
fm_combine <- rbind(sub_female,sub_male)
fm_combine

# there are only 24 female out of 96 who have diagnosed with heart disease but there are 114 males out 207 who have diagnosed with heart disease.
# This indicates that almost 55% males in the dataset are diagosed with heart disease whereas only 25% females have been diagnosed with heart disease.

# Finding 1: Males are more vulnerable to heart disease. 


# Area under the curve
# find probability of a patient to have heart disease in the age <=50

summary(data$ï..age)
sd(data$ï..age)

#In order to see the probability of having heart disease of the patient <=50yrs, we need to calculate z value =(x-mean)/sd:
pnorm(50,mean(data$ï..age), sd(data$ï..age))

# Finding 2: there is 31.5% chances of the person of <= 50yrs to have heart disease.

#Data Visualization:

# This is a barplot which will help to visualize the distribution of the heart disease.
barplot(table(data$target),main = 'heart disease distribution',col = 'blue')


#This is a barplot to visualize the distribution of heart disesase by Sex.
data$sex<- as.factor(data$sex)
data$cp<- as.factor(data$cp)
data$target<- as.factor(data$target)

ggplot(data, aes(x = target, fill = sex)) + 
  geom_bar(position = "fill") +
  labs(title = "Heart disease diagnosis Distributions by sex",
       x = "Heart disease diagnosis",
       y = "sex") +
  theme_test()


# This is a boxplot to visualize the distribution of heart disease by age and sex.
ggplot(data,aes(x=target, y= ï..age))+ geom_boxplot(aes(col= sex)) + labs(title = 'Heart diagnosis Distribution by Age and Sex',x='Heart Disease Diagnosis',y= 'age')+theme_test()

# This is a barplot to visualize the distribution of Heart disease diagnosis by chest pain
ggplot(data,aes(x= target, fill= cp))+ geom_bar(position = 'fill')+ labs(title = 'Heart diagnosis Distribution by Chest Pain',x='Heart Disease Diagnosis',y= 'Chest Pain')+theme_test()


# Barplot to visualize the distribution of heart disease by number of major vessels:
data$ca <- as.factor(data$ca)
ggplot(data, aes(x = target, fill= ca))+ geom_bar(position = 'fill')+ labs(title='The Heart Disease Diagnosis Distribution by Number of Major Vessels',x= 'Heart Disease Diagnosis',y= 'Number of major Vessels')+ theme_test()


#Heart disease diagnosis frequency by Resting electrocardiographic results and sex
data$restecg <- as.factor(data$restecg)
ggplot(data,aes(x= target, fill= restecg))+geom_bar(position='dodge')+facet_grid(~sex)+scale_fill_brewer(palette='Dark2')+labs(title = 'Distribution of Heart Disease by Restecg and Sex',x= 'Heart Disease Diagnosis', y= 'count')


# Feature Importance:
# There are different ways to identify the important features in the data.

#Correlation
#Random Forest: Gini Importance or Mean Decrease in Impurity (MDI) calculates each feature importance as the sum over the number of splits (across all tress) that include the feature, proportionally to the number of samples it splits.

data$sex<- as.numeric(data$sex)
data$cp <- as.numeric(data$cp)
data$restecg<- as.numeric(data$restecg)
data$ca<- as.numeric(data$ca)
data$target<- as.numeric(data$target)

correlations <- cor(data[,1:13])
corrplot(correlations, method="circle")

corelations = data.frame(cor(data[,1:13]))
corelations


#Split the data for females and males in order to find the most important factor leading to heart disease in each gender.

Male_data<- subset(data, sex ==1)
Female_data <- subset(data, sex !=1)


# Feature selection using Random Forest technique:
Feature_Importance_Males<- randomForest(target~.,data=Male_data, trees= 700)
importance(Feature_Importance_Males)
varImpPlot(Feature_Importance_Males,col='red', pch=20)


Feature_Importance_Females<- randomForest(target~.,data=Female_data, trees= 700)
importance(Feature_Importance_Females)
varImpPlot(Feature_Importance_Females,col='red', pch=20)


# Finding3:
# we can see from the values of IncNodePurity for both males and females that chest pain the most common factor.
# Maximum heart rate achieved is the highest cause factor to cause heart disease for females where is Thalassemia is the highest to cause heart disease for males.

# Inference:
#Hypothesis Testing:
# H0 (Null Hypothesis): There is no association between Chest pain and Heart disease diagnosis.
# H1: There is an association between Chest pain and Heart disease diagnosis.

#Logitic Regression Prediction
#Split the Data to training and testing data to conduct a logistic regression model
set.seed(123)
dt = sort(sample(nrow(data), nrow(data)*.7))
train<-data[dt,]
test<-data[-dt,]

#Perform a logistic regression model
Log_model <- glm(target ~., data= train,family = 'binomial')
summary(Log_model)

# Since p value for chest pain(cp) is almost zero at 99% confidence interval, so there are enough evidence to reject the null hypothesis. So there is a strong relation between chest pain and Heart disease Diagnosis.





