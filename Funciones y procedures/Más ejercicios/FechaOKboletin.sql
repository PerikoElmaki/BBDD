DELIMITER $$
DROP FUNCTION IF EXISTS fechaCorrecta $$
CREATE FUNCTION fechaCorrecta(d INT,m INT,a INT) RETURNS BOOLEAN 
BEGIN 
	DECLARE diasmes INT;
	DECLARE esBisiesto BOOLEAN;
	
	IF a=0 THEN 
		RETURN FALSE;
	END IF;
	
	IF m<1 OR m>12 THEN 
		RETURN FALSE;
	END IF; 
	
	IF MOD(a,4)=0 AND (a%400=0 OR a%100!=0) THEN 
		SET esBisiesto=TRUE;
	ELSE 
		SET esBisiesto=FALSE;
	END IF;
	
	IF (m=4 OR m=6 OR m=9 OR m=11) THEN 
		SET diasmes=30;
	ELSEIF m=2 THEN 
		IF esBisiesto=TRUE THEN 
			SET diasmes=29;
		ELSE 
			SET diasmes=28;
		END IF;
	ELSE 
		SET diasmes=31;
	END IF;
	
	IF d<1 OR d>diasmes THEN 
		RETURN FALSE; 
	END IF;
	
	RETURN TRUE;
	
END $$
DELIMITER ;

SELECT fechaCorrecta(29,2,2000);
SELECT fechaCorrecta(29,2,2100);
SELECT fechaCorrecta(29,2,2050);
SELECT fechaCorrecta(31,1,2023);
SELECT fechaCorrecta(31,4,2000);
SELECT fechaCorrecta(10,12,0);
SELECT fechaCorrecta(-2,2,2020);