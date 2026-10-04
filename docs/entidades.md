# Entidades del sistema

El modelo de datos de Alquify está compuesto por las entidades necesarias para representar los usuarios del sistema, las propiedades administradas, los clientes, las reservas, los huéspedes y los pagos asociados.

## Usuario

Representa a la persona que posee una cuenta en Alquify, inicia sesión y administra sus propiedades e información.

| Atributo | Descripción |
|---|---|
| `id_usuario` | Identificador único del usuario y clave primaria de la entidad. |
| `nombre` | Identifica a la persona que utiliza el sistema. |
| `apellido` | Completa la identificación del usuario. |
| `email` | Identifica la cuenta y puede utilizarse para iniciar sesión. |
| `password_hash` | Permite autenticar al usuario. Se almacenará de forma segura, nunca como texto plano. |
| `fecha_creacion` | Permite conocer cuándo fue creada la cuenta. |
| `activo` | Permite deshabilitar una cuenta sin eliminarla y perder información relacionada. |

## Propiedad

Representa un inmueble gestionado por un usuario.

| Atributo | Descripción |
|---|---|
| `id_propiedad` | Identificador único de cada propiedad y clave primaria de la entidad. |
| `id_usuario` | Referencia al usuario que administra la propiedad. |
| `nombre` | Permite identificar fácilmente la propiedad dentro de Alquify. |
| `direccion` | Indica la ubicación física de la propiedad. |
| `ciudad` | Permite identificar en qué localidad se encuentra la propiedad. |
| `capacidad` | Indica la cantidad máxima de huéspedes que puede alojar. |
| `descripcion` | Permite guardar información general u observaciones relevantes sobre la propiedad. |
| `imagen_url` | Guarda la referencia a una imagen representativa de la propiedad para facilitar su identificación visual en la interfaz. |
| `activa` | Permite deshabilitar una propiedad sin eliminarla y conservar su historial de reservas e información relacionada. |

## Cliente

Representa a la persona particular o empresa responsable de una reserva.

| Atributo | Descripción |
|---|---|
| `documento_cuit` | Identificador del cliente y clave primaria. Para clientes particulares corresponde a su documento y para empresas a su CUIT. |
| `id_usuario` | Referencia al usuario de Alquify que registró al cliente. |
| `tipo_cliente` | Permite distinguir si el cliente es `PARTICULAR` o `EMPRESA`. |
| `nombre` | Nombre del cliente cuando se trata de una persona particular. |
| `apellido` | Apellido del cliente cuando se trata de una persona particular. |
| `razon_social` | Nombre legal o comercial cuando el cliente es una empresa. |
| `telefono` | Guarda un medio de contacto del cliente. |
| `email` | Guarda el correo electrónico de contacto del cliente. |
| `activo` | Permite dejar de utilizar un cliente sin eliminar su historial de reservas. |

## Huésped

Representa a una persona que efectivamente se aloja en una propiedad.

| Atributo | Descripción |
|---|---|
| `documento` | Documento identificatorio del huésped y clave primaria de la entidad. |
| `id_usuario` | Referencia al usuario de Alquify que registró al huésped. |
| `nombre` | Permite identificar a la persona alojada. |
| `apellido` | Completa la identificación del huésped. |
| `telefono` | Medio de contacto con el huésped. |
| `email` | Correo electrónico de contacto, si corresponde. |
| `observaciones` | Permite registrar comentarios o información adicional relevante sobre el huésped. |

## Reserva

Representa la reserva de una propiedad durante un período determinado.

| Atributo | Descripción |
|---|---|
| `id_reserva` | Identificador único de cada reserva y clave primaria de la entidad. |
| `id_propiedad` | Referencia a la propiedad reservada. |
| `documento_cuit_cliente` | Referencia al cliente responsable de la reserva. |
| `fecha_entrada` | Indica la fecha y hora en que comienza la estadía y permite calcular disponibilidad. |
| `fecha_salida` | Indica la fecha y hora en que termina la estadía. |
| `cantidad_huespedes` | Registra cuántas personas se alojarán y permite controlar la capacidad de la propiedad. |
| `estado` | Indica la situación de la reserva: `PENDIENTE`, `CONFIRMADA`, `CANCELADA` o `FINALIZADA`. |
| `importe_total` | Registra el monto total acordado para la reserva. |
| `fecha_creacion` | Permite conocer cuándo fue registrada la reserva. |
| `observaciones` | Permite guardar información adicional relevante. |

