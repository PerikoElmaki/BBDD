#--1. Datos de los equipos cuya ciudad no empiece por ‘M’.
SELECT *
FROM Equipos 
WHERE ciudad NOT LIKE "M%";
					 
#--2. Datos del jugador mejor pagado.
SELECT *
FROM Jugadores 
WHERE salario = (SELECT MAX(salario) 
				 FROM Jugadores);
#--2b--
SELECT *
FROM Jugadores 
WHERE salario>= ALL (SELECT salario FROM Jugadores);
				 
#--3. Identificador de equipo y suma de las alturas de sus jugadores.
SELECT equipo, SUM(altura) AS "Suma de las alturas de los jugadores"
FROM Jugadores 
GROUP BY equipo;

#--4. Obtener el salario total de cada equipo.
SELECT equipo, SUM(salario) AS "Salario total de cada equipo"
FROM Jugadores 
GROUP BY equipo;

#--5. Mostrar el mayor salario total de entre todos los equipos.
SELECT equipo, SUM(salario) AS "Mayor salario total"
FROM Jugadores 
GROUP BY equipo 
ORDER BY SUM(salario) DESC 
LIMIT 1;

#--6. Número de partidos que ha jugado el equipo 3 como local.
SELECT COUNT(*) AS "Nº de partidos del equipo 3 como local"
FROM Partidos 
WHERE elocal=3;

#--7. Número de partidos que ha jugado el Valencia como local.
SELECT COUNT(*) AS "Nº de partidos del Valencia como local" 
FROM Partidos 
WHERE elocal = (SELECT id_equipo 
				FROM Equipos 
				WHERE nombre LIKE "%Valencia%"); #--Que contenga 'Valencia'

#--8. Nombre y apellido de los jugadores del Madrid.
SELECT nombre, apellido 
FROM Jugadores 
WHERE equipo = (SELECT id_equipo
				FROM Equipos 
				WHERE nombre LIKE "%Madrid%"); #--Que contenga real

#--9. Nombre y apellido de los capitanes.
SELECT nombre, apellido
FROM Jugadores
WHERE id_capitan = id_jugador;
#--La forma bien en teoría
SELECT CONCAT(nombre," ",apellido) AS "Capitanes"
FROM Jugadores 
WHERE id_jugador IN (SELECT id_capitan FROM jugadores);
#--10. Identificador de los equipos con más de tres jugadores registrados.
SELECT equipo 
FROM Jugadores
GROUP BY equipo   
HAVING COUNT(id_jugador) >3;