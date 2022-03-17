library(tidyverse)
library(dplyr)
library(data.table)

diamonds

diamonds%>%
  select(carat,cut,price)%>%
  filter(cut == "Premium")%>%
  filter(price > 7000 & price < 10000)%>%
  arrange(desc(carat))%>%
  slice(1:20)
m = as.data.table(diamonds)
m [, . (carat,cut,price)]
m = m [cut == "Premium"]
m = m[price > 7000 & price < 10000 ]
m = m [order(rank(-carat))]
z = m  [1:20, . (carat,cut,price)   ] 
z
