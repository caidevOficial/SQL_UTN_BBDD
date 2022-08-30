### 00. SQL – Tipos de lenguaje

SQL (structured query language) tiene los siguientes lenguajes:
I. **DDL** o *Data Definition Language*:
Que nos ayuda a crear la estructura de una base de datos. Existen 3 grandes
comandos:
* Create: Nos ayuda a crear bases de datos, tablas, vistas, índices, etc.
* Alter: Ayuda a alterar o modificar entidades.
* Drop: Nos ayuda a borrar. Hay que tener cuidado al utilizarlo.

3 objetos que manipularemos con el lenguaje DDL:
* Database o bases de datos (schemes)
* Table o tablas. Son la traducción a SQL de las entidades
* View o vistas: Se ofrece la proyección de los datos de la base de datos de forma entendible.

II. **DML** - *Data Manipulation Language* o *Lenguaje de Manipulación de Datos*
Son un conjunto de instrucciones que apoyarán al proceso de construcción de la BD y
afectan los registros en una tabla. Estas son operaciones básicas que realizamos sobre datos

tales como seleccionar algunos registros de una tabla, ar nuevos registros, eliminar
registros innecesarios y actualizar / modificar registros existentes.
Opciones DML

* SELECT: para seleccionar registros de tablas
* INSERT: para insertar nuevos registros
* UPDATE: para actualizar y modificar registros
* DELETE: para eliminar registros existentes.

III. **DCL** - *Lenguaje de Control de Datos*
Las declaraciones DLC son las encargadas de controlar el acceso de los usuarios a las BD.

Opciones DCL
* GRANT:
Declaración que permite a los usuarios leer / escribir en objetos que digamos de la BD.
* REVOKE:
Es la que ofrece a los usuarios estar sin permiso de lectura / escritura en objetos de la BD.
IV. TLC - Lenguaje de Control de Transacciones
Instrucciones que permiten administrar transacciones y tener integridad de datos dentro
de las declaraciones SQL. Se gestiona a través de las siguientes declaraciones
* BEGIN Transaction: Nos permite abrir una transacción
* COMMIT Transaction: Ofrece confirmar una transacción
* ROLLBACK Transaction: Devuelve una transacción en caso de error cometido.