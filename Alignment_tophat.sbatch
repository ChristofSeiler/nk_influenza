#!/bin/bash

#SBATCH --job-name=Alignment
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=4000
#SBATCH --time=06:00:00
#SBATCH --partition=normal

# load samtool
module load samtool/1.3.1

# input
R1=$1
R2=$2
REF_GENOME=$BOWTIE_INDEXES/Homo_sapiens/NCBI/GRCh38/Sequence/Bowtie2Index/genome

# sequence aligment with 8 cores
tophat -p 8 $REF_GENOME $R1 $R2

# copy BAM file to partent folder
PREFIX=`basename $PWD`
cp tophat_out/accepted_hits.bam ../${PREFIX}_tophat.bam