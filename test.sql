-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 28 Octobre 2015 à 22:14
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `test`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(30) NOT NULL,
  `date` varchar(30) NOT NULL,
  `content` varchar(4096) NOT NULL,
  `summary` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id`, `title`, `author`, `date`, `content`, `summary`) VALUES
(1, 'Lorem Ipsum', 'Lorem', '2015-10-07T08:32:55.058Z', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed leo nulla, venenatis vitae urna sed, tincidunt eleifend nulla. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus velit orci, eleifend sed nibh quis, suscipit tincidunt neque. Mauris quis nisl mi. Morbi sit amet maximus mi. Vivamus eu mauris a sem semper molestie vitae eget nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent feugiat, elit sed pharetra aliquet, est lacus vulputate erat, eget aliquet lorem orci iaculis urna. In hac habitasse platea dictumst. Nam blandit eleifend bibendum. Donec metus elit, sollicitudin ac consequat in, sagittis eget lorem. Nulla quis commodo arcu. Quisque nec dolor et sem efficitur varius. Morbi urna tellus, viverra nec urna nec, faucibus eleifend libero.\r\n\r\nFusce a rhoncus urna. Duis quam diam, accumsan ut nisl non, feugiat rutrum nisl. Etiam luctus urna eu sapien commodo tristique. Mauris cursus nunc eros, nec tristique ipsum consequat nec. Proin nibh lectus, efficitur sed risus at, vestibulum tempus orci. Etiam non ex elit. Aenean nibh nunc, sollicitudin in elementum nec, vehicula vitae elit. Praesent elementum in erat nec porta. Donec lacinia auctor dolor quis dignissim. Aenean placerat nibh at porta auctor. Proin feugiat lorem non neque luctus vehicula. Praesent consectetur ligula nec lacus hendrerit, nec feugiat nulla eleifend. Maecenas scelerisque dictum est quis luctus. Pellentesque sit amet neque quis erat tempor tempus.\r\n\r\nInteger non facilisis elit, in vehicula ex. Mauris iaculis ex eget porttitor molestie. Vivamus rhoncus neque in dolor euismod tincidunt. Duis vehicula nisi a consequat ultrices. Nulla vestibulum tortor vitae nisi vestibulum, sed laoreet est pharetra. Cras nibh sem, pretium a eleifend at, tincidunt non massa. Nullam cursus eu elit ac posuere. Donec imperdiet erat sit amet diam tristique sodales.\r\n\r\nUt eleifend commodo nunc, a sollicitudin lorem ultricies id. Vestibulum viverra blandit diam, eget dictum odio eleifend sit amet. Nam vulputate sollicitudin orci et accumsan. Mauris porttitor ultrices ligula, a sollicitudin metus auctor vitae. Suspendisse et est ante. Maecenas vel dui accumsan, facilisis diam sed, efficitur libero. In hac habitasse platea dictumst. Integer semper, felis posuere fringilla feugiat, elit lectus consectetur quam, sed laoreet orci magna a ipsum. Vestibulum et mi sodales, feugiat diam non, varius arcu. Donec dignissim purus id pulvinar tincidunt.\r\n\r\nPraesent dolor metus, porttitor vitae mattis non, congue ac velit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin in sem at diam cursus sollicitudin. Nam fermentum efficitur maximus. Cras sodales erat ante, quis porttitor diam dapibus ut. Nulla facilisi. Curabitur et tristique lacus. Suspendisse potenti.\r\n\r\nNunc facilisis velit sit amet lorem fringilla, ac euismod tortor dictum. Nullam placerat eu neque molestie euismod. Curabitur ut suscipit dui, sit amet blandit lacus. Duis gravida efficitur magna imperdiet pulvinar. Maecenas sollicitudin magna ac pulvinar tristique. Phasellus finibus nunc ipsum, nec tempor sem tempus et. Vestibulum vitae gravida turpis, nec rutrum turpis.\r\n\r\nDonec at semper sapien. Nam ac orci sed enim feugiat ultricies at a ligula. Etiam at auctor tortor. Nulla tempus purus quam, nec cursus turpis luctus id. Quisque rhoncus, mi vel placerat ultrices, risus lectus sollicitudin ipsum, a consectetur lorem tellus ut velit. Vestibulum orci massa, volutpat at nisl nec, vestibulum posuere felis. Duis consectetur mi et molestie elementum. Fusce sollicitudin ante ac orci dictum, ullamcorper suscipit mi posuere. Quisque venenatis nulla est, eget lobortis magna pharetra quis.\r\n\r\nDonec quam enim, elementum at tempor vel, sodales eu dui. Donec at pretium nisi. Donec nec diam consequat, consectetur nisl in, varius eros. Donec sollicitudin, metus id mollis volutpat, quam justo pellentesque massa, at varius mi mauris quis justo. Quisque ac euismod est. Fusce sed arcu accumsan, hendrerit orc', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at nisl eros. Nulla hendrerit a est id eleifend. Vestibulum pharetra dignissim purus sit amet ultricies. Nulla sed erat vel volutpat'),
(2, 'Title', 'Singe', '2015-10-07T08:58:23.242Z', 'Content', 'Summary'),
(3, 'Autre article', 'Singe', '2015-10-28T20:20:46.032Z', 'Article pour tester l''ajout avec une textarea', 'Test pour la textarea');

-- --------------------------------------------------------

--
-- Structure de la table `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(30) NOT NULL,
  `date` varchar(40) NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

