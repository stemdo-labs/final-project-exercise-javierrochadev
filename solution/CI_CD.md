![image](https://github.com/user-attachments/assets/b60b0db5-621d-45a9-83b2-5e7d30d040fc)


# Documentación del Workflow de CI

Este flujo de trabajo de GitHub Actions automatiza la construcción y publicación de una imagen Docker en Azure Container Registry (ACR). El workflow incluye la configuración y autenticación en Azure, la construcción de la imagen Docker y su posterior publicación en ACR.

## Activación del Workflow

El workflow se activa mediante el evento `workflow_call`, lo que permite que otros workflows lo invoquen.

## Descripción de los Jobs

### Job: `publish_image`

Este job se ejecuta en un runner con la etiqueta `runner-stemdo-labs`. Este job realiza varias tareas para configurar el entorno, construir la imagen Docker y publicarla en ACR.

#### Pasos del Job

1. **Set up Node.js**:
   - Configura la versión de Node.js para el entorno de ejecución, en este caso se utiliza la versión `20`.

2. **Check out code**:
   - Realiza un `checkout` del código fuente desde el repositorio para poder acceder al Dockerfile y el contexto de construcción de la imagen.

3. **Install Azure CLI**:
   - Instala la Azure CLI en el entorno de ejecución utilizando un script de instalación.

4. **Login to Azure with Service Principal**:
   - Inicia sesión en Azure utilizando un Service Principal con las credenciales almacenadas en los secretos (`arm_client_id`, `arm_client_secret`, `arm_tenant_id`).

5. **Log in to ACR**:
   - Se autentica en el Azure Container Registry (ACR) utilizando el nombre de ACR almacenado en los secretos.

6. **Build Docker Image**:
   - Construye la imagen Docker utilizando el `Dockerfile` y etiqueta la imagen con el nombre y la etiqueta proporcionados como inputs. La imagen se etiqueta con la URL del ACR, lo que permite su posterior publicación en Azure.

7. **Push Docker Image**:
   - Publica la imagen Docker en el ACR utilizando el comando `docker push`. La imagen se sube al repositorio de contenedores con la etiqueta proporcionada en el paso anterior.

# Documentación del Workflow de CD 

Este flujo de trabajo de GitHub Actions automatiza el proceso de despliegue continuo (CD) de una aplicación utilizando Helm y Kubernetes (AKS). El workflow se encarga de autenticar y configurar las herramientas necesarias (Azure CLI, kubectl, Helm), y luego despliega la aplicación en Azure Kubernetes Service (AKS).

## Activación del Workflow

El workflow se activa mediante el evento `workflow_call`, lo que permite que otros workflows lo invoquen.

## Descripción de los Jobs

### Job: `deploy`

Este job se ejecuta en un runner con la etiqueta `runner-stemdo-labs`. Realiza varias tareas para configurar el entorno, autenticar en Azure, preparar los secretos necesarios, y luego desplegar la aplicación en un clúster de Kubernetes utilizando Helm.

#### Pasos del Job

1. **Set up Node.js**:
   - Configura la versión de Node.js para el entorno de ejecución, en este caso se utiliza la versión `20`.

2. **Checkout code**:
   - Realiza un `checkout` del código fuente desde el repositorio para obtener los archivos necesarios, como los valores de configuración.

3. **Install Azure CLI**:
   - Instala la Azure CLI en el entorno de ejecución utilizando un script de instalación.

4. **Login to Azure with Service Principal**:
   - Inicia sesión en Azure utilizando un Service Principal con las credenciales almacenadas en los secretos (`arm_client_id`, `arm_client_secret`, `arm_tenant_id`).

5. **Install kubectl using the official script**:
   - Instala `kubectl`, la herramienta de línea de comandos para interactuar con clústeres de Kubernetes, utilizando un script oficial de instalación.

6. **Install Helm**:
   - Instala `Helm`, la herramienta de gestión de paquetes para Kubernetes, usando un script de instalación de Helm.

7. **Get AKS credentials**:
   - Obtiene las credenciales de acceso al clúster de AKS utilizando el comando `az aks get-credentials` y las credenciales de Azure configuradas previamente.

8. **Log in to ACR**:
   - Se autentica en el Azure Container Registry (ACR) utilizando el nombre de ACR configurado en los secretos.

9. **Helm Login**:
   - Inicia sesión en el registro de Helm (Harbor) utilizando las credenciales de Harbor configuradas en los secretos.

10. **Create Docker registry secret in default namespace**:
    - Verifica si existe un secreto de Docker en el espacio de nombres `default`. Si no existe, crea uno para autenticar el acceso al ACR utilizando las credenciales del Service Principal.

11. **Deploy with Helm**:
    - Despliega la aplicación en el clúster de Kubernetes utilizando el comando `helm upgrade --install`. La configuración de la base de datos (host, puerto, nombre, usuario, contraseña) y la imagen Docker (nombre y etiqueta) se pasan como parámetros de configuración para el chart de Helm.
    - El chart de Helm se descarga desde Harbor y se despliega en el espacio de nombres `default` de Kubernetes, configurando la base de datos y la imagen Docker con los valores proporcionados.
