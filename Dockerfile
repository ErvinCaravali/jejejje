# Usa la imagen base de Python 3.9
FROM python:3.9

# Configura variables de entorno para Python
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Establece el directorio de trabajo en /code
WORKDIR /code

# Copia el archivo requirements.txt al directorio de trabajo
COPY requirements.txt /code/

# Instala las dependencias del proyecto especificadas en requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto de los archivos del proyecto al directorio de trabajo
COPY . /code/

# Expone el puerto 8000 para que pueda ser accesible desde fuera del contenedor
EXPOSE 8000

# Define el comando para arrancar la aplicación
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# Configuración de la base de datos
ENV DB_NAME projecto
ENV DB_USER postgres
ENV DB_PASSWORD Ec94
ENV DB_HOST localhost
ENV DB_PORT 5432
