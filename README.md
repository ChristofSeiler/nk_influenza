# Immunology Lisa

For preprocessing, we could use the R package DESeq2:

http://www.bioconductor.org/help/workflows/rnaseqGene/
https://www.bioconductor.org/packages/devel/bioc/vignettes/DESeq2/inst/doc/DESeq2.pdf

This package takes as input matrix of integer values.
The value in the i-th row and the j-th column of the matrix tells how many reads (or fragments, for paired-end RNA-seq) have been unambiguously assigned to gene i in sample j.
The values in the matrix must be raw counts of sequencing reads/fragments.
