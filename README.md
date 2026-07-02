# NGS QC and Alignment Pipeline

## Overview
A pipeline for quality control and alignment of Illumina paired-end 
whole genome sequencing data to the human reference genome (hg38).

## Dataset
- Sample: ERR016155 (1000 Genomes Project)
- Organism: Homo sapiens
- Sequencing: Illumina paired-end, 101bp reads
- Reference: hg38 chr22

## Tools
- FastQC 0.12.1
- Trimmomatic 0.39
- BWA 0.7.18
- Samtools 1.21


# STEP 1: Download data
I chose a small human WGS sample from the 1000 Genomes Project.
Real human's DNA (1000 Genomes Project) was sequenced using Illumina paired-end because the reads are short and needed both ends to align confidently. 
The raw reads were uploaded to EBI's SRA with accession ERR016155 so the whole world can use it. 
I downloaded it over FTP. I am aligning it to hg38. 

Commands used:
## Sample reads (paired-end FASTQ)
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR016/ERR016155/ERR016155_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR016/ERR016155/ERR016155_2.fastq.gz

## Reference genome (chr22 only — small, perfect for learning)
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/chromosomes/chr22.fa.gz

# STEP 2: FASTQC
Ran quality control to assess per-base quality scores, GC content, 
and adapter contamination before trimming.
Poor Quality reads can cause misalignment and false variant calls downstream.

# STEP 3: TRIMMING
Trimmed and removed bad quality bases. 
All bases with phred quality score less than Q15 was removed.

Commands used:
trimmomatic PE \
  ERR016155_1.fastq.gz ERR016155_2.fastq.gz \
  trimmed_1.fastq.gz unpaired_1.fastq.gz \
  trimmed_2.fastq.gz unpaired_2.fastq.gz \
  LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

# STEP 4: FASTQC
Ran quality control again on the trimmed files. 
It is an important to make sure that trimmomatic settings worked correctly.
Confirmed mean quality score improved from Q22 to Q30 at 
end of reads before proceeding to alignment.

# STEP 5: BWA
BWA - Burrow wheeler aligner
Aligns the reads to the reference genome.
Alignment is necessary because without mapping reads to a 
reference genome, we cannot identify which positions differ 
from the normal sequence to call SNPs and indels.

# STEP 6: SAM TO BAM
BWA gives output as SAM files ( sequence alignment Map)
SAM files are converted to BAM (Binary files - compressed version of SAM).
BAM file is then sorted and indexing is performed on it.

# STEP 7: variant calling
Variant calling looks at every position in the genome 
and compares sample reads against the reference to 
identify SNPs and indels.
