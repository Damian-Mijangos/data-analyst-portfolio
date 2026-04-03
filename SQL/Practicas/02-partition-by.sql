/*Práctica PARTITION BY 1
Enunciado:
  Escribe una consulta SQL que seleccione la temporada, el título del episodio, la fecha de estreno y utilice ROW_NUMBER() en combinación con PARTITION BY para asignar un ranking de episodios basado en su fecha de estreno (de más reciente a más antiguo DESC), está nueva columna deberá tener el nombre: ranking_temporada
  
Sugerencias:
  Selecciona las Columnas Necesarias:
    Debes seleccionar tres columnas: la temporada y el titulo del episodio, y también incluir la fecha_estreno para que puedas verificar el orden de los rankings generados.
  Aplica ROW_NUMBER() con PARTITION BY:
    Utiliza la función de ventana ROW_NUMBER() y combina con PARTITION BY temporada para agrupar los episodios por temporada. Dentro de cada grupo, ordena los episodios por fecha_estreno DESC para que los más recientes tengan el ranking más bajo (es decir, número 1).
    Asigna el alias ranking_temporada al resultado de ROW_NUMBER()*/

SELECT 
  temporada,
  titulo,
  fecha_estreno,
  ROW_NUMBER() OVER(PARTITION BY temporada ORDER BY fecha_estreno DESC) AS ranking_temporada
FROM episodios


/*Práctica PARTITION BY 2
Enunciado:
  Escribe una consulta de SQL que genere un ranking de episodios para cada temporada de Stranger Things (serie_id = 2) basándose en las calificaciones de IMDb, de modo que puedas identificar los episodios mejor valorados dentro de cada temporada.

Sugerencias:
  Seleccionar Columnas Relevantes:
    Selecciona temporada, titulo y rating_imdb de la tabla Episodios.

  Aplica ROW_NUMBER() para asignar rangos:
    Utiliza la función de ventana ROW_NUMBER() en combinación con OVER (PARTITION BY temporada ORDER BY rating_imdb DESC) para asignar un ranking a cada episodio dentro de su respectiva temporada, basándose en su rating de IMDb.
    Esto asegura que el episodio con el rating más alto en cada temporada reciba el ranking 1, y así sucesivamente.
    Recuerda definir un alias Ranking IMDb

  Filtrar por Serie Específica:
    Asegúrate de filtrar los resultados para incluir solo los episodios de "Stranger Things", utilizando WHERE serie_id = 2

  Ordenar el Resultado Final:
    Ordena los resultados primero por temporada y luego por Ranking IMDb para facilitar la interpretación de los datos.*/

SELECT 
  temporada,
  titulo,
  rating_imdb,
  ROW_NUMBER() OVER (PARTITION BY temporada ORDER BY rating_imdb DESC) AS'Ranking IMDb'
FROM episodios
WHERE serie_id = 2
ORDER BY temporada, 'Ranking IMDb';