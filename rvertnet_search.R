#!/usr/bin/env Rscript
library(tidyverse)
library(rvertnet)

name_ls <- read_csv("namelist.csv")

sp_ls <- as.character(name_ls$species)
genus_ls <- as.character(name_ls$genus)

res <- map2(sp_ls, 
            genus_ls, 
            ~searchbyterm(specificepithet = .x, 
                          genus = .y, 
                          limit = 1000, 
                          year = c('>1920','<2020')
                          )$data
            )

res %>% 
  reduce(bind_rows) %>% 
  write_excel_csv(path = paste0('vertnet_result_', 
                          format(Sys.Date()),
                          '.csv'), 
            na = '')

