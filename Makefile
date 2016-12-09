# differential analysis
da_monocyte: DESeq2_monocyte.sbatch DESeq2.Rmd NetworkAnalysis.Rmd
	sbatch DESeq2_monocyte.sbatch
da_nk: DESeq2_nk.sbatch DESeq2.Rmd NetworkAnalysis.Rmd
	sbatch DESeq2_nk.sbatch

# gene mapping using STAR
mapping: Alignment_STAR.bash Alignment_STAR.sbatch $STAR_INDEXES/SA
	bash Alignment_STAR.bash

# gene indexing using STAR
indexing: Indexing_STAR.sbatch $BOWTIE_INDEXES/Homo_sapiens/NCBI/GRCh38/Sequence/Bowtie2Index/genome.fa $BOWTIE_INDEXES/Homo_sapiens/NCBI/GRCh38/Annotation/Genes/genes.gtf
	sbatch Indexing_STAR.sbatch

# gene mapping using tophat
mapping_tophat: Alignment_tophat.bash Alignment_tophat.sbatch $BOWTIE_INDEXES/Homo_sapiens/NCBI/GRCh38/Sequence/Bowtie2Index/genome.fa
    bash Alignment_tophat.bash

# install and download resources
install:
	bash Installation.bash
	bash Installation_R_only.bash

# get cluster update
check:
	squeue | grep ${USER}

# clean up
clean:
	rm slurm-*.out
	rm se.Rdata
	rm *_results.csv
