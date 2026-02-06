-- PLEASE READ THIS BEFORE RUNNING THE EXERCISE

-- ⚠️ IMPORTANT: This SQL file may crash due to two common issues: comments and missing semicolons.

-- ✅ Suggestions:
-- 1) Always end each SQL query with a semicolon `;`
-- 2) Ensure comments are well-formed:
--    - Use `--` for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use `/* */` multi-line comments, as they may break execution

-- -----------------------------------------------
-- queries.sql
-- Complete each mission by writing your SQL query
-- directly below the corresponding instruction
-- -----------------------------------------------

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;

-- 1. Primeras 10 observaciones:
SELECT * FROM observations LIMIT 10;

-- 2. Identificador de las regiones:
SELECT DISTINCT region_id FROM observations;

-- 3. Especies distintas que se han observado:
SELECT COUNT (DISTINCT species_id) FROM observations;

-- 4. Observaciones para la región con region_id=2:
SELECT * FROM observations
WHERE region_id = 2;

-- 5. Observaciones registradas el día 1998-08-08:
SELECT COUNT(*) AS total_observaciones
FROM observations
WHERE observation_date = '1998-08-08';

-- 6. Región con más observaciones:
SELECT region_id, COUNT(*) AS total_observaciones
FROM observations
GROUP BY region_id
ORDER BY total_observaciones DESC;

--7. Las 5 especies con observaciones más frecuentes:
SELECT species_id, COUNT(*) AS especies_mas_frecuentes
FROM observations
GROUP BY species_id
ORDER BY especies_mas_frecuentes DESC
LIMIT 5;

-- 8. Las 5 especies con menos regitros:
SELECT species_id, COUNT(*) AS registros
FROM observations
GROUP BY species_id
HAVING COUNT(*) < 5
ORDER BY registros ASC;

-- 9. Observadores con más observaciones de especies:
SELECT observer, COUNT(*) AS total_observaciones
FROM observations
GROUP BY observer
ORDER BY total_observaciones DESC;

-- 10. Nombre de la región por observación:
SELECT observations.region_id, regions.name
FROM observations
JOIN regions
    ON observations.region_id = regions.id;

-- 11. Nombre científico de cada especie registrada:
SELECT observations.species_id, species.scientific_name
FROM observations
JOIN species
    ON observations.species_id = species.id;

-- 12. Especies más observadas por cada región:
SELECT regions.name AS region, species.scientific_name, COUNT(*) AS total_observaciones
FROM observations
JOIN regions ON observations.region_id = regions.id
JOIN species ON observations.species_id = species.id
GROUP BY regions.name, species.scientific_name
ORDER BY regions.name, total_observaciones DESC;

-- 13. Insertar una nueva observación ficticia
INSERT INTO observations (
  id, species_id, region_id, observer, observation_date, latitude, longitude, count
  )
VALUES (
    689, 1, 1, 'test_observer', '2024-01-01', -33.45, -70.66, 3
);

-- 14. Corregir una especie con error ortográfico:
UPDATE species
SET scientific_name = 'Cacatua galerita'
WHERE scientific_name = 'Cacatua galeritaa';

-- 15. Elimina la observación ficticia por su id:
DELETE FROM observations
WHERE id = 689;