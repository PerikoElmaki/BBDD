#--1
SELECT C.nombre,C.direccion,P.nombre,Pr.nombre 
FROM CLIENTES C,PUEBLOS P,PROVINCIAS Pr 
WHERE C.codpue=P.codpue AND Pr.codpro=P.codpro AND C.codpostal LIKE '12*'


#--3
SELECT codart,MAX(precio) AS precio_max,MIN(precio) AS precio_min 
FROM LINEAS_FAC
WHERE codart LIKE 'N*' 
GROUP BY codart 

#--4
SELECT codfac,fecha,codcli 
FROM FACTURAS 
WHERE codcli BETWEEN 90 AND 100  Nooooo
GROUP BY codfac,fecha,codcli 
HAVING iva=0 OR iva IS NULL AND dto=0 OR dto IS NULL 

#--5
SELECT COUNT(*) AS "nº de pueblos" 
FROM PUEBLOS
WHERE codpro IN (SELECT codpro FROM PROVINCIAS WHERE UPPER(nombre) LIKE 'VALENCIA' OR  UPPER(nombre) LIKE 'ALICANTE' OR  UPPER(nombre) LIKE 'CASTELLON')


#--6
SELECT MAX(stock) AS max_stock,MIN(stock) AS min_stock,MAX(stock)-MIN(stock) AS diferencia
FROM ARTICULOS 
WHERE precio BETWEEN 9 AND 12 

#--7
SELECT codcli,COUNT(codfac) AS total_fac 
FROM FACTURAS
WHERE iva=16 
GROUP BY codcli 
HAVING COUNT(*)>3

#--8
SELECT codart
FROM ARTICULOS 
WHERE stock<stock_min*2 
AND codart IN (SELECT codart FROM LINEAS_FAC GROUP BY codart HAVING SUM(cant)>50)

#--9
SELECT P.codpue,COUNT(*) AS n_clientes 
FROM PUEBLOS P, CLIENTES C 
WHERE P.codpue=C.codpue 
GROUP BY P.codpue
HAVING COUNT(*) >= ALL(SELECT COUNT(codcli) FROM CLIENTES GROUP BY codpue)


#--10 
SELECT F.codcli,COUNT(*) AS 