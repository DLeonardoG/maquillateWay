use maquillatemor;

insert into categorias (id_categoria, categoria) values
(1, 'cosmeticos'),
(2, 'cuidado de la piel'),
(3, 'perfumes'),
(4, 'accesorios');

insert into tipos_productos (id_tipo_producto, tipo) values
(1, 'labial'),
(2, 'base'),
(3, 'sombra'),
(4, 'crema facial'),
(5, 'perfume'),
(6, 'collar');

insert into componentes (id_componente, componente) values
(1, 'acido hialuronico'),
(2, 'vitamina c'),
(3, 'colageno');

insert into tonos (id_tono, tono) values
(1, 'rojo'),
(2, 'rosa'),
(3, 'nude');

insert into tipos_aromas (id_tipo_aroma, tipo) values
(1, 'floral'),
(2, 'amaderado');

insert into generos (id_genero, genero) values
(1, 'femenino'),
(2, 'masculino'),
(3, 'unisex');

insert into tipos_accesorios (id_tipo_accesorio, tipo) values
(1, 'collar'),
(2, 'pulsera');

insert into materiales (id_material, material) values
(1, 'oro'),
(2, 'plata');

insert into tamanos (id_tamano, tamano) values
(1, 'pequeno'),
(2, 'mediano'),
(3, 'grande');

insert into barrios (id_barrio, barrio) values
(1, 'centro'),
(2, 'norte'),
(3, 'sur');

insert into tipos_cosmeticos (id_tipo_cosmetico, tipo) values
(1, 'labial'),
(2, 'base'),
(3, 'sombra de ojos');

insert into tipos_piel (id_tipo_piel, tipo) values
(1, 'seca'),
(2, 'grasa'),
(3, 'mixta');

insert into puestos (id_puesto, puesto, salario) values
(1, 'vendedor', 1500),
(2, 'administrador', 2500),
(3, 'bodeguero', 1800);

insert into areas (id_area, area) values
(1, 'ventas'),
(2, 'bodega'),
(3, 'administracion');

insert into direcciones (id_direccion, id_barrio, calle, carrera, numero) values
(1, 1, 'calle 10', 'carrera 5', '100A'),
(2, 2, 'calle 22', 'carrera 8', '220B'),
(3, 3, 'calle 33', 'carrera 12', '330C');

insert into clientes (id_cliente, nombre, apellido, correo, id_direccion, telefono) values
(1, 'ana', 'perez', 'ana.perez@example.com', 1, '3001234567'),
(2, 'luis', 'martinez', 'luis.martinez@example.com', 2, '3109876543');

insert into empleados (id_empleado, nombre, apellido, id_puesto, fecha_contratacion) values
(1, 'carlos', 'gomez', 1, '2022-05-15'),
(2, 'marta', 'lopez', 2, '2021-03-10');

insert into proveedores (id_proveedor, nombre, telefono, id_direccion, contacto) values
(1, 'proveedor a', '3216549870', 3, 'juan herrera'),
(2, 'proveedor b', '3227896541', 2, 'maria torres');

insert into productos (id_producto, nombre, descripcion, id_categoria, precio, id_tipo_producto) values
(1, 'labial rojo', 'labial hidratante de larga duracion', 1, 10.5, 1),
(2, 'crema facial', 'crema hidratante para piel seca', 2, 15.0, 4),
(3, 'perfume floral', 'perfume con aroma floral', 3, 20.0, 5),
(4, 'collar de oro', 'collar de oro 18k', 4, 50.0, 6);

insert into inventario (id_inventario, id_producto, id_proveedor, cantidad) values
(1, 1, 1, 100),
(2, 2, 2, 50),
(3, 3, 1, 30),
(4, 4, 2, 20);

insert into perfumes (id_perfume, id_producto, id_tipo_aroma, id_genero) values
(1, 3, 1, 1);

insert into cosmeticos (id_cosmetico, id_producto, id_tipo_cosmetico, id_tono, fecha_expiracion) values
(1, 1, 1, 1, '2025-12-31');

insert into cuidado_piel (id_cuidado, id_tipo_piel, id_producto, id_genero) values
(1, 1, 2, 1);

insert into cuidados_componentes (id_componente, id_cuidado) values
(1, 1);

insert into accesorios (id_accesorio, id_producto, id_tipo_accesorio, id_material, id_tamano, id_genero) values
(1, 4, 1, 1, 2, 1);

insert into ventas (id_venta, fecha, id_cliente, id_empleado) values
(1, '2024-09-15', 1, 1),
(2, '2024-09-16', 2, 2);

insert into ventas_productos (id_venta, id_producto, cantidad) values
(1, 1, 3),
(1, 3, 1),
(2, 2, 2),
(2, 4, 1);

insert into ordenes (id_orden, id_proveedor, fecha) values
(1, 1, '2024-01-10'),
(2, 2, '2024-05-15');

insert into ordenes_productos (id_orden, id_producto, cantidad_pedida) values
(1, 1, 50),
(1, 3, 20),
(2, 2, 30),
(2, 4, 15);
