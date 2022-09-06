CREATE OR REPLACE VIEW `ejemplos`.`proveedores_2_vw` 
AS
    SELECT 
        prov.`numero`
        ,prov.`nombre`
        ,prov.`domicilio`
        ,prov.`localidad`
    FROM 
    `ejemplos`.`proveedores` AS prov
    WHERE prov.`localidad` = 'Wilde';
