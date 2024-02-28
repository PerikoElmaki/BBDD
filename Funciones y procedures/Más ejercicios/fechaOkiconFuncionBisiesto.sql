/*función que reciba como parámetros el día, mes y año de una fecha, e indique si la
fecha es correcta*/
DELIMITER $$
DROP FUNCTION IF EXISTS fechaOki $$
CREATE FUNCTION fechaOki(d INT,m INT,a INT) RETURNS BOOLEAN
BEGIN 
	DECLARE diasmes INT;
	IF a=0 THEN 
		RETURN FALSE;
	END IF;
	
	IF m<1 OR m>12 THEN 
		RETURN FALSE;
	END IF;
	
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
	
	IF d>diasmes THEN 
		RETURN FALSE;
	END IF;
	
	RETURN TRUE;
END $$
DELIMITER ;



SELECT fechaOki(29,2,2001);
SELECT fechaOki(29,2,2000);
SELECT fechaOki(29,2,2006);
SELECT fechaOki(29,2,2020);