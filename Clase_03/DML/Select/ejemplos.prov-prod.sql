-- Ejemplo 01
SELECT COUNT(DISTINCT NUMERO) AS Cantidad
FROM `prov-prod`;

-- Ejemplo 02
SELECT COUNT(*)
FROM `prov-prod`
WHERE `pnro` = 002;

-- Ejemplo 03
SELECT 
`pnro`
,SUM(`cantidad`) AS Cantidad
FROM `prov-prod`
GROUP BY `pnro`;

-- Ejemplo 03
SELECT
`pnro`
FROM `prov-prod`
GROUP BY `pnro`
HAVING COUNT (*) > 1;