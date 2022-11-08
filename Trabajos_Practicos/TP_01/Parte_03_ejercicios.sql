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

/*
2) Dadas las siguientes tablas:
    CLIENTES (código_cliente, nombre, domicilio, provincia) 
    PRODUCTOS (código_producto, nombre_producto) 
    ITEM_VENTAS (número_factura, coódigo_producto, cantidad, precio) 
    VENTAS (número_factura, código_cliente, fecha)
*/

CREATE TABLE IF NOT EXISTS `ejemplos`.`clientes` (
    `codigo_cliente` INTEGER NOT NULL AUTO_INCREMENT
    ,`nombre` VARCHAR(25) NULL DEFAULT NULL
    ,`domicilio` VARCHAR(25) NULL DEFAULT NULL
    ,`provincia` VARCHAR(25) NULL DEFAULT NULL
    ,PRIMARY KEY (`codigo_cliente`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish2_ci;

INSERT INTO `ejemplos`.`clientes` (`nombre`, `domicilio`, `provincia`)
VALUES
('Pepe Argento', 'Calle falsa 123', 'Boedo')
,('Moni Argento', 'Calle falsa 123', 'Boedo')
,('Paola Argento', 'Calle falsa 123', 'Boedo')
,('Coqui Argento', 'Calle falsa 123', 'Boedo')
,('Fatiga Argento', 'Calle falsa 123', 'Boedo')

CREATE TABLE IF NOT EXISTS `ejemplos`.`productos_2` (
    `codigo_producto` INTEGER NOT NULL AUTO_INCREMENT
    ,`nombre_producto` VARCHAR(25) NULL DEFAULT NULL
    ,PRIMARY KEY (`codigo_producto`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish2_ci;

INSERT INTO `ejemplos`.`productos_2` (`nombre_producto`)
VALUES
('Shampoo Pantene') ,('Coca Cola') ,('Diario Ole')
,('Pizza') ,('Telefono') ,('Empanadas') ,('Vino');

CREATE TABLE IF NOT EXISTS `ejemplos`.`ventas` (
    `numero_factura` INTEGER NOT NULL AUTO_INCREMENT
    ,`codigo_cliente` INTEGER
    ,`fecha` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,PRIMARY KEY (`numero_factura`)
    ,FOREIGN KEY (`codigo_cliente`) REFERENCES `clientes`(`codigo_cliente`) 
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish2_ci;

INSERT INTO `ejemplos`.`ventas` (`codigo_cliente`)
VALUES
(1) ,(3) ,(5) ,(2) ,(4) ,(1) ,(2);

CREATE TABLE IF NOT EXISTS `ejemplos`.`item_ventas` (
    `numero_factura` INTEGER
    ,`codigo_producto` INTEGER
    ,`cantidad` INTEGER UNSIGNED DEFAULT 0
    ,`precio` FLOAT UNSIGNED DEFAULT 0
    ,PRIMARY KEY (`numero_factura`)
    ,FOREIGN KEY (`numero_factura`) REFERENCES `ventas`(`numero_factura`) 
    ON DELETE CASCADE ON UPDATE CASCADE
    ,FOREIGN KEY (`codigo_producto`) REFERENCES `productos_2`(`codigo_producto`) 
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish2_ci;

INSERT INTO `ejemplos`.`item_ventas` (`numero_factura`,`codigo_producto`,`cantidad`,`precio`)
VALUES
(1, 3, 2, 150) ,(2, 7, 1, 450) ,(3, 5, 3, 7500)
 ,(4, 1, 5, 200) ,(5, 2, 2, 450) ,(6, 4, 3, 850) ,(7, 6, 4, 1150)

-- Resolver las siguientes consultas:
-- 1. Obtener la cantidad de unidades máxima.
SELECT MAX(iv.cantidad)
FROM `ejemplos`.`item_ventas` AS iv;

-- 2. Obtener la cantidad total de unidades vendidas del producto c.
SELECT 
    SUM(iv.`cantidad`) AS Total_Producto
FROM `ejemplos`.`item_ventas` AS iv
INNER JOIN `ejemplos`.`productos_2` AS prod ON iv.`codigo_producto` = prod.`codigo_producto`
WHERE prod.`nombre_producto` = 'Pizza';

-- 3. Cantidad de unidades vendidas por producto, indicando la descripción del producto, 
-- ordenado de mayor a menor por las cantidades vendidas.
SELECT
    SUM(iv.`cantidad`) AS unidades_vendidas
    ,prod.`nombre_producto`
FROM `ejemplos`.`item_ventas` AS iv
INNER JOIN `ejemplos`.`productos_2` AS prod ON iv.`codigo_producto` = prod.`codigo_producto`
GROUP BY prod.`nombre_producto`
ORDER BY unidades_vendidas DESC;

-- 4. Cantidad de unidades vendidas por producto, indicando la descripción del producto, 
-- ordenado alfabéticamente por nombre de producto para los productos que vendieron 
-- más de 30 unidades.
WITH inner_query AS (
    SELECT
        SUM(iv.`cantidad`) AS unidades_vendidas
        ,prod.`nombre_producto`
    FROM `ejemplos`.`item_ventas` AS iv
    INNER JOIN `ejemplos`.`productos_2` AS prod ON iv.`codigo_producto` = prod.`codigo_producto`
    GROUP BY prod.`nombre_producto`
    ORDER BY prod.`nombre_producto` DESC
)
SELECT * FROM inner_query
WHERE inner_query.unidades_vendidas >= 30;

-- 5. Obtener cuantas compras (1 factura = 1 compra) realizó cada cliente indicando el 
-- código y nombre del cliente ordenado de mayor a menor.
SELECT
    COUNT(iv.`numero_factura`) AS compras
    ,cli.`codigo_cliente`
    ,cli.`nombre`
FROM `ejemplos`.`item_ventas` AS iv
INNER JOIN `ejemplos`.`ventas` AS ven ON ven.`numero_factura` = iv.`numero_factura`
INNER JOIN `ejemplos`.`clientes` AS cli ON cli.`codigo_cliente` = ven.`codigo_cliente`
GROUP BY ,cli.`codigo_cliente`, cli.`nombre`
ORDER BY compras DESC;

-- 6. Promedio de unidades vendidas por producto, indicando el código del producto 
-- para el cliente 1
SELECT
    ROUND(AVG(iv.`cantidad`), 2) AS promedio
    ,prod.`codigo_producto`
FROM `ejemplos`.`item_ventas` AS iv 
INNER JOIN `ejemplos`.`productos_2` AS prod ON prod.`codigo_producto` = iv.`codigo_producto` 
INNER JOIN `ejemplos`.`ventas` AS ven ON ven.`numero_factura` = iv.`numero_factura` 
INNER JOIN `ejemplos`.`clientes` AS cli ON cli.`codigo_cliente` = ven.`codigo_cliente`
WHERE cli.`nombre` = 'Moni Argento'
GROUP BY prod.`codigo_producto`;
