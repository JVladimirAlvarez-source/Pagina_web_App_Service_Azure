# Aprovisionamiento Automatizado de App Service en Azure (Free Tier)

Este repositorio contiene un script en Azure CLI para automatizar el despliegue de una Web App en Linux sobre Microsoft Azure, utilizando el nivel gratuito (F1).

## Requisitos Previos
- Cuenta activa en Microsoft Azure.
- Azure CLI o acceso a Azure Cloud Shell.
- Control de versiones con Git.

## ==========================================
# ESTRUCTURA DEL SCRIPT
## ==========================================

## 1. Definición de Variables Globales
RESOURCE_GROUP="RG-WordPress-Sandbox"
LOCATION="westus2"
PLAN_NAME="Plan-WordPress-Free"
WEBAPP_NAME="blogjhonny01"

## 2. Crear Grupo de Recursos
az group create --name $RESOURCE_GROUP --location $LOCATION

## 3. Crear Plan de App Service (Nivel F1 Gratuito en Linux)
az appservice plan create \
  --name $PLAN_NAME \
  --resource-group $RESOURCE_GROUP \
  --sku F1 \
  --is-linux

## 4. Crear la Web App con Runtime PHP 8.2
az webapp create \
  --name $WEBAPP_NAME \
  --resource-group $RESOURCE_GROUP \
  --plan $PLAN_NAME \
  --runtime "PHP|8.2"
El script realiza las siguientes operaciones:
1. Definicion de variables globales para recursos y ubicaciones.
2. Creacion de un Grupo de Recursos aislado.
3. Configuración de un App Service Plan en capa F1 (Linux).
4. Despliegue de una Web App con tiempo de ejecucion PHP 8.2.

## Limpieza de Recursos
Para eliminar el grupo de recursos y evitar consumo en la suscripción, ejecute:

```bash
az group delete --name RG-WordPress-Sandbox --yes --no-wait
