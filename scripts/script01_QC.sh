#!/bin/bash

module load fastqc/0.12.1

fastqc /scratch/sharma.d2/ERR016155_1.fastq.gz \
       /scratch/sharma.d2/ERR016155_2.fastq.gz \
       -o /scratch/sharma.d2/fastqc_results/
