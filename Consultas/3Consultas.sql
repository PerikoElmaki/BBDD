#--Explica el group by, para juntar atributos iguale en tabla

#--Esto cuenta nº jugadores de los equipos, agrupandolos por cada equipo
SELECT equipo, COUNT(*) AS "Nº jugadores"
FROM jugadores
GROUP BY equipo; 		

#--Cuantos Jugadores hay por puesto
SELECT puesto, COUNT(*) AS "Nº jugadores"
FROM jugadores
GROUP BY puesto;

#--Cuantos jugadores son del equipo 2?
SELECT COUNT(*) AS "Número de jugadores"
FROM jugadores
WHERE equipo=2;

#--Cuantos partidos ha jugado el equipo 6 como visitante
SELECT COUNT(evisit) AS "Numero de partidos del equipo 6 visitante"
FROM partidos
WHERE evisit=6;

#--Seleccionar el salario mínimo y máximo de los jugadores agrupados por equipo
SELECT equipo, MIN(salario) AS "Salario minimo", MAX(salario) AS "Salario maximo"
FROM jugadores
GROUP BY equipo;


#--HAVING para poner condiciones sobre el GROUP

#--Seleccionar salario medio de cada equipo, solo para aquellos cuya media sea mayor a 80000
SELECT equipo, AVG(salario) AS "Salario medio"
FROM jugadores
GROUP BY equipo
HAVING AVG(salario) > 80000;

#--Mostrar el identificador de equipo y salario total de cada equip para equipos con menos de 4 jugadores
SELECT equipo, SUM(salario) AS "Salario total"
FROM jugadores
GROUP BY equipo 
HAVING COUNT(*) < 4; #--Cuenta nº de jugadores de la tabla, no hace falta decir atributo

#--Seleccionar la altura máxima de los jugadores por puesto
SELECT puesto, MAX(altura) AS AM
FROM jugadores
GROUP BY puesto;
#--Pero solo para los puestos donde la altura media supere los 2metros
SELECT puesto, MAX(altura) AS AM
FROM jugadores
GROUP BY puesto
HAVING AVG(altura) > 2; #--Condición de grupo, nunca el WHERE

#--Seleccionar el salario medio de cada puesto, pero 
#--solo para aquellos puestos cuyo salario medio sea superior a 95000
SELECT puesto, AVG(salario) AS "Salario Medio"
FROM jugadores
GROUP BY puesto
HAVING AVG(salario) > 95000;