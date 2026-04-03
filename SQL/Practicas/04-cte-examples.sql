/*Práctica CTE 1
Enunciado:
  Escribe una consulta SQL empleando una CTE para determinar la fecha del primer episodio transmitido de cada serie.
  Debes seleccionar el título de cada serie y la fecha del primer episodio, presentando estos datos en dos columnas finales llamadas 'Título de la Serie' y 'Fecha del Primer Episodio'
  Ordena los resultados por la fecha del primer episodio de forma ascendente.

Sugerencias:
  Para obtener la fecha del primer episodio transmitido puede aplicar una CTE para obtener serie_id junto con MIN(fecha_estreno) para obtener la fecha más antigua de episodio desde la tabla Episodios para dicha Serie
  Utiliza GROUP BY  cuando quieres aplicar funciones agregadas como MIN()
  Puedes utilizar INNER JOIN para combinar los resultados de tu consulta principal con los resultados de la CTE*/

WITH ListaSeries AS (
  -- Selecciona la serie_id y el título de las series
  SELECT serie_id, titulo AS`Título de la Serie`
  FROM series
),
ListaEpisodios AS (
  -- Selecciona la serie_id y la fecha del primer episodio por cada serie
  SELECT serie_id, MIN(fecha_estreno) AS`Fecha del Primer Episodio`
  FROM episodios
  GROUP BY serie_id
)
SELECT 
  ListaSeries.`Título de la Serie`,
  ListaEpisodios.`Fecha del Primer Episodio`
FROM ListaSeries
-- Une las dos listas por serie_id para obtener el título y la fecha del primer episodio de cada serie
INNER JOIN ListaEpisodios
  ON ListaSeries.serie_id = ListaEpisodios.serie_id
ORDER BY ListaEpisodios.`Fecha del Primer Episodio` ASC;

-- Definición de una CTE llamada 'PrimerEpisodio'
WITH PrimerEpisodio AS (
  -- Selecciona el ID de la serie y la fecha del primer episodio (MIN(fecha_estreno)), renombrando este como 'fecha_primer_episodio'
  SELECT serie_id, MIN(fecha_estreno) AS fecha_primer_episodio
  FROM episodios
  -- Agrupa los resultados por el ID de la serie para obtener la fecha del primer episodio por cada serie
  GROUP BY serie_id
)
-- Consulta principal que combina las dos CTEs usando un INNER JOIN
SELECT 
  -- Selecciona el título de la serie desde la tabla 'series'
  s.titulo AS`Título de la Serie`,
  -- Selecciona la fecha del primer episodio desde la CTE 'PrimerEpisodio'
  pe.fecha_primer_episodio AS`Fecha del Primer Episodio`
FROM series s
INNER JOIN -- Combina las dos tablas usando el ID de la serie como clave
  PrimerEpisodio pe ON s.serie_id = pe.serie_id
-- Ordena los resultados por la fecha del primer episodio en orden ascendente
ORDER BY pe.fecha_primer_episodio ASC;


/*Práctica CTE 2
Enunciado:
  Escribe una consulta SQL que utilice una CTE para seleccionar el número total de series lanzadas por año para un género específico, digamos "Ciencia ficción".
  Ordena los resultados por año de lanzamiento

Sugerencias:
  Definir la CTE:
  La CTE debe contener las columnas para el año de lanzamiento (año_lanzamiento) y el conteo COUNT() de series lanzadas ese año.
  Filtra las series para incluir solo aquellas cuyo genero sea igual a 'Ciencia ficción'.
  
  Seleccionar desde la CTE:
  En la consulta principal, selecciona desde tu CTE las columnas para el año de lanzamiento y el número de series lanzadas.
  Asegúrate de ordenar los resultados por el año de lanzamiento para observar la tendencia a lo largo del tiempo.*/

WITH ListaSeries AS (
  -- Definimos una CTE llamada "ListaSeries" que selecciona el año de lanzamiento y el conteo total de series lanzadas ese año
  SELECT año_lanzamiento, COUNT(*) AS total_series
  FROM series
  WHERE genero = 'Ciencia ficción' -- Filtramos las series para incluir solo aquellas cuyo género sea igual a 'Ciencia ficción'
  GROUP BY año_lanzamiento -- Agrupamos los resultados por el año de lanzamiento
)
SELECT año_lanzamiento, total_series 
FROM ListaSeries
ORDER BY año_lanzamiento; -- Ordenamos los resultados por el año de lanzamiento
WITH ListaSeries AS (
  -- Definimos una CTE llamada "ListaSeries" que selecciona el año de lanzamiento, el género y el conteo total de series lanzadas ese año
  SELECT año_lanzamiento, genero, COUNT(*) AS total_series
  FROM series
  GROUP BY año_lanzamiento, genero -- Agrupamos los resultados por el año de lanzamiento y el género
)
SELECT *
FROM ListaSeries
ORDER BY año_lanzamiento DESC, genero; -- Ordenamos los resultados por el año de lanzamiento en orden descendente y luego por el género