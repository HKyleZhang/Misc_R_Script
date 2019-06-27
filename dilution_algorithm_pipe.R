#!/usr/bin/env Rscript
library(optparse)
library(tidyverse)
library(readxl)

option <-
  list(make_option(c("-i", "--inputfile"), help = ".xlsx or .csv"))
file <- parse_args(OptionParser(option_list = option))$inputfile

best_vol <- function(input_tb) {
  rp <- 0.5
  exe <- "yes"
  if (input_tb$`Nucleic Acid` <= 13) {
    paste("Use", "It", "Right", "Away")
  } else {
    while (exe == "yes") {
      V_d <- round(rexp(n = 50000, rate = rp) + 8, digits = 2)
      C_d <-round(rgamma(n = 50000, shape = 4, rate = 1) + 12, digits = 2)
      C_o <- input_tb$`Nucleic Acid` %>% rep(times = length(V_d))
      
      tb <-tibble(V_d, C_d, C_o) %>%  mutate(V_o = (V_d * C_d) / C_o)
      
      V_d_score <-dexp(V_d - 8, rate = rp) / dexp(0, rate = rp) * 0.25
      C_d_score <-dgamma(C_d - 12, shape = 4, rate = 1) / dgamma(3, shape = 4, rate = 1) * 0.25
      V_o_score <-dgamma(tb$V_o - 0.8, shape = 1.2, rate = 1) / dgamma(0.2, shape = 1.2, rate = 1) * 0.5
      
      sc_tb <- tb %>%
        mutate(V_d_score,
               C_d_score,
               V_o_score,
               ttl_score = sum(V_d_score, C_d_score, V_o_score)) %>%
        arrange(desc(ttl_score), desc(V_o_score)) %>%
        .[1, ] %>%
        mutate(te = V_d - V_o)
      
      if (sc_tb$V_o_score == 0 & rp > 0) {
        exe <- "yes"
        rp <- rp - 0.01
      } else {
        exe <- "no"
      }
    }
    
    paste(sc_tb$V_d,
          sc_tb$C_d,
          round(sc_tb$V_o, digits = 2),
          round(sc_tb$te, digits = 2))
  }
}

dd <- read_excel(file)
dd <- dd %>% group_by(`Sample ID`) %>%
  nest() %>%
  mutate(value = map(data, best_vol)) %>%
  unnest() %>%
  separate(
    col = value,
    into = c('Target vol', 'Target conc', 'Ori vol', 'Added TE vol'),
    sep = ' '
  )
dd$Unit <- rep('ng/uL', nrow(dd))

write_csv(dd, "output.csv")
