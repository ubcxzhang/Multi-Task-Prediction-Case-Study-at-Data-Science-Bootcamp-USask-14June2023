# Session 1: Multi-Task Prediction Using Stacking Algorithms (MTPS)
We will introduce ensemble machine learning approaches and introduce the recently developed MTPS method. Then we will demonstrate how to implement this algorithm in R. For this section, Kyle is the teaching assistant (TA) and Xiaowen is the tutor

## Overview
Dr. Zhong will outline ensemble machine learning approaches. They will then outline the mechanisms of their newly developed Multi-Task Prediction Using Stacking Algorithms (MTPS) and its uses.

After Dr. Zhong's lecture, Kyle will walk through how to utilize MTPS in R. The following will outline the structure of this MTPS R implementation.

### Loading in the `HIV` dataset from the `MTPS` package
- Explore the predictor set `XX`
- Explore the outcome set `YY`

### Preforming MTPS With Continous Outcomes
- Converting dataframes `XX` and `YY` to matrices to use in MTPS
- Splitting the data into training and testing sets
- Fitting models with Standard Stacking
- Fitting models with Cross-Validation Stacking
- Fitting models with Residual Stacking
- Fitting models with Cross-Validation Residual Stacking
- Predicting outcomes for each of the above models
- Visualizing predicted values vs true values for the outcomes by method

### Preforming MTPS with Binary Outcomes
 - Defining cutoffs for outcomes based `HIV` database website
 - Converting continous outcomes in `YY` to binary based on cutoffs
 - Splitting data into training and testing sets
 - Building MTPS model for binary outcomes
 - Predicting probabilities using the built MTPS model
 - Displaying confusion matrix based on threshold of 0.5 for predicted probabilites

### Preforming MTPS with Mixed Outcomes (Continuous and Binary)
- Creating new outcome dataframe where the first 3 outcomes are continuous and the last 2 outcomes are binary
- Splitting the data into training and testing sets
- Building MTPS model for mixed outcomes
- Predicting values for continous outcomes and probabilities for binary outcomes
- Visualizing predicted values vs true values for continuous outcomes
- Displaying confusion matrix based on threshold of 0.5 for predicted probabilites for binary outcomes

## Schedule
- 9:30am-11:00am: Dr. Zhong will outline ensemble machine learning approaches. After this quick introduction, MTPS will be explored.
- 11:00am-11:30am: Kyle will walk through the R code behind MTPS. They explain how to use MTPS with continous, binary and mixed outcomes
