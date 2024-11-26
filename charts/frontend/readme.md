# Descripción

Este Helm chart despliega una aplicación web desarrollada en **Vue.js** en un clúster de **Kubernetes**. Incluye:

- Un **Deployment** con configuración de réplicas personalizable.  
- Un **Service** de tipo `LoadBalancer` para exponer la aplicación.  
- Un **Horizontal Pod Autoscaler (HPA)** configurado para escalar entre 2 y 10 réplicas según la utilización de CPU.  

## Requisitos previos

1. **Kubernetes** `1.20` o superior.  
2. **Helm** `3.5` o superior instalado.  
3. Acceso a un clúster de **Kubernetes** con permisos para crear **Deployments**, **Services** y **HPAs**.  
4. Una configuración de **Ingress** o **DNS** si se desea acceder por nombre de dominio.  


# Instalación

Agrega el repositorio donde se encuentra el chart:

```bash
helm repo add mi-repo https://charts.example.com
```

Instala el chart con un nombre de release (vue-app):

```bash
helm install vue-app mi-repo/vue-chart
```

Si deseas personalizar los valores, crea un archivo values.yaml personalizado y úsalo durante la instalación:

```bash
helm install vue-app mi-repo/vue-chart -f values.yaml
```

## Configuración de Valores

La siguiente tabla describe los valores configurables en el archivo `values.yaml` y sus valores predeterminados:

| Parámetro                             | Descripción                                                                                           | Valor predeterminado      |
|---------------------------------------|-------------------------------------------------------------------------------------------------------|---------------------------|
| `replicaCount`                        | Número de pods que se desplegarán para la aplicación.                                                 | `1`                       |
| `image.repository`                    | Repositorio Docker para la imagen del backend (por ejemplo, `myrepo/myapp`).                         | `""`                      |
| `image.tag`                           | Etiqueta de la imagen Docker (por ejemplo, `latest`, `v1.0.0`).                                       | `""`                      |
| `image.pullSecret`                    | Secreto de Kubernetes para obtener imágenes de un repositorio privado.                               | `""`                      |
| `acr.dockerconfigjson`                | Secreto de Kubernetes con credenciales de Azure Container Registry (ACR).                            | `""`                      |
| `autoscaling.enabled`                 | Habilita o deshabilita el escalado automático de los pods.                                            | `true`                    |
| `autoscaling.minReplicas`             | Número mínimo de réplicas cuando el tráfico es bajo.                                                  | `2`                       |
| `autoscaling.maxReplicas`             | Número máximo de réplicas cuando el tráfico es alto.                                                  | `10`                      |
| `autoscaling.targetCPUUtilizationPercentage` | Porcentaje de uso de CPU que activa el escalado automático.                                           | `60`                      |
| `probes.readinessProbe.httpGet.path`  | Ruta HTTP que Kubernetes consultará para verificar si la aplicación está lista.                      | `/healthz`                |
| `probes.readinessProbe.httpGet.port`  | Puerto donde está disponible el endpoint de salud.                                                   | `80`                      |
| `probes.readinessProbe.initialDelaySeconds` | Tiempo de espera antes de realizar la primera comprobación de salud (en segundos).                  | `10`                      |
| `probes.readinessProbe.periodSeconds` | Intervalo entre comprobaciones de salud subsecuentes (en segundos).                                  | `5`                       |
| `probes.readinessProbe.timeoutSeconds` | Tiempo máximo para esperar la respuesta de la comprobación de salud (en segundos).                  | `2`                       |
| `probes.readinessProbe.failureThreshold` | Número de comprobaciones fallidas consecutivas antes de marcar el contenedor como no saludable.     | `3`                       |



## Instalación o Actualización del Chart

### Instalación

Luego, instala el chart con un archivo de valores personalizado:

```bash
helm install vue-app mi-repo/vue-chart -f values.yaml
```

Actualización
Para actualizar el chart a una nueva versión o cambiar valores configurados:

```bash
helm upgrade vue-app mi-repo/vue-chart -f values.yaml
```
Desinstalación
Para eliminar el release y todos los recursos asociados:

```bash
helm uninstall vue-app
```

Esto eliminará el Deployment, el Service y el HPA relacionados con la aplicación.

## Notas de Implementación

Después de instalar el chart, puedes acceder a la aplicación usando la IP asignada por el **Service** de tipo `LoadBalancer`:

1. Obtén la IP del Service:

```bash
kubectl get svc vue-app
```
2. Abre un navegador y accede a: http://<IP-del-Service>:<puerto>