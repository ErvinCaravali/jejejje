#!/bin/bash

# Establecer variables de conexión a la base de datos
DB_HOST="db"
DB_PORT="5432"
DB_NAME="projecto"
DB_USER="postgres"
DB_PASSWORD="Ec94"

# Función para verificar si las tablas existen en la base de datos
tables_exist() {
    psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -c "\dt $1" | grep -q "No matching relations found"
    return $?
}

# Esperar a que el servicio de base de datos esté disponible
wait_for_db() {
    while ! pg_isready -h $DB_HOST -p $DB_PORT -U $DB_USER > /dev/null 2>&1; do
        echo "Esperando que el servicio de base de datos esté disponible..."
        sleep 10
    done
}

# Verificar la existencia de las tablas específicas después de esperar a que la base de datos esté disponible
wait_for_db
if tables_exist "tabla1" && tables_exist "tabla2"; then
    echo "Las tablas requeridas existen en la base de datos."
    exit 0
else
    echo "Una o más tablas requeridas no existen en la base de datos."
    exit 1
fi
