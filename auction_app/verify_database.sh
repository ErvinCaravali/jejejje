#!/bin/bash

# Crear la red si aún no existe
docker network inspect mi-red >/dev/null 2>&1 || docker network create mi-red

# Iniciar un contenedor temporal basado en la imagen especificada
container_id=$(docker run -d -p 5433:5432 --name db --network mi-red ervincaravaliibarra/bdgaleria-8:latest)

# Esperar un breve tiempo para que el contenedor se inicie completamente
sleep 10

# Consulta SQL para contar registros en cada tabla
count_auctions=$(docker exec "$container_id" psql -U postgres -d projecto -t -c "SELECT COUNT(*) FROM Auctions;")
count_artworks=$(docker exec "$container_id" psql -U postgres -d projecto -t -c "SELECT COUNT(*) FROM Artworks;")
count_customers=$(docker exec "$container_id" psql -U postgres -d projecto -t -c "SELECT COUNT(*) FROM Customers;")
count_bids=$(docker exec "$container_id" psql -U postgres -d projecto -t -c "SELECT COUNT(*) FROM Bids;")
count_admins=$(docker exec "$container_id" psql -U postgres -d projecto -t -c "SELECT COUNT(*) FROM Admins;")

# Verificar si alguna tabla está vacía
if [[ "$count_auctions" -eq 0 || "$count_artworks" -eq 0 || "$count_customers" -eq 0 || "$count_bids" -eq 0 || "$count_admins" -eq 0 ]]; then
    echo "One or more tables are not populated."
    # Detener y eliminar el contenedor temporal
    docker stop "$container_id" >/dev/null
    docker rm "$container_id" >/dev/null
    exit 1
else
    echo "All tables are populated."
    # Detener y eliminar el contenedor temporal
    docker stop "$container_id" >/dev/null
    docker rm "$container_id" >/dev/null
    exit 0
fi
