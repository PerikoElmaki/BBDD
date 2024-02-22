IMPORTANTE 

APUNTES Y CARACTERÍSTICAS ESPECIALES

-Consultando varias tablas, si se quieren agrupar:  
DEBEN APARECER EN EL GROUP BY TODOS LOS ATRIBUTOS DEL SELECT 

#--Obtener el nombre y el estado de los proveedores que suministran, al menos, todas las piezas suministradas por el proveedor S2.
SELECT S.sn,S.snombre,S.estado
FROM S,SP AS sp1,SP AS sp2
WHERE S.sn=sp1.sn AND sp2.sn='S2' AND sp1.pn=sp2.pn
GROUP BY S.sn,snombre,estado
HAVING COUNT(*)= (SELECT COUNT(*) FROM SP WHERE sn='S2')   

-Se crean dos SP(sp1 y sp2) para comparar dos atributos de esa tabla, y usarlos independientemente
-Ahi usamos sp1 para igualarlo con sn de tabla S, y el otro(sp2) lo usamos de condicion para igualar a S2, y finalmente comparamos ambos 
-Es como hacer una subconsulta, pero usando el renombrar de SP para comparar distintos atributos de misma tabla