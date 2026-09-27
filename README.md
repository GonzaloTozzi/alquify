# Alquify

## Sistema de Gestión de Alquileres Temporarios

### Trabajo Final Integrador

**Proyecto:** Alquify — Sistema de Gestión de Alquileres Temporarios  
**Integrantes:** Vallejos Emiliano V. - Tozzi Gonzalo  
**Carrera:** Tecnicatura Universitaria en Programación a Distancia  
**Tutor:** Bruselario Sebastián  

---

## 1. Descripción del proyecto

Alquify será una aplicación web destinada a facilitar y centralizar la administración de propiedades destinadas a alquileres temporarios.

El sistema estará orientado a propietarios o administradores que necesiten gestionar desde un único lugar sus propiedades, clientes, huéspedes, reservas, disponibilidad y pagos.

El objetivo del proyecto no es desarrollar una plataforma pública de intermediación de alojamientos similar a Airbnb o Booking, sino una herramienta de gestión administrativa para los alquileres administrados por cada usuario.

---

## 2. Problemática

La administración de alquileres temporarios puede involucrar el manejo simultáneo de diferentes propiedades, clientes, empresas, huéspedes, períodos de ocupación y pagos.

Cuando esta información se administra mediante diferentes herramientas, como planillas de cálculo, calendarios, mensajes de WhatsApp o anotaciones manuales, pueden surgir dificultades para mantener la información organizada y actualizada.

Entre los principales problemas identificados se encuentran:

- Dificultad para conocer rápidamente la disponibilidad de cada propiedad.
- Seguimiento de las reservas.
- Posibilidad de generar reservas superpuestas.
- Control de los huéspedes alojados.
- Seguimiento de los pagos realizados y pendientes.
- Consulta de próximas entradas y salidas.
- Información distribuida entre diferentes herramientas.

A partir de esta problemática se propone desarrollar Alquify como un sistema web que permita centralizar la información y simplificar la gestión de alquileres temporarios.

---

## 3. Objetivo general

Desarrollar una aplicación web que permita gestionar de manera centralizada propiedades destinadas a alquileres temporarios, facilitando la administración de reservas, disponibilidad, clientes, huéspedes y pagos.

El sistema buscará proporcionar al administrador una herramienta sencilla para conocer el estado de ocupación de sus propiedades y acceder rápidamente a la información relacionada con cada alquiler.

---

## 4. Objetivos específicos

- Centralizar la información de las propiedades administradas.
- Registrar clientes particulares y empresas.
- Registrar los huéspedes asociados a cada estadía.
- Crear y administrar reservas.
- Consultar la disponibilidad de las propiedades según fecha y hora.
- Evitar la superposición de reservas para una misma propiedad.
- Registrar y consultar pagos asociados a los alquileres.
- Consultar próximas entradas y salidas.
- Mantener un historial de reservas realizadas.
- Presentar información general mediante un panel administrativo.

---

## 5. Alcance del proyecto

Alquify estará orientado principalmente a la gestión administrativa de alquileres temporarios.

Cada usuario dispondrá de una cuenta desde la cual podrá administrar su propia información.

El sistema permitirá gestionar:

- Propiedades.
- Clientes.
- Huéspedes.
- Reservas.
- Disponibilidad.
- Pagos.

Cada reserva estará asociada a una propiedad y a un cliente responsable, y podrá incluir uno o varios huéspedes.

La disponibilidad será determinada teniendo en cuenta tanto la fecha como la hora de entrada y salida de las reservas existentes.

También se podrá realizar un seguimiento de los pagos asociados a cada reserva y consultar información general sobre propiedades ocupadas, disponibles y próximas reservas.

La primera versión de Alquify no contemplará:

- Diferentes roles o niveles de permisos.
- Procesamiento de pagos dentro de la aplicación.
- Integración con pasarelas de pago.
- Una plataforma pública para publicación o búsqueda de alojamientos.

---

## 6. Módulos principales

Alquify estará organizado inicialmente en los siguientes módulos:

1. Autenticación y usuarios.
2. Gestión de propiedades.
3. Gestión de clientes.
4. Gestión de huéspedes.
5. Gestión de reservas.
6. Gestión de pagos.
7. Panel administrativo.

