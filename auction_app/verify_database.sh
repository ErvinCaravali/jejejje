#!/bin/bash

#!/bin/bash

# Función para verificar si las tablas existen en la base de datos
tables_exist() {
    psql -h $DATABASE_HOST -p $DATABASE_PORT -U $DATABASE_USER -d $DATABASE_NAME -c "\dt $1" | grep -q "No matching relations found"
    return $?
}

# Esperar a que el servicio de base de datos esté disponible
wait_for_db() {
    while ! psql -h $DATABASE_HOST -p $DATABASE_PORT -U $DATABASE_USER -c "SELECT 1;" > /dev/null 2>&1; do
        echo "Esperando que el servicio de base de datos esté disponible..."
        sleep 1
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

