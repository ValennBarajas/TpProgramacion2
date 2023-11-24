use tplab1
create table Guia_Paternal(
id_PG int,
edad_min int,
constraint pk_PG primary key (id_PG)
)
create table Genero_Peliculas(
id_genero int,
genero varchar (30),
constraint pk_genero primary key (id_genero)
)
create table Actores(
id_actor int identity (1,1),
nom_actor varchar (50),
ape_actor varchar(50),
constraint pk_id_actor primary key (id_actor)
)
create table Directores(
id_director int identity (1,1),
nom_direc varchar (50),
ape_direc varchar(50),
constraint pk_id_direc primary key (id_director)
)
create table Estado_Butacas(
id_estado int,
descripcion varchar(50),
constraint pk_estado primary key (id_estado)
)
create table Tipo_Sala(
id_tipo int,
tipo varchar (20),
precio_sala decimal,
constraint pk_tipo primary key (id_tipo)
)
create table Salas(
cod_sala int,
nro_sala int,
id_tipo int,
estado varchar(50)
constraint pk_sala primary key (cod_sala),
constraint fk_tipo_salas foreign key (id_tipo) references Tipo_Sala (id_tipo)
)
create table Peliculas(
cod_pelicula int identity (1,1),
titulo varchar (20),
sinopsis varchar (100),
id_PG int,
id_genero int,
id_director int,
fecha datetime,
estado varchar(50)
constraint pk_pelicula primary key (cod_pelicula),
constraint fk_guia_peliculas foreign key (id_PG) references Guia_Paternal (id_PG),
constraint fk_genero_peliculas foreign key (id_genero) references Genero_Peliculas
(id_genero),
constraint fk_id_director foreign key (id_director) references Directores (id_director)
)

create table Reparto(
id_reparto int,
id_actor int,
cod_pelicula int,
puesto varchar(100)
constraint pk_reparto primary key (id_reparto),
constraint fk_id_actor foreign key (id_actor) references Actores (id_actor),
constraint fk_peliculas foreign key (cod_pelicula) references Peliculas (cod_pelicula)
)
create table Funciones(
nro_funcion int,
cod_sala int,
fecha_horario datetime,
cod_pelicula int,
constraint pk_funcion primary key (nro_funcion),
constraint fk_salas_funciones foreign key (cod_sala) references Salas (cod_sala),
constraint fk_peliculas_salas foreign key (cod_pelicula) references Peliculas (cod_pelicula)
)
create table Butacas(
id_butaca int,
fila int,
columna int,
nro_funcion int,
id_estado int,
constraint pk_butaca primary key (id_butaca),
constraint fk_estado_butacas foreign key (id_estado) references Estado_Butacas (id_estado),
constraint fk_nro_funcion foreign key (nro_funcion) references Funciones (nro_funcion)
)
create table Clientes(
id_cliente int identity (1,1),
documento varchar (20),
constraint pk_cliente primary key (id_cliente)
)
create table Formas_Pago(
cod_forma_pago int,
descripcion varchar (100),
constraint pk_forma_pago primary key (cod_forma_pago)
)
create table Reservas(
id_reserva int identity(1,1),
id_butaca int,
constraint pk_id_reserva primary key (id_reserva),
constraint fk_id_butaca foreign key (id_butaca) references Butacas (id_butaca)
)
create table Comprobantes(
nro_comprobante int identity(1,1),
fecha datetime,
id_cliente int,
cod_forma_pago int,
fecha_baja datetime
constraint nro_comprobante primary key (nro_comprobante),
constraint fk_id_cliente foreign key (id_cliente) references Clientes (id_cliente)
)
create table Detalle_Comprobantes(
id_detalle int,
nro_comprobante int,
precio decimal,
id_butaca int,
descuento decimal (10,2),
constraint pk_detalle primary key (id_detalle),
constraint fk_butacas_detalles foreign key (id_butaca) references Butacas (id_butaca),
constraint fk_comprobante_detalles foreign key (nro_comprobante) references
Comprobantes(nro_comprobante)
)

