-- 1
delimiter //
create procedure listar_productos_cosmeticos(tipo_cosmetico varchar(255))
begin
    select p.id_producto, p.nombre, p.descripcion, p.precio
    from productos p
    join cosmeticos c on p.id_producto = c.id_producto
    join tipos_cosmeticos tc on c.id_tipo_cosmetico = tc.id_tipo_cosmetico
    where tc.tipo = tipo_cosmetico;
end //
delimiter ;

call listar_productos_cosmeticos('labial');

-- 2
call listar_productos_cosmeticos('labial');
delimiter //
create procedure obtener_productos_por_categoria_y_stock(categoria varchar(255), stock_limite int)
begin
    select p.id_producto, p.nombre, p.descripcion, p.precio, i.cantidad as stock_disponible
    from productos p
    join categorias c on p.id_categoria = c.id_categoria
    join inventario i on p.id_producto = i.id_producto
    where c.categoria = categoria and i.cantidad < stock_limite;
end //
delimiter ;

call obtener_productos_por_categoria_y_stock('cosmeticos', 50);

-- 3
delimiter //
create procedure ventas_por_cliente_y_rango_fechas(cliente_id int, fecha_inicio date, fecha_fin date)
begin
    select v.id_venta, v.fecha, p.nombre as producto, vp.cantidad
    from ventas v
    join ventas_productos vp on v.id_venta = vp.id_venta
    join productos p on vp.id_producto = p.id_producto
    where v.id_cliente = cliente_id and v.fecha between fecha_inicio and fecha_fin;
end //
delimiter ;

call ventas_por_cliente_y_rango_fechas(1, '2024-01-01', '2024-12-31');

-- 4
delimiter //
create procedure total_ventas_por_empleado(empleado_id int, mes int, año int)
begin
    select sum(vp.cantidad * p.precio) as total_ventas
    from ventas v
    join ventas_productos vp on v.id_venta = vp.id_venta
    join productos p on vp.id_producto = p.id_producto
    where v.id_empleado = empleado_id and month(v.fecha) = mes and year(v.fecha) = año;
end //
delimiter ;

call total_ventas_por_empleado(1, 9, 2024);

-- 5
delimiter //
create procedure productos_mas_vendidos(fecha_inicio date, fecha_fin date)
begin
    select p.nombre, sum(vp.cantidad) as cantidad_vendida
    from ventas v
    join ventas_productos vp on v.id_venta = vp.id_venta
    join productos p on vp.id_producto = p.id_producto
    where v.fecha between fecha_inicio and fecha_fin
    group by p.nombre
    order by cantidad_vendida desc;
end //
delimiter ;

call productos_mas_vendidos('2024-01-01', '2024-12-31');

-- 6
delimiter //
create procedure consultar_stock_producto(nombre_producto varchar(255), id_producto int)
begin
    select p.id_producto, p.nombre, i.cantidad as stock_disponible
    from productos p
    join inventario i on p.id_producto = i.id_producto
    where p.nombre = nombre_producto or p.id_producto = id_producto;
end //
delimiter ;

call consultar_stock_producto('labial rojo', null);
call consultar_stock_producto(null, 1);

-- 7