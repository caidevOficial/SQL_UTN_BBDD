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

-- 1) Obtener los detalles completos de todos los productos.
SELECT * FROM `ejemplos`.`productos`;

-- 2) Obtener los detalles completos de todos los proveedores de Capital.
SELECT * FROM `ejemplos`.`proveedores` AS prov
WHERE prov.localidad = 'Capital';

-- 3) Obtener todos los envíos en los cuales la cantidad está entre 200 y 300 inclusive
SELECT 
pp.numero
,prod.pnro
,prod.pnombre
,pp.cantidad
FROM `ejemplos`.`productos` AS prod
INNER JOIN `ejemplos`.`prov-prod` AS pp
ON pp.pnro = prod.pnro
WHERE pp.cantidad BETWEEN 200 AND 300;

-- 4) Obtener los números de los productos suministrados por algún proveedor de Avellaneda.
SELECT
prod.pnro
FROM `ejemplos`.`productos` AS prod
INNER JOIN `ejemplos`.`prov-prod` AS pp
ON pp.pnro = prod.pnro
INNER JOIN `ejemplos`.`proveedores` AS prov
ON pp.numero = prov.numero
WHERE prov.localidad = 'Avellaneda'
GROUP BY prod.pnro;

-- 5) Obtener la cantidad total del producto 001 enviado por el proveedor 103.
SELECT
SUM(pp.cantidad) AS cantidad
FROM `ejemplos`.`PROV-PROD` AS pp
INNER JOIN `ejemplos`.`productos` AS prod
ON pp.pnro = prod.pnro
INNER JOIN `ejemplos`.`proveedores` AS prov
ON prov.numero = pp.numero
WHERE pp.pnro = 001 AND pp.numero = 103;

-- 6) Obtener los números de los productos y localidades en los cuales la segunda letra 
-- del nombre de la localidad sea A.
SELECT
prod.pnro
,prod.localidad
FROM `ejemplos`.`productos` AS prod
WHERE prod.localidad LIKE '_A%';


-- 7) Obtener los precios de los productos enviados por el proveedor 102.
SELECT
prod.precio
FROM `ejemplos`.`productos` AS prod
INNER JOIN `ejemplos`.`prov-prod` AS pp
ON pp.pnro = prod.pnro
INNER JOIN `ejemplos`.`proveedores` AS prov
ON prov.numero = pp.numero
WHERE prov.numero = 102;

-- 8) Construir una lista de todas las localidades en las cuales esté situado por lo menos 
-- un proveedor o un producto.
SELECT DISTINCT tab.Localidad FROM (
    SELECT
    prod.localidad AS Localidad
    FROM `ejemplos`.`productos` AS prod
    UNION ALL
    SELECT
    prov.localidad AS Localidad
    FROM `ejemplos`.`proveedores` AS prov) AS tab;

-- 9) Cambiar a “Chico” el tamaño de todos los productos medianos
UPDATE `ejemplos`.`productos`
SET tamaño = 'Chico'
WHERE tamaño = 'Grande';

-- 10) Eliminar todos los productos para los cuales no haya envíos.
DELETE FROM `ejemplos`.`productos`
WHERE pnro NOT IN (
    SELECT pp.pnro
    FROM `ejemplos`.`prov-prod` AS pp
);

-- 11) Insertar un nuevo proveedor (107) en la tabla PROVEEDORES. El nombre y la 
--      localidad son Rosales y Wilde respectivamente; el domicilio no se conoce todavía.
INSERT INTO `ejemplos`.`proveedores`
VALUES (107, 'Rosales', '', 'Wilde');