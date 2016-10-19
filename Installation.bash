#!/bin/bash

INSTALL_DIR=$SCRATCH
cd $INSTALL_DIR

# install bowtie2
wget https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.2.9/bowtie2-2.2.9-linux-x86_64.zip
unzip bowtie2-2.2.9-linux-x86_64.zip
echo "" >> .bash_profile
echo "# gene indexing and mapping" >> .bash_profile
echo "export PATH=${INSTALL_DIR}/bowtie2-2.2.9:\$PATH" >> ~/.bash_profile

# install tophat2
wget https://ccb.jhu.edu/software/tophat/downloads/tophat-2.1.1.Linux_x86_64.tar.gz
tar -xvzf tophat-2.1.1.Linux_x86_64.tar.gz
mv tophat-2.1.1.Linux_x86_64 tophat-2.1.1
echo "export PATH=${INSTALL_DIR}/tophat-2.1.1:\$PATH" >> ~/.bash_profile

# install alpine
wget https://github.com/alexdobin/STAR/archive/2.5.2b.tar.gz
tar -xvzf 2.5.2b.tar.gz
echo "export PATH=${INSTALL_DIR}/STAR-2.5.2b/bin/Linux_x86_64_static:\$PATH" >> ~/.bash_profile

# download reference genome: H. sapiens, NCBI GRCh38
BOWTIE_INDEXES=${INSTALL_DIR}/Bowtie_Indexes
mkdir $BOWTIE_INDEXES
cd $BOWTIE_INDEXES
wget ftp://igenome:G3nom3s4u@ussd-ftp.illumina.com/Homo_sapiens/NCBI/GRCh38/Homo_sapiens_NCBI_GRCh38.tar.gz
tar -xvzf Homo_sapiens_NCBI_GRCh38.tar.gz
echo "export BOWTIE_INDEXES=$BOWTIE_INDEXES" >> ~/.bash_profile

## download gene model
#GENE_MODEL=${INSTALL_DIR}/Gene_Model
#mkdir $GENE_MODEL
#cd $GENE_MODEL
#wget ftp://ftp.ensembl.org/pub/release-86/gtf/homo_sapiens/Homo_sapiens.GRCh38.86.gtf.gz
#gunzip Homo_sapiens.GRCh38.86.gtf.gz
#echo "export GENE_MODEL=$GENE_MODEL" >> ~/.bash_profile

## download ENSEMBLE genome and annotations
#wget http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/ENSEMBL/homo_sapiens/ENSEMBL.homo_sapiens.release-75.tgz
#tar -xvzf ENSEMBL.homo_sapiens.release-75.tgz
#ENSEMBL=${INSTALL_DIR}/ENSEMBL.homo_sapiens.release-75
#echo "export ENSEMBL=$ENSEMBL" >> ~/.bash_profile

# define index directory for STAR
STAR_INDEXES=$INSTALL_DIR/STAR_INDEXES
mkdir $STAR_INDEXES
echo "export STAR_INDEXES=$STAR_INDEXES" >> ~/.bash_profile

# install R/Bioconductor packages
module load R/3.3.0
R -e "source(\"https://bioconductor.org/biocLite.R\"); biocLite(c(\"Rsamtools\",\"GenomicFeatures\",\"BiocParallel\",\"DESeq2\",\"TxDb.Hsapiens.UCSC.hg38.knownGene\",\"GenomicAlignments\",\"BiocParallel\",\"STRINGdb\",\"BioNet\",\"DLBCL\",\"org.Hs.eg.db\"),suppressUpdates=TRUE); install.packages(c(\"pheatmap\",\"RColorBrewer\",\"ggplot2\",\"stringr\",\"igraph\",\"visNetwork\"),repos='http://cran.us.r-project.org')"