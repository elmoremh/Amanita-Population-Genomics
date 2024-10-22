#!/bin/bash
#SBATCH -J trimgalore_AHMC7TBCXX_10-12-16
#SBATCH -n 8 # Number of cores requested 
#SBATCH -t 200 # Runtime in minutes 
#SBATCH -p serial_requeue # Partition to submit to 
#SBATCH --mem=16000 
#SBATCH -o /n/regal/haig_lab/mhelmore/Illumina_data/trimmmed_reads/trimgalore/10-12-16/logs/trimgalore_AHMC7TBCXX_10-12-16.out # Standard out goes to this file 
#SBATCH -e /n/regal/haig_lab/mhelmore/Illumina_data/trimmmed_reads/trimgalore/10-12-16/logs/trimgalore_AHMC7TBCXX_10-12-16.err # Standard err goes to this filehostname
#SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL 
#SBATCH --mail-user=m.holly.elmore@gmail.com # Email to which notifications will be sent

### modules

module purge

source new-modules.sh
module load cutadapt/1.8.1-fasrc01
module load fastqc/0.11.5-fasrc01

cd /n/regal/haig_lab/mhelmore/Illumina_data/reads/AHMC7TBCXX/

sample_namesA=(10220_ATTACTCG-TATAGCCT_L001_ 10220_ATTACTCG-TATAGCCT_L002_ 10221_TCCGGAGA-TATAGCCT_L001_ 10221_TCCGGAGA-TATAGCCT_L002_ 10222_TCCGGAGA-ATAGAGGC_L001_ 10222_TCCGGAGA-ATAGAGGC_L002_ 10223_TCCGGAGA-CCTATCCT_L001_ 10223_TCCGGAGA-CCTATCCT_L002_ 10224_TCCGGAGA-GGCTCTGA_L001_ 10224_TCCGGAGA-GGCTCTGA_L002_ 10225_TCCGGAGA-AGGCGAAG_L001_ 10225_TCCGGAGA-AGGCGAAG_L002_ 10226_TCCGGAGA-TAATCTTA_L001_ 10226_TCCGGAGA-TAATCTTA_L002_ 10227_ATTACTCG-ATAGAGGC_L001_ 10227_ATTACTCG-ATAGAGGC_L002_ 10228_ATTACTCG-CCTATCCT_L001_ 10228_ATTACTCG-CCTATCCT_L002_ 10229_ATTACTCG-GGCTCTGA_L001_ 10229_ATTACTCG-GGCTCTGA_L002_ 10230_ATTACTCG-AGGCGAAG_L001_ 10230_ATTACTCG-AGGCGAAG_L002_ 10231_ATTACTCG-TAATCTTA_L001_ 10231_ATTACTCG-TAATCTTA_L002_ 10232_ATTACTCG-CAGGACGT_L001_ 10232_ATTACTCG-CAGGACGT_L002_ 10233_ATTACTCG-GTACTGAC_L001_ 10233_ATTACTCG-GTACTGAC_L002_ 10237_CGCTCATT-TATAGCCT_L001_ 10237_CGCTCATT-TATAGCCT_L002_ 10238_CGCTCATT-ATAGAGGC_L001_ 10238_CGCTCATT-ATAGAGGC_L002_ 10239_CGCTCATT-CCTATCCT_L001_ 10239_CGCTCATT-CCTATCCT_L002_ 10240_CGCTCATT-GGCTCTGA_L001_ 10240_CGCTCATT-GGCTCTGA_L002_ 10241_CGCTCATT-AGGCGAAG_L001_ 10241_CGCTCATT-AGGCGAAG_L002_ 10280_CGCTCATT-CAGGACGT_L001_ 10280_CGCTCATT-CAGGACGT_L002_ 10281_GAGATTCC-TATAGCCT_L001_ 10281_GAGATTCC-TATAGCCT_L002_ 10282_GAGATTCC-ATAGAGGC_L001_ 10282_GAGATTCC-ATAGAGGC_L002_ 10283_GAGATTCC-CCTATCCT_L001_ 10283_GAGATTCC-CCTATCCT_L002_ 10287_GAGATTCC-GGCTCTGA_L001_ 10287_GAGATTCC-GGCTCTGA_L002_ 10288_GAGATTCC-AGGCGAAG_L001_ 10288_GAGATTCC-AGGCGAAG_L002_ 10292_GAGATTCC-TAATCTTA_L001_ 10292_GAGATTCC-TAATCTTA_L002_ 10293_GAGATTCC-CAGGACGT_L001_ 10293_GAGATTCC-CAGGACGT_L002_ 10294_GAGATTCC-GTACTGAC_L001_ 10294_GAGATTCC-GTACTGAC_L002_ 10295_CGCTCATT-GTACTGAC_L001_ 10295_CGCTCATT-GTACTGAC_L002_ 10298_ATTCAGAA-TATAGCCT_L001_ 10298_ATTCAGAA-TATAGCCT_L002_ 10299_ATTCAGAA-ATAGAGGC_L001_ 10299_ATTCAGAA-ATAGAGGC_L002_ 10300_ATTCAGAA-CCTATCCT_L001_ 10300_ATTCAGAA-CCTATCCT_L002_ 10301_ATTCAGAA-GGCTCTGA_L001_ 10301_ATTCAGAA-GGCTCTGA_L002_ 10303_ATTCAGAA-AGGCGAAG_L001_ 10303_ATTCAGAA-AGGCGAAG_L002_ 10304_ATTCAGAA-TAATCTTA_L001_ 10304_ATTCAGAA-TAATCTTA_L002_ 10306_ATTCAGAA-CAGGACGT_L001_ 10306_ATTCAGAA-CAGGACGT_L002_ 10309_GAATTCGT-CCTATCCT_L001_ 10309_GAATTCGT-CCTATCCT_L002_ 10326_ATTCAGAA-GTACTGAC_L001_ 10326_ATTCAGAA-GTACTGAC_L002_ 10327_GAATTCGT-TATAGCCT_L001_ 10327_GAATTCGT-TATAGCCT_L002_ 10328_GAATTCGT-ATAGAGGC_L001_ 10328_GAATTCGT-ATAGAGGC_L002_ 10329_GAATTCGT-TAATCTTA_L001_ 10329_GAATTCGT-TAATCTTA_L002_ 10330_GAATTCGT-CAGGACGT_L001_ 10330_GAATTCGT-CAGGACGT_L002_ 10331_GAATTCGT-GGCTCTGA_L001_ 10331_GAATTCGT-GGCTCTGA_L002_ 10334_GAATTCGT-AGGCGAAG_L001_ 10334_GAATTCGT-AGGCGAAG_L002_ 10347_GAATTCGT-GTACTGAC_L001_ 10347_GAATTCGT-GTACTGAC_L002_ 10348_CTGAAGCT-TATAGCCT_L001_ 10348_CTGAAGCT-TATAGCCT_L002_ 10349_CTGAAGCT-ATAGAGGC_L001_ 10349_CTGAAGCT-ATAGAGGC_L002_)

chosen_sample_nameA=${sample_namesA[${SLURM_ARRAY_TASK_ID}]}

~/sw/trim_galore \
--paired --retain_unpaired --phred33 --illumina --length 36 -q 25 --stringency 1 -e 0.1 --fastqc \
--output_dir /n/regal/haig_lab/mhelmore/Illumina_data/trimmmed_reads/trimgalore/10-12-16 \
/n/regal/haig_lab/mhelmore/Illumina_data/reads/AHMC7TBCXX/"$chosen_sample_nameA"R1_001.fastq.gz \
/n/regal/haig_lab/mhelmore/Illumina_data/reads/AHMC7TBCXX/"$chosen_sample_nameA"R2_001.fastq.gz

### REMEMBER! Submit as array, i.e.  sbatch --array=1-100:1