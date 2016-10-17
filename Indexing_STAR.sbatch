#!/bin/bash

#SBATCH --job-name=Indexing
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --mem-per-cpu=4000
#SBATCH --time=16:00:00
#SBATCH --partition=bigmem
#SBATCH --qos=bigmem

# generate genome indexes
STAR \
--runThreadN 16 \
--runMode genomeGenerate \
--genomeDir $STAR_INDEXES \
--genomeFastaFiles $BOWTIE_INDEXES/Homo_sapiens/NCBI/GRCh38/Sequence/Bowtie2Index/genome.fa \
--sjdbGTFfile $BOWTIE_INDEXES/Homo_sapiens/NCBI/GRCh38/Annotation/Genes/genes.gtf