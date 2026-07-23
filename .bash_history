Solicitando una instancia de Cloud Shell.Succeeded. 
Connecting terminal...
Welcome to Azure Cloud Shell
Type "az" to use Azure CLI
Type "help" to learn about Cloud Shell
Your Cloud Shell session will be ephemeral so no files or system changes will persist beyond your current session.
jhonny [ ~ ]$ 
Solicitando una instancia de Cloud Shell.Succeeded. 
Connecting terminal...
Welcome to Azure Cloud Shell
Type "az" to use Azure CLI
Type "help" to learn about Cloud Shell
Your Cloud Shell session will be ephemeral so no files or system changes will persist beyond your current session.
jhonny [ ~ ]$# 1. Crear grupo de recursos
az group create --name RG-WordPress --location "Central US"
# 2. Crear plan de App Service gratuito
az appservice plan create   --name planWordPress   --resource-group RG-WordPress   --sku F1   --location "Central US"
# 3. Crear aplicación web WordPress
az webapp create   --name blogjhonny01   --resource-group RG-WordPress   --plan planWordPress   --runtime "PHP|7.4"
# 4. Configurar base de datos MySQL in App
az webapp config appsettings set   --resource-group RG-WordPress   --name blogjhonny01   --settings DATABASE_TYPE="MySQLInApp"
# 1. Crear grupo de recursos
az group create --name RG-WordPress --location "Central US"
# 2. Crear plan de App Service gratuito
az appservice plan create   --name planWordPress   --resource-group RG-WordPress   --sku F1   --location "Central US"
# 3. Crear aplicación web WordPress
az webapp create   --name blogjhonny01   --resource-group RG-WordPress   --plan planWordPress   --runtime "PHP|7.4"
# 4. Configurar base de datos MySQL in App
az webapp config appsettings set   --resource-group RG-WordPress   --name blogjhonny01   --settings DATABASE_TYPE="MySQLInApp"
az webapp create --resource-group RG-WordPress --plan planWordPress --name blogjhonny01 --runtime "PHP|8.2"
az appservice plan create --name planWordPressLinux --resource-group RG-WordPress --sku B1 --is-linux
az webapp create --resource-group RG-WordPress --plan planWordPressLinux --name blogjhonny01 --runtime "PHP|8.2"
curl -O https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
cd wordpress
zip -r ../wordpress.zip .
cd ..
az webapp deploy --resource-group RG-WordPress --name blogjhonny01 --src-path wordpress.zip --type zip
az group delete --name RG-WordPress --yes --no-wait
# 1. Definir variables (puedes cambiar 'blogjhonny01' si prefieres otro nombre)
RESOURCE_GROUP="RG-WordPress-Sandbox"
LOCATION="centralus"
APP_NAME="blogjhonny01-$RANDOM"
PLAN_NAME="planWordPressGratis"
# 2. Crear el Grupo de Recursos
az group create   --name $RESOURCE_GROUP   --location $LOCATION
# 3. Crear el Plan de App Service en el nivel F1 (GRATIS)
az appservice plan create   --name $PLAN_NAME   --resource-group $RESOURCE_GROUP   --sku F1   --is-linux
# 4. Crear la App Web con la plantilla de WordPress y MySQL integrado
az webapp create   --resource-group $RESOURCE_GROUP   --plan $PLAN_NAME   --name $APP_NAME   --runtime "PHP|8.2"
# 5. Imprimir la URL de tu nuevo sitio web
echo "=================================================="
echo "¡Sitio creado con éxito!"
echo "Tu URL es: https://$APP_NAME.azurewebsites.net"
echo "=================================================="
az group delete --name RG-WordPress-SandBox --yes --no-wait
az group delete --name Wordpress --yes --no-wait
# 1. Definir variables (puedes cambiar 'blogjhonny01' si prefieres otro nombre)
RESOURCE_GROUP="RG-WordPress-Sandbox"
LOCATION="centralus"
APP_NAME="blogjhonny01-$RANDOM"
PLAN_NAME="planWordPressGratis"
# 2. Crear el Grupo de Recursos
az group create   --name $RESOURCE_GROUP   --location $LOCATION
# 3. Crear el Plan de App Service en el nivel F1 (GRATIS)
az appservice plan create   --name $PLAN_NAME   --resource-group $RESOURCE_GROUP   --sku F1   --is-linux
# 4. Crear la App Web con la plantilla de WordPress y MySQL integrado
az webapp create   --resource-group $RESOURCE_GROUP   --plan $PLAN_NAME   --name $APP_NAME   --runtime "PHP|8.2"
# 5. Imprimir la URL de tu nuevo sitio web
echo "=================================================="
echo "¡Sitio creado con éxito!"
echo "Tu URL es: https://$APP_NAME.azurewebsites.net"
echo "=================================================="
cat << 'EOF' > README.md
# ⚡ Aprovisionamiento Automatizado de App Service en Azure (Free Tier)

