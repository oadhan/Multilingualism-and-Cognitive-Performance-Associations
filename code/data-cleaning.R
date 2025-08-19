---
title: "Lab 2 - Multilingualism and Cognitive Performance"
author: "Oviya Adhan"
date: "2025-04-03"
---

# Import necessary libraries 
library(tidyverse)
library(here)

# LOAD IN SOURCE DATA
# Variables of interest: Number of Languages, Gender, Age, Education, Income, WCST Error
source_df <- read.csv(here("data", "external", "BS_dataset.csv")) %>%
  select(number_lang, gender, age, education, income, wcst_error)

View(source_df)
nrow(source_df) # 387
ncol(source_df) # 6
summary(source_df)


# REMOVE OBSERVATIONS WITH NA VALUES
# Check for NA values
sum(is.na(source_df$number_lang)) # Count: 0
sum(is.na(source_df$gender)) # Count: 1
sum(is.na(source_df$age)) # Count: 0
sum(is.na(source_df$education)) # Count: 0
sum(is.na(source_df$income)) # Count: 0
sum(is.na(source_df$wcst_error)) # Count: 129

# Remove rows with NA values in gender & wcst_error
clean_df <- source_df %>% drop_na(gender, wcst_error)
cat("Shape of source data. Rows:", nrow(source_df), "Columns:", ncol(source_df), "\n") # 387, 6
cat("Shape of processed data. Rows:", nrow(clean_df), "Columns:", ncol(clean_df), "\n") # 258, 6

# Rename wcst_error to cog_flex_errors (short for cognitive flexibility testing errors)
names(clean_df)[names(clean_df) == 'wcst_error'] <- 'cog_flex_errors'
clean_df <- unique(clean_df)
View(clean_df)

# Save processed data
write.csv(clean_df,file=here::here("data", "processed", "multilingualism.csv"), row.names=FALSE)
