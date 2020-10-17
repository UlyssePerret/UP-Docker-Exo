-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : mer. 16 sep. 2020 à 11:08
-- Version du serveur :  10.5.5-MariaDB-1:10.5.5+maria~focal
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projetSql`
--

-- --------------------------------------------------------

--
-- Structure de la table `Contacts`
--

CREATE TABLE `Contacts` (
  `ID` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `User_id` int(11) NOT NULL,
  `User_email` varchar(50) NOT NULL,
  `display_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Contacts`
--

INSERT INTO `Contacts` (`ID`, `firstname`, `lastname`, `User_id`, `User_email`, `display_name`) VALUES
(1, 'Ulysse', 'Perret', 2, 'ulysseperret@orange.fr', 'Ulysse Perret'),
(2, 'Test', 'test', 1, 'test@gmail.com', 'Test test'),
(5, 'Anabelle', 'Cal', 3, 'anabellecal@gmail.com', 'Anabelle Cal'),
(10, 'Roxane', 'Deniau', 8, 'roxanedeniau@test.com', 'Roxane Deniau');

-- --------------------------------------------------------

--
-- Structure de la table `Users`
--

CREATE TABLE `Users` (
  `ID` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `firtname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL COMMENT 'a crypte',
  `active` tinyint(1) NOT NULL,
  `creation_dt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Users`
--

INSERT INTO `Users` (`ID`, `email`, `firtname`, `lastname`, `password`, `active`, `creation_dt`) VALUES
(13, 'albert.einstein@test.com', 'Albert', 'Einstein', 'e=mc2', 1, '2020-09-01'),
(3, 'anabellecal@gmail.com', 'Anabelle', 'Cal', 'test123', 0, '2020-09-15'),
(18, 'chafine.dormod@gmail', 'Chafine', 'Dormod', NULL, 1, '2020-09-16'),
(5, 'diojo@test.com', 'Dio', 'Jo', '', 0, '2020-09-15'),
(17, 'fredtestso@gmail.', 'Fred', 'Testso', NULL, 0, '2020-09-15'),
(4, 'jeandupont@gmail.com', 'Jean', 'Dupont', 'test123', 1, '2020-09-15'),
(15, 'marcelbal@gmail.com', 'Marcel', 'Bal', NULL, 1, '2020-09-16'),
(14, 'nickolas.sarkozy@test.com', 'Nickolas', 'Sarkozy', '', 0, '2020-09-08'),
(16, 'omarsy@gmail.com', 'Omar', 'Sy', NULL, 1, '2020-09-02'),
(11, 'penelopebruz@test.com', 'Penelope', 'Bruz', '', 0, '2020-09-15'),
(9, 'penelopecruz@test.com', 'Penelope', 'Cruz', '', 0, '2020-09-15'),
(8, 'roxanedeniau@test.com', 'Roxane', 'Deniau', '', 1, '2020-09-15'),
(2, 'test@gmail.com', 'Test', 'Test', 'test123', 0, '2020-09-15'),
(10, 'timburton@test.com', 'Tim', 'Burton', '', 1, '2020-09-15'),
(12, 'tomfal@test.com', 'Tom', 'Fal', '', 1, '2020-09-15'),
(1, 'ulysseperret@orange.fr', 'Ulysse', 'Perret', 'test123', 1, '2020-09-15'),
(6, 'uyhy@test.com', 'Uy', 'Hy', '', 0, '2020-09-15'),
(7, 'yidi@test.com', 'Yi', 'Di', '', 0, '2020-09-15');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Contacts`
--
ALTER TABLE `Contacts`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `User_email` (`User_email`);

--
-- Index pour la table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`email`) USING BTREE,
  ADD UNIQUE KEY `ID` (`ID`) USING BTREE;

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Contacts`
--
ALTER TABLE `Contacts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `Users`
--
ALTER TABLE `Users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Contacts`
--
ALTER TABLE `Contacts`
  ADD CONSTRAINT `Contacts_ibfk_1` FOREIGN KEY (`User_email`) REFERENCES `Users` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
