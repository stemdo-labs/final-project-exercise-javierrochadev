#!/bin/bash

# Verificar si se pasó el parámetro (prefijo) en la llamada
if [ -z "$1" ]; then
  echo "Error: Debes proporcionar el prefijo de la ruta como argumento."
  exit 1
fi

# Prefijo proporcionado como argumento
prefix="$1"

# Ruta completa del archivo Chart.yaml
file_path="./charts/${prefix}/Chart.yaml"

# Verificar si el archivo existe
if [[ ! -f "$file_path" ]]; then
    echo "Error: El archivo '$file_path' no existe."
    exit 1
fi

# Extraer y devolver la versión actual del archivo
current_version=$(grep -oP 'version:\s*\K[\d.]+' "$file_path")

if [[ -z "$current_version" ]]; then
    echo "Error: No se encontró la versión en el archivo."
    exit 1
fi

# Devolver la versión sin hacer ningún cambio
echo "$current_version"
