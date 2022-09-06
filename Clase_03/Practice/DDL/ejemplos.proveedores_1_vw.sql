CREATE OR REPLACE VIEW `ejemplos`.`proveedores_1_vw` 
AS
    SELECT 
        prov.`numero`
        ,prod.`numero`
        ,prov.`localidad`
    FROM 
    `ejemplos`.`proveedores` AS prov,
    `ejemplos`.`productos` AS prod
    WHERE prov.`localidad` = prod.`localidad`;
