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