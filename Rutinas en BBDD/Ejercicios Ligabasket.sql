DROP DATABASE IF EXISTS ligabasket;
CREATE DATABASE ligabasket;
USE ligabasket;
SOURCE C:\\BD\\ligabasket.sql;


/*3. procedimiento que muestre el nombre del equipo ganador de un partido. El procedimiento
recibirá como parámetro el identificador del partido.*/
DELIMITER $$
DROP PROCEDURE IF EXISTS ganador $$
CREATE PROCEDURE ganador(IN partido INT)
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

/*Forma de victor*/
DELIMITER $$
DROP PROCEDURE IF EXISTS ganador $$
CREATE PROCEDURE ganador(IN partido INT)
BEGIN 
   DECLARE resLocal, resVisit, vencedor INT;
   SET resLocal=(SELECT puntosL FROM Partidos WHERE id_partido=partido);
   SET resVisit=(SELECT puntosV FROM Partidos WHERE id_partido=partido);
   
   IF(resLocal>resVisit) THEN 
		SET vencedor=(SELECT elocal FROM Partidos WHERE id_partido=partido);
	ELSE
		SET vencedor=(SELECT evisit FROM Partidos WHERE id_partido=partido);
   END IF;
   
   SELECT nombre 
   FROM Equipos 
   WHERE id_equipo=vencedor;
END $$
DELIMITER ;

CALL ganador(1);

