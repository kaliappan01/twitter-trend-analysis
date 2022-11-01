install.packages('rjson')
library(rjson)
install.packages("stringr")
library(stringr)
install.packages("data.table")
library("data.table")

data <- fromJSON(file="Twitter API v2.postman_collection.json")


hashtags <- str_extract_all(data,"#[a-zA-Z0-9]+")

hashtags <- hashtags[[2]]

d <- table(hashtags)

df <- as.data.frame(d)

setorder(df,-Freq)

top5hashtags <- head(df,5)

barplot(top5hashtags$Freq, names.arg=top5hashtags$hashtags)

pie(top5hashtags$Freq,top5hashtags$hashtags)

savehistory(file="~/Documents/work/college/BDA/twitter_trends_analytics.R")

