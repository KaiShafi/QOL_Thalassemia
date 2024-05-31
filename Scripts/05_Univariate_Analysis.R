#Load packages
library(tidyverse)
library(gtsummary)
library(gt)
library(easystats)

#Import

data <- read.csv("Data/QOL_thalassemia_preprocessed.csv")

#Univariate_linear_regression analysis(outcome~ Numeric>-Continuous)
# Y(total_qol_score) x(Gender)
uv_lin_model = lm(Total_QOL_Score~ Gender, data = data)

#summary
summary(uv_lin_model)

#Interpretation
report(uv_lin_model)

#Factors associated with Qol_score in univariate linear regression
data |> 
  select(1:8 ,Total_QOL_Score) |> 
  tbl_uvregression(
    method = lm,
    y = Total_QOL_Score
  ) |> 
  bold_p(t = 0.05) |> 
  as_gt() |>  
  gtsave("Tables/Tables6_Uv_Linreg.docx")
  