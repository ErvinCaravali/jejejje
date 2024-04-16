#!/bin/bas

tables=("Auctions" "Artworks" "Customers" "Bids" "Admins")
populated=true

# Iniciar un contenedor temporal basado en la imagen especificada
container_id=$(docker run -d --rm ervincaravaliibarra/bdgaleria-8:latest)

for table in "${tables[@]}"; do
    count=$(docker exec -i "$container_id" psql -U postgres -d projecto -t -c "SELECT COUNT(*) FROM $table;")
    echo "Table $table has $count records."
    if [[ "$count" -eq 0 ]]; then
        populated=false
    fi
done

# Detener y eliminar el contenedor temporal
docker stop "$container_id"

if [ "$populated" = true ]; then
    echo "true"
else
    echo "false"
fi
