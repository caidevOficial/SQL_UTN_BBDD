-- MIT License
-- 
-- Copyright (c) 2022 [FacuFalcone]
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.


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
SELECT
mytab.`User` AS Usuario,
COUNT(mytab.`Table_Name`) AS Cantidad_Tablas
FROM mysql.`tables_priv` AS mytab
GROUP BY
Usuario;


-- 4) Obtener una lista de los nombres de todas las tablas que tienen por lo menos un 
-- índice.
SELECT tab.NAME
FROM INFORMATION_SCHEMA.INNODB_SYS_INDEXES AS indice
INNER JOIN INFORMATION_SCHEMA.INNODB_SYS_TABLES AS tab 
ON indice.TABLE_ID = tab.TABLE_ID;
