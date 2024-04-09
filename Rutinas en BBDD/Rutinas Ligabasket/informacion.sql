/*7. Crea un procedimiento que reciba como parámetro el identificador de un equipo y muestre la siguiente
información: nombre del equipo, número de partidos ganados, número de partidos perdidos, total de
puntos a favor y total de puntos en contra.*/
DELIMITER $$
DROP PROCEDURE IF EXISTS informacion $$
CREATE PROCEDURE informacion(IN e INT)
BEGIN 
	DECLARE totalpartidos,ganados INT;
	SET totalpartidos=(SELECT COUNT(*) FROM PARTIDOS WHERE elocal=e OR evisit=e);
	SET ganados=victorias(e);
	
	SELECT nombre,ganados AS PG,totalpartidos-ganados AS PPerdidos,anotados(e),puntos_contra(e)
	FROM Equipos 
	WHERE e=id_equipo;
	
END $$
DELIMITER ;

CALL informacion(1);