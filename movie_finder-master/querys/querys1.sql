
-- Escribe una consulta en SQL para encontrar el nombre y el año de las películas.
select title, release_year from movie_finder.film;

-- Escriba una consulta en SQL para encontrar el año en que se estrenará la película American Beauty.
select release_year from movie_finder.film where title = 'American Beauty';

-- Escriba una consulta en SQL para encontrar la película que fue lanzada en el año 1999
select * from movie_finder.film where release_year = '1999';

-- Escriba una consulta en SQL para encontrar las películas que se lanzaron antes de 1998
select * from movie_finder.film where release_year < '1998';

-- Escriba una consulta en SQL para devolver el nombre de todos los revisores y el nombre de las películas en una sola lista.
select user_name, title from movie_finder.film, movie_finder.reviewer,movie_finder.rating where rating.reviewer_id = reviewer.reviewer_id and rating.film_id = film.film_id ;

-- Escriba una consulta en SQL para encontrar el nombre de todos los revisores que hayan calificado 7 o más estrellas en su calificación
select user_name, rate from  movie_finder.reviewer,movie_finder.rating where rating.reviewer_id = reviewer.reviewer_id and rating.rate >= '7';

--  Escriba una consulta en SQL para encontrar los títulos de todas las películas que no tienen calificaciones
select distinct title from movie_finder.film left join movie_finder.rating on film.film_id = rating.film_id where rating.film_id is null;

-- Escriba una consulta en SQL para encontrar los títulos de las películas con ID 905, 907, 917
select title from movie_finder.film where film_id = 905 and film_id = 907 and film_id = 917;

-- Escriba una consulta en SQL para encontrar la lista de todas las películas con año que incluyen las palabras Boogie Nights
select film.title, film.release_year from movie_finder.film where title like '%Boogie Nights%';

-- Escriba una consulta en SQL para encontrar el número de ID del actor cuyo primer nombre es 'Woody' y el apellido es 'Allen'
select actor_id from movie_finder.actor where actor.first_name = 'Woody' and actor.last_name = 'Allen';


-- Escriba una consulta en SQL para enumerar toda la información de los actores que jugaron un papel en la película 'Annie Hall'.
select actor.actor_id,actor.first_name, actor.last_name from movie_finder.actor, movie_finder.cast,movie_finder.film where cast.film_id = film.film_id and cast.actor_id = actor.actor_id and film.title = 'Annie Hall'; 

-- Escriba una consulta en SQL para encontrar el nombre del director (nombre y apellidos) que dirigió una película que interpretó un rol para 'Eyes Wide Shut'. (usando subconsulta)


-- Escriba una consulta en SQL para enumerar todas las películas lanzadas en el país que no sea el Reino Unido.
select film.film_id,title,description,length_minutes,release_year,country.country_id,country_name from movie_finder.film, movie_finder.film_country,movie_finder.country where film.film_id = film_country.film_id and  film_country.country_id <> 'UK' and film_country.country_id = country.country_id; 


-- Escriba una consulta en SQL para encontrar el título de la película, el año, la fecha de lanzamiento, el director y el actor de las películas cuyo revisor es desconocido.
select title,release_year, director.first_name,director.last_name, actor.first_name,actor.last_name from movie_finder.film,movie_finder.director,movie_finder.actor,movie_finder.film_director,movie_finder.cast,movie_finder.rating where film_director.director_id = director.director_id and cast.actor_id = actor.actor_id and cast.film_id = film.film_id and rating.film_id = film.film_id;


 -- Escriba una consulta en SQL para encontrar los títulos de todas las películas dirigidas por el director cuyo nombre y apellido son Woddy Allen
 select title from movie_finder.film, movie_finder.film_director,movie_finder.director where film.film_id = film_director.film_id and director.director_id = film_director.director_id and director.first_name = 'Woody' and director.last_name = 'Allen'; 
 
 
 -- Escriba una consulta en SQL para encontrar todos los años que produjeron al menos una película y que recibieron una calificación de más de 3 estrellas. Mostrar los resultados en orden creciente.
select distinct release_year from movie_finder.film,movie_finder.rating where  film.film_id = rating.film_id and rating.rate > '3' order by film.release_year asc;

-- Escriba una consulta en SQL para encontrar los títulos de todas las películas que no tienen calificaciones.
select distinct title from movie_finder.film left join movie_finder.rating on film.film_id = rating.film_id where rating.film_id is null;