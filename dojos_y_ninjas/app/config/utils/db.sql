-- Crear la base de datos `dojos_ninjas_schema`
CREATE DATABASE IF NOT EXISTS dojos_ninjas_schema;

-- Utilizar la base de datos `dojos_ninjas_schema`
USE dojos_ninjas_schema;

-- Crear la tabla `dojos`
CREATE TABLE IF NOT EXISTS dojos (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT, 
    name VARCHAR(45) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY (name)
);

-- Crear la tabla `ninjas`
CREATE TABLE IF NOT EXISTS ninjas (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT, 
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    age INT UNSIGNED NOT NULL,
    dojo_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (dojo_id) REFERENCES dojos(id)
);

-- Insertar datos en la tabla `dojos`
INSERT INTO dojos (name) 
VALUES 
    ('Coding Dojo Silicon Valley'), 
    ('Coding Dojo Seattle'), 
    ('Coding Dojo New York'),
    ('Coding Dojo Santiago'),
    ('Coding Dojo Lima'),
    ('Coding Dojo Buenos Aires'),
    ('Coding Dojo Asunción');

-- Insertar datos en la tabla `ninjas`
INSERT INTO ninjas (first_name, last_name, age, dojo_id)
VALUES 
    ('Juan', 'Perez', 25, 1),
    ('Pedro', 'Gonzalez', 30, 1),
    ('Maria', 'Gutierrez', 20, 2),
    ('Jose', 'Rodriguez', 22, 2),
    ('Luis', 'Garcia', 18, 3),
    ('Ana', 'Martinez', 19, 3),
    ('Carlos', 'Sanchez', 21, 4),
    ('Jorge', 'Gomez', 23, 4),
    ('Miguel', 'Ruiz', 24, 5),
    ('Sofia', 'Lopez', 26, 5),
    ('Alejandro', 'Hernandez', 27, 6),
    ('Fernanda', 'Diaz', 28, 6);

-- Seleccionar todos los datos de la tabla `dojos`
SELECT * FROM dojos;

-- Seleccionar todos los datos de la tabla `ninjas`
SELECT * FROM ninjas;

-- Seleccionar todos los datos de la tabla `dojo` y los ninjas que pertenecen a cada uno
SELECT dojos.name AS dojo_name, ninjas.first_name, ninjas.last_name, ninjas.age
FROM dojos
LEFT JOIN ninjas ON dojos.id = ninjas.dojo_id;