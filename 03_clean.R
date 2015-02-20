source("01_load_data.R") # loads train_df and test_df

leave_out <- c("X",
               "user_name",
               "raw_timestamp_part_1",
               "raw_timestamp_part_2",
               "cvtd_timestamp",
               "new_window",
               "num_window",
               "classe")


prop_missing <- sapply(train_df, function(x) mean(is.na(x)))
na_names <- names(prop_missing)[prop_missing > 0.9]

predictors <- names(train_df)[!names(train_df) %in% c(leave_out, na_names)]

