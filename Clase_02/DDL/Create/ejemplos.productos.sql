CREATE TABLE IF NOT EXISTS `ejemplos`.`PRODUCTOS`(
    `PNRO` INT NOT NULL,
    `PNOMBRE` VARCHAR(20) NOT NULL,
    `PRECIO` INT NOT NULL,
    `TAMAÑO` VARCHAR(20),
    `LOCALIDAD` VARCHAR(12) NOT NULL,
    PRIMARY KEY (`PNRO`)
);