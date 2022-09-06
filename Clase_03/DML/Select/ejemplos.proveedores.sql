-- Ejemplo 01
SELECT 
`numero`
,`nombre`
FROM `ejemplos`.`proveedores`
WHERE localidad = "CAPITAL";

-- Ejemplo 02
SELECT DISTINCT
`localidad`
FROM `ejemplos`.`proveedores`;

-- Ejemplo 03
SELECT
`localidad`
FROM `ejemplos`.`proveedores`
WHERE `localidad` = "Berazategui" 
AND `nombre` LIKE "Distribuidora %";

-- Ejemplo 04
SELECT
`localidad`
FROM `ejemplos`.`proveedores`
WHERE `localidad` = "Berazategui" 
ORDER BY `numero` DESC;