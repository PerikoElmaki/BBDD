/* un procedimiento que reciba como parámetro de entrada un número (de tipo float) que
represente el valor de la nota de un alumno,
-[0, 5) = Insuficiente
• [5, 6) = Aprobado
• [6, 7) = Bien
• [7, 9) = Notable
• [9, 10] = Sobresaliente
• En cualquier otro caso, la nota no será válida */

DELIMITER $$
DROP PROCEDURE IF EXISTS nota $$
CREATE PROCEDURE nota(num FLOAT)
BEGIN 
	CASE 
	WHEN num<4.99 THEN SELECT CONCAT(num," es insuficiente") AS nota;
	WHEN num<5.99 THEN SELECT CONCAT(num," es un aprobado") AS nota;
	WHEN num<6.99 THEN SELECT CONCAT(num," es Bien") AS nota;
	WHEN num<8.99 THEN SELECT CONCAT(num," es un notable ") AS nota;
	WHEN num<=10.00 THEN SELECT CONCAT(num," es un SOBRESALIENTE LOCO") AS nota;
	ELSE SELECT "No es una nota válida" AS aviso;
	END CASE;
END $$
DELIMITER ;