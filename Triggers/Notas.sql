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

