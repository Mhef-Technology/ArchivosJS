drop database if exists Meksh;
create database Meksh;
use Meksh;

#Creación de tablas
drop table if exists Usuario;
create table Usuario(idUsuario int primary key not null auto_increment, 
						nombre_Usuario varchar(30) unique,
						correo_Usuario varchar(100) unique,
						contraseña varchar(60));

drop table if exists TipoUsuario;
create table TipoUsuario(idTipoUsuario int primary key not null,
						tipo_Usuario varchar(25) unique);
 
drop table if exists RelUsuarioTipo;
create table RelUsuarioTipo(idRelUsuarioTipo int primary key not null auto_increment,
						idUsuario int,
                        idTipoUsuario int,
                        foreign key(idUsuario) references Usuario(idUsuario),
                        foreign key(idTipoUsuario) references TipoUsuario(idTipoUsuario));

drop table if exists Perfil;
create table Perfil(idPerfil int primary key not null,
						idUsuario int,
                        total_Logros int,
                        estatus_Actual int,
                        estatus_Record int,
                        tema varchar(5),
                        foreign key(idUsuario) references Usuario(idUsuario));
         
drop table if exists Avatar;
create table Avatar(idAvatar int primary key not null,
						nombre_Avatar varchar(30),
                        avatar blob,
                        tipo_Avatar varchar(20));

drop table if exists RelPerfilAvatar;
create table RelPerfilAvatar(idRelPerfilAvatar int primary key not null,
						idPerfil int,
                        idAvatar int,
                        foreign key(idPerfil) references Perfil(idPerfil),
                        foreign key(idAvatar) references Avatar(idAvatar));

drop table if exists Banner;
create table Banner(idBanner int primary key not null,
						nombre_Banner varchar(30),
                        banner blob,
                        tipo_Banner varchar(20));

drop table if exists RelPerfilBanner;
create table RelPerfilBanner(idRelPerfilBanner int primary key not null,
						idPerfil int,
                        idBanner int,
                        foreign key(idPerfil) references Perfil(idPerfil),
                        foreign key(idBanner) references Banner(idBanner));

drop table if exists Metodo;
create table Metodo(idMetodo int primary key not null,
						nombre_Metodo varchar(30) unique);

drop table if exists DuracionDiaria;
create table DuracionDiaria(idDuracionDiaria int primary key not null,
						idPerfil int,
                        idMetodo int,
                        dia date,
                        tiempo time);

drop table if exists Estatus;
create table Estatus(idEstatus int primary key not null,
						idPerfil int,
                        diaInicio date,
                        diaFin date,
                        diasTotales int,
                        foreign key(idPerfil) references Perfil(idPerfil));

drop table if exists Logro;
create table Logro(idLogro int primary key not null,
						nombre_Logro varchar(40) unique,
                        descripcionCorta_Logro varchar(100),
                        descripcionLarga_Logro varchar(200),
                        tipo_Logro varchar(20));

drop table if exists RelPerfilLogro;
create table RelPerfilLogro(idRelPerfilLogro int primary key not null,
						idPerfil int,
                        idLogro int,
                        foreign key(idPerfil) references Perfil(idPerfil),
                        foreign key(idLogro) references Logro(idLogro));

drop table if exists SolicitudAmistad;
create table SolicitudAmistad(idSolicitudAmistad int primary key not null,
						idUsuario_Envia int,
                        idUsuario_Recibe int,
                        fechaEnvio datetime,
                        foreign key(idUsuario_Envia) references Usuario(idUsuario),
                        foreign key(idUsuario_Recibe) references Usuario(idUsuario));

drop table if exists Amigo;
create table Amigo(idAmigo int primary key not null,
						idUsuario1 int,
                        idUsuario2 int,
                        fechaInicio_Amigo datetime,
                        foreign key(idUsuario1) references Usuario(idUsuario),
                        foreign key(idUsuario2) references Usuario(idUsuario));

