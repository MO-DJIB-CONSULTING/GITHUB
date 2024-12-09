#!/bin/sh

# This example submission script contains several important directives, please examine it thoroughly

# Do not put spaces between the start of the line and #SBATCH, the line must start exactly with #SBATCH, no spaces.
# Do not put spaces between the # and SBATCH

# The line below indicates which accounting group to log your job against
#SBATCH --account=icgeb

# The line below selects the group of nodes you require
#SBATCH --partition=ada

# The line below reserves 1 worker node and 2 cores
#SBATCH --nodes=1 --ntasks=10

# The line below specifies the amount of RAM you want to reserve per node (e.g., 64G for 64 GB).
#SBATCH --mem=64G

# The line below indicates the wall time your job will need, 10 hours for example.
#SBATCH --time=10:00:00

# A sensible name for your job, try to keep it short
#SBATCH --job-name="MyJob"

#Modify the lines below for email alerts. Valid type values are NONE, BEGIN, END, FAIL, REQUEUE, ALL
#SBATCH --mail-user=moussa.kassimmohamed@uct.ac.za
#SBATCH --mail-type=BEGIN,END,FAIL

# The cluster is configured primarily for OpenMPI and PMI. Use srun to launch parallel jobs *IF* your code is parallel aware.

# NB, for more information read https://slurm.schedmd.com/sbatch.html

# Use module to gain easy access to software, typing module avail lists all packages.
# Example:
# module load python/miniconda3-py3.12

# If your code is capable of running in parallel and requires a command line argument for the number of cores or threads such as -n 30 or -t 30 then you can link the reserved cores to this with the $SLURM_NTASKS variable for example -n $SLURM_NTASKS instead of -n 30

# Your science stuff goes below this line...

singularity exec /scratch/firenze/singularity/singularity-r_4.4.0.sif Rscript build.R