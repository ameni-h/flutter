-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 29 jan. 2021 à 00:11
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_dht11`
--

-- --------------------------------------------------------

--
-- Structure de la table `dht11`
--

CREATE TABLE `dht11` (
  `id` int(11) NOT NULL,
  `temperature` double NOT NULL,
  `humidity` double NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `dht11`
--

INSERT INTO `dht11` (`id`, `temperature`, `humidity`, `date`) VALUES
(1, 24, 75, '2021-01-28 14:27:23'),
(2, 26, 78, '2021-01-28 14:27:23'),
(3, 18, 66, '2021-01-28 14:28:19'),
(4, 16, 55, '2021-01-28 14:28:19'),
(5, 31, 77, '2021-01-28 14:28:45'),
(6, 35, 81, '2021-01-28 14:28:45');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `dht11`
--
ALTER TABLE `dht11`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `dht11`
--
ALTER TABLE `dht11`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
