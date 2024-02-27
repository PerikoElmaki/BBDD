/*procedimiento que reciba como parámetro un número n y 
muestre su tabla de multiplicar*/
DELIMITER $$
DROP PROCEDURE IF EXISTS tablamulti $$
CREATE PROCEDURE tablamulti(num INT) 
BEGIN 
	DECLARE i INT DEFAULT 1;
	WHILE i<=10 DO 
		SELECT CONCAT(num,"x",i,"=",num*i) AS resultado;
		SET i=i+1;
	END WHILE;
	
END $$
DELIMITER ;