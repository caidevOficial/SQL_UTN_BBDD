SELECT 
alu.`legajo`
,alu.`nombre`
,acad.`materia`
,acad.`nota`
FROM 
`ejemplos`.`alumnos` AS alu,
`ejemplos`.`estado_academico` AS acad
WHERE alu.`legajo` = acad.`legajo`
ORDER BY 
`legajo` ASC
`nombre` ASC;