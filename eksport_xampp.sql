-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Veebr 16, 2026 kell 03:03 PL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `veebikood`
--

DELIMITER $$
--
-- Toimingud
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `kustutaBrand` (IN `id` INT)   BEGIN
	SELECT * FROM BRANDS;
	DELETE FROM brands WHERE brand_id=id;
	SELECT * FROM BRANDS;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `kustutaCategory` (IN `id` INT)   BEGIN
    SELECT * FROM categories;
    DELETE FROM categories WHERE category_id = id;
    SELECT * FROM categories;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lisaBrand` (IN `brand_nimi` VARCHAR(30))   BEGIN
	INSERT INTO brands (brand_name) VALUES (brand_nimi);
	SELECT * from brands;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lisaCategory` (IN `category_nimi` VARCHAR(30))   BEGIN
    INSERT INTO categories (category_name) VALUES (category_nimi);
    SELECT * FROM categories;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `otsing1tahte` (IN `taht` CHAR(1))   BEGIN
	SELECT * FROM brands WHERE brand_name LIKE CONCAT(taht,'%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `uuendaBrand` (IN `id` INT, IN `uus_brandNimi` VARCHAR(30))   BEGIN
	SELECT * FROM brands;
	UPDATE brands SET brand_name=uus_brandNimi
	WHERE brand_id=id;
	SELECT * FROM brands;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `uuendaCategory` (IN `uus_nimi` VARCHAR(30), IN `id` INT)   BEGIN
    SELECT * FROM categories;
    UPDATE categories SET category_name = uus_nimi WHERE category_id = id;
    SELECT * FROM categories;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`) VALUES
(1, 'Adidas'),
(2, 'H&M'),
(3, 'Nike'),
(4, 'Puma'),
(5, 'Zara');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 't-särk'),
(2, 'mantel'),
(3, 'pusa'),
(4, 'pintsak'),
(5, 'jope');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `model_year` int(11) DEFAULT NULL,
  `list_price` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `brand_id`, `category_id`, `model_year`, `list_price`) VALUES
(1, 'logoga t-särk', 1, 1, 2020, 25.50),
(2, 'sport t-särk', 2, 1, 2021, 22.00),
(3, 'oversize t-särk', 5, 1, 2023, 19.99),
(4, 'talvemantel', 5, 2, 2022, 89.90),
(5, 'kergmantel', 2, 2, 2021, 69.00),
(6, 'kapuutsiga pusa', 1, 3, 2024, 55.00),
(7, 'dressipusa', 3, 3, 2022, 39.99),
(8, 'basic pusa', 4, 3, 2023, 24.99),
(9, 'must pintsak', 4, 4, 2022, 79.99),
(10, 'talvejope', 1, 5, 2024, 120.00),
(11, 'kerge jope', 3, 5, 2022, 70.00);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`),
  ADD UNIQUE KEY `brand_name` (`brand_name`);

--
-- Indeksid tabelile `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeksid tabelile `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT tabelile `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT tabelile `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
