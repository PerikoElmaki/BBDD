#--SUBCONSULTAS

#--Datos de los jugadores cuyo salario sea mayor que el de LLul
SELECT *
FROM jugadores
WHERE salario > (SELECT salario 
				 FROM jugadores
				 WHERE apellido='Llull');  #--Hacemos esa consulta dentro de la princi

#--Mostrar nombre,apellido y altura de los jugadores que midan igual que Alberto Diaz
SELECT nombre,apellido,altura
FROM jugadores
WHERE altura = (SELECT altura 
				FROM jugadores 
				WHERE nombre='Alberto' AND apellido='Diaz');

#--Mostrar el nombre y apellido de jugadores 
#--que jueguen en la misma posición que Llull
SELECT nombre, apellido
FROM jugadores
WHERE puesto = (SELECT puesto 
				FROM jugadores
				WHERE nombre='Sergio' AND apellido='Llull')
AND NOT(nombre='Sergio' AND apellido='Llull') #--Para que no salga Llull
AND salario>80000; #--Y que su sueldo sea mayor que 80k

#--Mostrar nombre y apellido de los compañeros de equipo de Rudy Fernandez
SELECT nombre, apellido, equipo
FROM jugadores
WHERE equipo = (SELECT equipo 
				FROM jugadores 
				WHERE nombre='Rudy' AND apellido='Fernandez')
AND NOT(nombre='Rudy' AND apellido='Fernandez');
				
#--Nombre, apellido y sueldo de jugadores 
#--Que cobren menos que el salario medio de la liga
SELECT nombre, apellido, salario
FROM jugadores
WHERE salario < (SELECT AVG(salario) 
				 FROM jugadores);
				 

#--Obtener nombre apellido y sueldo de jugador que más cobra
SELECT nombre, apellido, salario
FROM jugadores
WHERE salario = (SELECT MAX(salario)
				 FROM jugadores);



#--CUALIFICADOR -----ALL------
#--Condición sobre TODOS los atributos de subconsulta

#--Nombre de los jugadores que ganen más que TODOS los del equipo 3
SELECT nombre
FROM jugadores
WHERE salario > ALL (SELECT salario 
					 FROM jugadores 
					 WHERE equipo=3);
					 

#--CUALIFICADOR-----ANY/SOME-----
#--Condicion se cumple si alguino de los valores de subconsulta coincide

#--Nombre y salario de jugadores que ganen más que alguno del equipo 2
SELECT nombre, apellido, salario
FROM jugadores
WHERE salario> ANY (SELECT salario 
					FROM jugadores
					WHERE equipo=2);
					
#--CON el IN, datos jugadores que midan lo mismo que alguno del equipo 6
#--INcluida//Lo mismo que ANY 
SELECT * 
FROM Jugadores 
WHERE altura IN (SELECT altura 
				FROM Jugadores 
				WHERE equipo=6);
				
#--Datos de los jugadores que midan lo mismo que alguno del equipo 6 
#--(sin incluir a los jugadores del equipo 6):
SELECT *
FROM jugadores
WHERE equipo!=6 AND altura IN (SELECT altura
								FROM jugadores
								WHERE equipo=6);
#--El distinto se puede poner != o <>