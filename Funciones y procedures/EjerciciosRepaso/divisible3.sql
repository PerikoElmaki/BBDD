/*función que devuelva 1 ó 0 si un número es divisible por otro.*/
DELIMITER $$ 
DROP FUNCTION IF EXISTS divisible $$
CREATE FUNCTION divisible(num1 INT,num2 INT) RETURNS BOOLEAN
BEGIN 
	IF MOD(num1,num2)=0 THEN 
		RETURN TRUE;
	ELSE 
		RETURN FALSE;
	END IF;
END $$
DELIMITER ;

SELECT divisible(15,2);