DROP DATABASE IF EXISTS ligabasket;
CREATE DATABASE ligabasket;
USE ligabasket;
SOURCE C:\\BD\\ligabasket.sql;


/*procedimiento que muestre el nombre del equipo ganador de un partido. El procedimiento
recibirá como parámetro el identificador del partido.*/
DELIMITER $$
DROP PROCEDURE IF EXISTS ganador $$
CREATE PROCEDURE ganador(partido INT)
BEGIN 
    SELECT nombre 
    FROM Equipos
    WHERE id_equipo =(SELECT elocal
                        FROM Partidos 
                        WHERE id_partido=partido AND puntosL>puntosV)
                    OR
          id_equipo =(SELECT evisit 
                        FROM Partidos 
                        WHERE id_partido=partido AND puntosV>puntosL);
END $$
DELIMITER ;

CALL ganador(1);


/*Crea una función que indique el número de partidos que ha ganado un equipo. La función recibirá
como parámetro el identificador del equipo.*/
DELIMITER $$
DROP FUNCTION IF EXISTS numpartidos $$
CREATE FUNCTION numpartidos(equipo INT) RETURNS INT 
BEGIN 
    DECLARE victoriaL INT;
    DECLARE victoriaV INT; 
    DECLARE totalwins INT;
    SET victoriaL=SELECT elocal
                        FROM Partidos 
                        WHERE elocal=equipo AND puntosL>puntosV;
    SET victoriaV=SELECT evisit 
                        FROM Partidos 
                        WHERE elocal=equipo AND puntosV>puntosL;
    SET totalwins=SELECT COUNT(id_partido) FROM Partidos 
                    WHERE elocal=victoriaL OR evisit=victoriaV
                    GROUP BY elocal,evisit;
    RETURN totalwins AS "Victorias del equipo";
END $$
DELIMITER ;