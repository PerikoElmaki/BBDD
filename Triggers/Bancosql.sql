DROP DATABASE IF EXISTS banco;
CREATE DATABASE banco; 
USE banco; 

-- ejercicio banco 
CREATE TABLE Cuentas(
	numcuenta 		INTEGER, 
	saldo 			INTEGER 	NOT NULL,
	PRIMARY KEY(numcuenta)
);

SET @saldo=0;

-- Trigger que guarde el acumulativo de los valores insertados 
DROP TRIGGER IF EXISTS contasaldo;
CREATE TRIGGER contasaldo
AFTER INSERT ON Cuentas 
FOR EACH ROW 
SET @saldo=@saldo+NEW.saldo;

INSERT INTO Cuentas VALUES(1,200);

SELECT @saldo;

INSERT INTO Cuentas VALUES(3,400);
-- Trigger que reste el valor cuando se borre 
DROP TRIGGER IF EXISTS restasaldo;
CREATE TRIGGER restasaldo
BEFORE DELETE ON Cuentas 
FOR EACH ROW 
SET @saldo=@saldo-OLD.saldo;

DELETE FROM Cuentas
WHERE numcuenta=3;

-- Trigger de modificacion para almacenar cambios en el sueldo 
DROP TRIGGER IF EXISTS modsaldo;
CREATE TRIGGER modsaldo 
AFTER UPDATE ON Cuentas 
FOR EACH ROW 
SET @saldo=@saldo-OLD.saldo+NEW.saldo;

SELECT @saldo;

UPDATE Cuentas 
SET saldo=1000 
WHERE numcuenta=1;
