# Fundamentos de bases de datos
## Notas
---
### 1. 12 reglas de Codd para RDBMS
El Dr. Edgar Frank Codd (19 de agosto de 1923 - 18 de abril de 2003) fue un informático
mientras trabajaba para IBM e inventó el modelo relacional para la gestión de bases de
datos (base teórica para bases de datos relacionales). Codd propuso trece reglas
(numeradas del cero al doce) y dijo que, si un Sistema de gestión de bases de datos
cumple con estas reglas, puede llamarse como un Sistema de gestión de bases de datos
relacionales. Estas reglas se denominan reglas de Codd12. Casi ningún producto
comercial sigue a todos.
o Regla cero:
El sistema debe calificar como relacional, como base de datos y como sistema
de gestión. Para que un sistema califique como un sistema de gestión de bases
de datos relacionales (RDBMS), ese sistema debe usar sus recursos relacionales
(exclusivamente) para gestionar la base de datos.
Las otras 12 reglas derivan de esta regla. Las reglas son las siguientes:

I. Regla 1 La regla de la información:
Toda la información en la base de datos debe representarse de una sola
manera, es decir, mediante valores en posiciones de columna dentro de filas
de tablas.

II. Regla 2: La regla de acceso garantizado:
Todos los datos deben ser accesibles. Esta regla es esencialmente una
reformulación del requisito fundamental para las claves primarias. Dice que
cada valor escalar individual en la base de datos debe ser lógicamente
direccionable especificando el nombre de la tabla que contiene, el nombre
de la columna que contiene y el valor de la clave primaria de la fila que
contiene.

III. Regla 3 Tratamiento sistemático de valores nulos:
El RDBMS debe permitir que cada campo permanezca nulo (o vacío).
Específicamente, debe admitir una representación de "información faltante
e información inaplicable" que es sistemática, distinta de todos los valores
regulares (por ejemplo, "distinta de cero o cualquier otro número", en el caso
de valores numéricos) e independiente de los datos tipo. También está
implícito que tales representaciones deben ser manipuladas por el DBMS de
manera sistemática.

IV. Regla 4 Catálogo en línea activo basado en el modelo relacional:
El sistema debe admitir un catálogo relacional en línea, en línea, al que
puedan acceder los usuarios autorizados mediante su lenguaje de consulta
habitual. Es decir, los usuarios deben poder acceder a la estructura de la base
de datos (catálogo) utilizando el mismo lenguaje de consulta que utilizan
para acceder a los datos de la base de datos.

V. Regla 5 La regla integral del sub-idioma de datos:
El sistema debe admitir al menos un lenguaje relacional que
1. Tiene una sintaxis lineal
2. Se puede utilizar tanto de forma interactiva como dentro de los programas
de aplicación,
3. Admite operaciones de definición de datos (incluidas las definiciones de
vista), operaciones de manipulación de datos (actualización y recuperación),
restricciones de seguridad e integridad y operaciones de gestión de
transacciones (inicio, confirmación y reversión).

VI. Regla 6 La regla de actualización de la vista:
Todas las vistas que pueden actualizarse teóricamente deben ser
actualizadas por el sistema.

VII. Regla 7 inserción, actualización y eliminación de alto nivel:
El sistema debe admitir operadores de inserción, actualización y eliminación
establecidos en un momento. Esto significa que los datos se pueden
recuperar de una base de datos relacional en conjuntos construidos con
datos de múltiples filas y / o tablas múltiples. Esta regla establece que las
operaciones de inserción, actualización y eliminación deben ser compatibles
con cualquier conjunto recuperable en lugar de solo para una sola fila en una
sola tabla.

VIII. Regla 8 Independencia de los datos físicos:
Los cambios en el nivel físico (cómo se almacenan los datos, ya sea en
matrices o listas vinculadas, etc.) no deben requerir un cambio en una
aplicación basada en la estructura.

IX. Regla 9 Independencia de datos lógicos:
Los cambios en el nivel lógico (tablas, columnas, filas, etc.) no deben requerir
un cambio en una aplicación basada en la estructura. La independencia de
datos lógica es más difícil de lograr que la independencia de datos físicos.

X. Regla 10 Independencia de integridad:
Las restricciones de integridad deben especificarse por separado de los
programas de aplicación y almacenarse en el catálogo. Debe ser posible
cambiar tales restricciones cuando sea apropiado sin afectar
innecesariamente las aplicaciones existentes.

XI. Regla 11 Independencia de distribución:
La distribución de porciones de la base de datos a varias ubicaciones debe
ser invisible para los usuarios de la base de datos. Las aplicaciones existentes
deberían continuar funcionando con éxito:
1. cuando se introduce por primera vez una versión distribuida del DBMS; y
2. cuando los datos distribuidos existentes se redistribuyen alrededor del
sistema.

XII. Regla 12: La regla de no subversión:
Si el sistema proporciona una interfaz de bajo nivel (registro a la vez),
entonces esa interfaz no puede usarse para subvertir el sistema, por
ejemplo, omitiendo una restricción de seguridad o integridad relacional.