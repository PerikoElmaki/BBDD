/* FUNCIONES Y PROCEDIMIENTOS EN BBDD */
Vamos a hablar de rutinas y procedure(no devuelve)

/* Procedimientos y funciones almacenados en mySQL */

-- a)RUTINA

-- Ejemplo de rutina almacenada 
DROP DATABASE IF EXISTS Ejemplos;
CREATE DATABASE Ejemplos;
USE Ejemplos;

-- Creamos el procedimiento y establecemos lo que va a hacer 
CREATE PROCEDURE hola_mundo()
SELECT 'Hola,Mundo!' AS 'Mi primera rutina';  --No hemos usado llaves 
-- Llamada al procedimiento 
CALL hola_mundo;

/* Para crear varias lineas de procedimiento, necesitamos un delimitador
y así le decimos donde tiene que acabar  */

--Cambiamos delimiter a $$ (que va a cambiar al ;)
/* IMPORTANTE EL ESPACIO ENTRE EL DELIMITER Y EL CAMBIO, no va seguido  */
DELIMITER $$ 

DROP PROCEDURE IF EXISTS hola_mundo $$

CREATE PROCEDURE hola_mundo()  
BEGIN  
	SELECT 'hola, mundo!' AS 'Mi primera rutina';  
END $$ 


--Cambiamos otra vez el delimitador al final del procedimiento
DELIMITER ; 