INSERT INTO Guia_Paternal (id_PG, edad_min) VALUES (1, 18)
INSERT INTO Guia_Paternal (id_PG, edad_min) VALUES (2, 21)
INSERT INTO Guia_Paternal (id_PG, edad_min) VALUES (3, 0)
INSERT INTO Guia_Paternal (id_PG, edad_min) VALUES (4, 3)
INSERT INTO Guia_Paternal (id_PG, edad_min) VALUES (5, 12)
INSERT INTO Guia_Paternal (id_PG, edad_min) VALUES (6, 6)
INSERT INTO Guia_Paternal (id_PG, edad_min) VALUES (7, 10)
INSERT INTO Guia_Paternal (id_PG, edad_min) VALUES (8, 8)
INSERT INTO Guia_Paternal (id_PG, edad_min) VALUES (9, 13)
INSERT INTO Guia_Paternal (id_PG, edad_min) VALUES (10, 15)

INSERT INTO Genero_Peliculas (id_genero, genero) VALUES (1, 'Acción')
INSERT INTO Genero_Peliculas (id_genero, genero) VALUES (2, 'Comedia')
INSERT INTO Genero_Peliculas (id_genero, genero) VALUES (3, 'Drama')
INSERT INTO Genero_Peliculas (id_genero, genero) VALUES (4, 'Romance')
INSERT INTO Genero_Peliculas (id_genero, genero) VALUES (5, 'Ciencia ficción')
INSERT INTO Genero_Peliculas (id_genero, genero) VALUES (6, 'Aventura')
INSERT INTO Genero_Peliculas (id_genero, genero) VALUES (7, 'Thriller')
INSERT INTO Genero_Peliculas (id_genero, genero) VALUES (8, 'Fantasía')
INSERT INTO Genero_Peliculas (id_genero, genero) VALUES (9, 'Animación')
INSERT INTO Genero_Peliculas (id_genero, genero) VALUES (10, 'Documental')

INSERT INTO Actores (nom_actor, ape_actor) VALUES ('Brad', 'Pitt')
INSERT INTO Actores (nom_actor, ape_actor) VALUES ('Leonardo', 'DiCaprio')
INSERT INTO Actores (nom_actor, ape_actor) VALUES ('Tom', 'Hanks')
INSERT INTO Actores (nom_actor, ape_actor) VALUES ('Scarlett', 'Johansson')
INSERT INTO Actores (nom_actor, ape_actor) VALUES ('Will', 'Smith')
INSERT INTO Actores (nom_actor, ape_actor) VALUES ('Robert', 'Downey Jr.')
INSERT INTO Actores (nom_actor, ape_actor) VALUES ('Jennifer', 'Lawrence')
INSERT INTO Actores (nom_actor, ape_actor) VALUES ('Emma', 'Stone')
INSERT INTO Actores (nom_actor, ape_actor) VALUES ('Chris', 'Hemsworth')
INSERT INTO Actores (nom_actor, ape_actor) VALUES ('Angelina', 'Jolie')

INSERT INTO Directores (nom_direc, ape_direc) VALUES ('Christopher', 'Nolan')
INSERT INTO Directores (nom_direc, ape_direc) VALUES ('Steven', 'Spielberg')
INSERT INTO Directores (nom_direc, ape_direc) VALUES ('Quentin', 'Tarantino')
INSERT INTO Directores (nom_direc, ape_direc) VALUES ('James', 'Cameron')
INSERT INTO Directores (nom_direc, ape_direc) VALUES ('Martin', 'Scorsese')
INSERT INTO Directores (nom_direc, ape_direc) VALUES ('Tim', 'Burton')
INSERT INTO Directores (nom_direc, ape_direc) VALUES ('Peter', 'Jackson')
INSERT INTO Directores (nom_direc, ape_direc) VALUES ('Ridley', 'Scott')
INSERT INTO Directores (nom_direc, ape_direc) VALUES ('David', 'Fincher')
INSERT INTO Directores (nom_direc, ape_direc) VALUES ('Francis', 'Ford Coppola')

