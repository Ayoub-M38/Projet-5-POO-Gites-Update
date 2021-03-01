-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 03 déc. 2020 à 15:01
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `phpmvc`
--

-- --------------------------------------------------------

--
-- Structure de la table `ampoules`
--

DROP TABLE IF EXISTS `ampoules`;
CREATE TABLE IF NOT EXISTS `ampoules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_changement` datetime NOT NULL,
  `etage` int(11) NOT NULL,
  `position_ampoule` varchar(250) NOT NULL,
  `prix` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ampoules`
--

INSERT INTO `ampoules` (`id`, `date_changement`, `etage`, `position_ampoule`, `prix`) VALUES
(1, '2020-11-27 10:25:54', 6, 'Côté Gauche', 250.5),
(2, '2020-11-18 10:25:54', 0, 'FOND', 650.5),
(3, '2020-11-05 00:00:00', 3, '125.25', 125.25),
(21, '2020-11-06 00:00:00', 3, '123456', 123456),
(22, '2020-11-07 00:00:00', 4, '123445566', 123446000),
(23, '2020-11-06 00:00:00', 4, '14', 14),
(24, '2020-11-06 00:00:00', 3, '7845', 7845),
(25, '2020-11-04 00:00:00', 4, '8956', 8956),
(26, '2020-11-05 00:00:00', 4, '87458', 87458),
(27, '2020-11-04 00:00:00', 11, '112233', 112233),
(28, '2020-10-28 00:00:00', 4, 'Côté Gauche', 154875000);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie` varchar(250) NOT NULL,
  `console` varchar(250) NOT NULL,
  `id_game_title` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_game_title` (`id_game_title`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `categorie`, `console`, `id_game_title`) VALUES
(1, 'plate-forme', 'Nintendo Nes', 1),
(2, 'Rpg', 'Megadrive', 2);

-- --------------------------------------------------------

--
-- Structure de la table `category_gite`
--

DROP TABLE IF EXISTS `category_gite`;
CREATE TABLE IF NOT EXISTS `category_gite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `category_gite`
--

INSERT INTO `category_gite` (`id`, `type`) VALUES
(1, 'Maison'),
(2, 'Chalet'),
(3, 'Chateau'),
(4, 'Tente'),
(5, 'Caravane'),
(6, 'Yourt'),
(7, 'Villa'),
(8, 'Igloo');

-- --------------------------------------------------------

--
-- Structure de la table `gites`
--

