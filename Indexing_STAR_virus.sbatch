#!/bin/bash

#SBATCH --job-name=Indexing
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --mem-per-cpu=6000
#SBATCH --time=12:00:00
#SBATCH --partition=normal

# generate genome indexes
VIRUS=A_California_07_2009
#mkdir ${VIRUS}_index
#STAR \
#--runMode genomeGenerate \
#--genomeDir ${VIRUS}_index \
#--genomeFastaFiles ${VIRUS}.fasta \
#--genomeSAindexNbases 6

sample=LK-9-ATGTCA
echo aligning ${sample}
cd ${sample}
R1=*R1_001.fastq.gz
R2=*R2_001.fastq.gz
mkdir ${VIRUS}_out
STAR \
--genomeDir ../${VIRUS}_index \
--readFilesIn $R1 $R2 \
--readFilesCommand gunzip -c \
--outSAMtype BAM Unsorted \
--outFileNamePrefix ${VIRUS}_out
