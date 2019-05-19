#!/bin/bash
##file format AAwt-TTbrain-FF-SS1_L001_R1
##read file
##copy genome bowtieindex gtf into file
#$()return the results from screen
seqfile=($(ls AA*_L*))  ## $() use to return the result from screen
echo ${seqfile[@]}


##organize samples to creat project
samplename=(${seqfile[@]%_L*})
samplename=($(printf "%q\n" "${samplename[@]}"|sort -u))
echo ${samplename[@]}

##start to do job
for i in ${samplename[@]}
do
x=($(ls ${i}_L*))
echo ${x[@]}
if [ -f "${i}_bwa.sam" ]
then echo "perl CIRI_v2.0.3.pl --no_strigency -I ${i}_bwa.sam -O ${i}_ciriout -F bwaindex/genome.fa"
perl CIRI_v2.0.3.pl --no_strigency -I ${i}_bwa.sam -O ${i}_ciriout -F bwaindex/genome.fa
fi
done
