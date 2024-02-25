DELIMITER $$ 
DROP FUNCTION IF EXISTS diasemana $$
CREATE FUNCTION diasemana(dia INT) RETURNS VARCHAR(10)
BEGIN 
	CASE dia
     WHEN 1 THEN RETURN 'Lunes';
     WHEN 2 THEN RETURN 'Martes';
     WHEN 3 THEN RETURN 'Miércoles';
     WHEN 4 THEN RETURN 'Jueves';
     WHEN 5 THEN RETURN 'Viernes';
     WHEN 6 THEN RETURN 'Sábado';
     WHEN 7 THEN RETURN 'Domingo';
     ELSE RETURN 'Valor no válido';
	 END CASE;
END $$
DELIMITER ;

SELECT diasemana(5);
SELECT diasemana(3);