INSERT INTO Estado_Butacas (id_estado, descripcion) VALUES (1, 'Disponible')
INSERT INTO Estado_Butacas (id_estado, descripcion) VALUES (2, 'Ocupado')
INSERT INTO Estado_Butacas (id_estado, descripcion) VALUES (3, 'Reservado')
INSERT INTO Estado_Butacas (id_estado, descripcion) VALUES (4, 'Mantenimiento')
INSERT INTO Estado_Butacas (id_estado, descripcion) VALUES (5, 'Bloqueado')
INSERT INTO Estado_Butacas (id_estado, descripcion) VALUES (6, 'Vendido')
INSERT INTO Estado_Butacas (id_estado, descripcion) VALUES (7, 'Cancelado')
INSERT INTO Estado_Butacas (id_estado, descripcion) VALUES (8, 'Suspendido')
INSERT INTO Estado_Butacas (id_estado, descripcion) VALUES (9, 'No disponible')
INSERT INTO Estado_Butacas (id_estado, descripcion) VALUES (10, 'En reparación')

INSERT INTO Tipo_Sala (id_tipo, tipo, precio_sala)
VALUES (1, 'Sala A', 10.99),
       (2, 'Sala B', 15.99),
       (3, 'Sala C', 20.99),
       (4, 'Sala D', 25.99),
       (5, 'Sala E', 30.99),
       (6, 'Sala F', 35.99),
       (7, 'Sala G', 40.99),
       (8, 'Sala H', 45.99),
       (9, 'Sala I', 50.99),
       (10, 'Sala J', 55.99)

INSERT INTO Salas (cod_sala, nro_sala, id_tipo, estado)
VALUES (1, 101, 1, 'Disponible'),
 (2, 102, 2, 'Disponible'),
(3, 103, 1, 'Disponible'),
(4, 104, 3, 'Ocupada'),
(5, 105, 2, 'Disponible'),
(6, 106, 4, 'Ocupada'),
(7, 107, 1, 'Disponible'),
(8, 108, 5, 'Disponible'),
(9, 109, 3, 'Ocupada'),
(10, 110, 4, 'Disponible')

INSERT INTO Peliculas (titulo, sinopsis, id_PG, id_genero, id_director, fecha, estado)
VALUES ('Pelicula 1', 'Sinopsis de la Pelicula 1', 1, 1, 1, '2023-01-10' , 'Disponible'),
('Pelicula 2', 'Sinopsis de la Pelicula 2', 2, 2, 2, '2023-02-15','Disponible'),
('Pelicula 3', 'Sinopsis de la Pelicula 3', 3, 3, 3, '2023-03-20','No Disponible'),
('Pelicula 4', 'Sinopsis de la Pelicula 4', 1, 4, 4, '2023-04-25','Disponible'),
('Pelicula 5', 'Sinopsis de la Pelicula 5', 2, 5, 5, '2023-05-30','No Disponible'),
('Pelicula 6', 'Sinopsis de la Pelicula 6', 3, 6, 6, '2023-06-05','Disponible'),
('Pelicula 7', 'Sinopsis de la Pelicula 7', 1, 7, 7, '2023-07-10','Disponible'),
('Pelicula 8', 'Sinopsis de la Pelicula 8', 2, 8, 8, '2023-08-15','No Disponible'),
('Pelicula 9', 'Sinopsis de la Pelicula 9', 3, 9, 9, '2023-09-20', 'No Disponible'),
('Pelicula 10', 'Sinopsis de la Pelicula 10', 1, 10, 10, '2023-10-25','Disponible')

INSERT INTO Reparto (id_reparto, id_actor, cod_pelicula, puesto)
VALUES (1, 1, 1, 'Protagonista'),
(2, 2, 1, 'Secundario'),
(3, 3, 2, 'Protagonista'),
(4, 4, 3, 'Antagonista'),
(5, 5, 2, 'Secundario'),
(6, 6, 3, 'Extra'),
(7, 7, 1, 'Antagonista'),
(8, 8, 2, 'Secundario'),
(9, 9, 3, 'Protagonista'),
(10, 10, 1, 'Secundario')

INSERT INTO Funciones (nro_funcion, cod_sala, fecha_horario, cod_pelicula)
VALUES (1, 1, '2023-01-10 14:00:00', 1),
(2, 2, '2023-01-11 15:30:00', 2),
(3, 3, '2023-01-12 18:00:00', 10),
(4, 4, '2023-01-13 20:15:00', 4),
(5, 5, '2023-01-14 14:30:00', 7),
(6, 6, '2023-01-15 17:45:00', 1),
(7, 7, '2023-01-16 16:00:00', 2),
(8, 8, '2023-01-17 19:30:00', 10),
(9, 9, '2023-01-18 21:00:00', 4),
(10, 10, '2023-01-19 14:30:00', 7)

