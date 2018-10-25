## Analysis of eDNA water samples from intertidal regions of the Hood Canal

### Project Description
This project will be an analysis of tidal eDNA samples collected from around five State parks along the Hood Canal. The goal is to differentiate marine communities from these areas based on OA levels and other environmental factors. 


### Repository Directory Structure
In my directory I have included the following files:
  - Raw
  - Merged
  - Cleaned
  - Analysis
  - Figures
  - Tables
  - Jupyter_Notebooks
  - Updates
  - Tutorial
  
The file labelled "Raw" contains two FASTQ files containing raw sequence data from one library of an Illumina MiSeq run. One file is the forward read and the other is the reserve read. These files contain information from 14 individual samples. Each sample will contain hundreds of sequences correspondings to different organisms. 

The "Merged" folder contains the fastq files of the merged and assembled forward and reverse raw files. 

The "Cleaned" file will contain those same FASTQ files one they are cleaned and quality control programs have rid the sequences of less desirable data.

"Analysis" will contain all outputs for various analyses that are done.

"Figures" will contain any graphs or visual representations of the data.

"Tables" will contain any excel files or tabular forms of data generated. One such file is called metadata. This contains the infomration about which samples are contained in the library and the location in which they were collected. 

"Jupyter_Notebooks" will contain any coding script that is needed for this project. These notebooks are also annotated on certain steps to make clear what the code is doing.

"Updates" contains one "Day-to-Day" plain text file that will be updated with the dates to keep time of when tasks are completed. 

"Tutorial" contains files that were used to learn the software and are not necessary for the eDNA project. 


### Project Timeline
The following steps must be completed:
  1. Merge paired-end reads with PEAR
  2. Quality filter with usearch
  3. Remove primers with cutadapt
  4. Reverse complement appropriate sequences with seqtk
  5. Remove sequences containing homopolymers (BSD Unix: grep; awk)
  6. Consolidate identical sequences with usearch
  7. Remove singletons with usearch
  8. Cluster sequences into OTUs using usearch
  9. BLAST clusters using blastn
  10. Perform common ancestor grouping in MEGAN.
  
My goal is to complete at least steps 1-4 in the next few weeks. This will mean that the data contained in the FASTQ files with be cleaned, primer and barcode sequences will be removed, and I will be left to pure sequence data from organisms. 

### Work Flow
All script will be found inthr eDNA-Tides jupyter notebook. Before starting analysis, I wanted to visualize the data in a graphical format. To do this I used FASTQC. The program resulted in two zip files and two html files (one of each for the forward and reverse files. These files are included in th folder labeled "Raw".

The next step was to merge the forward and reverse reads into one assembled and usable file. Pear was used using basic commmands, however additional options of a maximum read length (350) and a quality threshold of zero were added. The read length was chosen because of the length of the CO1 sequences with the added length of barcodes and adaptors. The length is slightly longer than needed to ensure no important reads are left out. The resulting files are all in FASTQ format and include an assembled read, a discared read, and two disassembled read files. The assembled read file is the one that will be used moving forward. All of these files are located in the folder labelled "Merged". 
