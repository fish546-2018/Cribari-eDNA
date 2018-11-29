library (tidyverse)
#load all files
all.results.files<-list.files(path="/Users/kellycribari/Documents/Bioinformatics/GitHub/Cribari-eDNA/Analysis/",full.names = T)
all.results.names <-list.files(path="/Users/kellycribari/Documents/Bioinformatics/GitHub/Cribari-eDNA/Analysis/")
all.results.dfs <- map(all.results.files, function(x) { read_delim(file = x,delim = "\t",col_names = F) })
names(all.results.dfs)<- all.results.names

#Put into one dataframe
all.in.one.df <- bind_rows(all.results.dfs, .id = "Sample")

all.in.one.df %>%
  filter( X3 > 95 ) %>% #Match more than 95%
  filter( X4 > 285) %>% #match size greater than 285 bp 
  separate(X1, into = c("Shit", "Size" ), sep = ";size=") %>% #Separate columns to isolate the number of matches
  separate(X2, into = c("moreShit", "Match"), sep = ";") %>% #Separate columns to isolate name of the taxa
  mutate(Size = as.numeric(str_replace(Size, ";", ""))) %>% #Remove excess characters to make size a numeric variable
  group_by(Sample,Match) %>% 
  dplyr::summarise(nReads = sum(Size)) -> FinalAbun #Size is the number of matches found, this is summing the total number of matches per taxa

ggplot(data = FinalAbun, aes(x=Match, y=Sample, fill=nReads))+
  geom_bin2d()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
#Heat map of matches by sample (location) with a color indicating the number of reads for that match


