#!/bin/bash
#PBS -q large
#PBS -N your_job_name
#PBS -l walltime=500:00:00,nodes=1:ppn=8
#PBS -e /home/hpc/cychen/user/linnil1/pbslog.e.txt
#PBS -o /home/hpc/cychen/user/linnil1/pbslog.o.txt

DIR=/home/hpc/cychen/user/linnil1/

set -e
echo -e "Works start on $(date +"%T %D")\n"

# do anything you want
echo "first log"
python3 -c "import sys;print('first err log', file=sys.stderr)"

echo "second log" >$DIR/log.o.txt
python3 -c "import sys;print('second err log', file=sys.stderr)" 2>$DIR/log.e.txt

bwa-mem

echo "This line will not output bcz bwa-mem error"

# How to use:
# walltime = max running time
# ppn = processes per node
# save this script to test.pbs
# qsub test.pbs
# qstat
# head *.txt
