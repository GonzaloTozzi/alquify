# Justificación de identificadores

Durante el diseño del modelo de datos de Alquify se decidió utilizar identificadores internos para las principales entidades del sistema.

Estos identificadores funcionan como **claves primarias sustitutas**. Su objetivo es proporcionar una referencia única, estable e independiente de los datos propios de cada entidad.

La utilización de estos identificadores no implica que otros atributos no puedan poseer restricciones de unicidad. Por ejemplo, el correo electrónico de un usuario será único, pero no será utilizado como su clave primaria.

## Usuario — `id_usuario`

`id_usuario` identifica de manera única una cuenta registrada en Alquify.

Si bien el correo electrónico será único dentro del sistema y permitirá identificar la cuenta durante el inicio de sesión, se decidió no utilizarlo como clave primaria debido a que constituye un dato que podría modificarse.

El identificador interno permite mantener una referencia estable al usuario independientemente de cambios en sus datos personales.

## Propiedad — `id_propiedad`

`id_propiedad` identifica de manera única una propiedad registrada en Alquify.

Los atributos propios de una propiedad, como su nombre o dirección, no resultan adecuados como clave primaria, ya que pueden modificarse y no necesariamente garantizan unicidad.

Por este motivo se utiliza un identificador interno que permita referenciar de forma estable cada propiedad.

## Cliente — `id_cliente`

`id_cliente` identifica de manera única un registro de cliente dentro del sistema.

Alquify contempla dos tipos de clientes: `PARTICULAR` y `EMPRESA`. Dependiendo del tipo de cliente, los datos identificatorios disponibles son diferentes: un particular puede poseer un documento, mientras que una empresa puede identificarse mediante CUIT.

Debido a esta diferencia y a que dichos datos forman parte de la información propia del cliente, se decidió utilizar un identificador interno común para ambos tipos.

## Huésped — `id_huesped`

`id_huesped` identifica de manera única un huésped registrado por un usuario.

Se evaluó la posibilidad de utilizar el documento del huésped como clave primaria. Sin embargo, se decidió mantener un identificador interno para no hacer depender la identidad del registro de un dato documental y para conservar un criterio uniforme de referencia dentro del sistema.

Además, cada usuario de Alquify mantiene su propio registro de huéspedes, por lo que `id_huesped` representa el registro interno del huésped dentro de la aplicación.

## Reserva — `id_reserva`

`id_reserva` identifica de manera única una operación de reserva.

No se encontró un atributo natural que permita identificar una reserva de manera única y estable. Datos como la propiedad, el cliente o las fechas pueden modificarse durante la gestión de una reserva.

Por este motivo se utiliza un identificador interno que permita mantener una referencia permanente a la reserva independientemente de los cambios que puedan producirse en sus demás atributos.

## Pago — `id_pago`

`id_pago` identifica de manera única cada pago registrado para una reserva.

Una misma reserva puede poseer varios pagos y atributos como la fecha, el monto, el método o el concepto no garantizan individualmente una identificación única y estable.

Por este motivo se utiliza un identificador interno para distinguir cada registro de pago.

## Reserva-Huésped

La tabla asociativa `reserva_huesped` constituye una excepción al uso de identificadores artificiales.

No se incorpora un campo `id_reserva_huesped`, ya que cada registro queda identificado naturalmente mediante la combinación:

`(id_reserva, id_huesped)`

Ambos atributos conforman una **clave primaria compuesta** y, al mismo tiempo, son claves foráneas que referencian a `reserva` y `huesped`.

Esta combinación representa la asociación de un huésped determinado con una reserva determinada y evita que el mismo huésped sea asociado más de una vez a la misma reserva.

## Criterio adoptado

Los identificadores utilizados en Alquify no representan información propia del negocio, sino referencias internas generadas por el sistema.

Se optó por claves sustitutas en aquellas entidades cuyos atributos naturales pueden modificarse, no garantizan unicidad o presentan diferentes formas de identificación.

En cambio, cuando existe una combinación de atributos que identifica naturalmente una relación, como ocurre en `reserva_huesped`, se utiliza una clave primaria compuesta y no se agrega un identificador artificial adicional.
