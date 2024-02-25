/*Crea una función que determine si un número es primo devolviendo 0 ó 1.*/
DELIMITER $$
DROP FUNCTION IF EXISTS esprimo $$
CREATE FUNCTION esprimo(num INT) RETURNS BOOLEAN 
BEGIN 
	DECLARE i INT;
	SET i=2;
	
	IF num<i THEN 
		RETURN FALSE;
	END IF;
	
	WHILE i<num DO
		IF num%i=0 THEN 
			RETURN FALSE;
		END IF;
		SET i=i+1;
	END WHILE;
	RETURN TRUE;
END $$
DELIMITER ;