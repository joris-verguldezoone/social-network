-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 27 juil. 2021 à 23:54
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
  `name` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `groups`
--

INSERT INTO `groups` (`id`, `nb_user`, `google_id`, `id_group`, `name`, `img`) VALUES
(62, NULL, '113858940104409779961', '60b9c7b83e086', 'Joris VERGULDEZOONE', 'upload/VERGULDEZOONE_2021-06-03_13-24-51.png'),
(61, NULL, '100861014292029892478', '60b8c60a0ef48', 'Guillaume GRAC', 'https://lh3.googleusercontent.com/a-/AOh14GhQ6XbcYcxMdEK2gMZ6nrGF4LrXX2W4Is4SWfc=s96-c'),
(60, NULL, '108623848314985586616', '60b8c60a0ef48', 'Joris VERGULDEZOONE', 'https://lh3.googleusercontent.com/a/AATXAJw_cN6ihQQapSZDrnBnCGP__qLI-X3zUSKVxUoO=s96-c'),
(63, NULL, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'https://lh3.googleusercontent.com/a-/AOh14GjLw3kv2-pP9iJmn3G4J5aWrXQtejLCM-U3bwgm=s96-c'),
(64, NULL, '108623848314985586616', '60b9cab109c2c', 'William KIES', 'https://lh3.googleusercontent.com/a-/AOh14GjLw3kv2-pP9iJmn3G4J5aWrXQtejLCM-U3bwgm=s96-c'),
(65, NULL, '113858940104409779961', '60b9cab109c2c', 'Guillaume GRAC', 'https://lh3.googleusercontent.com/a-/AOh14GhQ6XbcYcxMdEK2gMZ6nrGF4LrXX2W4Is4SWfc=s96-c');

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
-- Structure de la table `group_message`
--

DROP TABLE IF EXISTS `group_message`;
CREATE TABLE IF NOT EXISTS `group_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_group` varchar(50) NOT NULL,
  `id_google` varchar(200) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `group_message`
--

