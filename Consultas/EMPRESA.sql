#--1. Apellido y sueldo incrementado un 10% de los empleados con oficio de vendedor.
SELECT apellido,salario+(salario*0.1) AS 'Salario Incrementado'
FROM EMPLEADOS 
WHERE oficio LIKE 'VENDEDOR';

#--2. Apellido, salario, comisión y total a cobrar por cada
#--empleado, suponiendo que se trata de sumar su salario
#--a la correspondiente comisión, si la tuviera.
SELECT apellido,salario,comision,salario+NVL(comision,0) AS total_cobrar
FROM EMPLEADOS;

#--Para convertir Nulo y operar con ello, función NVL(en odb) y NZ en sql(access)
#--Le da a nulos(en el caso de que lo sean) el valor que queramos
SELECT apellido,salario,comision,salario+NVL(comision,0) AS total_a_cobrar
FROM EMPLEADOS;

#--3 Datos de todos aquellos empleados cuya comisión sea nula.
SELECT * 
FROM EMPLEADOS 
WHERE comision IS NULL;

#--4 Datos de los empleados con oficio de vendedor y salario entre 1750 y 2000 €.
SELECT *
FROM EMPLEADOS 
WHERE oficio='VENDEDOR' AND salario BETWEEN 1750 AND 2000;

#--5 Datos de los empleados cuyo oficio no sea el de vendedor, cuyo apellido comience por ‘G’ y que tengan un sueldo
#--superior a 2500 €.
SELECT *
FROM EMPLEADOS 
WHERE oficio!='VENDEDOR' AND apellido LIKE 'G*' AND salario>2500;

#--6  Seleccionar los empleados existentes en los
#--departamentos 10 y 30. Mostrar su número de
#--empleado, su apellido, y el número del departamento.
SELECT emp_no,apellido,dep_no
FROM EMPLEADOS 
WHERE dep_no IN(10,30);

#--7. Listar los empleados por departamentos en orden
#--descendente de salarios. Mostrar el número de
#--departamento, el apellido y el salario.
SELECT dep_no,apellido,salario 
FROM EMPLEADOS 
ORDER BY dep_no,salario DESC  

#--8. Obtener los salarios máximo, mínimo y la diferencia 
#--existente entre ambos.
SELECT MAX(salario) AS maximo,MIN(salario) AS minimo,MAX(salario)-MIN(salario) AS diferencia
FROM EMPLEADOS;

#--9. Calcular el salario medio de los empleados.
SELECT AVG(salario) AS salario_medio
FROM EMPLEADOS;

#--10. Obtener los salarios medios por departamento.
SELECT dep_no,AVG(salario) AS salario_medio
FROM EMPLEADOS 
GROUP BY dep_no;

#--11 Obtener cuántos empleados hay en cada departamento.
SELECT dep_no,COUNT(*) AS n_empleados
FROM EMPLEADOS 
GROUP BY dep_no;

#--12 Seleccionar el mayor salario dentro de cada oficio, excluyendo el del presidente.
SELECT oficio,MAX(salario) AS max_salario
FROM EMPLEADOS 
WHERE oficio NOT LIKE 'PRESIDENTE';

#--13 Seleccionar los oficios que tengan dos o más empleados.
SELECT oficio,COUNT(*) AS empleados 
FROM EMPLEADOS 
GROUP BY oficio 
HAVING COUNT(*)>=2;

#--14 Seleccionar los oficios que tengan dos o más empleados, 
#--cuyo salario supere los 1400 €.
SELECT oficio,COUNT(*) AS empleados 
FROM EMPLEADOS
WHERE salario>1400
GROUP BY oficio 
HAVING COUNT(*)>=2

#--15 Obtener todos los empleados (indicando no empleado y apellido)
#--con su nombre de departamento y su localidad.
SELECT EM.emp_no,EM.apellido,DE.dnombre,DE.localidad
FROM EMPLEADOS EM,DEPARTAMENTOS DE 
WHERE EM.dep_no=DE.dep_no

#--16 Obtener la lista de los empleados con los nombres de sus directores.
SELECT E1.emp_no,E1.apellido,E1.director,E2.apellido
FROM EMPLEADOS E1, EMPLEADOS E2
WHERE E2.emp_no=E1.director

#--17 Obtener los jefes de los empleados cuyo oficio sea el de ‘VENDEDOR’.
SELECT E1.emp_no,E1.apellido,E1.director,E2.apellido
FROM EMPLEADOS E1, EMPLEADOS E2
WHERE E2.emp_no=E1.director AND oficio LIKE 'VENDEDOR'

#--18 Listar los empleados de los departamentos diferentes al de ‘VENTAS’.
SELECT emp_no,apellido
FROM EMPLEADOS 
WHERE dep_no NOT IN(SELECT dep_no FROM DEPARTAMENTOS WHERE dnombre LIKE 'VENTAS')

#--19 Listar los empleados cuyo salario supere el salario medio. 
#--Mostrar su número de departamento, apellido y salario.
SELECT dep_no,apellido,salario
FROM EMPLEADOS 
GROUP BY  dep_no,apellido,salario
HAVING salario > (SELECT AVG(salario) FROM EMPLEADOS)