La descripción detallada de cada módulo se encuentra disponible en:

[Documentación de módulos](docs/modulos.md)

---

## 7. Tecnologías propuestas

### Frontend

**React + TypeScript**

React será utilizado para desarrollar la interfaz web mediante componentes reutilizables.

TypeScript permitirá incorporar tipado estático y mejorar la organización y mantenibilidad del código.

### Backend

**Java + Spring Boot**

El backend será desarrollado utilizando Java y Spring Boot.

Será responsable de exponer una API REST, procesar las solicitudes del frontend, aplicar las reglas de negocio y gestionar el acceso a la información.

### Persistencia

**Spring Data JPA + Hibernate**

Spring Data JPA y Hibernate serán utilizados para gestionar la comunicación entre el backend y la base de datos relacional.

### Base de datos

**MySQL**

Se utilizará MySQL como sistema de gestión de base de datos relacional.

La elección responde a la existencia de relaciones claramente definidas entre usuarios, propiedades, clientes, huéspedes, reservas y pagos.

### Control de versiones

**Git + GitHub**

Git será utilizado para el control de versiones y GitHub como repositorio remoto y herramienta de colaboración.

La documentación del proyecto se mantendrá principalmente mediante archivos de texto versionables dentro del mismo repositorio.

---

## 8. Arquitectura general

Alquify utilizará una arquitectura web basada en la separación entre frontend, backend y base de datos.

```text
React + TypeScript
       │
       │ HTTP / JSON
       ▼
Java + Spring Boot
       │
       ▼
Spring Data JPA / Hibernate
       │
       ▼
      MySQL
```

El frontend será responsable de la presentación y de la interacción con el usuario.

El backend concentrará la lógica de negocio, las validaciones y el acceso a la información.

La comunicación entre frontend y backend se realizará mediante una API REST utilizando HTTP y JSON.

La arquitectura se encuentra documentada con mayor detalle en:

[Arquitectura del sistema](docs/arquitectura.md)

---

## 9. Despliegue propuesto

Para el despliegue online del sistema se utilizarán servicios independientes para cada componente.

| Componente | Tecnología | Despliegue |
|---|---|---|
| Frontend | React + TypeScript | Vercel |
| Backend | Java + Spring Boot | Render |
| Base de datos | MySQL | Aiven |

Esta distribución permitirá mantener separados los principales componentes de la aplicación.

---

## 10. Diseño de base de datos

Alquify utilizará un modelo de datos relacional.

Las principales entidades identificadas son:

- Usuario.
- Propiedad.
- Cliente.
- Huésped.
- Reserva.
- Pago.

Además, se utilizará una tabla asociativa `reserva_huesped` para implementar la relación muchos a muchos existente entre reservas y huéspedes.

La documentación correspondiente al diseño de la base de datos se encuentra disponible en:

- [Entidades del sistema](docs/entidades.md)
- [Diagrama Entidad-Relación](docs/der.md)
- [Esquema relacional](docs/esquema-relacional.md)
- [Justificación de identificadores](docs/identificadores.md)
- [Reglas de negocio](docs/reglas-negocio.md)

El script correspondiente al esquema propuesto se encuentra disponible en:

- [Script de base de datos](database/schema.sql)

---

## 11. Diseño inicial de interfaces

Como parte de la etapa de diseño se realizaron mockups iniciales de las principales interfaces de Alquify.

Los diseños permiten explorar previamente:

- Identidad visual.
- Navegación general.
- Inicio de sesión.
- Vista semanal de ocupación.
- Gestión de reservas.
- Creación de reservas.
- Gestión de propiedades.
- Gestión de clientes.
- Gestión de huéspedes.
- Registro de pagos.

Los mockups representan una propuesta inicial y podrán ser modificados durante la implementación.

[Diseño inicial de interfaces](docs/interfaces.md)

---

## 12. Documentación

La documentación correspondiente al análisis y diseño de Alquify se encuentra almacenada en el directorio `/docs`.

### Análisis y requerimientos

- [Análisis de requerimientos](docs/requerimientos.md)
- [Reglas de negocio](docs/reglas-negocio.md)

