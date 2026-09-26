# Reglas de negocio

Para garantizar la consistencia de la información y el correcto funcionamiento del sistema, Alquify contemplará las siguientes reglas de negocio.

## RN01 — Disponibilidad y superposición de reservas

Una propiedad no podrá tener reservas en estado `PENDIENTE` o `CONFIRMADA` cuyos períodos se superpongan.

Para determinar la disponibilidad se tendrán en cuenta tanto la fecha como la hora de entrada y salida.

Las reservas en estado `CANCELADA` no bloquearán la disponibilidad.

## RN02 — Fechas y horarios de la reserva

La fecha y hora de salida deberá ser posterior a la fecha y hora de entrada.

Esto permitirá que una propiedad pueda tener una nueva reserva el mismo día en que finaliza otra, siempre que los horarios no se superpongan.

## RN03 — Capacidad de la propiedad

La cantidad de huéspedes indicada en una reserva deberá ser mayor a cero y no podrá superar la capacidad máxima definida para la propiedad seleccionada.

## RN04 — Pertenencia de la información al usuario

Cada usuario administrará sus propias propiedades, clientes y huéspedes.

El backend deberá validar que los datos utilizados en una reserva correspondan al usuario autenticado, evitando el acceso o utilización de información perteneciente a otras cuentas.

## RN05 — Registro de pagos

Cada pago deberá estar asociado a una única reserva y su monto deberá ser mayor a cero.

El total abonado se obtendrá a partir de la suma de los pagos registrados.

El saldo pendiente se calculará como la diferencia entre el importe total de la reserva y el total abonado.

De esta manera, estos valores podrán obtenerse a partir de la información existente sin almacenar datos redundantes.

## RN06 — Clientes particulares y empresas

Los datos requeridos dependerán del tipo de cliente.

Para los clientes de tipo `PARTICULAR` se utilizarán los datos personales correspondientes.

Para los clientes de tipo `EMPRESA` se utilizarán principalmente la razón social y el CUIT.

## RN07 — Asociación de huéspedes

Una reserva podrá tener varios huéspedes asociados y un huésped podrá participar en diferentes reservas.

Un mismo huésped no podrá ser asociado más de una vez a la misma reserva.
