#!/bin/bash

# Define las consultas SQL para verificar si las tablas están vacías
AUCTIONS_QUERY="SELECT CASE WHEN EXISTS (SELECT 1 FROM auctions) THEN '' ELSE 'Advertencia: La tabla auctions está vacía' END;"
ARTWORKS_QUERY="SELECT CASE WHEN EXISTS (SELECT 1 FROM artworks) THEN '' ELSE 'Advertencia: La tabla artworks está vacía' END;"
CUSTOMERS_QUERY="SELECT CASE WHEN EXISTS (SELECT 1 FROM customers) THEN '' ELSE 'Advertencia: La tabla customers está vacía' END;"
BIDS_QUERY="SELECT CASE WHEN EXISTS (SELECT 1 FROM bids) THEN '' ELSE 'Advertencia: La tabla bids está vacía' END;"
ADMINS_QUERY="SELECT CASE WHEN EXISTS (SELECT 1 FROM admins) THEN '' ELSE 'Advertencia: La tabla admins está vacía' END;"

# Ejecutar las consultas SQL y mostrar los resultados
echo "Verificación de tablas en la base de datos:"
echo "------------------------------------------"
echo "Tabla auctions: $(psql -U postgres -h 172.20.0.2 -d projecto -c \"$AUCTIONS_QUERY\")"
echo "Tabla artworks: $(psql -U postgres -h 172.20.0.2 -d projecto -c \"$ARTWORKS_QUERY\")"
echo "Tabla customers: $(psql -U postgres -h 172.20.0.2 -d projecto -c \"$CUSTOMERS_QUERY\")"
echo "Tabla bids: $(psql -U postgres -h 172.20.0.2 -d projecto -c \"$BIDS_QUERY\")"
echo "Tabla admins: $(psql -U postgres -h 172.20.0.2 -d projecto -c \"$ADMINS_QUERY\")"
