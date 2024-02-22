-- Imprime numeros impares desde el 0 al 10 

DELIMITER $$ 
DROP PROCEDURE IF EXISTS contaimparesrepeat $$
CREATE PROCEDURE contaimparesrepeat()
BEGIN 
	DECLARE num INT; 
	SET num=0;
	REPEAT 
		SET num=num+1;
		IF MOD(num,2)!=0 THEN 
			SELECT num;
		END IF;
	UNTIL num>=10        -- IMPORTANTE NO PONER ;  
	END REPEAT;
END $$
DELIMITER ;


-- COn el while 
DELIMITER $$ 
DROP PROCEDURE IF EXISTS contaimpareswhile $$
CREATE PROCEDURE contaimpareswhile()
BEGIN 
	DECLARE num INT; 
	SET num=0;
	WHILE num<=10 DO 
		IF MOD(num,2)!=0 THEN 
			SELECT num;
		END IF;
		SET num=num+1;
	END WHILE;
END $$
DELIMITER ;

