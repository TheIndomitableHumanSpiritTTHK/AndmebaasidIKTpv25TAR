CREATE DATABASE Mihhailenko;
use Mihhailenko;

-- tabeli loomine
CREATE TABLE tootaja(
tootajaID int PRIMARY KEY identity(1,1),
eesnimi varchar(30),
perenimi varchar(30) NOT null,
synniaeg date,
koormus decimal(5,2),
elukoht TEXT,
abielus bit);
SELECT * FROM tootaja;

-- andmete lisamine tabelisse
INSERT INTO tootaja(eesnimi, perenimi, synniaeg)
VALUES ('Mark', 'Päev', '2025-10-13'),
('Sabir', 'Lomonossov', '2022-10-13'),
('Marina', 'Oleinik', '2020-10-13');
