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

# Infraestructura de Azure

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

# Infraestructura de Azure - Red y AKS

- **VNet de Azure**:
  - Red virtual para la infraestructura.

- **Subred**:
  - Subred asociada a la VNet para aislar recursos y segmentar tráfico.

- **Azure Kubernetes Service (AKS)**:
  - Servicio gestionado para ejecutar clústeres de Kubernetes.
  - Proporciona orquestación de contenedores y escalabilidad automática.
  - Integración con otras soluciones de Azure, como almacenamiento y redes.









