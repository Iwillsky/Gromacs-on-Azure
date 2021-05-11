#!/bin/bash
#SBATCH -o job.%j.out
#SBATCH --job-name=GmxMEMSample
#SBATCH --nodes=3       
#SBATCH --gres=gpu:1 

export HOSTLIST_FILENAME=hostlist$(date "+%Y%m%d%H%M%S")
srun bash -c 'sudo ./synchost.sh $HOSTLIST_FILENAME'

module load mpi/openmpi

#run sample 
/opt/openmpi-4.0.5/bin/mpirun -np 2 --hostfile $HOSTLIST_FILENAME /usr/local/gromacs/bin/gmx_mpi mdrun -s /home/cyclecloud/benchMEM.tpr

#another nvt sample 
#/opt/openmpi-4.0.5/bin/mpirun -np 2 --hostfile $HOSTLIST_FILENAME /usr/local/gromacs/bin/gmx_mpi mdrun -v -deffnm nvt
