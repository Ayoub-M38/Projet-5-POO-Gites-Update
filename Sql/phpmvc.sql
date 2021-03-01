-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : Dim 28 fév. 2021 à 08:22
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
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `email_admin` varchar(255) NOT NULL,
  `password_admin` varchar(255) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id_admin`, `email_admin`, `password_admin`) VALUES
(1, 'admin@admin.com', 'administration');

-- --------------------------------------------------------

--
-- Structure de la table `category_gites`
--

DROP TABLE IF EXISTS `category_gites`;
CREATE TABLE IF NOT EXISTS `category_gites` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(250) NOT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `category_gites`
--

INSERT INTO `category_gites` (`id_category`, `type`) VALUES
(1, 'Maison'),
(2, 'Villa'),
(3, 'Appartement'),
(4, 'Chalet'),
(5, 'Camping'),
(6, 'Hotel'),
(7, 'Igloo'),
(8, 'Yourt');

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

-- --------------------------------------------------------

--
-- Structure de la table `mixedgames`
--

DROP TABLE IF EXISTS `mixedgames`;
CREATE TABLE IF NOT EXISTS `mixedgames` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `imgurl` varchar(250) NOT NULL,
  `stock` tinyint(1) NOT NULL,
  `date_depot` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mixedgames`
--

