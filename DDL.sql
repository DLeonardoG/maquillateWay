drop database if exists maquillateMor;
create database if not exists maquillateMor;

use maquillateMor;
show databases;
show tables;

-- Tablas base que no dependen de ninguna otra
create table if not exists categorias (
    id_categoria int not null primary key,
    categoria varchar(255) unique
);

create table if not exists tipos_productos (
    id_tipo_producto int not null primary key,
    tipo varchar(255) unique
);

create table if not exists componentes (
    id_componente int not null primary key,
    componente varchar(255) unique
);

create table if not exists tonos (
    id_tono int not null primary key,
    tono varchar(255) unique
);

create table if not exists tipos_aromas (
    id_tipo_aroma int not null primary key,
    tipo varchar(255) unique
);

create table if not exists generos (
    id_genero int not null primary key,
    genero varchar(255) unique
);

create table if not exists tipos_accesorios (
    id_tipo_accesorio int not null primary key,
    tipo varchar(255) unique
);

create table if not exists materiales (
    id_material int not null primary key,
    material varchar(255) unique
);

create table if not exists tamanos (
    id_tamano int not null primary key,
    tamano varchar(255) unique
);

create table if not exists barrios (
    id_barrio int not null primary key,
    barrio varchar(255) unique
);

create table if not exists tipos_cosmeticos (
    id_tipo_cosmetico int not null primary key,
    tipo varchar(255) unique
);

create table if not exists tipos_piel (
    id_tipo_piel int not null primary key,
    tipo varchar(255) unique
);

create table if not exists puestos (
    id_puesto int not null primary key,
    puesto varchar(255),
    salario float,
    unique (puesto)
);

create table if not exists areas (
    id_area int not null primary key,
    area varchar(255) unique
);

-- Tablas que dependen de otras para sus claves foráneas
create table if not exists direcciones (
    id_direccion int not null primary key,
    id_barrio int not null,
    calle varchar(255),
    carrera varchar(255),
    numero varchar(255),
    foreign key (id_barrio) references barrios(id_barrio)
);

create table if not exists productos (
    id_producto int not null primary key,
    nombre varchar(255),
    descripcion varchar(255),
    id_categoria int not null,
    precio float,
    id_tipo_producto int not null,
    foreign key (id_categoria) references categorias(id_categoria),
    foreign key (id_tipo_producto) references tipos_productos(id_tipo_producto)
);

create table if not exists clientes (
    id_cliente int not null primary key,
    nombre varchar(255),
    apellido varchar(255),
    correo varchar(255),
    id_direccion int not null,
    telefono varchar(20),
    unique (correo, telefono),
    foreign key (id_direccion) references direcciones(id_direccion)
);

create table if not exists empleados (
    id_empleado int not null primary key,
    nombre varchar(255),
    apellido varchar(255),
    id_puesto int not null,
    fecha_contratacion date,
    foreign key (id_puesto) references puestos(id_puesto)
);

create table if not exists proveedores (
    id_proveedor int not null primary key,
    nombre varchar(255),
    telefono varchar(20),
    id_direccion int not null,
    contacto varchar(255),
    unique (telefono, contacto),
    foreign key (id_direccion) references direcciones(id_direccion)
);

create table if not exists inventario (
    id_inventario int not null primary key,
    id_producto int not null,
    id_proveedor int not null,
    cantidad int,
    foreign key (id_producto) references productos(id_producto),
    foreign key (id_proveedor) references proveedores(id_proveedor)
);

create table if not exists puestos_areas (
    id_puesto int not null,
    id_area int not null,
    foreign key (id_puesto) references puestos(id_puesto),
    foreign key (id_area) references areas(id_area)
);

create table if not exists perfumes (
    id_perfume int not null primary key,
    id_producto int not null,
    id_tipo_aroma int not null,
    id_genero int not null,
    foreign key (id_producto) references productos(id_producto),
    foreign key (id_tipo_aroma) references tipos_aromas(id_tipo_aroma),
    foreign key (id_genero) references generos(id_genero)
);

create table if not exists cosmeticos (
    id_cosmetico int not null primary key,
    id_producto int not null,
    id_tipo_cosmetico int not null,
    id_tono int not null,
    fecha_expiracion date,
    foreign key (id_producto) references productos(id_producto),
    foreign key (id_tipo_cosmetico) references tipos_cosmeticos(id_tipo_cosmetico),
    foreign key (id_tono) references tonos(id_tono)
);

create table if not exists cuidado_piel (
    id_cuidado int not null primary key,
    id_tipo_piel int not null,
    id_producto int not null,
    id_genero int not null,
    foreign key (id_tipo_piel) references tipos_piel(id_tipo_piel),
    foreign key (id_producto) references productos(id_producto),
    foreign key (id_genero) references generos(id_genero)
);

create table if not exists cuidados_componentes (
    id_componente int not null,
    id_cuidado int not null,
    foreign key (id_componente) references componentes(id_componente),
    foreign key (id_cuidado) references cuidado_piel(id_cuidado)
);

create table if not exists accesorios (
    id_accesorio int not null primary key,
    id_producto int not null,
    id_tipo_accesorio int not null,
    id_material int not null,
    id_tamano int not null,
    id_genero int not null,
    foreign key (id_producto) references productos(id_producto),
    foreign key (id_tipo_accesorio) references tipos_accesorios(id_tipo_accesorio),
    foreign key (id_material) references materiales(id_material),
    foreign key (id_tamano) references tamanos(id_tamano),
    foreign key (id_genero) references generos(id_genero)
);

create table if not exists ventas (
    id_venta int not null primary key,
    fecha date,
    id_cliente int not null,
    id_empleado int not null,
    foreign key (id_cliente) references clientes(id_cliente),
    foreign key (id_empleado) references empleados(id_empleado)
);

create table if not exists ventas_productos (
    id_venta int not null,
    id_producto int not null,
    cantidad int,
    foreign key (id_venta) references ventas(id_venta),
    foreign key (id_producto) references productos(id_producto)
);

create table if not exists ordenes (
    id_orden int not null primary key,
    id_proveedor int not null,
    fecha date,
    foreign key (id_proveedor) references proveedores(id_proveedor)
);

create table if not exists ordenes_productos (
    id_orden int not null,
    id_producto int not null,
    cantidad_pedida int,
    foreign key (id_orden) references ordenes(id_orden),
    foreign key (id_producto) references productos(id_producto)
);
