#!/bin/bash

java -jar /shared/EL9/explorer/trimmomatic/0.39/src/Trimmomatic-0.39/trimmomatic-0.39.jar PE \
  /scratch/sharma.d2/ERR016155_1.fastq.gz \
  /scratch/sharma.d2/ERR016155_2.fastq.gz \
  /scratch/sharma.d2/trimmed_1.fastq.gz \
  /scratch/sharma.d2/unpaired_1.fastq.gz \
  /scratch/sharma.d2/trimmed_2.fastq.gz \
  /scratch/sharma.d2/unpaired_2.fastq.gz \
  LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
