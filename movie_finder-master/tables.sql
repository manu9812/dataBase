
ALTER TABLE movie_finder.film_language DROP FOREIGN KEY IF EXISTS FK_film_language;
ALTER TABLE movie_finder.film_language DROP FOREIGN KEY IF EXISTS FK_film_language2;
ALTER TABLE movie_finder.cast DROP FOREIGN KEY IF EXISTS FK_cast;
ALTER TABLE movie_finder.cast DROP FOREIGN KEY IF EXISTS FK_cast2;
ALTER TABLE movie_finder.film_genre DROP FOREIGN KEY IF EXISTS FK_film_genre;
ALTER TABLE movie_finder.film_genre DROP FOREIGN KEY  IF EXISTS FK_film_genre2;
ALTER TABLE movie_finder.film_country DROP FOREIGN KEY  IF EXISTS FK_film_country;
ALTER TABLE movie_finder.film_country DROP FOREIGN KEY IF EXISTS FK_film_country2;
ALTER TABLE movie_finder.film_director DROP FOREIGN KEY IF EXISTS FK_film_director;
ALTER TABLE movie_finder.film_director DROP FOREIGN KEY IF EXISTS FK_film_director2;
ALTER TABLE movie_finder.rating DROP FOREIGN KEY IF EXISTS FK_rating;
ALTER TABLE movie_finder.rating DROP FOREIGN KEY IF EXISTS FK_rating2;

/*==============================================================*/
/* Table: film                                                  */
/*==============================================================*/

-- Create a new table called 'film' in schema 'movie_finder'
-- Drop the table if it already exists
DROP TABLE IF EXISTS movie_finder.film;
-- Create the table in the specified schema
CREATE TABLE movie_finder.film
(
    film_id INT NOT NULL PRIMARY KEY auto_increment, -- primary key column
    title varchar(70) NOT NULL,
    description text,
    length_minutes int,
    release_year int NOT NULL
);

/*==============================================================*/
/* Table: actor                                                 */
/*==============================================================*/

-- Create a new table called 'actor' in schema 'movie_finder'
-- Drop the table if it already exists
DROP TABLE IF EXISTS movie_finder.actor;

-- Create the table in the specified schema
CREATE TABLE movie_finder.person
(
    person_id INT NOT NULL PRIMARY KEY auto_increment, -- primary key column
    first_name varchar(30) NOT NULL,
    last_name varchar(30) NOT NULL
);

/*==============================================================*/
/* Table: country                                               */
/*==============================================================*/

-- Create a new table called 'country' in schema 'movie_finder'
-- Drop the table if it already exists
DROP TABLE IF EXISTS movie_finder.country;

-- Create the table in the specified schema
CREATE TABLE movie_finder.country
(
    country_id VARCHAR(2) NOT NULL PRIMARY KEY, -- primary key column
	`cc_iso` VARCHAR(2),
	`tld` VARCHAR(3),
	`country_name` VARCHAR(100) NOT NULL
);

/*==============================================================*/
/* Table: language                                              */
/*==============================================================*/

-- Create a new table called 'language' in schema 'movie_finder'
-- Drop the table if it already exists

DROP TABLE IF EXISTS movie_finder.language;
-- Create the table in the specified schema
CREATE TABLE movie_finder.language
(
    language_id VARCHAR(10) NOT NULL PRIMARY KEY, -- primary key column
    name VARCHAR(50) NOT NULL
);

/*==============================================================*/
/* Table: reviewer                                              */
/*==============================================================*/

-- Create a new table called 'reviewer' in schema 'movie_finder'
-- Drop the table if it already exists

DROP TABLE IF EXISTS movie_finder.reviewer;

-- Create the table in the specified schema
CREATE TABLE movie_finder.reviewer
(
    reviewer_id INT NOT NULL PRIMARY KEY auto_increment, -- primary key column
    user_name varchar(30) NOT NULL
);


/*==============================================================*/
/* Table: genre                                                 */
/*==============================================================*/

-- Create a new table called 'genre' in schema 'movie_finder'
-- Drop the table if it already exists

DROP TABLE IF EXISTS movie_finder.genre;

-- Create the table in the specified schema
CREATE TABLE movie_finder.genre
(
    genre_id INT NOT NULL PRIMARY KEY auto_increment, -- primary key column
    name varchar(50) NOT NULL
);



-- ------------------------- --
-- creation of break tables  --
-- ------------------------- --

/*==============================================================*/
/* Table: film_language                                         */
/*==============================================================*/

-- Create a new table called 'film_language' in schema 'movie_finder'
-- Drop the table if it already exists

