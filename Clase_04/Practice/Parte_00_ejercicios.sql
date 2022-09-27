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

-- Respecto a tabla Alumnos
-- A) Qué cardinalidad tiene esta relación?
SELECT 
COUNT(*) AS Cardinalidad
FROM `ejemplos`.`alumnos` AS alu; -- Returns 6

-- B) Cuál es el grado de la relación?
SELECT 
COUNT(col.COLUMN_NAME) AS Grado_Relacion
FROM INFORMATION_SCHEMA.COLUMNS AS col
WHERE col.TABLE_NAME = 'alumnos'; -- Returns 5
-- C) Dicha tabla representa una entidad o una interrelación? Justificar.
/*
    Cada tupla representa una entidad 'Alumno' ya que todos los campos estan estrictamente
    relacionados al Alumno.
*/


-- Respecto a tabla Notas
-- A) Definir el dominio para la columna NOTA (renombrada estado_academico).
SELECT 
MIN(e_aca.`nota`) AS Valor_Minimo
,MAX(e_aca.`nota`) AS Valor_Maximo
,CONCAT(MIN(e_aca.`nota`), '-', MAX(e_aca.`nota`)) AS Rango
FROM `ejemplos`.`estado_academico` AS e_aca;
/* Rango del ejemplo del pdf: 4 - 9 */


-- B) Colocar un nombre técnico a la relación.
/*
    EL nombre tecnico de la relacion es relacion base o real
*/
-- C) Indicar cuál o cuáles campos pueden identificar a la fila unívocamente.

/*
    En la tabla 'alumnos' El campo pk es legajo
    En la tabla 'estado_academico' los campos pk son legajo y materia
*/
