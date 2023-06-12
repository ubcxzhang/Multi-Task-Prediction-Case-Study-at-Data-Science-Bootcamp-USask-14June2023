# Mixed Outcomes Practice Question

1. Load in the `HIV` dataset from the `MTPS` package
2. Convert `XX` and `YY` into matrices to use in MTPS
    - Now use all the outcomes from `YY` (`ABC`, `3TC`, `AZT`, `D4T`, and `DDI`)
3. Convert the **first 3 outcomes into binary values and leaving the last 2 outcomes as continuous**
    - Use the cutoffs from the MTPS lecture material in session 1
        - Use this cutoff code: `cutoffs <- c(2,3,3)`
    - Use the following code to convert the outcomes to binary: `for(ii in 1:3) ymat.mix[,ii] <- (10^ymat[,ii] < cutoffs[ii])`
4. Split the data into training and testing sets. Split the data 80/20
    - **NOTE:** Make sure to use `set.seed(123)` for consistent results
5. Fit a MTPS model using the Residual Stacking method (`cv=FALSE` and `residual=TRUE`
    - Use `glmnet.lasso` in `method.step1`
    - Use `rpart1` in `method.step2`
5. Using `predict()`, predict the probabilities for the binary outcomes and values for the continuous outcomes using the residual stacking built MTPS model









