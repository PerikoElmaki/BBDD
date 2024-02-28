/*Funcion que devuelva el mayor divisor de un num int */
DELIMITER $$
DROP FUNCTION IF EXISTS mayordiv $$
CREATE FUNCTION mayordiv(n INT) RETURNS INT 
BEGIN 
	DECLARE mayor INT;
	DECLARE i INT DEFAULT 0;
	WHILE i<n DO 
		IF MOD(n,i)=0 THEN 
			SET mayor=i;
		END IF;
		SET i=i+1;
	END WHILE;
	RETURN mayor;
END $$
DELIMITER ;

SELECT mayordiv(6);
SELECT mayordiv(15);
SELECT mayordiv(23);