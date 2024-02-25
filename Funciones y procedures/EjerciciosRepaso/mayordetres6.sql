/*Crea una función que devuelva el mayor de tres números pasados como parámetros.*/
DELIMITER $$
DROP FUNCTION IF EXISTS mayorde3 $$
CREATE FUNCTION mayorde3(num1 INT,num2 INT,num3 INT) RETURNS INT 
BEGIN 
	IF num1>num2 THEN 
		IF num1>num3 THEN 
			RETURN num1;
		ELSE 
			RETURN num3;
		END IF;
	ELSE 
		IF num2>num3 THEN 
			RETURN num2;
		ELSE 
			RETURN num3;
		END IF;
	END IF;
END $$
DELIMITER ;

SELECT mayorde3(5,8,3);
SELECT mayorde3(2,10,22);
SELECT mayorde3(5,3,1);