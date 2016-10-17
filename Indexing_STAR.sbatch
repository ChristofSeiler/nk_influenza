#!/bin/bash

#SBATCH --job-name=Indexing
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem-per-cpu=4000
#SBATCH --time=12:00:00
#SBATCH --partition=normal

# generate genome indexes
STAR \
--runThreadN 8 \
--runMode genomeGenerate \
--genomeDir $STAR_INDEXES \
--genomeFastaFiles $BOWTIE_INDEXES/Homo_sapiens/NCBI/GRCh38/Sequence/Bowtie2Index/genome.fa \
--sjdbGTFfile $BOWTIE_INDEXES/Homo_sapiens/NCBI/GRCh38/Annotation/Genes/genes.gtf