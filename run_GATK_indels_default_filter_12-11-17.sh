#!/bin/bash   
#SBATCH -n 1 # Number of cores requested 
#SBATCH -t 3-00:00 # Runtime in minutes 
#SBATCH -p general # Partition to submit to 
#SBATCH --mem=20000 
#SBATCH -o /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/logs/GATK_SNPs_default_filter_12-11-17_%j.out # Standard out goes to this file 
#SBATCH -e /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/logs/GATK_SNPs_default_filter_12-11-17_%j.err # Standard err goes to this filehostname
#SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL 
#SBATCH --mail-user=m.holly.elmore@gmail.com # Email to which notifications will be sent

#run from /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/filtering

module load GATK/3.5-fasrc01
module load jdk/1.8.0_45-fasrc01

java -Xmx16g -jar ~/sw/GenomeAnalysisTK.jar \
-T VariantFiltration \
-R /n/home15/elmoremh/haig_lab_elmoremh/FINAL_ASSEMBLIES/10511_Aphal_PT_AllpathsLG.LINKS.jelly.pilon.fa \
-V /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/vcf/AmanitaBASE_raw_indels_12-11-17.vcf \
--filterExpression "QD < 2.0 || FS > 200.0 || ReadPosRankSum < -20.0" \
--filterName "default_parameters" \
-o /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/filtering/AmanitaBASE_indels_default_filter_12-11-17.vcf
