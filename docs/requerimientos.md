# Análisis de requerimientos

El análisis de requerimientos de Alquify tiene como objetivo establecer las funcionalidades que deberá proporcionar el sistema y las condiciones generales que deberá cumplir durante su desarrollo.

Los requerimientos fueron definidos a partir del alcance establecido para el proyecto, los módulos funcionales y las reglas de negocio del sistema.

# Requerimientos funcionales

## RF01 — Registro de usuarios

El sistema deberá permitir el registro de nuevos usuarios mediante sus datos personales y credenciales de acceso.

## RF02 — Autenticación de usuarios

El sistema deberá permitir que los usuarios registrados inicien y cierren sesión.

Cada usuario deberá acceder únicamente a la información correspondiente a su cuenta.

## RF03 — Gestión de propiedades

El sistema deberá permitir al usuario:

- Registrar propiedades.
- Consultar sus propiedades.
- Modificar sus propiedades.
- Desactivar propiedades.

Cada propiedad deberá pertenecer a un único usuario.

## RF04 — Imagen de propiedad

El sistema deberá permitir asociar una imagen representativa a cada propiedad para facilitar su identificación visual dentro de la aplicación.

## RF05 — Gestión de clientes

El sistema deberá permitir:

- Registrar clientes.
- Consultar clientes.
- Modificar clientes.
- Desactivar clientes.

Los clientes podrán ser de tipo `PARTICULAR` o `EMPRESA`.

Cada usuario administrará su propia cartera de clientes.

## RF06 — Gestión de huéspedes

El sistema deberá permitir:

- Registrar huéspedes.
- Consultar huéspedes.
- Modificar huéspedes.
- Asociar huéspedes a reservas.

Cada usuario administrará su propio registro de huéspedes.

## RF07 — Creación de reservas

El sistema deberá permitir crear una reserva asociando:

- Una propiedad.
- Un cliente responsable.
- Uno o varios huéspedes.
- Fecha y hora de entrada.
- Fecha y hora de salida.
- Cantidad de huéspedes.
- Importe total.
- Estado de la reserva.

## RF08 — Gestión de reservas

El sistema deberá permitir:

- Consultar reservas.
- Modificar reservas.
- Cancelar reservas.
- Consultar el historial de reservas.

Los estados contemplados para una reserva serán:

- `PENDIENTE`
- `CONFIRMADA`
- `CANCELADA`
- `FINALIZADA`

## RF09 — Consulta de disponibilidad

El sistema deberá permitir consultar la disponibilidad de las propiedades teniendo en cuenta la fecha y hora de entrada y salida de las reservas existentes.

## RF10 — Prevención de reservas superpuestas

El sistema deberá impedir la creación o modificación de reservas en estado `PENDIENTE` o `CONFIRMADA` cuyos períodos se superpongan con otra reserva de la misma propiedad.

Las reservas en estado `CANCELADA` no deberán bloquear la disponibilidad.

## RF11 — Control de capacidad

El sistema deberá validar que la cantidad de huéspedes indicada en una reserva no supere la capacidad máxima definida para la propiedad seleccionada.

## RF12 — Asociación de huéspedes

El sistema deberá permitir asociar varios huéspedes a una misma reserva.

Un huésped podrá participar en diferentes reservas a lo largo del tiempo.

El mismo huésped no podrá ser asociado más de una vez a una misma reserva.

## RF13 — Registro de pagos

El sistema deberá permitir registrar pagos asociados a una reserva.

Cada pago deberá almacenar la información necesaria para conocer:

- Monto.
- Fecha de pago.
- Método de pago.
- Concepto.
- Observaciones, cuando corresponda.

## RF14 — Consulta de pagos y saldo

El sistema deberá permitir consultar los pagos registrados para una reserva.

El total abonado deberá obtenerse mediante la suma de los pagos registrados.

El saldo pendiente deberá calcularse como la diferencia entre el importe total de la reserva y el total abonado.

## RF15 — Próximas entradas y salidas

El sistema deberá permitir consultar las próximas entradas y salidas correspondientes a las reservas registradas.

## RF16 — Panel administrativo

El sistema deberá disponer de un panel administrativo que presente de forma resumida información relevante, incluyendo:

- Próximas entradas.
- Próximas salidas.
- Estado de las reservas.
- Ocupación de las propiedades.
- Disponibilidad de las propiedades.

# Requerimientos no funcionales

## RNF01 — Aplicación web

Alquify deberá desarrollarse como una aplicación web accesible mediante un navegador.

## RNF02 — Separación entre frontend y backend

La aplicación deberá mantener separadas las responsabilidades de presentación y lógica del sistema.

El frontend será desarrollado utilizando React y TypeScript, mientras que el backend será desarrollado utilizando Java y Spring Boot.

## RNF03 — Comunicación mediante API REST

La comunicación entre el frontend y el backend deberá realizarse mediante una API REST utilizando HTTP y JSON.

## RNF04 — Persistencia de datos

La información del sistema deberá almacenarse en una base de datos relacional MySQL.

El acceso a los datos desde el backend se realizará mediante Spring Data JPA y Hibernate.

## RNF05 — Seguridad de contraseñas

Las contraseñas de los usuarios no deberán almacenarse como texto plano.

El sistema deberá almacenar únicamente una representación segura de la contraseña.

## RNF06 — Aislamiento de información entre usuarios

El sistema deberá garantizar que un usuario no pueda consultar o utilizar propiedades, clientes o huéspedes pertenecientes a otra cuenta.

Las validaciones correspondientes deberán realizarse desde el backend.

## RNF07 — Integridad de la información

El sistema deberá aplicar las validaciones necesarias para mantener la consistencia de los datos y cumplir las reglas de negocio definidas para reservas, huéspedes, propiedades y pagos.

# Alcance inicial

La primera versión de Alquify no contemplará:

- Diferentes roles o niveles de permisos entre usuarios.
- Procesamiento de pagos dentro de la aplicación.
- Integración con pasarelas de pago.
- Una plataforma pública de publicación y búsqueda de alojamientos.

Alquify estará orientado a propietarios o administradores que necesiten centralizar la gestión de sus alquileres temporarios.
