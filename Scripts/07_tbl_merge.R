#Load packages
library(tidyverse)
library(gtsummary)
library(gt)
library(easystats)

#Import

data <- read.csv("Data/QOL_thalassemia_preprocessed.csv")

#Univariate
uv_tbl <- data |> 
  select(1:8 ,Total_QOL_Score) |> 
  tbl_uvregression(
    method = lm,
    y = Total_QOL_Score) |> 
    bold_p(t = 0.05) 
 
#Multivariate

mv_lin_reg <- lm(Total_QOL_Score~ Age_of_Participants+Gender+Marital_Status+Type_of_Family+Level_of_Education+Occupational_Status+Area_of_Residence+Economic_Class, data = data)

report(mv_lin_reg)

#tbl_regression
mv_tbl <- mv_lin_reg |> 
  tbl_regression() |> 
  bold_p(t= 0.05) 
  
#Merge Table
tbl_merge(
  tbls = list(uv_tbl,mv_tbl),
  tab_spanner = c("**Univariate**","**Multivariate**")
) |> 
  as_gt() |> 
  gtsave("Tables/Tables10_merge_table.docx")
