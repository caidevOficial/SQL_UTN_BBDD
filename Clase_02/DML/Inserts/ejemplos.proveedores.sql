CREATE TABLE IF NOT EXISTS `ejemplos`.`PROVEEDORES`(
    `NUMERO` INT NOT NULL,
    `NOMBRE` VARCHAR(20) NOT NULL,
    `DOMICILIO` VARCHAR(15) NOT NULL,
    `LOCALIDAD` VARCHAR(12),
    PRIMARY KEY (`NUMERO`)
);
