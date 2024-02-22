/* LOS BUCLES COMO WHILE Y DO WHILE */

-- Con REPEAT ...UNTIL (do while)
DELIMITER $$
DROP PROCEDURE IF EXISTS contar10repeat $$ 

CREATE PROCEDURE contar10repeat()
BEGIN 
	DECLARE num INT;
	SET num=0;
	REPEAT 
		SET num=num+1;
		SELECT num;    -- como el print 
	UNTIL num>=10   -- condicion al final   -- IMPORTANTE NO PONER ;  en until 
	END REPEAT;
END $$

DELIMITER ;

-- CON WHILE 
DELIMITER $$

DROP PROCEDURE IF EXISTS contar10while $$
CREATE PROCEDURE contar10while()
BEGIN 
	DECLARE num INT;
	SET num=1;
	WHILE num<=10 DO 
		SELECT num;
		SET num=num+1;
	END WHILE;
END $$

DELIMITER ; 

-- CONTAR 10 hasta 1 

DELIMITER $$
DROP PROCEDURE IF EXISTS contar1al10repeat $$
CREATE PROCEDURE contar1al10repeat()
BEGIN 
	DECLARE num INT;
	SET num=10;
	REPEAT 
		SELECT num;
		SET num=num-1;
	UNTIL num<=0
	END REPEAT;
END $$

DELIMITER ;


-- COn while 
DELIMITER $$
DROP PROCEDURE IF EXISTS contar1al10while $$
CREATE PROCEDURE contar1al10while()
BEGIN
	DECLARE num INT;
	SET num=10;
	WHILE num>=0 DO
		SELECT num;
		SET num=num-1;
	END WHILE;
END $$
DELIMITER ;
