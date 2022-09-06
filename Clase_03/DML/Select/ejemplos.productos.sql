-- Ejemplo 01
SELECT *
FROM `ejemplos`.`productos`
WHERE `pnombre` LIKE "A%";

-- Ejemplo 02
SELECT `nombre`
FROM `ejemplos`.`proveedores`
WHERE `numero` IN(
    SELECT `numero`
    FROM `prov-prod`
    WHERE `pnro` = 004
);

-- Ejemplo 03
SELECT `pnro`
FROM `ejemplos`.`productos`
WHERE `precio` < (
    SELECT MAX(`precio`)
    FROM `ejemplos`.`productos`
);

-- Ejemplo 04
SELECT `pnro`
FROM `ejemplos`.`productos`
WHERE `precio` < 6
UNION
SELECT `pnro`
FROM `prov-prod`
WHERE `numero` = 102;