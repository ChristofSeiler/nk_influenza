#!/bin/bash

#SBATCH --job-name=DESeq2_nk
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=19
#SBATCH --mem-per-cpu=12GB
#SBATCH --time=04:00:00
#SBATCH --partition=bigmem
#SBATCH --qos=bigmem

module load R/3.3.0

start=`date +%s`

type=sample_table_nk_all.csv
mapping=tophat
condition=H1N1
baseline=H3N2
gene_list=treatment_${condition}_${baseline}_${mapping}_results.csv
R -e "rmarkdown::render('DESeq2.Rmd',params = list(type = '${type}',mapping = '${mapping}',condition = '${condition}',baseline = '${baseline}',gene_list = '${gene_list}'))"

fdr=0.1
num_nodes=100
R -e "rmarkdown::render('NetworkAnalysis.Rmd',params = list(fdr = '${fdr}',num_nodes = '${num_nodes}',gene_list = '${gene_list}'))"

end=`date +%s`
runtime=$((end-start))
echo runtime: $runtime sec.