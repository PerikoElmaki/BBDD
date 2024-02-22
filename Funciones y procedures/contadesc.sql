-- Procedimiento qie muestre la cuenta de num pasado por param hasta 0 
DELIMITER $$ 
DROP PROCEDURE IF EXISTS contadesc $$
CREATE PROCEDURE contadesc(num INT) 
BEGIN 
	WHILE num>0 DO 
		SELECT num;
		SET num=num-1;
	END WHILE;
END $$
DELIMITER ;