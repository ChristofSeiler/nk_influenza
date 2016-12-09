#!/bin/bash

#SBATCH --job-name=DESeq2_nk
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=19
#SBATCH --mem-per-cpu=12GB
#SBATCH --time=02:00:00
#SBATCH --partition=bigmem
#SBATCH --qos=bigmem

module load R/3.3.0

start=`date +%s`

type=sample_table_nk.csv
mapping=tophat
R -e "rmarkdown::render('DESeq2.Rmd',params = list(type = '${type}',mapping = '${mapping}')"

fdr=0.0001
gene_list=treatment_H1N1_UI_tophat_results.csv
R -e "rmarkdown::render('NetworkAnalysis.Rmd',params = list(fdr = '${fdr}',gene_list = '${gene_list}')"

end=`date +%s`
runtime=$((end-start))
echo runtime: $runtime sec.