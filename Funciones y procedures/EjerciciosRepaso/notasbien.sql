/*notas*/
DELIMITER $$
DROP PROCEDURE IF EXISTS nota $$
CREATE PROCEDURE nota(n FLOAT) 
BEGIN 
	CASE 
		WHEN n<5 THEN SELECT "SUSPENSO" AS nota;
		WHEN n<6 THEN SELECT "APROBADO" AS nota;
		WHEN n<7 THEN SELECT "BIEN" AS nota;
		WHEN n<9 THEN SELECT "NOTABLE" AS nota;
		WHEN n<10 THEN SELECT "SOBRESALIENTE" AS nota;
		ELSE SELECT "nota no valida" AS nota;
	END CASE;
END $$
DELIMITER ;

CALL nota(7.5);