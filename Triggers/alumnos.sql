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

-- TRIGGER PARA ACTUALIZAR NOTA, si es negatica se guarda 0, si es 
-- m ayor que 10, un 10 
DROP TRIGGER IF EXISTS actualizar_nota;
DELIMITER $$
CREATE TRIGGER actualizar_nota
BEFORE UPDATE ON Alumno 
FOR EACH ROW 
BEGIN 
	IF NEW.nota<0 THEN 
		SET NEW.nota=0;
	ELSEIF NEW.nota>10 THEN 
		SET NEW.nota=10;
	END IF;
END $$
DELIMITER ;

UPDATE Alumno 
SET nota=-4 
WHERE id=1;


UPDATE Alumno 
SET nota=14
WHERE id=2;
