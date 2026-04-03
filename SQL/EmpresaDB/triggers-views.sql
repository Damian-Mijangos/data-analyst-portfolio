-- Active: 1732855345819@@127.0.0.1@3306@empresadb
/*
Vistas
  Es una tabla virtual cuyo contenido está definido por una consulta, al igual que una tabla, una vista consta de un conjunto de columnas y filas de datos con nombre, se actualiza automáticamente

  Beneficios
  - Simplifica la complejidad de las consultas
  - Oculta la complejidad de los datos subyacentes
  - Proporciona una capa adicional de seguridad al ocultar ciertos detalles de los datos subyacentes
*/
CREATE VIEW VistaEmpleadosTecnologia AS
SELECT nombre, apellido, email
FROM empleados
WHERE depto_id = 1;

SELECT * FROM vistaempleadostecnologia;

CREATE MATERIALIZED VIEW VistaEmpleadosProyecto AS
SELECT empleados.nombre, proyectos.nombre AS Proyecto
FROM empleados
JOIN asignacionesdeproyectos ON empleados.empleado_id = asignacionesdeproyectos.asignacion_id
JOIN proyectos ON asignacionesdeproyectos.proyecto_id = proyectos.proyecto_id;

/*
Trigger
 Son acciones automáticas que se ejecutan luego de que ocurra un evento específico
*/
DELIMITER $$

-- Crea un disparador llamado 'RegistrarNuevoEmpleado'
CREATE TRIGGER RegistrarNuevoEmpleado
AFTER INSERT ON empleados -- Este disparador se ejecuta después de insertar una nueva fila en la tabla 'empleados'
FOR EACH ROW -- El disparador se aplica a cada fila que se inserte
BEGIN
  -- Inserta un nuevo registro en la tabla 'logempleados' con el ID del empleado y la fecha actual
  INSERT INTO logempleados(empleado_id, fecha_registro) VALUES (NEW.empleado_id, NOW());
END$$

DELIMITER;

INSERT INTO empleados(nombre, apellido, email) VALUES ('Juan', 'Robles', 'juan.robles@example.com');

SELECT * FROM logempleados;

/*
Proyecto del día
Crear una vista llamada "VistaEmpleadosProyectos" en la base de datos EmpresaDB
La vista debe ser una consulta que muestre el nombre y apellido del empleado, junto con el proyecto al que está asignado
Utiliza las tablas Empleados, AsignacionesDeProyectos y Proyectos
*/

-- Crea una vista llamada VistaEmpleadosProyecto que muestra la información de los empleados y sus proyectos asignados.
CREATE VIEW VistaEmpleadosProyecto AS
SELECT 
    empleados.nombre, -- Nombre del empleado
    empleados.apellido, -- Apellido del empleado
    proyectos.nombre AS Nombre_Proyecto -- Nombre del proyecto al que está asignado el empleado
FROM empleados -- Tabla de empleados
JOIN AsignacionesDeProyectos ON empleados.empleado_id = AsignacionesDeProyectos.empleado_id -- Relación entre empleados y sus proyectos asignados
JOIN Proyectos ON AsignacionesDeProyectos.proyecto_id = Proyectos.proyecto_id; -- Relación entre proyectos y sus asignaciones

SELECT * FROM vistaempleadosproyecto;
