/** Una funcion que reciba como parametro un año y devuelva
  	1 si se trata de un año bisiesto
	0 si no lo ES
	
	Un año es bisiesto si cumple los siguientes criterios:
	es divisible entre 4
	si termina en 00, es bisiesto si es divisible entre 400
	
	(2000 y 2400 son bisiestros) y (2100 , 2200 y 2300 NO son bisiestos) **/
	
DELIMITER $$

DROP FUNCTION IF EXISTS bisiesto $$

CREATE FUNCTION bisiesto(a INT) RETURNS BOOLEAN
BEGIN 
	IF a%4<>0 THEN
		RETURN FALSE;
	ELSE
		IF a%100=0 THEN
			IF a%400=0 THEN
			RETURN TRUE;
		ELSE
			RETURN FALSE;
		END IF;
	ELSE	
		RETURN TRUE;
		END IF;
	END IF;
END $$

DELIMITER ;