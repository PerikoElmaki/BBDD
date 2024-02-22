#--1. Datos de los equipos cuya ciudad no empiece por ‘M’.
SELECT * 
FROM EQUIPOS 
WHERE ciudad NOT LIKE "M%";

#--2. Datos del jugador mejor pagado.
SELECT * 
FROM Jugadores 
WHERE salario >= ALL(SELECT salario FROM Jugadores);


#--3. Identificador de equipo y suma de las alturas de sus jugadores.
SELECT equipo, SUM(altura) AS "Suma de las alturas"
FROM Jugadores
GROUP BY equipo;
#--4. Obtener el salario total de cada equipo.
SELECT equipo, SUM(salario) AS "Salario total "
FROM Jugadores
GROUP BY equipo
ORDER BY SUM(salario) DESC;

#--5. Mostrar el mayor salario total de entre todos los equipos.
SELECT equipo, SUM(salario) AS "Mayor Salario total "
FROM Jugadores
GROUP BY equipo
HAVING SUM(salario) >= ALL(SELECT SUM(salario) FROM Jugadores GROUP BY equipo);

#--6. Número de partidos que ha jugado el equipo 3 como local.
SELECT COUNT(*) AS "Nº local 3"
FROM partidos 
WHERE elocal=3;
#--7. Número de partidos que ha jugado el Valencia como local.
SELECT COUNT(*) AS "Nº de partidos como local del Valencia" 
FROM PArtidos 
WHERE elocal = (SELECT id_equipo FROM equipos WHERE nombre LIKE "%Valencia%");
#--8. Nombre y apellido de los jugadores del Madrid.
SELECT CONCAT(nombre,"-",apellido) AS "Nombre de los jugadores del Madrid"
FROM Jugadores
WHERE equipo=(SELECT id_equipo FROM equipos WHERE nombre LIKE "%Madrid%");
#--9. Nombre y apellido de los capitanes.
SELECT nombre, apellido
FROM Jugadores 
WHERE id_jugador IN (SELECT id_capitan FROM Jugadores);
#--10. Identificador de los equipos con más de tres jugadores registrados.
SELECT equipo, COUNT(*) AS "Numero de jugadores "
FROM Jugadores 
GROUP BY equipo 
HAVING COUNT(*) > 3; 
