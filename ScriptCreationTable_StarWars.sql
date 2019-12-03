drop table if exists R_Species_Colors;
drop table if exists R_Characters_Colors;
drop table if exists R_Planets_Terrains;
drop table if exists R_Planets_Climates;
drop table if exists Starships;
drop table if exists Characters;
drop table if exists Vehicule;
drop table if exists Species;
drop table if exists Planets;
drop table if exists Manufacturers;
drop table if exists Terrains;
drop table if exists Climates;
drop type if exists genders;
drop type if exists type_color;
drop table if exists Colors;



create table Colors(
    id serial constraint color_pk primary key,
    name varchar
);

create type type_color as enum ('eye','hair','skin');

create type genders as enum ('male','female','hermaphrodite');

create table Climates(
    id serial constraint climate_pk primary key,
    name varchar
);

create table Terrains(
    id serial constraint terrain_pk primary key,
    name varchar
);

create table Manufacturers(
    id serial constraint manufacturer_pk primary key,
    name varchar
);

create table Planets(
    id serial constraint planet_pk primary key,
    name varchar,
    rotation_period int,
    orbital_period int,
    diameter int,
--    climate varchar,
    gravity float,
--    terrain varchar,
    surface_water int,
    population int

);

create table Species(
    id serial constraint specie_pk primary key,
    name varchar,
    classification varchar,
    designation varchar,
    average_height int,
--skin color varchar,
--hair color varchar,
--eye color varchar,
    average_lifespan int,
    id_planet int constraint planet_fk references Planets
);

create table Characters(
    id serial constraint character_pk primary key,
    name varchar,
    height int,
    mass int,
  --  hair_color varchar,
  --  eye_color varchar,
    birth_year timestamp,
    gender genders,
    id_planet int constraint planet_fk references Planets,
    id_specie int constraint specie_fk references Species
);

create table Vehicule(
    id serial constraint vehicule_pk primary key,
    name varchar,
    model varchar,
    id_manufacturer int constraint manufacturer_fk references Manufacturers,
    cost_in_credit varchar,
    length float,
    max_atmospheric_speed int,
    crew int,
    passengers int,
    cargo_capacity int,
    consumables varchar,
    vehicle_class varchar
);

create table Starships(
    id serial constraint starship_pk primary key,
    hyperdrive_rating float,
    MGLT int,
    id_manufacturer int constraint manufacturer_fk references Manufacturers
    )inherits (Vehicule);

create table R_Planets_Climates (
    id_planet int constraint planet_fk references Planets,
    id_climate int constraint climate_id references Climates,
    primary key (id_planet,id_climate)
);

create table R_Planets_Terrains (
    id_planet int constraint planet_fk references Planets,
    id_terrain int constraint terrain_id references Terrains,
    primary key (id_planet,id_terrain)
);

create table R_Characters_Colors (
    id_character int constraint character_fk references Characters,
    id_color int constraint color_id references Colors,
    type type_color,
    primary key (id_color,id_character,type)
);

create table R_Species_Colors (
    id_specie int constraint specie_fk references Species,
    id_color int constraint color_id references Colors,
    type type_color,
    primary key (id_color,id_specie,type)
);

