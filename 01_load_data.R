train_url <- "http://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
test_url <- "http://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"
train_df <- read.csv(train_url,
                     stringsAsFactors=FALSE,
                     na.strings=c("NA","","#DIV/0!"))
test_df <- read.csv(test_url,
                    stringsAsFactors=FALSE,
                    na.strings=c("NA","","#DIV/0!"))


