## Para la comprobacion del backup procedemos a crearnos un usuario

![image](https://github.com/user-attachments/assets/e62d0cb1-c5e4-4831-8285-81e611ef43bc)

## Podemos meternos en el maquina virutal de la base de datos mediante el uso de ssh para ver su contenido 

![image](https://github.com/user-attachments/assets/da38f9cf-6aaf-49cd-8b71-e8fe50f779e3)

## Podemos comprobar como el cron job ha realizado la copia de seguridad.

![image](https://github.com/user-attachments/assets/2b2d1b0b-107e-4884-8965-0a9819cdbea8)

```bash
az storage blob list --account-name account_name --container-name contanier_name --output table
```

![image](https://github.com/user-attachments/assets/d777e6f4-bd9f-4f10-903f-91247e62e253)

## Ahora para hacer una prueba procedemos a modificar la base de datos, probamos borrando por ejemplo la tabla errors.

![image](https://github.com/user-attachments/assets/fa987ef4-d600-4ed6-b854-65693bb79100)

## En este paso vamos a lanzar el workflow de disaster recovery, recupera la ultima copia de la base de datos que almancenamos cifrada en azure, y la inyecta en la base de datos de la máquina virtual.

![image](https://github.com/user-attachments/assets/247c134d-fcaf-418c-9489-f2d0d86cf5f8)

## Podemos ver como vuelve a estar la tabla errors que habiamos borrado.

![image](https://github.com/user-attachments/assets/0135b048-9615-4fd4-9161-451ca7c295a5)

## Podemos comprobar como nuestro usuario que creamos vuelve a estar disponible.

![image](https://github.com/user-attachments/assets/e7de1ace-17cc-4326-aec2-10ff1a559b44)