drop table if exists Conjunto;
create table Conjunto(idConjunto int primary key not null,
						idUsuario int,
                        nombre_Conjunto varchar(40),
                        ultimaModificacion_Conjunto datetime,
                        fechaCreacion_Conjunto datetime,
                        foreign key(idUsuario) references Usuario(idUsuario));

drop table if exists Tarjeta;
create table Tarjeta(idTarjeta int primary key not null,
						idConjunto int,
                        pregunta_Tarjeta varchar(200),
                        respuesta_Tarjeta varchar(400),
                        foreign key(idConjunto) references Conjunto(idConjunto));

drop table if exists Tarea;
create table Tarea(idTarea int primary key not null,
						idUsuario int,
                        nombre_Tarea varchar(70),
                        fecha_Tarea datetime,
                        tiempo_Tarea time,
                        descripcion_Tarea varchar(200),
                        foreign key(idUsuario) references Usuario(idUsuario));

drop table if exists Hoja;
create table Hoja(idHoja int primary key not null,
						idUsuario int,
                        nombre_Hoja varchar(45),
                        ideasClave varchar(300),
                        notas varchar(600),
                        resumen varchar(400),
                        fechaCreacion_Hoja datetime,
                        ultimaModificacion_Hoja datetime,
                        foreign key(idUsuario) references Usuario(idUsuario));

drop table if exists MensajeSoporte;
create table MensajeSoporte(idMensajeSoporte int not null primary key,
						idUsuario int,
						contenido varchar(400),
						fechaEnvio_Mensaje datetime,
						foreign key (idUsuario) references Usuario(idUsuario));

#Creación de procedimientos
drop procedure if exists sp_agregarBase;
delimiter //
create procedure sp_agregarBase(in nom varchar(30), correo varchar(100), contra varchar(60))
begin
declare xIdUsuario int;
declare xIdRelUsuarioTipo int;
declare xIdPerfil int;
	set xIdUsuario = (select ifnull(max(idUsuario),0) + 1 from Usuario);
	set xIdRelUsuarioTipo = (select ifnull(max(idRelUsuarioTipo),0) + 1 from RelUsuarioTipo);
	set xIdPerfil = (select ifnull(max(idPerfil),0) + 1 from Perfil);
    insert into Usuario values(xIdUsuario, nom, correo, contra);
    insert into RelUsuarioTipo values(xIdRelUsuarioTipo, xIdUsuario, 1);
    insert into Perfil values(xIdPerfil, xIdUsuario, 0, 0, 0, 'light');
end;//
delimiter ;

drop procedure if exists sp_agregarLogros;
delimiter //
create procedure sp_agregarLogros(in usu varchar(30), logro varchar(40))
begin
declare xIdRel int;
declare xIdLogro int;
declare xIdPerfil int;
declare existe int;
declare xTot int;
declare existe1 int;
declare existe2 int;
declare existe3 int;
declare xMsj varchar(1);
	set existe = (select count(*) from vw_SearchAwards where nombre_Usuario = usu and nombre_Logro = logro);
    if(existe > 0) then
		set xMsj='n';
	else
		set xIdRel = (select ifnull(max(idRelPerfilLogro),0) + 1 from RelPerfilLogro);
		set xIdLogro = (select idLogro from Logro where nombre_Logro = logro);
		set xIdPerfil = (select idPerfil from Usuario inner join Perfil on Usuario.idUsuario = Perfil.idUsuario where nombre_Usuario = usu);
        set xTot = (select (total_Logros + 1) from Perfil where idPerfil = xIdPerfil);
		insert into RelPerfilLogro values(xIdRel, xIdPerfil, xIdLogro);
        update Perfil set total_Logros = xTot where idPerfil = xIdPerfil;
        
		set existe1 = (select count(*) from Usuario inner join Perfil on Usuario.idUsuario = Perfil.idUsuario inner join RelPerfilLogro on Perfil.idPerfil = RelPerfilLogro.idPerfil where nombre_Usuario = usu and idLogro = 1);
		set existe2 = (select count(*) from Usuario inner join Perfil on Usuario.idUsuario = Perfil.idUsuario inner join RelPerfilLogro on Perfil.idPerfil = RelPerfilLogro.idPerfil where nombre_Usuario = usu and idLogro = 2);
		set existe3 = (select count(*) from Usuario inner join Perfil on Usuario.idUsuario = Perfil.idUsuario inner join RelPerfilLogro on Perfil.idPerfil = RelPerfilLogro.idPerfil where nombre_Usuario = usu and idLogro = 3);
		if existe1 > 0 and existe2 > 0 and existe3 > 0 then
			insert into RelPerfilLogro values(xIdRel+1, xIdPerfil, 4);
            set xMsj='x';
		else
			set xMsj='s';
		end if;
	end if;
