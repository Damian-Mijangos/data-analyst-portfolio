-- Active: 1732855345819@@127.0.0.1@3306@netflixdb
/* Objetivo del proyecto
Identificar las series más exitosas en la base de datos Netflix DB

Las series más exitosas se definen por la cantidad de episodios y rating promedio de IMDB
El resultado es una tabla con tres columnas:
  Titulo de la serie (Tabla series)
  Cantidad de episodios (Tabla episodios)
  Rating promedio de IMDB (Tabla episodios)

Se recomienda usar CTE's
*/

WITH 
  ListaEpisodios AS(
  SELECT serie_id, COUNT(episodio_id) AS num_episodios, AVG(rating_imdb) AS promedio_imdb
  FROM episodios
  GROUP BY serie_id
  )
SELECT 
  Series.titulo,
  ListaEpisodios.promedio_imdb,
  ListaEpisodios.num_episodios
FROM Series
INNER JOIN ListaEpisodios ON Series.serie_id = ListaEpisodios.serie_id
ORDER BY ListaEpisodios.promedio_imdb DESC, ListaEpisodios.num_episodios DESC;

-- Solución del curso
WITH 
  EpisodiosRecientes AS(
    SELECT 
      serie_id, 
      COUNT(episodio_id) AS num_episodios
    FROM episodios
    GROUP BY serie_id
  ),
  Calificaciones AS(
    SELECT 
      serie_id,
      AVG(rating_imdb) AS promedio_imdb
    FROM episodios
    GROUP BY serie_id
  )
SELECT 
  Series.titulo,
  EpisodiosRecientes.num_episodios,
  Calificaciones.promedio_imdb
FROM Series
INNER JOIN EpisodiosRecientes ON Series.serie_id = EpisodiosRecientes.serie_id
INNER JOIN Calificaciones ON Series.serie_id = Calificaciones.serie_id
ORDER BY Calificaciones.promedio_imdb DESC, EpisodiosRecientes.num_episodios DESC;