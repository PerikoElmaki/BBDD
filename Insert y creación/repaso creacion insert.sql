-- REPASO ligabasket 
DROP DATABASE IF EXISTS repasoliga;
CREATE DATABASE repasoliga;
USE repasoliga;



CREATE TABLE Equipos(
	id_equipo 	INTEGER 		AUTO_INCREMENT,
	nombre 		VARCHAR(30)  	NOT NULL,
	ciudad 		VARCHAR(30) 	NOT NULL,
	pabellon    VARCHAR(30),
	PRIMARY KEY(id_equipo)
);

CREATE TABLE Partidos(
	id_partido 	INTEGER 	AUTO_INCREMENT,
	elocal 		INTEGER   	NOT NULL,
	evisit 		INTEGER 	NOT NULL,
	puntosL 	INTEGER 	NOT NULL,
	puntosV 	INTEGER 	NOT NULL,
	fecha 		DATE,
	PRIMARY KEY(id_partido)
);

-- IMPORTANTE DEJAR ESPACIO antes de tabular 

ALTER TABLE Partidos
ADD FOREIGN KEY(elocal) REFERENCES Equipos(id_equipo) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE;
	
ALTER TABLE Partidos
ADD FOREIGN KEY(evisit) REFERENCES Equipos(id_equipo)
	ON DELETE CASCADE
	ON UPDATE CASCADE;
	
DROP TABLE Jugadores;
CREATE TABLE Jugadores (
	id_jugador	INTEGER AUTO_INCREMENT,
	nombre		CHAR(30) NOT NULL,
	apellido 	CHAR(30) NOT NULL,
	puesto 		CHAR(20) NOT NULL,
	salario 	INTEGER NOT NULL,
	altura 		FLOAT,
	id_capitan 	INTEGER,
	equipo 		INTEGER NOT NULL,
	PRIMARY KEY (id_jugador),
	FOREIGN KEY (equipo) REFERENCES Equipos(id_equipo)
	ON UPDATE CASCADE,
	FOREIGN KEY (id_capitan) REFERENCES Jugadores(id_jugador)
	ON UPDATE CASCADE
	ON DELETE SET NULL
);
 

-- INSERT INTO nombre_tabla (lista_campos) VALUES (lista_valores);
INSERT INTO Equipos VALUES(0,'Real Madrid','Madrid','Wizink Center');
INSERT INTO Equipos VALUES(0,'FC Barcelona','Barcelona','Palau Blaugrana'),
(0,'UCAM Murcia','Murcia','Palacio Municipal de Deportes'),(0,'Valencia Basket','Valencia','Fonteta');

-- Cuando solo quieres un valor 
INSERT INTO Equipos SET nombre='Baskonia',ciudad='Vitoria';

-- COn SELECT 
-- Insertar entre los equipos a Estudiantes, que juega en la misma ciudad y pabellón que el Real Madrid:
INSERT INTO Equipos(id_equipo,nombre,ciudad,pabellon)
SELECT 0,'Estudiantes',ciudad,pabellon
FROM Equipos 
WHERE ciudad IN(SELECT ciudad FROM Equipos WHERE nombre LIKE('Real Madrid')) 
AND pabellon IN(SELECT pabellon FROM Equipos WHERE nombre LIKE('Real Madrid'));

-- O
INSERT INTO Equipos(id_equipo,nombre,ciudad, pabellon)
SELECT 0,"Estudiantes", ciudad, pabellon
FROM Equipos
WHERE nombre LIKE "Real Madrid";


-- Insertamos en partidos 
INSERT INTO Partidos VALUES(0,1,2,78,75,'2018-01-28'),
(0,1,6,80,72,CURRENT_DATE());

-- Insertar el partido jugado hoy entre Real Madrid y Unicaja con resultado 75-74
INSERT INTO Partidos
SELECT 0,Eq1.id_equipo,Eq2.id_equipo,75,74,CURRENT_DATE()
FROM Equipos Eq1,Equipos Eq2
WHERE Eq1.nombre LIKE('Real Madrid') AND Eq2.nombre LIKE('Unicaja');


-- PARA HACER CARGA MASIVA 
LOAD DATA INFILE 'C:\\ruta con \\ importante y carpetas sin nombre espacios' INTO TABLE Partidos;

LOAD DATA INFILE 'C:\\Users\\Jugadores.txt' INTO TABLE Jugadores;



-- MODIFICAR 
-- Establecer como pabellón del Baskonia el "Fernando Buesa Arena":
UPDATE Equipos 
SET pabellon='Fernando Buesa Arena'
WHERE nombre LIKE('Baskonia');

