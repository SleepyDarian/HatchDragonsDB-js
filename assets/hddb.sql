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


/*******************
Insert data
********************/

INSERT INTO rarities VALUES('Common');
INSERT INTO rarities VALUES('Uncommon');
INSERT INTO rarities VALUES('Rare');
INSERT INTO rarities VALUES('Epic');
INSERT INTO rarities VALUES('Legendary');



INSERT INTO essence VALUES('Earth');
INSERT INTO essence VALUES('Wind');
INSERT INTO essence VALUES('Water');



INSERT INTO dragon_sets VALUES('Woodland');
INSERT INTO dragon_sets VALUES('Forest Lake');
INSERT INTO dragon_sets VALUES('Meadow');
INSERT INTO dragon_sets VALUES('Companionship');
INSERT INTO dragon_sets VALUES('Alpine');
INSERT INTO dragon_sets VALUES('Cave');
INSERT INTO dragon_sets VALUES('Zodiac');
INSERT INTO dragon_sets VALUES('Folklore');
INSERT INTO dragon_sets VALUES('Whiskers');
INSERT INTO dragon_sets VALUES('Tropical');
INSERT INTO dragon_sets VALUES('Mighty');
INSERT INTO dragon_sets VALUES('Extravagant');



INSERT INTO dragon_types VALUES('Reptilian');
INSERT INTO dragon_types VALUES('Avian');
INSERT INTO dragon_types VALUES('Mammalian');
INSERT INTO dragon_types VALUES('Floral');
INSERT INTO dragon_types VALUES('Insectile');
INSERT INTO dragon_types VALUES('Piscine');
INSERT INTO dragon_types VALUES('Fungi');
INSERT INTO dragon_types VALUES('Amphibian');
INSERT INTO dragon_types VALUES('Crustacean');
INSERT INTO dragon_types VALUES('Feline');
INSERT INTO dragon_types VALUES('Coral');
INSERT INTO dragon_types VALUES('Spirit');
INSERT INTO dragon_types VALUES('Arbor');
INSERT INTO dragon_types VALUES('Fructus');


INSERT INTO dragons VALUES('Common Rocktail', 'Woodland', 'Common', 'Earth', 'Reptilian');
INSERT INTO dragons VALUES('Woodpip', 'Woodland', 'Common', 'Wind', 'Avian');
INSERT INTO dragons VALUES('Softfoot', 'Woodland', 'Uncommon', 'Earth', 'Mammalian');
INSERT INTO dragons VALUES('Blush Pinewing', 'Woodland', 'Uncommon', 'Wind', 'Avian');

INSERT INTO dragons VALUES('Sunbloom', 'Forest Lake', 'Common', 'Earth', 'Floral');
INSERT INTO dragons VALUES('Barred Hoverdart', 'Forest Lake', 'Common', 'Wind', 'Insectile');
INSERT INTO dragons VALUES('Reed Firefin', 'Forest Lake', 'Uncommon', 'Water', 'Piscine');
INSERT INTO dragons VALUES('Lakecutter', 'Forest Lake', 'Rare', 'Water', 'Avian');

INSERT INTO dragons VALUES('Sooty Fieldpacer', 'Meadow', 'Common', 'Earth', 'Mammalian');
INSERT INTO dragons VALUES('Hook-tailed Bluebud', 'Meadow', 'Uncommon', 'Earth', 'Floral');
INSERT INTO dragons VALUES('Great Fieldhoof', 'Meadow', 'Rare', 'Earth', 'Mammalian');

INSERT INTO dragons VALUES('Teenysnout', 'Companionship', 'Uncommon', 'Earth', 'Special,Mammalian');
INSERT INTO dragons VALUES('Azure Flipperwing', 'Companionship', 'Rare', 'Water', 'Special,Avian');
INSERT INTO dragons VALUES('Saltskimmer', 'Companionship', 'Epic', 'Water', 'Special,Avian');
INSERT INTO dragons VALUES('Gentle Goldenpaw', 'Companionship', 'Legendary', 'Earth', 'Special,Mammalian');

INSERT INTO dragons VALUES('Scruffhorn', 'Alpine', 'Common', 'Earth', 'Mammalian');
INSERT INTO dragons VALUES('Regal Preywing', 'Alpine', 'Common', 'Wind', 'Avian');
INSERT INTO dragons VALUES('Spotty Plumpcap', 'Alpine', 'Uncommon', 'Earth', 'Fungi');
INSERT INTO dragons VALUES('Alp Angel', 'Alpine', 'Rare', 'Earth', 'Mammalian');
INSERT INTO dragons VALUES('Shimmerfin', 'Alpine', 'Epic', 'Water', 'Amphibian');
INSERT INTO dragons VALUES('Sapphire Flutterwing', 'Alpine', 'Legendary', 'Wind', 'Insectile');

