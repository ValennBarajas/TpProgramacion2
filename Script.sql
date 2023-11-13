use tplab
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
reserva varchar (50),
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
INSERT INTO Guia_Paternal (id_PG, edad_min) VALUES (3, 25)
INSERT INTO Guia_Paternal (id_PG, edad_min) VALUES (4, 30)
INSERT INTO Guia_Paternal (id_PG, edad_min) VALUES (5, 35)
INSERT INTO Guia_Paternal (id_PG, edad_min) VALUES (6, 40)
INSERT INTO Guia_Paternal (id_PG, edad_min) VALUES (7, 45)
INSERT INTO Guia_Paternal (id_PG, edad_min) VALUES (8, 50)
INSERT INTO Guia_Paternal (id_PG, edad_min) VALUES (9, 55)
INSERT INTO Guia_Paternal (id_PG, edad_min) VALUES (10, 60)

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

INSERT INTO Salas (cod_sala, nro_sala, id_tipo)
VALUES (1, 101, 1),
 (2, 102, 2),
(3, 103, 1),
(4, 104, 3),
(5, 105, 2),
(6, 106, 4),
(7, 107, 1),
(8, 108, 5),
(9, 109, 3),
(10, 110, 4)

INSERT INTO Peliculas (titulo, sinopsis, id_PG, id_genero, id_director, fecha)
VALUES ('Pelicula 1', 'Sinopsis de la Pelicula 1', 1, 1, 1, '2023-01-10'),
('Pelicula 2', 'Sinopsis de la Pelicula 2', 2, 2, 2, '2023-02-15'),
('Pelicula 3', 'Sinopsis de la Pelicula 3', 3, 3, 3, '2023-03-20'),
('Pelicula 4', 'Sinopsis de la Pelicula 4', 1, 4, 4, '2023-04-25'),
('Pelicula 5', 'Sinopsis de la Pelicula 5', 2, 5, 5, '2023-05-30'),
('Pelicula 6', 'Sinopsis de la Pelicula 6', 3, 6, 6, '2023-06-05'),
('Pelicula 7', 'Sinopsis de la Pelicula 7', 1, 7, 7, '2023-07-10'),
('Pelicula 8', 'Sinopsis de la Pelicula 8', 2, 8, 8, '2023-08-15'),
('Pelicula 9', 'Sinopsis de la Pelicula 9', 3, 9, 9, '2023-09-20'),
('Pelicula 10', 'Sinopsis de la Pelicula 10', 1, 10, 10, '2023-10-25')

INSERT INTO Reparto (id_reparto, id_actor, cod_pelicula, puesto)
VALUES (1, 1, 1, 'Protagonista'),
(2, 2, 1, 'Secundario'),
(3, 3, 2, 'Protagonista'),
(4, 4, 3, 'Antagonista'),
(5, 5, 2, 'Secundario'),
(6, 6, 3, 'Protagonista'),
(7, 7, 1, 'Antagonista'),
(8, 8, 2, 'Secundario'),
(9, 9, 3, 'Protagonista'),
(10, 10, 1, 'Secundario')

INSERT INTO Funciones (nro_funcion, cod_sala, fecha_horario, cod_pelicula)
VALUES (1, 1, '2023-01-10 14:00:00', 1),
(2, 2, '2023-01-11 15:30:00', 2),
(3, 3, '2023-01-12 18:00:00', 3),
(4, 4, '2023-01-13 20:15:00', 4),
(5, 5, '2023-01-14 14:30:00', 5),
(6, 6, '2023-01-15 17:45:00', 1),
(7, 7, '2023-01-16 16:00:00', 2),
(8, 8, '2023-01-17 19:30:00', 3),
(9, 9, '2023-01-18 21:00:00', 4),
(10, 10, '2023-01-19 14:30:00', 5)

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
    (10, 4, 1, 1, 1)

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

INSERT INTO Comprobantes (fecha, id_cliente, cod_forma_pago, reserva)
VALUES 
    ('2023-01-01 10:00:00', 1, 1, 'Reserva 1'),
    ('2023-01-02 11:30:00', 2, 2, 'Reserva 2'),
    ('2023-01-03 13:00:00', 3, 3, 'Reserva 3'),
    ('2023-01-04 15:15:00', 4, 4, 'Reserva 4'),
    ('2023-01-05 14:30:00', 5, 5, 'Reserva 5'),
    ('2023-01-06 16:45:00', 6, 6, 'Reserva 6'),
    ('2023-01-07 12:00:00', 7, 7, 'Reserva 7'),
    ('2023-01-08 09:30:00', 8, 8, 'Reserva 8'),
    ('2023-01-09 18:00:00', 9, 9, 'Reserva 9'),
    ('2023-01-10 17:30:00', 10, 10, 'Reserva 10')

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

