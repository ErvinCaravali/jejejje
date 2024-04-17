#!/bin/bash

export DATABASE_USER= postgres
export DATABASE_HOST= 172.20.0.2
export DATABASE_NAME= projecto

# Define las consultas SQL para verificar si las tablas están vacías
AUCTIONS_QUERY="SELECT CASE WHEN EXISTS (SELECT 1 FROM auctions) THEN '' ELSE 'Advertencia: La tabla auctions está vacía' END;"
ARTWORKS_QUERY="SELECT CASE WHEN EXISTS (SELECT 1 FROM artworks) THEN '' ELSE 'Advertencia: La tabla artworks está vacía' END;"
CUSTOMERS_QUERY="SELECT CASE WHEN EXISTS (SELECT 1 FROM customers) THEN '' ELSE 'Advertencia: La tabla customers está vacía' END;"
BIDS_QUERY="SELECT CASE WHEN EXISTS (SELECT 1 FROM bids) THEN '' ELSE 'Advertencia: La tabla bids está vacía' END;"
ADMINS_QUERY="SELECT CASE WHEN EXISTS (SELECT 1 FROM admins) THEN '' ELSE 'Advertencia: La tabla admins está vacía' END;"

# Ejecuta las consultas SQL y muestra los resultados
echo "Verificación de tablas en la base de datos:"
echo "------------------------------------------"
echo "Tabla auctions: $(psql -U $DATABASE_USER -h $DATABASE_HOST -d $DATABASE_NAME -c "$AUCTIONS_QUERY")"
echo "Tabla artworks: $(psql -U $DATABASE_USER -h $DATABASE_HOST -d $DATABASE_NAME -c "$ARTWORKS_QUERY")"
echo "Tabla customers: $(psql -U $DATABASE_USER -h $DATABASE_HOST -d $DATABASE_NAME -c "$CUSTOMERS_QUERY")"
echo "Tabla bids: $(psql -U $DATABASE_USER -h $DATABASE_HOST -d $DATABASE_NAME -c "$BIDS_QUERY")"
echo "Tabla admins: $(psql -U $DATABASE_USER -h $DATABASE_HOST -d $DATABASE_NAME -c "$ADMINS_QUERY")"
