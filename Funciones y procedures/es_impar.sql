/* Primera función */
DELIMITER $$

CREATE FUNCTION es_impar(numero INT) RETURNS INT  -- Indica el tipo de dato que va a devolver, VA CON S, RETURNS 
BEGIN
	DECLARE impar INT;    -- Declaracion de variable 
	IF MOD(numero,2)=0 THEN   -- El mod(módulo) como en Java if(numero%2==0) || IMPORTANTE AQUI SOLO UN =
		SET impar=FALSE;
	ELSE
		SET impar=TRUE;
	END IF;  				-- Indicamos el final del IF, como un } 
	RETURN(impar);    -- Indicamos el dato que devuelve, SIN S, RETURN 
END $$                
-- FIN de procedimiento 

DELIMITER ;


/* Para trabajar con variables en consola se declaran asi  */
SET @valor=es_impar(25);
SELECT @valor;