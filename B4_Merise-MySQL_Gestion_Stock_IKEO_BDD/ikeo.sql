-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8081
-- Generation Time: Jan 13, 2022 at 01:41 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ikeo2`
--

-- --------------------------------------------------------

--
-- Table structure for table `apparaitres`
--

CREATE TABLE `apparaitres` (
  `id_facture` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `apparaitres`
--

INSERT INTO `apparaitres` (`id_facture`, `id_produit`, `quantite`) VALUES
(1, 1, 20),
(1, 2, 30),
(1, 3, 10),
(2, 8, 25),
(2, 4, 32),
(3, 3, 80),
(3, 5, 70),
(3, 6, 60),
(3, 4, 60),
(3, 9, 120),
(3, 7, 90),
(4, 1, 10),
(4, 2, 10),
(4, 6, 30),
(5, 1, 25),
(5, 7, 34),
(6, 2, 40),
(6, 6, 38),
(6, 6, 54),
(7, 4, 20),
(7, 5, 34),
(7, 6, 45);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id_clients` int(11) NOT NULL,
  `nom_client` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `id_type` int(11) NOT NULL,
  `id_ville` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id_clients`, `nom_client`, `adresse`, `id_type`, `id_ville`) VALUES
(1, 'Bo Meuble', 'Place vendome', 1, 1),
(2, 'Mobel', 'Porte de Brandebourg', 1, 2),
(3, 'Bo Meuble', 'Rue jean jaurès', 1, 3),
(4, 'Tout A La Maison', 'Rue de la bastille', 1, 1),
(5, 'Bo Meuble', 'Avenue des trois dragons', 1, 4),
(6, 'The World Compagny', 'Oxford street', 2, 5),
(7, 'The Best Greatest Beautifulest Furniture', 'Coven garden', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `dates`
--

CREATE TABLE `dates` (
  `id_date` int(11) NOT NULL,
  `ref_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dates`
--

INSERT INTO `dates` (`id_date`, `ref_date`) VALUES
(1, '2018-06-15'),
(2, '2018-06-23'),
(3, '2018-06-28'),
(4, '2018-07-01'),
(5, '2018-07-04'),
(6, '2018-07-12');

-- --------------------------------------------------------

--
-- Table structure for table `etat_produits`
--

CREATE TABLE `etat_produits` (
  `id_etat` int(11) NOT NULL,
  `abandonne` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `etat_produits`
--

INSERT INTO `etat_produits` (`id_etat`, `abandonne`) VALUES
(1, 'oui'),
(2, 'non');

-- --------------------------------------------------------

--
-- Table structure for table `fabriques`
--

CREATE TABLE `fabriques` (
  `id_usine` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fabriques`
--

INSERT INTO `fabriques` (`id_usine`, `id_produit`) VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 2),
(1, 3),
(3, 3),
(3, 4),
(1, 5),
(3, 5),
(2, 5),
(1, 6),
(3, 6),
(3, 7),
(2, 7),
(3, 8),
(3, 9);

-- --------------------------------------------------------

--
-- Table structure for table `factures`
--

