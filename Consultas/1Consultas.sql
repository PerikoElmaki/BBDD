USE ligabasket;
Consulta de nombre apellido y posición de la tabla jugadores.

#--ABAJO ESTÁ EL YEAR Y FECHAS 
SELECT nombre, apellido, puesto 
FROM jugadores
ORDER BY apellido;  #--Para ordenar afabeticamente lo que opedimos en base a ese campo

SELECT nombre, apellido, puesto AS posicion #--Cambia nombre de puesto
FROM jugadores
ORDER BY puesto, nombre;

SELECT nombre, apellido, puesto AS posicion 
FROM jugadores
ORDER BY puesto, nombre DESC; #--Ordena de la z-a, o num grande a pequeño

SELECT nombre, apellido, altura
FROM jugadores
ORDER BY altura DESC;

SELECT DISTINCT puesto  #--Para que no se dupliquen datos, y de solo puestos distintos
FROM jugadores;

SELECT nombre, apellido, altura
FROM jugadores
ORDER BY altura DESC
LIMIT 1; #--Con esto limitas las tuplas que aparecen, 
#--Para cuando solo queremos saber el más alto

#--Nombre apellido y sueldo del jugador que más cobra
SELECT nombre, apellido, salario
FROM jugadores
ORDER BY salario DESC
LIMIT 1;

#--que diga nombre apell y sueldo neto con IRPF
SELECT CONCAT(nombre," ", apellido) AS jugador, salario*0.82 AS "Sueldo neto"
FROM jugadores;
#--Hemos concatenado nombre y ap, cambiado su nombre, y hacemos ooperacion cambiando nombre
#--Usamos " " para generar espacio



SELECT CURRENT_DATE();  #--Función que te dice la fecha del sistema
SELECT NOW(); #--Para la hora también.
#--Para mostrar solo año o mes
SELECT year(NOW())

#--Primer ejemplo de condicional
SELECT nombre,apellido
FROM jugadores
WHERE puesto="pivot"; #--solo muestra jugadores con puesto pivot

#--Mostrar los datos de los jugadores que no pertenezcan al equipo 3
SELECT *
FROM jugadores
WHERE equipo!=3; #--El distinto tb se puede poner <>

#--Mostrar nombre apellido altura de los jugadores que superan 2.05
SELECT nombre, apellido
FROM jugadores
WHERE altura>2.05;

#--Con más de una condición
SELECT *
FROM jugadores
WHERE puesto="pivot" AND salario>100000;

#--Consultar el atributo "fecha"
#--Si va en formato dias,años o meses:
#--Metemos entre paréntesis

#--Resultados de `partidos con los equipos en 2018
SELECT elocal, CONCAT(puntosL,"-",puntosV) AS "Resultado", evisit
FROM partidos
WHERE year(fecha)=2018;

SELECT puntosL 
FROM partidos
WHERE year(fecha)=2018 AND month(fecha)=1;