INSERT INTO Butacas (id_butaca, fila, columna, nro_funcion, id_estado)
VALUES 
    (1, 1, 1, 1, 1),
    (2, 1, 2, 1, 1),
    (3, 1, 3, 1, 1),
    (4, 2, 1, 1, 1),
    (5, 2, 2, 1, 1),
    (6, 2, 3, 1, 1),
    (7, 3, 1, 1, 1),
    (8, 3, 2, 1, 1),
    (9, 3, 3, 1, 1),
    (10, 4, 1, 1, 1),
	(11, 1, 1, 2, 1),
    (12, 1, 2, 2, 1),
    (13, 1, 3, 2, 1),
    (14, 2, 1, 2, 1),
    (15, 2, 2, 2, 1),
    (16, 2, 3, 2, 1),
    (17, 3, 1, 2, 1),
    (18, 3, 2, 2, 1),
    (19, 3, 3, 2, 1),
    (20, 4, 1, 2, 1),
	(21, 1, 1, 3, 1),
    (22, 1, 2, 3, 1),
    (23, 1, 3, 3, 1),
    (24, 2, 1, 3, 1),
    (25, 2, 2, 3, 1),
    (26, 2, 3, 3, 1),
    (27, 3, 1, 3, 1),
    (28, 3, 2, 3, 1),
    (29, 3, 3, 3, 1),
    (30, 4, 1, 3, 1),
	(31, 1, 1, 4, 1),
    (32, 1, 2, 4, 1),
    (33, 1, 3, 4, 1),
    (34, 2, 1, 4, 1),
    (35, 2, 2, 4, 1),
    (36, 2, 3, 4, 1),
    (37, 3, 1, 4, 1),
    (38, 3, 2, 4, 1),
    (39, 3, 3, 4, 1),
    (40, 4, 1, 4, 1),
	(41, 1, 1, 5, 1),
    (42, 1, 2, 5, 1),
    (43, 1, 3, 5, 1),
    (44, 2, 1, 5, 1),
    (45, 2, 2, 5, 1),
    (46, 2, 3, 5, 1),
    (47, 3, 1, 5, 1),
    (48, 3, 2, 5, 1),
    (49, 3, 3, 5, 1),
    (50, 4, 1, 5, 1),
	(51, 1, 1, 6, 1),
    (52, 1, 2, 6, 1),
    (53, 1, 3, 6, 1),
    (54, 2, 1, 6, 1),
    (55, 2, 2, 6, 1),
    (56, 2, 3, 6, 1),
    (57, 3, 1, 6, 1),
    (58, 3, 2, 6, 1),
    (59, 3, 3, 6, 1),
    (60, 4, 1, 6, 1),
	(61, 1, 1, 7, 1),
    (62, 1, 2, 7, 1),
    (63, 1, 3, 7, 1),
    (64, 2, 1, 7, 1),
    (65, 2, 2, 7, 1),
    (66, 2, 3, 7, 1),
    (67, 3, 1, 7, 1),
    (68, 3, 2, 7, 1),
    (69, 3, 3, 7, 1),
    (70, 4, 1, 7, 1),
	(71, 1, 1, 8, 1),
    (72, 1, 2, 8, 1),
    (73, 1, 3, 8, 1),
    (74, 2, 1, 8, 1),
    (75, 2, 2, 8, 1),
    (76, 2, 3, 8, 1),
    (77, 3, 1, 8, 1),
    (78, 3, 2, 8, 1),
    (79, 3, 3, 8, 1),
    (80, 4, 1, 8, 1),
	(81, 1, 1, 9, 1),
    (82, 1, 2, 9, 1),
    (83, 1, 3, 9, 1),
    (84, 2, 1, 9, 1),
    (85, 2, 2, 9, 1),
    (86, 2, 3, 9, 1),
    (87, 3, 1, 9, 1),
    (88, 3, 2, 9, 1),
    (89, 3, 3, 9, 1),
    (90, 4, 1, 9, 1),
	(91, 1, 1, 10, 1),
    (92, 1, 2, 10, 1),
    (93, 1, 3, 10, 1),
    (94, 2, 1, 10, 1),
    (95, 2, 2, 10, 1),
    (96, 2, 3, 10, 1),
    (97, 3, 1, 10, 1),
    (98, 3, 2, 10, 1),
    (99, 3, 3, 10, 1),
    (100, 4, 1, 10, 1)

