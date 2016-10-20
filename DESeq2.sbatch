#!/bin/bash

#SBATCH --job-name=DESeq2
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=8GB
#SBATCH --time=01:00:00
#SBATCH --partition=bigmem
#SBATCH --qos=bigmem

module load R/3.3.0

start=`date +%s`

R -e "rmarkdown::render('DESeq2.Rmd')"
R -e "rmarkdown::render('NetworkAnalysis.Rmd')"

end=`date +%s`
runtime=$((end-start))
echo runtime: $runtime sec.