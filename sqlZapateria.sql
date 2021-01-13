create database zapateria
use zapateria

create table zapatos(
marca varchar (30),
tipo varchar (30),
talla int,
genero char,
cantidad_disponible int,
precio money)

alter table zapatos add id int primary key