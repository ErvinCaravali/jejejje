# Usa una imagen base de Python
FROM python:3.9

# Configur
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Establece el directorio de trabajo en /COD
WORKDIR /code

# Copia todo el contenido del repositorio al directorio de trabajo del contenedo
COPY . /code/

# Copia el archivo requirements.txt al directorio de traba
COPY requirements.txt /code/

# Instala las dependencias del proyecto especificadas en requirements
RUN pip install --no-cache-dir -r requirements.txt

# Expone el puerto 8000 para que pueda ser accesible desde fuera del contenedor
EXPOSE 8000

# Define el comando para arrancar la aplicación
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
