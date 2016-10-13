#!/bin/bash

#SBATCH --job-name=Alignment
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=4000
#SBATCH --time=16:00:00
#SBATCH --partition=normal

# load samtool
module load samtool/1.3.1

# sequence aligment
tophat -p 1 $BOWTIE_INDEXES/Homo_sapiens/NCBI/GRCh38/Sequence/Bowtie2Index/genome LK-7-ACAGTG/LK-7-ACAGTG_S3_R1_001.fastq.gz LK-7-ACAGTG/LK-7-ACAGTG_S3_R2_001.fastq.gz

# converting from sam to bam files
# TODO