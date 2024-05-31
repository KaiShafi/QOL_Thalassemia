#Load packages
library(tidyverse)
library(gtsummary)
library(gt)

#Import

data <- read.csv("Data/QOL_thalassemia_preprocessed.csv")

#Demographic Characteristics of study participants
data |> 
  select(1:8) |>
   tbl_summary( statistic = list(
     all_continuous()~ "{mean}({sd})"
   )) |> 
  as_gt() |> 
  gtsave("Tables/Table1_Demographics.docx")

#Clinical Characteristics of Thalassemia Patieents
data |> 
  select(9:17) |> 
  tbl_summary(type = all_categorical()~ "categorical",
              statistic = list(all_continuous() ~ {"mean}({sd})"}))|> 
  as_gt() |> 
  gtsave("Tables/Tables2_Clinical_Characteristics_of_Thalassemia_patient.docx")

