/*procedimiento que muestre la suma de los primeros n números enteros, siendo n un
parámetro de entrada.*/
DELIMITER $$
DROP PROCEDURE IF EXISTS sumanum $$
CREATE PROCEDURE sumanum(num INT)
BEGIN 
	DECLARE conta INT;
	DECLARE suma INT;
	SET conta=0;
	SET suma=0;
	WHILE conta<num DO
		SET conta=conta+1;
		SET suma=suma+conta;
	END WHILE;
	SELECT CONCAT(suma,CONCAT(" es la suma de 1 hasta ",num)) AS resultado;
	
END $$
DELIMITER ;

CALL sumanum(100);