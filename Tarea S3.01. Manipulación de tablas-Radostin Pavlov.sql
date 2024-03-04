

# Nivel 1
-- Ejercicio 1:  Tu tarea es diseñar y crear una tabla llamada "credit_card" que almacene detalles cruciales sobre las tarjetas de crédito. 
-- La nueva tabla debe ser capaz de identificar de forma única cada tarjeta y establecer una relación adecuada con las otras dos tablas ("transaction" y "company"). 
-- Después de crear la tabla será necesario que ingreses la información del documento denominado "datos_introducir_credit". 
-- Recuerda mostrar el diagrama y realizar una breve descripción del mismo.

CREATE TABLE credit_card (
	id VARCHAR(15) NOT NULL PRIMARY KEY,
    iban VARCHAR(45) NOT NULL,
    pan VARCHAR(20) NOT NULL,
    pin VARCHAR(4) NOT NULL,
    cvv VARCHAR(3) NOT NULL,
    expiring_date VARCHAR(8) NOT NULL
);


SELECT * FROM transactions.credit_card;


-- Ejercicio 2: El departamento de Recursos Humanos ha identificado un error en el número de cuenta del usuario con: Id CcU-2938. 
-- Se requiere actualizar la información que identifica una cuenta bancaria a nivel internacional (identificado como "IBAN"): TR323456312213576817699999. 
-- Recuerda mostrar que el cambio se realizó.

UPDATE credit_card
SET iban = 'TR323456312213576817699999' -- era 'TR301950312213576817638661'
WHERE id = 'CcU-2938';

SELECT * FROM transactions.credit_card;

-- Ejercicio 3: En la tabla "transaction" ingresa un nuevo usuario con la siguiente información:
-- Id: 108B1D1D-5B23-A76C-55EF-C568E49A99DD; credit_card_id: CcU-9999; company_id: b-9999; user_id: 9999; lat: 829.999; longitud: -117.999; amount: 111.11; declined: 0

select *
from company
where id = 'b-9999';

INSERT INTO company (id) 
VALUES ('b-9999');

select *
from company
where id = 'b-9999';

INSERT INTO transaction (id, credit_card_id, company_id, user_id, lat, longitude, amount, declined) 
VALUES ('108B1D1D-5B23-A76C-55EF-C568E49A99DD', 'CcU-9999', 'b-9999', '9999', '829.999', '-117.999', '111.11', '0');

select *
from transaction
where id = '108B1D1D-5B23-A76C-55EF-C568E49A99DD';

ALTER TABLE transaction
MODIFY COLUMN timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

DELETE FROM transaction
where id = '108B1D1D-5B23-A76C-55EF-C568E49A99DD';

select *
from transaction
where id = '108B1D1D-5B23-A76C-55EF-C568E49A99DD';

INSERT INTO transaction (id, credit_card_id, company_id, user_id, lat, longitude, amount, declined) 
VALUES ('108B1D1D-5B23-A76C-55EF-C568E49A99DD', 'CcU-9999', 'b-9999', '9999', '829.999', '-117.999', '111.11', '0');

select *
from transaction
where id = '108B1D1D-5B23-A76C-55EF-C568E49A99DD';


-- Ejercicio 4: Desde recursos humanos te solicitan eliminar la columna 
-- "pan" de la tabla credit_card. Recuerda mostrar el cambio realizado.
ALTER TABLE credit_card
DROP COLUMN pan;

select * from credit_card;


# Nivel 2
-- Ejercicio 1: Elimina el registro con IBAN 02C6201E-D90A-1859-B4EE-*88D2986D3B02 de la base de datos.
-- Comprobar con Lucía !!!

SELECT * FROM credit_card
WHERE iban = '02C6201E-D90A-1859-B4EE-*88D2986D3B02';              

DELETE FROM credit_card
WHERE iban = '02C6201E-D90A-1859-B4EE-88D2986D3B02';
               

-- Ejercicio 2:  Crear una vista llamada VistaMarketing que contenga la siguiente 
-- información: Nombre de la compañía. Teléfono de contacto. País de residencia. 
-- Media de compra realizada por cada compañía. Presenta la vista creada, ordenando 
-- los datos de mayor a menor promedio de compra

CREATE VIEW VistaMarketing AS
    SELECT 
        company_name AS Compañía,
        phone AS Teléfono,
        country AS País,
        AVG(amount) AS `Promedio compra`
    FROM
        company
            JOIN
        transaction ON company.id = transaction.company_id
    GROUP BY company_name
    ORDER BY `Promedio compra` DESC;

SELECT * FROM transactions.vistamarketing;



-- Ejercicio 3: Filtra la vista VistaMarketing para mostrar 
-- sólo las compañías que tienen su país de residencia en "Germany"

SELECT * FROM transactions.vistamarketing WHERE País = 'Germany';


# Nivel 3
-- Ejercicio 1: La próxima semana tendrás una nueva reunión con los gerentes de marketing. 
-- Un compañero de tu equipo realizó modificaciones en la base de datos, pero no recuerda cómo las realizó. 
-- Te pide que le ayudes a dejar los comandos ejecutados para obtener las siguientes modificaciones (se espera que realicen 6 cambios): ver modelo
-- Recordatorio: En esta actividad, es necesario que describas el "paso a paso" de las tareas realizadas. 
-- Es importante realizar descripciones sencillas, simples y fáciles de comprender.
-- Para realizar esta actividad deberás trabajar con los archivos denominados "estructura_datos_user" y "datos_introducir_user"

-- Paso 1. Ejecutar consulta estructura_datos_user.sql para crear tabla nueva

-- Paso 2. Ejecutar consulta datos_introducir_user.sql para insertar datos en tabla nueva

-- Paso 3. Cambiar nombre de tabla user a data_user
alter table user rename to data_user;

-- Paso 4. Eliminar el campo website de la tabla company
ALTER TABLE company DROP COLUMN website;

-- Paso 5. Crear el campo fecha_actual de tipo DATE en la tabla credit_card
ALTER TABLE credit_card ADD fecha_actual DATE;

-- Paso 6. Crear modelo por Reverse Engineering










-- Ejercicio 2: La empresa también te solicita crear una vista llamada "InformeTecnico" que contenga la siguiente información:
-- ID de la transacción, Nombre del usuario/a, Apellido del usuario/a, IBAN de la tarjeta de crédito usada, Nombre de la compañía de la transacción realizada.
-- Asegúrate de incluir información relevante de ambas tablas y utiliza alias para cambiar de nombre columnas según sea necesario.
-- Muestra los resultados de la vista, ordena los resultados de forma descendente en función de la variable ID de transacción.













