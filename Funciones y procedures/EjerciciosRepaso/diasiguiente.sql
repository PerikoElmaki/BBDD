/*Escribe un procedimiento que reciba como parámetros el día, mes y año de una fecha, y si la fecha es
correcta, muestre por pantalla la fecha del día siguiente (sin años bisiestos).*/
DELIMITER $$
DROP PROCEDURE IF EXISTS nextday $$
CREATE PROCEDURE  nextday(d INT,m INT,a INT) 
BEGIN 
	DECLARE diasmes INT;
	IF fechaOK(d,m,a)=0 THEN 
		SELECT "introduce fecha correcta" AS nextday;
	ELSE 
		IF m=2 THEN 
			SET diasmes=28;
		END IF;
	
		IF m IN(4,6,9,11) THEN 
			SET diasmes=30;
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
			IF a=0 THEN 
				SET a=1;
			END IF;
		END IF;
		
	END IF;
	
	SELECT CONCAT(d,"/",m,"/",a) AS nextday;
END $$
DELIMITER ; 

CALL nextday(31,12,-1);