/*5. Crea una función que indique el total de puntos a favor (o anotados) de un equipo. La función recibirá
como parámetro el identificador del equipo.*/
DELIMITER $$
DROP FUNCTION IF EXISTS anotados $$
CREATE FUNCTION anotados(equipo INT) RETURNS INT 
BEGIN 
	  DECLARE contaL, contaV INT;
	  SET contaL=(SELECT SUM(puntosL)
					FROM Partidos 
					WHERE elocal=equipo);
					
	  SET contaV=(SELECT SUM(puntosV)
					FROM Partidos 
					WHERE evisit=equipo);
					
	RETURN IFNULL(contaL,0)+IFNULL(contaV,0);
END $$
DELIMITER ; 

SELECT anotados(1);

