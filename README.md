#  Alquify

## Sistema de Gestión de Alquileres Temporarios

### Trabajo Final Integrador — 1.ª Entrega

**Proyecto:** Alquify — Sistema de Gestión de Alquileres Temporarios
**Integrantes:** Vallejos Emiliano V. - Tozzi Gonzalo
**Carrera:** Tecnicatura Universitaria en Programación a Distancia
**Tutor:** Bruselario Sebastián

---

## 1. Nombre del proyecto

### Alquify — Sistema de Gestión de Alquileres Temporarios

Alquify será una aplicación web destinada a facilitar y centralizar la administración de propiedades destinadas a alquileres temporarios.

---

## 2. Descripción del problema

La administración de alquileres temporarios puede involucrar el manejo simultáneo de diferentes propiedades, clientes, empresas, huéspedes, períodos de ocupación y pagos.

Cuando esta información se administra mediante diferentes herramientas, como planillas de cálculo, calendarios, mensajes de WhatsApp o anotaciones manuales, pueden surgir dificultades para mantener la información organizada y actualizada.

Entre los principales problemas se encuentran la dificultad para conocer rápidamente la disponibilidad de cada propiedad, el seguimiento de las reservas, la posibilidad de generar reservas superpuestas, el control de los huéspedes alojados y el seguimiento de los pagos realizados o pendientes.

A partir de esta problemática se propone desarrollar un sistema web que permita centralizar la información y simplificar la gestión de alquileres temporarios.

---

## 3. Objetivo general

Desarrollar una aplicación web que permita gestionar de manera centralizada propiedades destinadas a alquileres temporarios, facilitando la administración de reservas, disponibilidad, clientes, huéspedes y pagos.

El sistema buscará proporcionar al administrador una herramienta sencilla para conocer el estado de ocupación de sus propiedades y acceder rápidamente a la información relacionada con cada alquiler.

---

## 4. Objetivos específicos

* Centralizar la información de las propiedades administradas.
* Registrar clientes particulares y empresas.
* Registrar los huéspedes asociados a cada estadía.
* Crear y administrar reservas.
* Consultar la disponibilidad de las propiedades según determinadas fechas.
* Evitar la superposición de reservas para una misma propiedad.
* Registrar y consultar pagos asociados a los alquileres.
* Consultar próximas entradas y salidas de huéspedes.
* Mantener un historial de reservas realizadas.
* Presentar información general mediante un panel de administración.

---

## 5. Alcance del proyecto

Alquify estará orientado principalmente a la **gestión administrativa de alquileres temporarios**.

El sistema permitirá que un administrador gestione las propiedades disponibles y registre las reservas correspondientes a clientes particulares o empresas.

Cada reserva contará con información relacionada con la propiedad seleccionada, período de ocupación, cliente responsable y huéspedes alojados. El sistema verificará la disponibilidad de la propiedad para evitar reservas superpuestas.

También se podrá realizar un seguimiento de los pagos asociados a cada alquiler y consultar información general sobre las propiedades ocupadas, disponibles y próximas reservas.

Como parte de la interfaz administrativa se buscará incorporar una visualización de la ocupación de las propiedades que permita identificar fácilmente los períodos reservados y disponibles.

El objetivo del proyecto **no es desarrollar una plataforma pública de intermediación de alojamientos similar a Airbnb o Booking**, sino una herramienta de gestión destinada al propietario o administrador de los alquileres.

---

## 6. Tecnologías propuestas

Para el desarrollo del proyecto se propone utilizar una arquitectura web separando el frontend, el backend y la persistencia de datos.

### Frontend

**React + TypeScript**

React permitirá desarrollar una interfaz web dinámica basada en componentes reutilizables. Se utilizará TypeScript para agregar tipado estático al desarrollo y mejorar la organización y mantenibilidad del código.

Estas tecnologías serán utilizadas para desarrollar las diferentes interfaces del sistema, como la administración de propiedades, reservas, clientes, pagos y visualización de disponibilidad.

### Backend

**Java + Spring Boot**

El backend será desarrollado utilizando Java y Spring Boot.

Spring Boot permitirá desarrollar una API REST encargada de gestionar la comunicación entre el frontend y la base de datos, además de implementar las principales reglas de negocio del sistema.

Entre ellas se encontrará la validación de disponibilidad de las propiedades, administración de reservas, gestión de usuarios y procesamiento de la información relacionada con los alquileres.

Se utilizará una arquitectura organizada en diferentes capas con el objetivo de separar responsabilidades y facilitar el mantenimiento del proyecto.

### Persistencia

**Spring Data JPA / Hibernate**