select xMsj as mensaje;
end;//
delimiter ;

drop procedure if exists sp_actualizarTarjeta;
delimiter //
create procedure sp_actualizarTarjeta(in usu varchar(30), conjunto varchar(40), tarjeta varchar(200), titulo varchar(200), descripcion varchar(400))
begin
declare xIdTarjeta int;
declare xIdConjunto int;
	set xIdTarjeta = (select idTarjeta from Usuario inner join Conjunto on Usuario.idUsuario = Conjunto.idUsuario inner join Tarjeta on Conjunto.idConjunto = Tarjeta.idConjunto where nombre_Usuario = usu and nombre_Conjunto = conjunto and pregunta_Tarjeta = tarjeta);
	set xIdConjunto = (select idConjunto from Usuario inner join Conjunto on Usuario.idUsuario = Conjunto.idUsuario where nombre_Usuario = usu and nombre_Conjunto = conjunto);
	update Tarjeta set pregunta_Tarjeta = titulo, respuesta_Tarjeta = descripcion where idTarjeta = xIdTarjeta;
	update Conjunto set ultimaModificacion_Conjunto = current_time() where idConjunto = xIdConjunto;
end;//
delimiter ;

drop procedure if exists sp_actualizarHoja;
delimiter //
create procedure sp_actualizarHoja(in usu varchar(30), hoja varchar(40), titHoja varchar(50), ideas varchar(300), notes varchar(600), resumen varchar(400))
begin
declare xIdHoja int;
	set xIdHoja = (select idHoja from Usuario inner join Hoja on Usuario.idUsuario = Hoja.idUsuario where nombre_Usuario = usu and nombre_Hoja = hoja);
	update Hoja set nombre_Hoja = titHoja, ideasClave = ideas, notas = notes, resumen = resumen, ultimaModificacion_Hoja = current_time() where idHoja = xIdHoja;
end;//
delimiter ;

drop procedure if exists sp_agregarConjunto;
delimiter //
create procedure sp_agregarConjunto(in usu varchar(30), conjunto varchar(40))
begin
declare xIdConjunto int;
declare xIdUsuario int;
declare existe int;
declare xMsj varchar(1);
	set existe = (select count(*) from Usuario inner join Conjunto on Usuario.idUsuario = Conjunto.idUsuario where nombre_Usuario = usu and nombre_Conjunto = conjunto);
    if(existe > 0) then
		set xMsj='n';
	else
		set xIdConjunto = (select ifnull(max(idConjunto),0) + 1 from Conjunto);
		set xIdUsuario = (select idUsuario from Usuario where nombre_Usuario = usu);
		insert into Conjunto values(xIdConjunto, xIdUsuario, conjunto, current_time(), current_time());
        set xMsj='s';
	end if;
select xMsj as mensaje;
end;//
delimiter ;

drop procedure if exists sp_agregarTarjeta;
delimiter //
create procedure sp_agregarTarjeta(in usu varchar(30), conjunto varchar(40), tarjeta varchar(200))
begin
declare xIdConjunto int;
declare xIdTarjeta int;
	set xIdTarjeta = (select ifnull(max(idTarjeta),0) + 1 from Tarjeta);
    set xIdConjunto = (select idConjunto from Usuario inner join Conjunto on Usuario.idUsuario = Conjunto.idUsuario where nombre_Usuario = usu and nombre_Conjunto = conjunto);
    insert into Tarjeta values(xIdTarjeta, xIdConjunto, tarjeta, '');
