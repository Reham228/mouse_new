#!/bin/bash

# Submit this script with: sbatch thefilename

#SBATCH --time=4:00:00 # walltime
#SBATCH --ntasks-per-node=48 # number of processor cores (i.e. tasks)
#SBATCH --nodes=1 # number of nodes
#SBATCH --wckey edu_class # Project Code
#SBATCH -J "exmple" # job name
#SBATCH --mail-user=botros.hanna@inl.gov # email address
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END

# MOUSE Directory
cd /home/username/projects/MOUSE

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS (Pyton Environment where OpenMC and Watts are installed)
source activate /home/username/mouse_env

# Your job commands go here
python -m examples.watts_GCMR_Design_reflector > output_ref_GCMR.txt

#!/bin/bash

#SBATCH --time=35:00:00
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32
#SBATCH --nodes=1
#SBATCH --wckey=edu_class
#SBATCH -J hpmr_reference
#SBATCH --mail-user=reham.abdelnasser@inl.gov
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --output=hpmr_reference_%j.out
#SBATCH --error=hpmr_reference_%j.err

# Load modules / activate environment as required on your cluster
source ~/.bashrc
conda activate openmc-env

# Use all allocated CPU cores with OpenMP
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

cd /home/abderi/thesis/MOUSE

python -m examples.watts_exec_HPMR
