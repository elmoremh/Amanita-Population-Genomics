#!/bin/bash

#SBATCH -p serial_requeue
#SBATCH -n 2
#SBATCH -N 1
#SBATCH --mem 16000
#SBATCH -t 4:00:00
#SBATCH -o /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/logs/sort_index_sum_%j.out
#SBATCH -e /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/logs/sort_index_sum_%j.err


SAMPLE=$1

module load jdk/1.8.0_45-fasrc01
module load java/1.8.0_45-fasrc01

java -Xmx8g -XX:ParallelGCThreads=1 -jar ~/sw/picard.jar SortSam \
I=/n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/bams/${SAMPLE}.dedup.bam \
O=${SAMPLE}.dedup.sorted.bam \
SORT_ORDER=coordinate

java -Xmx8g -XX:ParallelGCThreads=1 -jar ~/sw/picard.jar BuildBamIndex \
I=/n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/bams/${SAMPLE}.dedup.sorted.bam

java -Xmx8g -XX:ParallelGCThreads=1 -jar ~/sw/picard.jar CollectAlignmentSummaryMetrics \
I=/n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/bams/${SAMPLE}.dedup.sorted.bam \
R=/n/home15/elmoremh/haig_lab_elmoremh/FINAL_ASSEMBLIES/10511_Aphal_PT_AllpathsLG.LINKS.jelly.pilon.fa \
METRIC_ACCUMULATION_LEVEL=SAMPLE \
METRIC_ACCUMULATION_LEVEL=READ_GROUP \
O=/n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/metrics/${SAMPLE}.alignment_metrics.txt

java -Xmx8g -XX:ParallelGCThreads=1 -jar ~/sw/picard.jar ValidateSamFile \
I=/n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/bams/${SAMPLE}.dedup.sorted.bam \
O=/n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/metrics/${SAMPLE}.validate.txt MODE=SUMMARY