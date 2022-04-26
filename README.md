# Heart_Disease_Analysis

![Heart-Disease-Statistics-1](https://user-images.githubusercontent.com/90656596/165326283-141bf2cd-6176-4204-9d39-38db78734f32.png)


## Part 1 - Introduction

Our heart is one of the most important organs in our body. There are five great vessels enter and leave the heart: the superior and inferior vena cava, the pulmonary artery, the pulmonary vein, and the aorta. Malfunctions of the heart is called Heart Disease or Cardiac Disease.

There are many factors that can increase the risk of getting heart disease. Some of these factors are out of control, but many of them can be avoided by choosing to live a healthy lifestyle. The factors that cannot be controlled are: Gender,age, family history, heart shape. The controllable risk factors are: High blood pressure, cholesterol level, obesity, smoking, and diabetes.

Heart disease is a leading cause of death. One person dies every 36 seconds in the United States from cardiovascular disease. About 655,000 Americans die from heart disease each year, that is 1 in every 4 deaths. In this analysis, I have used heart disease dataset to explore the highest important features that leads to heart disease in males and females. I have also done hypothesis testing to know if there is any association between chest pain and heart disease diagnosis using logistic regression.


### Purpose of the Analysis:
Heart disease analysis and prediction

### Research questions:
- Who is more vulnerable to be diagnosed with the heart disease, Males or Females?
- What is the most common factor for both males and females to have the highest cause of heart disease?
- What are important features that cause heart disesse in males and females?
- Is there any association between chest pain and heart disease diagnosis?


### Analysis Methods:
- Statistical Analysis
-  Feature importance/selection
- Logistic regression modeling


## Part 2- Data:
Data has been taken from Kaggle. This is an observational study. The data has 303 observations and 14 features like age, gender, chest pain, blood pressure, cholestrol etc. The target variable is to diagnose the heart disease. 


## Part 3- Exploratory Data Analysis:

- I started by understanding the data in a better way using summary, glimpse and checking data types and NA values. 
- Then I checked how many patients are there with heart disease and without heart disease.
- Next, I figured who is more vulnerable to heart disease, Males or Females.
- I also found the probability of the patients less than 50yrs of age getting heart disease.


## Part 4- Data Visualization:

To dive a bit deeper in the data, I picked some features in the dataset like ï..age, sex, cp, ca, restecg, target etc. 

- age:	      Patient’s age in years
- sex:	      Gender
- cp:         Type of chest-pain
- restecg:	  Resting electrocardiographic results
- thalach:   	Maximum heart rate achieved
- target:	    Diagnosis of heart disease



 
 
 ### Visualization of the distribution of heart disease diagnosis
 
 ![heart disease distribution](https://user-images.githubusercontent.com/90656596/165344827-3078aa8d-97bb-4f43-835d-683a66785fd1.png)
 
 
 
 ### Heart Disease Diagnosis by Gender
 
 
 ![Heart Disease diagnosis by sex](https://user-images.githubusercontent.com/90656596/165345403-161a5b3f-8117-4281-8af8-2d9cf7640491.png)
 
 
 
 ### Heart Disease Diagnosis Distribution by Age and Sex
 
 
 
![Heart Disease Distribution by Age and Sex](https://user-images.githubusercontent.com/90656596/165345939-082fbf01-04cf-4548-a7d2-564b212f2bd3.png)



### Heart Disease Diagnosis Distribution by Chest Pain



![Heart Disease Distribution by Chest Pain](https://user-images.githubusercontent.com/90656596/165346234-23f4a697-71cc-4c5d-9555-867ced59a608.png)



### Heart Disease Diagnosis Distribution by number of major vessels




![Heart Disease Diagnosis by Number of Major Vessels](https://user-images.githubusercontent.com/90656596/165346625-8f4f09b5-157f-4920-9dc1-c797447d9e37.png)




### Heart Disease Diagnosis Distribution by Restecg and Sex



![Heart Disease Diagnosis by Restecg and Sex](https://user-images.githubusercontent.com/90656596/165347496-e6f5a684-b82f-4d83-beab-5a31aa60facf.png)



### Feature Importance
There are different ways to identify the important features in the data.

Correlation


![Correlation](https://user-images.githubusercontent.com/90656596/165357598-ade168b2-9f89-43fa-ab2d-8ce544d4e53f.png)

 

- Random Forest: IncNodePurity calculates each feature importance as the sum over the number of splits (across all tress) that include the feature, proportionally to the number of samples it splits.
I Splitted the data for females and males in order to find the most important factor leading to heart disease in each gender.



![varImpPlot for males](https://user-images.githubusercontent.com/90656596/165357946-2a2dc23b-7ced-44f0-8cf8-efec5e961d02.png)




![varImpPlot for females](https://user-images.githubusercontent.com/90656596/165357979-b2ba09e7-a6f0-4cc9-a23a-7d5f81093dbd.png)


## Part 4 - Inference

### Hypothesis Testing

H0 = There is no association between chest pain and heart disease diagnosis

HA = There is association between chest pain and heart disease diagnosis

I used Logistic regression for hypothesis testing.
Results: There are not enough evidence to reject the null hypothesis. So there is an association between chest pain and heart disease diagnosis.

## Part 5- Conclusion:

1- Males are more vulnerable to be diagnosed with heart disease than females.

2- Chest Pain is most common factor that leads to heart disease for males and females.

3- Maximum heart rate achieved is the highest cause factor to cause heart disease for females where is Thalassemia is the highest to cause heart disease for males.

4- There is a high association between chest pain and heart disease diagnosis.

