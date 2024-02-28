/*procedimiento que sume los N primeros números pares*/
DELIMITER $$
DROP PROCEDURE IF EXISTS sumapares $$
CREATE PROCEDURE sumapares(n INT)
BEGIN 
	DECLARE suma INT DEFAULT 0;
	DECLARE i INT DEFAULT 0;
	
	WHILE i<=n DO
		IF MOD(i,2)=0 THEN 
			SET suma=suma+i;
		END IF;
		SET i=i+1;
	END WHILE;
	
	SELECT suma AS suma_pares;
END $$
DELIMITER ;

CALL sumapares(100);
CALL sumapares(10);