end;//
delimiter ;

drop procedure if exists sp_agregarTarjeta2;
delimiter //
create procedure sp_agregarTarjeta2(in usu varchar(30), conjunto varchar(40), pregunta varchar(200), respuesta varchar(400))
begin
declare xIdConjunto int;
declare xIdTarjeta int;
	set xIdTarjeta = (select ifnull(max(idTarjeta),0) + 1 from Tarjeta);
    set xIdConjunto = (select idConjunto from Usuario inner join Conjunto on Usuario.idUsuario = Conjunto.idUsuario where nombre_Usuario = usu and nombre_Conjunto = conjunto);
    insert into Tarjeta values(xIdTarjeta, xIdConjunto, pregunta, respuesta);
end;//
delimiter ;

drop procedure if exists sp_agregarHoja;
delimiter //
create procedure sp_agregarHoja(in usu varchar(30), hoja varchar(45))
begin
declare xIdHoja int;
declare xIdUsuario int;
declare existe int;
declare xMsj varchar(1);
	set existe = (select count(*) from Usuario inner join Hoja on Usuario.idUsuario = Hoja.idUsuario where nombre_Usuario = usu and nombre_Hoja = hoja);
    if(existe > 0) then
		set xMsj='n';
	else
		set xIdHoja = (select ifnull(max(idHoja),0) + 1 from Hoja);
		set xIdUsuario = (select idUsuario from Usuario where nombre_Usuario = usu);
		insert into Hoja values(xIdHoja, xIdUsuario, hoja, "", "", "", current_time(), current_time());
        set xMsj='s';
	end if;
select xMsj as mensaje;
end;//
delimiter ;

drop procedure if exists sp_agregarMensajeSoporte;
delimiter //
create procedure sp_agregarMensajeSoporte(in usu varchar(30), texto varchar(400))
begin
declare xIdMensajeS int;
declare xIdUsuario int;
declare existe int;
	set xIdMensajeS = (select ifnull(max(idMensajeSoporte),0) + 1 from MensajeSoporte);
	set xIdUsuario = (select idUsuario from Usuario where nombre_Usuario = usu);
	insert into MensajeSoporte values(xIdMensajeS, xIdUsuario, texto, current_time());
end;//
delimiter ;

drop procedure if exists sp_actualizarTipoUsuario;
delimiter //
create procedure sp_actualizarTipoUsuario(in p_idUsuario int, in p_idTipoUsuarioNuevo int)
begin
    update RelUsuarioTipo set idTipoUsuario = p_idTipoUsuarioNuevo where idUsuario = p_idUsuario;
end //
delimiter ;


#Creación de vistas
drop view if exists vw_searchProfile;
create view vw_searchProfile as select nombre_Usuario, idPerfil, total_Logros, estatus_Actual, estatus_Record, tema from Perfil inner join Usuario on Perfil.idUsuario = Usuario.idUsuario;

drop view if exists vw_searchAwards;
create view vw_searchAwards as select nombre_Usuario, total_Logros, Logro.idLogro, nombre_Logro, descripcionCorta_Logro, descripcionLarga_Logro, tipo_Logro from Logro inner join RelPerfilLogro on Logro.idLogro = RelPerfilLogro.idLogro inner join Perfil on RelPerfilLogro.idPerfil = Perfil.idPerfil inner join Usuario on Perfil.idUsuario = Usuario.idUsuario;

