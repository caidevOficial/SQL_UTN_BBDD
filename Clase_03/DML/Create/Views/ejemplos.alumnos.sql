CREATE OR REPLACE VIEW `ejemplos`.`alumnos_vw` 
AS
    SELECT `ejemplos`.`alumnos_vw`.`legajo`
    WHERE `legajo` > 1500;