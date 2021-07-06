#!/bin/bash

### queue name 
#PBS -q large

### job name
#PBS -N your_job_name

### set number of nodes
#PBS -l walltime=50:00:00,nodes=1:ppn=8

### error and output to certain files
#PBS -e {/home/hpc/cychen/2021_summer/PBS}/pbslog.e.txt
#PBS -o {/home/hpc/cychen/2021_summer/PBS}/pbslog.o.txt


# If there is any error in this script, then exit.
set -e
echo -e "Works start on $(date +"%T %D")\n"

# do anything you want
echo "PBS"
python3 {/home/hpc/cychen/2021_summer/PBS}/HelloWorld.py
