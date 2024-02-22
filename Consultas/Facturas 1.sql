#--1
SELECT codfac,fecha,dto*2 AS "Doble de descuento"
FROM FACTURAS
WHERE iva=0;

#--2
SELECT codfac,fecha
FROM FACTURAS 
WHERE iva IS NULL

#--3
SELECT codfac,fecha
FROM FACTURAS 
WHERE iva IS NULL OR iva=0;

#--4
SELECT codfac,codart 
FROM LINEAS_FAC 
WHERE cant<5 AND dto=>25

#--5
SELECT descrip,stock_min 
FROM ARTICULOS
WHERE stock < stock_min

#--6
SELECT DISTINCT(iva) AS "Ivas distintos de facturas"
FROM FACTURAS 
WHERE iva IS NOT NULL #--para que no salgan los ivas nulos, da linea vacia

#--7
SELECT codart,descrip,stock_min
FROM ARTICULOS 
WHERE stock IS NULL

#--8
SELECT DISTINCT descrip
FROM ARTICULOS 
WHERE stock=stock_min*3 AND precio>6

#--9
SELECT DISTINCT codart
FROM ARTICULOS AS A,LINEAS_FAC AS L
WHERE A.codart=L.codart AND codfac BETWEEN 8 AND 10

#--10
SELECT nombre
FROM PROVINCIAS
WHERE nombre LIKE '?O*' #--El ? es igual a _ , el * es igual a %

#--11
SELECT codfac,fecha
FROM FACTURAS 
WHERE year(fecha)=2008;

#--12
SELECT codfac,fecha
FROM FACTURAS 
WHERE codcli BETWEEN 50 AND 100 AND year(fecha)!=2009

#--13
SELECT codfac,fecha 
FROM FACTURAS 
WHERE month(fecha)=3 AND year(fecha) BETWEEN 2007 AND 2009

#--14
SELECT nombre
FROM CLIENTES 
WHERE codpostal 02% OR codpostal LIKE "11%" OR codpostal LIKE "21%"

#--15
SELECT nombre 
FROM PROVINCIAS 
WHERE nombre LIKE '*S'

#--16
SELECT nombre 
FROM CLIENTES
WHERE codpostal LIKE '02*' OR  codpostal LIKE '11*'  OR  codpostal LIKE '21*'

#--17
SELECT *
FROM ARTICULOS 
WHERE stock NOT BETWEEN stock_min-500 AND stock_min+500

#--18
SELECT nombre 
FROM PROVINCIAS
WHERE nombre LIKE '*MA*'

#--19
SELECT DISTINCT PR.nombre 
FROM PROVINCIAS PR, CLIENTES C, PUEBLOS PU  
WHERE C.codpostal LIKE '33*' AND PR.codpro=PU.codpro AND C.codpue=PU.codpue

#--20
SELECT P.nombre
FROM PUEBLOS P, CLIENTES C
WHERE P.codpue=C.codpue AND codpro IN (SELECT codpro FROM PROVINCIAS WHERE UPPER(nombre) LIKE 'LEON')

#--21
SELECT SUM(precio*stock) AS "Importe total de articulos en almacen"
FROM ARTICULOS 

#--22
SELECT AVG(precio) AS precio_medio
FROM ARTICULOS 
WHERE stock>10

#--23
SELECT COUNT(*) AS "Numero de pueblos en los que residen clientes codpostal 12"
FROM PUEBLOS 
WHERE codpue IN (SELECT codpue FROM CLIENTES WHERE codpostal LIKE '12*')

#--24


#--25
SELECT codart, descrip, precio, (precio*0.85) AS precio_promo 
FROM ARTICULOS 
WHERE (precio > 30 AND precio*stock>300) OR (precio<=30 AND precio*stock>150)
