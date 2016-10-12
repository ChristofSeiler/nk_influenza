# Immunology Lisa

For preprocessing, we could use the R package DESeq2:

http://www.bioconductor.org/help/workflows/rnaseqGene/
https://www.bioconductor.org/packages/devel/bioc/vignettes/DESeq2/inst/doc/DESeq2.pdf

This package takes as input a matrix of integer values.
The value in the i-th row and the j-th column of the matrix tells how many reads (or fragments, for paired-end RNA-seq) have been unambiguously assigned to gene i in sample j.
The values in the matrix must be raw counts of sequencing reads/fragments.

## Background on Linear Models

http://genomicsclass.github.io/book/

## Lisa Pipeline

1. sequencing machine gives .fastq files
2. align rna sequencing reads to human genomve using bowtie
3. account for splicing using tophat
4. linear models using Cufflinks (Cuffdiff)

## Christof Pipeline

1. sequencing machine gives .fastq files
2. DESeq2
3. DESeq2
4. DESeq2

# Network Analysis

1. Gene level analysis
    * Problem: hard to interpret, too many significant genes
2. Pathway level analysis
    * Benefit: better intrepretablilty
    * Same as 1. but use combined score to combine gene p-values per pathway
    * Use http://www.advaitabio.com/ipathwayguide.html
    * How does ipathwayguide know about gene pathways?
    * Other pathway analysis tool: Ingenuity Pathway Analysis
