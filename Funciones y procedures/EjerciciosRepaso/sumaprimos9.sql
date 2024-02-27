/*Usando la función anterior, implementa un procedimiento que sume los primeros m números primos
empezando en el 1.*/
DELIMITER $$
DROP PROCEDURE IF EXISTS sumaprimos $$
CREATE PROCEDURE sumaprimos(num INT) 
BEGIN 
	DECLARE suma INT DEFAULT 0;
    DECLARE conta INT DEFAULT 1;

	WHILE conta<num DO
		IF esprimo(conta)=1 THEN 
			SET suma=suma+conta;
		END IF;
		SET conta=conta+1;
	END WHILE;
	SELECT CONCAT(suma," es la suma de los primos hasta ",num) AS sumaprimos;
END $$
DELIMITER ;