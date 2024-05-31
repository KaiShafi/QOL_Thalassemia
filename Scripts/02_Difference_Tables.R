#Load packages
library(tidyverse)
library(gtsummary)
library(gt)

#Import

data <- read.csv("Data/QOL_thalassemia_preprocessed.csv")





#Difference(2 groups)
# 1. Normal Distribution ~ Parametric test ~ t-test
# 2. Non Normal Distribution ~ Non Parametric test ~ Wilcoxon rank sum test-test
# 3. Alpha (cut off) p<= 0.05
data |> 
  select(Gender, 18:25) |> 
  tbl_summary(type = everything()~ "continuous",
              by = Gender) |> 
  add_overall() |> 
  add_p() |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("Tables/Table3_difference_2_groups.docx")

#Difference(2 groups)
# 1. Normal Distribution ~ Parametric test ~ t-test
# 2. Non Normal Distribution ~ Non Parametric test ~ Kruskal-Wallis rank sum test
# 3. Alpha (cut off) p<= 0.05

data |> 
  select(Type_of_Family, 18:25) |> 
  tbl_summary(type = everything()~ "continuous",
              by = Type_of_Family) |> 
  add_overall() |> 
  add_p() |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("Tables/Table4_difference_3_groups.docx")


