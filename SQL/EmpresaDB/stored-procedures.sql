-- Active: 1732855345819@@127.0.0.1@3306@empresadb
/*
Procedimientos almacenados Stored Procedures
  Estas herramientas no solo amplían nuestras capacidades con SQL, sino que también nos abren nuevas oportunidades para lo que es la gestión eficiente y segura de los datos.

  Es un conjunto de instrucciones que se pueden llamar desde otras consultas o desde otros procedimientos almacenados.

  Bloques de código guardados en la base de datos, para ser utilizados cuando los necesitemos, permite encapsular código para ser consultado posteriormente.
*/

-- Procedimientos almacenados
DELIMITER //
CREATE PROCEDURE AgregarEmpleado(
  IN _nombre VARCHAR(255), 
  IN _apellido VARCHAR(255), 
  IN _email VARCHAR(255), 
  IN _depto_id INT)
BEGIN
  INSERT INTO Empleados(nombre, apellido, email, depto_id) VALUES(_nombre, _apellido, _email, _depto_id);
END //

DELIMITER ;

CALL AgregarEmpleado('Elena', 'Torres', 'elena.torres@email.com',3);

SELECT * FROM empleados;

/*
Transacciones
  Permite mejorar la consistencia de la base de datos frente a errores inesperados.

  Es una unidad única de trabajo;
    Si una transacción tiene éxito, todas las modificaciones de los datos realizadas durante la transacción se confirman
    Si una transacción encuentra errores y debe cancelar o revertirse, se borran todas las modificaciones de los datos
  Se rigen bajos los principios ACID
    Atomicidad, Coherencia, Aislamiento y Durabilidad

  Comandos de transacciones
    Begin Transaction
    Commit
    Rollback
*/

-- Transacciones
BEGIN;
SAVEPOINT PreValidacion;
INSERT INTO AsignacionesDeProyectos (proyecto_id, empleado_id, horas_asignadas) VALUES (5, 1, 10);
INSERT INTO AsignacionesDeProyectos (proyecto_id, empleado_id, horas_asignadas) VALUES (5,1,10);
  -- Imagina más inserciones
  -- Aquí iría el código para validar el total de horas
  -- si el total excede, podemos revertir a nuestro SAVEPOINT
ROLLBACK TO PreValidacion;

-- Ejemplo completo
DELIMITER //

CREATE PROCEDURE AsignarHorasAProyecto(IN proyectoId INT, IN empleadoId INT, IN horasAsignadas INT)
BEGIN
    DECLARE horasTotales INT DEFAULT 0;
    DECLARE horasMaximas INT DEFAULT 100;
    
    -- Iniciar una transacción
    START TRANSACTION;
    
    -- Establecer un punto de guardado
    SAVEPOINT PreValidacion;
    
    -- Calcular el total actual de horas asignadas al proyecto
    SELECT SUM(horas_asignadas) INTO horasTotales 
    FROM AsignacionesDeProyectos 
    WHERE proyecto_id = proyectoId;
    
    -- Asumiendo que SUM() puede devolver NULL si no hay filas, lo convertimos a 0
    SET horasTotales = IFNULL(horasTotales, 0) + horasAsignadas;
    
    -- Verificar si el total excede las horas máximas permitidas
    IF horasTotales > horasMaximas THEN
        -- Revertir a SAVEPOINT si se excede el total de horas
        ROLLBACK TO PreValidacion;
        -- Aunque el ROLLBACK TO SAVEPOINT mantiene la transacción activa, decidimos terminar la operación con un mensaje de error.
        SELECT 'Error: La asignación excede el total de horas permitidas para el proyecto.' AS mensaje;
    ELSE
        -- Insertar la nueva asignación si el total está dentro del límite
        INSERT INTO AsignacionesDeProyectos (proyecto_id, empleado_id, horas_asignadas) 
        VALUES (proyectoId, empleadoId, horasAsignadas);
        
        -- Confirmar la transacción si todas las operaciones fueron exitosas
        COMMIT;
    END IF;
END //

DELIMITER ;

CALL AsignarHorasAProyecto (1, 1, 60);

SELECT * FROM AsignacionesDeProyectos where proyecto_id = 1 AND empleado_id = 1;