INSERT INTO `mixedgames` (`id`, `title`, `description`, `price`, `imgurl`, `stock`, `date_depot`) VALUES
(1, 'Aladin', 'Aladdin est un jeu vidéo de plates-formes développé et édité par Virgin Interactive en 1993 sur Mega Drive. Des versions Amiga 1200, DOS, Game Boy et NES ont également vu le jour. Le jeu a été réalisé d\'après le personnage du même nom de Walt Disney Pictures.', 458.35, 'https://images-na.ssl-images-amazon.com/images/I/61NvkintSkL._AC_.jpg', 1, '2020-12-05 08:59:43'),
(6, 'PC Kid', 'PC Kid, aussi appelé Bonk aux États-Unis, est une série de jeux vidéo de plates-formes initialement parue sur PC-Engine en 1989. Elle fut publiée par Hudson Soft et développée par Red Company avec la collaboration d\'Atlus. Le premier épisode a donné lieu à plusieurs déclinaisons sur différents systèmes.', 4785.25, 'https://images.fr.shopping.rakuten.com/photo/496523405_L.jpg', 0, '2020-12-05 08:59:43'),
(7, 'Kid Icarus', 'Kid Icarus est une franchise de jeux vidéo éditée par Nintendo. Les jeux se déroulent dans un monde fantastique, basé sur l\'antiquité et la mythologie grecque. Le gameplay est un mélange d\'action, d\'aventure et de plate-forme.\r\n\r\n ', 78.45, 'https://images-na.ssl-images-amazon.com/images/I/51N2JG9KGSL._AC_.jpg', 1, '2020-12-05 08:59:43'),
(8, 'grg', 'rg', 54, 'Array', 0, '2020-12-10 00:00:00'),
(9, 'Dr Mario', 'Dr. Mario est un jeu vidéo de puzzle développé et édité par Nintendo, sorti sur NES et Game Boy en 1990. Il a été conçu par Gunpei Yokoi et produit par Takahiro Harada ; la musique a été composée par Hirokazu Tanaka. Le jeu met en scène Mario mais ne reprend pas davantage l\'univers de la série éponyme.', 451.25, 'Array', 1, '2020-12-16 00:00:00'),
(10, 'hth', 'hthththththththt', 8745, 'Array', 0, '2020-12-01 00:00:00'),
(11, 'Dr mario', 'test', 250.25, 'Array', 1, '2020-12-16 00:00:00'),
(12, 'MArio 2', 'Super Mario Bros. 2 est un jeu vidéo de plates-formes développé et édité par la société japonaise Nintendo. Il sort sur Nintendo Entertainment System en 1988 en Amérique du Nord, en 1989 en Europe puis en 1992 au Japon. ', 451.25, '../assets/img/mario2.jpg', 1, '2020-11-30 00:00:00'),
(13, 'Metroid', 'Metroid est un jeu vidéo d\'action-aventure développé par Nintendo R&D1 et Intelligent Systems, et édité par Nintendo en 1986 sur Famicom Disk System, l\'extension de la Famicom. Il sort à partir de 1987 sur NES en Amérique du Nord, puis dans le reste du monde et en arcade cette même année.', 45125.4, '../assets/img/Metroid.jpg', 1, '2020-12-08 00:00:00'),
(14, 'god of war', ' $title = \"ANNONCES VALIDER ANNONCE\";\r\n        if(isset($_POST[\'title\'], $_POST[\'description\'], $_POST[\'price\'], $_POST[\'imgurl\'], $_POST[\'stock\'], $_POST[\'date_depot\'])){\r\n            addOneAnnonce($_POST[\'title\'], $_POST[\'description\'], $_POST[\'price\'], $_POST[\'imgurl\'], $_POST[\'stock\'], $_POST[\'date_depot\']);\r\n            //require \"sendCreationMail.php\";\r\n            header(\"location:http://localhost/Mailtrap/public/index.php?action=info_email\");\r\n        }', 7845, '../assets/img/god.jpg', 1, '2020-12-01 00:00:00'),
(15, 'Silent Hill 2', 'Silent Hill 2 est un jeu à part entière, que dis-je un chef d’œuvre à part entière, j’en profite pour vous inviter à lire mon humble critique pour comprendre pourquoi je le tiens en si haute estime. Là ce n’est pas du tout ce qui va nous intéresser. Je parle ici de cette version Director’s Cut, donc de ce... ', 52563, '../assets/img/silenthill.jpg', 1, '2020-12-01 00:00:00'),
(16, 'Zelda BOTW', 'The Legend of Zelda : Breath of the Wild est un jeu d\'action/aventure. Link se réveille d\'un sommeil de 100 ans dans un royaume d\'Hyrule dévasté. Il lui faudra percer les mystères du passé et vaincre Ganon, le fléau. L\'aventure prend place dans un gigantesque monde ouvert et accorde ainsi une part importante à l\'exploration. Le titre a été pensé pour que le joueur puisse aller où il veut dès le début, s\'éloignant de la linéarité habituelle de la série.', 784512, '../assets/img/zelda.jpg', 1, '2020-11-30 00:00:00'),
(17, 'Zelda the wind walker', 'Dans The Legend of Zelda : The Wind Waker, vous incarnez Link dans sa quête pour sauver sa sœur. Découvrez Hyrule sous les flots dans ce jeu d\'aventure en style cartoon, et naviguez au dos du Lion Rouge en vous orientant grâce à la Baguette du Vent pour explorer toutes les îles de ce vaste océan et dévoiler les secrets et les donjons qu\'elles renferment.', 78, '../assets/img/ww.webp', 1, '2020-12-01 00:00:00'),
(18, 'The last of us 2', 'Au centre de l\'intrigue du premier volet, nous retrouvons à nouveau Joel et Ellie plus déterminés que jamais à éradiquer les infectés jusqu\'au dernier. Se déroulant à nouveau dans un monde post apocalyptique, le duo toujours aussi soudé devra prendre les décisions qui s\'imposent afin de survivre un seul jour de plus à cette pandémie.', 784563, '../assets/img/last.jpg', 1, '2020-12-03 00:00:00'),
(19, 'Death Stranding', 'Death Stranding est un jeu d\'action dans lequel la mort fait partie intégrante du gameplay. La mort est un des thèmes principaux, et les développeurs ont fait en sorte que les joueurs ne la voient pas comme une fin. L\'histoire s\'annonce sombre dans cet univers futuriste et fantastique.', 120.65, '../assets/img/death.jpg', 1, '2020-12-29 00:00:00'),
(20, 'Red dead redemption', 'Suite du précédent volet multi récompensé, Red Dead Redemption II nous permet de nous replonger sur PS4 dans une ambiance western synonyme de vastes espaces sauvages et de villes malfamées. L\'histoire se déroule en 1899, avant le premier Red Dead Redemption, au moment où Arthur Morgan doit fuir avec sa bande à la suite d\'un braquage raté.', 15425, '../assets/img/red.webp', 1, '2020-12-01 00:00:00'),
(21, 'Red dead redemption', 'Suite du précédent volet multi récompensé, Red Dead Redemption II nous permet de nous replonger sur PS4 dans une ambiance western synonyme de vastes espaces sauvages et de villes malfamées. L\'histoire se déroule en 1899, avant le premier Red Dead Redemption, au moment où Arthur Morgan doit fuir avec sa bande à la suite d\'un braquage raté.', 15425, '../assets/img/red.webp', 1, '2020-12-01 00:00:00'),
(22, 'Okami', 'Okami est un jeu d\'aventure et d\'action sur PC. Le titre dispose d\'un aspect graphique très particulier, et vous propose d\'incarner la déesse Amaterasu réincarnée en un magnifique loup blanc, dans une quête pour redonner de la vie et de la couleur dans votre monde, terrorisé par de nombreux ennemis qui font régner les ténèbres. Battez-vous au moyen d\'un pinceau, véritable prolongement du personnage qu\'on incarne, et utilisez-le également pour avancer dans l\'histoire.', 741, '../assets/img/okami.jpg', 1, '2020-12-02 00:00:00'),
(23, 'Mario Odyssée', 'Super Mario Odyssey est un jeu de plate-forme sur Switch où la princesse Peach a été enlevée par Bowser. Pour la sauver, Mario quitte le royaume Champignon à bord de l\'Odyssey. Accompagné de Chappy, son chapeau vivant, il doit parcourir différents royaumes et faire tout pour vaincre, une nouvelle fois, le terrible Bowser.', 78, '../assets/img/marioo.jpg', 1, '2021-01-08 00:00:00'),
(24, 'Zero ', 'Zero Escape: The Nonary Games est un jeu d\'aventure jouable en solo. Enlevées puis amenées dans un lieu inconnu, neuf personnes se retrouvent forcées de participer à un jeu diabolique orchestré par l’énigmatique Zero. Pourquoi ? A qui faire confiance ?', 412, '../assets/img/o.png', 1, '2020-11-03 00:00:00'),
(25, 'Nier Automata', 'Nier Automata est un jeu d\'action de type RPG jouable en solo. Le titre amène le joueur dans un futur lointain où la Terre a été envahie par des formes extra-terrestres armées de \"bio-machines\". Après s\'être réfugiée sur la lune, l\'humanité envoie sur leur planète natale des androïdes capable de lutter avec les extra-terrestres et reconquérir la planète.', 5256, '../assets/img/nier.jpg', 1, '2020-12-01 00:00:00'),
(26, 'Dishonored II', 'Suite du primé Dishonored, un jeu à la première personne à la croisée des genres action et infiltration se déroulant dans un univers steampunk uchronique. Pouvoirs, assassinats, complots sont au programme.', 12, '../assets/img/dis.jpg', 1, '2020-12-11 00:00:00'),
(27, 'Forza Horizon 3', 'Jeu de course en monde ouvert, Forza Horizon 3 vous donne accès à des centaines de véhicules. Le joueur pourra arpenter à toute vitesse les paysages d\'Australie. De très nombreuses épreuves sont au programme et les pilotes du monde entier peuvent s\'affronter dans les mêmes conditions que dans le mode solo. Le jeu est en Xbox Play Anywhere, ce qui signifie qu\'une même clé est activable sur Windows 10 comme sur Xbox One.', 123456, '../assets/img/forza.jpg', 1, '2020-12-12 00:00:00'),
(28, 'Umineko no Naku Koro', 'Umineko no Naku Koro ni est un visual novel. Le joueur incarne le jeune Battler Ushiromiya qui assiste à une série de meurtres brutaux et incompréhensible. Son objectif sera alors de les résoudre pour savoir s\'ils ont été commis par un être humain ou une entité surnaturelle.', 784512, '../assets/img/japon.jpg', 1, '2020-11-30 00:00:00'),
(29, 'test', 'test', 78, '../assets/img/drmario.jpg', 1, '2020-12-01 00:00:00'),
(30, 'cette fois c bon', 'on y crois', 7845, '../assets/img/drmario.jpg', 0, '2020-12-01 00:00:00'),
(31, 'Good', 'kekjfkfkjzf', 74747, '../assets/img/marioo.jpg', 1, '2020-12-01 00:00:00'),
(32, 'fuck', 'fuck u php', 1236, '../assets/img/dis.jpg', 0, '2020-12-03 00:00:00'),
(33, 'test sans dynamisme', 'ici id = 6 de manière contrainte', 7788, '../assets/img/o.png', 1, '2020-11-30 00:00:00'),
(34, 'double test ', 'Soit le 1 soit le 2', 222, '../assets/img/forza.jpg', 1, '2020-11-30 00:00:00'),
(35, 'Stop la torture', 'FUCK FUCK FUCKFUCKFUCKFUCKFUCKFUCKFUCKFUCKFUCKFUCKFUCK', 7845, '../assets/img/japon.jpg', 0, '2020-12-03 00:00:00'),
(36, 'Go fuck yourself', 'c de la merde de passer des id dans un email', 9865, '../assets/img/japon.jpg', 1, '2020-12-02 00:00:00'),
(37, 'again', 'agagagaggagaaainnn', 1230, '../assets/img/drmario.jpg', 0, '2020-12-04 00:00:00'),
(38, 'Ultime test avant crakage', 'NONOnnnnnnnnnnnnNNNNNNNNNNNNNNNNNN', 1100, '../assets/img/nier.jpg', 0, '2020-12-11 00:00:00'),
(39, 'En mode brute', 'BRUTTTTTTE DE POMMMME', 963258, '../assets/img/japon.jpg', 0, '2020-12-01 00:00:00'),
(40, 'En mode brute', 'BRUTTTTTTE DE POMMMME', 963258, '../assets/img/japon.jpg', 0, '2020-12-01 00:00:00'),
(41, 'En mode brute', 'BRUTTTTTTE DE POMMMME', 963258, '../assets/img/japon.jpg', 0, '2020-12-01 00:00:00'),
(42, 'En mode brute', 'BRUTTTTTTE DE POMMMME', 963258, '../assets/img/japon.jpg', 0, '2020-12-01 00:00:00'),
(43, 'En mode brute', 'BRUTTTTTTE DE POMMMME', 963258, '../assets/img/japon.jpg', 0, '2020-12-01 00:00:00'),
(44, 'En mode brute', 'BRUTTTTTTE DE POMMMME', 963258, '../assets/img/japon.jpg', 0, '2020-12-01 00:00:00'),
(45, 'thh', 'trhrhr', 54, '../assets/img/drmario.jpg', 0, '2020-12-02 00:00:00'),
(46, 'mpm', 'mppmpmpmpmp', 777779000, '../assets/img/forza.jpg', 0, '2020-12-01 00:00:00'),
(47, 'ereer', 'erzerzer', 7845, '../assets/img/dis.jpg', 1, '2020-12-02 00:00:00'),
(48, 'ereer', 'erzerzer', 7845, '../assets/img/dis.jpg', 1, '2020-12-02 00:00:00'),
(49, 'ereer', 'erzerzer', 7845, '../assets/img/dis.jpg', 1, '2020-12-02 00:00:00'),
(50, 'ereer', 'erzerzer', 7845, '../assets/img/dis.jpg', 1, '2020-12-02 00:00:00'),
(51, 'ereer', 'erzerzer', 7845, '../assets/img/dis.jpg', 1, '2020-12-02 00:00:00'),
(52, '*$*$*', '$*$*$*$', 88, '../assets/img/drmario.jpg', 1, '2020-12-04 00:00:00'),
(53, 'mmmmmmmmmmmmmmm', 'mmmmmmmmmmmmmmmm', 888889000000000, '../assets/img/drmario.jpg', 0, '2020-12-01 00:00:00'),
(54, 'grgr', 'grgr', 564, '../assets/img/forza.jpg', 0, '2020-12-02 00:00:00'),
(55, 'ffffffffffffffffffff', 'bggggg', 985, '../assets/img/japon.jpg', 0, '2020-12-13 00:00:00'),
(56, '________________________', '_____________________', 4512, '../assets/img/o.png', 1, '2020-12-01 00:00:00'),
(57, 'la c cbon', 'bonbobnbobnb', 54, '../assets/img/nier.jpg', 1, '2020-12-08 00:00:00'),
(58, 'C bon ca marche', 'Le mail est envoyé et on peut editer par id', 784512, '../assets/img/dis.jpg', 0, '2020-12-01 00:00:00');

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
  `email_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email_id` (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `nesgames`
--

INSERT INTO `nesgames` (`id`, `title`, `description`, `price`, `imgurl`, `stock`, `email_id`) VALUES
(1, 'Super Mario Bros 2 (Doko Doki Panic)', 'Super Mario Bros. 2 est un jeu vidéo de plates-formes développé et édité par la société japonaise Nintendo. Il sort sur Nintendo Entertainment System en 1988 en Amérique du Nord, en 1989 en Europe puis en 1992 au Japon', 748.25, 'https://images-na.ssl-images-amazon.com/images/I/91lqX-9q0qL._AC_SY445_.jpg', 'OUI 652 Cartouches', 1),
(7, 'Kid Icarus', 'Kid Icarus, Hikari Shinwa: Parutena no Kagami?) est un jeu vidéo de plates-formes, le premier de la série qui porte son nom. Développé par Nintendo R&D1 et édité par Nintendo, le jeu est sorti sur Famicom Disk System en 1986 au Japon. Il sort ensuite sur Nintendo Entertainment System en 1987 aux États-Unis et en Europe. Une réédition sort au Japon en 2004 sur Game Boy Advance dans le cadre de la collection Famicom Mini. Le jeu est également ressorti, en février 2007, sur la Console virtuelle de la Wii. ', 785.25, 'https://e.snmc.io/lk/l/x/6895870abccad57f9f5180f099a3ad60/6760322', 'OUI 245 Cartouches', 2),
(9, 'Kirby\'s Adventure', 'Kirby\'s Adventure est un jeu vidéo de plate-forme sorti sur Nintendo Entertainment System développé par HAL Laboratory en 1993. Il a pour héros Kirby. C\'est le deuxième jeu mettant en scène la petite boule rose, mais le premier sur une console de salon de Nintendo.', 458.35, 'https://image.jeuxvideo.com/images/ns/k/i/kiadns0f.jpg', 'OUI 78 Cartouches', 10),
(10, 'Castlevania III: Dracula\'s Curse', 'Castlevania III: Dracula\'s Curse est un jeu vidéo d\'action et de plates-formes sorti en 1989 sur Nintendo Entertainment System. Développé et édité par Konami, distribué par Konami aux États-Unis et au Japon, Palcom en Europe. Le jeu a été conçu par H. Akamatsu.', 78.15, 'https://image.jeuxvideo.com/images-sm/ns/c/a/cas3ns0f.jpg', 'NON Cet article est apuisé', 10),
(11, 'Double Dragon 2', 'Double Dragon 2: The Revenge est un jeu vidéo de type beat them all développé par Technos, sorti sur borne d\'arcade en 1988 et adapté sur la plupart des consoles de jeu et des micro-ordinateurs de l\'époque. ', 98.25, 'https://hoz14nes.files.wordpress.com/2015/03/doubledragon-label.jpg', 'OUI 25 Cartouches', 2),
(12, 'Batman', 'Batman: The Video Game est un jeu vidéo développé et édité par la société japonaise Sunsoft sur Nintendo Entertainment System en 1989/1990. Le jeu est sorti en même temps que le film homonyme et présente, entre les niveaux, des scènes montrant les personnages du film. Malgré cela, le déroulement du jeu est différent.', 7848.65, 'https://image.jeuxvideo.com/images-sm/ns/b/a/batmns0f.jpg', 'OUI 48 Cartouches', 10),
(13, 'Dr Mario', 'Dr. Mario est un jeu vidéo de puzzle développé et édité par Nintendo, sorti sur NES et Game Boy en 1990. Il a été conçu par Gunpei Yokoi et produit par Takahiro Harada ; la musique a été composée par Hirokazu Tanaka. Le jeu met en scène Mario mais ne reprend pas davantage l\'univers de la série éponyme.', 45.15, 'https://images-na.ssl-images-amazon.com/images/I/814KKHpfrRL._AC_SL1500_.jpg', 'OUI 784 Cartouches', 2),
(14, 'Mega Man 3', 'Mega Man 3 ou Mega Man III, est un jeu d\'action-plates-formes développé et édité par Capcom sur console NES en 1990, puis porté sur borne d\'arcade, PlayStation, Console virtuelle, PlayStation Network, et téléphone mobile. C\'est le troisième jeu de la série principale de Mega Man.', 7489.45, 'https://media.senscritique.com/media/000017714746/source_big/Mega_Man_3.jpg', 'OUI 2 Cartouches (ATTENTION Cet article est bientôt épuisé)', 10),
(15, 'gdrgfd', 'dfgdgdfg', 777777, 'dgfdgdf', 'dfgdgd', 2);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `pseudo` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `pseudo`) VALUES
(1, 'tito@test.fr', 'test', 'test'),
(2, 'micpiwo@hotmail.fr', 'Sladpowa38', 'micpiwo38'),
(10, 'test@test.com', 'test', 'test'),
(11, 'robert@cool.fr', 'azerty', 'robert BOBO'),
(18, 'michel@michel.com', 'azertyui', 'michel'),
(21, 'francois@laposte.net', 'zzzzzzzz', 'francois'),
(22, 'admin@games.com', 'administration', 'admin'),
(23, 'admin@admin.com', 'administration', 'admin');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `gites`
--
ALTER TABLE `gites`
  ADD CONSTRAINT `gites_ibfk_1` FOREIGN KEY (`gite_category`) REFERENCES `category_gites` (`id_category`);

--
-- Contraintes pour la table `nesgames`
--
ALTER TABLE `nesgames`
  ADD CONSTRAINT `nesgames_ibfk_1` FOREIGN KEY (`email_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
