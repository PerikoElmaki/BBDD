DROP DATABASE IF EXISTS ESEPE;

#--1
CREATE DATABASE ESEPE;
USE ESEPE;

CREATE TABLE S(
	sn 			VARCHAR(20),
	snombre 	VARCHAR(20) 	NOT NULL,
 	estado 		INTEGER,
	ciudad 		VARCHAR(20) 	NOT NULL,
	PRIMARY KEY(sn)
);

CREATE TABLE P(
	pn 			VARCHAR(20),
	pnombre 	VARCHAR(20) 	NOT NULL,
	color 		VARCHAR(20) 	NOT NULL,
	peso 		INTEGER 		NOT NULL,
	ciudad  	VARCHAR(20) 	NOT NULL,
	PRIMARY KEY(pn)
);

CREATE TABLE SP(
	sn 		VARCHAR(20),
	pn	 	VARCHAR(20),
	cant 	INTEGER 	NOT NULL,
	PRIMARY KEY(sn,pn),
	FOREIGN KEY(sn) REFERENCES S(sn) 
		ON DELETE CASCADE 
		ON UPDATE CASCADE,
	FOREIGN KEY(pn) REFERENCES P(pn)
		ON DELETE CASCADE
		ON UPDATE CASCADE 
);

#--2

INSERT o    #--He introducido primera linea, para asegurar introduces con replace
REPLACE INTO S(sn,snombre,estado,ciudad) VALUES('S1','Salazar',20,'Londres'),
('S2','Jaimes',10,'Paris'),
('S3','Bernal',30,'Paris'),
('S4','Corona',20,'Londres'),
('S5','Aldana',NULL,'Atenas');

#--3
#--Copiamos dirección, pero hay que introducir doble barra, y nombre del archivo
LOAD DATA INFILE 'C:\\Users\\PedroS\\Downloads\\P.txt' INTO TABLE P;
#--4
LOAD DATA INFILE 'C:\\Users\\PedroS\\Downloads\\SP.txt' INTO TABLE SP;

#--5
INSERT INTO S VALUES('S6','Marco',20,'Londres');

#--6
INSERT INTO S VALUES('S7','Andreu',10,'Atenas');

#--7 Inserta nuevos envíos: el proveedor S6 enviará 100 unidades de cada pieza.
INSERT INTO SP(sn,pn,cant)
SELECT 'S6',pn,100
FROM P;

#--8 Inserta nuevos envíos: el proveedor S7 enviará las mismas piezas y en las mismas cantidades que el proveedor S2.
INSERT INTO SP(sn,pn,cant)
SELECT 'S7',pn,cant 
FROM SP 
WHERE sn='S2';

#--9
INSERT INTO SP
SELECT 'S7','P4',cant
FROM SP 
WHERE sn='S1' AND pn='P4';

#--10
UPDATE P 
SET peso=peso-1;

#--11
UPDATE SP 
SET cant=cant+300 WHERE sn='S6' AND pn='P3';

#--12
UPDATE SP 
SET cant=cant*2 WHERE sn='S6' AND (pn='P1' OR pn='P2'); #--EL PARENTESIS

#--13
UPDATE SP
SET cant=cant+100 WHERE sn='S7';

#--14
UPDATE SP 
SET cant=cant+25 WHERE pn IN(SELECT pn FROM P WHERE peso=(SELECT MAX(peso) FROM P));

UPDATE SP 
SET cant=cant+25 WHERE pn IN(SELECT TOP(1)pn FROM P ORDER BY peso DESC);

#--15
DELETE FROM SP
WHERE pn IN(SELECT pn FROM P WHERE peso=(SELECT MIN(peso) FROM P));

#--16
DELETE FROM SP 
WHERE sn='S7';

