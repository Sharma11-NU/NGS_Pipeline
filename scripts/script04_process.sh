#!/bin/bash
# Step 4: Convert SAM to BAM, sort and index
module load samtools/1.21

samtools view -bS /scratch/sharma.d2/aligned.sam \
              -o /scratch/sharma.d2/aligned.bam

samtools sort /scratch/sharma.d2/aligned.bam \
              -o /scratch/sharma.d2/aligned_sorted.bam

samtools index /scratch/sharma.d2/aligned_sorted.bam
