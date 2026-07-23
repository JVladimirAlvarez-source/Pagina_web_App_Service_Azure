# Aprovisionamiento Automatizado de App Service en Azure (Free Tier)

Este repositorio contiene un script en Azure CLI para automatizar el despliegue de una Web App en Linux sobre Microsoft Azure, utilizando el nivel gratuito (F1).

## Requisitos Previos
- Cuenta activa en Microsoft Azure.
- Azure CLI o acceso a Azure Cloud Shell.
- Control de versiones con Git.

## Estructura del Script
El script realiza las siguientes operaciones:
1. Definicion de variables globales para recursos y ubicaciones.
2. Creacion de un Grupo de Recursos aislado.
3. Configuración de un App Service Plan en capa F1 (Linux).
4. Despliegue de una Web App con tiempo de ejecucion PHP 8.2.

## Limpieza de Recursos
Para eliminar el grupo de recursos y evitar consumo en la suscripción, ejecute:

```bash
az group delete --name RG-WordPress-Sandbox --yes --no-wait
