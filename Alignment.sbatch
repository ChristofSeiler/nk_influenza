#!/bin/bash

#SBATCH --job-name=Alignment
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=4000
#SBATCH --time=16:00:00
#SBATCH --partition=normal

# load samtool
module load samtool/1.3.1

# sequence aligment
tophat -12 $BOWTIE_INDEXES/genome LK-7-ACAGTG/LK-7-ACAGTG_S3_R1_001.fastq.gz LK-7-ACAGTG/LK-7-ACAGTG_S3_R2_001.fastq.gz

# converting from sam to bam files
# TODO