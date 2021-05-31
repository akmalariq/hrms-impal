-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2021 at 10:41 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrms-impal`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(1) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(1, 'Akmal Ariq Santoso', 'akmal@akmal.akmal', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 1, 1, 1622087704),
(2, 'Willy Stiedemann', 'roma.legros@ryan.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 3, 1, 1622106366),
(3, 'Tommie Bartoletti', 'beer.maudie@gmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(4, 'Mr. Earnest Littel V', 'tgislason@gmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(5, 'Susanna Brakus II', 'ethompson@gmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(6, 'Maverick Gerhold', 'abshire.jany@trantow.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(7, 'Kendrick Beahan', 'clarissa15@sporer.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(8, 'Nelda Greenholt', 'kobe.pagac@wunschankunding.org', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(9, 'Ellen Konopelski', 'marcos.mcclure@bernhard.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(10, 'Ewald Marvin IV', 'wunsch.jayce@yahoo.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(11, 'Karley Wintheiser II', 'blick.hillary@gmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(12, 'Marilyne Von', 'aditya.boyer@hotmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(13, 'Dr. Merlin Conn', 'herminio19@yahoo.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(14, 'Prof. Damien Heidenreich PhD', 'hettinger.candace@gaylord.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(15, 'Jaylon Hane', 'kling.ardella@gmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(16, 'Nya Kozey', 'montana.greenholt@yundtsanford.info', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(17, 'Kristoffer Parisian', 'pansy.mccullough@sauerfisher.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(18, 'Dr. Vinnie Rath', 'lucienne.feeney@reilly.org', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(19, 'Alexandria Stokes', 'koepp.myriam@yahoo.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(20, 'Ms. Eleonore McKenzie I', 'ybosco@gmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(21, 'Napoleon Klein', 'maria.littel@hotmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(22, 'Miss Victoria Hane', 'herminio47@ledner.biz', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(23, 'Eve Boyle', 'roma78@gmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(24, 'Hayden Roberts', 'opal24@gmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(25, 'Arne Weissnat I', 'tblanda@marquardt.org', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(26, 'Jorge McLaughlin', 'kmraz@lowe.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(27, 'Mabel Wisozk', 'breanne38@yahoo.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(28, 'Mr. Cody Pagac', 'houston.wiegand@yahoo.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(29, 'Candida Johnson', 'gerhold.fletcher@mante.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(30, 'Karli Wyman', 'santino.schaden@white.biz', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(31, 'Prof. Claude Pouros III', 'gaylord.roma@gmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(32, 'Charlie Conroy Sr.', 'hannah.howell@keebler.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(33, 'Prof. Roxane Abernathy', 'schulist.margarete@hotmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(34, 'Misty Effertz', 'krajcik.dominic@beer.info', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(35, 'Skye Larson', 'caroline.heidenreich@kingprice.org', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(36, 'Danny Carter DDS', 'leone.weimann@gmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(37, 'Helga Ebert MD', 'noelia23@hotmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(38, 'Miss Kathlyn Ullrich', 'khalid00@emmerich.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(39, 'Dr. Christian Jones', 'zrath@hotmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(40, 'Gillian Labadie IV', 'alvis64@feeney.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(41, 'Prof. Fausto Bernhard III', 'kayden41@mueller.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(42, 'Fletcher Haley', 'kmiller@hotmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(43, 'Larry Steuber', 'oberbrunner.percy@ankunding.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(44, 'Shayna Armstrong', 'gwilderman@hotmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(45, 'Raegan Beahan', 'marjorie.wintheiser@stromancrona.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(46, 'Malvina Kreiger', 'larson.jimmy@hotmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(47, 'Sammie Hauck', 'xnicolas@schulistrutherford.info', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(48, 'Dusty Dicki', 'swift.delfina@bodeokuneva.biz', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(49, 'Wendy Effertz', 'rippin.rosie@gmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(50, 'Mrs. Destiney Powlowski Sr.', 'cwehner@hammesdonnelly.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(51, 'Granville Haag', 'kerluke.wilma@hotmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(52, 'Abbie Russel', 'sdoyle@schusterboyer.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(53, 'Mariana Botsford', 'shyann13@hotmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(54, 'Moriah Oberbrunner', 'clint.carter@gmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(55, 'Prof. Genevieve Schaden', 'leo.veum@yahoo.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(56, 'London Wolf', 'friesen.kenna@hammeseffertz.biz', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(57, 'Zola Stark', 'yesenia.robel@boehmstroman.org', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(58, 'Mrs. Justine Dibbert', 'bins.ramon@kassulke.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(59, 'Mrs. Ettie Kerluke PhD', 'arnoldo.sanford@cummerata.biz', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(60, 'Bertha Heller', 'garrison.cole@yahoo.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(61, 'Prof. Terry Volkman DVM', 'stevie02@gmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(62, 'Nick Conn', 'qhessel@altenwerth.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(63, 'Stone Treutel', 'jailyn52@hotmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(64, 'Sandy Hintz', 'jayde34@hesselfranecki.info', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(65, 'Danyka Reynolds', 'gdouglas@hotmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(66, 'Ahmad Kautzer', 'elda86@gmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(67, 'Olga Prohaska', 'usanford@hotmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(68, 'Jamarcus Blanda', 'ld\'amore@mohr.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(69, 'Prof. Izaiah Brakus', 'nfisher@nienow.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(70, 'Michael Stroman II', 'darrick.bradtke@gmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(71, 'Zaria Jacobson PhD', 'hayden50@ullrichkeebler.net', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(72, 'Dr. Abelardo Daniel', 'mertz.skylar@gmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(73, 'Jaydon Lang', 'corbin22@zieme.info', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(74, 'Savanna Wyman', 'okoelpin@hotmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(75, 'Ms. Ila Cremin Sr.', 'xpfeffer@mcdermott.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(76, 'Mr. Kenny Friesen MD', 'lowe.shad@frami.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(77, 'Cruz Kessler', 'virgie.will@yahoo.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(78, 'Chelsie Kessler', 'lebert@hotmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(79, 'Miss Christine Torp Sr.', 'era.macejkovic@yahoo.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(80, 'Prof. Kristoffer Mraz', 'ekling@murray.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(81, 'Aletha Little V', 'leannon.colby@baileybauch.net', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(82, 'Dr. Stan Fritsch', 'ambrose17@yahoo.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(83, 'Hannah Wilkinson V', 'ryley35@hotmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(84, 'Zita Goldner', 'lwiza@bechtelarlang.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(85, 'Mrs. Jacky Boyle', 'mernser@hammes.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(86, 'Robin Bailey', 'izieme@waelchi.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(87, 'Dolores Okuneva', 'qboyle@jacobijones.biz', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(88, 'Kristofer Hilpert', 'rachelle92@hotmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(89, 'Mckayla Leannon DVM', 'randal.pollich@franecki.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(90, 'Ms. Ima Hayes', 'lynch.alyson@murazik.info', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(91, 'Miss Brisa Schaefer III', 'murazik.esmeralda@gmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(92, 'Gloria Veum', 'qlangosh@pollich.org', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(93, 'Dr. Rudolph Friesen', 'sgreenholt@lubowitzkris.net', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(94, 'Trenton Denesik', 'minnie03@weberhammes.net', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(95, 'Esta Gorczany', 'edd.rutherford@yahoo.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(96, 'King Toy', 'dfritsch@gmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(97, 'Miss Andreanne Prohaska DVM', 'althea02@hotmail.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(98, 'Waino Roberts', 'ianderson@marvincorkery.org', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(99, 'Dr. Brown Cummerata', 'elda10@predoviclemke.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(100, 'Tillman Keeling III', 'gabbott@aufderhar.com', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(102, 'john', 'john@john.john', 'default.jpg', '$2y$10$oo0rkfHkTTtK9DiAdjtOEumAcdb5J.YvbKgqpWXNHsc0WodC8QWv6', 3, 1, 1622438723);

-- --------------------------------------------------------

--
-- Table structure for table `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(3, 2, 2),
(10, 1, 2),
(14, 3, 1),
(15, 3, 2),
(16, 3, 3),
(17, 1, 3),
(18, 1, 1),
(19, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Menu'),
(4, 'Practicum');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Student'),
(3, 'Practicum Assistant');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas da-fw fa-tachometer-alt', 1),
(2, 2, 'My Profile', 'user', 'fas fa-fw fa-user', 1),
(3, 2, 'Edit Profile', 'user/edit', 'fas fa-fw fa-user-edit', 1),
(4, 3, 'Menu Management', 'menu', 'fas fa-fw fa-folder', 1),
(5, 3, 'Submenu Management', 'menu/submenu', 'fas fa-fw fa-folder-open', 1),
(6, 1, 'Role', 'admin/role', 'fas fa-fw fa-user-tie', 1),
(7, 2, 'Change Password', 'user/change_password', 'fas fa-fw fa-lock', 1),
(10, 1, 'Role Access', 'admin/roleaccess', 'fas fa-fw fa-user-tie', 1),
(11, 4, 'Schedule', 'practicum', 'far fa-fw fa-calendar-alt', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
