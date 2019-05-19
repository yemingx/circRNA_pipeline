#!/bin/bash
#count the alignment from tophat alignment
assemble=($(find *.sam))
echo ${assemble[@]}
featureCounts -a genes.gtf -F gtf -o counts.txt ${assemble[@]}
