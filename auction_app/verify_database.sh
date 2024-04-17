#!/bin/bash

# Establecer variables de conexión a la base de datos
DB_HOST="db"
DB_PORT="5432"
DB_NAME="projecto"
DB_USER="postgres"
DB_PASSWORD="Ec94"

# Verificar si las tablas existen en la base de datos
tables_exist() {
    psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -c "\dt $1" | grep -q "No matching relations found"
    return $?
}

# Verificar la existencia de las tablas específicas
if tables_exist "auctions" && tables_exist "artworks" && tables_exist "customers" && tables_exist "bids" && tables_exist "admins"; then
    echo "Las tablas requeridas existen en la base de datos."
    exit 0
else
    echo "Una o más tablas requeridas no existen en la base de datos."
    exit 1
fi
