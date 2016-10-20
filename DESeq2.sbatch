#!/bin/bash

#SBATCH --job-name=DESeq2
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=19
#SBATCH --mem-per-cpu=12GB
#SBATCH --time=04:00:00
#SBATCH --partition=bigmem
#SBATCH --qos=bigmem

module load R/3.3.0

start=`date +%s`

R -e "rmarkdown::render('DESeq2.Rmd')"
R -e "rmarkdown::render('NetworkAnalysis.Rmd')"

end=`date +%s`
runtime=$((end-start))
echo runtime: $runtime sec.