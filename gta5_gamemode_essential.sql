-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 01 Juin 2017 à 19:04
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gta5_gamemode_essential`
--

-- --------------------------------------------------------

--
-- Structure de la table `bans`
--

CREATE TABLE `bans` (
  `id` int(10) UNSIGNED NOT NULL,
  `banned` varchar(50) NOT NULL DEFAULT '0',
  `banner` varchar(50) NOT NULL,
  `reason` varchar(150) NOT NULL DEFAULT '0',
  `expires` datetime NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `coordinates`
--

CREATE TABLE `coordinates` (
  `identifier` varchar(255) NOT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `z` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `coordinates`
--

INSERT INTO `coordinates` (`identifier`, `x`, `y`, `z`) VALUES
('ip:109.8.116.182', -147.857162475586, -304.291046142578, 38.599193572998),
('ip:118.232.212.89', 712.828308105469, -893.602905273438, 23.6552562713623),
('ip:213.214.32.33', -856.020324707031, -2491.244140625, 13.4628038406372),
('ip:41.227.38.195', -856.325256347656, -2622.87963867188, 15.7984352111816),
('ip:78.229.128.169', 435.168487548828, -973.383056640625, 30.7133045196533),
('ip:81.242.110.144', -639.027954101563, -1484.83435058594, 10.6842174530029),
('ip:81.65.142.28', -23.8952445983887, -1082.08959960938, 26.6274738311768),
('steam:110000103295924', -608.362060546875, -129.745162963867, 39.0085144042969),
('steam:11000010331d380', -692.713500976563, -835.629028320313, 23.1670608520508),
('steam:110000106608063', -1037.92724609375, -2738.0615234375, 20.1684494018555),
('steam:110000106922d75', -283.424438476563, -239.364166259766, 34.6181221008301),
('steam:11000010769d50a', 381.134613037109, -676.861877441406, 29.3264694213867),
('steam:1100001078d1bbc', -620.186218261719, -162.377624511719, 37.5197563171387),
('steam:110000107f32a77', -1041.8349609375, -2728.95971679688, 20.1698665618896),
('steam:1100001092fb18d', 313.576995849609, -558.494567871094, 28.7437763214111),
('steam:110000109ea864c', 212.232162475586, -793.129699707031, 30.8773212432861),
('steam:11000010a0aff97', -221.222427368164, -1994.22607421875, 27.7554187774658),
('steam:11000010a31dc87', -831.964477539063, -2487.8203125, 13.8306398391724),
('steam:11000010b36faad', -1037.92724609375, -2738.06103515625, 20.1682300567627),
('steam:11000010d576863', 1871.44580078125, 4967.70751953125, 52.612678527832),
('steam:11000010d751e89', 380.689758300781, -681.061767578125, 28.7441158294678),
('steam:11000010e0f2d3e', -570.235961914063, -822.247253417969, 26.4471282958984),
('steam:110000112182dfb', -1037.92724609375, -2738.06103515625, 20.1660785675049),
('steam:1100001155ede14', -1037.92724609375, -2738.06103515625, 20.1660861968994),
('steam:1100001168ab8e6', -1036.8115234375, -2737.15942382813, 20.1692714691162),
('steam:110000117b910f8', 357.778656005859, -667.885559082031, 29.3360137939453),
('steam:110000118640510', 501.730285644531, -996.353942871094, 27.2428112030029),
('steam:1100001198777e5', -191.752685546875, -2162.58911132813, 16.3323287963867);

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `id` int(11) UNSIGNED NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `items`
--

INSERT INTO `items` (`id`, `libelle`, `value`, `type`) VALUES
(1, 'Bouteille d\'eau', 20, 1),
(2, 'Sandwich', 20, 2),
(3, 'Filet Mignon', 20, 2),
(4, 'Cannabis', 0, 0),
(5, 'Cannabis roulé', 0, 0),
(6, 'Feuille Coka', 0, 0),
(7, 'Coka', 0, 0),
(8, 'Coka', 0, 0),
(9, 'Ephedrine ', 0, 0),
(10, 'Matière illégale', 0, 0),
(11, 'Matière illégale', 0, 0),
(12, 'Meth', 0, 0),
(13, 'Organe', 0, 0),
(14, 'Organe emballé', 0, 0),
(15, 'Organe analysé', 0, 0),
(16, 'Organe livrable', 0, 0),
(17, 'Cuivre', 0, 0),
(18, 'Fer', 0, 0),
(19, 'Diamants', 0, 0),
(20, 'Cuivre traité', 0, 0),
(21, 'Fer traité', 0, 0),
(22, 'Diamants traité', 0, 0),
(23, 'Roche', 0, 0),
(24, 'Roche traitée', 0, 0),
(25, 'Poisson', 5, 2),
(26, 'Corps', 0, 0),
(27, 'Corps traité', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `job_name` varchar(40) NOT NULL,
  `salary` int(11) NOT NULL DEFAULT '500'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `jobs`
--

INSERT INTO `jobs` (`job_id`, `job_name`, `salary`) VALUES
(1, 'Sans Emploi', 0),
(2, 'Nettoyeur de piscines', 0),
(3, 'Éboueur', 0),
(4, 'Mineur', 0),
(5, 'Chauffeur de taxi', 500),
(6, 'Livreur de bois', 0),
(7, 'Livreur de citerne', 0),
(8, 'Livreur de conteneur', 0),
(9, 'Livreur de médicaments', 0),
(10, 'Policier', 0),
(11, 'Fossoyeur', 0),
(12, 'Préposé à la morgue', 0);

-- --------------------------------------------------------

--
-- Structure de la table `outfits`
--

CREATE TABLE `outfits` (
  `identifier` varchar(30) NOT NULL,
  `skin` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT 'mp_m_freemode_01',
  `face` int(11) NOT NULL DEFAULT '0',
  `face_text` int(11) NOT NULL DEFAULT '0',
  `hair` int(11) NOT NULL DEFAULT '0',
  `hair_text` int(11) NOT NULL DEFAULT '0',
  `pants` int(11) NOT NULL DEFAULT '0',
  `pants_text` int(11) NOT NULL DEFAULT '0',
  `shoes` int(11) NOT NULL DEFAULT '0',
  `shoes_text` int(11) NOT NULL DEFAULT '0',
  `torso` int(11) NOT NULL DEFAULT '0',
  `torso_text` int(11) NOT NULL DEFAULT '0',
  `shirt` int(11) NOT NULL DEFAULT '0',
  `shirt_text` int(11) NOT NULL DEFAULT '0',
  `three` int(11) NOT NULL DEFAULT '0',
  `three_text` int(11) NOT NULL DEFAULT '0',
  `seven` int(11) NOT NULL DEFAULT '0',
  `seven_text` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `outfits`
--

INSERT INTO `outfits` (`identifier`, `skin`, `face`, `face_text`, `hair`, `hair_text`, `pants`, `pants_text`, `shoes`, `shoes_text`, `torso`, `torso_text`, `shirt`, `shirt_text`, `three`, `three_text`, `seven`, `seven_text`) VALUES
('steam:110000106922d75', 'mp_m_freemode_01', 0, 0, 21, 0, 7, 4, 12, 4, 5, 0, 15, 0, 5, 0, 17, 0),
('steam:11000010d576863', 'mp_m_freemode_01', 4, 0, 19, 4, 24, 5, 20, 10, 29, 5, 31, 2, 12, 0, 29, 0),
('steam:1100001092fb18d', 'mp_m_freemode_01', 1, 0, 2, 1, 1, 14, 1, 4, 41, 0, 15, 0, 12, 0, 0, 0),
('steam:11000010d751e89', 'mp_m_freemode_01', 4, 0, 3, 0, 7, 4, 9, 0, 7, 0, 0, 2, 1, 0, 0, 0),
('ip:109.8.116.182', 'mp_m_freemode_01', 0, 0, 21, 2, 1, 15, 7, 0, 0, 2, 0, 2, 0, 0, 17, 0),
('ip:81.242.110.144', 'mp_m_freemode_01', 0, 0, -1, -1, 24, 5, 18, 0, 29, 5, 31, 0, 12, 0, 29, 2),
('ip:213.214.32.33', 'mp_m_freemode_01', 0, 0, 0, 0, 42, 0, 31, 2, 83, 3, 15, 0, 11, 0, 0, 0),
('steam:11000010a0aff97', 'mp_m_freemode_01', 0, 0, 2, 0, 26, 0, 22, 3, 38, 4, 15, 0, 8, 0, 30, 3),
('steam:110000117b910f8', 'mp_m_freemode_01', 6, 0, 6, 2, 1, 15, 7, 0, 0, 2, 0, 2, 0, 0, 17, 0),
('steam:11000010769d50a', 'mp_m_freemode_01', 0, 0, 3, 3, 10, 0, 10, 0, 115, 0, 72, 4, 33, 0, 0, 0),
('steam:110000107f32a77', 'mp_m_freemode_01', 19, 0, 2, 1, 4, 0, 0, 10, 4, 2, 0, 1, 1, 0, 0, 0),
('ip:41.227.38.195', 'mp_m_freemode_01', 0, 0, 0, 0, 26, 2, 23, 0, 38, 1, 15, 0, 8, 0, 0, 0),
('steam:110000109ea864c', 'mp_m_freemode_01', 0, 0, 1, 0, 1, 14, 1, 4, 41, 0, 15, 0, 12, 0, 0, 0),
('steam:11000010b36faad', 'mp_m_freemode_01', 0, 0, 0, 0, 1, 15, 7, 0, 0, 2, 0, 2, 0, 0, 17, 0),
('steam:110000112182dfb', 'mp_m_freemode_01', 0, 0, -1, -1, 24, 5, 18, 0, 29, 5, 31, 0, 12, 0, 29, 2),
('steam:1100001168ab8e6', 'mp_m_freemode_01', 0, 0, 0, 0, 1, 15, 7, 0, 0, 2, 0, 2, 0, 0, 17, 0),
('steam:1100001155ede14', 'mp_m_freemode_01', 0, 0, -1, -1, 24, 5, 18, 0, 29, 5, 31, 0, 12, 0, 29, 2),
('ip:118.232.212.89', 'mp_m_freemode_01', 0, 0, -1, -1, 7, 4, 7, 1, 7, 5, 0, 7, 1, 0, 0, 0),
('steam:1100001198777e5', 'mp_m_freemode_01', 0, 0, 0, 0, 15, 0, 16, 5, 17, 4, 15, 0, 5, 0, 0, 0),
('steam:11000010a31dc87', 'mp_m_freemode_01', 7, 0, 11, 0, 27, 4, 1, 9, 22, 0, 15, 0, 0, 0, 0, 0),
('ip:81.65.142.28', 'mp_m_freemode_01', 0, 0, 18, 1, 6, 10, 16, 6, 44, 0, 15, 0, 0, 0, 0, 0),
('steam:1100001078d1bbc', 'mp_m_freemode_01', 0, 0, 16, 0, 15, 0, 16, 5, 17, 4, 15, 0, 5, 0, 0, 0),
('steam:110000103295924', 'mp_m_freemode_01', 0, 0, -1, -1, 24, 5, 18, 0, 29, 5, 31, 0, 12, 0, 29, 2),
('steam:110000118640510', 'mp_m_freemode_01', 0, 0, 0, 0, 1, 15, 7, 0, 0, 2, 0, 2, 0, 0, 17, 0),
('steam:11000010331d380', 'mp_m_freemode_01', 0, 0, 7, 0, 27, 5, 22, 10, 39, 0, 15, 0, 0, 0, 0, 0),
('steam:11000010e0f2d3e', 'mp_m_freemode_01', 0, 0, 3, 1, 1, 15, 7, 0, 0, 2, 0, 2, 0, 0, 17, 0),
('ip:78.229.128.169', 'mp_m_freemode_01', 0, 0, 22, 0, 26, 2, 23, 0, 38, 1, 15, 0, 8, 0, 0, 0),
('steam:110000106608063', 'mp_m_freemode_01', 0, 0, -1, -1, 24, 5, 18, 0, 29, 5, 31, 0, 12, 0, 29, 2);

-- --------------------------------------------------------

--
-- Structure de la table `phonebook`
--

CREATE TABLE `phonebook` (
  `id` int(11) NOT NULL,
  `pidentifier` varchar(255) CHARACTER SET utf8mb4 DEFAULT '',
  `phonenumber` varchar(255) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `phonebook`
--

INSERT INTO `phonebook` (`id`, `pidentifier`, `phonenumber`) VALUES
(5, 'steam:1100001092fb18d', '812-9010'),
(6, 'steam:110000106922d75', '812-9010'),
(7, 'steam:1100001092fb18d', '572-2960'),
(8, 'steam:110000117b910f8', '059-6701'),
(9, 'steam:11000010769d50a', '801-9711'),
(10, 'steam:110000109ea864c', '572-2960'),
(11, 'steam:11000010d576863', '981-5701'),
(12, 'steam:11000010d751e89', '368-6750');

-- --------------------------------------------------------

--
-- Structure de la table `police`
--

CREATE TABLE `police` (
  `police_id` int(11) NOT NULL,
  `police_name` varchar(40) NOT NULL,
  `salary` int(11) NOT NULL DEFAULT '500'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `police`
--

INSERT INTO `police` (`police_id`, `police_name`, `salary`) VALUES
(1, 'Cadet', 500),
(2, 'Brigadier', 750),
(3, 'Sergent', 1500),
(4, 'Lieutenant', 2500),
(5, 'Capitaine', 4000),
(6, 'Commandant', 5000),
(7, 'Colonel', 7500),
(8, 'Rien', 0);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `group` varchar(50) NOT NULL DEFAULT '0',
  `permission_level` int(11) NOT NULL DEFAULT '0',
  `money` double NOT NULL DEFAULT '0',
  `bankbalance` int(32) DEFAULT '0',
  `job` int(11) DEFAULT '1',
  `police` int(11) DEFAULT '0',
  `enService` int(11) DEFAULT '0',
  `dirtymoney` double(11,0) NOT NULL DEFAULT '0',
  `isFirstConnection` int(11) DEFAULT '1',
  `prenom` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `nom` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `telephone` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`ID`, `identifier`, `group`, `permission_level`, `money`, `bankbalance`, `job`, `police`, `enService`, `dirtymoney`, `isFirstConnection`, `prenom`, `nom`, `telephone`) VALUES
(7, 'steam:110000106922d75', 'user', 0, 10601, 2000, 2, 7, 0, 0, 1, 'Bryan', 'Hamilton', '572-2960'),
(9, 'steam:1100001092fb18d', 'user', 4, 0, 0, 10, 4, 0, 0, 1, 'Romuald', 'VanRock', '812-9010'),
(10, 'steam:11000010d751e89', 'user', 0, 0, 228000, 4, 0, 0, 0, 1, 'Pellono', 'Jean', '981-5701'),
(17, 'steam:11000010a0aff97', 'user', 0, 2000, 0, 1, 0, 0, 0, 1, 'Karl', 'Reeves', '790-0100'),
(18, 'steam:110000117b910f8', 'user', 0, 0, 15975, 3, 0, 0, 0, 1, 'Lee', 'Tang', '801-9711'),
(19, 'steam:11000010d576863', 'user', 0, 0, 0, 4, 0, 0, 0, 1, 'Nostra', 'Clement', '368-6750'),
(20, 'steam:11000010769d50a', 'user', 0, 11161, 5000, 3, 0, 0, 0, 1, 'Peter', 'Colad', '059-6701'),
(23, 'steam:110000109ea864c', 'user', 0, 23454, 0, 3, 0, 0, 0, 1, 'Jeff', 'Gibson', '468-9010'),
(26, 'steam:1100001168ab8e6', 'user', 0, 2000, 0, 1, 0, 0, 0, 1, 'wick', 'john', '688-6110'),
(30, 'steam:1100001198777e5', 'user', 0, 2000, 0, 1, 0, 0, 0, 1, 'john', 'beurger', '577-7891'),
(31, 'steam:11000010a31dc87', 'user', 0, 2000, 0, 1, 0, 0, 0, 1, 'Rambaud', 'Jonh', '781-3010'),
(32, 'ip:81.65.142.28', 'user', 0, 2000, 0, 3, 0, 0, 0, 1, 'DaCruz', 'Alexis', '822-4156'),
(33, 'steam:1100001078d1bbc', 'user', 0, 2000, 0, 1, 0, 0, 0, 1, 'Todorovic', 'Branko', '187-0100'),
(35, 'steam:110000118640510', 'user', 0, 2000, 0, 1, 0, 0, 0, 1, 'Jordan', 'kopp', '015-0468'),
(37, 'steam:11000010331d380', 'user', 0, 0, 0, 1, 0, 0, 0, 1, 'Barbaro', 'Joe', '083-1330'),
(38, 'steam:11000010e0f2d3e', 'user', 0, 2000, 0, 1, 0, 0, 0, 1, 'KRIF', 'Vladimir', '320-0100'),
(40, 'ip:78.229.128.169', 'user', 0, 0, 0, 1, 0, 0, 0, 1, 'Bilou', 'Tom', '961-8219');

-- --------------------------------------------------------

--
-- Structure de la table `user_inventory`
--

CREATE TABLE `user_inventory` (
  `user_id` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `item_id` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user_inventory`
