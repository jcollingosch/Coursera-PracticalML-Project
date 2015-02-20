source("03_clean.R") # loads train_df, test_df, predictors

library("caret")
library("doParallel")

# register parallel backend
registerDoParallel(makeCluster(4))

set.seed(123)
fitControl <- trainControl(method = "cv", number = 5)

fit <- train(y = factor(train_df$classe),
             x = train_df[predictors],
             method = "rf",
             trControl = fitControl,
             ntree = 1000)

save(fit, file = "rfFit.Rdata")

preds <- predict(fit, newdata=test_df[predictors])

pml_write_files = function(x){
  n = length(x)
  for(i in 1:n){
    filename = paste0("results/problem_id_",i,".txt")
    write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
  }
}

pml_write_files(as.character(preds))
