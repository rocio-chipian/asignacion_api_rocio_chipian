

## **Resolución de la asignación planteada "Asignación Backend - Wisboo"**

**Parte 1: Práctica**  

*Versiones usadas:*  
-Ruby version: 3.2.0  
-Rails version: 7.0.a.1

*Para levantar la API en el puerto 3000:*  
-`rails db:migrate` (para popular la base con algunos Product de ejemplo)  
-`rails s`

*Para correr los tests:*  
-`rspec`

*Para consultar la API:*  
-POST /products?page=1&size=1&query&currency  
-query de ejemplo: POST /http://localhost:3000/products/?size=10&page=1&query=curs&currency=USD

**Parte 2: Teórica**

Con los cambios en los requerimientos introducidos se hace necesario el modelado de una entidad “Currency”. Este dato ya no será texto plano estático, sino que cada Product y cada Purchase tendrá una instancia de la moneda que corresponda, y será esta la que se encargue de calcular el precio a ser pagado en el checkout, que se persistirá en campo de total_amout de Purchase. Para hacer el cálculo, Currency consultará a la entidad ExchangeRate, que se encargará de tener los valores actualizados de las tasas de cambio haciendo consultas periódicamente a la API que provee esta información.

*Cambios en el MER*

![asignacion_api_MER_rocio_chipian](https://user-images.githubusercontent.com/27779992/213525826-ea303f38-9f8a-4db4-9e77-8088de148249.png)


*Cambios en la API*

El endpoint GET /products/:id, además de enviar la Currency del producto, deberá enviar el valor del producto en el resto de las Currency, para que al momento de pagar, el usuario pueda elegir entre las diferentes Currencies (este endpoint será consultado al momento de realizar el pago, el cual tendrá una ventana de tiempo finita de X minutos, similar a cuando se realiza la compra de asientos para un evento).

En la ruta POST /payments, ahora deberá indicarse también la Currency elegida para realizar el pago (además del ID del producto y la cantidad comprada).