DROP TABLE IF EXISTS `gites`;
CREATE TABLE IF NOT EXISTS `gites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_gite` varchar(250) NOT NULL,
  `description_gite` text NOT NULL,
  `img_gite` varchar(250) NOT NULL,
  `nbr_chambre` int(11) NOT NULL,
  `nbr_sdb` int(11) NOT NULL,
  `zone_geo` varchar(250) NOT NULL,
  `prix` float NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  `date_arrivee` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_depart` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gite_category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gite_category` (`gite_category`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `gites`
--

INSERT INTO `gites` (`id`, `nom_gite`, `description_gite`, `img_gite`, `nbr_chambre`, `nbr_sdb`, `zone_geo`, `prix`, `disponible`, `date_arrivee`, `date_depart`, `gite_category`) VALUES
(1, 'Gite Cool', 'Emensis itaque difficultatibus multis et nive obrutis callibus plurimis ubi prope Rauracum ventum est ad supercilia fluminis Rheni, resistente multitudine Alamanna pontem suspendere navium conpage Romani vi nimia vetabantur ritu grandinis undique convolantibus telis, et cum id inpossibile videretur, imperator cogitationibus magnis attonitus, quid capesseret ambigebat.', 'assets/img/1.jpg', 1, 2, 'ISERE', 250.5, 0, '2020-11-09 10:27:30', '2020-12-01 10:27:30', 5),
(2, 'Gite de la fin', 'Gite de la finGite de la finGite de la finGite de la finGite de la finGite de la finGite de la fin\r\nGite de la finGite de la finGite de la finGite de la finGite de la finGite de la fin', 'assets/img/12.jpg', 2, 4, 'Washington DC', 4512.25, 1, '2020-12-31 10:21:32', '2021-01-23 00:00:00', 1),
(3, 'Autres Gites trés bien', 'To use AltoRouter, you will need to rewrite all requests to a single file in which you create an instance of the AltoRouter class.\r\n\r\nThere are various ways to go about this, but here are examples for Apache and Nginx.', 'assets/img/3.jpg', 3, 4, 'Ardeche', 650.5, 1, '2020-09-30 10:27:30', '2021-03-24 10:27:30', 3),
(4, 'Gite Number 4', 'Bonjour, quand je lance dans le terminal : composer require altorouter/altorouter. On me relance un message d\'erreur : composer : Le terme «composer» n\'est pas reconnu comme nom d\'applet de commande, fonction, fichier de script ou programme exécutable. Vérifiez l\'orthographe du nom, ou si un chemin d\'accès existe, vérifiez que le chemin d\'accès est correct et réessayez. Au caractère Ligne:1 : 1\r\n\r\ncomposer require altorouter/altorouter', 'assets/img/4.jpg', 4, 1, 'Isère', 450.25, 0, '2021-01-20 10:27:30', '2021-04-28 10:27:30', 5),
(5, 'Gite PACA', 'Un back-office (connecté à une base de données) permettant :\r\n\r\nDe visualiser l\'ensemble des gîtes et leur statut (occupé ou libre)\r\nD’ajouter des gîtes\r\nDe supprimer des gîtes\r\nDe les modifier\r\nCôté utilisateur on aura :\r\n\r\nUne page accueil avec :\r\nLa liste des gîtes disponibles\r\nUn formulaire de recherche (date de départ, date de fin, nombre de couchages\r\nUne fiche par gîte avec un formulaire de réservation\r\nLa réception d\'un mail lorsque la réservation est effectuée\r\nGestion des disponibilités :', 'assets/img/5.jpg', 5, 4, 'Provence Alpes Cote d\'Azur', 650.25, 1, '2021-03-10 10:55:47', '2021-08-31 10:55:47', 6),
(6, 'Gite du Soleil', 'Valeurs de retour ¶\r\nPDO::query() retourne un objet PDOStatement, ou FALSE si une erreur survient.\r\n\r\nExemples ¶\r\nExemple #1 Exemple avec PDO::query\r\n\r\nUne fonctionnalité intéressante de PDO::query() est qu\'il vous permet d\'itérer à travers un jeu de résultats retourné par une requête SELECT exécutée avec succès', 'assets/img/6.jpg', 6, 6, 'Auvergnes', 356.15, 0, '2021-05-13 10:55:47', '2021-11-24 10:55:47', 8),
(7, 'Gite de chicago', 'CHICAGO chicago CHICAGO chicagoCHICAGO chicagoCHICAGO chicagoCHICAGO chicagoCHICAGO chicagoCHICAGO chicagoCHICAGO chicago \r\nCHICAGO chicagoCHICAGO chicago\r\nCHICAGO chicagoCHICAGO chicagoCHICAGO chicago', 'assets/img/10.jpg', 6, 2, 'USA', 478458, 1, '2021-07-21 00:00:00', '2021-11-30 00:00:00', 7),
(8, 'Gite Moscou', 'Plus de texte Plus de textePlus de textePlus de textePlus de textePlus de textePlus de textePlus de textePlus de textePlus de textePlus de textePlus de textevPlus de textePlus de textePlus de textePlus de textePlus de texte', 'assets/img/12.jpg', 5, 2, 'RUSSIE', 4578.35, 1, '2021-05-12 00:00:00', '2022-02-18 00:00:00', 2);

-- --------------------------------------------------------

--
-- Structure de la table `mixedgames`
--

DROP TABLE IF EXISTS `mixedgames`;
CREATE TABLE IF NOT EXISTS `mixedgames` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `imgurl` varchar(250) NOT NULL,
  `price` varchar(250) NOT NULL,
  `stock` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mixedgames`
--

INSERT INTO `mixedgames` (`id`, `title`, `description`, `imgurl`, `price`, `stock`) VALUES
(1, 'Mario Bros 3', 'Super Mario Bros. 3 est un jeu vidéo de plates-formes développé et édité par Nintendo sur Nintendo Entertainment System. Il s\'agit du troisième volet de la série Super Mario et il est commercialisé en 1988 au Japon, en 1990 aux États-Unis et en 1991 en Europe.', 'https://www.gamecash.fr/thumbnail-600/super-mario-bros-3-eu-e107824.jpg', '250.25', 'OUI'),
(2, 'Megaman 2', 'Mega Man 2 est un jeu de plates-formes développé et édité par Capcom sur NES en 1988, puis porté sur Console virtuelle, et téléphone mobile. C\'est le deuxième jeu de la série principale de Mega Man.', 'https://www.gamecash.fr/thumbnail-400-450/mega-man-e15658.jpg', '451.25', 'NON');

-- --------------------------------------------------------

--
-- Structure de la table `nesgames`
--

DROP TABLE IF EXISTS `nesgames`;
CREATE TABLE IF NOT EXISTS `nesgames` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `imgurl` varchar(250) NOT NULL,
  `stock` varchar(250) NOT NULL,
  `email_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `nesgames`
--

INSERT INTO `nesgames` (`id`, `title`, `description`, `price`, `imgurl`, `stock`, `email_id`) VALUES
(1, 'Castlevania', 'Castlevania III: Dracula\'s Curse est un jeu vidéo d\'action et de plates-formes sorti en 1989 sur Nintendo Entertainment System. Développé et édité par Konami, distribué par Konami aux États-Unis et au Japon, Palcom en Europe. Le jeu a été conçu par H. Akamatsu.', 250.5, 'https://media.senscritique.com/media/000017785980/source_big/Castlevania_III_Dracula_s_Curse.jpg', 'OUI', 1),
(2, 'Gosth \'n Goblins', 'Borne d\'arcade, NES, Super Nintendo, Mega Drive, Saturn, PlayStation 2, PlayStation Portable, iOS · modifier - modifier le code -modifier Wikidata · Documentation du modèle. Ghosts \'n Goblins (Makaimura) est une série de jeux vidéo de plates-formes', 25.15, 'https://image.jeuxvideo.com/images-sm/ns/g/h/ghngns0f.jpg', 'NON', 2);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `img` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `pseudo`, `email`, `password`, `img`) VALUES
(1, 'micpiwo', 'micpiwo@hotmail.fr', 'test', 'public/img/Recalbox_Logo.jpg');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `categorie_ibfk_1` FOREIGN KEY (`id_game_title`) REFERENCES `mixedgames` (`id`);

--
-- Contraintes pour la table `gites`
--
ALTER TABLE `gites`
  ADD CONSTRAINT `gites_ibfk_1` FOREIGN KEY (`gite_category`) REFERENCES `category_gite` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
