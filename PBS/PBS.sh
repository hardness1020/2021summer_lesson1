#!/bin/bash

### queue name (跟系統要queue queue權限越高越先執行但可執行時間越短)
#PBS -q large

### job name
#PBS -N your_job_name

### set number of nodes
#PBS -l walltime=500:00:00,nodes=1:ppn=8

### error and output to certain files
#PBS -e /home/hpc/cychen/user/{yourUserID}/pbslog.e.txt
#PBS -o /home/hpc/cychen/user/{yourUserID}/pbslog.o.txt

DIR=/home/hpc/cychen/user/{yourUserID}/

# If there is any error in this script, then exit.
set -e
echo -e "Works start on $(date +"%T %D")\n"

# do anything you want
echo "first log"
python3 -c "import sys;print('first err log', file=sys.stderr)"

echo "second log" >$DIR/log.o.txt
python3 -c "import sys;print('second err log', file=sys.stderr)" 2>$DIR/log.e.txt


echo "This line will not output bcz bwa-mem error"
