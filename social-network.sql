-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 27 juil. 2021 à 13:56
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `social-network`
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
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `group_message`
--

INSERT INTO `group_message` (`id`, `id_group`, `id_google`, `content`, `date`) VALUES
(9, '60b9c7b83e086', '100861014292029892478', '<p><img src=\"https://media1.giphy.com/media/5QRmvfdoMKH4cemL4w/giphy.gif?cid=b669543df3najxsu0lxcuqhxptk4aq1gtdhqrvtw9vbqibgc&amp;rid=giphy.gif&amp;ct=g\"><br><img src=\"https://media0.giphy.com/media/qmCfDX2tAKBdF0ULCy/giphy-downsized.gif?cid=b669543df3najxsu0lxcuqhxptk4aq1gtdhqrvtw9vbqibgc&amp;rid=giphy-downsized.gif&amp;ct=g\"><br>✡<br>jew</p>', '2021-06-08 00:00:00'),
(8, '60b9c7b83e086', '100861014292029892478', '<p>nononononon☠☢☣</p>', '2021-06-08 00:00:00'),
(7, '60b9c7b83e086', '100861014292029892478', '<p>hgfdhgfd</p>', '2021-06-08 00:00:00'),
(10, '60b9c7b83e086', '113858940104409779961', '<p>cc je m\'appel william</p>', '2021-06-09 00:00:00'),
(19, '60b9c7b83e086', '113858940104409779961', '<p>allahakbar</p>', '2021-06-09 00:00:00'),
(18, '60b9c7b83e086', '113858940104409779961', '<p>je suis roux&nbsp;</p>', '2021-06-09 00:00:00'),
(20, '60b9c7b83e086', '113858940104409779961', '<p>grrrrr</p>', '2021-06-09 06:45:31'),
(21, '60b9c7b83e086', '113858940104409779961', '<p>hohoho</p>', '2021-06-09 08:48:41'),
(22, '60b9c7b83e086', '113858940104409779961', '<p>gfdsgfdsg</p>', '2021-06-09 08:55:18'),
(23, '60b9c7b83e086', '113858940104409779961', '<p>ddddddddd</p>', '2021-06-09 08:56:22'),
(24, '60b9c7b83e086', '113858940104409779961', '<p>ohohohohoh</p>', '2021-06-09 08:57:10'),
(25, '60b9c7b83e086', '113858940104409779961', '<p>hgfdhgfd</p>', '2021-06-09 09:14:07'),
(26, '60b9c7b83e086', '113858940104409779961', '<p>lkjhlkjh</p>', '2021-06-09 09:15:26'),
(27, '60b9c7b83e086', '113858940104409779961', '<p>kjhkjkjhg</p>', '2021-06-09 09:17:09'),
(28, '60b9c7b83e086', '113858940104409779961', '<p>kjhkjhgkjg</p>', '2021-06-09 09:18:05'),
(29, '60b9c7b83e086', '113858940104409779961', '<p>gjhgfjhfhj</p>', '2021-06-09 09:19:34'),
(30, '60b9c7b83e086', '113858940104409779961', '<p>jgfjhgf</p>', '2021-06-09 09:20:39'),
(31, '60b9c7b83e086', '113858940104409779961', '<p>jhgjgjhfd</p>', '2021-06-09 09:21:13'),
(32, '60b9c7b83e086', '113858940104409779961', '<p>jhgfg</p>', '2021-06-09 09:22:04'),
(33, '60b9c7b83e086', '113858940104409779961', '<p>mkjmkjmklj</p>', '2021-06-09 09:26:21'),
(34, '60b9c7b83e086', '113858940104409779961', '<p>klmk&nbsp;</p><p>klklklk&nbsp;</p><p>lk</p><p>&nbsp;lk</p><p>lk</p><p>lk</p><p>lk</p><p>lk</p><p><br></p>', '2021-06-09 09:32:41'),
(35, '60b8c60a0ef48', '100861014292029892478', '<p>coucou</p><p><br></p>', '2021-06-09 20:54:16'),
(36, '60b9c7b83e086', '100861014292029892478', '<p>coucou</p><p><br></p>', '2021-06-09 20:54:16'),
(37, '60b9c7b83e086', '100861014292029892478', '<p>heu</p>', '2021-06-09 20:54:56'),
(38, '60b9c7b83e086', '100861014292029892478', '<p>azerty</p>', '2021-06-09 20:56:01'),
(39, '60b9c7b83e086', '100861014292029892478', '<p>je t\'envoie une notif bg</p><p><br></p>', '2021-06-09 22:16:14'),
(40, '60b9c7b83e086', '100861014292029892478', '<p>notif</p>', '2021-06-09 22:18:31'),
(41, '60b9c7b83e086', '100861014292029892478', '<p>ffdd</p>', '2021-06-09 22:20:30'),
(42, '60b9c7b83e086', '100861014292029892478', '<p>iuyds</p>', '2021-06-09 22:22:53'),
(43, '60b9c7b83e086', '100861014292029892478', '<p>sss</p>', '2021-06-09 22:24:40'),
(44, '60b9c7b83e086', '100861014292029892478', '<p>d</p>', '2021-06-09 22:26:32'),
(45, '60b9c7b83e086', '100861014292029892478', '<p>gf</p>', '2021-06-09 22:28:53'),
(46, '60b9c7b83e086', '100861014292029892478', '<p>gf</p>', '2021-06-09 22:28:53'),
(47, '60b9cab109c2c', '113858940104409779961', '<p>nique ta mère<img src=\"https://media4.giphy.com/media/tZEuu1nvkqWsS5WFHj/giphy.gif?cid=b669543do384anfnj0oizfenp2m6ab0zjgwkgbsxm6tofahc&amp;rid=giphy.gif&amp;ct=g\" style=\"font-family: var(--bs-font-sans-serif); font-size: 1rem;\"></p>', '2021-06-10 09:30:11'),
(48, '60b9c7b83e086', '113858940104409779961', '<p>nique ta mère<img src=\"https://media4.giphy.com/media/tZEuu1nvkqWsS5WFHj/giphy.gif?cid=b669543do384anfnj0oizfenp2m6ab0zjgwkgbsxm6tofahc&amp;rid=giphy.gif&amp;ct=g\" style=\"font-family: var(--bs-font-sans-serif); font-size: 1rem;\"></p>', '2021-06-10 09:30:11'),
(49, '60b9c7b83e086', '113858940104409779961', '<p>joris aime les kilomètres de teub<img src=\"https://media4.giphy.com/media/tZEuu1nvkqWsS5WFHj/giphy.gif?cid=b669543do384anfnj0oizfenp2m6ab0zjgwkgbsxm6tofahc&amp;rid=giphy.gif&amp;ct=g\" style=\"font-family: var(--bs-font-sans-serif); font-size: 1rem;\"></p>', '2021-06-10 09:30:29'),
(50, '60b9c7b83e086', '113858940104409779961', '<p>caca</p>', '2021-06-10 09:49:16'),
(51, '60b9c7b83e086', '113858940104409779961', '<p>caca</p>', '2021-06-10 09:49:16'),
(52, '60b9cab109c2c', '113858940104409779961', '<p>Guillaume est un gros gay mais on l\'aime quand même</p>', '2021-06-10 14:38:10'),
(53, '60b9cab109c2c', '113858940104409779961', '<p>Guillaume est un gros gay mais on l\'aime quand même</p>', '2021-06-10 14:38:10'),
(54, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:50'),
(55, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:50'),
(56, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:51'),
(57, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:51'),
(58, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:51'),
(59, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:51'),
(60, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:51'),
(61, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:51'),
(62, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:51'),
(63, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:51'),
(64, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:51'),
(65, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:51'),
(66, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:51'),
(67, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:51'),
(68, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:51'),
(69, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:52'),
(70, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(71, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(72, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(73, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(74, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(75, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(76, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(77, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(78, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(79, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(80, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(81, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(82, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(83, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(84, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(85, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(86, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(87, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(88, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(89, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(90, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(91, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(92, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(93, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(94, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(95, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(96, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(97, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(98, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(99, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(100, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(101, '60b9c7b83e086', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(102, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53'),
(103, '60b9cab109c2c', '113858940104409779961', '<img src=\"https://media0.giphy.com/media/ggtpXniTZKg6MX8MY7/giphy.gif?cid=b669543d6d25yf1el9ddvmq8tt3o62yqad0v74zdo49u4l7m&amp;rid=giphy.gif&amp;ct=g\">', '2021-06-10 14:39:53');

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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `notification`
--

INSERT INTO `notification` (`id`, `id_google`, `id_group`, `name`, `type`) VALUES
(1, '100861014292029892478', '60b9c7b83e086', 'William KIES', 'message'),
(2, '113858940104409779961', '60b9c7b83e086', 'Joris VERGULDEZOONE', 'message'),
(3, '113858940104409779961', '60b9cab109c2c', 'Guillaume GRAC', 'message'),
(4, '113858940104409779961', '60b9cab109c2c', 'Guillaume GRAC', 'message'),
(5, '113858940104409779961', '60b9cab109c2c', 'Guillaume GRAC', 'message'),
(6, '113858940104409779961', '60b9c7b83e086', 'Joris VERGULDEZOONE', 'message'),
(7, '113858940104409779961', '60b9c7b83e086', 'Joris VERGULDEZOONE', 'message'),
(8, '113858940104409779961', '60b9cab109c2c', 'Guillaume GRAC', 'message'),
(9, '113858940104409779961', '60b9c7b83e086', 'Joris VERGULDEZOONE', 'message'),
(10, '113858940104409779961', '60b9cab109c2c', 'Guillaume GRAC', 'message'),
(11, '113858940104409779961', '60b9c7b83e086', 'Joris VERGULDEZOONE', 'message'),
(12, '113858940104409779961', '60b9cab109c2c', 'Guillaume GRAC', 'message'),
(13, '113858940104409779961', '60b9c7b83e086', 'Joris VERGULDEZOONE', 'message'),
(14, '113858940104409779961', '60b9cab109c2c', 'Guillaume GRAC', 'message'),
(15, '113858940104409779961', '60b9c7b83e086', 'Joris VERGULDEZOONE', 'message'),
(16, '113858940104409779961', '60b9cab109c2c', 'Guillaume GRAC', 'message'),
(17, '113858940104409779961', '60b9c7b83e086', 'Joris VERGULDEZOONE', 'message'),
(18, '113858940104409779961', '60b9cab109c2c', 'Guillaume GRAC', 'message'),
(19, '113858940104409779961', '60b9c7b83e086', 'Joris VERGULDEZOONE', 'message'),
(20, '113858940104409779961', '60b9cab109c2c', 'Guillaume GRAC', 'message'),
(21, '113858940104409779961', '60b9c7b83e086', 'Joris VERGULDEZOONE', 'message'),
(22, '113858940104409779961', '60b9cab109c2c', 'Guillaume GRAC', 'message'),
(23, '113858940104409779961', '60b9c7b83e086', 'Joris VERGULDEZOONE', 'message'),
(24, '113858940104409779961', '60b9cab109c2c', 'Guillaume GRAC', 'message'),
(25, '113858940104409779961', '60b9c7b83e086', 'Joris VERGULDEZOONE', 'message'),
(26, '113858940104409779961', '60b9cab109c2c', 'Guillaume GRAC', 'message'),
(27, '113858940104409779961', '60b9c7b83e086', 'Joris VERGULDEZOONE', 'message'),
(28, '113858940104409779961', '60b9cab109c2c', 'Guillaume GRAC', 'message');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `id_google`, `contenu`, `date`, `nb_like`, `nb_comment`) VALUES
(1, '113858940104409779961', 'azeaze', '2026-07-21', 0, 0),
(2, '113858940104409779961', 'retest', '2026-07-21', 0, 0),
(3, '113858940104409779961', 'azeaze', '2026-07-21', 0, 0),
(4, '113858940104409779961', 'Bonjour Joris', '2027-07-21', 0, 0);

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
  `image_background` varchar(255) NOT NULL,
  `connection` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_log`
--

INSERT INTO `user_log` (`id`, `id_google`, `login`, `image`, `image_background`, `connection`) VALUES
(4, '100861014292029892478', 'Joris VERGULDEZOONE', 'upload/VERGULDEZOONE_2021-06-10_06-30-00.png', 'View/images/default_background.png', 1),
(6, '108623848314985586616', 'Guillaume GRAC', 'https://lh3.googleusercontent.com/a-/AOh14GhQ6XbcYcxMdEK2gMZ6nrGF4LrXX2W4Is4SWfc=s96-c', 'View/images/default_background.png', 0),
(7, '113858940104409779961', 'William KIES', 'upload/KIES_2021-06-11_07-01-27.jpg', 'uploadBg/KIES_wallhaven-vg5gzp.jpg', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
