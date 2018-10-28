library(tidyverse)
install.packages("seqinr")
library(seqinr)

metadata <- read_csv("/Users/kellycribari/Documents/Bioinformatics/GitHub/Cribari-eDNA/Tables/metadata.csv")

tags <- unique(metadata$tag_sequence)

seqinr::write.fasta(sequences = as.list(paste0("^NNN", tags)),
                    names = tags,
                    file.out = "/Users/kellycribari/Documents/Bioinformatics/GitHub/Cribari-eDNA/FASTA/metadatatags.fasta")

write.fasta(sequences = paste0("^NNN",tags), names = tags, file.out = "/Users/kellycribari/Documents/Bioinformatics/GitHub/Cribari-eDNA/FASTA/metadatatags.fasta")


            