CREATE TABLE `factures` (
  `id_facture` int(11) NOT NULL,
  `numero_facture` varchar(50) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `factures`
--

INSERT INTO `factures` (`id_facture`, `numero_facture`, `id_client`, `id_date`) VALUES
(1, 'MSQ291', 1, 1),
(2, 'MSQ292', 5, 2),
(3, 'MSQ293', 6, 2),
(4, 'MSQ294 ', 1, 3),
(5, 'MSQ295 ', 4, 4),
(6, 'MSQ296 ', 7, 5),
(7, 'MSQ297', 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `pays`
--

CREATE TABLE `pays` (
  `id_pays` int(11) NOT NULL,
  `nom_pays` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pays`
--

INSERT INTO `pays` (`id_pays`, `nom_pays`) VALUES
(1, 'france'),
(2, 'allemagne'),
(3, 'espagne'),
(4, 'angleterre');

-- --------------------------------------------------------

--
-- Table structure for table `produits`
--

CREATE TABLE `produits` (
  `id_produit` int(11) NOT NULL,
  `nom_produit` varchar(50) NOT NULL,
  `ref_produit` varchar(50) NOT NULL,
  `description_produit` text NOT NULL,
  `id_etat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produits`
--

INSERT INTO `produits` (`id_produit`, `nom_produit`, `ref_produit`, `description_produit`, `id_etat`) VALUES
(1, 'Knutsen', 'OANT72 ', 'Table basse pour poser les bières', 2),
(2, 'Moen', 'OANT34', 'chaise haute de bar', 1),
(3, 'Eide', 'OANT67', 'Porte-serviettes pour 100 serviettes', 2),
(4, 'Gulbrandsen', 'LXAL34', 'lit nuage en lévitation', 2),
(5, 'Naess', 'LXAL56', 'Table 128 convives', 2),
(6, 'Lund', 'LXAL 78', 'Bureau-cafetière électrique', 2),
(7, 'Dahl', 'LXAL12', 'Tiroir à ronds de serviette', 1),
(8, 'Ruud', 'OANT90', 'Bureau-lit conbiné', 2),
(9, 'Apfelgluk', 'OANT12', 'Panier à chien (ou à chat)', 2);

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id_type` int(11) NOT NULL,
  `type_client` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id_type`, `type_client`) VALUES
(1, 'magasin'),
(2, 'centrale d\'achat');

-- --------------------------------------------------------

--
-- Table structure for table `usines`
--

CREATE TABLE `usines` (
  `id_usine` int(11) NOT NULL,
  `nom_usine` varchar(50) NOT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `ville_usine` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usines`
--

INSERT INTO `usines` (`id_usine`, `nom_usine`, `adresse`, `ville_usine`) VALUES
(1, 'Harald', 'Quai Pipervika', 'Oslo'),
(2, 'Sverre', 'Rue Strangehagen', 'Bergen'),
(3, 'Olaf', 'Place Nidaros', 'Trondheim');

-- --------------------------------------------------------

--
-- Table structure for table `villes`
--

CREATE TABLE `villes` (
  `id_ville` int(11) NOT NULL,
  `nom_ville` varchar(50) DEFAULT NULL,
  `id_pays` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `villes`
--

INSERT INTO `villes` (`id_ville`, `nom_ville`, `id_pays`) VALUES
(1, 'Paris', 1),
(2, 'Berlin', 2),
(3, 'Brest', 1),
(4, 'Barcelone', 3),
(5, 'Londres', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apparaitres`
--
ALTER TABLE `apparaitres`
  ADD KEY `id_facture` (`id_facture`),
  ADD KEY `id_produit` (`id_produit`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_clients`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `id_ville` (`id_ville`);

--
-- Indexes for table `dates`
--
ALTER TABLE `dates`
  ADD PRIMARY KEY (`id_date`);

--
-- Indexes for table `etat_produits`
--
ALTER TABLE `etat_produits`
  ADD PRIMARY KEY (`id_etat`);

--
-- Indexes for table `fabriques`
--
ALTER TABLE `fabriques`
  ADD KEY `id_produit` (`id_produit`),
  ADD KEY `id_usine` (`id_usine`);

--
-- Indexes for table `factures`
--
ALTER TABLE `factures`
  ADD PRIMARY KEY (`id_facture`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_date` (`id_date`);

--
-- Indexes for table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id_pays`);

--
-- Indexes for table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `id_etat` (`id_etat`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id_type`);

--
-- Indexes for table `usines`
--
ALTER TABLE `usines`
  ADD PRIMARY KEY (`id_usine`);

--
-- Indexes for table `villes`
--
ALTER TABLE `villes`
  ADD PRIMARY KEY (`id_ville`),
  ADD KEY `id_pays` (`id_pays`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_clients` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dates`
--
ALTER TABLE `dates`
  MODIFY `id_date` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `etat_produits`
--
ALTER TABLE `etat_produits`
  MODIFY `id_etat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `factures`
--
ALTER TABLE `factures`
  MODIFY `id_facture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pays`
--
ALTER TABLE `pays`
  MODIFY `id_pays` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `produits`
--
ALTER TABLE `produits`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usines`
--
ALTER TABLE `usines`
  MODIFY `id_usine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `villes`
--
ALTER TABLE `villes`
  MODIFY `id_ville` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apparaitres`
--
ALTER TABLE `apparaitres`
  ADD CONSTRAINT `apparaitres_ibfk_1` FOREIGN KEY (`id_facture`) REFERENCES `factures` (`id_facture`),
  ADD CONSTRAINT `apparaitres_ibfk_3` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`);

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `types` (`id_type`),
  ADD CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`id_ville`) REFERENCES `villes` (`id_ville`);

--
-- Constraints for table `fabriques`
--
ALTER TABLE `fabriques`
  ADD CONSTRAINT `fabriques_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`),
  ADD CONSTRAINT `fabriques_ibfk_2` FOREIGN KEY (`id_usine`) REFERENCES `usines` (`id_usine`);

--
-- Constraints for table `factures`
--
ALTER TABLE `factures`
  ADD CONSTRAINT `factures_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_clients`),
  ADD CONSTRAINT `factures_ibfk_2` FOREIGN KEY (`id_date`) REFERENCES `dates` (`id_date`);

--
-- Constraints for table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`id_etat`) REFERENCES `etat_produits` (`id_etat`);

--
-- Constraints for table `villes`
--
ALTER TABLE `villes`
  ADD CONSTRAINT `villes_ibfk_3` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id_pays`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
