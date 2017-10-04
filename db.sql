/*
	TIPOS DE CAMPOS
	INT 		=NUMERICO,
	VARCHAR		=TEXTO

	TIPOS DE PARAMETROS
	NOT NULL	= NO PUEDE IR VACIO
	PRIMARY KEY	= LLAVE PRIMARIA
	FOREIGN KEY	= LLAVE FORANEA
*/

/*crear base de datos*/
CREATE DATABASE prueba;

/*usar base de datos*/
USE prueba;

/*ver tablas*/
SHOW TABLES

/*crear tabla*/
CREATE TABLE  status(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	status VARCHAR(60) NOT NULL
);

CREATE TABLE  usuario(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	nombre VARCHAR(60) NOT NULL,
	apellido VARCHAR(60) NOT NULL,
	id_status INT NOT NULL
);

/*DEFINIR LLAVES FORANEAS*/
ALTER TABLE usuario ADD FOREIGN KEY(id_status) REFERENCES status(id) ON DELETE CASCADE ON UPDATE CASCADE;

/*insertar varios datos en tablas */
INSERT INTO status (status) VALUES ('activo'), ('inactivo');

INSERT INTO usuario (nombre, apellido, id_status) 
VALUES ('camilo', 'perez', 1),('pedro','lancheros', 1),('andres','parada', 1),('migue','ruiz', 2);

/*insertar datos tablas */
INSERT INTO status (status) VALUES ('pendiente');

INSERT INTO usuario (nombre, apellido, id_status) VALUES ('rafael', 'rotis', 2);

/*ver registros*/
SELECT * FROM usuario;

/*actualizar registros siempre con el comparador where*/
UPDATE usuario SET nombre='cristian' WHERE id= 2;

/*borrar datos*/
DELETE FROM usuario where id=5;

/*INNER JOIN*/
SELECT paises.codigo_pais, paises.nombre_pais, ciudades.Ciudad FROM paises, ciudades WHERE paises.codigo_pais ='AF';

SELECT * FROM pages AS p INNER JOIN page_categories AS c ON p.category = c.id

SELECT 
	p.id, p.title, s.status, c.name 
FROM 
	pages AS p 
INNER JOIN 
	page_categories AS c ON p.category = c.id
INNER JOIN 
	statuses AS s on p.status = p.status = s.id 
WHERE 
	p.status =1;