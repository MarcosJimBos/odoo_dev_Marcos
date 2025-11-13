#!/bin/bash
# Script para restaurar datos y levantar el entorno Odoo

echo "========================================"
echo "     INICIANDO RESTAURACIÓN Y SETUP     "
echo "========================================"

# 1. Verificar si el paquete de datos existe
if [ ! -f odoo_data_package.tar.gz ]; then
    echo "ERROR: No se encontró el archivo de datos 'odoo_data_package.tar.gz'."
    echo "Asegúrate de haber hecho 'git clone' correctamente."
    exit 1
fi

# 2. Desempaquetar los datos, recreando las carpetas de volúmenes
echo "Restaurando estructura de carpetas de datos..."
tar -xzvf odoo_data_package.tar.gz

# 3. Levantar los servicios de Docker
echo "Iniciando Docker Compose..."
docker-compose up -d

echo "========================================"
echo " ¡RESTAURACIÓN COMPLETA!"
echo " Acceso a Odoo en: http://localhost:8069"
echo "========================================"