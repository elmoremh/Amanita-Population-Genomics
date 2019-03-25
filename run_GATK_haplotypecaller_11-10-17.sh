#!/bin/bash   
#SBATCH -n 1 # Number of cores requested 
#SBATCH -t 1000 # Runtime in minutes 
#SBATCH -p general # Partition to submit to 
#SBATCH --mem=20000 
#SBATCH -o /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/logs/GATK_haplotypecaller_11-9-17_%j.out # Standard out goes to this file 
#SBATCH -e /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/logs/GATK_haplotypecaller_11-9-17_%j.err # Standard err goes to this filehostname
#SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL 
#SBATCH --mail-user=m.holly.elmore@gmail.com # Email to which notifications will be sent


module load GATK/3.5-fasrc01
module load jdk/1.8.0_45-fasrc01

SAMPLE=$1

java -Xmx16g -jar ~/sw/GenomeAnalysisTK.jar \
-T HaplotypeCaller \
-R /n/home15/elmoremh/haig_lab_elmoremh/FINAL_ASSEMBLIES/10511_Aphal_PT_AllpathsLG.LINKS.jelly.pilon.fa \
-I /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/bams/${SAMPLE}.dedup.sorted.bam \
--genotyping_mode DISCOVERY \
--emitRefConfidence GVCF \
-o /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/gvcf/${SAMPLE}.raw_variants.g.vcf
