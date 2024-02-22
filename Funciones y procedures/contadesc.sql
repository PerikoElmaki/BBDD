-- Procedimiento qie muestre la cuenta de num pasado por param hasta 0 
DELIMITER $$ 
DROP PROCEDURE IF EXISTS contadesc $$
CREATE PROCEDURE contadesc(num INT) 
BEGIN 
	IF num<0  THEN     -- Avisamos si num es negativo 
		SELECT "introduce un numero positivo" AS aviso;
	END IF;
	WHILE num>0 DO 
		SELECT num AS "Cuenta descendente";
		SET num=num-1;
	END WHILE;
END $$
DELIMITER ;