#---.----------TRANSACCIONES---------
#--es un conjunto de ordenes que se ejecutan todas o no se actualiza ninguna,aunque se haya ejecutado alguna vuelve a su estado inicial.
Creamos una base de datos de prueba 

CREATE DATABASE transaccion;
USE transaccion;

CREATE TABLE prueba(
	campo 	INTEGER,
	PRIMARY KEY(campo)
);

INSERT INTO prueba VALUES(1);

BEGIN; #--Inicia transaccion 

INSERT INTO prueba VALUES(2);
INSERT INTO prueba VALUES(3);
INSERT INTO prueba VALUES(4);

ROLLBACK; #--Vuelve al principio, no actualiza 
o 
COMMIT; #--Guarda cambios de transaccion