DROP TABLE IF EXISTS movie_finder.film_language;

-- Create the table in the specified schema
CREATE TABLE movie_finder.film_language
(
    language_id VARCHAR(10) NOT NULL,
    film_id int NOT NULL,
    PRIMARY KEY(language_id,film_id)
);

/*==============================================================*/
/* Table: cast                                                  */
/*==============================================================*/

-- Create a new table called 'cast' in schema 'movie_finder'
-- Drop the table if it already exists

DROP TABLE IF EXISTS movie_finder.cast;

-- Create the table in the specified schema
CREATE TABLE movie_finder.cast
(
    person_id int NOT NULL,
    film_id int NOT NULL ,
    role VARCHAR(30) NOT NULL,
    PRIMARY KEY(person_id,film_id)
);

/*==============================================================*/
/* Table: film_genre                                            */
/*==============================================================*/

-- Create a new table called 'film_genre' in schema 'movie_finder'
-- Drop the table if it already exists

DROP TABLE IF EXISTS movie_finder.film_genre;

-- Create the table in the specified schema
CREATE TABLE movie_finder.film_genre
(
    genre_id int NOT NULL,
    film_id int NOT NULL ,
    PRIMARY KEY(genre_id,film_id)
);

/*==============================================================*/
/* Table: film_country                                          */
/*==============================================================*/

-- Create a new table called 'film_country' in schema 'movie_finder'
-- Drop the table if it already exists

DROP TABLE IF EXISTS movie_finder.film_country;

-- Create the table in the specified schema
CREATE TABLE movie_finder.film_country
(
    country_id VARCHAR(2) NOT NULL,
    film_id int NOT NULL,
    PRIMARY KEY(country_id,film_id)
);

/*==============================================================*/
/* Table: film_director                                         */
/*==============================================================*/

-- Create a new table called 'film_director' in schema 'movie_finder'
-- Drop the table if it already exists

DROP TABLE IF EXISTS movie_finder.film_director;

-- Create the table in the specified schema
CREATE TABLE movie_finder.film_director
(
    person_id int NOT NULL,
    film_id int NOT NULL ,
    PRIMARY KEY(person_id,film_id)
);

/*==============================================================*/
/* Table: rating                                                */
/*==============================================================*/

-- Create a new table called 'rating' in schema 'movie_finder'
-- Drop the table if it already exists

DROP TABLE IF EXISTS movie_finder.rating;

-- Create the table in the specified schema
CREATE TABLE movie_finder.rating
(
    rate_id int NOT NULL auto_increment,
    film_id int NOT NULL ,
    reviewer_id int NOT NULL,
    rate int(3) NOT NULL,
    PRIMARY KEY(rate_id,film_id,reviewer_id)
);

/*==============================================================*/
/* foreings keys                                                */
/*==============================================================*/

ALTER TABLE movie_finder.film_language add CONSTRAINT FK_film_language FOREIGN KEY (film_id) REFERENCES film(film_id);
ALTER TABLE movie_finder.film_language add CONSTRAINT FK_film_language2 FOREIGN KEY (language_id) REFERENCES language(language_id);
ALTER TABLE movie_finder.cast add CONSTRAINT FK_cast FOREIGN KEY (person_id) REFERENCES person(person_id);
ALTER TABLE movie_finder.cast add CONSTRAINT FK_cast2 FOREIGN KEY (film_id) REFERENCES film(film_id);
ALTER TABLE movie_finder.film_genre add CONSTRAINT FK_film_genre FOREIGN KEY (film_id) REFERENCES film(film_id);
ALTER TABLE movie_finder.film_genre add CONSTRAINT FK_film_genre2 FOREIGN KEY (genre_id) REFERENCES genre(genre_id);
ALTER TABLE movie_finder.film_country add CONSTRAINT FK_film_country FOREIGN KEY (film_id) REFERENCES film(film_id);
ALTER TABLE movie_finder.film_country add CONSTRAINT FK_film_country2 FOREIGN KEY (country_id) REFERENCES country(country_id);
ALTER TABLE movie_finder.film_director add CONSTRAINT FK_film_director FOREIGN KEY (film_id) REFERENCES film(film_id);
ALTER TABLE movie_finder.film_director add CONSTRAINT FK_film_director2 FOREIGN KEY (person_id) REFERENCES person(person_id);
ALTER TABLE movie_finder.rating add CONSTRAINT FK_rating FOREIGN KEY (film_id) REFERENCES film(film_id);
ALTER TABLE movie_finder.rating add CONSTRAINT FK_rating2 FOREIGN KEY (reviewer_id) REFERENCES reviewer(reviewer_id);