#--20 Mostrar el apellido y número de todos los empleados 
#--ue tienen el mismo oficio que ‘Alonso’.
SELECT emp_no,apellido,oficio
FROM EMPLEADOS 
WHERE oficio IN(SELECT oficio FROM EMPLEADOS WHERE apellido='ALONSO')

#--21 Obtener información de los empleados que ganan
#--más que cualquier empleado del departamento 30.
SELECT emp_no,apellido,oficio,salario 
FROM EMPLEADOS
WHERE salario > ALL(SELECT salario FROM EMPLEADOS WHERE dep_no=30)

#--22. Visualizar el número de vendedores del departamento de VENTAS.
SELECT COUNT(*) AS "nº vendedores "
FROM EMPLEADOS 
WHERE dep_no IN (SELECT dep_no FROM DEPARTAMENTOS WHERE dnombre LIKE 'VENTAS')
AND oficio='VENDEDOR' 
GROUP BY oficio

#--23 Visualizar la suma de los salarios para cada oficio
#--de los empleados del departamento de VENTAS.
SELECT oficio,SUM(salario) AS totalsalarios
FROM EMPLEADOS
WHERE dep_no IN (SELECT dep_no FROM DEPARTAMENTOS WHERE dnombre LIKE 'VENTAS') 
GROUP BY oficio 

#--24. Listar, en orden alfabético, aquellos empleados que no
#--trabajen ni en Madrid ni en Barcelona.
SELECT emp_no,apellido,dep_no,oficio 
FROM EMPLEADOS 
WHERE dep_no NOT IN(SELECT dep_no FROM DEPARTAMENTOS WHERE localidad IN('MADRID','BARCELONA'))
ORDER BY emp_no,apellido,dep_no,oficio 

#--25. Listar los nombres de los departamentos que
#--tengan algún empleado con fecha de alta anterior a 1992.
SELECT dnombre 
FROM DEPARTAMENTOS
WHERE dep_no IN (SELECT dep_no FROM EMPLEADOS WHERE YEAR(fecha_alta)<1992)

#--26 Obtener los departamentos y sus nombres, siempre que
#--haya más de un empleado trabajando en ellos.
SELECT DE.dep_no,dnombre 
FROM DEPARTAMENTOS DE,EMPLEADOS E1 
WHERE DE.dep_no=E1.dep_no   			#--COn subconsulta es mas facil
GROUP BY DE.dep_no,dnombre
HAVING COUNT(E1.emp_no)>1

#--27. Listar las localidades donde existan departamentos
#--con empleados cuya comisión supere el 10% del
#--salario.
SELECT localidad
FROM DEPARTAMENTOS
WHERE dep_no IN(SELECT dep_no FROM EMPLEADOS WHERE comision>(salario*0.1))

#--28. Seleccionar aquellos departamentos en los que al menos
#--exista un empleado con comisión.
SELECT dep_no,dnombre,localidad 
FROM DEPARTAMENTOS
WHERE dep_no IN (SELECT dep_no FROM EMPLEADOS WHERE comision IS NOT NULL)

#--29 Listar aquellos departamentos en los que todos sus
#--empleados carezcan de información sobre su comisión.
SELECT dep_no,dnombre
FROM DEPARTAMENTOS
WHERE dep_no <> ALL(SELECT dep_no FROM EMPLEADOS WHERE comision IS NOT NULL)

#--30. Obtener apellido y oficio de los empleados que tienen el
#--mismo oficio que los que trabajan en el departamento de ‘INVESTIGACIÓN')’.

SELECT apellido,oficio 
FROM EMPLEADOS
WHERE oficio IN(SELECT oficio 
				FROM EMPLEADOS EM,DEPARTAMENTOS DE 
				WHERE EM.dep_no=DE.dep_no AND DE.dnombre LIKE 'INVESTIGACIÓN')

#--31 Visualizar el número de departamento con más empleados.
SELECT TOP(1)dep_no,COUNT(*) AS totalempleados 
FROM EMPLEADOS
GROUP BY dep_no 
ORDER BY COUNT(*) DESC

#--32 Visualizar los números de departamentos en los que el salario medio de sus empleados sea mayor o igual que la
media de todos los salarios.
SELECT dep_no 
FROM DEPARTAMENTOS
WHERE dep_no IN( SELECT dep_no 
				FROM EMPLEADOS GROUP BY dep_no 
				HAVING 	AVG(salario)>=(SELECT AVG(salario) FROM EMPLEADOS))
				
#--33 Visualizar el departamento con más presupuesto asignado 
#--para pagar el salario y la comisión de sus empleados.
SELECT dep_no 
FROM DEPARTAMENTOS
WHERE dep_no IN(SELECT TOP(1)dep_no FROM EMPLEADOS GROUP BY dep_no
				ORDER BY SUM(salario+NVL(comision,0)) DESC)
				

#--34. Visualizar el número de departamento, el oficio 
#--y el salario de los oficios con mayor salario de cada departamento.
SELECT dep_no,oficio,salario 
FROM EMPLEADOS                      #--Resultado son los maximos salarios de cada dep 
WHERE salario IN(SELECT MAX(salario) FROM EMPLEADOS GROUP BY dep_no)
 