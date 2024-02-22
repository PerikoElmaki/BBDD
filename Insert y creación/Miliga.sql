CREATE DATABASE MILIGA;
USE MILIGA;

CREATE TABLE Equipos(
	id_equipo 	INTEGER 		AUTO_INCREMENT,
	nombre 		VARCHAR(50) 	NOT NULL,
	ciudad 		VARCHAR(50) 	NOT NULL,
	pabellon 	VARCHAR(50),
	PRIMARY KEY(id_equipo)
);
#--Para borrar tablas DROP TABLE (nombre)
CREATE TABLE Partidos(
	id_partido 	INTEGER 		AUTO_INCREMENT,
	elocal 		INTEGER 		NOT NULL,
	evisit 		INTEGER  		NOT NULL,
	puntosL 	INTEGER 		NOT NULL,
	puntosV 	INTEGER 		NOT NULL,
	fecha 		DATE,
	PRIMARY KEY(id_partido),
	FOREIGN KEY(elocal) REFERENCES Equipos(id_equipo) 
		ON DELETE CASCADE  
		ON UPDATE CASCADE,
	FOREIGN KEY(evisit) REFERENCES Equipos(id_equipo)
		ON UPDATE CASCADE
		ON DELETE CASCADE 
);

CREATE TABLE Jugadores(
	id_jugador 	INTEGER 		AUTO_INCREMENT,
	nombre 		VARCHAR(50) 	NOT NULL,
	apellido 	VARCHAR(50) 	NOT NULL,
	puesto 		VARCHAR(10) 	NOT NULL,
	salario 	DOUBLE 		  NOT NULL,
	altura 		DOUBLE,
	equipo 		INTEGER 		NOT NULL,
	id_capitan  INTEGER,
	PRIMARY KEY(id_jugador),
	FOREIGN KEY(equipo) REFERENCES Equipos(id_equipo) 
		ON UPDATE CASCADE,
	FOREIGN KEY(id_capitan) REFERENCES Jugadores(id_jugador)
		ON DELETE SET NULL
		ON UPDATE CASCADE 
);

#--Para cuando tengas que añadir foreign keys porque no están definidas todas las tablas,

usar el ALTER TABLE

ALTER TABLE ----
ADD FOREIGN KEY(clave ajena) REFERENCES Tablareferenciada(clave referenc)
	ON DELETE ----
	ON UPDATE CASCADE;
	
#---------------INSERT--------------

#--Inserción de registros uno a uno  					Auto increment se pone 0,default 
INSERT INTO Equipos(id_equipo,nombre,ciudad,pabellon) VALUES (0,'Real Madrid','Madrid','Wizink Center'); 

#--No hace falta poner esquema, pero RESPETAR ORDEN 
INSERT INTO Equipos VALUES(0,'FC Barcelona','Barcelona','Palau Blaugrana');

#--Inserción de varios registros  											Se separa por coma
INSERT INTO Equipos VALUES(0,'UCAM Murcia','Murcia','Palacio Municipal de Deportes'),(0,'Valencia Basket','Valencia','Fonteta');

#--Inserción de un registro que contiene campo nulo, indicas en el esquema los que quieras meter 
#--Los que no quieras meter,no lo nombras en esquema 
INSERT INTO Equipos(id_equipo,nombre,ciudad) VALUES(0,'Unicaja','Malaga');
#--Equivalente poner NULL en el hueco que quieras no poner 
INSERT INTO Equipos(0,'Unicaja','Malaga',NULL);

#--Inserción de un registro especificado el nombre y valor de columnas 
INSERT INTO Equipos SET nombre='Baskonia',ciudad='Victoria';

#--Inserción de un registro con consulta 
INSERT INTO Equipos(id_equipo,nombre,ciudad,pabellon)
SELECT 0,'Estudiantes',ciudad,pabellon    #--Lo que no sepas es lo que busca la consulta 
FROM EQUIPOS 
WHERE nombre LIKE 'Real Madrid';        #--QUeremos ciudad y pabellon igual que REal Madrid


#--Ahora con la tabla partidos //Partidos(id_partido, elocal, evisit, puntosL, puntosV, fecha*)
INSERT INTO Partidos VALUES(0,1,2,78,75,'2024-01-17');
INSERT INTO Partidos VALUES(0,3,4,55,23,'2024-01-17');
INSERT INTO Partidos VALUES(0,6,5,90,72,'2024-01-18');
INSERT INTO Partidos VALUES(0,1,6,110,75,CURRENT_DATE());

#--Insertar el partido jugado hoy entre el Madrid y Unicaja con resultado 75-74
INSERT INTO Partidos(id_partido, elocal, evisit, puntosL, puntosV, fecha)
SELECT 0,E1.id_equipo,E2.id_equipo,75,74,CURRENT_DATE() 
FROM Equipos E1,Equipos E2
WHERE E1.nombre LIKE 'Real Madrid' AND E2.nombre LIKE 'Unicaja' ;
 
