create database swclothes;
use swclothes;
CREATE TABLE proveedor (
  idProveedor int primary key,
  nombreProveedor VARCHAR(45) NOT NULL,
  contactoProveedor VARCHAR(45) NOT NULL,
  telefonoProveedor VARCHAR(45) NOT NULL,
  emailProveedor VARCHAR(45) NOT NULL	
  );

CREATE TABLE cliente (
  idCliente INT PRIMARY KEY,
  apellidoCliente VARCHAR(45) NOT NULL,
  nombreCliente VARCHAR(45) NOT NULL,
  emailCliente VARCHAR(45) NOT NULL,
  direccionCliente VARCHAR(45) NOT NULL,
  documentoCliente VARCHAR(45) NOT NULL,
  telefonoCliente VARCHAR(45) NOT NULL
);
CREATE TABLE tipodepago (
  idTipoDePago INT PRIMARY KEY AUTO_INCREMENT,
  tipoDePago VARCHAR(45) NOT NULL
  );
CREATE TABLE mediodepago (
  idMedioDePago INT PRIMARY KEY,
  medioDePago VARCHAR(45) NOT NULL
  );
CREATE TABLE pago (
  idPago INT PRIMARY KEY AUTO_INCREMENT,
  valorPago DOUBLE NOT NULL,
  referenciaDePago VARCHAR(45) NOT NULL,
  idTipoDePago INT NOT NULL,
  idMedioDePago INT NOT NULL,
  constraint fk_idTipoDePago foreign key(idTipoDePago) references tipodepago(idTipoDePago),
  constraint fk_idMedioDePago foreign key(idMedioDePago) references mediodepago(idMedioDePago)
);
CREATE TABLE producto (
  idProducto INT PRIMARY KEY,
  nombreProducto VARCHAR(45) NOT NULL,
  valorVenta DOUBLE NOT NULL,
  cantidad INT NOT NULL
);
create table cajero(
 documentocajero int primary key,
 nombrecajero varchar(20),
 apellidocajero varchar(20),
 direccioncajero varchar(50),
 emailcajero varchar(100),
 clave varchar(50)
);
create table encabezadoventa(
  numeroventa int primary key,
  fechaventa date,
  horaventa varchar(15),
  totalventa double default 0,
  idCliente INT,
  idPago INT,
  documentocajero int,
  constraint fk_idCliente foreign key(idCliente) references cliente(idCliente),
  constraint fk_idPago2 foreign key(idPago) references pago(idPago),
  constraint fk_documentocajero foreign key(documentocajero) references cajero(documentocajero)
);
create table detalleventa(
   iddetalle int primary key AUTO_INCREMENT,
   numeroventa int,
   idProducto INT,
   cantdetvent double,
   valorproducto double,
   valortotal double,
   constraint fk_numeroventa foreign key(numeroventa) references encabezadoventa(numeroventa),
   constraint fk_idProducto foreign key(idProducto) references producto(idProducto)
);
create table administrador(
 documentoadmin int primary key,
 nombreadmin varchar(20),
 apellidoadmin varchar(20),
 direccionadmin varchar(50),
 emailadmin varchar(100),
 claveadmin varchar(50)
);
create table encabezadocompra(
  numerocompra int primary key,
  fechacompra date,
  horacompra varchar(15),
  totalcompra double default 0,
  idProveedor int,
  documentoadmin int,
  constraint fk_idProveedor2 foreign key(idProveedor) references proveedor(idProveedor),
  constraint fk_documentoadmin2 foreign key(documentoadmin) references administrador(documentoadmin)
);
create table detallecompra(
   iddetallecompra int primary key AUTO_INCREMENT,
   numerocompra int,
   idProducto INT,
   cantdetcomp double,
   costoproducto double,
   valortotal double,
   constraint fk_numerocompra foreign key(numerocompra) references encabezadocompra(numerocompra),
   constraint fk_idProducto2 foreign key(idProducto) references producto(idProducto)
);