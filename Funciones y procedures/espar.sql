
DROP PROCEDURE IF EXISTS espar;

DELIMITER $$

CREATE FUNCTION espar(numero INT) RETURNS INT 
BEGIN 
	DECLARE par INT;
	IF MOD(numero,2)=0 THEN 
		SET par=TRUE; -- O PONER 1, TRUE=1
	ELSE 
		SET par=FALSE; -- O PONER 0, FALSE=0
	END IF;
	RETURN(par);
END $$

DELIMITER ; 