CREATE DATABASE ejercicio1r;

USE ejercicio1r

create table Almacen(Nro int primary key, Responsable varchar(50))
create table Articulo(CodArt int primary key, Descripcion varchar(50), Precio
decimal(12, 3))
create table Material(CodMat int primary key, Descripcion varchar(50))
create table Proveedor(CodProv int primary key, Nombre varchar(50), Domicilio
varchar(50), Ciudad varchar(50))
create table Tiene(Nro int, CodArt int)
create table Compuesto_Por(CodArt int, CodMat int)
create table Provisto_Por(CodMat int, CodProv int)

insert into Almacen values
(1, 'Juan Perez'),
(2, 'Jose Basualdo'),
(3, 'Rogelio Rodriguez')

insert into Articulo values
(1, 'Sandwich JyQ', 5),
(2, 'Pancho', 6),
(3, 'Hamburguesa', 10),
(4, 'Hamburguesa completa', 15)

insert into Material values
(1, 'Pan'),
(2, 'Jamon'),
(3, 'Queso'),
(4, 'Salchicha'),
(5, 'Pan Pancho'),
(6, 'Paty'),
(7, 'Lechuga'),
(8, 'Tomate')

insert into Proveedor values
(1, 'Panadería Carlitos', 'Carlos Calvo 1212', 'CABA'),
(2, 'Fiambres Perez', 'San Martin 121', 'Pergamino'),
(3, 'Almacen San Pedrito', 'San Pedrito 1244', 'CABA'),
(4, 'Carnicería Boedo', 'Av. Boedo 3232', 'CABA'),
(5, 'Verdulería Platense', '5 3232', 'La Plata')

insert into Tiene values
--Juan Perez
(1, 1),
--Jose Basualdo
(2, 1),
(2, 2),
(2, 3),
(2, 4),
--Rogelio Rodriguez
(3, 3),
(3, 4)

insert into Compuesto_Por values
--Sandwich JyQ
(1, 1), (1, 2), (1, 3),
--Pancho
(2, 4), (2, 5),
--Hamburguesa
(3, 1), (3, 6),
--Hamburguesa completa
(4, 1), (4, 6), (4, 7), (4, 8)

insert into Provisto_Por values
--Pan
(1, 1), (1, 3),
--Jamon
(2, 2), (2, 3), (2, 4),
--Queso
(3, 2), (3, 3),
--Salchicha
(4, 3), (4, 4),
--Pan Pancho
(5, 1), (5, 3),
--Paty
(6, 3), (6, 4),
--Lechuga
(7, 3), (7, 5),
--Tomate
(8, 3), (8, 5)


-- 1. Listar los nombres de los proveedores de la ciudad de La Plata.
SELECT Nombre
FROM Proveedor
WHERE Proveedor.Ciudad = 'La Plata'

-- 2. Listar los números de artículos cuyo precio sea inferior a $10.
SELECT Articulo.CodArt
FROM Articulo
WHERE Precio < 10


-- 3. Listar los responsables de los almacenes.
SELECT Responsable
FROM Almacen

-- 4. Listar los códigos de los materiales que provea el proveedor 3 y no los provea el proveedor 5.
SELECT CodMat
FROM Provisto_Por
WHERE CodProv = 3 AND CodProv NOT IN (5)

-- 5. Listar los números de almacenes que almacenan el artículo 1.
SELECT Nro
FROM Tiene
WHERE CodArt = 1

-- 6. Listar los proveedores de Pergamino que se llamen Pérez
SELECT *
FROM Proveedor
WHERE Ciudad = 'Pergamino' AND Nombre LIKE '%PEREZ'


-- 7. Listar los almacenes que contienen los artículos 1 y los artículos 2 (ambos).
SELECT *
FROM Tiene
WHERE CodArt = 1
INTERSECT
SELECT *
FROM Tiene
WHERE CodArt = 2


-- 8. Listar los artículos que cuesten más de $100 o que estén compuestos por el material 1
SELECT Articulo.CodArt, Articulo.Descripcion, Articulo.Precio
FROM Articulo
JOIN Compuesto_Por ON Compuesto_Por.CodArt = Articulo.CodArt
WHERE Articulo.Precio > 100 OR Compuesto_Por.CodMat = 1