Este repositorio contiene un script en **Azure CLI** para automatizar el despliegue de una Web App en Linux sobre Microsoft Azure, utilizando el nivel gratuito (`F1`).

---

## 🛠️ Requisitos Previos

- Cuenta activa en **Microsoft Azure**.
- **Azure CLI** o acceso a **Azure Cloud Shell**.
- Control de versiones con **Git**.

---

## 📜 Script de Despliegue (`deploy.sh`)

```bash
# 1. Definir variables
RESOURCE_GROUP="RG-WordPress-Sandbox"
LOCATION="centralus"
APP_NAME="blogjhonny01-$RANDOM"
PLAN_NAME="planWordPressGratis"

# 2. Crear el Grupo de Recursos
az group create \
  --name $RESOURCE_GROUP \
  --location $LOCATION

# 3. Crear el Plan de App Service en el nivel F1 (GRATIS)
az appservice plan create \
  --name $PLAN_NAME \
  --resource-group $RESOURCE_GROUP \
  --sku F1 \
  --is-linux

# 4. Crear la App Web
az webapp create \
  --resource-group $RESOURCE_GROUP \
  --plan $PLAN_NAME \
  --name $APP_NAME \
  --runtime "PHP|8.2"

# 5. Confirmación
echo "¡Sitio creado con éxito!"
echo "Tu URL es: https://$APP_NAME.azurewebsites.net"
# 1. Preparar todos los archivos nuevos/modificados
git add .

# 2. Guardar el estado de los cambios
git commit -m "docs: agregar README.md detallado y script deploy.sh"

# 3. Subir los cambios a GitHub
git push origin main

claear
clear
cat << 'EOF' > README.md
#  Aprovisionamiento Automatizado de App Service en Azure (Free Tier)

Este repositorio contiene un script en **Azure CLI** para automatizar el despliegue de una Web App en Linux sobre Microsoft Azure, utilizando el nivel gratuito (`F1`).

## Requisitos Previos
- Cuenta activa en Microsoft Azure.
- Azure CLI o acceso a Azure Cloud Shell.
- Control de versiones con Git.

##  Limpieza de Recursos
```bash
az group delete --name RG-WordPress-Sandbox --yes --no-wait

### Paso 2: Guardar y subir a GitHub
Una vez creado el archivo, ejecuta estos tres comandos:
```bash
git add .
git commit -m "docs: actualizar README.md"
git push origin main
### Paso 2: Guardar y subir a GitHub
Una vez creado el archivo, ejecuta estos tres comandos:
```bash
git add .
git commit -m "docs: actualizar README.md"
git push origin main
clear
cat << 'EOF' > README.md
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
EOF

git add README.md
git commit -m "docs: actualizar README.md"
git push origin main
git init
git remote add origin https://github.com/JVladimirAlvarez-source/Pagina_web_App_Service_Azure.git
git branch -M main
git add .
git commit -m "docs: actualizar README.md"
git push -u origin main
git config --global user.email "vladimirmethaphian@gmail.com"
git config --global user.name "JVladimirAlvarez-source"
