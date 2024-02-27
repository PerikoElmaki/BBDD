/*una función que reciba como parámetros el día, mes y año de una fecha, e indique si la
fecha es correcta*/

DELIMITER $$ 
DROP FUNCTION  IF EXISTS fechaOK $$
CREATE FUNCTION fechaOK(d INT, m INT,a INT) RETURNS BOOLEAN 
BEGIN 
	IF a=0 THEN -- Controlamos años 
		RETURN FALSE;
	END IF;
	
	IF (m<1 OR m>12) THEN  -- Que los meses estén en rango 
		RETURN FALSE;
	END IF;
	 
	IF d>0 THEN -- Dias mayor que 0
		IF m IN(4,6,9,11) THEN  -- Meses de 30 dias 
			IF d<31 THEN 
				RETURN TRUE;
			ELSE 
				RETURN FALSE;
			END IF;
		ELSEIF m=2 THEN  -- Febrero 
			IF d<29 THEN 
				RETURN TRUE;
			ELSE 
				RETURN FALSE;
			END IF;
		ELSE 
			IF d<32 THEN 
				RETURN TRUE;
			ELSE 
				RETURN FALSE;
			END IF;
		END IF;
	ELSE 
		RETURN FALSE;
	END IF;
END $$
DELIMITER ;

select fechaOK(29,2,2001);
select fechaOK(32,1,2001);
select fechaOK(25,12,2001);
