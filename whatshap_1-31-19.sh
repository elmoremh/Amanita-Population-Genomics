#!/bin/bash   
#SBATCH -n 1 # Number of cores requested 
#SBATCH -t 72:00:00 # Runtime in minutes #Tim suggested 72 hours but I just have to see...
#SBATCH -p general # Partition to submit to 
#SBATCH --mem=16G
#SBATCH -o whatshap_1-31-19_%j.out # Standard out goes to this file 
#SBATCH -e whatshap_1-31-19_%j.err # Standard err goes to this filehostname
#SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL 
#SBATCH --mail-user=m.holly.elmore@gmail.com # Email to which notifications will be sent

source activate whatshap

### run from /n/home15/elmoremh/regal_mhelmore/phasing

echo "using 10511.dedup.bam"

whatshap phase -o phased/10511_phased.vcf AmanitaBASE_SNPs_default_filter_12-11-17.vcf bams/10511.dedup.bam


