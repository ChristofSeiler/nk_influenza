#!/bin/bash

#SBATCH --job-name=Alignment
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=4000
#SBATCH --time=06:00:00
#SBATCH --partition=normal

# input
R1=$1
R2=$2

mkdir STAR_out

# sequence mapping with 8 cores
STAR \
--runThreadN 8 \
--genomeDir $ENSEMBL \
--readFilesIn $R1 $R2 \
--readFilesCommand gunzip -c \
--outSAMtype BAM Unsorted \
--outFileNamePrefix STAR_out/

# copy BAM file to partent folder
PREFIX=`basename $PWD`
cp STAR_out/Aligned.out.bam ../${PREFIX}_STAR.bam