# USASK Data Science Bootcamp (June 7-16, 2023)
# June 14, 2023. T7: Multi-Task Prediction Using Stacking Algorithms (MTPS)
# Session 1 (11:00am-11:30am): MTPS Tutorial
# TA: Kyle
# Tutors: Xiaowen


### Loading packages

rm(list=ls(all=TRUE)) 

install.packages("MTPS")
library(MTPS) 


### Loading datadata
data(HIV) 

?HIV 

head(XX[,1:10],10) 

head(YY,10) 




############ Revised Stacking for Continuous Outcomes #############

### Data Splitting
set.seed(12345)
xmat <- as.matrix(XX)
ymat <- as.matrix(YY)
nobs <- nrow(xmat)
training.id <- sample(seq_len(nobs), size = 0.8 * nobs)
y.train <- ymat[training.id, ]
y.test  <- ymat[-training.id, ]
x.train <- xmat[training.id, ]
x.test  <- xmat[-training.id, ]


### No stacking fit
fit.mult <- multiFit(xmat = x.train, ymat = y.train, method = glmnet.ridge, family = "gaussian")


### Types of Stacking
# Standard Stacking 
fit.ss <- MTPS(xmat = x.train, ymat = y.train, family = "gaussian",
               cv = FALSE, residual = FALSE,
               method.step1 = glmnet.ridge,
               method.step2 = rpart1)
# Cross-Validation Stacking 
fit.cv <- MTPS(xmat = x.train, ymat = y.train, family = "gaussian",
               cv = TRUE, residual = FALSE,
               method.step1 = glmnet.ridge,
               method.step2 = rpart1)
# Residual Stacking 
fit.rs <- MTPS(xmat = x.train, ymat = y.train, family = "gaussian",
               cv = FALSE, residual = TRUE,
               method.step1 = glmnet.ridge,
               method.step2 = rpart1)
# Cross-Validation Residual Stacking 
fit.cvrs <- MTPS(xmat = x.train, ymat = y.train, family = "gaussian",
                 cv = TRUE, residual = TRUE,
                 method.step1 = glmnet.ridge,
                 method.step2 = rpart1)


### Predicting values
# no stacking
pred.mult <- predict(fit.mult, x.test)
# Standard Stacking 
pred.ss <- predict(fit.ss, x.test)
# Cross-Validation Stacking 
pred.cv <- predict(fit.cv, x.test)
# Residual Stacking 
pred.rs <- predict(fit.rs, x.test)
# Cross-Validation Residual Stacking 
pred.cvrs <- predict(fit.cvrs, x.test)








############ Revised Stacking for Binary Outcomes #############

### Converting to binary and data splitting
# https://hivdb.stanford.edu/pages/published_analysis/genophenoPNAS2006/CUTOFFS/drug.cutoffs
# cutoff value to be used to define drug resistant
cutoffs <- c(2,3,3,1.5,1.5) 
ymat.bin <- ymat
xmat.bin <- xmat
for(ii in 1:5) ymat.bin[,ii] <- (10^ymat[,ii] < cutoffs[ii])
y.train.bin <- ymat.bin[training.id, ]
y.test.bin  <- ymat.bin[-training.id, ]
x.train.bin <- xmat.bin[training.id, ]
x.test.bin  <- xmat.bin[-training.id, ]


### Model fitting and prediction
fit.prs.std <- MTPS(xmat = x.train.bin, ymat=y.train.bin,
                    family = "binomial",
                    cv = FALSE, residual = TRUE,
                    method.step1 = rpart1,
                    method.step2 = lm1,
                    resid.type = "pearson", resid.std = TRUE) 

pred.prs.std <- predict(fit.prs.std, x.test.bin)


### Confusion Matrices
for (yy in 1 : ncol(y.test.bin)) {
  print(colnames(y.test.bin)[yy])
  print(table((pred.prs.std[,yy] > 0.5)*1, y.test.bin[,yy]))
}







############ Revised Stacking for Mixed Outcomes #############

### Creating mixed outcomes and data splitting
ymat.mix <- cbind(ymat[,1:3], ymat.bin[,4:5])
xmat.mix <- xmat
y.train.mix <- ymat.mix[training.id, ]
y.test.mix  <- ymat.mix[-training.id, ]
x.train.mix <- xmat.mix[training.id, ]
x.test.mix  <- xmat.mix[-training.id, ]


### Model fitting and prediction
fit.mix.rs <- MTPS(xmat = x.train.mix, ymat = y.train.mix,
                   family=c("gaussian","gaussian","gaussian","binomial","binomial"),
                   cv = FALSE, residual = TRUE,
                   method.step1 = glmnet.lasso,
                   method.step2 = rpart1)

pred.mix.rs <- predict(fit.mix.rs, x.test.mix)


### Confusion matrix for binary outcomes
for (yy in 4 : 5) {
  print(colnames(y.test.mix)[yy])
  print(table((pred.mix.rs[,yy] > 0.5) * 1, y.test.mix[,yy]))
}





































