/*******************
Create the schema
********************/

CREATE TABLE IF NOT EXISTS rarities (
 name VARCHAR(64),
 PRIMARY KEY (name)
);

CREATE TABLE IF NOT EXISTS dragon_sets (
 name VARCHAR(64),
 PRIMARY KEY (name)
);

CREATE TABLE IF NOT EXISTS dragon_types (
 name VARCHAR(64),
 PRIMARY KEY (name)
);

CREATE TABLE IF NOT EXISTS essence (
 name VARCHAR(64),
 PRIMARY KEY (name)
);


------------------------------------------------------
-- Dragons
------------------------------------------------------

CREATE TABLE IF NOT EXISTS dragons (
 name VARCHAR(64),
 dragon_set VARCHAR(64) NOT NULL,
 rarity VARCHAR(64) NOT NULL,
 essence VARCHAR(64) NOT NULL,
 dragon_type VARCHAR (255) NOT NULL,
 PRIMARY KEY (name),
 CONSTRAINT fk_set FOREIGN KEY (dragon_set) REFERENCES dragon_sets (name) DEFERRABLE,
 CONSTRAINT fk_rarity FOREIGN KEY (rarity) REFERENCES rarities (name) DEFERRABLE,
 CONSTRAINT fk_essence FOREIGN KEY (essence) REFERENCES essence (name) DEFERRABLE,
 CONSTRAINT fk_type FOREIGN KEY (dragon_type) REFERENCES types (name) DEFERRABLE
);

-- Essence views
CREATE VIEW Earth   AS SELECT * FROM dragons WHERE essence = 'Earth';
CREATE VIEW Wind    AS SELECT * FROM dragons WHERE essence = 'Wind';
CREATE VIEW Water   AS SELECT * FROM dragons WHERE essence = 'Water';

-- Rarity views
CREATE VIEW Common    AS SELECT * FROM dragons WHERE rarity = 'Common';
CREATE VIEW Uncommon  AS SELECT * FROM dragons WHERE rarity = 'Uncommon';
CREATE VIEW Rare      AS SELECT * FROM dragons WHERE rarity = 'Rare';
CREATE VIEW Epic      AS SELECT * FROM dragons WHERE rarity = 'Epic';
CREATE VIEW Legendary AS SELECT * FROM dragons WHERE rarity = 'Legendary';

-- Set views
CREATE VIEW Woodland    AS SELECT * FROM dragons WHERE dragon_set = 'Woodland';
CREATE VIEW ForestLake  AS SELECT * FROM dragons WHERE dragon_set = 'Forest Lake';
CREATE VIEW Meadow      AS SELECT * FROM dragons WHERE dragon_set = 'Meadow';
CREATE VIEW Alpine      AS SELECT * FROM dragons WHERE dragon_set = 'Alpine';
CREATE VIEW Cave        AS SELECT * FROM dragons WHERE dragon_set = 'Cave';
CREATE VIEW Whiskers    AS SELECT * FROM dragons WHERE dragon_set = 'Whiskers';
CREATE VIEW Tropical    AS SELECT * FROM dragons WHERE dragon_set = 'Tropical';
CREATE VIEW Mighty      AS SELECT * FROM dragons WHERE dragon_set = 'Mighty';
CREATE VIEW Extravagant AS SELECT * FROM dragons WHERE dragon_set = 'Extravagant';