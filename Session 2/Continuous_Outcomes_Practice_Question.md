# Continuous Outcomes Practice Question

1. Load in the `HIV` dataset from the `MTPS` package
2. Convert `XX` and `YY` into matrices to use in MTPS
    - Use only the first 3 outcomes from `YY`. That is, use `ABC`, `3TC`, and `AZT`
3. Split the data into training and testing sets. Split the data 80/20
    - **NOTE:** Make sure to use `set.seed(123)` for consistent results
4. Fit a MTPS model using the Residual Stacking method (`cv=FALSE` and `residual=TRUE`
    - Use `glmnet1` in `method.step1`
    - Use `rpart1` in `method.step2`
5. Using `predict()`, predicte the outcome values using the residual stacking built MTPS model








