create database lab2;

create table countries(
    country_id serial primary key,
    country_name varchar(50),
    region_id integer,
    population integer
);

insert into countries values (DEFAULT, 'Russia', 5, 140000000);

INSERT INTO countries (country_id, country_name) VALUES (DEFAULT, 'Kazakhstan');

INSERT INTO countries VALUES (default , 'CHINA', null , 55500000);

INSERT INTO countries (country_id, country_name, region_id, population) VALUES (default , 'Korea', 8, 140012000),
                                                                               (DEFAULT, 'Canada', 2, 37590000),
                                                                                (default ,'Germany', 33, 179002300);


alter table countries  alter column country_name set default 'Kazakhstan';

insert into countries (country_name) values (default);

insert into countries values (default , default , default, default);

create table countries_new(
    LIKE countries
);

INSERT INTO countries_new SELECT * FROM countries RETURNING *;

UPDATE countries SET region_id = 1 WHERE region_id IS NULL;

UPDATE countries SET population = population * 1.1 RETURNING country_name, population as "New Population";

DELETE FROM countries WHERE population < 100000;

DELETE FROM countries_new AS CN USING countries AS C WHERE CN.country_id = C.country_id RETURNING *;

DELETE FROM countries RETURNING *;

SELECT * FROM countries;
