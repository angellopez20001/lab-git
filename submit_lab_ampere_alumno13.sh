#!/bin/bash

#SBATCH -p hpc-bio-ampere
#SBATCH --chdir=/home/alumno13/lab3
#SBATCH --ntasks-per-node=4

Fraccion=13
Contador=0
for file in *.fastq;
do
	./file-cut.sh "$file" "$Fraccion"  &
	((Contador++))
	if (( Contador % 4 == 0 )); then
        	echo "  Lote $((Contador/4)): Esperando 4 procesos..."
        wait
    fi
done
wait
