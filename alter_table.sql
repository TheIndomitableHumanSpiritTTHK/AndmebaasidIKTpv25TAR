CREATE DATABASE MihhailenkoAlterTable;
use MihhailenkoAlterTable;

CREATE TABLE kasutaja(
kasutaja_id int PRIMARY KEY identity(1,1),
kasutajanimi varchar(25) not null,
parool char(10) not null);

select * from kasutaja;
insert into kasutaja(kasutajanimi, parool)
values ('oleg', 'testik')

-- uue veeru lisamine
ALTER TABLE kasutaja ADD epost varchar(20);
UPDATE kasutaja SET epost='test@test.ee' WHERE kasutaja_id=1;


-- veeru kustutamine
ALTER TABLE kasutaja DROP column epost;

-- veeru andmetüübi muutmine
ALTER TABLE kasutaja ALTER COLUMN parool varchar(25);

-- protseduuri tabeli muutmiseks loomine
CREATE procedure alterTable
@valik varchar(20),
@tabeliNimi varchar(25),
@veeruNimi varchar(25),
@andmetyyp varchar(20) =null
AS
BEGIN
    DECLARE @sql AS varchar(max)
    SET @sql=case
        when @valik='add' then
        concat('ALTER TABLE ', @tabeliNimi, ' ADD ', @veeruNimi,' ', @andmetyyp)
 
        when @valik='drop' then
        concat('ALTER TABLE ', @tabeliNimi, ' DROP COLUMN ', @veeruNimi)

		when @valik='alter' then
        concat('ALTER TABLE ', @tabeliNimi, ' ALTER COLUMN ', @veeruNimi, ' ', @andmetyyp)
END;
print @sql;
begin
EXEC(@sql);
END;
END;



-- kutsume protseduuri
EXEC alterTable @valik='add', @tabeliNimi='kasutaja', @veeruNimi='elukoht', @andmetyyp='int';
select * from kasutaja;
 
EXEC alterTable @valik='drop', @tabeliNimi='kasutaja', @veeruNimi='mobiil';

-- veeru muutmine
EXEC alterTable @valik='alter', @tabeliNimi='kasutaja', @veeruNimi='elukoht', @andmetyyp='varchar(30)';



-- drop protseduur alter
drop procedure alterTable;



--piirangud

CREATE table city(
ID int not null,
cityNimi varchar(50)
);

SELECT * from city;


-- PK lisamine
ALTER TABLE city
ADD CONSTRAINT  pk_id PRIMARY KEY(ID);


-- UNIQUE lisamine
ALTER TABLE city
ADD CONSTRAINT cityNimi_unique UNIQUE(cityNimi);



-- FK lisamine
ALTER TABLE kasutaja ALTER COLUMN elukoht int;
SELECT * FROM kasutaja;

ALTER TABLE kasutaja
ADD CONSTRAINT fk_city FOREIGN KEY(elukoht)
REFERENCES City(id);
