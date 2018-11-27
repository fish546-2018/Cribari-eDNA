library (tidyverse)
all.results.files<-list.files(path="/Users/kellycribari/Documents/Bioinformatics/GitHub/Cribari-eDNA/Analysis/",full.names = T)
all.results.names <-list.files(path="/Users/kellycribari/Documents/Bioinformatics/GitHub/Cribari-eDNA/Analysis/")
all.results.dfs <- map(all.results.files, function(x) { read_delim(file = x,delim = "\t",col_names = F) })
names(all.results.dfs)<- all.results.names
sample1 <- read_delim(file = "/Users/kellycribari/Documents/Bioinformatics/GitHub/Cribari-eDNA/Analysis/sampleACACAC", delim = "\t", col_names = F )
sample1$X2
all.in.one.df <- bind_rows(all.results.dfs, .id = "Sample")
my_wrapper<- function(df){
  
  df %>% 
    filter( X3 > 95 ) %>%
    filter( X4 > 285) %>% #size greater than 285 needs to meet both
    separate(X1, into = c("Shit", "Size" ), sep = ";size=") %>% 
    separate(X2, into = c("moreShit", "Match"), sep = ";") %>% 
    mutate(Size = as.numeric(str_replace(Size, ";", ""))) %>% 
    group_by(Match) %>% 
    dplyr::summarise(nReads = sum(Size))
}


all.in.one.df %>%
  filter( X3 > 95 ) %>%
  filter( X4 > 285) %>% #size greater than 285 needs to meet both
  separate(X1, into = c("Shit", "Size" ), sep = ";size=") %>% 
  separate(X2, into = c("moreShit", "Match"), sep = ";") %>% 
  mutate(Size = as.numeric(str_replace(Size, ";", ""))) %>% 
  group_by(Sample,Match) %>% 
  dplyr::summarise(nReads = sum(Size)) -> FinalAbun
