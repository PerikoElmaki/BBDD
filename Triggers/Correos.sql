DROP DATABASE IF EXISTS Correos;
CREATE DATABASE Correos;
USE Correos;

CREATE TABLE USUARIO(
	id  		INTEGER 	    AUTO_INCREMENT,
	nombre  	VARCHAR(20) 	NOT NULL, 
	apellido1 	VARCHAR(20) 	NOT NULL,
	apellido2 	VARCHAR(20) 	NOT NULL,
	email  		VARCHAR(50),
	PRIMARY KEY(id)
);

-- 2 Funcion con tres parametros, nombre apellido segundo apellido y devuelva email 
DROP FUNCTION IF EXISTS creaEmail; 
DELIMITER $$ 
CREATE FUNCTION creaEmail(nom VARCHAR(20),ap1 VARCHAR(20),ap2 VARCHAR(20)) RETURNS VARCHAR(50)
BEGIN 
	DECLARE correo VARCHAR(50);
	SET correo=CONCAT(nom,".",ap1,".",ap2,"@vegamedia.es");
	RETURN LOWER(correo);
END $$ 
DELIMITER ;

-- 3 trigger que cree email si no intrudices 
DROP TRIGGER IF EXISTS pruebaemail;
DELIMITER $$
CREATE TRIGGER pruebaemail 
BEFORE INSERT ON USUARIO 
FOR EACH ROW 
BEGIN 
	IF NEW.email IS NULL THEN 
		SET NEW.email=creaEmail(NEW.nombre,NEW.apellido1,NEW.apellido2); -- LOS TRIGGERS NO LLEVAN SELECT 
	END IF;
END $$
DELIMITER ;


-- 4 Insertar para comprobar 
INSERT INTO USUARIO VALUES(0,"Federico","Garcia","Lorca","poeta@spain.es"),
(0,"Miguel","De","Unamuno","escrito@spain.es"),
(0,"Periko","El","Maki",NULL),
(0,"Pedro","Antonio","Maricon",NULL);