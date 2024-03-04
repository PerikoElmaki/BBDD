-- Fecha con 0, utilizando el isvalid, decir si es pasado, oresente
DELIMITER $$
DROP PROCEDURE IF EXISTS tiempo $$
CREATE PROCEDURE tiempo(d INT,m INT,a INT) 
BEGIN 
	DECLARE fecha VARCHAR(10);
	
	IF fechaOki(d,m,a)=FALSE THEN 
		IF d<10 AND m<10 THEN
			SET fecha=CONCAT(0,d,'/',0,m,'/',a);
		ELSE 
			IF d<10 THEN 
				SET fecha=CONCAT(0,d,'/',m,'/',a);
			ELSEIF m<10 THEN 
				SET fecha=CONCAT(d,'/',0,m,'/',a);
			ELSE 
				SET fecha=CONCAT(d,'/',0,m,'/',a);	
		END IF;
		SELECT fecha AS fecha_incorrecta;
	ELSE 
		IF d<10 AND m<10 THEN
			SET fecha=CONCAT(0,d,'/',0,m,'/',a);
		ELSE 
			IF d<10 THEN 
				SET fecha=CONCAT(0,d,'/',m,'/',a);
			ELSEIF m<10 THEN 
				SET fecha=CONCAT(d,'/',0,m,'/',a);
			ELSE 
				SET fecha=CONCAT(d,'/',0,m,'/',a);	
		END IF;
		
	END IF;

END $$
DELIMITER ;