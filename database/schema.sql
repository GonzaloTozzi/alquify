-- =====================================================
-- ALQUIFY - Esquema de base de datos
-- Motor: MySQL
-- =====================================================


-- =====================================================
-- TABLA: usuario
-- =====================================================

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT pk_usuario
        PRIMARY KEY (id_usuario),

    CONSTRAINT uq_usuario_email
        UNIQUE (email)
);

-- =====================================================
-- TABLA: propiedad
-- =====================================================

CREATE TABLE propiedad (
    id_propiedad INT AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL,
    descripcion TEXT,
    imagen_url VARCHAR(500),
    activa BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT pk_propiedad
        PRIMARY KEY (id_propiedad),

    CONSTRAINT fk_propiedad_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario),

    CONSTRAINT chk_propiedad_capacidad
        CHECK (capacidad > 0)
);

-- =====================================================
-- TABLA: cliente
-- =====================================================

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    tipo_cliente VARCHAR(20) NOT NULL,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    razon_social VARCHAR(150),
    documento VARCHAR(50),
    cuit VARCHAR(20),
    telefono VARCHAR(50),
    email VARCHAR(150),
    activo BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT pk_cliente
        PRIMARY KEY (id_cliente),

    CONSTRAINT fk_cliente_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario),

    CONSTRAINT chk_cliente_tipo
        CHECK (tipo_cliente IN ('PARTICULAR', 'EMPRESA'))
);

-- =====================================================
-- TABLA: huesped
-- =====================================================

CREATE TABLE huesped (
    id_huesped INT AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    documento VARCHAR(50),
    telefono VARCHAR(50),
    email VARCHAR(150),
    observaciones TEXT,

    CONSTRAINT pk_huesped
        PRIMARY KEY (id_huesped),

    CONSTRAINT fk_huesped_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario)
);

-- =====================================================
-- TABLA: reserva
-- =====================================================

CREATE TABLE reserva (
    id_reserva INT AUTO_INCREMENT,
    id_propiedad INT NOT NULL,
    id_cliente INT NOT NULL,
    fecha_entrada DATETIME NOT NULL,
    fecha_salida DATETIME NOT NULL,
    cantidad_huespedes INT NOT NULL,
    estado VARCHAR(20) NOT NULL,
    importe_total DECIMAL(10,2) NOT NULL,
    fecha_creacion DATETIME NOT NULL,
    observaciones TEXT,

    CONSTRAINT pk_reserva
        PRIMARY KEY (id_reserva),

    CONSTRAINT fk_reserva_propiedad
        FOREIGN KEY (id_propiedad)
        REFERENCES propiedad(id_propiedad),

    CONSTRAINT fk_reserva_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente),

    CONSTRAINT chk_reserva_fechas
        CHECK (fecha_salida > fecha_entrada),

    CONSTRAINT chk_reserva_cantidad_huespedes
        CHECK (cantidad_huespedes > 0),

    CONSTRAINT chk_reserva_estado
        CHECK (estado IN (
            'PENDIENTE',
            'CONFIRMADA',
            'CANCELADA',
            'FINALIZADA'
        )),

    CONSTRAINT chk_reserva_importe
        CHECK (importe_total > 0)
);

-- =====================================================
-- TABLA: pago
-- =====================================================

CREATE TABLE pago (
    id_pago INT AUTO_INCREMENT,
    id_reserva INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    fecha_pago DATETIME NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    concepto VARCHAR(100),
    observaciones TEXT,

    CONSTRAINT pk_pago
        PRIMARY KEY (id_pago),

    CONSTRAINT fk_pago_reserva
        FOREIGN KEY (id_reserva)
        REFERENCES reserva(id_reserva),

    CONSTRAINT chk_pago_monto
        CHECK (monto > 0)
);

-- =====================================================
-- TABLA: reserva_huesped
-- =====================================================

CREATE TABLE reserva_huesped (
    id_reserva INT NOT NULL,
    id_huesped INT NOT NULL,

    CONSTRAINT pk_reserva_huesped
        PRIMARY KEY (id_reserva, id_huesped),

    CONSTRAINT fk_reserva_huesped_reserva
        FOREIGN KEY (id_reserva)
        REFERENCES reserva(id_reserva),

    CONSTRAINT fk_reserva_huesped_huesped
        FOREIGN KEY (id_huesped)
        REFERENCES huesped(id_huesped)
);