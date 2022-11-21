/* Listar los nombres de los proveedores cuya ciudad contenga la cadena de texto “Ramos” */

SELECT Nombre, Ciudad
FROM Proveedor 
WHERE Ciudad LIKE '%Ramos%';

/* Listar los códigos de los materiales que provea el proveedor 4 y no los provea el proveedor 5. Se debe resolver de 3 formas. */

-- 1

SELECT CodMat, CodProv
FROM Provisto_Por
WHERE CodProv=4
EXCEPT 
SELECT CodMat, CodProv
FROM Provisto_Por
WHERE CodProv=5

-- 2

SELECT CodMat, CodProv
FROM Provisto_Por
WHERE CodProv = 4 AND CodProv NOT IN (
									  SELECT CodMat
									  FROM Provisto_Por 
									  WHERE CodMat = 5
									);

-- 3

SELECT CodMat, CodProv
FROM Provisto_Por pp1
WHERE CodProv=4 AND NOT EXISTS (
								SELECT CodMat
                                FROM Provisto_Por pp2
                                WHERE CodProv=5 AND pp1.CodMat=pp2.CodMat
								);


/* Listar los materiales, código y descripción, provistos por proveedores de la ciudad de Ramos Mejía.*/


SELECT m.CodMat, m.Descripcion, p.CodProv, p.Nombre, p.Ciudad
FROM Material m 
INNER JOIN Provisto_Por pp ON pp.CodMat=m.CodMat
INNER JOIN Proveedor p ON p.CodProv=pp.CodProv
WHERE Ciudad='Ramos Mejia'

/* Listar los proveedores y materiales que provee. La lista resultante debe incluir a aquellos proveedores que no proveen ningún material.*/

SELECT p.CodProv, p.Nombre, pp.CodMat, m.Descripcion
FROM Proveedor p 
LEFT JOIN Provisto_Por pp
ON p.CodProv=pp.CodProv
LEFT JOIN Material m
ON pp.CodMat=m.CodMat

/* Listar los artículos que cuesten más de $30 o que estén compuestos por el material 2.*/

SELECT *
FROM Articulo art
WHERE Precio > 30
OR EXISTS (
		   SELECT art.CodArt
		   FROM Compuesto_Por cp
		   WHERE cp.CodArt=art.CodArt
		   AND CodMat = 2
		);

/* Listar los artículos de Mayor precio.*/

SELECT TOP 5 a.*
FROM Articulo a
ORDER BY a.Precio DESC

/* Listar los proveedores que proveen más de 3 materiales*/

SELECT p.*
FROM Proveedor p
WHERE EXISTS(
			SELECT 1
			FROM Provisto_Por pp
			WHERE pp.CodProv = p.CodProv
			HAVING COUNT(pp.CodMat) > 3
			);

/* Crear una vista para el caso de los proveedores que proveen más de 4 materiales. Mostrar la forma de invocar esa vista.*/

/* Se crea la vista */
USE SQL_DML;
GO
CREATE VIEW v_proveedores_de_cuatro_materiales_o_mas AS
SELECT p.*
FROM Proveedor p
WHERE EXISTS(
			SELECT 1
			FROM Provisto_Por pp
			WHERE pp.CodProv = p.CodProv
			HAVING COUNT(pp.CodMat) > 4
			);

/* Se invoca la vista*/
SELECT *
FROM v_proveedores_de_cuatro_materiales_o_mas