#!/bin/bash

# install bowtie2
wget https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.2.9/bowtie2-2.2.9-linux-x86_64.zip
unzip bowtie2-2.2.9-linux-x86_64.zip
echo "" >> .bash_profile
echo "# add alignment binaries" >> .bash_profile
echo "export PATH=~/bowtie2-2.2.9:\$PATH" >> .bash_profile

# install tophat2
wget https://ccb.jhu.edu/software/tophat/downloads/tophat-2.1.1.Linux_x86_64.tar.gz
tar -xvzf tophat-2.1.1.Linux_x86_64.tar.gz
mv tophat-2.1.1.Linux_x86_64 tophat-2.1.1
echo "export PATH=~/tophat-2.1.1:\$PATH" >> .bash_profile

# install reference genome: H. sapiens, NCBI GRCh38
BOWTIE_INDEXES=$SCRATCH/Bowtie_Indexes
mkdir $BOWTIE_INDEXES
cd $BOWTIE_INDEXES
wget ftp://igenome:G3nom3s4u@ussd-ftp.illumina.com/Homo_sapiens/NCBI/GRCh38/Homo_sapiens_NCBI_GRCh38.tar.gz
tar -zxvf Homo_sapiens_NCBI_GRCh38.tar.gz
cp Homo_sapiens/NCBI/GRCh38/Sequence/Bowtie2Index/genome.* .
echo "export BOWTIE_INDEXES=$BOWTIE_INDEXES" >> .bash_profile