INSERT INTO `group_message` (`id`, `id_group`, `id_google`, `content`, `date`) VALUES
(125, '60b9c7b83e086', '100861014292029892478', '<p>mmmmmmmmmm bjr William j\'espere que tu va bien mmmmmmmmmmmmm</p>', '2021-07-27 10:55:39'),
(126, '60b9c7b83e086', '113858940104409779961', 'Coucou Joris, ouiiii ça vaaaa ouffff, keskifé cho ajd', '2021-07-27 10:59:20'),
(127, '60b9c7b83e086', '100861014292029892478', '<p>Oulala oui , un coup de soleil est très vite arrivé........................... ☣</p>', '2021-07-27 11:07:13'),
(124, '60b9c7b83e086', '100861014292029892478', '<img src=\"https://media4.giphy.com/media/FTEYw97n2gSty/giphy.gif?cid=b669543dzmucilxszvdtqgvrc5luo7lo75u18x6hcr2ya1gi&amp;rid=giphy.gif&amp;ct=g\">', '2021-07-27 10:55:20'),
(128, '60b9c7b83e086', '113858940104409779961', 'BOn Il FaUt que jeej aille a +++', '2021-07-27 11:07:45'),
(129, '60b9c7b83e086', '100861014292029892478', '<p>Ok jeej bien jeejLiam mmmmmmmmmmmmm&nbsp;<img src=\"https://media0.giphy.com/media/5BSQwlGtg52Eg/giphy-downsized.gif?cid=b669543dimwonl6m0tn6rd6tgdx3dj5ajv4zs3sqbt7m4s8k&amp;rid=giphy-downsized.gif&amp;ct=g\" style=\"font-family: var(--bs-font-sans-serif); font-size: 1rem;\"></p>', '2021-07-27 11:09:00'),
(130, '60b8c60a0ef48', '100861014292029892478', '&lt;p&gt;sddsds&lt;/p&gt;', '2021-07-27 11:12:52'),
(131, '60b8c60a0ef48', '100861014292029892478', '<p>xd</p>', '2021-07-27 11:13:24'),
(132, '60b8c60a0ef48', '100861014292029892478', '<p>✡</p>', '2021-07-27 11:13:45'),
(133, '60b8c60a0ef48', '100861014292029892478', '<p>✂✅</p>', '2021-07-27 11:13:53'),
(134, '60b8c60a0ef48', '100861014292029892478', '<p>⛔</p>', '2021-07-27 11:14:33');

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_google` varchar(50) NOT NULL,
  `id_group` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `notification`
--

INSERT INTO `notification` (`id`, `id_google`, `id_group`, `name`, `type`) VALUES
(1, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(2, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(3, '100861014292029892478', '60c20cc501df2', 'Jeremy DEJOUX', 'message'),
(4, '100861014292029892478', '60c20cc501df2', 'Jeremy DEJOUX', 'message'),
(5, '100861014292029892478', '60b8c60a0ef48', 'Guillaume GRAC', 'message'),
(6, '100861014292029892478', '60b8c60a0ef48', 'Guillaume GRAC', 'message'),
(7, '100861014292029892478', '60b8c60a0ef48', 'Guillaume GRAC', 'message'),
(8, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(9, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(10, '100861014292029892478', '60b8c60a0ef48', 'Guillaume GRAC', 'message'),
(11, '100861014292029892478', '60b8c60a0ef48', 'Guillaume GRAC', 'message'),
(12, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(13, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(14, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(15, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(16, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(17, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(18, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(19, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(20, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(21, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(22, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(23, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(24, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(25, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(26, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(27, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(28, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(29, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(30, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(31, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(32, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(33, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(34, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(35, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(36, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(37, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(38, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(39, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(40, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(41, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(42, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(43, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(44, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(45, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(46, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(47, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(48, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(49, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(50, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(51, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(52, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(53, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(54, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(55, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(56, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(57, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(58, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(59, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(60, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(61, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(62, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(63, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(64, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(65, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(66, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(67, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(68, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(69, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(70, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(71, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(72, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(73, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(74, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(75, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(76, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(77, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(78, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(79, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(80, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(81, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(82, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(83, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(84, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(85, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(86, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(87, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(88, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(89, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(90, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(91, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(92, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(93, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(94, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(95, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(96, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(97, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(98, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(99, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(100, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(101, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(102, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(103, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(104, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(105, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(106, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(107, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(108, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(109, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(110, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(111, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(112, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(113, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(114, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(115, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(116, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(117, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(118, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(119, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(120, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(121, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(122, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(123, '100861014292029892478', '60b9c7b83e086', '', 'message'),
(124, '100861014292029892478', '60b9c7b83e086', '', 'message'),
(125, '100861014292029892478', '60b9c7b83e086', '', 'message'),
(126, '100861014292029892478', '60b9c7b83e086', '', 'message'),
(127, '100861014292029892478', '60b9c7b83e086', '', 'message'),
(128, '100861014292029892478', '60b9c7b83e086', '', 'message'),
(129, '100861014292029892478', '60b9c7b83e086', '', 'message'),
(130, '100861014292029892478', '60b8c60a0ef48', '', 'message'),
(131, '100861014292029892478', '60b8c60a0ef48', '', 'message'),
(132, '100861014292029892478', '60b8c60a0ef48', '', 'message'),
(133, '100861014292029892478', '60b8c60a0ef48', '', 'message'),
(134, '100861014292029892478', '60b8c60a0ef48', '', 'message');

-- --------------------------------------------------------

--
-- Structure de la table `notification_type`
--

DROP TABLE IF EXISTS `notification_type`;
CREATE TABLE IF NOT EXISTS `notification_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `notification_type`
--

INSERT INTO `notification_type` (`id`, `attribute`) VALUES
(1, 'vous a envoyé un message'),
(2, 'aime votre publication'),
(3, 'aime votre commentaire'),
(4, 'aime votre photo de profil'),
(5, 'aime votre photo de couverture'),
(6, 'a commenté votre photo de couverture'),
(7, 'a commenté votre photo de profil'),
(8, 'a commenté votre publication');

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_google` varchar(50) NOT NULL,
  `contenu` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `nb_like` int(11) NOT NULL,
  `nb_comment` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `id_google`, `contenu`, `date`, `nb_like`, `nb_comment`) VALUES
(1, '113858940104409779961', 'azeaze', '2026-07-21', 0, 0),
(2, '113858940104409779961', 'retest', '2026-07-21', 0, 0),
(3, '113858940104409779961', 'azeaze', '2026-07-21', 0, 0),
(4, '113858940104409779961', 'Bonjour Joris', '2027-07-21', 0, 0),
(5, '100861014292029892478', 'grrrrrrrrrrrrr', '2027-07-21', 0, 0);

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
  `connection` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_log`
--

INSERT INTO `user_log` (`id`, `id_google`, `login`, `image`, `connection`) VALUES
(4, '100861014292029892478', 'Joris VERGULDEZOONE', 'upload/VERGULDEZOONE_2021-07-27_14-22-25.png', 0),
(6, '108623848314985586616', 'Guillaume GRAC', 'https://lh3.googleusercontent.com/a-/AOh14GhQ6XbcYcxMdEK2gMZ6nrGF4LrXX2W4Is4SWfc=s96-c', 0),
(7, '113858940104409779961', 'William KIES', 'https://lh3.googleusercontent.com/a-/AOh14GjLw3kv2-pP9iJmn3G4J5aWrXQtejLCM-U3bwgm=s96-c', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
