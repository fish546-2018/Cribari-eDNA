# Cribari-eDNA

### Project Description
This project will be an analysis of tidal eDNA samples collected from around five State parks along the Hood Canal. The goal is to differentiate marine communities from these areas based on OA levels and other environmental factors. 


### Repository Directory Structure
In my directory I have included the following files:
  - Raw
  - Cleaned
  - Analysis
  - Figures
  - Tables
  - Jupyter_Notebooks
  
The file labelled "Raw" contains two FASTQ files containing raw sequence data from one library of an Illumina MiSeq run. One file is the forward read and the other is the reserve read. These files contain information from 14 individual samples. Each sample will contain hundreds of sequences correspondings to different organisms. 

The "Cleaned" file will contain those same FASTQ files one they are cleaned and quality control programs have rid the sequences of less desirable data.

"Analysis" will contain all outputs for various analyses that are done.

"Figures" will contain any graphs or visual representations of the data.

"Tables" will contain any excel files or tabular forms of data generated. One such file is called metadata. This contains the infomration about which samples are contained in the library and the location in which they were collected. 

Finally "Jupyter_Notebooks" will contain any coding script that is needed for this project.


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
