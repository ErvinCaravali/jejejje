#!/bin/bash

# Verificar las tablas en la base de datos
echo "Verificación de tablas en la base de datos:"
echo "------------------------------------------"
DATABASE_USER=postgres DATABASE_HOST=172.20.0.2 DATABASE_NAME=projecto \
psql -U $DATABASE_USER -h $DATABASE_HOST -d $DATABASE_NAME -c "SELECT CASE WHEN EXISTS (SELECT 1 FROM auctions) THEN '' ELSE 'Advertencia: La tabla auctions está vacía' END;"
DATABASE_USER=postgres DATABASE_HOST=172.20.0.2 DATABASE_NAME=projecto \
psql -U $DATABASE_USER -h $DATABASE_HOST -d $DATABASE_NAME -c "SELECT CASE WHEN EXISTS (SELECT 1 FROM artworks) THEN '' ELSE 'Advertencia: La tabla artworks está vacía' END;"
DATABASE_USER=postgres DATABASE_HOST=172.20.0.2 DATABASE_NAME=projecto \
psql -U $DATABASE_USER -h $DATABASE_HOST -d $DATABASE_NAME -c "SELECT CASE WHEN EXISTS (SELECT 1 FROM customers) THEN '' ELSE 'Advertencia: La tabla customers está vacía' END;"
DATABASE_USER=postgres DATABASE_HOST=172.20.0.2 DATABASE_NAME=projecto \
psql -U $DATABASE_USER -h $DATABASE_HOST -d $DATABASE_NAME -c "SELECT CASE WHEN EXISTS (SELECT 1 FROM bids) THEN '' ELSE 'Advertencia: La tabla bids está vacía' END;"
DATABASE_USER=postgres DATABASE_HOST=172.20.0.2 DATABASE_NAME=projecto \
psql -U $DATABASE_USER -h $DATABASE_HOST -d $DATABASE_NAME -c "SELECT CASE WHEN EXISTS (SELECT 1 FROM admins) THEN '' ELSE 'Advertencia: La tabla admins está vacía' END;"