-- Cambiar el resultado del partido jugado entre los equipos Ucam y Valencia, con resultado final 84-86:
UPDATE Partidos 
SET puntosL=84,puntosV=86 
WHERE elocal IN(SELECT id_equipo FROM Equipos WHERE nombre LIKE('%UCAM%'))
AND evisit IN(SELECT id_equipo FROM Equipos WHERE nombre LIKE('%Valencia%')); -- que contengan esa palabra


-- DELETE 
DELETE FROM ---
WHERE (condicion)

-- Eliminar de la base de datos los jugadores de equipos de Murcia:
DELETE FROM Jugadores 
WHERE equipo IN(SELECT id_equipo FROM Equipos WHERE ciudad LIKE('Murcia'));

-- Eliminar los partidos en el que Unicaja haya jugado como visitante
DELETE FROM Partidos 
WHERE evisit IN(SELECT id_equipo FROM Equipos WHERE nombre LIKE('Unicaja'));



----------CREACION SP------------
CREATE TABLE S(
	sn 			CHAR(5),
	snombre  	VARCHAR(10) 	NOT NULL,
	estado 		INTEGER,
	ciudad 		VARCHAR(10) 	NOT NULL,
	PRIMARY KEY(sn) 
);

CREATE TABLE P(
	pn 			CHAR(5),
	pnombre 	VARCHAR(10) 	NOT NULL,
	color 		VARCHAR(10) 	NOT NULL,
	peso 		INTEGER 		NOT NULL,
	ciudad  	VARCHAR(10) 	NOT NULL,
	PRIMARY KEY(pn)
);

CREATE TABLE SP(
	sn	 	CHAR(5),
	pn   	CHAR(5),
	cant  	INTEGER 	NOT NULL,
	PRIMARY KEY(sn,pn)
);

ALTER TABLE SP 
ADD FOREIGN KEY(sn) REFERENCES S(sn)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
ADD FOREIGN KEY(pn) REFERENCES P(pn)
		ON DELETE CASCADE
		ON UPDATE CASCADE;
		
		
--------------------------------------
/*Inserción de registros S */
INSERT INTO S VALUES('S1','Salazar',20,'Londres'),
('S2','Jaimes',10,'Paris'),
('S3','Bernal',30,'Paris'),
('S4','Corona',20,'Londres'),
('S5','Aldana',NULL,'Atenas');

/*inserción masiva cargando los datos del fichero P.txt.*/
LOAD DATA INFILE 'C:\\P.txt' INTO TABLE P;


/*inserción masiva cargando los datos del fichero SP.txt.*/
LOAD DATA INFILE 'C:\\SP.txt' INTO TABLE SP;


-- un nuevo proveedor: Marco, con código S6, estado 20 y ciudad Londres.
INSERT INTO S VALUES('S6','Marco',20,'Londres');
INSERT INTO S VALUES('S7','Andreu',10,'Atenas');

-- Inserta nuevos envíos: el proveedor S6 enviará 100 unidades de cada pieza.
INSERT INTO SP
SELECT 'S6',pn,100
FROM P;

-- el proveedor S7 enviará las mismas piezas y en las mismas cantidades que el proveedor S2.
INSERT INTO SP
SELECT 'S7',pn,cant 
FROM SP 
WHERE sn='S2';

-- el proveedor S7 tantas piezas P4 como envía el proveedor S1.
INSERT INTO SP 
SELECT 'S7',pn,cant
FROM SP 
WHERE sn='S1' AND pn='P4';

-- Disminuye una unidad el peso de las piezas azules.
UPDATE P
SET peso=peso-1
WHERE color LIKE('azul');

-- Sube a 300 los envíos del proveedor S6 de la pieza P3.
UPDATE SP 
SET cant=300
WHERE sn='S6' AND pn='P3';

-- Duplica la cantidad de envíos que hace el proveedor S6 de las piezas P1 y P2.
UPDATE SP 
SET cant=cant*2
WHERE sn='S6' AND pn IN('P1','P2');

-- Aumenta en 100 todos los envíos del proveedor S7.
UPDATE SP 
SET cant=cant+100
WHERE sn='S7';

-- Aumenta en 25 unidades la cantidad de envíos de piezas con el mayor peso.
UPDATE SP 
SET cant=cant+25
WHERE pn IN(SELECT pn FROM P WHERE peso=(SELECT MAX(peso) FROM P));


-- Elimina todos los envíos de piezas de menor peso.
DELETE FROM SP 
WHERE pn IN(SELECT pn FROM P WHERE peso=(SELECT MIN(peso) FROM P));

-- Elimina todos los envíos del proveedor S7.
DELETE FROM SP 
WHERE sn='S7';