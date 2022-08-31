CREATE TABLE IF NOT EXISTS `ejemplos`.`estado_academico` (
    `legajo` INTEGER
    ,`materia` VARCHAR(25) NOT NULL
    ,`nota` INTEGER
    ,PRIMARY KEY (`legajo`, `materia`)
    ,FOREIGN KEY (`legajo`) REFERENCES `alumnos`(`legajo`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_spanish2_ci;