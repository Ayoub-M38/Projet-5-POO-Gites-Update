-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 01 mars 2021 à 05:29
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
-- Structure de la table `gites`
--

DROP TABLE IF EXISTS `gites`;
CREATE TABLE IF NOT EXISTS `gites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_gite` varchar(250) NOT NULL,
  `description_gite` text NOT NULL,
  `img_gite` varchar(255) NOT NULL,
  `prix` float NOT NULL,
  `nbr_chambre` int(11) NOT NULL,
  `nbr_sdb` int(11) NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  `zone_geo` varchar(250) NOT NULL,
  `date_arrivee` datetime NOT NULL,
  `date_depart` datetime DEFAULT NULL,
  `gite_category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gite_category` (`gite_category`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `gites`
--

INSERT INTO `gites` (`id`, `nom_gite`, `description_gite`, `img_gite`, `prix`, `nbr_chambre`, `nbr_sdb`, `disponible`, `zone_geo`, `date_arrivee`, `date_depart`, `gite_category`) VALUES
(1, 'Gite de la Drome', 'Julien vous accueille au chalet l\'Aiglon à Saint-Gervais, dans l\'ambiance cosy et chaleureuse de ce vaste chalet rénové et décoré \'à la savoyarde\'.\r\nA votre disposition, 5 chambres (2 à 4 personnes), avec sanitaires privatifs pour chaque chambre (douche, lavabo, wc). Grande salle vitrée au rez-de-chaussée pour le petit-déjeuner. A votre disposition: cuisine équipée (four, m-ondes) vous permettant de cuisiner en libre accès. Salon commun accessible à tous les hôtes avec cheminée à l\'ancienne, Tv, bibliothèque. Internet wifi. ', 'assets/img/236603_440_791.jpg', 1253.25, 1, 1, 0, 'Drome', '2021-01-01 00:00:00', '2021-03-27 00:00:00', 1),
(2, 'Gite des Flandres', 'Face au massif du Mont-Blanc - Christine et Patrick vous ouvrent les portes de leur chalet de standing situé à 1200m d\'altitude, à 11km seulement de Chamonix.\r\nA votre disposition: trois chambres d\'hôtes avec sanitaires privatifs aménagées au rez-de-chaussée du chalet.\r\nChaque chambre est équipée d\'une télévision, d\'une connexion internet (wifi et câble ethernet), et de sa propre terrasse privative.\r\nSalle d\'eau privative pour chaque chambre avec douche à l\'italienne, produits d\'accueil, et wc séparé. Linge de toilette et peignoirs inclus.', 'assets/img/143651_440_791.jpg', 7458.35, 2, 4, 0, 'Flandres', '2021-02-26 00:00:00', '2021-05-28 00:00:00', 4),
(3, 'Gite du Vercors', 'A proximité de tous commerces et services, au cœur du village, Sabrina et Thierry vous accueillent dans leur Chalet de standing à l\'atmosphère familiale et chaleureuse. Prestations de très grande qualité pour ces 3 chambres spacieuses et confortables de 2 à 4 personnes, soigneusement aménagées dans un esprit montagne. Dans chaque chambre: salle de bains privative (douche et/ou baignoire), TV, internet wifi et balcon ou terrasse privatif.', 'assets/img/85602_440_791.jpg', 741.25, 5, 3, 0, 'Vercors', '2020-12-28 00:00:00', '2021-01-29 00:00:00', 3),
(4, 'Gite du Nord', 'Découvrez cette belle et spacieuse chambre d\'hôtes composée d\'un couloir d\'accès privatif avec bibliothèque, une chambre (1 lit 140x190cm) avec sa salle de bains, un espace détente (canapé convertible type BZ, télévision, balcon) avec également sa salle d\'eau, wc indépendant ; au total 38m² privatifs. Capacité maximale 3 personnes (2 adultes + 1 enfant) et 1 bébé.\r\nChambre d\'hôtes au 1er étage de la maison des propriétaires, entrée indépendante (accès par escalier extérieur). ', 'assets/img/280605_440_791.jpg', 1245.25, 4, 2, 0, 'Nord', '2021-01-04 00:00:00', '2021-01-31 00:00:00', 8);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `gites`
--
ALTER TABLE `gites`
  ADD CONSTRAINT `gites_ibfk_1` FOREIGN KEY (`gite_category`) REFERENCES `category_gites` (`id_category`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