INSERT INTO Clientes (documento)
VALUES 
    ('123456789A'),
    ('987654321B'),
    ('456123789C'),
    ('789456123D'),
    ('321654987E'),
    ('654789321F'),
    ('258369147G'),
    ('741852963H'),
    ('963852741I'),
    ('852963147J')

INSERT INTO Formas_Pago (cod_forma_pago, descripcion)
VALUES 
    (1, 'Efectivo'),
    (2, 'Tarjeta de Crédito'),
    (3, 'Tarjeta de Débito'),
    (4, 'PayPal'),
    (5, 'Transferencia Bancaria'),
    (6, 'Cheque'),
    (7, 'Bitcoin'),
    (8, 'Apple Pay'),
    (9, 'Google Wallet'),
    (10, 'Stripe')

INSERT INTO Reservas (id_butaca)
VALUES 
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9),
    (10)

INSERT INTO Comprobantes (fecha, id_cliente, cod_forma_pago, fecha_baja)
VALUES 
    ('2023-01-01 10:00:00', 1, 1,null),
    ('2023-01-02 11:30:00', 2, 2,null),
    ('2023-01-03 13:00:00', 3, 3,null),
    ('2023-01-04 15:15:00', 4, 4,null),
    ('2023-01-05 14:30:00', 5, 1,null),
    ('2023-01-06 16:45:00', 6, 6,null),
    ('2023-01-07 12:00:00', 7, 7,null),
    ('2023-01-08 09:30:00', 8, 2,null),
    ('2023-01-09 18:00:00', 9, 1,null),
    ('2023-01-10 17:30:00', 10, 1,null)

INSERT INTO Detalle_Comprobantes (id_detalle, nro_comprobante, precio, id_butaca, descuento)
VALUES 
    (1, 1, 15.00, 1, 5.00),
    (2, 2, 20.00, 2, 6.00),
    (3, 3, 18.50, 3, 4.50),
    (4, 4, 25.00, 4, 7.00),
    (5, 5, 22.00, 5, 6.50),
    (6, 6, 30.00, 6, 8.00),
    (7, 7, 21.50, 7, 5.50),
    (8, 8, 28.00, 8, 7.50),
    (9, 9, 27.50, 9, 6.50),
    (10, 10, 32.00, 10, 8.50)

create proc sp_prox_pelicula
@next int output
as
begin
	SET @next = (SELECT MAX(cod_pelicula)+1  FROM Peliculas)
end
create proc sp_prox_comprobante
@next int output
as
begin
	SET @next = (SELECT MAX(nro_comprobante)+1  FROM Comprobantes)
end


create proc sp_consultar_actores
as
begin
	SELECT * from Actores
end

create proc sp_consultar_detalles
as
begin
	SELECT nro_comprobante,precio,id_butaca,descuento from Detalle_Comprobantes
end
exec sp_consultar_detalles

create proc sp_consultar_butacas
@cod_funcion int = 0
as
begin
if(@cod_funcion = 0)
select * from Butacas
else
SELECT * from Butacas b join Funciones f on b.nro_funcion=f.nro_funcion where b.nro_funcion=@cod_funcion
end


create proc sp_insertar_reparto
@reparto int,
@actor int, 
@cod_pelicula int, 
@puesto varchar(100)
AS
BEGIN
	INSERT INTO Reparto(id_reparto, id_actor, cod_pelicula, puesto)
    VALUES (@reparto, @actor, @cod_pelicula, @puesto);
END


create procedure sp_insertar_peliculas
@titulo varchar(255), 
@sinopsis varchar(255), 
@pg int,
@genero int,
@director int,
@pelicula_nro int OUTPUT
AS
BEGIN
	INSERT INTO Peliculas (titulo, sinopsis, id_PG, id_genero, id_director, fecha)
    VALUES (@titulo,@sinopsis,@pg,@genero,@director,GETDATE());
    SET @pelicula_nro = SCOPE_IDENTITY();
END


