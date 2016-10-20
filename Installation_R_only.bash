#!/bin/bash

# install R/Bioconductor packages
module load R/3.3.0
R -e "source(\"https://bioconductor.org/biocLite.R\"); biocLite(c(\"Rsamtools\",\"GenomicFeatures\",\"BiocParallel\",\"DESeq2\",\"TxDb.Hsapiens.UCSC.hg38.knownGene\",\"GenomicAlignments\",\"BiocParallel\",\"STRINGdb\",\"BioNet\",\"DLBCL\",\"org.Hs.eg.db\"),suppressUpdates=TRUE); install.packages(c(\"pheatmap\",\"RColorBrewer\",\"ggplot2\",\"stringr\",\"igraph\",\"visNetwork\"),repos='http://cran.us.r-project.org')"