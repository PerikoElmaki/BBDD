DROP DATABASE IF EXISTS VUELOS;
CREATE DATABASE VUELOS;
USE VUELOS;

CREATE TABLE COMPANIAS(
    ID_COMPANIA VARCHAR(2),
    NOMBRE VARCHAR(20)  NOT NULL,
    NACIONALIDAD VARCHAR(20) NOT NULL,
    PRIMARY KEY(ID_COMPANIA)
);

#--Inserción masiva en la tabla compañias 
LOAD DATA INFILE'C:/Users/Pedro/Downloads/Vuelos/Datos_Companias.txt' INTO TABLE COMPANIAS;

-- Crear tabla clientes e inserción

CREATE TABLE CLIENTES(
    NIF VARCHAR(9),
    APELLIDO1 VARCHAR(20) NOT NULL,
    APELLIDO2 VARCHAR(20) NOT NULL,
    NOMBRE VARCHAR(20) NOT NULL,
    POBLACION VARCHAR(20) NOT NULL,
    PRIMARY KEY (NIF)
);

LOAD DATA INFILE'C:/Users/Pedro/Downloads/Vuelos/Datos_Clientes.txt' INTO TABLE CLIENTES;

-- VUELOS 
/*No deben existir vuelos con mismo origen y destino,
un numero de vuelo no debe repetirse en la misma fecha para la misma compañia*/
-- IMPLEMENTAMOS UNIQUE 

CREATE TABLE VUELOS (
    VUELO INTEGER(4),
    ID_COMPANIA VARCHAR(2) NOT NULL,
    FECHA DATE NOT NULL,
    ORIGEN VARCHAR(20) NOT NULL,
    DESTINO VARCHAR(20) NOT NULL,
    PLAZAS INTEGER(5) NOT NULL,
    PRIMARY KEY (VUELO),
    FOREIGN KEY (ID_COMPANIA) REFERENCES COMPANIAS(ID_COMPANIA)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    UNIQUE (ORIGEN,DESTINO,FECHA),
    UNIQUE (VUELO,ID_COMPANIA,FECHA)
);

#--Inserción masiva en la tabla vuelos
LOAD DATA INFILE 'C:/Users/Pedro/Downloads/Vuelos/Datos_Vuelos.txt' INTO TABLE VUELOS;



-- OCUPACION VUELOS Y RERERVAS
CREATE TABLE OCUPACION_VUELOS (
    VUELO INTEGER(4),
    PASAJERO VARCHAR(9),
    ASIENTO VARCHAR(3),
    OBSERVACIONES VARCHAR(40),
    PRIMARY KEY (VUELO,PASAJERO),
    UNIQUE (VUELO,ASIENTO),
    FOREIGN KEY (VUELO) REFERENCES VUELOS(VUELO)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (PASAJERO) REFERENCES CLIENTES(NIF)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE RESERVAS(
    VUELO INTEGER(4),
    PASAJERO VARCHAR(9),
    FECHA_RESERVA DATE,
    PRIMARY KEY (VUELO,PASAJERO,FECHA_RESERVA),
    FOREIGN KEY (VUELO) REFERENCES VUELOS(VUELO)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (PASAJERO) REFERENCES CLIENTES(NIF)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

/* TRIGGER que al insertar valores en ocupacion, inserte en la tabla reservas 
la fecha de las reservas corresponde al momento de insetar pasajero en ocupacion */
CREATE TRIGGER insertar_reservas
AFTER INSERT ON OCUPACION_VUELOS
FOR EACH ROW 
INSERT INTO RESERVAS VALUES (NEW.VUELO,NEW.PASAJERO,NOW());

-- Carga en ocupacion vuelos 
INSERT INTO OCUPACION_VUELOS (VUELO, PASAJERO, ASIENTO) VALUES (1005, '70589658A', '1A'); 
INSERT INTO OCUPACION_VUELOS (VUELO, PASAJERO, ASIENTO) VALUES (1005, '52587412D', '3G'); 
INSERT INTO OCUPACION_VUELOS VALUES (1005, '47852358S', '4F', 'BEBE < 1 AÑO');
INSERT INTO OCUPACION_VUELOS VALUES (7458, '74125896Q', '2G', 'SILLA RUEDAS'); 
INSERT INTO OCUPACION_VUELOS VALUES (7458, '12547854F', '3F', NULL); 
INSERT INTO OCUPACION_VUELOS VALUES (4712, '52587412D', '3G', NULL);   
INSERT INTO OCUPACION_VUELOS VALUES (4712, '12547854F', '5H', NULL); 
INSERT INTO OCUPACION_VUELOS VALUES (7525, '70589658A', '2F', NULL);

-- Cambiar el asiento del pasajero 47852358S en el vuelo 4712 por asiento 2c
UPDATE OCUPACION_VUELOS
SET ASIENTO ="2C"
WHERE pasajero="47852358S" AND vuelo=4712;

-- REaliza reserva (ocupacion) para el vuelo berlin dublin del pasajero 12547854F
INSERT INTO OCUPACION_VUELOS
SELECT VU.VUELO,'12547854F',NULL,