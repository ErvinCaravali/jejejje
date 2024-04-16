#!/bin/bash

# Script para verificar la población de la base de datos
# Este script realiza consultas SQL para contar el número de registros en cada tabla

tables=("Auctions" "Artworks" "Customers" "Bids" "Admins")
populated=true

for table in "${tables[@]}"; do
    count=$(docker exec -i db psql -U postgres -d projecto -t -c "SELECT COUNT(*) FROM $table;")
    echo "Table $table has $count records."
    if [[ "$count" -eq 0 ]]; then
        populated=false
    fi
done

echo "::set-output name=populated::$populated"
