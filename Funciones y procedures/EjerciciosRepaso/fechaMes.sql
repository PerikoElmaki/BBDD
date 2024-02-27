/*la fecha actual del sistema, de forma que para el
mes se indique su nombre.*/
DELIMITER $$
DROP PROCEDURE IF EXISTS fechaAct $$
CREATE PROCEDURE fechaAct()
BEGIN 
	DECLARE d INT DEFAULT day(CURRENT_DATE());
	DECLARE a INT DEFAULT year(CURRENT_DATE());
	DECLARE mes VARCHAR(10);
	DECLARE m INT DEFAULT month(CURRENT_DATE());
	
	CASE m 
		WHEN 1 THEN SET mes="Enero";
		WHEN 2 THEN SET mes="Febrero";
		WHEN 3 THEN SET mes="Marzo";
		WHEN 4 THEN SET mes="Abril";
		WHEN 5 THEN SET mes="Mayo";
		WHEN 6 THEN SET mes="Junio";
		WHEN 7 THEN SET mes="Julio";
		WHEN 8 THEN SET mes="Agosto";
		WHEN 9 THEN SET mes="Septiembre";
		WHEN 10 THEN SET mes="Octubre";
		WHEN 11 THEN SET mes="Noviembre";
		WHEN 12 THEN SET mes="Diciembre";
	END CASE;
	
	SELECT CONCAT(d," de ",mes," de ",a) AS fecha_hoy;
END $$
DELIMITER ;