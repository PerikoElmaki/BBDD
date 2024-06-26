DROP DATABASE IF EXISTS SPSP;
CREATE DATABASE SPSP;
USE SPSP;

-- EMpezxamos con las tablas 
CREATE TABLE S(
	sn  	 VARCHAR(4),
	snombre  VARCHAR(20) 	NOT NULL,
	estado 	 INTEGER,
	ciudad 	 VARCHAR(20) 	NOT NULL,
	PRIMARY KEY(sn)
);

CREATE TABLE P(
	pn 			VARCHAR(4),
	pnombre 	VARCHAR(20) 	NOT NULL,
	color 		VARCHAR(20) 	NOT NULL,
	peso 		INTEGER 		NOT NULL,
	ciudad 		VARCHAR(20) 	NOT NULL,
	PRIMARY KEY(pn)
);

CREATE TABLE SP(
	sn 		VARCHAR(4),
	pn 		VARCHAR(4),
	cant  	INTEGER 	NOT NULL,
	PRIMARY KEY(sn,pn),
	FOREIGN KEY(sn) REFERENCES S(sn) 
		ON DELETE CASCADE 
		ON UPDATE CASCADE,
	FOREIGN KEY(pn) REFERENCES P(pn)
		ON DELETE CASCADE 
		ON UPDATE CASCADE
);

-- INSERTAMOS LOS DATOS 
-- Registros tabla S 
INSERT o 
REPLACE INTO S(sn,snombre,estado,ciudad) VALUES('S1','Salazar',20,'Londres'),
('S2','Jaimes',10,'Paris'),
('S3','Bernal',30,'Paris'),
('S4','Corona',20,'Londres'),
('S5','Aldana',NULL,'Atenas');

--Registros tabla P 
INSERT INTO P VALUES('P1','tuerca','verde',12,'Paris'),
('P2','perno','rojo',17,'Londres'),
('P3','birlo','azul',17,'Roma'),
('P4','birlo','rojo',14,'Londres'),
('P5','leva','azul',12,'Paris'),
('P6','engrane','rojo',19,'Paris');


-- EMPEZAMOS CON LOS TRIGGERS 

-- Saltarán cuando ocurran las condiciones que quieres controlar, EN TABLA SP 
-- Por eso no la hemos creado todavia, actúan antes de introducir datos 

-- Creamos una variable @TOTAL y le asignamos el valor 0
SET @TOTAL=0;

-- La visualizamos 
SELECT @TOTAL;

/*Creamos un TRIGGER O DISPARADOR
	ES UN OBJETO que se asocia a una TABLA y se activa cuando ocurre
	en esta un EVENTO (Inserción, mod o delete) particular*/

-- El trigger TOTAL va a sumar los valores que insertemos en una de las columnas 
-- La suma de todas las cantidades de productos enviados 

CREATE TRIGGER sumar 
AFTER INSERT ON SP 
FOR EACH ROW 
SET @TOTAL=@TOTAL+NEW.cant; -- se refiere a cant despues de insertar

INSERT INTO SP VALUES('S1','P1',300),('S1','P2',200),('S1','P3',400),
('S1','P4',200),('S1','P5',100),('S1','P6',100),('S2','P1',300);

-- PARA BORRAR CONTENIDO DE TABLA 
DELETE FROM SP;


/* Trigger sobre borrado, cuando eliminemos un envio, restamos cantidad */
DROP TRIGGER IF EXISTS restar;
CREATE TRIGGER restar 
BEFORE DELETE ON SP 
FOR EACH ROW 
SET @TOTAL=@TOTAL-OLD.cant; -- old porq es el valor que tiene antes de borrar

SELECT @TOTAL; 

DELETE FROM SP 
WHERE sn='S1' AND pn='P3';

SELECT @TOTAL; 

/*Trigger para modificaciones*/
CREATE TRIGGER cambiar 
BEFORE UPDATE ON SP 
FOR EACH ROW 
SET @TOTAL=@TOTAL-OLD.cant+NEW.cant;  -- porque vamos a cambiar valor anterior y sumar nuevo 

SELECT @TOTAL; 

UPDATE SP 
SET cant=800 
WHERE sn='S1' AND pn='P5';

SELECT @TOTAL; 