-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 03 juin 2021 à 07:51
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `social-network`
--

-- --------------------------------------------------------

--
-- Structure de la table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nb_user` int(11) DEFAULT NULL,
  `google_id` varchar(200) DEFAULT NULL,
  `id_group` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `groups`
--

INSERT INTO `groups` (`id`, `nb_user`, `google_id`, `id_group`) VALUES
(22, NULL, '100861014292029892478', '60b79da62b1e1'),
(21, NULL, '108623848314985586616', '60b79da62b1e1'),
(53, NULL, '113858940104409779961', '60b87b7f29363'),
(54, NULL, '100861014292029892478', '60b87b7f29363'),
(55, NULL, '108623848314985586616', '60b87cea4b246'),
(56, NULL, '113858940104409779961', '60b87cea4b246');

-- --------------------------------------------------------

--
-- Structure de la table `group_attribute`
--

DROP TABLE IF EXISTS `group_attribute`;
CREATE TABLE IF NOT EXISTS `group_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_google` varchar(40) DEFAULT NULL,
  `id_group` int(11) DEFAULT NULL,
  `text` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `group_attribute`
--

INSERT INTO `group_attribute` (`id`, `id_google`, `id_group`, `text`, `name`, `date`) VALUES
(1, '9223372036854775807', NULL, NULL, 'Guillaume GRAC', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `id_socket_log`
--

DROP TABLE IF EXISTS `id_socket_log`;
CREATE TABLE IF NOT EXISTS `id_socket_log` (
  `id_user` int(11) NOT NULL,
  `id_socket` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_google` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `id_comment` int(11) DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  `id_group` int(11) DEFAULT NULL,
  `date` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `id_user` int(11) NOT NULL,
  `id_socket` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
CREATE TABLE IF NOT EXISTS `user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_google` varchar(50) NOT NULL,
  `login` varchar(40) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_log`
--

INSERT INTO `user_log` (`id`, `id_google`, `login`, `image`) VALUES
(4, '100861014292029892478', 'Joris VERGULDEZOONE', 'https://lh3.googleusercontent.com/a/AATXAJw_cN6ihQQapSZDrnBnCGP__qLI-X3zUSKVxUoO=s96-c'),
(6, '108623848314985586616', 'Guillaume GRAC', 'https://lh3.googleusercontent.com/a-/AOh14GhQ6XbcYcxMdEK2gMZ6nrGF4LrXX2W4Is4SWfc=s96-c'),
(7, '113858940104409779961', 'William KIES', 'https://lh3.googleusercontent.com/a-/AOh14GjLw3kv2-pP9iJmn3G4J5aWrXQtejLCM-U3bwgm=s96-c');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
