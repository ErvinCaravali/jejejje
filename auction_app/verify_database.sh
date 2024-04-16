#!/bin/bash


tables=("Auctions" "Artworks" "Customers" "Bids" "Admins")
populated=true

for table in "${tables[@]}"; do
    count=$(docker exec -i db psql -U postgres -d projecto -t -c "SELECT COUNT(*) FROM $table;")
    echo "Table $table has $count records."
    if [[ "$count" -eq 0 ]]; then
        populated=false
    fi
done

if [ "$populated" = true ]; then
    echo "true"
else
    echo "false"
fi
