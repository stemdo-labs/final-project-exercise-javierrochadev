# Ejecucion de Terraform

Este workflow de GitHub Actions permite ejecutar comandos de Terraform (`init`, `plan`, `apply`, `destroy`) para gestionar la infraestructura en Azure.

## Activación del Workflow

El workflow se activa manualmente a través de `workflow_dispatch`, permitiendo al usuario seleccionar la acción de Terraform a ejecutar:

- `init`: Inicializa el proyecto de Terraform.
- `plan`: Genera un plan de ejecución.
- `apply`: Aplica los cambios definidos en el plan.
- `destroy`: Elimina la infraestructura gestionada por Terraform.

## Entrada de Usuario

El usuario debe seleccionar la acción que desea ejecutar mediante la interfaz de GitHub Actions.

## Permisos

- `pull-requests`: write
- `contents`: read

## Variables de Entorno

El workflow utiliza las siguientes variables de entorno, configuradas como secretos en GitHub:

- `ARM_CLIENT_ID`
- `ARM_CLIENT_SECRET`
- `ARM_SUBSCRIPTION_ID`
- `ARM_TENANT_ID`

## Descripción del Workflow

1. **Checkout del Código**: Descarga el código del repositorio.
2. **Instalar Azure CLI**: Instala la CLI de Azure para autenticación.
3. **Login en Azure**: Autentica a Terraform con un Service Principal de Azure.
4. **Configurar Terraform**: Configura Terraform con la versión `1.5.5`.
5. **Ejecutar Comandos de Terraform**: Ejecuta uno de los siguientes comandos dependiendo de la acción seleccionada:
   - `Terraform Init`: Inicializa Terraform.
   - `Terraform Plan`: Genera un plan de ejecución.
   - `Terraform Apply`: Aplica los cambios.
   - `Terraform Destroy`: Elimina la infraestructura.
   - `Terraform State List`: Muestra el estado de la infraestructura (solo para `destroy`).

## Infraestrcutura que se levanta en Terraform

WEST US

- **VNet de Azure**:
  - Red virtual para la infraestructura.
  
- **Subred**:
  - Subred asociada a la VNet.
  
- **IP Pública para la máquina de backup**:
  - Asignación de una IP pública estática para la máquina de backup.

- **Interfaces de Red para las máquinas**:
  - Configuración de interfaces de red para las máquinas.

    - **Máquina de Backup**:
      - IP pública y privada asignada a la interfaz de red.
    
    - **Máquina BBDD**:
      - IP pública y privada asignada a la interfaz de red.

- **Contenedor para Blob**:
  - Almacenamiento para blobs en Azure.
  - Creación de un contenedor dentro de una cuenta de almacenamiento para guardar datos.

- **Azure Container Instance (ACI)**:
  - Ejecución de contenedores sin necesidad de administrar máquinas virtuales.
  - Se puede usar para desplegar aplicaciones o servicios de forma escalable y sin servidor.
 **Discos**:
  - **Disco 1**: Disco asociado a la máquina de backup para almacenamiento adicional.
  - **Disco 2**: Disco asociado a la máquina de base de datos (BBDD) para almacenar datos persistentes.

- **Peering de Redes**:
  - Conexi
        
NORTH EUROPE

- **VNet de Azure**:
  - Red virtual para la infraestructura.

- **Subred**:
  - Subred asociada a la VNet para aislar recursos y segmentar tráfico.

- **Azure Kubernetes Service (AKS)**:
  - Servicio gestionado para ejecutar clústeres de Kubernetes.
  - Proporciona orquestación de contenedores y escalabilidad automática.
  - Integración con otras soluciones de Azure, como almacenamiento y redes.

# Ansible

# Documentación del Playbook de Ansible para PostgreSQL

Este playbook de Ansible se utiliza para configurar y gestionar una instalación de PostgreSQL en un servidor de base de datos. Configura la autenticación, las versiones, y las opciones globales de PostgreSQL, además de crear bases de datos y usuarios.

## Descripción General

Este playbook realiza varias configuraciones clave en el servidor PostgreSQL, tales como:

1. **Configuración de la autenticación en PostgreSQL**: Se añaden entradas al archivo de configuración `pg_hba.conf` para definir cómo los usuarios pueden autenticarse.
2. **Instalación de PostgreSQL**: Utiliza un role predefinido para instalar PostgreSQL, garantizando que esté configurado con la versión adecuada.
3. **Configuración global de PostgreSQL**: Se definen opciones importantes como `listen_addresses` para controlar en qué direcciones IP el servidor escucha las conexiones y `log_directory` para definir la ubicación de los registros de logs de PostgreSQL.
4. **Creación de bases de datos y usuarios**: Se asegura de que la base de datos y el usuario necesarios estén presentes en el sistema.
5. **Modificación de los archivos de configuración**: Cambia los parámetros de configuración en el archivo `postgresql.conf` para adaptarlos a las necesidades específicas del entorno.
6. **Reinicio del servicio de PostgreSQL**: Después de realizar los cambios de configuración, se reinicia el servicio de PostgreSQL para aplicar las modificaciones.

## Descripción de las Secciones del Playbook

### Hosts

El playbook se ejecuta en los hosts definidos como servidores de bases de datos, especificados bajo la sección de **hosts**. Se espera que el servidor tenga PostgreSQL instalado y configurado correctamente.

### Privilegios de Ejecución

El playbook está configurado para ejecutarse con privilegios elevados (es decir, con `sudo` o `become: yes`), lo que es necesario para poder modificar archivos de configuración del sistema y reiniciar servicios.

### Variables

El playbook utiliza variables que se deben configurar adecuadamente en el entorno de ejecución. Estas variables incluyen, entre otras:

- **Autenticación de PostgreSQL**: Se definen múltiples entradas para el archivo `pg_hba.conf`, especificando qué usuarios pueden acceder a qué bases de datos y qué método de autenticación utilizar.
- **Versión de PostgreSQL**: La versión de PostgreSQL que debe instalarse y configurarse.
- **Opciones de configuración global**: Incluye parámetros como `listen_addresses` para permitir conexiones desde cualquier dirección IP y `log_directory` para especificar la ubicación de los archivos de log.

### Roles

El playbook utiliza un **role** predefinido (`geerlingguy.postgresql`) para gestionar la instalación y configuración de PostgreSQL. Este role permite:

- Crear bases de datos necesarias, como una base de datos específica.
- Crear usuarios de PostgreSQL con sus respectivas contraseñas, asegurando que el sistema esté correctamente configurado desde el principio.

[Documentacion del role](https://galaxy.ansible.com/ui/standalone/roles/geerlingguy/postgresql/documentation/)
### Tareas

Una de las tareas principales del playbook es añadir configuraciones al archivo `postgresql.conf` (como `listen_addresses`), lo que permite personalizar la instalación de PostgreSQL según las necesidades del entorno. Esta tarea utiliza un comando de shell para modificar el archivo y se ejecuta solo si el archivo aún no contiene las configuraciones necesarias.


# Confuguracion de hosted runner

Para ello debemos dirigirnos a los ajsutes de nuestro repo y clickar sobre actions > runner.

![image](https://github.com/user-attachments/assets/cb1444ef-3d67-4837-ad37-b757a4b0d65e)

Creamos uno neuvo.

![image](https://github.com/user-attachments/assets/af75b70f-5e45-4c96-8a31-acfbf9e6b989)

Copiamos el script en la maquina destino.

![image](https://github.com/user-attachments/assets/a97ef01d-dc1a-48e9-8df1-2e8ceeac1204)

# Ya tenemos todo listo para recibir los flows de CI / CD de las aplicaciones.
