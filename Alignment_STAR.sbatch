#!/bin/bash

#SBATCH --job-name=Alignment
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=6000
#SBATCH --time=01:00:00
#SBATCH --partition=normal

# input
R1=$1
R2=$2

mkdir STAR_out

# sequence mapping with 8 cores
STAR \
--runThreadN 8 \
--genomeDir $STAR_INDEXES \
--readFilesIn $R1 $R2 \
--readFilesCommand gunzip -c \
--outSAMtype BAM Unsorted \
--outFileNamePrefix STAR_out/

# copy BAM file to partent folder
if [ -f STAR_out/Log.final.out ]; then
    PREFIX=`basename $PWD`
    cp STAR_out/Aligned.out.bam ../${PREFIX}_STAR.bam
fi
