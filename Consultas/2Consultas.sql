
SELECT CONCAT(day(NOW()),"/", month(NOW()),"/", year(NOW()));
#--Tiene que estar definido como un date, pueden sre fechas de la tabla


#--IN, OR, BETWEEN, LIKE, QUE EMPIECE O ACABE CON LETRA...


#--Puntos metidos por el equipo local en partidos jugados en enero 2018
SELECT puntosL AS "Puntos partidos enero" 
FROM Partidos
WHERE year(fecha)=2018 AND month(fecha)=1;



#--Buscar características, los nombres de pabellon nulos
SELECT nombre 
FROM equipos
WHERE pabellon IS NULL;

#--Cuando NO tenga esa características
SELECT nombre 
FROM equipos
WHERE pabellon IS NOT NULL;

#--Nombre y puesto de los jugadores que no sean base:
SELECT nombre, puesto
FROM jugadores
WHERE NOT puesto="base";

#--Nombre y puesto de los que sean base O escolta
SELECT nombre, puesto
FROM jugadores
WHERE puesto="base" OR puesto="escolta";

#--Forma mas rapida con el IN, para mostrar base O escolta
SELECT nombre, puesto
FROM jugadores
WHERE puesto IN ("base", "escolta");

#--Los que NO sean, poner un NOT delante
SELECT nombre, puesto
FROM jugadores
WHERE NOT (puesto="base" OR puesto="escolta");

#--Con el IN
SELECT nombre,puesto
FROM jugadores
WHERE puesto NOT IN ("base", "escolta");

#--Obtener los datos de los equipos Menos los de Valencia y Madrid
SELECT *
FROM equipos
WHERE ciudad NOT IN ('Valencia', 'Madrid');

#--Nombre de los jugadores de los equipos 1 y 2 que jueguen como pivot
SELECT nombre 
FROM jugadores
WHERE puesto IN ("pivot") AND equipo IN (1,2);

#--Datos de los partidos de Enero de 2018
SELECT *
FROM partidos
WHERE month(fecha)=1 AND year(fecha)=2018;

#--Datos del primer trimestre de partidos
SELECT *
FROM partidos
WHERE month(fecha) BETWEEN 1 AND 3; 

#--Otra forma de trimestre
SELECT *
FROM partidos
WHERE month(fecha) IN(1,2,3) AND year(fecha)=2018:

#--Partidos Segunda quincena de enero
SELECT *
FROM Partidos
WHERE month(fecha) IN(1) AND day(fecha) BETWEEN 16 AND 31; 

#--O
SELECT *
FROM Partidos
WHERE month(fecha) IN(1) AND day(fecha)>15; 



#--PARA CONSULTAS CON STRING, USAMOS LIKE


#--ALGO QUE EMPIECE POR J= "J% "
SELECT nombre
FROM jugadores
WHERE nombre LIKE "J%";

#--QUE TERMINE CON E= "%e"
SELECT apellido AS "Apellidos termina con E"
FROM jugadores
WHERE apellido LIKE "%e";

#--QUE CONTENGA LA LETRA i= "%i%"
SELECT nombre
FROM jugadores
WHERE nombre LIKE "%i%";

#--QUE SU TERCERA LETRA SEA LA a= "__a%"
SELECT nombre
FROM jugadores
WHERE nombre LIKE "___a%";

#--NOMBRES DE 5 LETRAS= "_____" 
SELECT nombre
FROM jugadores
WHERE nombre LIKE "_____";

#--SU PENULTIMA LETRA SEA i%= "%i_"
SELECT nombre
FROM jugadores
WHERE nombre LIKE "%i_";




#--FUNCIONES DE AGREGADO

EL COUNT ES PARA CONTAR Nº FILAS DE TABLA 

#--Visualiza el nº total de jugadores registrados en base de dats
SELECT COUNT(*) AS "Nº jugadores registrados"
FROM jugadores;

#--Número de jugadores que miden más de dos metros
SELECT COUNT(*) AS "Jugadores de más de 2 metros"
FROM jugadores
WHERE altura > 2.00;

#--Calcular el número de jugadores que son pivots
SELECT COUNT(*) AS "Jugadores pivot"
FROM jugadores
WHERE puesto="pivot";

#--Nº de ciudades en las que hay equipos
SELECT COUNT(DISTINCT ciudad) AS "Ciudades en las que hay equipos"
FROM equipos; #--Distinct para que no repite madrid que hay dos equipos


#--LA MEDIA SE PUEDE CALCULAR CON FUNCION AVG


#--Calcular salario medio de todos los jugadores
SELECT AVG(salario) AS "Salario Medio"
FROM jugadores;

#--Altura media de los jugadores del equipo 1
SELECT AVG(altura) AS "Media de altura de equipo 1"
FROM jugadores
WHERE equipo=1;


#--EL MAXIMO VALOR SE CALCULA CON MAX, MIN EL MENOR

#--Encontrar el salario más alto, bajo y la diferencia entre ambos
SELECT MAX(salario) AS "Salario máximo",
	   MIN(salario) AS "salario más bajo",
	   MAX(salario) - MIN(salario) AS "diferencia"   
FROM jugadores;

#--LA SUMA DE TODOS LOS VALORES CON SUM

#--Suma del total del salario del equipo 1
SELECT SUM(salario) AS "Total salario"
FROM jugadores
WHERE equipo=1;

#--Salario mensual neto de cada jugador, IRPF 18%	
SELECT CONCAT(nombre,"-",salario*0.82/12) AS "Salario mensual"
FROM jugadores;

#--