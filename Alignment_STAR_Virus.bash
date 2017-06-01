#!/bin/bash

# generate genome indexes
# 'A_California_07_2009' or 'A_Victoria_361_2011'
VIRUS=$1
mkdir ${VIRUS}_index
STAR \
--runMode genomeGenerate \
--genomeDir ${VIRUS}_index \
--genomeFastaFiles ${VIRUS}.fasta \
--genomeSAindexNbases 6

# sequence aligment
for sample in $(ls -d LK*/)
do
    echo aligning ${sample}
    cd ${sample}
    R1=*R1_001.fastq.gz
    R2=*R2_001.fastq.gz
    sbatch ../Alignment_STAR_Virus.sbatch $R1 $R2 $VIRUS
    cd ..
done
