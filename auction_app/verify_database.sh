#!/bin/bash

# Verificar que el contenedor esté en ejecución y obtener su ID
CONTAINER_ID=$(docker ps -qf "name=172.20.0.2")
if [ -z "$CONTAINER_ID" ]; then
    echo "Error: El contenedor no está en ejecución."
    exit 1
fi

# Obtener la dirección IP del contenedor
CONTAINER_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CONTAINER_ID)
if [ -z "$CONTAINER_IP" ]; then
    echo "Error: No se pudo obtener la dirección IP del contenedor."
    exit 1
fi

# Verificar que el servidor de la base de datos esté en ejecución
DB_STATUS=$(docker exec $CONTAINER_ID pg_isready -h localhost -p 5432 -q)
if [ "$DB_STATUS" != "accepting connections" ]; then
    echo "Error: El servidor de la base de datos no está en ejecución."
    exit 1
fi

# Mostrar la dirección IP del contenedor y la confirmación de que la base de datos está en ejecución
echo "La dirección IP del contenedor es: $CONTAINER_IP"
echo "El servidor de la base de datos está en ejecución."

# Realizar otras tareas, como verificar la configuración de PostgreSQL, si es necesario
