#!/bin/bash   
#SBATCH -n 1 # Number of cores requested 
#SBATCH -t 5:00:00 # Runtime in minutes 
#SBATCH -p general # Partition to submit to 
#SBATCH --mem=16000 
#SBATCH -o separate_SNPs_indels_12-7-17_%j.out # Standard out goes to this file 
#SBATCH -e separate_SNPs_indels_12-7-17_%j.err # Standard err goes to this filehostname
#SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL 
#SBATCH --mail-user=m.holly.elmore@gmail.com # Email to which notifications will be sent

#run from /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/vcf

module load vcftools/0.1.14-fasrc01

vcftools --vcf input_file.vcf --remove-indels --recode --recode-INFO-all --out SNPs_only