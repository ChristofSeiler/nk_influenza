#!/bin/bash

#SBATCH --job-name=Alignment
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --mem-per-cpu=2000
#SBATCH --time=03:00:00
#SBATCH --partition=normal

# input
R1=$1
R2=$2
VIRUS=$3

# multithreaded sequence mapping
STAR \
--runThreadN 4 \
--genomeDir ../${VIRUS}_index \
--readFilesIn $R1 $R2 \
--readFilesCommand gunzip -c \
--outSAMtype BAM Unsorted \
--outFileNamePrefix ${VIRUS}_STAR_