--
-- Contenu de la table `chat`
--

INSERT INTO `chat` (`id`, `user`, `date`, `message`) VALUES
(1, 'Test', '2015-10-04', 'Test premier message directement depuis la BD'),
(2, 'Test', '0000-00-00', 'a'),
(3, 'Test', '0000-00-00', 'test'),
(4, 'Test', '0000-00-00', 'Message'),
(5, 'Test', '0000-00-00', 'Add'),
(6, 'Test', '0000-00-00', 'Test'),
(7, 'Test', '0000-00-00', 'New Add'),
(8, 'Test', '0000-00-00', 'Riz souffle'),
(9, 'Test', '0000-00-00', 'Chat'),
(10, 'Test', '0000-00-00', 'Chat chat'),
(11, 'Test', '0000-00-00', 'Besoin'),
(12, 'Test', '0000-00-00', 'De faire defiler'),
(13, 'Test', '0000-00-00', 'Le chat'),
(14, 'Test', '0000-00-00', 'Pour voir les limites'),
(15, 'Test', '0000-00-00', 'Tonton'),
(16, 'Test', '0000-00-00', 'Celui la est le 16'),
(17, 'Test', '0000-00-00', 'Ca semble'),
(18, 'Test', '0000-00-00', 'Marche a peu pres'),
(19, 'Test', '0000-00-00', 'Cela marche'),
(20, 'Test', '0000-00-00', 'Un chat'),
(21, 'Test', '0000-00-00', 'Yesterday'),
(22, 'Test', '0000-00-00', 'Just do it'),
(23, 'Test', '0000-00-00', 'The more often'),
(24, 'Test', '0000-00-00', 'You''ll do it'),
(25, 'Test', '0000-00-00', 'Just do it'),
(26, 'Test', '0000-00-00', 'Just do it'),
(27, 'Test', '0000-00-00', 'Nothing is impossible'),
(28, 'Test', '0000-00-00', 'Ceci est un chat'),
(29, 'anonymous', '0000-00-00', 'Anonymous'),
(30, 'Singe', '0000-00-00', 'Je suis un singe'),
(31, 'anonymous', '0000-00-00', 'Vous n''etes pas pret'),
(32, 'anonymous', '0000-00-00', 'Marche'),
(33, 'Singe', '0000-00-00', 'Je suis un singe'),
(34, 'a', '', 'Waoooow'),
(35, 'a', '', 'DatePlease'),
(36, 'a', '', 'Nom nom nom'),
(37, 'a', '2015-10-06T14:54:22.923Z', 'Nom nom'),
(38, 'a', '2015-10-06T14:55:26.879Z', 'Test'),
(39, 'Thithi', '2015-10-06T14:59:33.631Z', 'Un message'),
(40, 'Thithi', '2015-10-06T14:59:41.544Z', 'Just DO IT'),
(41, 'Thithi', '2015-10-06T15:06:37.079Z', 'Test'),
(42, 'Thithi', '2015-10-06T15:06:43.091Z', 'Moi d''abord'),
(43, 'a', '2015-10-06T15:11:02.654Z', 'Mon gars'),
(44, 'a', '2015-10-06T15:11:06.527Z', 'Tu veux voir ce que c''est du paté ?'),
(45, 'a', '2015-10-06T15:11:13.351Z', 'Ca c''est pas grave'),
(46, 'a', '2015-10-06T15:11:14.437Z', 'Ca marche'),
(47, 'a', '2015-10-06T15:11:15.382Z', 'YES'),
(48, 'a', '2015-10-06T15:11:17.626Z', 'tHIS IS DELICOUS'),
(49, 'a', '2015-10-06T15:11:39.651Z', 'Enleve tes buffs'),
(50, 'a', '2015-10-06T15:11:41.598Z', 'Et ton pantalon'),
(51, 'a', '2015-10-06T15:11:43.027Z', 'TON PANTALON'),
(52, 'Singe', '2015-10-06T15:12:10.895Z', 'Salut'),
(53, 'a', '2015-10-06T15:12:14.404Z', 'Coucou toi'),
(54, 'Singe', '2015-10-06T15:12:35.906Z', 'Tu veux une banane ?'),
(55, 'a', '2015-10-06T15:12:39.786Z', 'Oui !'),
(56, 'a', '2015-10-06T15:14:21.082Z', 'Laissez moi danser'),
(57, 'Singe', '2015-10-06T15:14:26.791Z', 'Y''a aucun respect'),
(58, 'a', '2015-10-07T08:22:05.118Z', 'Test du refresh de la page'),
(59, 'a', '2015-10-07T08:22:08.380Z', 'Sans aucune action'),
(60, 'a', '2015-10-07T08:22:19.982Z', 'Ajout'),
(61, 'a', '2015-10-07T08:22:40.820Z', 'STAHP PLEAS'),
(62, 'a', '2015-10-07T08:22:58.108Z', 'STAHP'),
(63, 'a', '2015-10-07T08:30:10.512Z', ''),
(64, 'Singe', '2015-10-07T08:30:41.313Z', 'On peut ajouter du rien'),
(65, 'Singe', '2015-10-07T08:30:42.121Z', ''),
(66, 'Singe', '2015-10-07T08:30:44.219Z', 'C''est pas bien'),
(67, 'Singe', '2015-10-07T08:30:44.461Z', ''),
(68, 'Singe', '2015-10-07T08:30:44.613Z', ''),
(69, 'a', '2015-10-07T08:32:20.351Z', 'Chat'),
(70, 'a', '2015-10-07T08:32:55.058Z', 'Genial');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `comment`
--

