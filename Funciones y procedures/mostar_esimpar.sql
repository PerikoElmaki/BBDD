DELIMITER $$ 
DROP PROCEDURE IF EXISTS mostrar_esimpar $$
CREATE PROCEDURE mostrar_esimpar(IN numero INT) 
BEGIN 
	IF es_impar(numero)=TRUE THEN 
		SELECT CONCAT(numero," es impar");
	ELSE
		SELECT CONCAT(numero," es par");
	END IF;
END $$ 

DELIMITER ;