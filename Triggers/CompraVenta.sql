DROP DATABASE IF EXISTS Compraventa; 
CREATE DATABASE Compraventa;
USE Compraventa;


CREATE TABLE PRODUCTO(
	codPro 		VARCHAR(4),
	nombre 		VARCHAR(20)  	NOT NULL,
	descrip 	VARCHAR(40),
	PRIMARY KEY(codPro)
);


CREATE TABLE COMPRA(
	codPro  VARCHAR(4),
	fecha 	DATE,
	cant 	INTEGER 	NOT NULL, 
	coste 	DOUBLE 		NOT NULL,
	PRIMARY KEY(codPro,fecha),
	FOREIGN KEY(codPro) REFERENCES PRODUCTO(codPro)
		ON DELETE CASCADE 
		ON UPDATE CASCADE
);

CREATE TABLE VENTA(
	codPro  VARCHAR(4),
	fecha 	DATE,
	cant 	INTEGER 	NOT NULL, 
	pvp 	DOUBLE 		NOT NULL,
	PRIMARY KEY(codPro,fecha),
	FOREIGN KEY(codPro) REFERENCES PRODUCTO(codPro)
		ON DELETE CASCADE 
		ON UPDATE CASCADE
);


#-- Inserción de productos 
INSERT INTO PRODUCTO VALUES('M01','Mesa ARCADE','Madera rectangular'),
('M02','Mesa BILLAR','Pa jugar con los panas'),
('S01','Silla Gaming','Mierdon que dura un año'),
('S02','Silla Oficina','Silla redy');


-- Definimos variables 
-- variable stock,es la suma de los que compras menos lo que vendes
SET @stocktotal=0;

-- variable maxVenta: (maximo importe por una venta) 
SET @maxVenta=0; 



/*Trigger que cuente el stock de los productos */

DROP TRIGGER IF EXISTS hacercompra;
CREATE TRIGGER hacercompra
AFTER INSERT ON Compra
FOR EACH ROW 
SET @stock=@stock+NEW.cant;


/* Otro que cuente el stock tras vender y la max venta*/
DELIMITER $$
DROP TRIGGER IF EXISTS hacerventa $$
CREATE TRIGGER hacerventa
AFTER INSERT ON Venta 
FOR EACH ROW 
BEGIN 
	SET @stock=@stock-NEW.cant;
	IF @maxVenta<NEW.cant*NEW.pvp THEN 
		SET @maxVenta=NEW.cant*NEW.pvp;
	END IF;
END $$
DELIMITER ;


-- 
INSERT INTO COMPRA VALUES('M01',CURRENT_DATE(),15,115.75),
('M02','2024-03-24',5,150.5);

SELECT @stock;

INSERT INTO VENTA VALUES('M01',NOW(),10,190);

SELECT @stock;
SELECT @maxVenta;

INSERT INTO VENTA VALUES('M01','2024-02-12',10,200);
INSERT INTO VENTA VALUES('S01','2024-02-12',8,250);

