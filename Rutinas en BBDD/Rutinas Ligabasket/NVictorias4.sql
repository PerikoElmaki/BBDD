/*4.Crea una función que indique el número de partidos que ha ganado un equipo. La función recibirá
como parámetro el identificador del equipo.*/
DELIMITER $$
DROP FUNCTION IF EXISTS victorias $$
CREATE FUNCTION victorias(equipo INT) RETURNS INT 
BEGIN 
    DECLARE contaL, contaV INT;
    SET contaL=(SELECT COUNT(*)
                        FROM Partidos 
                        WHERE elocal=equipo AND puntosL>puntosV);
	SET contaV=(SELECT COUNT(*)
                FROM Partidos 
                WHERE evisit=equipo AND puntosV>puntosL);
  
  
  RETURN contaL+contaV;
END $$
DELIMITER ;

SELECT victorias(1);