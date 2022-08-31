CREATE TABLE IF NOT EXISTS `ejemplos`.`alumnos` (
    `legajo` INTEGER
    ,`nombre` VARCHAR(25) NOT NULL
    ,`domicilio` VARCHAR(25) NULL DEFAULT NULL
    ,`localidad` VARCHAR(25) NULL DEFAULT NULL
    ,`edad` INTEGER UNSIGNED NOT NULL
    ,PRIMARY KEY (`legajo`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish2_ci;

