/*FUncion que devuelve los dias del mes, utilizando año por param  */
DELIMITER $$
DROP FUNCTION IF EXISTS diasmes $$
CREATE FUNCTION diasmes(m INT,a INT) RETURNS INT 
BEGIN 
	DECLARE diasmes INT;
	IF (m=4 OR m=6 OR m=9 OR m=11) THEN 
		SET diasmes=30;
	ELSEIF m=2  THEN
		IF esBisiesto(a)=1 THEN 
			SET diasmes=29;
		ELSE 
			SET diasmes=28;
		END IF;
	ELSE 
		SET diasmes=31;
	END IF;
	
	RETURN diasmes;
END $$
DELIMITER ;

SELECT diasmes(2,2000);
SELECT diasmes(2,2001);
SELECT diasmes(1,2024);