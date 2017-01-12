DELETE FROM PowerType;
DELETE FROM Power;
DELETE FROM Weakness;
DELETE FROM Sidekick;
DELETE FROM SuperheroPower;
DELETE FROM SuperheroWeakness;
DELETE FROM Superhero;

DROP TABLE IF EXISTS Superhero;
DROP TABLE IF EXISTS Power;
DROP TABLE IF EXISTS PowerType;
DROP TABLE IF EXISTS SuperheroPower;
DROP TABLE IF EXISTS Sidekick;
DROP TABLE IF EXISTS Weakness;
DROP TABLE IF EXISTS SuperheroWeakness;


CREATE TABLE `Superhero` (
	`SuperheroId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name`	TEXT NOT NULL,
	`Gender`	TEXT NOT NULL,
	`Lair`	TEXT NOT NULL,
  `CostumeColor` TEXT NOT NULL
);

INSERT INTO Superhero VALUES (null, 'Green Lantern', 'M', 'Green Room', 'Green');
INSERT INTO Superhero VALUES (null, 'Wonder Woman', 'F', 'Themyscira', 'Blue, Gold, Red');
INSERT INTO Superhero VALUES (null, 'Batman', 'M', 'Bat Cave', 'Grey');

CREATE TABLE `Sidekick` (
	`SidekickId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name`	TEXT NOT NULL,
	`Gender`	TEXT NOT NULL,
	`Profession`	TEXT NOT NULL,
	`SuperheroId`	INTEGER NOT NULL,
	FOREIGN KEY(`SuperheroId`) REFERENCES `Superhero`(`SuperheroId`)
);

INSERT INTO Sidekick  
  SELECT null, 'Robin', 'M', 'Neerdowell', SuperheroId
  FROM Superhero s
  WHERE s.Name = 'Batman';


CREATE TABLE `PowerType` (
	`PowerTypeId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name`	TEXT NOT NULL
);

CREATE TABLE `Power` (
	`PowerId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name`	TEXT NOT NULL,
	`PowerTypeId`	INTEGER NOT NULL,
	FOREIGN KEY(`PowerTypeId`) REFERENCES `PowerType`(`PowerTypeId`)
);

CREATE TABLE `SuperheroPower` (
	`SuperheroPowerId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`SuperheroId`	INTEGER NOT NULL,
	`PowerId`	INTEGER NOT NULL,
	FOREIGN KEY(`PowerId`) REFERENCES `Power`(`PowerId`),
	FOREIGN KEY(`SuperheroId`) REFERENCES `Superhero`(`SuperheroId`)
);

CREATE TABLE `Weakness` (
	`WeaknessId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name`	TEXT NOT NULL
);

CREATE TABLE `SuperheroWeakness` (
	`SuperheroWeaknessId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`SuperheroId`	INTEGER NOT NULL,
	`WeaknessId`	INTEGER NOT NULL,
	FOREIGN KEY(`WeaknessId`) REFERENCES `Weakness`(`WeaknessId`),
	FOREIGN KEY(`SuperheroId`) REFERENCES `Superhero`(`SuperheroId`)
);






