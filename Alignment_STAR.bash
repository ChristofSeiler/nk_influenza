#!/bin/bash

# sequence aligment
for i in $(ls -d LK*/)
do
    echo aligning ${i}
    cd ${i}
    R1=*R1_001.fastq.gz
    R2=*R2_001.fastq.gz
    sbatch ../Alignment_STAR.sbatch $R1 $R2
    cd ..
done