#!/bin/bash

# Verificar si se pasaron los parámetros necesarios
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Error: Debes proporcionar el prefijo de la ruta y la nueva versión como argumentos."
  echo "Uso: $0 <prefijo> <nueva-versión>"
  exit 1
fi

# Prefijo y nueva versión proporcionados como argumentos
prefix="$1"
new_version="$2"

# Ruta completa del archivo Chart.yaml utilizando el prefijo
file_path="./charts/${prefix}/Chart.yaml"

# Verificar si el archivo existe
if [[ ! -f "$file_path" ]]; then
    echo "Error: El archivo '$file_path' no existe."
    exit 1
fi

# Validar el formato de la nueva versión (X.Y.Z)
if ! [[ "$new_version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Error: La versión '$new_version' no es válida. Debe tener el formato 'X.Y.Z'."
    exit 1
fi

# Reemplazar la versión en el archivo
sed -i "s/version:\s*[0-9]*\.[0-9]*\.[0-9]*/version: $new_version/" "$file_path"

echo "Versión actualizada a '$new_version' en el archivo '$file_path'."
