# Backend Spring Boot Helm Chart

## Descripción

Este Helm chart despliega una aplicación **backend** construida con **Spring Boot** en un clúster de **Kubernetes**. El chart incluye:

- **Deployment**: Define el número de réplicas del pod para la aplicación backend.
- **Horizontal Pod Autoscaler (HPA)**: Configura el escalado automático de los pods entre 2 y 10 réplicas según la utilización de CPU.
- **Service**: Expone la aplicación a través de un servicio de tipo `LoadBalancer`, permitiendo su acceso desde el exterior del clúster.
- **ConfigMap**: Proporciona las credenciales de conexión a la base de datos (host, puerto, usuario y contraseña).

Este chart facilita la configuración y despliegue de una aplicación backend **Spring Boot** en Kubernetes, con un escalado automático basado en la carga de la CPU y configuración flexible para la base de datos.

## Requisitos previos

1. **Kubernetes** `1.20` o superior.
2. **Helm** `3.5` o superior instalado.
3. Acceso a un clúster de **Kubernetes** con permisos para crear **Deployments**, **Services**, **HPAs** y **ConfigMaps**.
4. Una **base de datos** configurada (por ejemplo, **MySQL** o **PostgreSQL**) y accesible desde el clúster.
5. Acceso a un **repositorio de imágenes Docker** (privado o público).

| Parámetro                                      | Descripción                                                                                                                                             | Valor predeterminado        |
|------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------|
| `replicaCount`                                  | Número de réplicas del backend (por ejemplo, 1 instancia de pod).                                                                                      | `1`                         |
| `image.repository`                              | Repositorio Docker donde se encuentra la imagen (por ejemplo, `"myrepo/myapp"`).                                                                       | `""`                        |
| `image.tag`                                     | La etiqueta de la imagen Docker (por ejemplo, `"latest"` o una versión específica como `"v1.0.0"`).                                                     | `""`                        |
| `image.pullSecret`                              | Secreto de Kubernetes para acceder a repositorios privados de Docker.                                                                                  | `""`                        |
| `database.SPRING_DB_HOST`                       | El host (dirección IP o nombre del servicio) de la base de datos a la que se conecta la aplicación.                                                      | `""`                        |
| `database.SPRING_DB_PORT`                       | El puerto en el que la base de datos está disponible.                                                                                                   | `""`                        |
| `database.SPRING_DB_NAME`                       | El nombre de la base de datos a la que la aplicación se conectará.                                                                                      | `""`                        |
| `database.SPRING_DB_USER`                       | El nombre de usuario para conectarse a la base de datos.                                                                                                | `""`                        |
| `database.SPRING_DB_PASSWORD`                   | La contraseña para conectarse a la base de datos.                                                                                                      | `""`                        |
| `autoscaling.enabled`                           | Habilita el escalado automático de los pods basado en el uso de CPU. (true/false)                                                                       | `true`                      |
| `autoscaling.minReplicas`                       | Número mínimo de réplicas para la aplicación cuando la carga es baja.                                                                                  | `1`                         |
| `autoscaling.maxReplicas`                       | Número máximo de réplicas para la aplicación cuando la carga es alta.                                                                                  | `10`                        |
| `autoscaling.targetCPUUtilizationPercentage`    | Porcentaje de utilización de CPU que desencadenará el escalado automático (por ejemplo, escalar si el uso de CPU supera el 60%).                         | `60`                        |
| `probes.readinessProbe.httpGet.path`            | El endpoint HTTP que Kubernetes consulta para verificar la salud de la aplicación (por ejemplo, `/healthz`).                                            | `/healthz`                  |
| `probes.readinessProbe.httpGet.port`            | El puerto en el que el endpoint de salud está disponible (por ejemplo, `8080`).                                                                         | `8080`                      |
| `probes.readinessProbe.initialDelaySeconds`     | Tiempo en segundos que Kubernetes esperará antes de hacer la primera comprobación de salud.                                                             | `10`                        |
| `probes.readinessProbe.periodSeconds`           | Intervalo en segundos entre cada comprobación de salud posterior.                                                                                      | `5`                         |
| `probes.readinessProbe.timeoutSeconds`          | Tiempo máximo que Kubernetes esperará para recibir una respuesta de la comprobación de salud.                                                           | `2`                         |
| `probes.readinessProbe.failureThreshold`        | Número de fallos consecutivos permitidos antes de marcar el pod como no saludable.                                                                     | `3`                         |



## Instalación
Agrega el repositorio donde se encuentra el chart:

```bash
helm repo add mi-repo https://charts.example.com
```
Instala el chart con un nombre de release (por ejemplo, springboot-backend):

```bash
helm install springboot-backend mi-repo/springboot-chart
```

Para personalizar los valores, crea un archivo values.yaml personalizado y úsalo durante la instalación:

```bash
helm install springboot-backend mi-repo/springboot-chart -f values.yaml
```

Luego, instala o actualiza el chart con los valores personalizados:

```bash
helm install springboot-backend mi-repo/springboot-chart -f values.yaml
```

## Actualización

Para actualizar el chart con nuevos valores o una nueva versión, usa el siguiente comando:

```bash
helm upgrade springboot-backend mi-repo/springboot-chart -f values.yaml
```

## Desinstalación
Para eliminar el release y todos los recursos asociados (Deployment, Service, HPA y ConfigMap), usa:

```bash
helm uninstall springboot-backend
```