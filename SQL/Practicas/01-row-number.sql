/*Práctica ROW_NUMBER
  Enunciado:
    Escribe una consulta SQL que seleccione todas las series, incluyendo su titulo y año_lanzamiento y utiliza la función de ventana ROW_NUMBER() para asignar un número secuencial a cada serie basado en su año de lanzamiento (ORDER BY año_lanzamiento DESC), de la más reciente a la más antigua, esta última columna debe tener el nombre: clasificacion_global*/

WITH Clasificacion AS (
  -- Seleccionamos las columnas que necesitamos
  SELECT 
    titulo, 
    año_lanzamiento,
    -- Usamos ROW_NUMBER() para asignar un número secuencial a cada fila
    ROW_NUMBER() OVER (ORDER BY año_lanzamiento DESC) AS clasificacion_global
  FROM series)
-- Seleccionamos todas las columnas de la tabla Clasificacion
SELECT * FROM Clasificacion