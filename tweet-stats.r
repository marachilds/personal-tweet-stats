library(dplyr)
library(splitstackshape)
library(plotly)

#Read in data
all.tweets <- read.csv("~/Google Drive/r/mara-tweets/tweets.csv")

#Remove retweets
my.tweets <- all.tweets[!grepl("RT", all.tweets$text),]

#Remove replies
no.replies <- my.tweets[!grepl("@", my.tweets$text),]

#Take only tweets and time stamp
mycol <- c("timestamp", "text")
df <- no.replies[mycol]

wordFreq <- data.frame(table(unlist(strsplit(tolower(df$text), " ")))) %>% arrange(desc(Freq))