create procedure sp_insertar_detalle
@detalle int,
@nro_comprobante int,
@precio money,
@butaca int, 
@descuento decimal(4,2)
AS
BEGIN
	INSERT INTO Detalle_Comprobantes(id_detalle, nro_comprobante, precio, id_butaca, descuento)
    VALUES (@detalle,@nro_comprobante,@precio,@butaca, @descuento);
END


create procedure sp_insertar_comprobantes
@cliente int,
@forma_pago int,
@fecha datetime = null,
@nro_comprobante int OUTPUT
AS
BEGIN
	INSERT INTO Comprobantes (fecha, id_cliente, cod_forma_pago, fecha_baja)
    VALUES (GETDATE(),@cliente,@forma_pago,@fecha);
    SET @nro_comprobante = SCOPE_IDENTITY();
END


Create trigger t_insertar_detalle_comprobante
on Detalle_Comprobantes
for insert
as
begin
declare @butaca int
set @butaca = (select id_butaca from inserted)
update Butacas
set id_estado = 2
where id_butaca= @butaca
end


create procedure sp_consultar_pelicula
@cod_pelicula int = 0
as
begin
	if(@cod_pelicula=0)
	SELECT * from Peliculas
	else
	SELECT * from Peliculas where cod_pelicula=@cod_pelicula
end


create procedure sp_consultar_comprobante
@fecha_desde Datetime,
@fecha_hasta Datetime,
@cliente varchar(500)
AS
BEGIN
	SELECT * 
	FROM Comprobantes
	WHERE (@fecha_desde is null OR fecha >= @fecha_desde)
	AND (@fecha_hasta is null OR fecha <= @fecha_hasta)
	AND (@cliente is null OR id_cliente LIKE '%' + @cliente + '%')
	AND fecha_baja is null;
END
set dateformat mdy
exec sp_consultar_comprobante @fecha_desde = '12/21/2020', @fecha_hasta ='12/12/2023', @cliente=5


create procedure sp_consultar_genero
as
begin
	SELECT * from Genero_Peliculas
end


create procedure sp_consultar_guia
as
begin
	SELECT * from Guia_Paternal
end


create procedure sp_consultar_directores
as
begin
	SELECT * from Directores
end


create procedure sp_consultar_forma_pago
as
begin
	SELECT * from Formas_Pago
end


create procedure sp_consultar_reparto
as
begin
	SELECT * from Reparto
end


create proc sp_consultar_comprobantes
as
begin
	SELECT * from Comprobantes
end

create proc sp_consultar_funciones
as
begin
	SELECT * from Funciones
end

Create procedure Sp_ACTUALIZAR_PELICULAS
@id int
as
begin
Update Peliculas 
set estado = 'No Disponible'
where cod_pelicula = @id
end


Create trigger t_actualizar_butaca
on Detalle_Comprobantes
for insert
as
begin
declare @butaca int
set @butaca = (select id_butaca from inserted)
update Butacas
set id_estado = 2
where id_butaca= @butaca
end


select year(C.fecha) año, month(C.fecha) mes,Count(C.nro_comprobante) Cant
from Comprobantes C
JOIN Formas_Pago f ON C.cod_forma_pago = f.cod_forma_pago
where f.descripcion = 'Efectivo'
AND year(C.fecha) = year(getdate())
group BY year(C.fecha), month(C.fecha)
having count(C.nro_comprobante) >= 1;


select c.nro_comprobante,sum(precio*descuento)*count(d.id_butaca)/count(d.id_butaca)
Importe_promedio, count(d.id_butaca)
Cantidad_total
from comprobantes c join detalle_comprobantes d on c.nro_comprobante=d.nro_comprobante
join butacas b on d.id_butaca=b.id_butaca
where fila not in (2,7,13,22) and columna not in (1, 7, 10)
group by c.nro_comprobante


select nom_actor + ' ' + ape_actor 'Actor'
from actores a
where ape_actor like'[k-z]%' and id_actor not in(select a.id_actor
from
peliculas p join directores d on p.id_director=d.id_director
join genero_peliculas g on p.id_genero=g.id_genero
join Reparto r on p.cod_pelicula=r.cod_pelicula
join Actores a on r.id_actor=a.id_actor
where  d.id_director in (3,4) and genero in ('terror','accion'))

