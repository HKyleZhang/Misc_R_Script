# 1. Load packages, install these packages if they are not in your R
library(tidyverse) # Version 1.3.0
library(readxl)

# 2. Make the input tibble
# Option 1. use the readxl::read_excel function to read excel file, 
#           but it requires external file transformation from xml to xlsx 
#           because Nanodrop is only able to export xml not xlsx.
# Option 2. use the readr::read_tsv function to read tsv file. 

# 3. Load the following functions
# V_d: Volume of the dilution in µL that you aim for.
# C_d: Concentration of the dilution in ng/µL that you aim for.
dil <- function(input, V_d = 8, C_d = 12) {
  input <- as_tibble(input) %>% 
    mutate(identifier=paste(`Sample ID`, `Date and Time`, sep = '_')) %>%
    nest(data = -identifier) %>%
    mutate(value = map(data, ~best_vol(.x, iV_d = V_d, iC_d = C_d) )) %>%
    select(identifier, value, data) %>% 
    unnest(cols = c(value, data)) %>%
    separate(
      col = value,
      into = c('Target vol', 'Target conc', 'Ori vol', 'Added TE vol'),
      sep = ' '
    ) %>% 
    select(-identifier) %>% 
    select(`#`,`Sample ID`, everything())
  input$Unit <- rep('ng/uL', nrow(input))
  
  return(input)
}

best_vol <- function(input_tb, iV_d, iC_d) {
  rp <- 0.5
  exe <- "yes"
  if (input_tb$`Nucleic Acid` <= (iC_d + 1)) {
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

# 4. Use the dil function
# Example
# Assume dd is the variable that carries your read-in file
# dd_finish <- dil(dd)
# And then you can write the dd_finish into csv file using readr::write_csv function.