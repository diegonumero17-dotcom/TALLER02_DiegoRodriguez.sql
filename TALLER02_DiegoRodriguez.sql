
-- PARTE 1 – SELECT y WHERE


-- 1. Mostrar nombre y apellido de todos los clientes
-- Consulta básica para visualizar datos de la tabla customer

SELECT 
    first_name,
    last_name
FROM customer;


-- 2. Películas con duración mayor a 120 minutos


SELECT 
    title,
    length
FROM film
WHERE length > 120;



-- PARTE 2 – ORDER BY
-- =====================================================

-- 3. Ordenar clientes por apellido (A-Z)


SELECT 
    first_name,
    last_name
FROM customer
ORDER BY last_name ASC;


-- 4. Top 5 películas más largas


SELECT 
    title,
    length
FROM film
ORDER BY length DESC
LIMIT 5;



-- PARTE 3 – INNER JOIN


-- 5. Cantidad pagada y fecha del pago con nombre del cliente


SELECT 
    c.first_name,
    c.last_name,
    p.amount,
    p.payment_date
FROM payment p
INNER JOIN customer c 
    ON p.customer_id = c.customer_id;


-- 6. Películas alquiladas


SELECT 
    f.title,
    r.rental_date
FROM rental r
INNER JOIN inventory i 
    ON r.inventory_id = i.inventory_id
INNER JOIN film f 
    ON i.film_id = f.film_id;



-- PARTE 4 – LEFT JOIN


-- 7. Clientes sin pagos


SELECT 
    c.first_name,
    c.last_name
FROM customer c
LEFT JOIN payment p 
    ON c.customer_id = p.customer_id
WHERE p.payment_id IS NULL;


-- 8. Películas que no tienen actores


SELECT 
    f.title,
    f.length
FROM film f
LEFT JOIN film_actor fa 
    ON f.film_id = fa.film_id
WHERE fa.actor_id IS NULL;




-- PARTE 5 – INSERT, UPDATE, DELETE


-- 9. Insertar actor temporal
-- Se agrega un nuevo actor a la tabla actor

INSERT INTO actor (first_name, last_name)
VALUES ('DIEGO', 'RODRIGUEZ');


-- 10. Actualizar actor


UPDATE actor
SET first_name = 'DIEGO_ACTUALIZADO'
WHERE first_name = 'DIEGO' 
AND last_name = 'RODRIGUEZ';


-- 11. Eliminar actor


DELETE FROM actor
WHERE first_name = 'DIEGO_ACTUALIZADO' 
AND last_name = 'RODRIGUEZ';



-- PARTE 6 – CONSULTAS AVANZADAS


-- 12. Top 5 clientes que más dinero han pagado


SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_pagado
FROM customer c
INNER JOIN payment p 
    ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_pagado DESC
LIMIT 5;


-- 13. Top 5 películas más alquiladas


SELECT 
    f.title,
    COUNT(r.rental_id) AS total_alquileres
FROM film f
INNER JOIN inventory i 
    ON f.film_id = i.film_id
INNER JOIN rental r 
    ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY total_alquileres DESC
LIMIT 5;

