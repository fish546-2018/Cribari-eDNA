# Analysis of eDNA water samples from intertidal regions of the Hood Canal

## Project Description
This project will be an analysis of tidal eDNA samples collected from around three State parks along the Hood Canal. The goal of the larger project was to differentiate marine communities from these areas based on OA levels and other environmental factors and investigate whether the communities change with changes in tides. The goal for this sub-project is to successful take a library of raw sequenced data, clean the data using various functions in python and unix, to a point that I can successful blast individual clustered sequences and assign them to taxa. The taxon abundances will be the final visual for this project. 


## Repository Directory Structure
**In my directory I have included the following files:**
- Raw             
- Merged          
- FASTA           
- Demultiplexed   
- NoPrimers       
- Derep           
- Cluster         
- Blasting
- Analysis
- Figures
- Tables
- Jupyter_Notebooks
- Updates
- Banzai
- Tutorial
- BioInfoAbun

The file labelled "Raw" contains two FASTQ files containing raw sequence data from one library of an Illumina MiSeq run. One file is the forward read and the other is the reserve read. These files contain information from 14 individual samples. Each sample will contain hundreds of sequences correspondings to different organisms. 

The "Merged" folder contains the FASTQ files of the merged and assembled forward and reverse raw files. 

The "FASTA" folder contains the converted FASTQ file as well as the FASTA files generated from the tag and primer sequences.

The "Demultiplexed" folder contains 16 FASTA files, one for each sample included in the original library.

"NoPrimers" contains the demultiplexed files, with both primers removed. This does not include reverse complement sequences. 

"Derep" contains two dereplicated sequence files for each tag. One is the original output of the dereplicating. The second is the same file with all spaces removed. This step was needed for clustering.

"Cluster" contains txt files that is all of the clustered sequences, including abundance estimates. 

"Blasting" contains the local database used for blasting the clustered sequences. 

"Analysis" contains txt files of the sample, a matched sequence from the databases, and the size of the cluster for which that sequences was representative. 

"Figures" will contain any graphs or visual representations of the data.

"Tables" contain any excel files or tabular forms of data generated. One such file is called metadata. This contains the infomration about which samples are contained in the library and the location in which they were collected. 

"Jupyter_Notebooks" contains any coding script that is needed for this project. These notebooks are also annotated on certain steps to make clear what the code is doing.

"Updates" contains one "Day-to-Day" plain text file that will be updated with the dates to keep time of when tasks are completed. 

"Banzai" will contain file outputs from the pipeline that will be used to verify all work done on the project. 

"Tutorial" contains files that were used to learn the software and are not necessary for the eDNA project. 

Finally, there is an R script called "BioInfoAbun" that contains the code to go from a blasted sequence txt file to a list of taxon and their abundance.


## Project Timeline
The following steps must be completed:
 - [x] 1. Visualize data with FASTQC
 - [x] 2. Merge paired-end reads with PEAR
 - [x] 3. Convert FASTQ to FASTA
 - [x] 4. Remove tags with cutadapt
 - [x] 5. Demultiplex sequences
 - [X] 6. Remove primers
 - [X] 7. Consolidate identical sequences with vsearch
 - [X] 8. Remove singletons with vsearch
 - [X] 9. Cluster sequences into OTUs using swarm
 - [X] 10. BLAST clusters using blastn
 - [ ] 11. Visualize Taxon abundances

#### _Goals for weeks 4/5_
_My goal is to complete at least steps 1-5 in the next few weeks. This will mean that the data contained in the FASTQ files with be cleaned, tag sequences will be removed, and I will be left with 16 demultiplexed sequences in FASTA format._

#### Update: Progress as of Week 5
At the end of week 5 I have completed 9 of 11 steps for one of the demultiplexed files. Because there are 16 files to be analyzed, the easiest way to run through the steps is to create a for loop that will run all of the commands on all of the files. As I try to figure out how to do this, I have continued through the steps using just one of the files in order to gain understanding of how to work with the data. As of right now, I have a text file that contains all of the clustered sequences for one of the demultiplexed files. The next step is to remove the homopolymers and run it through blast.

#### _Goals for week 10_
_I must first complete the pipeline by removing homopolymers and running the sequences through blast for the first demultiplexed file. By week 10, my goal is to complete all of these steps for the remaining 15 demultiplexed files. I plan to create a for loop in order to do this more easily, however will do it the long way if necessary. As of right now, I am ignoring all reverse complement sequences, however if time permits, I plan to go back into the pipeline and analyze those as well._

_If I am able to run blast successly on the first demultiplexed file, I will call the a success, but my goal is to attempt to do this whole pipeline will all 16 files. My overall goal in this class was to gain an understanding of how these programs work and be able to navigate through them with some knowledge of what commands can do. I believe I have done that thus far, but am continuing to grow that knowledge every week._

#### Update: Progress as of Week 9
I have successfully completed the through step 9 on all the files using the xargs command for most of the functions. I then moved forward and blasted the clustered sequences against a local database of identified sequences that have come up in past projects in the lab. This database can be found in the "Blasting" folder. The blasted sequences are in a txt file (in "Analysis" and each have an abundance estimate represented by size. In an R Script, I loaded the files in "Analysis" and contrusted a new data frame that combines all of the information from each file into one table. This makes it easier to analyze or visualize later on. 


## Work Flow
All script will be found inthr eDNA-Tides jupyter notebook. Before starting analysis, I wanted to visualize the data in a graphical format. To do this I used FASTQC. The program resulted in two zip files and two html files (one of each for the forward and reverse files. These files are included in th folder labeled "Raw".

The next step was to merge the forward and reverse reads into one assembled and usable file. Pear was used using basic commmands, however additional options of a maximum read length (350) and a quality threshold of zero were added. The read length was chosen because of the length of the CO1 sequences with the added length of barcodes and adaptors. The length is slightly longer than needed to ensure no important reads are left out. The resulting files are all in FASTQ format and include an assembled read, a discared read, and two disassembled read files. The assembled read file is the one that will be used moving forward. All of these files are located in the folder labelled "Merged". 

The assembled FASTQ file was converted to a FASTA for further use. The sequences were demultiplexed and tag sequences were removed using cutadapt. In doing so, the original FASTA file was split into 16 separate demultiplexed files based on the tag sequence (found in "Demultiplexed"). Now that the tag sequences were removed, the primer sequences could not be removed. The forward and reverse primers were successfully removed from the sequences of one of the demultiplexed files. I tried to remove the primers from all of the files at onces, however was unsuccessful and decided to move forward with one. This was also the case for removing the reverse complemented primer sequences from the file. 

In order to move forward and learn the steps, I continued to work with the one demultiplexed file that I was sucessfully able to removed the primers from. This file can be found in the folder "NoPrimers". The program vsearch was used to dereplicated these sequences and remove singletons (found in "Derep"). This output could not be read by swarm for clustering until all spaces in the FASTA file were removed. Once removed, the sequences were clustered and assigned an abundance estimate. This output can be found in a .txt file in the "Cluster" folder. 

Using the xargs command I was able to complete steps 6-9 with the remaining 15 demultiplexed files. I uploaded a local database of sequences that have been found in similar samples and blasted the clustered files from this project against that databases. The result was a text file for each tag with clustered read based on taxonomic ID. The size of the cluster is also indicated in the file. Those txt files were uploaded into an R script where they were consolidated into one file with all the taxonomic IDs associated with a sample and tag. I then grouped the reads based on the taxon identified so I have one representative ID per taxon for a tag. These IDs can then be associated with the site location and the abundance of that taxon. 
