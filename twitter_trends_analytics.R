install.packages('rjson')
library(rjson
)
data <- fromJSON(file="/home/kaliappan/Documents/work/college/NLP/MP/Twitter API v2.postman_collection.json")

install.packages("stringr")
library(stringr)

hashtags <- str_extract_all(data,"#[a-zA-Z0-9]*")

hashtags <- hashtags[[2]]

d <- table(hashtags)

top5hashtags <- d[table(d)>4]

df <- as.data.frame(d)

install.packages("data.table")
library("data.table")

setorder(df,-Freq)

top5hashtags <- head(df,5)

barplot(top5hashtags$Freq, names.arg=top5hashtags$hashtags)

savehistory(file="~/Documents/work/college/BDA/twitter_trends_analytics.R")


