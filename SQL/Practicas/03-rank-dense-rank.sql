-- Active: 1732855345819@@127.0.0.1@3306@netflixdb
/*Práctica RANK
Enunciado:
  Escribe una consulta SQL que asigne un rango a cada episodio, donde episodios con la misma calificación compartan el mismo rango.
  Ordena los episodios desde el más alto hasta el  más bajo, según su calificación, asegurándote de gestionar correctamente los empates.
  El resultado deberá mostrar el titulo, su rating_imdb y su rango de popularidad, está última columna deberá tener el siguiente alias: ranking_imdb

Sugerencias:
  Seleccionar las Columnas Relevantes:
  Debes seleccionar el titulo del episodio y su rating_imdb como las columnas principales para este ejercicio de la tabla Episodios.

Aplica RANK() para asignar rangos:
  Utiliza RANK() en combinación con OVER (ORDER BY rating_imdb DESC) para asignar rangos a los episodios basándose en su calificación IMDb, de los más altos a los más bajos. Episodios con la misma calificación IMDb deben tener el mismo rango.
  Asigna un alias a tu función de ventana, como ranking_imdb, para facilitar la identificación de esta columna en tus resultados.*/

SELECT titulo,
  rating_imdb,
  RANK() OVER (ORDER BY rating_imdb DESC) AS ranking_imdb
FROM episodios

/*Práctica DENSE_RANK
Enunciado:
  Escribe una consulta SQL utilizando la función DENSE_RANK() para clasificar los episodios por su duración utilizando la tabla Episodios
  Deberás asegurarte de que los episodios con la misma duración reciban el mismo rango, y los rangos sigan una secuencia continua, sin huecos entre ellos, independientemente de los empates.
  El objetivo es identificar cuáles son los episodios más largos de la base de datos y cómo se comparan entre sí en términos de duración.
  El resultado deberá mostrar el titulo, su duracion y la nueva columna generada ranking_por_duracion

Sugerencias:
  Selecciona el titulo y la duracion de cada episodio de la tabla Episodios
  Utiliza DENSE_RANK() en combinación con OVER (ORDER BY duracion DESC) para asignar un rango basado en la duración de los episodios, de mayor a menor.
  Asigna un alias a la columna generada por DENSE_RANK() que se llame ranking_por_duracion
  Ordena los resultados finales por el rango asignado para que los episodios más largos aparezcan primero.*/

SELECT titulo, duracion, 
    DENSE_RANK() OVER (ORDER BY duracion DESC) AS ranking_por_duracion
FROM episodios;