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

-- 1) Crear una vista formada por los números de proveedores y números de 
-- productos situados en diferentes localidades.
CREATE OR REPLACE VIEW `ejemplos`.`proveedores_1_vw` 
AS
    SELECT 
        prov.`numero` AS prov_nro
        ,prod.`pnro` AS prod_nro
        ,prov.`localidad`
    FROM `ejemplos`.`productos` AS prod
    INNER JOIN `ejemplos`.`prov-prod` AS pp
    ON prod.pnro = pp.pnro
    INNER JOIN `ejemplos`.`proveedores` AS prov
    ON prov.numero = pp.numero
    WHERE prov.`localidad` != prod.`localidad`
    GROUP BY prov_nro, prod_nro, localidad;

-- 2) Agregar la columna IMPORTADOR a la tabla PRODUCTOS.
ALTER TABLE `ejemplos`.`productos` ADD `importador` VARCHAR (25);

-- 3) Crear una vista formada por los registros de los proveedores que viven en Wilde.
CREATE OR REPLACE VIEW `ejemplos`.`proveedores_2_vw` 
AS
    SELECT *
    FROM `ejemplos`.`proveedores` AS prov
    WHERE prov.`localidad` = 'Wilde';

-- 4) Crear las tablas DEPARTAMENTOS y EMPLEADOS con sus relaciones, y las 
-- tablas PACIENTES y MEDICAMENTOS con sus relaciones

CREATE TABLE IF NOT EXISTS `ejemplos`.`departamentos` (
    `dep_nro` INTEGER NOT NULL
    ,`nombre` VARCHAR(25) NULL DEFAULT NULL
    ,PRIMARY KEY (`dep_nro`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish2_ci;

CREATE TABLE IF NOT EXISTS `ejemplos`.`empleados` (
    `legajo` INTEGER NOT NULL
    `dep_nro` INTEGER NOT NULL
    ,`nombre` VARCHAR(25) NULL DEFAULT NULL
    ,`apellido` VARCHAR(25) NULL DEFAULT NULL
    ,`dni` VARCHAR(8) NULL DEFAULT NULL
    ,`direccion` VARCHAR(25) NULL DEFAULT NULL
    ,PRIMARY KEY (`legajo`)
    ,FOREIGN KEY (`dep_nro`) REFERENCES `departamentos`(`dep_nro`) 
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish2_ci;

CREATE TABLE IF NOT EXISTS `ejemplos`.`pacientes` (
    `id_paciente` INTEGER NOT NULL AUTO_INCREMENT
    ,`dni` VARCHAR(8) NULL DEFAULT NULL
    ,`nombre` VARCHAR(25) NULL DEFAULT NULL
    ,`apellido` VARCHAR(25) NULL DEFAULT NULL
    ,`direccion` VARCHAR(25) NULL DEFAULT NULL
    ,`localidad` VARCHAR(25) NULL DEFAULT NULL
    ,PRIMARY KEY (`id_paciente`)
    ,UNIQUE(`dni`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish2_ci;

INSERT INTO `ejemplos`.`pacientes` (`dni`, `nombre`, `apellido`, `direccion`, `localidad`)
VALUES
    ('10100101', 'Pepe', 'Argento', 'Calle falsa 123', 'Boedo')
    ,('10100102', 'Paola', 'Argento', 'Calle falsa 123', 'Boedo')
    ,('10100103', 'Moni', 'Argento', 'Calle falsa 123', 'Boedo')


CREATE TABLE IF NOT EXISTS `ejemplos`.`medicamentos` (
    `id_medicamento` INTEGER NOT NULL AUTO_INCREMENT
    ,`id_paciente` INTEGER
    ,`nombre` VARCHAR(25) NULL DEFAULT NULL
    ,`laboratorio` VARCHAR(25) NULL DEFAULT NULL
    ,`cantidad` INTEGER UNSIGNED
    ,`fecha` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,PRIMARY KEY (`id_medicamento`)
    ,FOREIGN KEY (`id_paciente`) REFERENCES `pacientes`(`id_paciente`) 
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish2_ci;

INSERT INTO `ejemplos`.`medicamentos` (`id_paciente`, `nombre`, `laboratorio`, `cantidad`)
VALUES
    (1, 'Fosfobral', 'Laboratorio 1', 1)
    ,(2, 'Ibuevanol', 'Laboratorio 2', 1)
    ,(3, 'Dulcolax', 'Laboratorio 3', 1)