### Base de datos

- [Entidades del sistema](docs/entidades.md)
- [Diagrama Entidad-Relación](docs/der.md)
- [Esquema relacional](docs/esquema-relacional.md)
- [Justificación de identificadores](docs/identificadores.md)

### Diseño del sistema

- [Módulos del sistema](docs/modulos.md)
- [Arquitectura del sistema](docs/arquitectura.md)
- [Diseño inicial de interfaces](docs/interfaces.md)

---

## 13. Estructura del repositorio

El proyecto se mantiene dentro de un único repositorio.

```text
alquify/
│
├── frontend/
│
├── backend/
│
├── database/
│   └── schema.sql
│
├── docs/
│   ├── assets/
│   │   └── mockups/
│   │
│   ├── arquitectura.md
│   ├── der.md
│   ├── entidades.md
│   ├── esquema-relacional.md
│   ├── identificadores.md
│   ├── interfaces.md
│   ├── modulos.md
│   ├── reglas-negocio.md
│   └── requerimientos.md
│
└── README.md
```

Durante la etapa actual, los directorios `/frontend` y `/backend` se mantienen sin implementación, ya que corresponden a etapas posteriores del proyecto.

---

## 14. Plan de trabajo

El desarrollo de Alquify se organiza en diferentes etapas.

### Etapa 1 — Propuesta y planificación

- [x] Definición de la problemática.
- [x] Definición del objetivo del sistema.
- [x] Delimitación del alcance inicial.
- [x] Selección del stack tecnológico.
- [x] Creación del repositorio único de GitHub.

### Etapa 2 — Diseño y arquitectura

- [x] Análisis de requerimientos.
- [x] Identificación de las entidades principales.
- [x] Diseño del esquema de base de datos.
- [x] Definición de módulos.
- [x] Diseño inicial de las interfaces.
- [x] Definición de la arquitectura del sistema.

### Etapa 3 — Desarrollo

- [ ] Configuración del frontend y backend.
- [ ] Implementación de la base de datos.
- [ ] Desarrollo de la API REST.
- [ ] Desarrollo de las funcionalidades principales.
- [ ] Desarrollo de las interfaces.
- [ ] Integración entre frontend y backend.

### Etapa 4 — Pruebas e integración

- [ ] Pruebas de las funcionalidades desarrolladas.
- [ ] Validación de reglas de negocio.
- [ ] Pruebas de disponibilidad y reservas.
- [ ] Corrección de errores.
- [ ] Ajustes de interfaz y experiencia de usuario.

### Etapa 5 — Despliegue y documentación final

- [ ] Despliegue del sistema.
- [ ] Preparación de la documentación técnica final.
- [ ] Actualización final del README.
- [ ] Elaboración del informe final.
- [ ] Preparación del video demostrativo.
- [ ] Preparación para la defensa del proyecto.

---

## 15. Estado actual del proyecto

El proyecto se encuentra actualmente en la etapa de **diseño y arquitectura**.

En esta etapa se realizó:

- El análisis de requerimientos.
- La identificación y definición de entidades.
- El diseño del modelo de datos.
- La definición de relaciones y cardinalidades.
- La definición de reglas de negocio.
- La justificación de los identificadores utilizados.
- El diseño del esquema relacional.
- La definición de módulos.
- La definición de la arquitectura.
- El diseño inicial de interfaces.
- La preparación del script correspondiente al esquema de base de datos.

En esta etapa no se ha iniciado todavía la implementación del frontend ni del backend.

---

## 16. Repositorio

El proyecto se encuentra centralizado en GitHub:

https://github.com/GonzaloTozzi/alquify

---

## 17. Resultado esperado

Como resultado final se espera obtener una aplicación web funcional que permita administrar alquileres temporarios de manera centralizada.

El sistema deberá permitir gestionar propiedades y su disponibilidad, registrar reservas, clientes, huéspedes y pagos, evitando inconsistencias como la superposición de reservas.

Además, el proyecto contará con su código fuente y documentación centralizados en GitHub y con los componentes requeridos desplegados online, permitiendo demostrar el funcionamiento completo de la solución.
