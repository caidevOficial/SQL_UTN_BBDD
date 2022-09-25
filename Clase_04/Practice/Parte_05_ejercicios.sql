-- 1) Cuáles tablas contienen la columna LOCALIDAD?
SELECT
tab.TABLE_NAME AS Nombre_Tabla
FROM INFORMATION_SCHEMA.COLUMNS AS tab
WHERE tab.COLUMN_NAME = 'localidad';
/* alumnos, pacientes, productos, proveedores */


-- 2) Cuántas columnas tiene la tabla PRODUCTOS?
SELECT
COUNT(*) AS Cantidad_Columnas
FROM INFORMATION_SCHEMA.COLUMNS AS tab
WHERE tab.TABLE_NAME = 'productos';
/* 6 */


-- 3) Obtener una lista de todos los usuarios dueños de por lo menos una tabla, junto con el 
-- número de tablas que le pertenecen a cada uno.


-- 4) Obtener una lista de los nombres de todas las tablas que tienen por lo menos un 
-- índice.
SELECT tab.NAME
FROM INFORMATION_SCHEMA.INNODB_SYS_INDEXES AS indice
INNER JOIN INFORMATION_SCHEMA.INNODB_SYS_TABLES as tab 
ON indice.TABLE_ID = tab.TABLE_ID;