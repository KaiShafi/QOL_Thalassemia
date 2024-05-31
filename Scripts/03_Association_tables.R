#Load packages
library(tidyverse)
library(gtsummary)
library(gt)

#Import

data <- read.csv("Data/QOL_thalassemia_preprocessed.csv")

#Association
#There is not relation between demographic factor & 
#Quality of life status.because P-value is not 
#significant.

# Chi sq. test is used for association.
# if freq. is less than 5% then use fisher test.
data |> 
  select(quality_status_binary,2:8) |> 
  tbl_summary(by = quality_status_binary) |> 
  add_overall() |> 
  add_p() |> 
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("Tables/Tables5_Association.docx")