INSERT INTO dragons VALUES('Nighttooth', 'Cave', 'Common', 'Wind', 'Mammalian');
INSERT INTO dragons VALUES('Cavedrummer', 'Cave', 'Uncommon', 'Water', 'Piscine');
INSERT INTO dragons VALUES('Pearl Armorback', 'Cave', 'Uncommon', 'Earth', 'Crustacean');
INSERT INTO dragons VALUES('Dazzlecap', 'Cave', 'Rare', 'Earth', 'Fungi');
INSERT INTO dragons VALUES('Watersnare', 'Cave', 'Epic', 'Water', 'Amphibian');

INSERT INTO dragons VALUES('Solarback Capricorn', 'Zodiac', 'Epic', 'Earth', 'Special,Capricorn');
INSERT INTO dragons VALUES('Moonlit Aquarius', 'Zodiac', 'Epic', 'Water', 'Special,Aquarius');
INSERT INTO dragons VALUES('Galaxytail Pisces', 'Zodiac', 'Epic', 'Water', 'Special,Pisces');
INSERT INTO dragons VALUES('Starryeye Aries', 'Zodiac', 'Epic', 'Earth', 'Special,Aries');
INSERT INTO dragons VALUES('Moonshard Taurus', 'Zodiac', 'Epic', 'Earth', 'Special,Taurus');
INSERT INTO dragons VALUES('Cloudwing Gemini', 'Zodiac', 'Epic', 'Wind', 'Special,Gemini');
INSERT INTO dragons VALUES('Duskclaw Cancer', 'Zodiac', 'Epic', 'Water', 'Special,Cancer');
INSERT INTO dragons VALUES('Skymane Leo', 'Zodiac', 'Epic', 'Earth', 'Special,Leo');
INSERT INTO dragons VALUES('Nebula Virgo', 'Zodiac', 'Epic', 'Earth', 'Special,Virgo');
INSERT INTO dragons VALUES('Stardust Libra', 'Zodiac', 'Epic', 'Wind', 'Special,Libra');
INSERT INTO dragons VALUES('Twilight Scorpio', 'Zodiac', 'Epic', 'Earth', 'Special,Scorpio');
INSERT INTO dragons VALUES('Dawn Sagittarius', 'Zodiac', 'Epic', 'Earth', 'Special,Sagittarius');

INSERT INTO dragons VALUES('Shadegazer', 'Folklore', 'Epic', 'Earth', 'Special,Mörksugga');
INSERT INTO dragons VALUES('Brightwolf', 'Folklore', 'Epic', 'Earth', 'Special,Wisp');
INSERT INTO dragons VALUES('Hollowkin', 'Folklore', 'Epic', 'Earth', 'Special,Troll');
INSERT INTO dragons VALUES('Oldenclaw', 'Folklore', 'Legendary', 'Wind', 'Special,Elder');
INSERT INTO dragons VALUES('Mistdancer', 'Folklore', 'Legendary', 'Water', 'Special,Elf');

INSERT INTO dragons VALUES('Inkwhisker', 'Whiskers', 'Uncommon', 'Earth', 'Feline');
INSERT INTO dragons VALUES('Emberwhisker', 'Whiskers', 'Rare', 'Earth', 'Feline');
INSERT INTO dragons VALUES('Mottlewhisker', 'Whiskers', 'Epic', 'Earth', 'Feline');

INSERT INTO dragons VALUES('Duskytuft', 'Tropical', 'Common', 'Earth', 'Mammalian');
INSERT INTO dragons VALUES('Twin-toed Flameskin', 'Tropical', 'Uncommon', 'Water', 'Amphibian');
INSERT INTO dragons VALUES('Sunsquawk', 'Tropical', 'Uncommon', 'Wind', 'Avian');
INSERT INTO dragons VALUES('Mosaic Hornbrow', 'Tropical', 'Rare', 'Earth', 'Reptilian');
INSERT INTO dragons VALUES('Giant Branchback', 'Tropical', 'Epic', 'Water', 'Coral');

INSERT INTO dragons VALUES('Spiritpaw', 'Mighty', 'Common', 'Earth', 'Spirit');
INSERT INTO dragons VALUES('Sjöodjur', 'Mighty', 'Uncommon', 'Water', 'Piscine');
INSERT INTO dragons VALUES('Dire Ghostwing', 'Mighty', 'Rare', 'Wind', 'Avian');
INSERT INTO dragons VALUES('Irongrip Shieldwing', 'Mighty', 'Epic', 'Earth', 'Insectile');
INSERT INTO dragons VALUES('Ancient Gnarlroot', 'Mighty', 'Legendary', 'Earth', 'Arbor');

INSERT INTO dragons VALUES('Hissblossom', 'Extravagant', 'Uncommon', 'Earth', 'Reptilian');
INSERT INTO dragons VALUES('Emerald Lovetail', 'Extravagant', 'Rare', 'Wind', 'Avian');
INSERT INTO dragons VALUES('Striped Flowfin', 'Extravagant', 'Epic', 'Water', 'Piscine');
INSERT INTO dragons VALUES('Flairwhirl', 'Extravagant', 'Legendary', 'Earth', 'Fructus');