--

INSERT INTO `user_inventory` (`user_id`, `item_id`, `quantity`) VALUES
('ip:109.8.116.182', 4, 30),
('ip:118.232.212.89', 1, 0),
('ip:118.232.212.89', 2, 0),
('ip:118.232.212.89', 3, 0),
('ip:118.232.212.89', 4, 0),
('ip:118.232.212.89', 5, 0),
('ip:118.232.212.89', 6, 0),
('ip:118.232.212.89', 7, 0),
('ip:118.232.212.89', 8, 0),
('ip:118.232.212.89', 9, 0),
('ip:118.232.212.89', 10, 0),
('ip:118.232.212.89', 11, 0),
('ip:118.232.212.89', 12, 0),
('ip:118.232.212.89', 13, 0),
('ip:118.232.212.89', 14, 0),
('ip:118.232.212.89', 15, 0),
('ip:118.232.212.89', 16, 0),
('ip:118.232.212.89', 17, 0),
('ip:118.232.212.89', 18, 0),
('ip:118.232.212.89', 19, 0),
('ip:118.232.212.89', 20, 0),
('ip:118.232.212.89', 21, 0),
('ip:118.232.212.89', 22, 0),
('ip:118.232.212.89', 23, 0),
('ip:118.232.212.89', 24, 0),
('ip:118.232.212.89', 25, 0),
('ip:118.232.212.89', 26, 0),
('ip:118.232.212.89', 27, 0),
('ip:41.227.38.195', 1, 0),
('ip:41.227.38.195', 2, 0),
('ip:41.227.38.195', 3, 0),
('ip:41.227.38.195', 4, 0),
('ip:41.227.38.195', 5, 0),
('ip:41.227.38.195', 6, 0),
('ip:41.227.38.195', 7, 0),
('ip:41.227.38.195', 8, 0),
('ip:41.227.38.195', 9, 0),
('ip:41.227.38.195', 10, 0),
('ip:41.227.38.195', 11, 0),
('ip:41.227.38.195', 12, 0),
('ip:41.227.38.195', 13, 0),
('ip:41.227.38.195', 14, 0),
('ip:41.227.38.195', 15, 0),
('ip:41.227.38.195', 16, 0),
('ip:41.227.38.195', 17, 0),
('ip:41.227.38.195', 18, 0),
('ip:41.227.38.195', 19, 0),
('ip:41.227.38.195', 20, 0),
('ip:41.227.38.195', 21, 0),
('ip:41.227.38.195', 22, 0),
('ip:41.227.38.195', 23, 0),
('ip:41.227.38.195', 24, 0),
('ip:41.227.38.195', 25, 0),
('ip:41.227.38.195', 26, 0),
('ip:41.227.38.195', 27, 0),
('ip:78.229.128.169', 1, 0),
('ip:78.229.128.169', 2, 0),
('ip:78.229.128.169', 3, 0),
('ip:78.229.128.169', 4, 0),
('ip:78.229.128.169', 5, 0),
('ip:78.229.128.169', 6, 0),
('ip:78.229.128.169', 7, 0),
('ip:78.229.128.169', 8, 0),
('ip:78.229.128.169', 9, 0),
('ip:78.229.128.169', 10, 0),
('ip:78.229.128.169', 11, 0),
('ip:78.229.128.169', 12, 0),
('ip:78.229.128.169', 13, 0),
('ip:78.229.128.169', 14, 0),
('ip:78.229.128.169', 15, 0),
('ip:78.229.128.169', 16, 0),
('ip:78.229.128.169', 17, 0),
('ip:78.229.128.169', 18, 0),
('ip:78.229.128.169', 19, 0),
('ip:78.229.128.169', 20, 0),
('ip:78.229.128.169', 21, 0),
('ip:78.229.128.169', 22, 0),
('ip:78.229.128.169', 23, 0),
('ip:78.229.128.169', 24, 0),
('ip:78.229.128.169', 25, 0),
('ip:78.229.128.169', 26, 0),
('ip:78.229.128.169', 27, 0),
('ip:81.65.142.28', 1, 0),
('ip:81.65.142.28', 2, 0),
('ip:81.65.142.28', 3, 0),
('ip:81.65.142.28', 4, 0),
('ip:81.65.142.28', 5, 0),
('ip:81.65.142.28', 6, 0),
('ip:81.65.142.28', 7, 0),
('ip:81.65.142.28', 8, 0),
('ip:81.65.142.28', 9, 0),
('ip:81.65.142.28', 10, 0),
('ip:81.65.142.28', 11, 0),
('ip:81.65.142.28', 12, 0),
('ip:81.65.142.28', 13, 0),
('ip:81.65.142.28', 14, 0),
('ip:81.65.142.28', 15, 0),
('ip:81.65.142.28', 16, 0),
('ip:81.65.142.28', 17, 0),
('ip:81.65.142.28', 18, 0),
('ip:81.65.142.28', 19, 0),
('ip:81.65.142.28', 20, 0),
('ip:81.65.142.28', 21, 0),
('ip:81.65.142.28', 22, 0),
('ip:81.65.142.28', 23, 0),
('ip:81.65.142.28', 24, 0),
('ip:81.65.142.28', 25, 0),
('ip:81.65.142.28', 26, 0),
('ip:81.65.142.28', 27, 0),
('steam:110000103295924', 1, 0),
('steam:110000103295924', 2, 0),
('steam:110000103295924', 3, 0),
('steam:110000103295924', 4, 0),
('steam:110000103295924', 5, 0),
('steam:110000103295924', 6, 0),
('steam:110000103295924', 7, 0),
('steam:110000103295924', 8, 0),
('steam:110000103295924', 9, 0),
('steam:110000103295924', 10, 0),
('steam:110000103295924', 11, 0),
('steam:110000103295924', 12, 0),
('steam:110000103295924', 13, 0),
('steam:110000103295924', 14, 0),
('steam:110000103295924', 15, 0),
('steam:110000103295924', 16, 0),
('steam:110000103295924', 17, 0),
('steam:110000103295924', 18, 0),
('steam:110000103295924', 19, 0),
('steam:110000103295924', 20, 0),
('steam:110000103295924', 21, 0),
('steam:110000103295924', 22, 0),
('steam:110000103295924', 23, 0),
('steam:110000103295924', 24, 0),
('steam:110000103295924', 25, 0),
('steam:110000103295924', 26, 0),
('steam:110000103295924', 27, 0),
('steam:11000010331d380', 1, 0),
('steam:11000010331d380', 2, 0),
('steam:11000010331d380', 3, 0),
('steam:11000010331d380', 4, 0),
('steam:11000010331d380', 5, 0),
('steam:11000010331d380', 6, 0),
('steam:11000010331d380', 7, 0),
('steam:11000010331d380', 8, 0),
('steam:11000010331d380', 9, 0),
('steam:11000010331d380', 10, 0),
('steam:11000010331d380', 11, 0),
('steam:11000010331d380', 12, 0),
('steam:11000010331d380', 13, 0),
('steam:11000010331d380', 14, 0),
('steam:11000010331d380', 15, 0),
('steam:11000010331d380', 16, 0),
('steam:11000010331d380', 17, 0),
('steam:11000010331d380', 18, 0),
('steam:11000010331d380', 19, 0),
('steam:11000010331d380', 20, 0),
('steam:11000010331d380', 21, 0),
('steam:11000010331d380', 22, 0),
('steam:11000010331d380', 23, 0),
('steam:11000010331d380', 24, 0),
('steam:11000010331d380', 25, 0),
('steam:11000010331d380', 26, 0),
('steam:11000010331d380', 27, 0),
('steam:110000106608063', 1, 0),
('steam:110000106608063', 2, 0),
('steam:110000106608063', 3, 0),
('steam:110000106608063', 4, 0),
('steam:110000106608063', 5, 0),
('steam:110000106608063', 6, 0),
('steam:110000106608063', 7, 0),
('steam:110000106608063', 8, 0),
('steam:110000106608063', 9, 0),
('steam:110000106608063', 10, 0),
('steam:110000106608063', 11, 0),
('steam:110000106608063', 12, 0),
('steam:110000106608063', 13, 0),
('steam:110000106608063', 14, 0),
('steam:110000106608063', 15, 0),
('steam:110000106608063', 16, 0),
('steam:110000106608063', 17, 0),
('steam:110000106608063', 18, 0),
('steam:110000106608063', 19, 0),
('steam:110000106608063', 20, 0),
('steam:110000106608063', 21, 0),
('steam:110000106608063', 22, 0),
('steam:110000106608063', 23, 0),
('steam:110000106608063', 24, 0),
('steam:110000106608063', 25, 0),
('steam:110000106608063', 26, 0),
('steam:110000106608063', 27, 0),
('steam:110000106922d75', 1, 2),
('steam:110000106922d75', 2, 12),
('steam:110000106922d75', 3, 7),
('steam:110000106922d75', 4, 0),
('steam:110000106922d75', 5, 30),
('steam:11000010769d50a', 4, 23),
('steam:11000010769d50a', 5, 7),
('steam:11000010769d50a', 17, 9),
('steam:11000010769d50a', 18, 7),
('steam:11000010769d50a', 19, 1),
('steam:11000010769d50a', 20, 0),
('steam:11000010769d50a', 21, 0),
('steam:11000010769d50a', 22, 0),
('steam:11000010769d50a', 23, 13),
('steam:11000010769d50a', 24, 0),
('steam:1100001078d1bbc', 1, 0),
('steam:1100001078d1bbc', 2, 0),
('steam:1100001078d1bbc', 3, 0),
('steam:1100001078d1bbc', 4, 0),
('steam:1100001078d1bbc', 5, 0),
('steam:1100001078d1bbc', 6, 0),
('steam:1100001078d1bbc', 7, 0),
('steam:1100001078d1bbc', 8, 0),
('steam:1100001078d1bbc', 9, 0),
('steam:1100001078d1bbc', 10, 0),
('steam:1100001078d1bbc', 11, 0),
('steam:1100001078d1bbc', 12, 0),
('steam:1100001078d1bbc', 13, 0),
('steam:1100001078d1bbc', 14, 0),
('steam:1100001078d1bbc', 15, 0),
('steam:1100001078d1bbc', 16, 0),
('steam:1100001078d1bbc', 17, 0),
('steam:1100001078d1bbc', 18, 0),
('steam:1100001078d1bbc', 19, 0),
('steam:1100001078d1bbc', 20, 0),
('steam:1100001078d1bbc', 21, 0),
('steam:1100001078d1bbc', 22, 0),
('steam:1100001078d1bbc', 23, 0),
('steam:1100001078d1bbc', 24, 0),
('steam:1100001078d1bbc', 25, 0),
('steam:1100001078d1bbc', 26, 0),
('steam:1100001078d1bbc', 27, 0),
('steam:110000107f32a77', 1, 0),
('steam:110000107f32a77', 2, 0),
('steam:110000107f32a77', 3, 0),
('steam:110000107f32a77', 4, 0),
('steam:110000107f32a77', 5, 0),
('steam:110000107f32a77', 6, 0),
('steam:110000107f32a77', 7, 0),
('steam:110000107f32a77', 8, 0),
('steam:110000107f32a77', 9, 0),
('steam:110000107f32a77', 10, 0),
('steam:110000107f32a77', 11, 0),
('steam:110000107f32a77', 12, 0),
('steam:110000107f32a77', 13, 0),
('steam:110000107f32a77', 14, 0),
('steam:110000107f32a77', 15, 0),
('steam:110000107f32a77', 16, 0),
('steam:110000107f32a77', 17, 0),
('steam:110000107f32a77', 18, 0),
('steam:110000107f32a77', 19, 0),
('steam:110000107f32a77', 20, 0),
('steam:110000107f32a77', 21, 0),
('steam:110000107f32a77', 22, 0),
('steam:110000107f32a77', 23, 0),
('steam:110000107f32a77', 24, 0),
('steam:110000107f32a77', 25, 0),
('steam:110000107f32a77', 26, 0),
('steam:110000107f32a77', 27, 0),
('steam:1100001092fb18d', 1, 0),
('steam:1100001092fb18d', 2, 10),
('steam:1100001092fb18d', 3, 1),
('steam:1100001092fb18d', 4, 0),
('steam:1100001092fb18d', 5, 30),
('steam:110000109ea864c', 1, 0),
('steam:110000109ea864c', 2, 0),
('steam:110000109ea864c', 3, 0),
('steam:110000109ea864c', 4, 0),
('steam:110000109ea864c', 5, 0),
('steam:110000109ea864c', 6, 0),
('steam:110000109ea864c', 7, 0),
('steam:110000109ea864c', 8, 0),
('steam:110000109ea864c', 9, 0),
('steam:110000109ea864c', 10, 0),
('steam:110000109ea864c', 11, 0),
('steam:110000109ea864c', 12, 0),
('steam:110000109ea864c', 13, 0),
('steam:110000109ea864c', 14, 0),
('steam:110000109ea864c', 15, 0),
('steam:110000109ea864c', 16, 0),
('steam:110000109ea864c', 17, 0),
('steam:110000109ea864c', 18, 0),
('steam:110000109ea864c', 19, 0),
('steam:110000109ea864c', 20, 0),
('steam:110000109ea864c', 21, 0),
('steam:110000109ea864c', 22, 0),
('steam:110000109ea864c', 23, 0),
('steam:110000109ea864c', 24, 0),
('steam:110000109ea864c', 25, 0),
('steam:110000109ea864c', 26, 0),
('steam:110000109ea864c', 27, 0),
('steam:11000010a31dc87', 1, 0),
('steam:11000010a31dc87', 2, 0),
('steam:11000010a31dc87', 3, 0),
('steam:11000010a31dc87', 4, 0),
('steam:11000010a31dc87', 5, 0),
('steam:11000010a31dc87', 6, 0),
('steam:11000010a31dc87', 7, 0),
('steam:11000010a31dc87', 8, 0),
('steam:11000010a31dc87', 9, 0),
('steam:11000010a31dc87', 10, 0),
('steam:11000010a31dc87', 11, 0),
('steam:11000010a31dc87', 12, 0),
('steam:11000010a31dc87', 13, 0),
('steam:11000010a31dc87', 14, 0),
('steam:11000010a31dc87', 15, 0),
('steam:11000010a31dc87', 16, 0),
('steam:11000010a31dc87', 17, 0),
('steam:11000010a31dc87', 18, 0),
('steam:11000010a31dc87', 19, 0),
('steam:11000010a31dc87', 20, 0),
('steam:11000010a31dc87', 21, 0),
('steam:11000010a31dc87', 22, 0),
('steam:11000010a31dc87', 23, 0),
('steam:11000010a31dc87', 24, 0),
('steam:11000010a31dc87', 25, 0),
('steam:11000010a31dc87', 26, 0),
('steam:11000010a31dc87', 27, 0),
('steam:11000010b36faad', 1, 0),
('steam:11000010b36faad', 2, 0),
('steam:11000010b36faad', 3, 0),
('steam:11000010b36faad', 4, 0),
('steam:11000010b36faad', 5, 0),
('steam:11000010b36faad', 6, 0),
('steam:11000010b36faad', 7, 0),
('steam:11000010b36faad', 8, 0),
('steam:11000010b36faad', 9, 0),
('steam:11000010b36faad', 10, 0),
('steam:11000010b36faad', 11, 0),
('steam:11000010b36faad', 12, 0),
('steam:11000010b36faad', 13, 0),
('steam:11000010b36faad', 14, 0),
('steam:11000010b36faad', 15, 0),
('steam:11000010b36faad', 16, 0),
('steam:11000010b36faad', 17, 0),
('steam:11000010b36faad', 18, 0),
('steam:11000010b36faad', 19, 0),
('steam:11000010b36faad', 20, 0),
('steam:11000010b36faad', 21, 0),
('steam:11000010b36faad', 22, 0),
('steam:11000010b36faad', 23, 0),
('steam:11000010b36faad', 24, 0),
('steam:11000010b36faad', 25, 0),
('steam:11000010b36faad', 26, 0),
('steam:11000010b36faad', 27, 0),
('steam:11000010d576863', 17, 0),
('steam:11000010d576863', 18, 0),
('steam:11000010d576863', 19, 0),
('steam:11000010d576863', 20, 8),
('steam:11000010d576863', 21, 8),
('steam:11000010d576863', 22, 2),
('steam:11000010d576863', 23, 0),
('steam:11000010d576863', 24, 12),
('steam:11000010d751e89', 1, 20),
('steam:11000010d751e89', 2, 8),
('steam:11000010d751e89', 3, 10),
('steam:11000010d751e89', 4, 19),
('steam:11000010d751e89', 5, 11),
('steam:11000010d751e89', 17, 0),
('steam:11000010d751e89', 18, 0),
('steam:11000010d751e89', 19, 0),
('steam:11000010d751e89', 20, 0),
('steam:11000010d751e89', 21, 0),
('steam:11000010d751e89', 22, 0),
('steam:11000010d751e89', 23, 0),
('steam:11000010d751e89', 24, 0),
('steam:11000010e0f2d3e', 1, 0),
('steam:11000010e0f2d3e', 2, 0),
('steam:11000010e0f2d3e', 3, 0),
('steam:11000010e0f2d3e', 4, 0),
('steam:11000010e0f2d3e', 5, 0),
('steam:11000010e0f2d3e', 6, 0),
('steam:11000010e0f2d3e', 7, 0),
('steam:11000010e0f2d3e', 8, 0),
('steam:11000010e0f2d3e', 9, 0),
('steam:11000010e0f2d3e', 10, 0),
('steam:11000010e0f2d3e', 11, 0),
('steam:11000010e0f2d3e', 12, 0),
('steam:11000010e0f2d3e', 13, 0),
('steam:11000010e0f2d3e', 14, 0),
('steam:11000010e0f2d3e', 15, 0),
('steam:11000010e0f2d3e', 16, 0),
('steam:11000010e0f2d3e', 17, 0),
('steam:11000010e0f2d3e', 18, 0),
('steam:11000010e0f2d3e', 19, 0),
('steam:11000010e0f2d3e', 20, 0),
('steam:11000010e0f2d3e', 21, 0),
('steam:11000010e0f2d3e', 22, 0),
('steam:11000010e0f2d3e', 23, 0),
('steam:11000010e0f2d3e', 24, 0),
('steam:11000010e0f2d3e', 25, 0),
('steam:11000010e0f2d3e', 26, 0),
('steam:11000010e0f2d3e', 27, 0),
('steam:110000112182dfb', 1, 0),
('steam:110000112182dfb', 2, 0),
('steam:110000112182dfb', 3, 0),
('steam:110000112182dfb', 4, 0),
('steam:110000112182dfb', 5, 0),
('steam:110000112182dfb', 6, 0),
('steam:110000112182dfb', 7, 0),
('steam:110000112182dfb', 8, 0),
('steam:110000112182dfb', 9, 0),
('steam:110000112182dfb', 10, 0),
('steam:110000112182dfb', 11, 0),
('steam:110000112182dfb', 12, 0),
('steam:110000112182dfb', 13, 0),
('steam:110000112182dfb', 14, 0),
('steam:110000112182dfb', 15, 0),
('steam:110000112182dfb', 16, 0),
('steam:110000112182dfb', 17, 0),
('steam:110000112182dfb', 18, 0),
('steam:110000112182dfb', 19, 0),
('steam:110000112182dfb', 20, 0),
('steam:110000112182dfb', 21, 0),
('steam:110000112182dfb', 22, 0),
('steam:110000112182dfb', 23, 0),
('steam:110000112182dfb', 24, 0),
('steam:110000112182dfb', 25, 0),
('steam:110000112182dfb', 26, 0),
('steam:110000112182dfb', 27, 0),
('steam:1100001155ede14', 1, 0),
('steam:1100001155ede14', 2, 0),
('steam:1100001155ede14', 3, 0),
('steam:1100001155ede14', 4, 0),
('steam:1100001155ede14', 5, 0),
('steam:1100001155ede14', 6, 0),
('steam:1100001155ede14', 7, 0),
('steam:1100001155ede14', 8, 0),
('steam:1100001155ede14', 9, 0),
('steam:1100001155ede14', 10, 0),
('steam:1100001155ede14', 11, 0),
('steam:1100001155ede14', 12, 0),
('steam:1100001155ede14', 13, 0),
('steam:1100001155ede14', 14, 0),
('steam:1100001155ede14', 15, 0),
('steam:1100001155ede14', 16, 0),
('steam:1100001155ede14', 17, 0),
('steam:1100001155ede14', 18, 0),
('steam:1100001155ede14', 19, 0),
('steam:1100001155ede14', 20, 0),
('steam:1100001155ede14', 21, 0),
('steam:1100001155ede14', 22, 0),
('steam:1100001155ede14', 23, 0),
('steam:1100001155ede14', 24, 0),
('steam:1100001155ede14', 25, 0),
('steam:1100001155ede14', 26, 0),
('steam:1100001155ede14', 27, 0),
('steam:1100001168ab8e6', 1, 0),
('steam:1100001168ab8e6', 2, 0),
('steam:1100001168ab8e6', 3, 0),
('steam:1100001168ab8e6', 4, 0),
('steam:1100001168ab8e6', 5, 0),
('steam:1100001168ab8e6', 6, 0),
('steam:1100001168ab8e6', 7, 0),
('steam:1100001168ab8e6', 8, 0),
('steam:1100001168ab8e6', 9, 0),
('steam:1100001168ab8e6', 10, 0),
('steam:1100001168ab8e6', 11, 0),
('steam:1100001168ab8e6', 12, 0),
('steam:1100001168ab8e6', 13, 0),
('steam:1100001168ab8e6', 14, 0),
('steam:1100001168ab8e6', 15, 0),
('steam:1100001168ab8e6', 16, 0),
('steam:1100001168ab8e6', 17, 0),
('steam:1100001168ab8e6', 18, 0),
('steam:1100001168ab8e6', 19, 0),
('steam:1100001168ab8e6', 20, 0),
('steam:1100001168ab8e6', 21, 0),
('steam:1100001168ab8e6', 22, 0),
('steam:1100001168ab8e6', 23, 0),
('steam:1100001168ab8e6', 24, 0),
('steam:1100001168ab8e6', 25, 0),
('steam:1100001168ab8e6', 26, 0),
('steam:1100001168ab8e6', 27, 0),
('steam:110000117b910f8', 17, 0),
('steam:110000117b910f8', 18, 0),
('steam:110000117b910f8', 19, 0),
('steam:110000117b910f8', 20, 0),
('steam:110000117b910f8', 21, 0),
('steam:110000117b910f8', 22, 0),
('steam:110000117b910f8', 23, 0),
('steam:110000117b910f8', 24, 0),
('steam:110000118640510', 1, 0),
('steam:110000118640510', 2, 0),
('steam:110000118640510', 3, 0),
('steam:110000118640510', 4, 0),
('steam:110000118640510', 5, 0),
('steam:110000118640510', 6, 0),
('steam:110000118640510', 7, 0),
('steam:110000118640510', 8, 0),
('steam:110000118640510', 9, 0),
('steam:110000118640510', 10, 0),
('steam:110000118640510', 11, 0),
('steam:110000118640510', 12, 0),
('steam:110000118640510', 13, 0),
('steam:110000118640510', 14, 0),
('steam:110000118640510', 15, 0),
('steam:110000118640510', 16, 0),
('steam:110000118640510', 17, 0),
('steam:110000118640510', 18, 0),
('steam:110000118640510', 19, 0),
('steam:110000118640510', 20, 0),
('steam:110000118640510', 21, 0),
('steam:110000118640510', 22, 0),
('steam:110000118640510', 23, 0),
('steam:110000118640510', 24, 0),
('steam:110000118640510', 25, 0),
('steam:110000118640510', 26, 0),
('steam:110000118640510', 27, 0),
('steam:1100001198777e5', 1, 0),
('steam:1100001198777e5', 2, 0),
('steam:1100001198777e5', 3, 0),
('steam:1100001198777e5', 4, 0),
('steam:1100001198777e5', 5, 0),
('steam:1100001198777e5', 6, 0),
('steam:1100001198777e5', 7, 0),
('steam:1100001198777e5', 8, 0),
('steam:1100001198777e5', 9, 0),
('steam:1100001198777e5', 10, 0),
('steam:1100001198777e5', 11, 0),
('steam:1100001198777e5', 12, 0),
('steam:1100001198777e5', 13, 0),
('steam:1100001198777e5', 14, 0),
('steam:1100001198777e5', 15, 0),
('steam:1100001198777e5', 16, 0),
('steam:1100001198777e5', 17, 0),
('steam:1100001198777e5', 18, 0),
('steam:1100001198777e5', 19, 0),
('steam:1100001198777e5', 20, 0),
('steam:1100001198777e5', 21, 0),
('steam:1100001198777e5', 22, 0),
('steam:1100001198777e5', 23, 0),
('steam:1100001198777e5', 24, 0),
('steam:1100001198777e5', 25, 0),
('steam:1100001198777e5', 26, 0),
('steam:1100001198777e5', 27, 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_vehicle`
--

CREATE TABLE `user_vehicle` (
  `ID` int(10) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `vehicle_name` varchar(60) DEFAULT NULL,
  `vehicle_model` varchar(60) DEFAULT NULL,
  `vehicle_price` int(60) DEFAULT NULL,
  `vehicle_plate` varchar(60) DEFAULT NULL,
  `vehicle_state` varchar(60) DEFAULT NULL,
  `vehicle_colorprimary` varchar(60) DEFAULT NULL,
  `vehicle_colorsecondary` varchar(60) DEFAULT NULL,
  `vehicle_pearlescentcolor` varchar(60) NOT NULL,
  `vehicle_wheelcolor` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user_vehicle`
--

INSERT INTO `user_vehicle` (`ID`, `identifier`, `vehicle_name`, `vehicle_model`, `vehicle_price`, `vehicle_plate`, `vehicle_state`, `vehicle_colorprimary`, `vehicle_colorsecondary`, `vehicle_pearlescentcolor`, `vehicle_wheelcolor`) VALUES
(7, 'steam:110000106922d75', 'Faggio', 'faggio2', 4000, 'CTZN2D75', 'Rentré', '4', '0', '111', '156'),
(8, 'steam:11000010d576863', 'Faggio', 'faggio2', 4000, 'CTZN6863', 'Rentré', '4', '0', '111', '156'),
(10, 'steam:1100001092fb18d', 'Faggio', 'faggio2', 4000, 'CTZNB18D', 'Rentré', '4', '0', '111', '156'),
(11, 'steam:11000010d751e89', 'Faggio', 'faggio2', 4000, 'CTZN1E89', 'Rentré', '4', '0', '111', '156'),
(12, 'ip:109.8.116.182', 'Faggio', 'faggio2', 4000, 'CTZN.182', 'Rentré', '4', '0', '111', '156'),
(13, 'ip:81.242.110.144', 'Faggio', 'faggio2', 4000, 'CTZN.144', 'Rentré', '4', '0', '111', '156'),
(14, 'ip:213.214.32.33', 'Faggio', 'faggio2', 4000, 'CTZN2.33', 'Rentré', '4', '0', '111', '156'),
(15, 'steam:11000010a0aff97', 'Faggio', 'faggio2', 4000, 'CTZNFF97', 'Rentré', '4', '0', '111', '156'),
(23, 'steam:110000117b910f8', 'Faggio', 'faggio2', 4000, 'CTZN10F8', 'Rentré', '4', '0', '111', '156'),
(24, 'steam:110000107f32a77', 'Faggio', 'faggio2', 4000, 'CTZN2A77', 'Rentré', '4', '0', '111', '156'),
(25, 'ip:41.227.38.195', 'Faggio', 'faggio2', 4000, 'CTZN.195', 'Rentré', '4', '0', '111', '156'),
(26, 'steam:110000109ea864c', 'Faggio', 'faggio2', 4000, 'CTZN864C', 'Rentré', '4', '0', '111', '156'),
(27, 'steam:11000010b36faad', 'Faggio', 'faggio2', 4000, 'CTZNFAAD', 'Rentré', '4', '0', '111', '156'),
(28, 'steam:110000112182dfb', 'Faggio', 'faggio2', 4000, 'CTZN2DFB', 'Rentré', '4', '0', '111', '156'),
(29, 'steam:11000010d751e89', 'Feltzer', 'feltzer2', 130000, 'CTZN1E89', 'Rentré', '0', '0', '0', '156'),
(30, 'steam:1100001168ab8e6', 'Faggio', 'faggio2', 4000, 'CTZNB8E6', 'Rentré', '4', '0', '111', '156'),
(31, 'steam:1100001155ede14', 'Faggio', 'faggio2', 4000, 'CTZNDE14', 'Rentré', '4', '0', '111', '156'),
(32, 'ip:118.232.212.89', 'Faggio', 'faggio2', 4000, 'CTZN2.89', 'Rentré', '4', '0', '111', '156'),
(33, 'steam:1100001198777e5', 'Faggio', 'faggio2', 4000, 'CTZN77E5', 'Rentré', '4', '0', '111', '156'),
(34, 'steam:11000010a31dc87', 'Faggio', 'faggio2', 4000, 'CTZNDC87', 'Rentré', '4', '0', '111', '156'),
(35, 'ip:81.65.142.28', 'Faggio', 'faggio2', 4000, 'CTZN2.28', 'Rentré', '4', '0', '111', '156'),
(36, 'steam:1100001078d1bbc', 'Faggio', 'faggio2', 4000, 'CTZN1BBC', 'Rentré', '4', '0', '111', '156'),
(37, 'steam:110000103295924', 'Faggio', 'faggio2', 4000, 'CTZN5924', 'Rentré', '4', '0', '111', '156'),
(38, 'steam:110000118640510', 'Faggio', 'faggio2', 4000, 'CTZN0510', 'Rentré', '4', '0', '111', '156'),
(39, 'steam:11000010331d380', 'Faggio', 'faggio2', 4000, 'CTZND380', 'Rentré', '4', '0', '111', '156'),
(40, 'steam:11000010e0f2d3e', 'Faggio', 'faggio2', 4000, 'CTZN2D3E', 'Rentré', '4', '0', '111', '156'),
(41, 'ip:78.229.128.169', 'Faggio', 'faggio2', 4000, 'CTZN.169', 'Rentré', '4', '0', '111', '156'),
(42, 'steam:110000106608063', 'Faggio', 'faggio2', 4000, 'CTZN8063', 'Rentré', '4', '0', '111', '156'),
(43, 'steam:11000010d751e89', 'Bati 801RR', 'bati2', 15000, 'CTZN1E89', 'Rentré', '0', '0', '0', '156');

-- --------------------------------------------------------

--
-- Structure de la table `user_weapons`
--

CREATE TABLE `user_weapons` (
  `ID` int(10) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `weapon_model` varchar(60) NOT NULL,
  `withdraw_cost` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user_weapons`
--

INSERT INTO `user_weapons` (`ID`, `identifier`, `weapon_model`, `withdraw_cost`) VALUES
(1, 'steam:110000117b910f8', 'WEAPON_CombatPistol', 300);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `coordinates`
--
ALTER TABLE `coordinates`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`);

--
-- Index pour la table `phonebook`
--
ALTER TABLE `phonebook`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `police`
--
ALTER TABLE `police`
  ADD PRIMARY KEY (`police_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD PRIMARY KEY (`user_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Index pour la table `user_vehicle`
--
ALTER TABLE `user_vehicle`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `user_weapons`
--
ALTER TABLE `user_weapons`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `phonebook`
--
ALTER TABLE `phonebook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `police`
--
ALTER TABLE `police`
  MODIFY `police_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT pour la table `user_vehicle`
--
ALTER TABLE `user_vehicle`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT pour la table `user_weapons`
--
ALTER TABLE `user_weapons`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD CONSTRAINT `user_inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
