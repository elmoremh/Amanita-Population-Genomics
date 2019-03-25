#!/bin/bash   
#SBATCH -n 1 # Number of cores requested 
#SBATCH -t 1:00:00 # Runtime in minutes 
#SBATCH -p general # Partition to submit to 
#SBATCH --mem=16000 
#SBATCH -o collect_sample_metrics_12-11-17_%j.out # Standard out goes to this file 
#SBATCH -e collect_sample_metrics_12-11-17_%j.err # Standard err goes to this filehostname
#SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL 
#SBATCH --mail-user=m.holly.elmore@gmail.com # Email to which notifications will be sent


#run from /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/metrics

#collect_sample_metrics.py written in python 2
module load python/2.7.13-fasrc01
module load Anaconda/4.3.0-fasrc01

python ~/Scripts/03.2_collect_sample_metrics_holly.py -f /n/home15/elmoremh/regal_mhelmore/alignment_array/GATK/metrics \
-s ~/Scripts/samples.txt -a all_sample.alignment_metrics.txt -d all_sample.dedup.metrics.txt 