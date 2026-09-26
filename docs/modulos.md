# Módulos del sistema

Alquify estará organizado en módulos funcionales que agrupan las principales responsabilidades del sistema.

Esta división busca mantener una estructura clara y acorde al alcance definido para el proyecto.

## 1. Autenticación y usuarios

Este módulo será responsable del acceso de los usuarios al sistema.

### Funcionalidades

- Registro de usuarios.
- Inicio de sesión.
- Cierre de sesión.
- Control de acceso a la información correspondiente al usuario autenticado.

Todos los usuarios de Alquify dispondrán de las mismas funcionalidades, por lo que inicialmente no se implementarán diferentes roles o niveles de permisos.

---

## 2. Gestión de propiedades

Este módulo permitirá administrar las propiedades pertenecientes al usuario.

### Funcionalidades

- Alta de propiedades.
- Consulta de propiedades.
- Modificación de propiedades.
- Desactivación de propiedades.
- Visualización de una imagen representativa de cada propiedad.

Cada propiedad estará asociada al usuario que la administra.

---

## 3. Gestión de clientes

Este módulo permitirá administrar los clientes asociados al usuario.

### Funcionalidades

- Registro de clientes.
- Consulta de clientes.
- Modificación de clientes.
- Desactivación de clientes.
- Gestión de clientes de tipo `PARTICULAR`.
- Gestión de clientes de tipo `EMPRESA`.

Cada usuario mantendrá su propia cartera de clientes.

---

## 4. Gestión de huéspedes

Este módulo permitirá administrar las personas que efectivamente se alojan en las propiedades.

### Funcionalidades

- Registro de huéspedes.
- Consulta de huéspedes.
- Modificación de huéspedes.
- Asociación de huéspedes con las reservas en las que participan.

Un huésped podrá participar en diferentes reservas a lo largo del tiempo.

---

## 5. Gestión de reservas

Este módulo constituye una de las funcionalidades principales de Alquify y permitirá administrar las reservas realizadas sobre las propiedades.

### Funcionalidades

- Creación de reservas.
- Consulta de reservas.
- Modificación de reservas.
- Cancelación de reservas.
- Asociación de una reserva con una propiedad.
- Asociación de una reserva con un cliente.
- Asociación de huéspedes a una reserva.
- Consulta de disponibilidad.
- Control de la capacidad de la propiedad.
- Prevención de reservas superpuestas.
- Gestión de los estados de una reserva.

Los estados contemplados serán:

- `PENDIENTE`
- `CONFIRMADA`
- `CANCELADA`
- `FINALIZADA`

Las reservas en estado `PENDIENTE` o `CONFIRMADA` bloquearán el período comprendido entre su fecha y hora de entrada y su fecha y hora de salida.

Las reservas en estado `CANCELADA` no afectarán la disponibilidad.

---

## 6. Gestión de pagos

Este módulo permitirá registrar y consultar los pagos correspondientes a las reservas.

### Funcionalidades

- Registro de pagos.
- Consulta de pagos asociados a una reserva.
- Consulta del total abonado.
- Determinación del saldo pendiente de una reserva.

Alquify tendrá como finalidad registrar pagos realizados por medios externos.

El sistema no procesará transacciones ni se integrará inicialmente con pasarelas de pago.

---

## 7. Panel administrativo

Este módulo permitirá visualizar de forma resumida información relevante para la administración de los alquileres.

### Funcionalidades

- Consulta de próximas entradas.
- Consulta de próximas salidas.
- Visualización del estado de las reservas.
- Visualización de la ocupación de las propiedades.
- Consulta de disponibilidad.
- Visualización de información general del sistema.

La información presentada por este módulo será obtenida a partir de los datos existentes en los demás módulos y no requerirá entidades independientes.

---

# Consideraciones de alcance

Cada usuario administrará de forma independiente sus propiedades, clientes y huéspedes.

El backend será responsable de validar que la información utilizada en las operaciones corresponda al usuario autenticado.

Las funcionalidades de disponibilidad, ocupación, historial, próximas entradas y próximas salidas serán obtenidas a partir de la información existente en el sistema.

Estas funcionalidades no requerirán módulos o entidades adicionales.

La primera versión de Alquify no contemplará:

- Diferentes roles o niveles de permisos.
- Procesamiento de pagos dentro de la aplicación.
- Integración con pasarelas de pago.
