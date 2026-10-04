-- ALQUIFY - Esquema de Base de Datos
-- Motor: MySQL
-- =====================================================

DROP DATABASE IF EXISTS alquify_db;
CREATE DATABASE alquify_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE alquify_db;

-- =====================================================
-- 1. TABLA: usuario
-- =====================================================
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB;

-- =====================================================
-- 2. TABLA: propiedad
-- =====================================================
CREATE TABLE propiedad (
    id_propiedad INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL,
    descripcion TEXT,
    imagen_url VARCHAR(255),
    activa BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_propiedad_usuario FOREIGN KEY (id_usuario) 
        REFERENCES usuario(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- =====================================================
-- 3. TABLA: cliente (PK Natural: documento_cuit)
-- =====================================================
CREATE TABLE cliente (
    documento_cuit VARCHAR(30) PRIMARY KEY,
    id_usuario INT NOT NULL,
    tipo_cliente ENUM('PARTICULAR', 'EMPRESA') NOT NULL,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    razon_social VARCHAR(150),
    telefono VARCHAR(30),
    email VARCHAR(150),
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_cliente_usuario FOREIGN KEY (id_usuario) 
        REFERENCES usuario(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- =====================================================
-- 4. TABLA: huesped (PK Natural: documento)
-- =====================================================
CREATE TABLE huesped (
    documento VARCHAR(30) PRIMARY KEY,
    id_usuario INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    telefono VARCHAR(30),
    email VARCHAR(150),
    observaciones TEXT,
    CONSTRAINT fk_huesped_usuario FOREIGN KEY (id_usuario) 
        REFERENCES usuario(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- =====================================================
-- 5. TABLA: reserva
-- =====================================================
CREATE TABLE reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_propiedad INT NOT NULL,
    documento_cuit_cliente VARCHAR(30) NOT NULL,
    fecha_entrada DATETIME NOT NULL,
    fecha_salida DATETIME NOT NULL,
    cantidad_huespedes INT NOT NULL,
    estado ENUM('PENDIENTE', 'CONFIRMADA', 'CANCELADA', 'FINALIZADA') NOT NULL DEFAULT 'PENDIENTE',
    importe_total DECIMAL(10,2) NOT NULL,
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    observaciones TEXT,
    CONSTRAINT fk_reserva_propiedad FOREIGN KEY (id_propiedad) 
        REFERENCES propiedad(id_propiedad) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_reserva_cliente FOREIGN KEY (documento_cuit_cliente) 
        REFERENCES cliente(documento_cuit) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- =====================================================
-- 6. TABLA ASOCIATIVA: reserva_huesped (PK Compuesta)
-- =====================================================
CREATE TABLE reserva_huesped (
    id_reserva INT NOT NULL,
    documento_huesped VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_reserva, documento_huesped),
    CONSTRAINT fk_rh_reserva FOREIGN KEY (id_reserva) 
        REFERENCES reserva(id_reserva) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_rh_huesped FOREIGN KEY (documento_huesped) 
        REFERENCES huesped(documento) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- =====================================================
-- 7. TABLA: pago (Entidad Débil - PK Compuesta)
-- =====================================================
CREATE TABLE pago (
    id_reserva INT NOT NULL,
    fecha_pago DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    monto DECIMAL(10,2) NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    concepto VARCHAR(100),
    observaciones TEXT,
    PRIMARY KEY (id_reserva, fecha_pago),
    CONSTRAINT fk_pago_reserva FOREIGN KEY (id_reserva) 
        REFERENCES reserva(id_reserva) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
