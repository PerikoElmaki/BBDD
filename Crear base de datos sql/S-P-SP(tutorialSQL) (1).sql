#--Crear la base de datos
CREATE DATABASE envios;
#--DROP es para borrar. ej: DROP TABLE P;

#-- Empezar a utilizar la base de datos
USE envios;

#-- Mostrar las tablas de la base de datos
SHOW TABLES;

#--Creamos la tabla de los proveedores
#--los tabuladores no los lee SQL, poner espacios PARA QUE NO SE JUNTEN
CREATE TABLE S (
	sn 		VARCHAR(3), 
	snombre VARCHAR(20) NOT NULL,
	estado 	INTEGER 	NOT NULL,
	ciudad 	VARCHAR(20) NOT NULL,
	PRIMARY KEY(sn)
);

#--Consultar una tabla y ver tipos, con DESCRIBE y nombre de tabla
DESCRIBE S; 

#--Creamos tabla P
CREATE TABLE P(
	pn 		VARCHAR(3),
	pnombre VARCHAR(20) NOT NULL,
	color 	VARCHAR(10) NOT NULL,
	peso 	INTEGER	 	NOT NULL,
	ciudad 	VARCHAR(20) NOT NULL,
	PRIMARY KEY(pn)
);
#--Ahora la vemos 
DESCRIBE P;

CREATE TABLE SP(
	sn 	 VARCHAR(3),
	pn 	 VARCHAR(3),
	cant INTEGER NOT NULL,
	PRIMARY KEY(sn,pn),
	FOREIGN KEY(sn) REFERENCES S(sn) 
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY(pn) REFERENCES P(pn)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

#-- Borrado restringir sería no poner nada, no hay linea delete
#--Borrado en NULL, poner DELETE SET NULL

#-- ERROR DE CLAVE AJENA EN SQL: sale un frm en el error.