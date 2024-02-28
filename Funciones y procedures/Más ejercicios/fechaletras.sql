/*procedimiento que muestre por pantalla la fecha actual del sistema,
formato 4 de abril de 2022*/
DELIMITER $$
DROP PROCEDURE IF EXISTS fechaLetras $$
CREATE PROCEDURE fechaLetras() 
BEGIN 
	DECLARE mes VARCHAR(10);
	CASE month(CURRENT_DATE())
	WHEN 1 THEN SET mes="enero";
	WHEN 2 THEN SET mes="febrero";
	WHEN 3 THEN SET mes="marzo";
	WHEN 4 THEN SET mes="abril";
	WHEN 5 THEN SET mes="mayo";
	WHEN 6 THEN SET mes="junio";
	WHEN 7 THEN SET mes="julio";
	WHEN 8 THEN SET mes="agosto";
	WHEN 9 THEN SET mes="septiembre";
	WHEN 10 THEN SET mes="octubre";
	WHEN 11 THEN SET mes="noviembre";
	WHEN 12 THEN SET mes="diciembre";
	END CASE;
	SELECT CONCAT(day(CURRENT_DATE())," de ",mes," de ",year(CURRENT_DATE())) AS FECHA;
END $$
DELIMITER ;