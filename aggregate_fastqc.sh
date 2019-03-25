    # Run this script in a directory containing zip files from fastqc. It aggregates images of each type in individual folders
    # So looking across data is quick.
    
    zips=`ls *.zip`
    
    for i in $zips; do
    unzip -o $i &>/dev/null;
    done
    
    fastq_folders=${zips/.zip/}
    
    rm -rf fq_aggregated # Remove aggregate folder if present
    mkdir fq_aggregated
    
    # Rename Files within each using folder name.
    for folder in $fastq_folders; do
    folder=${folder%.*}
    img_files=`ls ${folder}/Images/*png`;
    for img in $img_files; do
    img_name=$(basename "$img");
    img_name=${img_name%.*}
    new_name=${folder};
    mkdir -p fq_aggregated/${img_name};
    mv $img fq_aggregated/${img_name}/${folder/_fastqc/}.png;
    done;
    done;
    
    
    # Concatenate Summaries
    for folder in $fastq_folders; do
    folder=${folder%.*}
    cat ${folder}/summary.txt >> fq_aggregated/summary.txt
    done;
    
    # Concatenate Statistics
    for folder in $fastq_folders; do
    folder=${folder%.*}
    head -n 10 ${folder}/fastqc_data.txt | tail -n 7 | awk -v f=${folder/_fastqc/} '{ print $0 "\t" f }' >> fq_aggregated/statistics.txt
    rm -rf ${folder}
    done