drop view if exists vw_searchSets;
create view vw_searchSets as select nombre_Usuario, idConjunto, Conjunto.idUsuario, nombre_Conjunto, date_format(fechaCreacion_Conjunto, "%d-%m-%Y") fechaCreacionConjunto, date_format(ultimaModificacion_Conjunto, "%d:%m:%Y") fechaUltimaModifConjunto, time_format(ultimaModificacion_Conjunto, "%H:%i:%s") horaUltimaModifConjunto from Conjunto inner join Usuario on Conjunto.idUsuario = Usuario.idUsuario;

drop view if exists vw_searchCards;
create view vw_searchCards as select nombre_Usuario, nombre_Conjunto, pregunta_Tarjeta from Tarjeta inner join Conjunto on Tarjeta.idConjunto = Conjunto.idConjunto inner join Usuario on Conjunto.idUsuario = Usuario.idUsuario;

drop view if exists vw_selectCards;
create view vw_selectCards as select nombre_Usuario, nombre_Conjunto, idTarjeta, pregunta_Tarjeta, respuesta_Tarjeta from Tarjeta inner join Conjunto on Tarjeta.idConjunto = Conjunto.idConjunto inner join Usuario on Conjunto.idUsuario = Usuario.idUsuario;

drop view if exists vw_searchSheets;
create view vw_searchSheets as select nombre_Usuario, idHoja, nombre_Hoja, date_format(fechaCreacion_Hoja, "%d-%m-%Y") fechaCreacionHoja, date_format(ultimaModificacion_Hoja, "%d:%m:%Y") fechaUltimaModifHoja, time_format(ultimaModificacion_Hoja, "%H:%i:%s") horaUltimaModifHoja from Hoja inner join Usuario on Hoja.idUsuario = Usuario.idUsuario;

drop view if exists vw_selectSheets;
create view vw_selectSheets as select nombre_Usuario, idHoja, nombre_Hoja, ideasClave, notas, resumen from Hoja inner join Usuario on Hoja.idUsuario = Usuario.idUsuario;

drop view if exists vw_searchLastsTasks;
create view vw_searchLastsTasks as select nombre_Usuario, idTarea, nombre_Tarea, fecha_Tarea, tiempo_Tarea, descripcion_Tarea from Tarea inner join Usuario on Tarea.idUsuario = Usuario.idUsuario;

#Mostrar tablas
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
select * from Estatus;
select * from Logro;
select * from RelPerfilLogro;
select * from SolicitudAmistad;
select * from Amigo;
select * from Conjunto;
select * from Tarjeta;
select * from Tarea;
select * from Hoja;
select * from MensajeSoporte;
select * from vw_searchProfile;

#Datos predeterminados
insert into TipoUsuario values(1, 'Base'), (2, 'Premium'), (3, 'Administrador');

insert into Logro values(1, 'Crono Prestigio', '¡Eres el más veloz!', 'Usa por primera vez el cronómetro del método Pomodoro', 'Común');
insert into Logro values(2, 'Explorando la Creatividad', '¡Tomar apuntes nunca había sido tan útil!', 'Crea tu primer apunte usando el método Cornell', 'Raro');
insert into Logro values(3, 'Flash-Inicia', 'Besos en el cerebro', 'Realiza tu primer conjunto usando el método de Flashcards.', 'Muy raro');
insert into Logro values(4, 'Rápidamente Sabio', '¡Sigue aprendiendo, no pares!', 'Haz uso de cada uno de los métodos de estudio que te proporciona Meksh', 'Legendario');

#Pruebas
call sp_agregarBase('Ferna', 'fer@gmail.com', '$2a$10$s.PAbMxyrWWqkK.6/ACQfermP9m3NrvpQ.jY/Otx4NlsdkjyAPgAW');
update RelUsuarioTipo set idTipoUsuario = 3 where idUsuario = 1;
call sp_agregarBase('Nateyla', 'nataponi276@gmail.com', '$2a$10$uhrqgJ8WLJGGPvWfz4M.jOJwKkcWuk42ct6h2At71i3GPPhnyi6oW');
update RelUsuarioTipo set idTipoUsuario = 3 where idUsuario = 2;

SHOW VARIABLES LIKE 'character_set_database';