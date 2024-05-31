#Load packages
library(tidyverse)
library(gtsummary)
library(gt)
library(easystats)

#Import

data <- read.csv("Data/QOL_thalassemia_preprocessed.csv")

#correlation
cor(data$Total_QOL_Score,data$Age_of_Participants)
cor(data$Total_QOL_Score,data$Medical_Expense)
#Correlation Analysis
cor.test(data$Total_QOL_Score,data$Age_of_Participants)


#create numeric dataset
corr_data <-data |> 
  select(18:28)

#perform correlation analysis
corr_results <- correlation(corr_data)

#summary
corr_results |> 
  summary(redundant = T) |> 
  plot()
ggsave("Figures/test.tiff" ,height = 6, width= 15, 
        units='in', dpi=600, compression = 'lzw')

