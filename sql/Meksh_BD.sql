drop database if exists Meksh;
create database Meksh;
use Meksh;

create table Usuario(idUsuario int primary key not null auto_increment, 
						nombre_Usuario varchar(30),
						correo_Usuario varchar(100),
						contraseña varchar(20));

create table TipoUsuario(idTipoUsuario int primary key not null,
						tipo_Usuario varchar(25));
                        
create table RelUsuarioTipo(idRelUsuarioTipo int primary key not null auto_increment,
						idUsuario int,
                        idTipoUsuario int,
                        foreign key(idUsuario) references Usuario(idUsuario),
                        foreign key(idTipoUsuario) references TipoUsuario(idTipoUsuario));

create table Perfil(idPerfil int primary key not null,
						idUsuario int,
                        total_Logros int,
                        racha_Record int,
                        foreign key(idUsuario) references Usuario(idUsuario));
                        
create table Avatar(idAvatar int primary key not null,
						nombre_Avatar varchar(30),
                        avatar blob,
                        tipo_Avatar varchar(20));

create table RelPerfilAvatar(idRelPerfilAvatar int primary key not null,
						idPerfil int,
                        idAvatar int,
                        foreign key(idPerfil) references Perfil(idPerfil),
                        foreign key(idAvatar) references Avatar(idAvatar));

create table Banner(idBanner int primary key not null,
						nombre_Banner varchar(30),
                        banner blob,
                        tipo_Banner varchar(20));

create table RelPerfilBanner(idRelPerfilBanner int primary key not null,
						idPerfil int,
                        idBanner int,
                        foreign key(idPerfil) references Perfil(idPerfil),
                        foreign key(idBanner) references Banner(idBanner));

create table Metodo(idMetodo int primary key not null,
						nombre_Metodo varchar(30));
                        
create table DuracionDiaria(idDuracionDiaria int primary key not null,
						idPerfil int,
                        idMetodo int,
                        dia date,
                        tiempo time);

create table Racha(idRacha int primary key not null,
						idPerfil int,
                        racha_Actual int,
                        foreign key(idPerfil) references Perfil(idPerfil));

create table Logro(idLogro int primary key not null,
						nombre_Logro varchar(40),
                        descripcion_Logro varchar(100));

create table RelPerfilLogro(idRelPerfilLogro int primary key not null,
						idPerfil int,
                        idLogro int,
                        foreign key(idPerfil) references Perfil(idPerfil),
                        foreign key(idLogro) references Logro(idLogro));

create table Conjunto(idConjunto int primary key not null,
						idUsuario int,
                        nombre_Conjunto varchar(40),
                        ultimaModificacion_Conjunto datetime,
                        fechaCreacionConjunto datetime,
                        foreign key(idUsuario) references Usuario(idUsuario));

create table Tarjeta(idTarjeta int primary key not null,
						idConjunto int,
                        titulo_Tarjeta varchar(50),
                        descripcion_Tarjeta varchar(200),
                        foreign key(idConjunto) references Conjunto(idConjunto));

create table Tarea(idTarea int primary key not null,
						idUsuario int,
                        nombre_Tarea varchar(100),
                        fecha_Tarea datetime,
                        tiempo_Tarea time,
                        descripcion_Tarea varchar(200),
                        foreign key(idUsuario) references Usuario(idUsuario));

create table Hoja(idHoja int primary key not null);

drop procedure if exists sp_agregarBase;
delimiter //
create procedure sp_agregarBase(in nom varchar(30), correo varchar(100), contra varchar(20))
begin
declare xIdUsuario int;
declare xIdRelUsuarioTipo int;
	set xIdUsuario = (select ifnull(max(idUsuario),0) + 1 from Usuario);
	set xIdRelUsuarioTipo = (select ifnull(max(idRelUsuarioTipo),0) + 1 from RelUsuarioTipo);
    insert into Usuario values(xIdUsuario, nom, correo, contra);
    insert into RelUsuarioTipo values(xIdRelUsuarioTipo, xIdUsuario, 1);
end;//
delimiter ;

select * from Usuario;
select * from TipoUsuario;
select * from RelUsuarioTipo;
select * from Perfil;
select * from Avatar;
select * from RelPerfilAvatar;
select * from Banner;
select * from RelPerfilBanner;
select * from Metodo;
select * from DuracionDiaria;
select * from Racha;
select * from Logro;
select * from RelPerfilLogro;
select * from Conjunto;
select * from Tarjeta;
select * from Tarea;

insert into TipoUsuario values(1, 'Base'), (2, 'Premium'), (3, 'Administrador');
call sp_agregarBase('Ferna', 'fer@gmail.com', '1234.Fer');