SELECT p.cod_pelicula, titulo, nom_direc, SUM(precio*descuento) AS TotalPrecioDescuento,
COUNT(d.id_butaca) AS CantidadButacas
FROM Comprobantes c
JOIN detalle_comprobantes d ON d.nro_comprobante = c.nro_comprobante
JOIN butacas b ON b.id_butaca = d.id_butaca
JOIN funciones f ON f.nro_funcion = b.nro_funcion
JOIN peliculas p ON p.cod_pelicula = f.cod_pelicula
JOIN directores di ON di.id_director = p.id_director
WHERE nom_direc LIKE '%[a,s,r,z]' AND d.nro_comprobante BETWEEN 5 AND 25
GROUP BY p.cod_pelicula, titulo, nom_direc
HAVING SUM(precio*descuento) / COUNT(d.id_butaca) < (
 SELECT SUM(precio*descuento) / COUNT(d.id_butaca)
 FROM comprobantes c1
 JOIN Detalle_Comprobantes d1 ON d1.nro_comprobante = c1.nro_comprobante
 WHERE YEAR(c1.fecha) = YEAR(GETDATE()))

create proc traer_clientes
as
begin 
	select* from Clientes
end
Create proc BuscarComprobantes
@id_cliente int
as
begin
Select * from Comprobantes where id_cliente = @id_cliente
end

Create proc sp_prec_sala
@id int
as
begin
Select precio_sala
from Tipo_Sala tp join Salas s on tp.id_tipo = s.id_tipo
join Funciones f on s.cod_sala = f.cod_sala
join Butacas b on b.nro_funcion = f.nro_funcion
where @id = b.id_butaca
end

create proc sp_prox_comprobante_s
as
begin
	SELECT MAX(nro_comprobante)+1  FROM Comprobantes
end

create proc sp_prox_detalle
as
begin
	SELECT MAX(id_detalle)+1  FROM Detalle_Comprobantes
end

create proc sp_prox_reparto
as
begin
	SELECT MAX(id_reparto)+1  FROM Reparto
end

create proc sp_prox_peliculas

as
begin
	SELECT MAX(cod_pelicula)+1  FROM Peliculas
end
exec sp_prox_peliculas

CREATE PROCEDURE SP_ELIMINAR_COMPROBANTE
	@comprobante int
AS
BEGIN
	UPDATE Comprobantes SET fecha_baja = GETDATE()
	WHERE nro_comprobante = @comprobante;
END
create PROCEDURE SP_MODIFICAR_MAESTRO 
	@cliente int, 
	@fecha datetime,
	@fecha_baja datetime = null,
	@cod_forma int, 
	@comprobante int
AS
BEGIN
	UPDATE Comprobantes SET id_cliente = @cliente,  fecha= @fecha, cod_forma_pago = @cod_forma, fecha_baja= @fecha_baja
	WHERE nro_comprobante = @comprobante;
END

CREATE PROCEDURE SP_REPORTE_COMPROBANTES
@fecha_desde datetime, 
@fecha_hasta datetime 

AS
BEGIN
	SELECT b.id_butaca as butaca, count(d.id_butaca) as cantidad_butacas
	FROM Detalle_Comprobantes d, Butacas b, Comprobantes c
	WHERE d.id_butaca = b.id_butaca
	AND d.nro_comprobante = c.nro_comprobante
	AND c.fecha between @fecha_desde and @fecha_hasta
	GROUP BY b.id_butaca;
END
CREATE PROCEDURE SP_ELIMINAR_pelicula
	@cod_pelicula int
AS
BEGIN
	UPDATE Peliculas SET estado = 'No Disponible'
	WHERE cod_pelicula = @cod_pelicula;
END

create PROCEDURE SP_MODIFICAR_pelicula
	@titulo varchar(20) = null, 
	@sinopsis varchar(100) = null,
	@id_PG int = null,
	@id_genero int = null,
	@id_director int = null,
	@fecha datetime = null,
	@estado varchar(50),
	@cod_pelicula int
AS
BEGIN
	UPDATE Peliculas SET titulo = @titulo,  sinopsis= @sinopsis, id_PG = @id_PG, id_genero= @id_genero, id_director=@id_director,fecha=@fecha,estado=@estado
	WHERE cod_pelicula = cod_pelicula;
END

create procedure sp_consultar_peliculas
as
begin
	SELECT * from Peliculas
end
