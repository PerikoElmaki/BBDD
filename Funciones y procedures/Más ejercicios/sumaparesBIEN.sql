-- Sumar N numeros pares, los N primeros numeros pares 

DELIMITER $$
DROP FUNCTION IF EXISTS sumapares $$
CREATE FUNCTION sumapares(n INT) RETURNS INT 
BEGIN 
	DECLARE suma INT DEFAULT 0;
	DECLARE i INT DEFAULT 2;
	DECLARE contapares INT DEFAULT 0;
	WHILE contapares<n DO 
		SET suma=suma+i;
		SET i=i+2;
		SET contapares=contapares+1;
	END WHILE;
	RETURN suma;
END $$ 
DELIMITER ; 

SELECT sumapares(5);

