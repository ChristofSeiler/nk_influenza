#!/bin/bash

# sequence aligment
for i in $(ls -d */)
do
    echo ${i}
    cd ${i}
    R1=*R1_001.fastq.gz
    R2=*R2_001.fastq.gz
    echo sbatch Alignment.sbatch $R1 $R2
    cd ..
done