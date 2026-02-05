CREATE DATABASE raamatMihhailenko;
use raamatMihhailenko;

-- tabeli zanr loomine
CREATE TABLE zanr(
zanrID int PRIMARY KEY identity(1,1),
zanrNimetus varchar(50) not null,
kirjeldus TEXT
);
SELECT * from zanr;
-- tabeli täitmine
INSERT INTO zanr(zanrNimetus, kirjeldus)
VALUES ('komöödia', 'kõige parim zanr maailmas minu arvates'),
('detektiiv', 'detektiiv zanr keskendub kangelastele'),
('romaantika', 'see on romaantika zanr'),
('draama', 'tõsise konflikti ja tugevate emotsioonidega mängufilm');

-- tabeli autor loomine 
CREATE TABLE autor(
autorID int PRIMARY KEY identity(1,1),
eesnimi varchar(50),
perenimi varchar(50) not null,
synniaasta int check(synniaasta > 1900),
elukoht varchar(30)
);
SELECT * FROM autor;
-- tabeli autor täitmine
INSERT INTO autor(eesnimi, perenimi, synniaasta)
VALUES 
('Jaan', 'Kross', 1920),
('Ene', 'Mihkelson', 1944),
('Viivi', 'Luinik', 1946),
('Andrus', 'Kivirähk', 1970),
('Tõnu', 'Õnnepalu', 1962);

-- tabeli uuendamine
UPDATE autor SET elukoht='Tallinn';

-- tabeli raamat loomine
CREATE TABLE raamat(
raamatID int PRIMARY KEY identity(1,1),
raamatNimetus varchar(100) UNIQUE,
lk int,
autorID int,
FOREIGN KEY (autorID) REFERENCES autor(autorID), 
zanrID int,
FOREIGN key (zanrID) REFERENCES zanr(zanrID)
);

INSERT INTO raamat (raamatNimetus, lk, autorID, zanrID)
VALUES ('Oskar ja asjad', 200, 2, 3), 
('Sügisene armastus', 198, 3, 1);

SELECT * FROM autor;
SELECT * FROM zanr;
SELECT * from raamat;

-- tabeli trykikoda loomine
CREATE TABLE trykikoda(
trykikodaID int PRIMARY KEY identity(1,1),
nimetus varchar(30) UNIQUE,
aadress varchar(30)
);

INSERT INTO trykikoda (nimetus, aadress)
VALUES ('Tallinna Trükikoda', 'Pärnu mnt 12'),
('Eesti Print OÜ', 'Tartu mnt 45');

CREATE TABLE trykitudRaamat(
trRaamatID int PRIMARY KEY identity(1,1),
trykikodaID int,
FOREIGN KEY (trykikodaID) REFERENCES trykikoda(trykikodaID), 
raamatID int,
FOREIGN key (raamatID) REFERENCES raamat(raamatID)
);

SELECT * from raamat;
SELECT * from trykikoda;
SELECT * from trykitudRaamat;

INSERT INTO trykitudRaamat(trykikodaID, raamatID)
VALUES (1, 7),
(2, 8);
