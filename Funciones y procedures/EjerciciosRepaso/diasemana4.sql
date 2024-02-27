DELIMITER $$ 
DROP FUNCTION IF EXISTS diasemana $$
CREATE FUNCTION diasemana(dia INT) RETURNS VARCHAR(10)
BEGIN 
	RETURN CASE dia
		WHEN 1 THEN 'Lunes'
		WHEN 2 THEN 'Martes'
		WHEN 3 THEN 'Miércoles'
		WHEN 4 THEN 'Jueves'
		WHEN 5 THEN 'Viernes'
		WHEN 6 THEN 'Sábado'
		WHEN 7 THEN 'Domingo'
		ELSE 'Valor no válido'
	END;
END $$
DELIMITER ;

SELECT diasemana(5);
SELECT diasemana(3);