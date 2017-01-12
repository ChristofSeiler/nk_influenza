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
2. tophat: account for splicing (uses bowtie internally to align rna sequencing reads to human genome)
3. Cufflinks: assembles transcripts, estimates their abundances, and tests for differential expression and regulation in RNA-Seq samples

## Christof Pipeline

1. sequencing machine gives .fastq files
2. STAR: alignment to human genome (https://github.com/alexdobin/STAR)
3. alpine: bias corrections (vignette: https://github.com/mikelove/alpine/blob/master/vignettes/alpine.Rmd, backgournd: http://www.nature.com/nbt/journal/vaop/ncurrent/full/nbt.3682.html)
4. DESeq2: tests for differential expression

## Network Analysis

1. Gene level analysis
    * Problem: hard to interpret, too many significant genes
2. Pathway level analysis
    * Benefit: better intrepretablilty
    * Same as 1. but use combined score to combine gene p-values per pathway
    * Use http://www.advaitabio.com/ipathwayguide.html
    * How does ipathwayguide know about gene pathways?
    * Other pathway analysis tool: Ingenuity Pathway Analysis

## Sherlock

Already available:

* samtool/1.3.1

Install:

* bowtie: http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml#getting-started-with-bowtie-2-lambda-phage-example
* tophat2: https://ccb.jhu.edu/software/tophat/manual.shtml

## Meeting: 10/12/16

Defined todo's:

* Christof: Christof Pipeline, find pathway database, combine gene score to pathway score, write bash script for steps 2 and 3 for sherlock
* Lisa: Comparison between H1 and H2 strains (hoping that there easier to interpret)

## Pathway Analysis

Database: http://www.genome.jp/kegg/pathway.html

Some R packgaes:

* GAGE: http://bioconductor.org/packages/release/bioc/html/gage.html
* SPIA: http://bioconductor.org/packages/release/bioc/html/SPIA.html

## Plot Gene Counts

Here are the steps:

1. In RStudio change to the dropbox directory where you have the dds.Rdata file
2. Set it as the working directory
3. Now execute the R code than you can copy from the DESeq2.html file:
      ```
      load("dds.Rdata")
      library(DESeq2)
      library(ggplot2)
      library(org.Hs.eg.db)
      plotCountsAnnotated =function(gene_symbol) {
        e2s = toTable(org.Hs.egSYMBOL)
        gene_id = e2s$gene_id[e2s$symbol==gene_symbol]
        d = plotCounts(dds, gene=gene_id, intgroup=c("treatment","harvest","donor"),returnData=TRUE)
        ggplot(d, aes(x=treatment, y=count, col=harvest, shape=donor)) +
          geom_point(position=position_jitter(w=0.3,h=0), size=4) +
          scale_y_log10() + 
          ggtitle(gene_symbol)
      }
      plotCountsAnnotated("IFNB1")
      ```
4. Plot other genes: 
```
plotCountsAnnotated("UBC")
```
