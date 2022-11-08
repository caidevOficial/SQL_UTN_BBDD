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

-- 1) Una base de datos hospitalaria contiene las siguientes relaciones:
-- PACIENTES (CODIGO-PAC, APELLIDO-PAC, EDAD)
-- MEDICAMENTOS (CODIGO-MED, PRECIO-UNITARIO)
-- GASTOS (CODIGO-PAC, CODIGO-MED)
-- Indicar las claves primarias y claves ajenas de cada relación
CREATE TABLE IF NOT EXISTS `ejercicio_3`.`pacientes`(
    `codigo-pac` INTEGER NOT NULL AUTO_INCREMENT
    ,`apellido-pac` VARCHAR(25) NULL DEFAULT NULL
    ,`edad` INTEGER NULL DEFAULT NULL
    ,PRIMARY KEY (`codigo-pac`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

INSERT INTO `ejercicio_3`.`pacientes`(`apellido-pac`, `edad`)
VALUES
    ('Argento', 50), ('Fuseneco', 45), ('Falcone', 32), ('Odinson', 38);

CREATE TABLE IF NOT EXISTS `ejercicio_3`.`medicamentos`(
    `codigo-med` INTEGER NOT NULL AUTO_INCREMENT
    ,`precio-unitario` FLOAT NOT NULL DEFAULT 150
    ,PRIMARY KEY (`codigo-med`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

INSERT INTO `ejercicio_3`.`medicamentos`(`precio-unitario`)
VALUES
    (500), (455), (3200), (3800);

CREATE TABLE IF NOT EXISTS `ejercicio_3`.`gastos`(
    `codigo-pac` INTEGER NOT NULL
    ,`codigo-med` INTEGER NOT NULL
    ,FOREIGN KEY (`codigo-pac`) REFERENCES `pacientes`(`codigo-pac`) 
    ON DELETE CASCADE ON UPDATE CASCADE
    ,FOREIGN KEY (`codigo-med`) REFERENCES `medicamentos`(`codigo-med`) 
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

INSERT INTO `ejercicio_3`.`gastos`(`codigo-pac`, `codigo-med`)
VALUES
    (1, 1), (1, 2), (1, 3), (1, 4)
    ,(2, 1), (2, 2), (2, 3), (2, 4)
    ,(3, 1), (3, 2), (3, 3), (3, 4)
    ,(4, 1), (4, 2), (4, 3), (4, 4);

-- Indicar las claves primarias y claves ajenas de cada relación
-- Pacientes, Medicamentos, Gastos
WITH foreign_keys AS (
    SELECT
    'FOREIGN KEY' AS Tipo_Constraint,
    r_cons.CONSTRAINT_NAME AS Nombre_Constraint,
    r_cons.TABLE_NAME AS Pertenece_A,
    r_cons.REFERENCED_TABLE_NAME AS Referencia_A
    FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS r_cons
    WHERE r_cons.TABLE_NAME IN ('gastos', 'medicamentos', 'pacientes')
),
primary_keys AS (
    SELECT
    t_cons.CONSTRAINT_TYPE AS Tipo_Constraint,
    t_cons.CONSTRAINT_NAME AS Nombre_Constraint,
    t_cons.TABLE_NAME AS Pertenece_A,
    NULL AS Referencia_A
    FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS t_cons
    WHERE (t_cons.CONSTRAINT_TYPE = 'PRIMARY KEY') AND 
        t_cons.TABLE_NAME IN ('gastos', 'medicamentos', 'pacientes')
)

SELECT * FROM foreign_keys
UNION ALL
SELECT * FROM primary_keys
GROUP BY 1, 3
ORDER BY Pertenece_A;


-- 2) Dadas las siguientes relaciones:
-- CURSOS (NUMCURSO, TITULO)
-- OFRECIMIENTOS (NUMCURSO, NUMOFR, FECHA, AULA)
-- PROFESORES (NUMCURSO, NUMOFR, NUMEMP)
-- ESTUDIANTES (NUMCURSO, NUMOFR, NUMEMP, CALIFICACION)
-- EMPLEADOS (NUMEMP, EMPLE-NOMBRE, PUESTO)
-- Indicar las claves primarias y claves ajenas de cada relación.
CREATE TABLE IF NOT EXISTS `ejercicio_3`.`cursos` (
    `numcurso` INTEGER NOT NULL AUTO_INCREMENT
    ,`titulo` VARCHAR(25) NULL DEFAULT NULL
    ,PRIMARY KEY (`numcurso`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

INSERT INTO `ejercicio_3`.`cursos` (`titulo`)
VALUES
    ('Seguridad') ,('Backend') ,('Frontend') ,('Data Science')

CREATE TABLE IF NOT EXISTS `ejercicio_3`.`ofrecimientos` (
    `numcurso` INTEGER NOT NULL
    ,`numofr` INTEGER NOT NULL AUTO_INCREMENT
    ,`fecha` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ,`aula`  INTEGER NOT NULL
    ,PRIMARY KEY (`numofr`)
    ,FOREIGN KEY (`numcurso`) REFERENCES `cursos`(`numcurso`) 
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

INSERT INTO `ejercicio_3`.`ofrecimientos` (`numcurso`, `aula`)
VALUES
    (1, 4) ,(2, 5) ,(3, 4) ,(4, 3);

CREATE TABLE IF NOT EXISTS `ejercicio_3`.`empleados_universidad` (
    `numemp` INTEGER NOT NULL AUTO_INCREMENT
    ,`emp-nombre` VARCHAR(25) NULL DEFAULT NULL
    ,`puesto` VARCHAR(25) NULL DEFAULT NULL
    ,PRIMARY KEY (`numemp`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

INSERT INTO `ejercicio_3`.`empleados_universidad` (`emp-nombre`, `puesto`)
VALUES
    ('Pepe', 'profesor') ,('Paola', 'ayudante') ,('Moni', 'alumno') 
    ,('Coqui', 'alumno'),('Dardo', 'profesor');

CREATE TABLE IF NOT EXISTS `ejercicio_3`.`profesores` (
    `numcurso` INTEGER NOT NULL
    ,`numofr` INTEGER NOT NULL
    ,`numemp` INTEGER NOT NULL
    ,FOREIGN KEY (`numcurso`) REFERENCES `cursos`(`numcurso`) 
    ON DELETE CASCADE ON UPDATE CASCADE
    ,FOREIGN KEY (`numofr`) REFERENCES `ofrecimientos`(`numofr`) 
    ON DELETE CASCADE ON UPDATE CASCADE
    ,FOREIGN KEY (`numemp`) REFERENCES `empleados_universidad`(`numemp`) 
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

INSERT INTO `ejercicio_3`.`profesores` (`numcurso`, `numofr`,`numemp`)
VALUES
    (3, 3, 1) ,(2, 2, 5), (4, 4, 5);

CREATE TABLE IF NOT EXISTS `ejercicio_3`.`estudiantes` (
    `numcurso` INTEGER NOT NULL
    ,`numofr` INTEGER NOT NULL
    ,`numemp` INTEGER NOT NULL
    ,`calificacion` FLOAT NOT NULL DEFAULT 2
    ,FOREIGN KEY (`numcurso`) REFERENCES `cursos`(`numcurso`) 
    ON DELETE CASCADE ON UPDATE CASCADE
    ,FOREIGN KEY (`numofr`) REFERENCES `ofrecimientos`(`numofr`) 
    ON DELETE CASCADE ON UPDATE CASCADE
    ,FOREIGN KEY (`numemp`) REFERENCES `empleados_universidad`(`numemp`) 
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish_ci;

INSERT INTO `ejercicio_3`.`estudiantes` (`numcurso`, `numofr`,`numemp`,`calificacion`)
VALUES
    (3, 3, 4, 6) ,(2, 2, 4, 7), (4, 4, 4, 7)
    ,(3, 3, 3, 2) ,(2, 2, 3, 4), (4, 4, 3, 5);


-- Indicar las claves primarias y claves ajenas de cada relación
-- Estudiantes, empleados_universidad, Profesores, Ofrecimientos, Cursos
WITH foreign_keys AS (
    SELECT
    'FOREIGN KEY' AS Tipo_Constraint,
    r_cons.CONSTRAINT_NAME AS Nombre_Constraint,
    r_cons.TABLE_NAME AS Pertenece_A,
    r_cons.REFERENCED_TABLE_NAME AS Referencia_A
    FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS r_cons
    WHERE r_cons.TABLE_NAME IN (
        'cursos', 'ofrecimientos', 'profesores', 
        'empleados_universidad', 'estudiantes'
    )
),
primary_keys AS (
    SELECT
    t_cons.CONSTRAINT_TYPE AS Tipo_Constraint,
    t_cons.CONSTRAINT_NAME AS Nombre_Constraint,
    t_cons.TABLE_NAME AS Pertenece_A,
    NULL AS Referencia_A
    FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS t_cons
    WHERE (t_cons.CONSTRAINT_TYPE = 'PRIMARY KEY') AND 
        t_cons.TABLE_NAME IN (
        'cursos', 'ofrecimientos', 'profesores', 
        'empleados_universidad', 'estudiantes'
    )
)

SELECT * FROM foreign_keys
UNION ALL
SELECT * FROM primary_keys
GROUP BY 1, 3
ORDER BY Pertenece_A;


-- 3) Dadas las siguientes tablas:
-- Empleados (cod_emp, nombre, apellido, tipo_doc, num_doc, categoria, cod_ofic)
-- Oficinas (cod_ofic, descripción)

CREATE TABLE IF NOT EXISTS `ejercicio_3`.`empleados_3`(
    `cod_emp` INTEGER NOT NULL AUTO_INCREMENT
    ,`nombre` VARCHAR(25) NULL DEFAULT NULL
    ,`apellido` VARCHAR(25) NULL DEFAULT NULL
    ,`tipo_doc` VARCHAR(25)
    ,`num_doc` VARCHAR(25)
    ,`categoria`  VARCHAR(25)
    ,`cod_ofic` INTEGER
);

CREATE TABLE IF NOT EXISTS `ejercicio_3`.`oficinas_3`(
    `cod_ofic` INTEGER NOT NULL AUTO_INCREMENT
    ,`descripcion` VARCHAR(25) NULL DEFAULT NULL
    ,PRIMARY KEY(`cod_ofic`)
);

-- Crear las siguientes reglas de integridad:
-- A - La columna cod_emp debe ser clave primaria.
ALTER TABLE `ejercicio_3`.`empleados_3`
ADD CONSTRAINT emp_pk_cod_emp PRIMARY KEY (`cod_emp`);

-- B - La columna cod_emp debe tener valores entre 100 y 1000.
ALTER TABLE `ejercicio_3`.`empleados_3`
ADD CONSTRAINT emp_pk_cod_emp CHECK(`cod_emp` > 99 AND `cod_emp` < 1000);

-- C - Las columnas tipo_doc y num_doc deben contener valores no repetidos (únicos).
ALTER TABLE `ejercicio_3`.`empleados_3` 
ADD CONSTRAINT unique_fields UNIQUE (`tipo_doc`, `num_doc`);

-- D - La columna Categoria debe contener algunos de los siguientes valores: 
-- Senior, Semi Senior, Junior.
ALTER TABLE `ejercicio_3`.`empleados_3`
ADD CONSTRAINT category_values CHECK(`categoria` IN ('Senior', 'Semi Senior', 'Junior'));

-- E - La columna cod_ofic debe tener valores que existan en la tabla Oficinas.
ALTER TABLE `ejercicio_3`.`empleados_3`
ADD CONSTRAINT emp_pk_cod_emp FOREIGN KEY REFERENCES `oficinas`(`cod_ofic`) 
ON DELETE CASCADE ON UPDATE CASCADE;
