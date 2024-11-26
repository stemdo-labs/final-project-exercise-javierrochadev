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

# Extraer la versión actual del archivo
current_version=$(grep -oP 'version:\s*\K[\d.]+' "$file_path")

if [[ -z "$current_version" ]]; then
    echo "Error: No se encontró la versión en el archivo."
    exit 1
fi

# Separar la versión en mayor, menor y parche
IFS='.' read -r major minor patch <<< "$current_version"

# Asegurarse de que los valores sean números
if ! [[ "$major" =~ ^[0-9]+$ ]] || ! [[ "$minor" =~ ^[0-9]+$ ]] || ! [[ "$patch" =~ ^[0-9]+$ ]]; then
    echo "Error: La versión '$current_version' no es válida."
    exit 1
fi

# Incrementar la versión
if (( patch < 9 )); then
    patch=$((patch + 1))
elif (( minor < 9 )); then
    patch=0
    minor=$((minor + 1))
else
    patch=0
    minor=0
    major=$((major + 1))
fi

# Nueva versión
new_version="${major}.${minor}.${patch}"

# Reemplazar la versión en el archivo
sed -i "s/version:\s*[0-9]*\.[0-9]*\.[0-9]*/version: $new_version/" "$file_path"

echo "Versión actualizada de '$current_version' a '$new_version' en el archivo '$file_path'."
