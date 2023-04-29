DROP TABLE IF EXISTS ability_mappings;
DROP TABLE IF EXISTS abilities;
DROP TABLE IF EXISTS pokemon_stats;

CREATE TABLE pokemon_stats (
    pokedex_number INT PRIMARY KEY,
    against_bug FLOAT,
    against_dark FLOAT,
    against_dragon FLOAT,
    against_electric FLOAT,
    against_fairy FLOAT,
    against_fight FLOAT,
    against_fire FLOAT,
    against_flying FLOAT,
    against_ghost FLOAT,
    against_grass FLOAT,
    against_ground FLOAT,
    against_ice FLOAT,
    against_normal FLOAT,
    against_poison FLOAT,
    against_psychic FLOAT,
    against_rock FLOAT,
    against_steel FLOAT,
    against_water FLOAT,
    attack INT,
    base_total INT,
    capture_rate INT,
    classification VARCHAR(50),
    defense INT,
    experience_growth INT,
    height_m FLOAT,
    hp INT,
    name VARCHAR(50),
    percentage_male FLOAT,
    sp_attack INT,
    sp_defense INT,
    speed INT,
    type1 VARCHAR(50),
    type2 VARCHAR(50),
    weight_kg FLOAT,
    generation INT,
    is_legendary INT
);

INSERT INTO pokemon_stats
SELECT 
    pokedex_number,
    against_bug,
    against_dark,
    against_dragon,
    against_electric,
    against_fairy,
    against_fight,
    against_fire,
    against_flying,
    against_ghost,
    against_grass,
    against_ground,
    against_ice,
    against_normal,
    against_poison,
    against_psychic,
    against_rock,
    against_steel,
    against_water,
    attack,
    base_total,
    capture_rate,
    classfication,
    defense,
    experience_growth,
    height_m,
    hp,
    name,
    percentage_male,
    sp_attack,
    sp_defense,
    speed,
    type1,
    type2,
    weight_kg,
    generation,
    is_legendary
FROM 
    imported_pokemon_data;

CREATE TABLE abilities (
    name VARCHAR(50) NOT NULL PRIMARY KEY
);

INSERT INTO abilities (name)
SELECT DISTINCT 
    ability
FROM 
    pokemon;

CREATE TABLE ability_mappings (
    pokedex_number INT NOT NULL REFERENCES pokemon_stats (pokedex_number),
    ability VARCHAR(50) NOT NULL REFERENCES abilities (name)
);

INSERT INTO ability_mappings (pokedex_number, ability)
SELECT 
    pokedex_number, ability
FROM 
    pokemon;
