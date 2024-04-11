#--2 
DELIMITER $$
DROP FUNCTION IF EXISTS victorias $$
CREATE FUNCTION victorias(equipo INT) RETURNS INT 
BEGIN 
	DECLARE contaL, contaV INT;
    SET contaL=(SELECT COUNT(*)
                        FROM Partidos 
                        WHERE eqlocal=equipo AND golesL>golesV);
	SET contaV=(SELECT COUNT(*)
                FROM Partidos 
                WHERE eqvisit=equipo AND golesV>golesL);
	
	RETURN contaL+contaV;
END $$
DELIMITER ;

SELECT victorias(1);
SELECT victorias(2);
SELECT victorias(3);
SELECT victorias(4);
