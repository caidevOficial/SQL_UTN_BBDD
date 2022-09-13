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
3) Se tiene la siguiente base de datos relacional:

Documentos (cod_documento, descripcion)
Oficinas (cod_oficina, codigo_director, descripcion)
Empleados (cod_empleado, apellido, nombre, fecha_nacimiento, num_doc, cod_jefe, 
cod_oficina, cod_documento)
Datos_contratos (cod_empleado, fecha_contrato, cuota, ventas)
Fabricantes (cod_fabricante, razon_social)
Listas (cod_lista, descripcion, ganancia)
Productos (cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, 
cod_fabricante)
Precios (cod_producto, cod_lista, precio)
Clientes (cod_cliente, cod_lista, razon_social)
Pedidos (cod_pedido, fecha_pedido, cod_empleado, cod_cliente)
Detalle_pedidos (cod_pedido, numero_linea, cod_producto, cantidad)

Resolver las siguientes consultas utilizando sentencias SQL: */
CREATE TABLE IF NOT EXISTS `ejercicio_3`.`Documentos` (
    `cod_documento` INTEGER NOT NULL AUTO_INCREMENT
    ,`descripcion` VARCHAR(25) NULL DEFAULT NULL
    ,PRIMARY KEY (`cod_documento`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

INSERT INTO `ejercicio_3`.`Documentos` (`descripcion`)
VALUES
    ('Contrato') ,('Alquiler') ,('Documentacion personal')
     ,('Ventas del dia') ,('Compras')


CREATE TABLE IF NOT EXISTS `ejercicio_3`.`Oficinas` (
    `cod_oficina` INTEGER NOT NULL AUTO_INCREMENT
    ,`codigo_director` INTEGER NOT NULL
    ,`descripcion` VARCHAR(25) NULL DEFAULT NULL
    ,PRIMARY KEY (`cod_oficina`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

INSERT INTO `ejercicio_3`.`Oficinas`(`codigo_director`, `descripcion`)
VALUES
    (3, 'IT'), (1, 'Ventas'), (4, 'Ingenieria'), (2, 'Finanzas')

CREATE TABLE IF NOT EXISTS `ejercicio_3`.`Empleados` (
    `cod_empleado` INTEGER NOT NULL AUTO_INCREMENT
    ,`nombre` VARCHAR(25) NULL DEFAULT NULL
    ,`apellido` VARCHAR(25) NULL DEFAULT NULL
    ,`fecha_nacimiento` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,`num_doc` VARCHAR(8) NULL DEFAULT NULL
    ,`cod_jefe` INTEGER NOT NULL
    ,`cod_oficina` INTEGER NOT NULL
    ,`cod_documento` INTEGER NOT NULL
    ,PRIMARY KEY (`cod_empleado`)
    ,FOREIGN KEY (`cod_oficina`) REFERENCES `Oficinas`(`cod_oficina`) 
    ON DELETE CASCADE ON UPDATE CASCADE
    ,FOREIGN KEY (`cod_documento`) REFERENCES `Documentos`(`cod_documento`) 
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

INSERT INTO `ejercicio_3`.`Empleados`
(`nombre`, `apellido`, `fecha_nacimiento`, `num_doc`, `cod_jefe`, `cod_oficina`, `cod_documento`)
VALUES
    ('Pepe', 'Argento', '1960-02-25', '10110150', 2, 4, 4)
    ,('Paola', 'Argento', '1990-02-25', '20110150', 4, 3, 5)
    ,('Moni', 'Argento', '1970-02-25', '10999150', 1, 2, 4)
    ,('Coqui', 'Argento', '1990-02-25', '20110151', 4, 3, 3)

CREATE TABLE IF NOT EXISTS `ejercicio_3`.`Datos_contratos` (
    `cod_empleado` INTEGER NOT NULL
    ,`fecha_contrato` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,`cuota` FLOAT UNSIGNED DEFAULT 0
    ,`ventas` INTEGER UNSIGNED DEFAULT 0
    ,FOREIGN KEY (`cod_empleado`) REFERENCES `Empleados`(`cod_empleado`) 
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

INSERT INTO `ejercicio_3`.`Datos_contratos`
(`cod_empleado`, `cuota`, `ventas`)
VALUES
    (2, 25000, 4), (1, 50000, 8), (4, 37500, 6), (2, 75000, 12)

CREATE TABLE IF NOT EXISTS `ejercicio_3`.`Fabricantes` (
    `cod_fabricante` INTEGER NOT NULL AUTO_INCREMENT
    ,`razon_social` VARCHAR(25) NULL DEFAULT NULL
    ,PRIMARY KEY (`cod_fabricante`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

INSERT INTO `ejercicio_3`.`Fabricantes`(`razon_social`)
VALUES
    ('Adidas'), ('Nike'), ('Emporio Armani'), ('Givenchy'), ('Paco Rabanne')

CREATE TABLE IF NOT EXISTS `ejercicio_3`.`Listas` (
    `cod_lista` INTEGER NOT NULL AUTO_INCREMENT
    ,`descripcion` VARCHAR(25) NULL DEFAULT NULL
    ,`ganancia` FLOAT UNSIGNED DEFAULT 0
    ,PRIMARY KEY (`cod_lista`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

INSERT INTO `ejercicio_3`.`Listas`(`descripcion`, `ganancia`)
VALUES
    ('Black Friday', 30), ('Cyber Monday', 25), ('Default', 15)

-- Productos (cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, cod_fabricante)
CREATE TABLE IF NOT EXISTS `ejercicio_3`.`Productos` (
    `cod_producto` INTEGER NOT NULL AUTO_INCREMENT
    ,`descripcion` VARCHAR(25) NULL DEFAULT NULL
    ,`precio` FLOAT NOT NULL DEFAULT 0
    ,`cantidad_stock` INTEGER NOT NULL DEFAULT 0
    ,`punto_reposicion` INTEGER NOT NULL DEFAULT 10
    ,`cod_fabricante` INTEGER NOT NULL
    ,PRIMARY KEY (`cod_producto`)
    ,FOREIGN KEY (`cod_fabricante`) REFERENCES `Fabricantes`(`cod_fabricante`) 
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

INSERT INTO `ejercicio_3`.`Productos`
(`descripcion`, `precio`, `cantidad_stock`, `cod_fabricante`)
VALUES
    ('Zapatillas',12000 ,200, 1)
    ,('Eau du toilet',20000 ,95, 3)
    ,('Eau du perfum',27000 ,70, 4)
    ,('Eau du perfum',25000 ,75, 5)
    ,('Snikers',15000 ,100, 2)
    ,('Mochila',10000 ,50, 2)
    ,('Gorra',5000 ,500, 1)

-- Precios (cod_producto, cod_lista, precio)
CREATE TABLE IF NOT EXISTS `ejercicio_3`.`Precios` (
    `cod_producto` INTEGER NOT NULL AUTO_INCREMENT
    ,`cod_lista` INTEGER NOT NULL
    ,`precio` FLOAT NOT NULL DEFAULT 0
    ,PRIMARY KEY (`cod_producto`, `cod_lista`)
    ,FOREIGN KEY (`cod_producto`) REFERENCES `Productos`(`cod_producto`) 
    ON DELETE CASCADE ON UPDATE CASCADE
    ,FOREIGN KEY (`cod_lista`) REFERENCES `Listas`(`cod_lista`) 
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

INSERT INTO `ejercicio_3`.`Precios`(`cod_lista`, `precio`)
VALUES
    (3, 30), (1, 15), (2, 25)

-- Clientes (cod_cliente, cod_lista, razon_social)
CREATE TABLE IF NOT EXISTS `ejercicio_3`.`Clientes` (
    `cod_cliente` INTEGER NOT NULL AUTO_INCREMENT
    ,`cod_lista` INTEGER NOT NULL
    ,`razon_social` VARCHAR(25) NULL DEFAULT NULL
    ,PRIMARY KEY (`cod_cliente`, `cod_lista`)
    ,FOREIGN KEY (`cod_lista`) REFERENCES `Listas`(`cod_lista`) 
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

INSERT INTO `ejercicio_3`.`Clientes`(`cod_lista`, `razon_social`)
VALUES
    (2, 'Zapateria El Sueco')
    ,(1, 'Perfumeria El Bao')
    ,(3, 'Perfumeria Eau du qlo')
    ,(3, 'Tienda de deportes Michetti')

-- Pedidos (cod_pedido, fecha_pedido, cod_empleado, cod_cliente)
CREATE TABLE IF NOT EXISTS `ejercicio_3`.`Pedidos` (
    `cod_pedido` INTEGER NOT NULL AUTO_INCREMENT
    ,`fecha_pedido` DATETIME DEFAULT CURRENT_TIMESTAMP
    ,`cod_empleado` INTEGER NOT NULL
    ,`cod_cliente` INTEGER NOT NULL
    ,PRIMARY KEY (`cod_pedido`)
    ,FOREIGN KEY (`cod_empleado`) REFERENCES `Empleados`(`cod_empleado`) 
    ON DELETE CASCADE ON UPDATE CASCADE
    ,FOREIGN KEY (`cod_cliente`) REFERENCES `Clientes`(`cod_cliente`) 
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

INSERT INTO `ejercicio_3`.`Pedidos`(`cod_empleado`, `cod_cliente`)
VALUES
    (1, 1), (1, 2), (2, 3), (2, 2), (2, 3)
    ,(3, 3), (3, 4), (3, 3), (4, 4), (2, 4)

-- Detalle_pedidos (cod_pedido, numero_linea, cod_producto, cantidad)
CREATE TABLE IF NOT EXISTS `ejercicio_3`.`Detalle_pedidos` (
    `cod_pedido` INTEGER NOT NULL AUTO_INCREMENT
    ,`numero_linea` VARCHAR(25) NULL DEFAULT NULL
    ,`cod_producto` INTEGER NOT NULL
    ,`cantidad` INTEGER NOT NULL DEFAULT 0
    ,PRIMARY KEY (`cod_pedido`)
    ,FOREIGN KEY (`cod_producto`) REFERENCES `Productos`(`cod_producto`) 
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

INSERT INTO `ejercicio_3`.`Detalle_pedidos`(`numero_linea`, `cod_producto`, `cantidad`)
VALUES
    ('2022', 1, 100)
    ,('2022', 2, 100)
    ,('2022', 2, 75)
    ,('2022', 3, 100)
    ,('2022', 4, 100)
    ,('2022', 5, 100)
    ,('2022', 3, 30)
    ,('2022', 7, 100)
    ,('2022', 4, 45)
    ,('2022', 6, 100)
    ,('2022', 6, 20)
    ,('2022', 7, 10)
    ,('2022', 1, 90)

-- Consultas simples (una sola tabla)
-- 1. Obtener una lista con los nombres de las distintas oficinas de la empresa.
SELECT DISTINCT of.`descripcion`
FROM `ejercicio_3`.`oficinas` AS of;

-- 2. Obtener una lista de todos los productos indicando descripcion del producto, su precio de 
-- costo y su precio de costo IVA incluído (tomar el IVA como 21%).
SELECT
prod.`descripcion`
,prod.`precio`
,(prod.`precio` * 1.21) AS precio_IVA
FROM `ejercicio_3`.`productos` AS prod;

-- 3. Obtener una lista indicando para cada empleado apellido, nombre, fecha de cumpleaños y 
-- edad.
SELECT
emp.`apellido`
,emp.`nombre`
,DATE_FORMAT(emp.`fecha_nacimiento`, "%d-%m") AS cumpleano
,(DATEDIFF(CURRENT_DATE(), emp.`fecha_nacimiento`) DIV 365) AS edad
FROM `ejercicio_3`.`empleados` AS emp;

-- 4. Listar todos los empleados que tiene un jefe asignado.
SELECT *
FROM `ejercicio_3`.`empleados` AS emp
WHERE emp.`cod_jefe` IS NOT NULL;

-- 5. Listar los empleados de nombre “María” ordenado por apellido.
SELECT *
FROM `ejercicio_3`.`empleados` AS emp
WHERE emp.`nombre` = 'María'
ORDER BY emp.`apellido` ASC;

-- 6. Listar los clientes cuya razón social comience con “L” ordenado por código de cliente.
SELECT
cli.`cod_cliente`
,cli.`cod_lista`
,cli.`razon_social`
FROM `ejercicio_3`.`clientes` AS cli
WHERE cli.`razon_social` LIKE 'L%'
ORDER BY cli.`cod_cliente` ASC;

-- 7. Listar toda la información de los pedidos de Marzo ordenado por fecha de pedido.
SELECT *
FROM `ejercicio_3`.`pedidos` AS ped
WHERE DATE_FORMAT(ped.`fecha_pedido`, '%M') = 'March'
ORDER BY ped.`fecha_pedido` ASC;

-- 8. Listar las oficinas que no tienen asignado director.
SELECT *
FROM `ejercicio_3`.`oficinas` AS of
WHERE of.`codigo_director` IS NULL;

-- 9. Listar los 4 productos de menor precio de costo.
SELECT *
FROM `ejercicio_3`.`productos` AS prod
ORDER BY prod.`precio` ASC
LIMIT 4;

-- 10. Listar los códigos de empleados de los tres que tengan la mayor cuota.
SELECT dc.`cod_empleado`
FROM `ejercicio_3`.`datos_contratos` AS dc
ORDER BY dc.`cuota` DESC
LIMIT 3;


/* Consultas multitablas */
-- 1. De cada producto listar descripcion, razón social del fabricante y stock ordenado por razón 
-- social y descripcion.
-- 2. De cada pedido listar código de pedido, fecha de pedido, apellido del empleado y razón 
-- social del cliente.
-- 3. Listar por cada empleado apellido, cuota asignada, oficina a la que pertenece ordenado en 
-- forma descendente por cuota.
-- 4. Listar sin repetir la razón social de todos aquellos clientes que hicieron pedidos en Abril.
-- 5. Listar sin repetir los productos que fueron pedidos en Marzo.
-- 6. Listar aquellos empleados que están contratados por más de 10 años ordenado por 
-- cantidad de años en forma descendente.
-- 7. Obtener una lista de los clientes mayoristas ordenada por razón social.
-- 8. Obtener una lista sin repetir que indique qué productos compró cada cliente, ordenada 
-- por razón social y descripcion.
-- 9. Obtener una lista con la descripcion de aquellos productos cuyo stock está por debajo del 
-- punto de reposición indicando cantidad a comprar y razón social del fabricante ordenada 
-- por razón social y descripcion.
-- 10. Listar aquellos empleados cuya cuota es menor a 50000 o mayor a 100000.
