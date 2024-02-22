DELIMITER $$ 
DROP FUNCTION IF EXISTS totaldiasBis $$
CREATE FUNCTION totaldiasBis(f DATE) RETURNS INT 
BEGIN 
	DECLARE total INT;
	SET total=totaldias(f);
	IF bisiesto(year(f))=1 THEN 
		IF month(f)>2 THEN 
			SET total=total+1;
		END IF;
	END IF;
	RETURN total;
END $$

DELIMITER ; 