source("01_load_data.R") # loads train_df and test_df

prop_missing <- sapply(train_df[predictors], function(x) mean(is.na(x)))
missing_df <- data.frame(prop_missing)
missing_df$variable <- row.names(missing_df)

ggplot(missing_df[order(missing_df$prop_missing,decreasing=T), ],
       aes(x=variable,y=prop_missing)) +
  geom_bar(stat = "identity")

