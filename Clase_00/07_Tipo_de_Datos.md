### 7. Tipos de datos en MYSQL
I. DATOS NUMÉRICOS
Listado de cada uno de los tipos de dato numéricos en MySQL, su ocupación en disco y
valores.

* INT (INTEGER): Ocupación de 4 bytes con valores entre -2147483648 y
2147483647 o entre 0 y 4294967295.

* SMALLINT: Ocupación de 2 bytes con valores entre -32768 y 32767 o entre 0
y 65535.

* TINYINT: Ocupación de 1 bytes con valores entre -128 y 127 o entre 0 y 255.

* MEDIUMINT: Ocupación de 3 bytes con valores entre -8388608 y 8388607 o
entre 0 y 16777215.

* BIGINT: Ocupación de 8 bytes con valores entre -8388608 y 8388607 o entre 0 y 16777215.

* DECIMAL (NUMERIC): Almacena los números de coma flotante como cadenas
o string.

* FLOAT (m,d): Almacena números de coma flotante, donde ‘m’ es el número
de dígitos de la parte entera y ‘d’ el número de decimales.

* DOUBLE (REAL): Almacena número de coma flotante con precisión doble.
Igual que FLOAT, la diferencia es el rango de valores posibles.

* BIT (BOOL, BOOLEAN): Número entero con valor 0 o 1.

II. FORMATO FECHA

* DATE: Válido para almacenar una fecha con año, mes y día, su rango oscila
entre ‘1000-01-01′ y ‘9999-12-31′.

* DATETIME: Almacena una fecha (año-mes-día) y una hora (horas-minutos-
segundos), su rango oscila entre ‘1000-01-01 00:00:00′ y ‘9999-12-31
23:59:59′.

* TIME: Válido para almacenar una hora (horas-minutos-segundos). Su rango
de horas oscila entre -838-59-59 y 838-59-59. El formato almacenado es
‘HH:MM:SS’.

* TIMESTAMP: Almacena una fecha y hora UTC. El rango de valores oscila entre
‘1970-01-01 00:00:01′ y ‘2038-01-19 03:14:07′.

* YEAR: Almacena un año dado con 2 o 4 dígitos de longitud, por defecto son 4.
El rango de valores oscila entre 1901 y 2155 con 4 dígitos. Mientras que con
2 dígitos el rango es desde 1970 a 2069 (70-69).

III. FORMATO STRING

* CHAR: Ocupación fija cuya longitud comprende de 1 a 255 caracteres.

* VARCHAR: Ocupación variable cuya longitud comprende de 1 a 255
caracteres.

* TINYBLOB: Una longitud máxima de 255 caracteres. Válido para objetos
binarios como son un fichero de texto, imágenes, ficheros de audio o vídeo.
No distingue entre minúsculas y mayúsculas.

* BLOB: Una longitud máxima de 65.535 caracteres. Válido para objetos
binarios como son un fichero de texto, imágenes, ficheros de audio o vídeo.
No distingue entre minúsculas y mayúsculas.

* MEDIUMBLOB: Una longitud máxima de 16.777.215 caracteres. Válido para
objetos binarios como son un fichero de texto, imágenes, ficheros de audio o
vídeo. No distingue entre minúsculas y mayúsculas.

* LONGBLOB: Una longitud máxima de 4.294.967.298 caracteres. Válido para
objetos binarios como son un fichero de texto, imágenes, ficheros de audio o
vídeo. No distingue entre minúsculas y mayúsculas.

* SET: Almacena 0, uno o varios valores una lista con un máximo de 64 posibles
valores.

* ENUM: Igual que SET, pero solo puede almacenar un valor.

* TINYTEXT: Una longitud máxima de 255 caracteres. Sirve para almacenar
texto plano sin formato. Distingue entre minúsculas y mayúsculas.

* TEXT: Una longitud máxima de 65.535 caracteres. Sirve para almacenar texto
plano sin formato. Distingue entre minúsculas y mayúsculas.

* MEDIUMTEXT: Una longitud máxima de 16.777.215 caracteres. Sirve para
almacenar texto plano sin formato. Distingue entre minúsculas y mayúsculas.

* LONGTEXT: Una longitud máxima de 4.294.967.298 caracteres. Sirve para
almacenar texto plano sin formato. Distingue entre minúsculas y mayúsculas