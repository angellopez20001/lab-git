#!/bin/bash

if [ $# -ne 2 ]; then
   exit 1
fi

Archivo=$1
Fraccion=$2

if [ ! -f "$Archivo" ]; then
    echo "Error: El archivo '$Archivo' no existe"
    exit 1
fi

if ! [[ "$Fraccion" =~ ^[0-9]+$ ]]; then
    echo "Error: El número de líneas debe ser un valor numérico"
    exit 1
fi

Lineastotales=$(wc -l < "$Archivo")
Lineasfinales=$((Lineastotales / Fraccion))

head -n "$Lineasfinales" "$Archivo" > ${Archivo%.*}-out.fastq
