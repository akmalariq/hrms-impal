-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2021 at 08:12 PM
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
(3, 'Lorem ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non vestibulum enim. Maecenas quis diam nisi. Vivamus elementum pellentesque magna, quis lobortis sapien elementum sed. In eu lectus nec elit tristique euismod. Donec sodales justo et tristique porttitor. Pellentesque scelerisque vel lectus quis viverra. Duis finibus leo a nunc tempus, ac bibendum lacus efficitur. Phasellus at ipsum efficitur, venenatis nisl porttitor, bibendum magna. Phasellus id ipsum ut eros tempus tincidunt ac eget tortor.\r\n\r\nAliquam sodales orci ut dolor iaculis dapibus. In sollicitudin et lacus eu blandit. Cras imperdiet magna pretium, suscipit risus ac, feugiat ipsum. Sed eget sagittis massa, luctus eleifend sem. Integer mollis ultrices arcu, a ullamcorper felis volutpat vitae. Mauris posuere, justo vel hendrerit sodales, justo odio dapibus felis, vel luctus elit enim non mauris. Sed eros enim, porta a elit vitae, vestibulum ullamcorper quam. Nulla vulputate dui a risus suscipit aliquam. Proin elementum vestibulum molestie. Curabitur et convallis ipsum, eget consectetur nunc. Vivamus blandit posuere nibh, ut gravida nulla lacinia eget. Proin maximus sollicitudin elit ut pharetra. Praesent vel turpis sodales velit lobortis blandit. Suspendisse commodo consequat dui non porttitor.\r\n\r\nSuspendisse eu lacus cursus libero tempor gravida et at dui. Ut in dui dui. Mauris aliquet at dui ut vehicula. Nullam aliquam, neque quis tincidunt cursus, velit velit fringilla neque, nec maximus mauris elit et lacus. Pellentesque cursus ultricies nulla vitae lobortis. Nam condimentum diam ac justo sollicitudin, eleifend tristique enim pellentesque. Phasellus et tempor orci. Cras aliquam eros et metus lacinia, nec laoreet urna euismod. Ut pretium, justo in accumsan eleifend, ante ligula faucibus elit, eu rutrum urna dolor lacinia magna. Phasellus dolor ligula, ultricies a arcu vel, euismod vestibulum diam. Ut condimentum elit tempor malesuada rutrum. Donec accumsan sapien eget porta congue. Vivamus tellus ipsum, condimentum in finibus id, vulputate viverra eros. Aliquam erat volutpat. Integer non risus nisi. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nSed a lacus nec tortor consectetur semper id vel odio. Cras sed justo consectetur, convallis metus a, varius leo. Donec erat justo, sollicitudin in lorem interdum, venenatis condimentum nunc. Mauris posuere hendrerit justo. Integer dignissim at libero eget dictum. Sed vulputate est in mi gravida iaculis vitae sagittis nisl. Duis in gravida ex. Suspendisse sollicitudin eu nisi ac pulvinar. Sed a dignissim turpis. Donec sit amet egestas diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse vulputate vulputate neque ut feugiat. Sed quis sem orci. Nullam ut luctus sapien, ac laoreet turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ac velit eget metus egestas rhoncus.\r\n\r\nIn hac habitasse platea dictumst. Vivamus dignissim vehicula nisi, nec malesuada arcu sollicitudin eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque facilisis lorem in nisl ultrices sollicitudin. Etiam elementum scelerisque volutpat. Nam id est euismod enim interdum imperdiet. Donec efficitur urna mattis ornare suscipit. Aenean viverra lorem id viverra condimentum. Proin a sem at velit commodo bibendum id eu magna. Suspendisse sagittis felis ante, vitae scelerisque mauris iaculis ac. Proin sed dolor convallis, convallis magna vitae, aliquam turpis. Integer sed massa orci.', 1623122796);

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
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `class` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `class`) VALUES
(1, 'IF-41-01'),
(2, 'IF-41-02'),
(3, 'IF-41-03'),
(4, 'IF-41-04'),
(5, 'IF-41-05'),
(6, 'IF-41-06'),
(7, 'IF-41-07'),
(8, 'IF-41-08'),
(9, 'IF-41-09'),
(10, 'IF-41-10'),
(11, 'IF-41-11'),
(12, 'IF-41-12'),
(13, 'IF-41-INT');

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
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_name` varchar(128) NOT NULL,
  `full_path` varchar(128) NOT NULL,
  `file_ext` varchar(8) NOT NULL,
  `file_size` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`id`, `user_id`, `file_name`, `full_path`, `file_ext`, `file_size`) VALUES
(6, 1, '1301170000_cv8.pdf', 'C:/xampp/htdocs/github/hrms-impal/uploads/1301170000/1301170000_cv8.pdf', '.pdf', '109.96'),
(7, 1, '1301170000_cv.pdf', 'C:/xampp/htdocs/github/hrms-impal/uploads/1301170000/1301170000_cv.pdf', '.pdf', '109.96'),
(8, 0, '1301170000_ml.pdf', 'C:/xampp/htdocs/github/hrms-impal/uploads/1301170000/1301170000_ml.pdf', '.pdf', '109.96');

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
  `class_id` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(1) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `sid`, `class_id`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(1, 'Akmal Ariq Santoso', 'akmal@akmal.akmal', '1301170000', '13', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 1, 1, 1622087704),
(2, 'ariq ariq', 'ariq@ariq.ariq', '1301170001', '13', 'default.jpg', '$2y$10$SaXySmv0QOxyUwEc7xr1D.ZxpJ/MRj/e9RQqo2WygaCuoHg4ae1eC', 3, 1, 1622106366),
(3, 'adrian', 'adrian@adrian.adrian', '1301170002', '13', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 2, 1, 1622106366),
(4, 'anas', 'anas@anas.anas', '1301170003', '13', 'default.jpg', '$2y$10$St0OzSef189HVsyosW9V/ew/jEHrhA5RZhiDgXUZ3rGkAVPNiErZK', 4, 1, 1622106366),
(5, 'angel angel', 'angel@angel.angel', '1301170101', '13', 'default.jpg', '$2y$10$Lz5cbzql205CFceRTbc0VeSsk4cqL2R.8Gk25D228Uy0lyzrjuqqi', 2, 1, 1622453504),
(6, 'sana', 'san@san.san', '1301171234', '13', 'default.jpg', '$2y$10$LsLNGEf33qKL69D5MvO13udrxNpSr2hbLjzbAR/HZfa.zWhDoBWHK', 3, 1, 1623722721),
(12, 'akmal santoso', 'santoso54321@gmail.com', '1301174378', '13', 'default.jpg', '$2y$10$71spVJ/So1DwdCE0y7vMgOtaDOnp0H4z01hBANEs2gSjxI/ZIRiLi', 3, 1, 1623854811);

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
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 2),
(5, 2, 3),
(6, 3, 2),
(7, 3, 3);

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
(2, 'Profile'),
(3, 'Practicum');

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
(2, 'Practicum Assistant'),
(3, 'Candidate');

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
(2, 1, 'Create Announcements', 'admin/create_announcement', 'fas fa-fw fa-bullhorn', 1),
(3, 2, 'My Profile', 'profile', 'fas fa-fw fa-user', 1),
(4, 2, 'Change Password', 'profile/change_password', 'fas fa-fw fa-lock', 1),
(5, 3, 'Assistant Schedule', 'practicum', 'far fa-fw fa-calendar-alt', 1),
(6, 3, 'Announcements', 'practicum/announcements', 'fas fa-fw fa-bullhorn', 1),
(7, 3, 'Recruitment Phase', 'practicum/recruitment', 'fas fa-fw fa-user-plus', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `token` varchar(128) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
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
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=490;

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

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
