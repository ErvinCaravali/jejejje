#!/bin/bash

# Crear la red si aún no existe
docker network inspect auction_project_mi-red >/dev/null 2>&1 || docker network create auction_project_mi-red

# Array que contiene los nombres de las tablas que se verificarán
tables=("auctions" "artworks" "customers" "bids" "admins")

# Variable para controlar si las tablas están pobladas
populated=true

# Iniciar un contenedor temporal basado en la imagen especificada
container_id=$(docker run -p 5433:5432 --name db --network auction_project_mi-red ervincaravaliibarra/bdgaleria-8:latest)

# Iterar sobre cada tabla y verificar si está poblada
for table in "${tables[@]}"; do
    # Ejecutar consulta SQL para contar registros en la tabla actual
    count=$(docker exec -i "$container_id" psql -U postgres -d projecto -t -c "SELECT COUNT(*) FROM $table;")
    
    # Imprimir el nombre de la tabla y la cantidad de registros
    echo "Table $table has $count records."
    
    # Verificar si la tabla está vacía
    if [[ "$count" -eq 0 ]]; then
        populated=false
    fi
done

# Detener y eliminar el contenedor temporal
docker stop "$container_id"

# Imprimir el resultado de la verificación
if [ "$populated" = true ]; then
    echo "All tables are populated."
    exit 0  # Indica que la verificación fue exitosa
else
    echo "One or more tables are not populated."
    exit 1  # Indica que la verificación falló
fi
