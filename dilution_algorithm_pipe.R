#!/usr/bin/env Rscript
library(optparse)
library(tidyverse)
library(readxl)

option <-
  list(make_option(c("-i", "--inputfile"), help = ".xlsx or .csv"),
       make_option(c("-v", "--dilution_volume"), default = 8, help = "a number for aimed dilution volume (µL), default 8"),
       make_option(c("-c", "--dilution_concentration"), default = 12, help = "a number for aimed dilution concentration (ng/µL), default 12"))
file <- parse_args(OptionParser(option_list = option))$inputfile
V_d <- parse_args(OptionParser(option_list = option))$dilution_volume
C_d <- parse_args(OptionParser(option_list = option))$dilution_concentration

best_vol <- function(input_tb, iV_d, iC_d) {
  rp <- 0.5
  exe <- "yes"
  if (input_tb$`Nucleic Acid` <= 13) {
    paste("Use", "It", "Right", "Away")
  } else {
    while (exe == "yes") {
      V_d <- round(rexp(n = 50000, rate = rp) + iV_d, digits = 2)
      C_d <-round(rgamma(n = 50000, shape = 4, rate = 1) + iC_d, digits = 2)
      C_o <- input_tb$`Nucleic Acid` %>% rep(times = length(V_d))
      
      tb <-tibble(V_d, C_d, C_o) %>% mutate(V_o = (V_d * C_d) / C_o)
      
      V_d_score <-dexp(V_d - iV_d, rate = rp) / dexp(0, rate = rp) * 0.25
      C_d_score <-dgamma(C_d - iC_d, shape = 4, rate = 1) / dgamma(3, shape = 4, rate = 1) * 0.25
      V_o_score <-dgamma(tb$V_o - 0.8, shape = 1.2, rate = 1) / dgamma(0.2, shape = 1.2, rate = 1) * 0.5
      
      sc_tb <- tb %>%
        mutate(V_d_score,
               C_d_score,
               V_o_score,
               ttl_score = V_d_score + C_d_score + V_o_score) %>%
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
dd <- dd %>% 
  mutate(identifier=paste(`Sample ID`, `Date and Time`, sep = '_')) %>% 
  group_by(`identifier`) %>%
  nest() %>%
  mutate(value = map(data, ~best_vol(.x, iV_d = V_d, iC_d = C_d))) %>%
  unnest() %>%
  separate(
    col = value,
    into = c('Target vol', 'Target conc', 'Ori vol', 'Added TE vol'),
    sep = ' '
  ) %>% 
  select(-identifier) %>% 
  select(`#`,`Sample ID`, everything())
dd$Unit <- rep('ng/uL', nrow(dd))

write_csv(dd, "output.csv")
