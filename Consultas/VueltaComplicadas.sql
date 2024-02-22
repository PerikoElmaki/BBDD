DE LA VUELTA CONSULTAS COMPLICADAS 

15. Obtener los datos de las etapas cuyos puertos (todos) superan los 1300 metros de altura. #--QUE SEAN TODOS mayores de 1300

SELECT DISTINCT E.*
FROM Etapa E, Puerto P
WHERE E.numetapa=P.numetapa AND P.altura>1300 #--Comprobamos que etapa tiene puertos con mas de 1300
AND E.numetapa NOT IN (SELECT numetapa FROM Puerto WHERE altura<=1300) #--Aqui quitamos las que a parte, tengan puertos menores

23. Nombre de los equipos que no han llevado el maillot amarillo.

SELECT DISTINCT nomequipo
FROM Equipo
WHERE nomequipo NOT IN (SELECT DISTINCT nomequipo
						FROM Ciclista C,Lleva L,Maillot M
						WHERE L.código=M.código AND L.dorsal=C.dorsal AND color='amarillo')
						
26. Nombre de los equipos que sólo tienen ciclistas menores de 28 años.

SELECT nomequipo
FROM Equipo 
WHERE nomequipo IN(SELECT nomequipo FROM Ciclista WHERE edad<28)
AND nomequipo NOT IN(SELECT nomequipo FROM Ciclista WHERE edad >=28)

27. Dorsal y nombre del ciclista que ha llevado el maillot amarillo durante más etapas.

SELECT TOP(1) dorsal, nombre
FROM Ciclista AS C, Lleva AS L, Maillot AS M
WHERE C.dorsal=L.dorsal AND M.código=L.código AND M.color='amarillo'
GROUP BY C.dorsal, C.nombre
ORDER BY COUNT(*) DESC;

#--Con ALL:

SELECT C.dorsal, C.nombre
FROM Ciclista AS C, Lleva AS L, Maillot AS M
WHERE C.dorsal=L.dorsal AND M.código=L.código AND M.color='amarillo'
GROUP BY C.dorsal, C.nombre
HAVING COUNT(*) >= ALL ( SELECT COUNT(*) AS veces
FROM Lleva LL, Maillot MA
WHERE LL.código = MA.código AND MA.color='amarillo'
GROUP BY LL.dorsal );