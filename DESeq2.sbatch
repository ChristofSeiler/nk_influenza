#!/bin/bash

#SBATCH --job-name=Alignment
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=4000
#SBATCH --time=12:00:00
#SBATCH --partition=normal

module load R/3.3.0

start=`date +%s`
R -e "rmarkdown::render('DESeq2.Rmd')"
end=`date +%s`
runtime=$((end-start))
echo runtime: $runtime sec.