#--1
SELECT COUNT(*) AS stock_nulo
FROM ARTICULOS 
WHERE stock IS NULL

#--2
SELECT codcli,COUNT(*) AS numfact
FROM FACTURAS 
WHERE iva=16
GROUP BY codcli
HAVING AVG(dto)>15

#--3
SELECT codcli,COUNT(codfac) AS "nº fac de mas de 5"
FROM FACTURAS 
GROUP BY codcli
HAVING COUNT(*)>5

#--4
SELECT codcli,COUNT(codfac) AS "nº fac",iva
FROM FACTURAS 
WHERE codcli BETWEEN 240 AND 260 
GROUP BY codcli,iva

#--5
SELECT TOP(10)precio
FROM ARTICULOS 
ORDER BY precio DESC

#--6
SELECT codart,SUM(cant) AS cant_total
FROM LINEAS_FAC 
WHERE UPPER(codart) LIKE '*X_'
GROUP BY codart

#--7

SELECT C.nombre,C.direccion,Pu.nombre,COUNT(*) AS nfacturas
FROM CLIENTES C,FACTURAS F,PUEBLOS Pu,PROVINCIAS Pr 
WHERE C.codcli=F.codcli AND Pr.codpro=Pu.codpro AND Pu.codpue=C.codpue AND year(F.fecha)=2009
AND Pr.nombre LIKE 'CASTELLON' 
GROUP BY C.nombre,C.direccion,Pu.nombre
#--9
SELECT C.codcli,C.nombre
FROM CLIENTES C,FACTURAS F,LINEAS_FAC L
WHERE C.codcli=F.codcli AND F.codfac=L.codfac AND month(F.fecha)=12 AND year(F.fecha)=2009 
GROUP BY C.codcli,C.nombre 
HAVING SUM(L.precio*L.cant)>60

#--10
SELECT codcli
FROM FACTURAS 
GROUP BY codcli
HAVING AVG(dto)>15
ORDER BY count(codfac) DESC 
LIMIT 1

#--11
SELECT C.codcli,C.nombre
FROM CLIENTES C,FACTURAS F,LINEAS_FAC L 
WHERE C.codcli=F.codcli AND L.codfac=F.codfac
AND L.codart IN(SELECT codart FROM ARTICULOS ORDER BY precio DESC LIMIT 1)


#--12
SELECT codart,COUNT(*) AS "Nº de art que superan 20 de stock precio 15 e" 
FROM ARTICULOS A,   
WHERE stock>20 AND precio>15             






SELECT codcli,COUNT(codfac) AS n_fac
FROM FACTURAS 
WHERE dto=0 OR dto IS NULL AND year(fecha)=2009 AND iva=16
GROUP BY codcli
HAVING COUNT(codfac)>2








SELECT F.codfac,C.nombre,P.nombre
FROM FACTURAS F,CLIENTES C,PUEBLOS P,PROVINCIAS PR
WHERE F.codcli=C.codcli AND P.codpue=C.codpue AND PR.codpro=P.codpro AND PR.nombre LIKE 'CASTELLON'
AND year(F.fecha)=2009 AND month(F.fecha) BETWEEN 7 AND 12
GROUP BY F.codfac,C.nombre,P.nombre

