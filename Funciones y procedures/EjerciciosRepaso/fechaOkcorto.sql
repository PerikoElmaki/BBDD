-- fechaOK corto 

DELIMITER $$ 
DROP FUNCTION  IF EXISTS fechaOK $$
CREATE FUNCTION fechaOK(d INT, m INT,a INT) RETURNS BOOLEAN 
BEGIN 
	DECLARE diasmes INT;
	IF a=0 THEN -- Controlamos años 
		RETURN FALSE;
	END IF;
	
	IF (m<1 OR m>12) THEN  -- Que los meses estén en rango 
		RETURN FALSE;
	END IF;
	
	SET diasmes=31;
	
	IF m=2 THEN 
		SET diasmes=28;
	END IF;
	
	IF m IN(4,6,9,11) THEN 
		SET diasmes=30;
	END IF;
	
	
	IF (d<1 OR d>diasmes) THEN 
		RETURN FALSE;
	END IF;
	
	-- SI no ha fallado nada 
	RETURN TRUE;
	
END $$
DELIMITER ;

