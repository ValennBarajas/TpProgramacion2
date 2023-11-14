
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
id_actor int,
id_director int,
fecha datetime,
constraint pk_pelicula primary key (cod_pelicula),
constraint fk_guia_peliculas foreign key (id_PG) references Guia_Paternal (id_PG),
constraint fk_genero_peliculas foreign key (id_genero) references Genero_Peliculas
(id_genero),
constraint fk_id_actor foreign key (id_actor) references Actores (id_actor),
constraint fk_id_director foreign key (id_director) references Directores (id_director)
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
id_butaca int
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
