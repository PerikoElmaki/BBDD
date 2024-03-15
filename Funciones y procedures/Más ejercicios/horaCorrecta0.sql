/*PRocedimiento que imprima la hora con 0, y diga el min despues*/
DELIMITER $$
DROP PROCEDURE IF EXISTS hora $$
CREATE PROCEDURE hora(h INT,m INT,s INT)
BEGIN
	DECLARE horamin VARCHAR(10);
	IF h<10 THEN 
		SET horamin=CONCAT(0,h,':');
	ELSE 
		SET horamin=CONCAT(h,':');
	END IF;
	
	IF m<10 THEN 
		SET  horamin=CONCAT(horamin,0,m,':');
	ELSE
		SET  horamin=CONCAT(horamin,m,':');
	END IF;
	
	IF s<10 THEN 
		SET horamin=CONCAT(horamin,0,s);
	ELSE 
		SET horamin=CONCAT(horamin,s);
	END IF;
	
	IF horaOK(h,m,s)=0 THEN 
		SELECT horamin AS "HOra incorrecta";
	ELSE 
		SELECT horamin AS "Hora correcta";
	END IF;
END $$
DELIMITER ;

CALL hora(3,5,2);
CALL hora(23,4,59);