Para la comunicación entre el backend y la base de datos se utilizará Spring Data JPA junto con Hibernate.

Esto permitirá realizar el mapeo entre los objetos utilizados dentro de la aplicación y las tablas almacenadas en la base de datos.

### Base de datos

**MySQL**

Se utilizará una base de datos relacional MySQL debido a que la información administrada por el sistema presenta relaciones claramente definidas entre propiedades, clientes, reservas, huéspedes y pagos.

MySQL permitirá utilizar relaciones entre tablas, claves primarias y foráneas, restricciones, transacciones y consultas para garantizar la integridad de la información.

Además, es una tecnología previamente utilizada por los integrantes del equipo, lo que permitirá reducir los tiempos de aprendizaje y concentrar el trabajo en el desarrollo de las funcionalidades específicas del proyecto.

### Control de versiones

**Git + GitHub**

Se utilizará Git para el control de versiones y GitHub como repositorio remoto y herramienta de colaboración entre los integrantes.

Todo el proyecto será desarrollado dentro de un único repositorio.

---

## 7. Arquitectura general propuesta

La aplicación seguirá inicialmente la siguiente estructura general:

```text
React + TypeScript
       │
       ▼
    API REST
       │
       ▼
Java + Spring Boot
       │
       ▼
Spring Data JPA / Hibernate
       │
       ▼
      MySQL
```

El frontend realizará solicitudes HTTP al backend mediante una API REST.

El backend será responsable de procesar las solicitudes, aplicar las reglas de negocio correspondientes y comunicarse con la base de datos.

La información será intercambiada principalmente utilizando el formato JSON.

---

## 8. Despliegue

Como parte de los requisitos del Trabajo Final Integrador, el proyecto contará con al menos uno de sus componentes principales desplegado en un servicio online.

Se evaluarán diferentes alternativas de alojamiento para:

* Frontend.
* Backend.
* Base de datos.

Las plataformas definitivas serán seleccionadas durante el desarrollo teniendo en cuenta compatibilidad con las tecnologías utilizadas, disponibilidad de planes adecuados para el proyecto y facilidad de implementación.

---

## 9. Plan de trabajo

El desarrollo se organizará en diferentes etapas de acuerdo con los plazos establecidos para el Trabajo Final Integrador.

### Etapa 1 — Propuesta y planificación

* Definición de la problemática.
* Definición del objetivo del sistema.
* Delimitación del alcance inicial.
* Selección del stack tecnológico.
* Creación del repositorio único de GitHub.

### Etapa 2 — Diseño y arquitectura

* Análisis de requerimientos.
* Identificación de las entidades principales.
* Diseño del esquema de base de datos.
* Definición de módulos.
* Diseño inicial de las interfaces.
* Definición de la arquitectura del sistema.

### Etapa 3 — Desarrollo

* Configuración del frontend y backend.
* Implementación de la base de datos.
* Desarrollo de la API REST.
* Desarrollo de las funcionalidades principales.
* Desarrollo de las interfaces.
* Integración entre frontend y backend.

### Etapa 4 — Pruebas e integración

* Pruebas de las funcionalidades desarrolladas.
* Validación de reglas de negocio.
* Pruebas de disponibilidad y reservas.
* Corrección de errores.
* Ajustes de interfaz y experiencia de usuario.

### Etapa 5 — Despliegue y documentación

* Despliegue del sistema.
* Preparación de la documentación técnica.
* Actualización del README del repositorio.
* Elaboración del informe final.
* Preparación del video demostrativo.
* Preparación para la defensa del proyecto.

---

## 10. Repositorio único de GitHub

Todo el código fuente, documentación, configuraciones y archivos relacionados con el proyecto serán almacenados dentro de un único repositorio de GitHub.

**Repositorio:**
https://github.com/GonzaloTozzi/alquify

La estructura inicial propuesta será:

```text
alquify/
│
├── frontend/
├── backend/
├── database/
├── docs/
└── README.md
```

Esta estructura podrá evolucionar durante el desarrollo de acuerdo con las necesidades del proyecto, manteniendo siempre toda la información centralizada dentro del mismo repositorio.

---

## 11. Resultado esperado

Como resultado final se espera obtener una aplicación web funcional que permita administrar alquileres temporarios de manera centralizada.

El sistema deberá permitir gestionar las propiedades y su disponibilidad, registrar reservas, clientes, huéspedes y pagos, evitando inconsistencias como la superposición de reservas.

Además, el proyecto contará con su código fuente y documentación centralizados en GitHub y con los componentes requeridos desplegados en un servicio online, permitiendo demostrar el funcionamiento completo de la solución desarrollada.
