source("01_load_data.R") # loads train_df and test_df

library("ggplot2")
library("gridExtra")
library("dplyr")
library("reshape2")

leave_out <- c("X",
               "user_name",
               "raw_timestamp_part_1",
               "raw_timestamp_part_2",
               "cvtd_timestamp",
               "new_window",
               "num_window",
               "classe")

all_na <- sapply(train_df, function(x) all(is.na(x)))
na_names <- names(train_df)[all_na]
predictors <- names(train_df)[!names(train_df) %in% c(leave_out, na_names)]

# train_long <- melt(train_df[train_df$user_name=="pedro",],
#                    id.vars=c("raw_timestamp_part_2","classe"),
#                    measure.vars=predictors)
# 
# ggplot(train_long,
#         aes(x=classe,
#                    y=value,
#                    color=classe)) +
#         geom_boxplot() +
#         facet_wrap(~variable, scales="free")

p <- list()
for(pred in predictors[1:4]) {
  p[[pred]] <- ggplot(train_df[train_df$user_name=="pedro",],
                     aes_string(x="raw_timestamp_part_2",
                                y=pred,
                                color="classe")) +
                    geom_line() +
                    ggtitle(pred)
}

args.list <- c(p, list(nrow=2, ncol=2)
do.call(grid.arrange, args.list)

p2 <- list()
for(pred in predictors) {
  p2[[pred]] <- ggplot(train_df,
                      aes_string(x="classe",
                                 y=pred,
                                 fill="classe")) +
                      geom_boxplot() +
                      ggtitle(pred)  
}

i = 1
n = 4
while(i <= length(predictors)){
  preds <- predictors[i:n]
  preds <- preds[!is.na(preds)]
  args.list <- c(p2[preds], list(nrow=2, ncol=2))
  do.call(grid.arrange, args.list)
  i = i + 4
  n = n + 4
}





