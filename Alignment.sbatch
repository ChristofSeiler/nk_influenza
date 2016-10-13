#!/bin/bash

#SBATCH --job-name=Alignment
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem-per-cpu=16000
#SBATCH --time=16:00:00
#SBATCH --partition=normal

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

# load samtool
module load samtool/1.3.1

