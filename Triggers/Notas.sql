DROP DATABASE IF EXISTS Notas;
CREATE DATABASE Notas;
USE Notas;

CREATE TABLE ASIGNATURA(
	codAsig 	VARCHAR(4),
	nomAsig 	VARCHAR(50) 	NOT NULL,
	curso  		INTEGER 		NOT NULL,
	horas  		INTEGER,
	PRIMARY KEY(codAsig)
);

CREATE TABLE ALUMNO(
	codAlum 	INTEGER 	AUTO_INCREMENT,
	nomAlum 	VARCHAR(50) NOT NULL,
	fechanac 	DATE,
	PRIMARY KEY(codAlum)
);

CREATE TABLE NOTA(
	codAlum 	INTEGER,
	codAsig 	VARCHAR(4),
	nota 		INTEGER,
	PRIMARY KEY(codAlum,codAsig),
	FOREIGN KEY(codAlum) REFERENCES ALUMNO(codAlum)
		ON DELETE CASCADE 
		ON UPDATE CASCADE, 
	FOREIGN KEY(codAsig) REFERENCES ASIGNATURA(codAsig)
		ON DELETE CASCADE 
		ON UPDATE CASCADE
);

INSERT INTO ASIGNATURA VALUES('BD','Bases de Datos',1,5),
('SI','Sistemas Informaticos',1,8),
('ED','Entornos de Desarrollo',1,3),
('LM','Lenguaje de Marcas',2,5),
('DIW','Diseño de interfaces Web',2,9);

INSERT INTO Alumno VALUES (0,'Pedro Martinez','1998/02/17');
INSERT INTO Alumno VALUES (0,'Ana Fuentes', '1997-04-21');
INSERT INTO Alumno VALUES (0,'Juan Salas','1998-11-12');
INSERT INTO Alumno VALUES (0,'Carmen Pedroso', '1997-03-25');
INSERT INTO Alumno VALUES (0,'Javier Buendia','1998-12-11');
INSERT INTO Alumno VALUES (0,'Antonio Calvo','1998-02-22');
-- Creamos variables que cuenten numero de aprobados y suspensos 

SET @aprobados=0;
set @suspensos=0;

-- Trigger que cuente cuando insertes nota 

DELIMITER $$
CREATE TRIGGER evaluar_insert 
AFTER INSERT ON Nota 
FOR EACH ROW 
BEGIN 
	IF NEW.nota>=5 THEN 
		SET @aprobados=@aprobados+1;
	ELSE
		SET @suspensos=@suspensos+1;
	END IF;
END $$
DELIMITER ;

INSERT INTO Nota VALUES (1,'BD',5);
INSERT INTO Nota VALUES (2,'BD',8);
INSERT INTO Nota VALUES (3,'BD',10);
INSERT INTO Nota VALUES (4,'BD',3);
INSERT INTO Nota VALUES (5,'BD',7);
INSERT INTO Nota VALUES (6,'BD',6);
INSERT INTO Nota VALUES (1,'SI',5);
INSERT INTO Nota VALUES (2,'SI',8);
INSERT INTO Nota VALUES (3,’SI’,10);
INSERT INTO Nota VALUES (4,’SI’,3);
INSERT INTO Nota VALUES (5,’SI’,7);
INSERT INTO Nota VALUES (6,’SI’,6);

-- TRigger que controle la modificacion 

DELIMITER $$
DROP TRIGGER IF EXISTS evaluar_update $$
CREATE TRIGGER evaluar_update
BEFORE UPDATE ON Nota 
FOR EACH ROW 
BEGIN 
	IF OLD.nota>=5 THEN 
		IF NEW.nota<5 THEN 
			SET @aprobados=@aprobados-1;
			SET @suspensos=@suspensos+1;
		END IF; 
	ELSE 
		IF NEW.nota>=5 THEN 
			SET @aprobados=@aprobados+1;
			SET @suspensos=@suspensos-1;
		END IF; 
	END IF;
END $$
DELIMITER ;

UPDATE Nota
SET nota=4
WHERE codAlum=1;

SELECT @aprobados;
SELECT @suspensos;

UPDATE Nota
SET nota=nota+1
WHERE codAlum=2;

SELECT @aprobados;
SELECT @suspensos;