## Ryan Elmore
## 13 Dec 2018
## Get tweets

## Inspiration
## https://github.com/abresler/markovifyR
## https://pushpullfork.com/mining-twitter-data-tidy-text-tags/

library(twitteR)
library(tidyverse)
library(tidytext)

source("src/key-info.R")

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

chucks_tweets <- userTimeline("@charliekirk11", n = 3200, includeRts=TRUE)
chuck_df <- twListToDF(chucks_tweets) 

chuck_df <- chuck_df %>%
  mutate(is_fakt = if_else(grepl("Fact", text), 1, 0),
         is_link = if_else(grepl("http", text), 1, 0))

group_by(chuck_df, is_fakt) %>%
  summarize(n = n())

## Only 86 fakts...bummer. Nevertheless, I persisted.

group_by(chuck_df, is_link) %>%
  summarize(n = n())

## He tweets a lot of linked bullshit


