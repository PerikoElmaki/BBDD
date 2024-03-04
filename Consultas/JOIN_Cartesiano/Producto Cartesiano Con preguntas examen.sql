#--INTRODUCCIÓN A LOS PRODUCTOS CARTESIANOS O JOIN

#--Combinación de tablas en una consulta

SELECT *
FROM jugadores, equipos;
#--Suma los grados y multiplica la cardinalidad: Jugadores X equipos
#--Muchas filas no son válidas, hay que incluir condición

#--Usamos condición para que no combine todos jugadores con todos equipos
#--Relacionamos cada jugador con su equipo
SELECT * 
FROM jugadores ,equipos
WHERE equipo=id_equipo;

#--Si los dos atributos se llaman igual en las dos tablas, usamos un alias
SELECT *
FROM jugadores AS J, equipos AS E
WHERE J.equipo=E.id_equipo;

#--Nombre, apellido y puesto de jugador junto al nombre de su equipo
SELECT J.nombre, apellido, puesto, E.nombre
FROM jugadores J, equipos E
WHERE J.equipo=E.id_equipo;

#--Número de jugadores de cada equipo, indicando el nombre del equipo: 
SELECT E.nombre, COUNT(*) AS "Numero de jugadores"
FROM equipos E, jugadores J
WHERE J.equipo=E.id_equipo
GROUP BY E.nombre;

#--Numero de jugadores de equipos cuya ciudad empiece por M
SELECT COUNT(*) AS "Numero de jugadores de ciudad empieza por M"
FROM jugadores J, equipos E
WHERE J.equipo=E.id_equipo AND ciudad LIKE "M%";

#--Nombre y apellido de cada jugador con el nombre de su  equipo
SELECT CONCAT(J.nombre," ",apellido) AS Jug, E.nombre AS "Equipo"
FROM jugadores J, equipos E
WHERE J.equipo=E.id_equipo;

#--Nombre de cada equipo y número de partidos jugados como locales 
SELECT E.nombre, COUNT(*) AS "Numero de partidos como local"
FROM equipos E, partidos P
WHERE E.id_equipo=P.elocal
GROUP BY E.nombre;

#--Nombre de cada equipo y el salario máximo entre sus jugadores 
SELECT E.nombre, MAX(salario) AS "Maximo salario del equipo"
FROM equipos E, jugadores J
WHERE E.id_equipo=J.equipo
GROUP BY E.id_equipo;

#--Obtener numero de jugadores que jueguen en equipos de Madrid
SELECT COUNT(*) AS "Numero de jugadores de equipos de Madrid"
FROM Jugadores J, equipos E
WHERE equipo=id_equipo AND E.ciudad LIKE "%Madrid%";#--O ciudad='Madrid'

#--Con el JOIN 
SELECT COUNT(*) AS "Nº de jugadores de Madrid" 
FROM Jugadores J INNER JOIN Equipos E
ON equipo=id_equipo 
WHERE  E.ciudad LIKE "Madrid"; 

#--Nombre de cada equipo junto con el numero de partidos que han jugado como locales
SELECT nombre, COUNT(*) AS "Numero de partidos como local"
FROM Equipos , Partidos 
WHERE id_equipo=elocal 
GROUP BY elocal;

SELECT nombre, COUNT(*) AS "Numero de partidos como local"
FROM Equipos INNER JOIN Partidos 
ON id_equipo=elocal 
GROUP BY elocal;

#-------CUANDO NECESITAMOS DOS O MAS TABLAS------
12. Nombre de los proveedores que suministran por lo menos una pieza roja

SELECT DISTINCT snombre
FROM S,SP,P
WHERE S.sn=SP.sn AND P.pn=SP.pn AND color LIKE 'rojo'  
#--Tenemos que relacionar las tres, las piezas en ambas tablas, y sn para relacionar proveedor 

#--Se podria hacer con subconsulta
SELECT snombre 
FROM S 
WHERE sn IN (SELECT sn 
			 FROM P, SP 
			 WHERE SP.pn=P.pn AND color="rojo");
			 
17. Obtener el nombre y el estado de los proveedores que suministran, al menos, todas las piezas suministradas por el
proveedor S2.

SELECT S.sn,S.snombre,S.estado
FROM S,SP AS sp1, SP AS sp2   #--SP la usas dos veces por eso se renombra dos
WHERE S.sn=sp1.sn AND sp2.sn='S2' AND sp1.pn=sp2.pn 
GROUP BY S.sn,snombre,estado
HAVING COUNT(*)=(SELECT COUNT(*) FROM SP WHERE sn='S2');

19. Obtener el nombre y la ciudad de los proveedores que suministran, al menos, todas las piezas que se almacenan
en la ciudad de Londres.

SELECT S.sn,snombre,S.ciudad
FROM S,SP,P
WHERE S.sn=SP.sn AND P.ciudad='Londres' AND P.pn=SP.pn 
GROUP BY S.sn
HAVING COUNT(*)= (SELECT COUNT(*) FROM P WHERE ciudad='Londres')

15. Obtener los datos de las etapas cuyos puertos (todos) superan los 1300 metros de altura. #--QUE SEAN TODOS mayores de 1300
SELECT DISTINCT E.*
FROM Etapa E, Puerto P
WHERE E.numetapa=P.numetapa AND P.altura>1300 #--Comprobamos que etapa tiene puertos con mas de 1300
AND E.numetapa NOT IN (SELECT numetapa FROM Puerto WHERE altura<=1300) #--Aqui quitamos las que a parte, tengan puertos menores

												