## Reserva-Huésped

Representa la asociación entre las reservas y los huéspedes que participan en ellas.

La relación entre Reserva y Huésped es de muchos a muchos (`N:M`), por lo que en el modelo relacional se resuelve mediante la tabla asociativa `reserva_huesped`.

| Atributo | Descripción |
|---|---|
| `id_reserva` | Referencia a la reserva correspondiente. Forma parte de la clave primaria compuesta. |
| `documento_huesped` | Referencia al documento del huésped. Forma parte de la clave primaria compuesta. |

La combinación de `id_reserva` y `documento_huesped` conforma la clave primaria de la tabla, evitando que un mismo huésped sea asociado más de una vez a una misma reserva.

## Pago

Representa un pago registrado para una reserva.

| Atributo | Descripción |
|---|---|
| `id_reserva` | Referencia a la reserva a la que pertenece el pago. Forma parte de la clave primaria compuesta. |
| `fecha_pago` | Registra la fecha y hora en que se realizó el pago. Forma parte de la clave primaria compuesta. |
| `monto` | Indica cuánto dinero se recibió en ese pago. |
| `metodo_pago` | Indica cómo se realizó el pago, por ejemplo, efectivo, transferencia, tarjeta u otro medio. |
| `concepto` | Permite indicar si corresponde a una seña, saldo u otro concepto. |
| `observaciones` | Permite registrar información adicional relacionada con el pago. |

La combinación de `id_reserva` y `fecha_pago` identifica cada pago registrado dentro de una reserva.

## Relaciones y cardinalidades

Las relaciones definidas entre las entidades principales son:

| Relación | Cardinalidad | Descripción |
|---|---|---|
| Usuario — Propiedad | `1:N` | Un usuario puede administrar varias propiedades, mientras que cada propiedad pertenece a un único usuario. |
| Usuario — Cliente | `1:N` | Un usuario puede registrar múltiples clientes, mientras que cada cliente pertenece a un único usuario. |
| Usuario — Huésped | `1:N` | Un usuario puede registrar múltiples huéspedes, mientras que cada huésped pertenece a un único usuario. |
| Cliente — Reserva | `1:N` | Un cliente puede realizar varias reservas a lo largo del tiempo, mientras que cada reserva tiene un único cliente responsable. |
| Propiedad — Reserva | `1:N` | Una propiedad puede tener múltiples reservas a lo largo del tiempo, mientras que cada reserva corresponde a una única propiedad. |
| Reserva — Huésped | `N:M` | Una reserva puede incluir varios huéspedes y un huésped puede participar en diferentes reservas. |
| Reserva — Pago | `1:N` | Una reserva puede tener cero o varios pagos registrados, mientras que cada pago corresponde a una única reserva. |

## Consideraciones generales

Cada usuario de Alquify administrará su propia información. Las propiedades, clientes y huéspedes registrados estarán asociados al usuario correspondiente y no serán compartidos entre distintas cuentas.

El sistema deberá garantizar que las propiedades, clientes y huéspedes utilizados en una reserva pertenezcan al mismo usuario autenticado. Esta validación será realizada por el backend.

La disponibilidad de una propiedad se determinará a partir de las fechas y horas de entrada y salida de sus reservas. El sistema deberá impedir la existencia de reservas en estado `PENDIENTE` o `CONFIRMADA` cuyos períodos se superpongan para una misma propiedad.

El total abonado y el saldo pendiente de una reserva podrán obtenerse a partir de los pagos registrados, evitando almacenar información redundante en la base de datos.
