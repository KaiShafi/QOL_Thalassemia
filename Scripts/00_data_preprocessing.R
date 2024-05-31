#load Packages
library(tidyverse)
library(naniar)

#Import data
data <- read.csv("Data/QOL_Thalassemia.csv")
data

#check missing
miss_var_summary(data)
gg_miss_var(data)

#Quality of life status(binary outcome)

data <- data |> 
  mutate(quality_status_binary = case_when(
    Total_QOL_Score < 50 ~ "poor",
    Total_QOL_Score > 50 ~ "Good"
  ))
  
data <- data |> 
  mutate(quality_status_code = case_when(
    Total_QOL_Score < 50 ~ 0, #poor
    Total_QOL_Score > 50 ~ 1 #Good
  ))

#Total quality of life status(ordinal Outcome)

data<-data |> 
  mutate(quality_status_ordinal = case_when(
    Total_QOL_Score < 40 ~ "Poor",
    Total_QOL_Score >= 40 & Total_QOL_Score <=60 ~ "Moderate",
    Total_QOL_Score >60 ~ "Good"
  ))

data<-data |> 
  mutate(quality_status_ordinal_code = case_when(
    Total_QOL_Score < 40 ~ 1, #Poor
    Total_QOL_Score >= 40 & Total_QOL_Score <=60 ~ 2,#Moderate
    Total_QOL_Score >60 ~ 3 #Good
  ))

#export data

write.csv(data,"Data/QOL_Thalassemia_preprocessed.csv" , row.names = F)



  
  
  
  
  
  
  
  