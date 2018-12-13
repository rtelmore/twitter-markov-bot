## Ryan Elmore
## 13 Dec 2018
## Markovify bot

## devtools::install_github("abresler/markovifyR")
library(markovifyR)
library(tidyverse)

fakts <- filter(chuck_df, 
                is_fakt == 1) %>%
  select(text) %>%
  .[[1]]

options(width=200)
markov_model <-
  generate_markovify_model(
    input_text = fakts,
    markov_state_size = 2L,
    max_overlap_total = 15,
    max_overlap_ratio = .7
  )

markovify_text(
  markov_model = markov_model,
  maximum_sentence_length = NULL,
  output_column_name = 'kirk-bot',
  count = 25,
  tries = 100,
  only_distinct = TRUE,
  return_message = TRUE
)