INSERT INTO `comment` (`id`, `content`, `author`, `date`, `article_id`) VALUES
(1, 'Test d''un premier commentaire', 'Singe', '2015-10-07T08:32:55.058Z', 1),
(2, 'Ceci est un deuxieme commentaire', 'Singe', '2015-10-07T08:32:55.058Z', 1),
(3, 'Comment from form', 'Singe', '2015-10-28T20:40:50.867Z', 1),
(4, 'Test new commentaire', 'Singe', '2015-10-28T20:52:06.859Z', 1),
(5, 'New commentaire again', 'Singe', '2015-10-28T20:52:44.429Z', 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `address`) VALUES
(4, 'Test', '', 'Test', 'Test', 'Test'),
(5, 'Singe', '', 'Rouge', 'Banane', 'Plantin'),
(6, 'dsfze', '', 'vsdf', 'dsfze', NULL),
(7, 'OuiOui', '', 'AhOui', 'OuiOui', NULL),
(8, 'Test', '', 'Test', 'Test', NULL),
(9, 'LastName', '', 'FirstName', 'LastName', 'Address'),
(11, 'b', '', 'a', 'b', 'c'),
(12, 'User', '', 'Test', 'User', 'AfterModif'),
(13, 'One', '', 'Add', 'One', 'User'),
(14, 'FirstName', 'Password', 'LastName', 'FirstName', 'Address'),
(15, 'Other', 'One', 'Add', 'Other', 'User'),
(16, 'a', 'b', 'c', 'a', 'd'),
(17, 'LName', 'Pword', 'FName', 'LName', 'Ares'),
(18, 'Thithi', 'toto', 'tata', 'Thithi', 'tonpere');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
