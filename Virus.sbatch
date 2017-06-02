#!/bin/bash

#SBATCH --job-name=Virus
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --mem-per-cpu=4GB
#SBATCH --time=01:00:00
#SBATCH --partition=normal

module load R/3.3.0

virus=$1 # 'A_California_07_2009' or 'A_Victoria_361_2011'
R -e "rmarkdown::render('Virus.Rmd',output_file = 'Virus_${virus}.html',params = list(virus = '${virus}'))"
