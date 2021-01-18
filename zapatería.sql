use zapateria

select * from zapatos

ALTER TABLE zapatos
ALTER COLUMN genero varchar (20); 

insert into zapatos (marca, tipo, talla, genero, cantidad_disponible, precio) values ('Nike', 'tenis', 40, 'H',5, 180000)

create table zapatos(
id int primary key identity not null,
marca varchar (20) not null,
tipo varchar (20) not null, 
genero varchar (10) not null, 
cantidad_disponible int not null, 
precio Float)

alter table zapatos alter column precio money

create proc listar_zapatos
as
select * from zapatos

execute listar_zapatos

create proc agregar_zapatos
@marca varchar (20),
@tipo varchar(20),
@genero varchar (10),
@cantidad_disponible int,
@precio money
as
insert into zapatos (marca, tipo, genero, cantidad_disponible, precio)
values (@marca, @tipo, @genero, @cantidad_disponible, @precio)

execute agregar_zapatos 'Nike', 'Tenis','Hombre', 15, 180000
execute listar_zapatos

create proc eliminar_zapatos
@id int
as
delete from zapatos where id = @id

execute eliminar_zapatos 1
execute listar_zapatos

create proc actualizar_zapatos
@id int,
@marca varchar (20),
@tipo varchar(20),
@genero varchar (10),
@cantidad_disponible int,
@precio money
as
update zapatos set marca = @marca, tipo=@tipo, genero = @genero, cantidad_disponible =@cantidad_disponible, precio = @precio where id =@id

execute agregar_zapatos 'Nike', 'Tenis','Hombre', 15, 180000
execute listar_zapatos

execute actualizar_zapatos 2, 'Zodiac','Zapatillas','Mujer',8,165000


