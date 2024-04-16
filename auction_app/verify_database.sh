#!/bin/bash

# Crear la red si aún no existe
docker network inspect auction_project_mi-red >/dev/null 2>&1 || docker network create auction_project_mi-red

# Iniciar un contenedor temporal basado en la imagen especificada
docker run -d --rm --name db --network auction_project_mi-red ervincaravaliibarra/bdgaleria-8:latest

# Consulta SQL para contar registros en cada tabla
count_auctions=$(docker exec db psql -U postgres -d projecto -t -c "SELECT COUNT(*) FROM auctions;")
count_artworks=$(docker exec db psql -U postgres -d projecto -t -c "SELECT COUNT(*) FROM artworks;")
count_customers=$(docker exec db psql -U postgres -d projecto -t -c "SELECT COUNT(*) FROM customers;")
count_bids=$(docker exec db psql -U postgres -d projecto -t -c "SELECT COUNT(*) FROM bids;")
count_admins=$(docker exec db psql -U postgres -d projecto -t -c "SELECT COUNT(*) FROM admins;")

# Verificar si alguna tabla está vacía
if [[ "$count_auctions" -eq 0 || "$count_artworks" -eq 0 || "$count_customers" -eq 0 || "$count_bids" -eq 0 || "$count_admins" -eq 0 ]]; then
    echo "One or more tables are not populated."
    # Detener y eliminar el contenedor temporal
    docker stop db
    exit 1
else
    echo "All tables are populated."
    # Detener y eliminar el contenedor temporal
    docker stop db
    exit 0
fi
