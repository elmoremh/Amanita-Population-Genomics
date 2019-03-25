#!/bin/bash   
#SBATCH -n 1 # Number of cores requested 
#SBATCH -t 200 # Runtime in minutes 
#SBATCH -p general # Partition to submit to 
#SBATCH --mem=16000 
#SBATCH -o picard_dict_10-23-17.out # Standard out goes to this file 
#SBATCH -e picard_dict_10-23-17.err # Standard err goes to this filehostname
#SBATCH --mail-type=ALL # Type of email notification- BEGIN,END,FAIL,ALL 
#SBATCH --mail-user=m.holly.elmore@gmail.com # Email to which notifications will be sent

module load picard/2.9.0-fasrc01

java -jar /n/home15/elmoremh/sw/broadinstitute-picard-b0ac123/src/main/java/picard/sam/CreateSequenceDictionary.java \
R= /n/home15/elmoremh/haig_lab_elmoremh/FINAL_ASSEMBLIES/10511_Aphal_PT_AllpathsLG.LINKS.jelly.pilon.fa \
O= /n/home15/elmoremh/haig_lab_elmoremh/FINAL_ASSEMBLIES/10511_Aphal_PT_AllpathsLG.LINKS.jelly.pilon.dict
