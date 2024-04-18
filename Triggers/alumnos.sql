DROP DATABASE IF EXISTS Alumnos;
CREATE DATABASE ALumnos;
USE Alumnos; 


CREATE TABLE Alumno(
	id 		INTEGER 		AUTO_INCREMENT,
	nombre  VARCHAR(40) 	NOT NULL, 
	nota 	FLOAT,
	PRIMARY KEY(ID)
);


INSERT INTO ALUMNO VALUES(0,'Joaquin Lorca',8.0);
INSERT INTO ALUMNO VALUES(0,'Esteban Martinez',4.2);

SELECT * FROM Alumno; 

-- TRIGGER PARA CONTROLAR NOTA ENTRE 1 y 10 
DROP TRIGGER IF EXISTS comprobar_insert_nota;
DELIMITER $$ 
CREATE TRIGGER comprobar_insert_nota
BEFORE INSERT ON Alumno 
FOR EACH ROW 
BEGIN 
	IF NEW.nota<0 THEN 
		SET NEW.nota=0;
	ELSEIF NEW.nota>10 THEN 
		SET NEW.nota=10;
	END IF;
END $$
DELIMITER ;



INSERT INTO Alumno VALUES(0,'Rony Luzu',11.0);
INSERT INTO Alumno VALUES(0,'Miguel Angel',-2.5);