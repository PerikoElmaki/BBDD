/*Mostrar dia siguiente de fecha parámetro*/
DELIMITER $$
DROP PROCEDURE IF EXISTS diasig $$
CREATE PROCEDURE diasig(d INT,m INT,a INT)
BEGIN 
	DECLARE diasmes INT;
	
	IF fechaOki(d,m,a)=0 THEN 
		SELECT "fecha introducida incorrecta" AS ERROR;
	ELSE
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
		
		SET d=d+1;
		
		IF d>diasmes THEN 
			SET d=1;
			SET m=m+1;
		END IF;
		
		IF m>12 THEN 
			SET m=1;
			SET a=a+1;
		END IF; 
		
		
		SELECT CONCAT(d,"/",m,"/",a) AS dia_siguiente;
	END IF;
END $$
DELIMITER ;

CALL diasig(28,2,2024);
CALL diasig(28,2,2023);