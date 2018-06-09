#!/bin/bash
EXEPATH='/mnt/msu/users/avsidorenkov_251962/ez_md/PFMDS/executables/'
EXE='run_md_simulation_mpi_gfortran'
module add gcc
module add openmpi/1.8.4-gcc
export I_MPI_PIN=off

prefix='a_'
sbatch -o "$prefix"out.txt -e "$prefix"err.txt -p regular4 -t 3-0 -N 48 ompi --bind-to none "$EXEPATH""$EXE" -p "$prefix" -op 50000 -ipath input_files/ -opath results/ -ilist settings_list.txt &>"$prefix"job_id.txt

module rm gcc
module rm openmpi/1.8.4-gcc