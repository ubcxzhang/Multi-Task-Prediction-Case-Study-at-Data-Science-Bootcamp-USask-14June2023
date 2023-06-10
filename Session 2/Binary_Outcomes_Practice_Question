# Binary Outcomes Practice Question

1. Load in the `HIV` dataset from the `MTPS` package
2. Convert `XX` and `YY` into matrices to use in MTPS
    - Use only the last 2 outcomes from `YY`. That is, use `D4T`and `DDI`
3. Convert the outcome variables into binary values
    - Use the cutoffs from the MTPS lecture material in session 2
        - Use this cutoff code: `cutoffs<-c(1.5,1.5)`
    - Use the following code to convert the outcomes to binary: `for(ii in 1:2) ymat.bin[,ii] <- (10^ymat[,ii] < cutoffs[ii])`
4. Split the data into training and testing sets. Split the data 80/20
    - **NOTE:** Make sure to use `set.seed(123)` for consistent results
5. Fit a MTPS model using the Residual Stacking method (`cv=FALSE` and `residual=TRUE`
    - Use `rpart1` in `method.step1`
    - Use `lm1` in `method.step2`
    - Specify `resid.type="deviance"`
6. Using `predict()`, predict the outcome probabilities using the residual stacking built MTPS model
7. Create the confusion matrix for each binary outcome
    - Use 0.5 as the probability threshold
        - That is, predicted probability &ge 0.5 are assigned as 1 and predicted probability &lt 0 are assigned 0
        








