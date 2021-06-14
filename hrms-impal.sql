-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2021 at 07:11 AM
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
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `announcement` text NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `announcement`, `date_created`) VALUES
(3, 'Lorem ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non vestibulum enim. Maecenas quis diam nisi. Vivamus elementum pellentesque magna, quis lobortis sapien elementum sed. In eu lectus nec elit tristique euismod. Donec sodales justo et tristique porttitor. Pellentesque scelerisque vel lectus quis viverra. Duis finibus leo a nunc tempus, ac bibendum lacus efficitur. Phasellus at ipsum efficitur, venenatis nisl porttitor, bibendum magna. Phasellus id ipsum ut eros tempus tincidunt ac eget tortor.\r\n\r\nAliquam sodales orci ut dolor iaculis dapibus. In sollicitudin et lacus eu blandit. Cras imperdiet magna pretium, suscipit risus ac, feugiat ipsum. Sed eget sagittis massa, luctus eleifend sem. Integer mollis ultrices arcu, a ullamcorper felis volutpat vitae. Mauris posuere, justo vel hendrerit sodales, justo odio dapibus felis, vel luctus elit enim non mauris. Sed eros enim, porta a elit vitae, vestibulum ullamcorper quam. Nulla vulputate dui a risus suscipit aliquam. Proin elementum vestibulum molestie. Curabitur et convallis ipsum, eget consectetur nunc. Vivamus blandit posuere nibh, ut gravida nulla lacinia eget. Proin maximus sollicitudin elit ut pharetra. Praesent vel turpis sodales velit lobortis blandit. Suspendisse commodo consequat dui non porttitor.\r\n\r\nSuspendisse eu lacus cursus libero tempor gravida et at dui. Ut in dui dui. Mauris aliquet at dui ut vehicula. Nullam aliquam, neque quis tincidunt cursus, velit velit fringilla neque, nec maximus mauris elit et lacus. Pellentesque cursus ultricies nulla vitae lobortis. Nam condimentum diam ac justo sollicitudin, eleifend tristique enim pellentesque. Phasellus et tempor orci. Cras aliquam eros et metus lacinia, nec laoreet urna euismod. Ut pretium, justo in accumsan eleifend, ante ligula faucibus elit, eu rutrum urna dolor lacinia magna. Phasellus dolor ligula, ultricies a arcu vel, euismod vestibulum diam. Ut condimentum elit tempor malesuada rutrum. Donec accumsan sapien eget porta congue. Vivamus tellus ipsum, condimentum in finibus id, vulputate viverra eros. Aliquam erat volutpat. Integer non risus nisi. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nSed a lacus nec tortor consectetur semper id vel odio. Cras sed justo consectetur, convallis metus a, varius leo. Donec erat justo, sollicitudin in lorem interdum, venenatis condimentum nunc. Mauris posuere hendrerit justo. Integer dignissim at libero eget dictum. Sed vulputate est in mi gravida iaculis vitae sagittis nisl. Duis in gravida ex. Suspendisse sollicitudin eu nisi ac pulvinar. Sed a dignissim turpis. Donec sit amet egestas diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse vulputate vulputate neque ut feugiat. Sed quis sem orci. Nullam ut luctus sapien, ac laoreet turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ac velit eget metus egestas rhoncus.\r\n\r\nIn hac habitasse platea dictumst. Vivamus dignissim vehicula nisi, nec malesuada arcu sollicitudin eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque facilisis lorem in nisl ultrices sollicitudin. Etiam elementum scelerisque volutpat. Nam id est euismod enim interdum imperdiet. Donec efficitur urna mattis ornare suscipit. Aenean viverra lorem id viverra condimentum. Proin a sem at velit commodo bibendum id eu magna. Suspendisse sagittis felis ante, vitae scelerisque mauris iaculis ac. Proin sed dolor convallis, convallis magna vitae, aliquam turpis. Integer sed massa orci.', 1623122796),
(4, 'Hai', '', 1623612001);

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `modul_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `attend` int(11) NOT NULL,
  `complain` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `course` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `course`) VALUES
(1, 'Software Engineering: Design and Implementation'),
(2, 'Data Structure'),
(3, 'Programming Algorithm'),
(4, 'Platform-based Application'),
(5, 'Database'),
(6, 'Computer Network'),
(7, 'Software Construction'),
(8, 'Pemodelan dan Implementasis Basis Data'),
(9, 'Object Oriented Programming'),
(10, 'RPL: Desain dan Implementasi'),
(11, 'Operating System'),
(12, 'Parallel and Distributed System');

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE `modul` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `modul` varchar(256) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `modul`
--

INSERT INTO `modul` (`id`, `course_id`, `modul`, `date`) VALUES
(1, 1, 'Module 1 INTRODUCTION OF SOFTWARE DESIGN AND\r\nIMPLEMENTATION PRACTICUM', 1613331000),
(2, 1, 'Module 2 SRS REVIEW AND CASE STUDY ALTERNATIVE', 1613935800),
(3, 1, 'Module 3 INTEGRATED DEVELOPMENT ENVIRONMENT', 1614540600),
(4, 1, 'Module 4 GITHUB\r\n', 1615145400),
(5, 1, 'Module 5 GUI BUILDER', 1615750200),
(6, 1, 'Module 6 MYSQL/MS ACCESS', 1616355000),
(7, 1, 'Module 7 IMPLEMENTING CLASS DIAGRAM', 1616959800),
(8, 1, 'Module 8 IMPLEMENTATION OF SEQUENCE DIAGRAM', 1618774200),
(9, 1, 'Module 9 IMPLEMENTATION OF ROBUSTNESS ANALYSIS', 1619379000),
(10, 1, 'Module 10 DOCUMENTATION OF SOFTWARE DESIGN AND USER\r\nMANUAL', 1619983800),
(11, 1, 'Module 11 DESIGN PATTERN', 1621798200),
(12, 1, 'Module 12 REFACTORING', 1622403000),
(13, 2, 'Module 1', 1613331000),
(14, 2, 'Module 2', 1613935800),
(15, 2, 'Module 3', 1614540600),
(16, 2, 'Module 4', 1615145400),
(17, 2, 'Module 5', 1615750200),
(18, 2, 'Module 6', 1616355000),
(19, 2, 'Module 7', 1616959800),
(20, 2, 'Module 8', 1618774200),
(21, 2, 'Module 9', 1619379000),
(22, 2, 'Module 10', 1619983800),
(23, 2, 'Module 11', 1621798200),
(24, 2, 'Module 12', 1622403000),
(26, 3, 'Modul 1', 1623139345),
(27, 3, 'Modul 2', 1623139345),
(28, 3, 'Modul 3', 1623139345),
(29, 3, 'Modul 4', 1623139345),
(30, 3, 'Modul 5', 1623139345),
(31, 3, 'Modul 6', 1623139345),
(32, 3, 'Modul 7', 1623139345),
(33, 3, 'Modul 8', 1623139345),
(34, 3, 'Modul 9', 1623139346),
(35, 3, 'Modul 10', 1623139346),
(36, 3, 'Modul 11', 1623139346),
(37, 3, 'Modul 12', 1623139346),
(38, 4, 'Modul 1', 1623139346),
(39, 4, 'Modul 2', 1623139346),
(40, 4, 'Modul 3', 1623139346),
(41, 4, 'Modul 4', 1623139346),
(42, 4, 'Modul 5', 1623139346),
(43, 4, 'Modul 6', 1623139346),
(44, 4, 'Modul 7', 1623139346),
(45, 4, 'Modul 8', 1623139346),
(46, 4, 'Modul 9', 1623139346),
(47, 4, 'Modul 10', 1623139346),
(48, 4, 'Modul 11', 1623139346),
(49, 4, 'Modul 12', 1623139346),
(50, 5, 'Modul 1', 1623139346),
(51, 5, 'Modul 2', 1623139346),
(52, 5, 'Modul 3', 1623139346),
(53, 5, 'Modul 4', 1623139346),
(54, 5, 'Modul 5', 1623139346),
(55, 5, 'Modul 6', 1623139346),
(56, 5, 'Modul 7', 1623139346),
(57, 5, 'Modul 8', 1623139346),
(58, 5, 'Modul 9', 1623139346),
(59, 5, 'Modul 10', 1623139346),
(60, 5, 'Modul 11', 1623139346),
(61, 5, 'Modul 12', 1623139346),
(62, 6, 'Modul 1', 1623139346),
(63, 6, 'Modul 2', 1623139346),
(64, 6, 'Modul 3', 1623139346),
(65, 6, 'Modul 4', 1623139346),
(66, 6, 'Modul 5', 1623139346),
(67, 6, 'Modul 6', 1623139346),
(68, 6, 'Modul 7', 1623139346),
(69, 6, 'Modul 8', 1623139346),
(70, 6, 'Modul 9', 1623139346),
(71, 6, 'Modul 10', 1623139346),
(72, 6, 'Modul 11', 1623139346),
(73, 6, 'Modul 12', 1623139346),
(74, 7, 'Modul 1', 1623139346),
(75, 7, 'Modul 2', 1623139346),
(76, 7, 'Modul 3', 1623139346),
(77, 7, 'Modul 4', 1623139346),
(78, 7, 'Modul 5', 1623139346),
(79, 7, 'Modul 6', 1623139346),
(80, 7, 'Modul 7', 1623139346),
(81, 7, 'Modul 8', 1623139346),
(82, 7, 'Modul 9', 1623139346),
(83, 7, 'Modul 10', 1623139346),
(84, 7, 'Modul 11', 1623139346),
(85, 7, 'Modul 12', 1623139346),
(86, 8, 'Modul 1', 1623139346),
(87, 8, 'Modul 2', 1623139346),
(88, 8, 'Modul 3', 1623139346),
(89, 8, 'Modul 4', 1623139346),
(90, 8, 'Modul 5', 1623139346),
(91, 8, 'Modul 6', 1623139346),
(92, 8, 'Modul 7', 1623139346),
(93, 8, 'Modul 8', 1623139346),
(94, 8, 'Modul 9', 1623139346),
(95, 8, 'Modul 10', 1623139346),
(96, 8, 'Modul 11', 1623139346),
(97, 8, 'Modul 12', 1623139346),
(98, 9, 'Modul 1', 1623139346),
(99, 9, 'Modul 2', 1623139346),
(100, 9, 'Modul 3', 1623139346),
(101, 9, 'Modul 4', 1623139346),
(102, 9, 'Modul 5', 1623139346),
(103, 9, 'Modul 6', 1623139346),
(104, 9, 'Modul 7', 1623139346),
(105, 9, 'Modul 8', 1623139346),
(106, 9, 'Modul 9', 1623139346),
(107, 9, 'Modul 10', 1623139346),
(108, 9, 'Modul 11', 1623139346),
(109, 9, 'Modul 12', 1623139346),
(110, 10, 'Modul 1', 1623139346),
(111, 10, 'Modul 2', 1623139346),
(112, 10, 'Modul 3', 1623139346),
(113, 10, 'Modul 4', 1623139346),
(114, 10, 'Modul 5', 1623139346),
(115, 10, 'Modul 6', 1623139346),
(116, 10, 'Modul 7', 1623139346),
(117, 10, 'Modul 8', 1623139346),
(118, 10, 'Modul 9', 1623139346),
(119, 10, 'Modul 10', 1623139346),
(120, 10, 'Modul 11', 1623139346),
(121, 10, 'Modul 12', 1623139346),
(122, 11, 'Modul 1', 1623139612),
(123, 11, 'Modul 2', 1623139612),
(124, 11, 'Modul 3', 1623139612),
(125, 11, 'Modul 4', 1623139612),
(126, 11, 'Modul 5', 1623139612),
(127, 11, 'Modul 6', 1623139612),
(128, 11, 'Modul 7', 1623139612),
(129, 11, 'Modul 8', 1623139612),
(130, 11, 'Modul 9', 1623139612),
(131, 11, 'Modul 10', 1623139612),
(132, 11, 'Modul 11', 1623139612),
(133, 11, 'Modul 12', 1623139612),
(134, 12, 'Modul 1', 1623139612),
(135, 12, 'Modul 2', 1623139612),
(136, 12, 'Modul 3', 1623139612),
(137, 12, 'Modul 4', 1623139612),
(138, 12, 'Modul 5', 1623139612),
(139, 12, 'Modul 6', 1623139612),
(140, 12, 'Modul 7', 1623139612),
(141, 12, 'Modul 8', 1623139612),
(142, 12, 'Modul 9', 1623139612),
(143, 12, 'Modul 10', 1623139612),
(144, 12, 'Modul 11', 1623139612),
(145, 12, 'Modul 12', 1623139612);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `modul_id` int(11) NOT NULL,
  `complain` text NOT NULL,
  `attend` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `user_id`, `role_id`, `modul_id`, `complain`, `attend`) VALUES
(340, 1, 3, 13, '', 1),
(341, 1, 3, 14, '', 1),
(342, 1, 3, 15, '', 0),
(343, 1, 3, 16, '', 0),
(344, 1, 3, 17, '', 0),
(345, 1, 3, 18, '', 0),
(346, 1, 3, 19, '', 0),
(347, 1, 3, 20, '', 0),
(348, 1, 3, 21, '', 0),
(349, 1, 3, 22, '', 0),
(350, 1, 3, 23, '', 0),
(351, 1, 3, 24, '', 0),
(364, 2, 3, 13, '', 0),
(365, 2, 3, 14, '', 0),
(366, 2, 3, 15, '', 0),
(367, 2, 3, 16, '', 0),
(368, 2, 3, 17, '', 0),
(369, 2, 3, 18, '', 0),
(370, 2, 3, 19, '', 0),
(371, 2, 3, 20, '', 0),
(372, 2, 3, 21, '', 0),
(373, 2, 3, 22, '', 0),
(374, 2, 3, 23, '', 0),
(375, 2, 3, 24, '', 0),
(496, 1, 2, 13, '', 1),
(497, 1, 2, 14, '', 0),
(498, 1, 2, 15, '', 0),
(499, 1, 2, 16, '', 0),
(500, 1, 2, 17, '', 0),
(501, 1, 2, 18, '', 0),
(502, 1, 2, 19, '', 0),
(503, 1, 2, 20, '', 0),
(504, 1, 2, 21, '', 0),
(505, 1, 2, 22, '', 0),
(506, 1, 2, 23, '', 0),
(507, 1, 2, 24, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `sid` char(11) NOT NULL,
  `class` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(1) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `sid`, `class`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(1, 'Akmal Ariq Santoso', 'akmal@akmal.akmal', '1301170000', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 1, 1, 1622087704),
(2, 'ariq ariq', 'ariq@ariq.ariq', '1301170001', 'IF-42-INT', 'default.jpg', '$2y$10$SaXySmv0QOxyUwEc7xr1D.ZxpJ/MRj/e9RQqo2WygaCuoHg4ae1eC', 3, 1, 1622106366),
(3, 'adrian', 'adrian@adrian.adrian', '1301170002', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(4, 'anas', 'anas@anas.anas', '1301170003', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 4, 1, 1622106366),
(5, 'Susanna Brakus II', 'ethompson@gmail.com', '1301170004', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(6, 'Maverick Gerhold', 'abshire.jany@trantow.com', '1301170005', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(7, 'Kendrick Beahan', 'clarissa15@sporer.com', '1301170006', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(8, 'Nelda Greenholt', 'kobe.pagac@wunschankunding.org', '1301170007', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(9, 'Ellen Konopelski', 'marcos.mcclure@bernhard.com', '1301170008', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(10, 'Ewald Marvin IV', 'wunsch.jayce@yahoo.com', '1301170009', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(11, 'Karley Wintheiser II', 'blick.hillary@gmail.com', '1301170010', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(12, 'Marilyne Von', 'aditya.boyer@hotmail.com', '1301170011', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(13, 'Dr. Merlin Conn', 'herminio19@yahoo.com', '1301170012', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(14, 'Prof. Damien Heidenreich PhD', 'hettinger.candace@gaylord.com', '1301170013', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(15, 'Jaylon Hane', 'kling.ardella@gmail.com', '1301170014', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(16, 'Nya Kozey', 'montana.greenholt@yundtsanford.info', '1301170015', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(17, 'Kristoffer Parisian', 'pansy.mccullough@sauerfisher.com', '1301170016', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(18, 'Dr. Vinnie Rath', 'lucienne.feeney@reilly.org', '1301170017', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(19, 'Alexandria Stokes', 'koepp.myriam@yahoo.com', '1301170018', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(20, 'Ms. Eleonore McKenzie I', 'ybosco@gmail.com', '1301170019', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(21, 'Napoleon Klein', 'maria.littel@hotmail.com', '1301170020', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(22, 'Miss Victoria Hane', 'herminio47@ledner.biz', '1301170021', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(23, 'Eve Boyle', 'roma78@gmail.com', '1301170022', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(24, 'Hayden Roberts', 'opal24@gmail.com', '1301170023', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(25, 'Arne Weissnat I', 'tblanda@marquardt.org', '1301170024', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(26, 'Jorge McLaughlin', 'kmraz@lowe.com', '1301170025', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(27, 'Mabel Wisozk', 'breanne38@yahoo.com', '1301170026', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(28, 'Mr. Cody Pagac', 'houston.wiegand@yahoo.com', '1301170027', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(29, 'Candida Johnson', 'gerhold.fletcher@mante.com', '1301170028', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(30, 'Karli Wyman', 'santino.schaden@white.biz', '1301170029', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(31, 'Prof. Claude Pouros III', 'gaylord.roma@gmail.com', '1301170030', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(32, 'Charlie Conroy Sr.', 'hannah.howell@keebler.com', '1301170031', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(33, 'Prof. Roxane Abernathy', 'schulist.margarete@hotmail.com', '1301170032', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(34, 'Misty Effertz', 'krajcik.dominic@beer.info', '1301170033', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(35, 'Skye Larson', 'caroline.heidenreich@kingprice.org', '1301170034', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(36, 'Danny Carter DDS', 'leone.weimann@gmail.com', '1301170035', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(37, 'Helga Ebert MD', 'noelia23@hotmail.com', '1301170036', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(38, 'Miss Kathlyn Ullrich', 'khalid00@emmerich.com', '1301170037', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(39, 'Dr. Christian Jones', 'zrath@hotmail.com', '1301170038', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(40, 'Gillian Labadie IV', 'alvis64@feeney.com', '1301170039', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(41, 'Prof. Fausto Bernhard III', 'kayden41@mueller.com', '1301170040', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(42, 'Fletcher Haley', 'kmiller@hotmail.com', '1301170041', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(43, 'Larry Steuber', 'oberbrunner.percy@ankunding.com', '1301170042', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(44, 'Shayna Armstrong', 'gwilderman@hotmail.com', '1301170043', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(45, 'Raegan Beahan', 'marjorie.wintheiser@stromancrona.com', '1301170044', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(46, 'Malvina Kreiger', 'larson.jimmy@hotmail.com', '1301170045', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(47, 'Sammie Hauck', 'xnicolas@schulistrutherford.info', '1301170046', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(48, 'Dusty Dicki', 'swift.delfina@bodeokuneva.biz', '1301170047', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(49, 'Wendy Effertz', 'rippin.rosie@gmail.com', '1301170048', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(50, 'Mrs. Destiney Powlowski Sr.', 'cwehner@hammesdonnelly.com', '1301170049', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(51, 'Granville Haag', 'kerluke.wilma@hotmail.com', '1301170050', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(52, 'Abbie Russel', 'sdoyle@schusterboyer.com', '1301170051', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(53, 'Mariana Botsford', 'shyann13@hotmail.com', '1301170052', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(54, 'Moriah Oberbrunner', 'clint.carter@gmail.com', '1301170053', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(55, 'Prof. Genevieve Schaden', 'leo.veum@yahoo.com', '1301170054', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(56, 'London Wolf', 'friesen.kenna@hammeseffertz.biz', '1301170055', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(57, 'Zola Stark', 'yesenia.robel@boehmstroman.org', '1301170056', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(58, 'Mrs. Justine Dibbert', 'bins.ramon@kassulke.com', '1301170057', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(59, 'Mrs. Ettie Kerluke PhD', 'arnoldo.sanford@cummerata.biz', '1301170058', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(60, 'Bertha Heller', 'garrison.cole@yahoo.com', '1301170059', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(61, 'Prof. Terry Volkman DVM', 'stevie02@gmail.com', '1301170060', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(62, 'Nick Conn', 'qhessel@altenwerth.com', '1301170061', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(63, 'Stone Treutel', 'jailyn52@hotmail.com', '1301170062', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(64, 'Sandy Hintz', 'jayde34@hesselfranecki.info', '1301170063', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(65, 'Danyka Reynolds', 'gdouglas@hotmail.com', '1301170064', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(66, 'Ahmad Kautzer', 'elda86@gmail.com', '1301170065', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(67, 'Olga Prohaska', 'usanford@hotmail.com', '1301170066', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(68, 'Jamarcus Blanda', 'ld\'amore@mohr.com', '1301170067', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(69, 'Prof. Izaiah Brakus', 'nfisher@nienow.com', '1301170068', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(70, 'Michael Stroman II', 'darrick.bradtke@gmail.com', '1301170069', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(71, 'Zaria Jacobson PhD', 'hayden50@ullrichkeebler.net', '1301170070', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(72, 'Dr. Abelardo Daniel', 'mertz.skylar@gmail.com', '1301170071', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(73, 'Jaydon Lang', 'corbin22@zieme.info', '1301170072', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(74, 'Savanna Wyman', 'okoelpin@hotmail.com', '1301170073', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(75, 'Ms. Ila Cremin Sr.', 'xpfeffer@mcdermott.com', '1301170074', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(76, 'Mr. Kenny Friesen MD', 'lowe.shad@frami.com', '1301170075', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(77, 'Cruz Kessler', 'virgie.will@yahoo.com', '1301170076', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(78, 'Chelsie Kessler', 'lebert@hotmail.com', '1301170077', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(79, 'Miss Christine Torp Sr.', 'era.macejkovic@yahoo.com', '1301170078', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(80, 'Prof. Kristoffer Mraz', 'ekling@murray.com', '1301170079', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(81, 'Aletha Little V', 'leannon.colby@baileybauch.net', '1301170080', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(82, 'Dr. Stan Fritsch', 'ambrose17@yahoo.com', '1301170081', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(83, 'Hannah Wilkinson V', 'ryley35@hotmail.com', '1301170082', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(84, 'Zita Goldner', 'lwiza@bechtelarlang.com', '1301170083', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(85, 'Mrs. Jacky Boyle', 'mernser@hammes.com', '1301170084', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(86, 'Robin Bailey', 'izieme@waelchi.com', '1301170085', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(87, 'Dolores Okuneva', 'qboyle@jacobijones.biz', '1301170086', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(88, 'Kristofer Hilpert', 'rachelle92@hotmail.com', '1301170087', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(89, 'Mckayla Leannon DVM', 'randal.pollich@franecki.com', '1301170088', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(90, 'Ms. Ima Hayes', 'lynch.alyson@murazik.info', '1301170089', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(91, 'Miss Brisa Schaefer III', 'murazik.esmeralda@gmail.com', '1301170090', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(92, 'Gloria Veum', 'qlangosh@pollich.org', '1301170091', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(93, 'Dr. Rudolph Friesen', 'sgreenholt@lubowitzkris.net', '1301170092', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(94, 'Trenton Denesik', 'minnie03@weberhammes.net', '1301170093', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(95, 'Esta Gorczany', 'edd.rutherford@yahoo.com', '1301170094', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(96, 'King Toy', 'dfritsch@gmail.com', '1301170095', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(97, 'Miss Andreanne Prohaska DVM', 'althea02@hotmail.com', '1301170096', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(98, 'Waino Roberts', 'ianderson@marvincorkery.org', '1301170097', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(99, 'Dr. Brown Cummerata', 'elda10@predoviclemke.com', '1301170098', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(100, 'Tillman Keeling III', 'gabbott@aufderhar.com', '1301170099', 'IF-41-INT', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(102, 'john', 'john@john.john', '1301170100', 'IF-41-INT', 'default.jpg', '$2y$10$oo0rkfHkTTtK9DiAdjtOEumAcdb5J.YvbKgqpWXNHsc0WodC8QWv6', 3, 1, 1622438723),
(103, 'angel angel', 'angel@angel.angel', '1301170101', 'IF-41-INT', 'default.jpg', '$2y$10$Lz5cbzql205CFceRTbc0VeSsk4cqL2R.8Gk25D228Uy0lyzrjuqqi', 2, 1, 1622453504),
(108, 'zharfan', 'zharfan@zharfan.zharfan', '', '', 'default.jpg', '$2y$10$fC5/osx.dNgeTJdqTl/LEOn2sdvlu.yxPOM3aTTuWWPN4yPSkYDhi', 2, 1, 1623614253);

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
(4, 1, 1),
(5, 1, 4),
(9, 1, 3),
(11, 1, 7),
(12, 4, 7),
(31, 1, 5),
(33, 1, 2),
(35, 2, 2),
(36, 2, 4),
(37, 3, 3),
(38, 3, 2),
(39, 3, 4),
(40, 4, 5),
(41, 4, 2),
(42, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_assign`
--

