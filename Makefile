# differential analysis
DESeq2: DESeq2.sbatch DESeq2.Rmd
	sbatch DESeq2.sbatch

# gene mapping using STAR
mapping: Alignment_STAR.bash Alignment_STAR.sbatch $STAR_INDEXES/SA
	bash Alignment_STAR.bash

# gene indexing using STAR
indexing: Indexing_STAR.sbatch $BOWTIE_INDEXES/Homo_sapiens/NCBI/GRCh38/Sequence/Bowtie2Index/genome.fa $BOWTIE_INDEXES/Homo_sapiens/NCBI/GRCh38/Annotation/Genes/genes.gtf
	sbatch Indexing_STAR.sbatch

# install and download resources
install:
	bash Installation.bash

# get cluster update
check:
    squeue | grep ${USER}

# clean up
clean:
	rm slurm-*.out
	rm *_results.csv
	rm se.Rdata