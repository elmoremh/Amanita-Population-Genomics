#!/bin/bash

#SBATCH -p general
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 4000
#SBATCH -t 6:00:00
#SBATCH -J vcfINFO
#SBATCH -o /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/logs/vcfINFO_%j.out
#SBATCH -e /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/logs/vcfINFO_%j.err


module load vcftools/0.1.14-fasrc01

#extract a variety of summary stats from each interval file for each specified species

vcftools --vcf /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/vcf/AmanitaBASE_raw_snps_12-11-17.vcf --out /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/filtering/SNP_stats_MQ --get-INFO MQ

vcftools --vcf /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/vcf/AmanitaBASE_raw_snps_12-11-17.vcf --out /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/filtering/SNP_stats_DP --get-INFO DP

vcftools --vcf /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/vcf/AmanitaBASE_raw_snps_12-11-17.vcf --out /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/filtering/SNP_stats_RPRS --get-INFO ReadPosRankSum

vcftools --vcf /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/vcf/AmanitaBASE_raw_snps_12-11-17.vcf --out /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/filtering/SNP_stats_BQRS --get-INFO BaseQRankSum

vcftools --vcf /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/vcf/AmanitaBASE_raw_snps_12-11-17.vcf --out /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/filtering/SNP_stats_MQRS --get-INFO MQRankSum

vcftools --vcf /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/vcf/AmanitaBASE_raw_snps_12-11-17.vcf --out /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/filtering/SNP_stats_QD --get-INFO QD

vcftools --vcf /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/vcf/AmanitaBASE_raw_snps_12-11-17.vcf --out /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/filtering/SNP_stats_MLEAC --get-INFO MLEAC

vcftools --vcf /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/vcf/AmanitaBASE_raw_snps_12-11-17.vcf --out /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/filtering/SNP_stats_MLEAF --get-INFO MLEAF

vcftools --vcf /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/vcf/AmanitaBASE_raw_snps_12-11-17.vcf --out /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/filtering/SNP_stats_CRS --get-INFO ClippingRankSum

vcftools --vcf /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/vcf/AmanitaBASE_raw_snps_12-11-17.vcf --out /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/filtering/SNP_stats_ExH --get-INFO ExcessHet

vcftools --vcf /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/vcf/AmanitaBASE_raw_snps_12-11-17.vcf --out /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/filtering/SNP_stats_SOR --get-INFO SOR

vcftools --vcf /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/vcf/AmanitaBASE_raw_snps_12-11-17.vcf --out /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/filtering/SNP_stats_missing --missing-indv

vcftools --vcf /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/vcf/AmanitaBASE_raw_snps_12-11-17.vcf --out /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/filtering/SNP_stats_FS --get-INFO FS
