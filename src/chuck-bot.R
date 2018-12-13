## Ryan Elmore
## 13 Dec 2018
## Markovify bot

## devtools::install_github("abresler/markovifyR")
library(markovifyR)
library(tidyverse)

fakts <- filter(chuck_clean_df, is_fakt == 1) %>%
  select(new_text) %>%
  .[[1]]

markov_model <- generate_markovify_model(
  input_text = fakts,
  markov_state_size = 2L,
  max_overlap_total = 15,
  max_overlap_ratio = .65
  )


markovify_text(
  markov_model = markov_model,
  maximum_sentence_length = NULL,
  output_column_name = 'kirk-bot',
  count = 50,
  tries = 100,
  only_distinct = TRUE,
  return_message = TRUE)
  

