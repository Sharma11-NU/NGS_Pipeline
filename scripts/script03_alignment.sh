#!/bin/bash

module load bwa/0.7.18
bwa mem /scratch/sharma.d2/chr22.fa.gz \
        /scratch/sharma.d2/trimmed_1.fastq.gz\
        /scratch/sharma.d2/trimmed_2.fastq.gz\ 
        > /scratch/sharma.d2/aligned.sam
