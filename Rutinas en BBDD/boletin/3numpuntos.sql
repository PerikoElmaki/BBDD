#--3 
DELIMITER $$
DROP FUNCTION IF EXISTS numpuntos $$
CREATE FUNCTION numpuntos(equipo INT) RETURNS INT 
BEGIN 
	DECLARE nvictorias,nempates,total INT;
	SET nvictorias= victorias(equipo);
	
	SET nempates=(SELECT COUNT(*) 
					FROM Partidos 
					WHERE (eqlocal=equipo OR eqvisit=equipo) AND golesL=golesV);
	SET total=(nvictorias*3)+nempates;
	
	RETURN total;
	
END $$
DELIMITER ; 

SELECT numpuntos(1);
SELECT numpuntos(2);
SELECT numpuntos(3);
SELECT numpuntos(4);