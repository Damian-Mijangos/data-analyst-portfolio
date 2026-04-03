# SQL Projects

Proyectos y ejercicios prácticos de SQL desarrollados durante mi formación como Analista de Datos.

## Tecnologías
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=mysql&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=flat&logo=postgresql&logoColor=white)

## Estructura

## NetflixDB

Base de datos relacional con el schema de Netflix incluyendo series, episodios, actores y actuaciones.

### Schema
- **Series**: id, título, descripción, año_lanzamiento, género
- **Episodios**: id, serie_id, título, duración, rating_imdb, temporada, descripción, fecha_estreno
- **Actores**: id, nombre, fecha_nacimiento
- **Actuaciones**: actor_id, serie_id, personaje (relación muchos a muchos)

### Consultas destacadas
- **Window Functions**: ROW_NUMBER(), RANK(), DENSE_RANK() para ranking de episodios
- **CTEs**: Common Table Expressions para consultas complejas
- **PARTITION BY**: Rankings por grupo (por temporada, por género)
- **REGEXP**: Búsqueda de patrones en texto

### Archivos
- `schema.sql` — CREATE TABLE con claves foráneas
- `data.sql` — 13 series, 35 actores, 216 episodios
- `consultas.sql` — Ejercicios y proyectos resueltos

---

## EmpresaDB

Base de datos para gestión de empleados, departamentos y proyectos.

### Técnicas implementadas
- **Stored Procedures**: Automatización de tareas repetitivas
- **Triggers**: Acciones automáticas ante eventos (INSERT, UPDATE, DELETE)
- **Views**: Tablas virtuales para simplificar consultas complejas
- **Transacciones**: Manejo de ACID con SAVEPOINT y ROLLBACK

### Archivos
- `stored-procedures.sql` — AgregarEmpleado, AsignarHorasAProyecto
- `triggers-views.sql` — RegistrarNuevoEmpleado, VistaEmpleadosProyecto

---

## Prácticas

Ejercicios organizados por tema para consolidar conocimientos:

| Archivo | Tema |
|---------|------|
| `01-row-number.sql` | ROW_NUMBER() — Numeración secuencial |
| `02-partition-by.sql` | PARTITION BY — Ranking por grupo |
| `03-rank-dense-rank.sql` | RANK() y DENSE_RANK() — Manejo de empates |
| `04-cte-examples.sql` | CTEs — Consultas legibles y mantenibles |

---

## Aprendizajes clave

- Entender la diferencia entre ROW_NUMBER(), RANK() y DENSE_RANK() para diferentes estrategias de ranking
- Utilizar CTEs para hacer consultas complejas más legibles
- Implementar Stored Procedures para lógica de negocio reutilizable
- Diseñar triggers para automatización de tareas sin código adicional
