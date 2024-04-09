/*6. Crea una función que indique el total de puntos en contra (o recibidos) de un equipo. La función
recibirá como parámetro el identificador del equipo.*/
DELIMITER $$
DROP FUNCTION IF EXISTS puntos_contra $$
CREATE FUNCTION puntos_contra(equipo INT) RETURNS INT 
BEGIN 
	  DECLARE encontraL, encontraV INT;
	  SET encontraL=(SELECT SUM(puntosV)
					FROM Partidos 
					WHERE elocal=equipo);
					
	  SET encontraV=(SELECT SUM(puntosL)
					FROM Partidos 
					WHERE evisit=equipo);
					
	RETURN IFNULL(encontraL,0)+IFNULL(encontraV,0);
END $$
DELIMITER ; 

SELECT puntos_contra(1);