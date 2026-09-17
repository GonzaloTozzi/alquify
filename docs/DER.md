# Diagrama Entidad-Relación

El siguiente diagrama representa el modelo conceptual de datos de Alquify. Se incluyen las entidades principales, algunos de sus atributos más relevantes y las relaciones existentes entre ellas junto con sus respectivas cardinalidades.

```mermaid
flowchart TB

    %% =========================
    %% ENTIDADES
    %% =========================

    USUARIO[Usuario]
    PROPIEDAD[Propiedad]
    CLIENTE[Cliente]
    RESERVA[Reserva]
    HUESPED[Huésped]
    PAGO[Pago]


    %% =========================
    %% RELACIONES
    %% =========================

    ADMINISTRA{Administra}
    REGISTRA_CLIENTE{Registra}
    REGISTRA_HUESPED{Registra}
    TIENE_RESERVA{Tiene}
    REALIZA{Realiza}
    INCLUYE{Incluye}
    TIENE_PAGO{Tiene}


    %% =========================
    %% ATRIBUTOS
    %% =========================

    ID_USUARIO([id_usuario])
    EMAIL_USUARIO([email])

    ID_PROPIEDAD([id_propiedad])
    NOMBRE_PROPIEDAD([nombre])
    CAPACIDAD([capacidad])

    ID_CLIENTE([id_cliente])
    TIPO_CLIENTE([tipo_cliente])

    ID_RESERVA([id_reserva])
    FECHA_ENTRADA([fecha_entrada])
    FECHA_SALIDA([fecha_salida])
    ESTADO([estado])

    ID_HUESPED([id_huesped])
    DOCUMENTO([documento])

    ID_PAGO([id_pago])
    MONTO([monto])
    FECHA_PAGO([fecha_pago])


    %% =========================
    %% ATRIBUTOS - USUARIO
    %% =========================

    ID_USUARIO --- USUARIO
    EMAIL_USUARIO --- USUARIO


    %% =========================
    %% USUARIO - PROPIEDAD
    %% =========================

    USUARIO ---|1| ADMINISTRA
    ADMINISTRA ---|N| PROPIEDAD

    ID_PROPIEDAD --- PROPIEDAD
    NOMBRE_PROPIEDAD --- PROPIEDAD
    CAPACIDAD --- PROPIEDAD


    %% =========================
    %% USUARIO - CLIENTE
    %% =========================

    USUARIO ---|1| REGISTRA_CLIENTE
    REGISTRA_CLIENTE ---|N| CLIENTE

    ID_CLIENTE --- CLIENTE
    TIPO_CLIENTE --- CLIENTE


    %% =========================
    %% USUARIO - HUESPED
    %% =========================

    USUARIO ---|1| REGISTRA_HUESPED
    REGISTRA_HUESPED ---|N| HUESPED

    ID_HUESPED --- HUESPED
    DOCUMENTO --- HUESPED


    %% =========================
    %% PROPIEDAD - RESERVA
    %% =========================

    PROPIEDAD ---|1| TIENE_RESERVA
    TIENE_RESERVA ---|N| RESERVA


    %% =========================
    %% CLIENTE - RESERVA
    %% =========================

    CLIENTE ---|1| REALIZA
    REALIZA ---|N| RESERVA


    %% =========================
    %% RESERVA - HUESPED
    %% =========================

    RESERVA ---|N| INCLUYE
    INCLUYE ---|M| HUESPED


    %% =========================
    %% ATRIBUTOS - RESERVA
    %% =========================

    ID_RESERVA --- RESERVA
    FECHA_ENTRADA --- RESERVA
    FECHA_SALIDA --- RESERVA
    ESTADO --- RESERVA


    %% =========================
    %% RESERVA - PAGO
    %% =========================

    RESERVA ---|1| TIENE_PAGO
    TIENE_PAGO ---|N| PAGO

    ID_PAGO --- PAGO
    MONTO --- PAGO
    FECHA_PAGO --- PAGO


    %% =========================
    %% ESTILOS
    %% =========================

    classDef entidad fill:#dff3f1,stroke:#222,stroke-width:1.5px,color:#111
    classDef relacion fill:#ffd6d6,stroke:#222,stroke-width:1.5px,color:#111
    classDef atributo fill:#e3f0ff,stroke:#222,stroke-width:1.5px,color:#111

    class USUARIO,PROPIEDAD,CLIENTE,RESERVA,HUESPED,PAGO entidad
    class ADMINISTRA,REGISTRA_CLIENTE,REGISTRA_HUESPED,TIENE_RESERVA,REALIZA,INCLUYE,TIENE_PAGO relacion
    class ID_USUARIO,EMAIL_USUARIO,ID_PROPIEDAD,NOMBRE_PROPIEDAD,CAPACIDAD,ID_CLIENTE,TIPO_CLIENTE,ID_RESERVA,FECHA_ENTRADA,FECHA_SALIDA,ESTADO,ID_HUESPED,DOCUMENTO,ID_PAGO,MONTO,FECHA_PAGO atributo
```

## Relaciones representadas

- Usuario **1:N** Propiedad.
- Usuario **1:N** Cliente.
- Usuario **1:N** Huésped.
- Propiedad **1:N** Reserva.
- Cliente **1:N** Reserva.
- Reserva **N:M** Huésped.
- Reserva **1:N** Pago.

La relación muchos a muchos entre Reserva y Huésped será implementada en el esquema relacional mediante la tabla asociativa `reserva_huesped`.