CREATE TABLE `user_assign` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `mata_kuliah_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_assign`
--

INSERT INTO `user_assign` (`id`, `user_id`, `role_id`, `mata_kuliah_id`) VALUES
(1, 1, 2, 1),
(4, 1, 3, 2);

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
(3, 'Assistant'),
(4, 'Practicum'),
(5, 'Recruitment');

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
(3, 'Practicum Assistant'),
(4, 'Candidate');

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
(4, 1, 'Role', 'admin/role', 'fas fa-fw fa-user-tie', 1),
(5, 2, 'Change Password', 'user/change_password', 'fas fa-fw fa-lock', 1),
(6, 1, 'Role Access', 'admin/role_access', 'fas fa-fw fa-user-tie', 1),
(7, 4, 'Schedule', 'practicum', 'far fa-fw fa-calendar-alt', 1),
(8, 3, 'Assistant Schedule', 'assistant', 'far fa-fw fa-calendar-alt', 1),
(9, 4, 'Announcements', 'practicum/announcements', 'fas fa-fw fa-bullhorn', 1),
(10, 5, 'Recruitment Phase', 'recruitment', 'fas fa-fw fa-user-plus', 1),
(13, 1, 'Create Announcements', 'admin/create_announcement', 'fas fa-fw fa-bullhorn', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `user_assign`
--
ALTER TABLE `user_assign`
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
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `modul`
--
ALTER TABLE `modul`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=508;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `user_assign`
--
ALTER TABLE `user_assign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11113;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
