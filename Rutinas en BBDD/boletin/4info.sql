#--4
DELIMITER $$
DROP PROCEDURE IF EXISTS info $$
CREATE PROCEDURE info(equipo INT)
BEGIN 
	DECLARE PJ,PE,GF,GC,gl,gv,glc,gvc INT;
	
	SET PJ=(SELECT COUNT(*) 
			FROM Partidos
			WHERE eqlocal=equipo OR eqvisit=equipo);
	SET PE=(SELECT COUNT(*) 
					FROM Partidos 
					WHERE (eqlocal=equipo OR eqvisit=equipo) AND golesL=golesV);
	
	SET gl=(SELECT SUM(golesL) 
			FROM Partidos
			WHERE eqlocal=equipo);
	
	SET gv=(SELECT SUM(golesV)
			FROM Partidos 
			WHERE eqvisit=equipo);
	
	SET glc=(SELECT SUM(golesV) 
			FROM Partidos
			WHERE eqlocal=equipo);
	
	SET gvc=(SELECT SUM(golesL)
			FROM Partidos 
			WHERE eqvisit=equipo);
	
	SELECT nombre,PJ,victorias(equipo) AS PG,PE,(PJ-victorias(equipo)-PE) AS PP,gl+gv AS GF,glc+gvc AS GC,numpuntos(equipo) AS Puntos
	FROM Equipos
	WHERE codEquipo=equipo;
	
END $$
DELIMITER ;

CALL info(1);
CALL info(2);

		