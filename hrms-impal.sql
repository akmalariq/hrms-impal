-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2021 at 08:55 AM
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
  `type` varchar(2) NOT NULL,
  `file_name` varchar(128) NOT NULL,
  `full_path` varchar(128) NOT NULL,
  `file_ext` varchar(8) NOT NULL,
  `file_size` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`id`, `user_id`, `type`, `file_name`, `full_path`, `file_ext`, `file_size`) VALUES
(11, 1, 'cv', '1301170000_cv.pdf', 'C:/xampp/htdocs/github/hrms-impal/uploads/1301170000/1301170000_cv.pdf', '.pdf', '109.96'),
(12, 1, 'ml', '1301170000_ml.pdf', 'C:/xampp/htdocs/github/hrms-impal/uploads/1301170000/1301170000_ml.pdf', '.pdf', '109.96'),
(14, 12, 'cv', '1301174378_cv.pdf', 'C:/xampp/htdocs/github/hrms-impal/uploads/1301174378/1301174378_cv.pdf', '.pdf', '109.96'),
(15, 12, 'ml', '1301174378_ml.pdf', 'C:/xampp/htdocs/github/hrms-impal/uploads/1301174378/1301174378_ml.pdf', '.pdf', '109.96');

-- --------------------------------------------------------

--
-- Table structure for table `interview_schedule`
--

CREATE TABLE `interview_schedule` (
  `id` int(11) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `interview_schedule`
--

INSERT INTO `interview_schedule` (`id`, `date`) VALUES
(0, 0),
(1, 1623493800),
(2, 1623501000),
(3, 1623508200);

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
(26, 3, 'Modul 1', 1613331000),
(27, 3, 'Modul 2', 1613935800),
(28, 3, 'Modul 3', 1614540600),
(29, 3, 'Modul 4', 1615145400),
(30, 3, 'Modul 5', 1615750200),
(31, 3, 'Modul 6', 1616355000),
(32, 3, 'Modul 7', 1616959800),
(33, 3, 'Modul 8', 1618774200),
(34, 3, 'Modul 9', 1619379000),
(35, 3, 'Modul 10', 1619983800),
(36, 3, 'Modul 11', 1621798200),
(37, 3, 'Modul 12', 1622403000),
(38, 4, 'Modul 1', 1613331000),
(39, 4, 'Modul 2', 1613935800),
(40, 4, 'Modul 3', 1614540600),
(41, 4, 'Modul 4', 1615145400),
(42, 4, 'Modul 5', 1615750200),
(43, 4, 'Modul 6', 1616355000),
(44, 4, 'Modul 7', 1616959800),
(45, 4, 'Modul 8', 1618774200),
(46, 4, 'Modul 9', 1619379000),
(47, 4, 'Modul 10', 1619983800),
(48, 4, 'Modul 11', 1621798200),
(49, 4, 'Modul 12', 1622403000),
(50, 5, 'Modul 1', 1613331000),
(51, 5, 'Modul 2', 1613935800),
(52, 5, 'Modul 3', 1614540600),
(53, 5, 'Modul 4', 1615145400),
(54, 5, 'Modul 5', 1615750200),
(55, 5, 'Modul 6', 1616355000),
(56, 5, 'Modul 7', 1616959800),
(57, 5, 'Modul 8', 1618774200),
(58, 5, 'Modul 9', 1619379000),
(59, 5, 'Modul 10', 1619983800),
(60, 5, 'Modul 11', 1621798200),
(61, 5, 'Modul 12', 1622403000),
(62, 6, 'Modul 1', 1613331000),
(63, 6, 'Modul 2', 1613935800),
(64, 6, 'Modul 3', 1614540600),
(65, 6, 'Modul 4', 1615145400),
(66, 6, 'Modul 5', 1615750200),
(67, 6, 'Modul 6', 1616355000),
(68, 6, 'Modul 7', 1616959800),
(69, 6, 'Modul 8', 1618774200),
(70, 6, 'Modul 9', 1619379000),
(71, 6, 'Modul 10', 1619983800),
(72, 6, 'Modul 11', 1621798200),
(73, 6, 'Modul 12', 1622403000),
(74, 7, 'Modul 1', 1613331000),
(75, 7, 'Modul 2', 1613935800),
(76, 7, 'Modul 3', 1614540600),
(77, 7, 'Modul 4', 1615145400),
(78, 7, 'Modul 5', 1615750200),
(79, 7, 'Modul 6', 1616355000),
(80, 7, 'Modul 7', 1616959800),
(81, 7, 'Modul 8', 1618774200),
(82, 7, 'Modul 9', 1619379000),
(83, 7, 'Modul 10', 1619983800),
(84, 7, 'Modul 11', 1621798200),
(85, 7, 'Modul 12', 1622403000),
(86, 8, 'Modul 1', 1613331000),
(87, 8, 'Modul 2', 1613935800),
(88, 8, 'Modul 3', 1614540600),
(89, 8, 'Modul 4', 1615145400),
(90, 8, 'Modul 5', 1615750200),
(91, 8, 'Modul 6', 1616355000),
(92, 8, 'Modul 7', 1616959800),
(93, 8, 'Modul 8', 1618774200),
(94, 8, 'Modul 9', 1619379000),
(95, 8, 'Modul 10', 1619983800),
(96, 8, 'Modul 11', 1621798200),
(97, 8, 'Modul 12', 1622403000),
(98, 9, 'Modul 1', 1613331000),
(99, 9, 'Modul 2', 1613935800),
(100, 9, 'Modul 3', 1614540600),
(101, 9, 'Modul 4', 1615145400),
(102, 9, 'Modul 5', 1615750200),
(103, 9, 'Modul 6', 1616355000),
(104, 9, 'Modul 7', 1616959800),
(105, 9, 'Modul 8', 1618774200),
(106, 9, 'Modul 9', 1619379000),
(107, 9, 'Modul 10', 1619983800),
(108, 9, 'Modul 11', 1621798200),
(109, 9, 'Modul 12', 1622403000),
(110, 10, 'Modul 1', 1613331000),
(111, 10, 'Modul 2', 1613935800),
(112, 10, 'Modul 3', 1614540600),
(113, 10, 'Modul 4', 1615145400),
(114, 10, 'Modul 5', 1615750200),
(115, 10, 'Modul 6', 1616355000),
(116, 10, 'Modul 7', 1616959800),
(117, 10, 'Modul 8', 1618774200),
(118, 10, 'Modul 9', 1619379000),
(119, 10, 'Modul 10', 1619983800),
(120, 10, 'Modul 11', 1621798200),
(121, 10, 'Modul 12', 1622403000),
(122, 11, 'Modul 1', 1613331000),
(123, 11, 'Modul 2', 1613935800),
(124, 11, 'Modul 3', 1614540600),
(125, 11, 'Modul 4', 1615145400),
(126, 11, 'Modul 5', 1615750200),
(127, 11, 'Modul 6', 1616355000),
(128, 11, 'Modul 7', 1616959800),
(129, 11, 'Modul 8', 1618774200),
(130, 11, 'Modul 9', 1619379000),
(131, 11, 'Modul 10', 1619983800),
(132, 11, 'Modul 11', 1621798200),
(133, 11, 'Modul 12', 1622403000),
(134, 12, 'Modul 1', 1613331000),
(135, 12, 'Modul 2', 1613935800),
(136, 12, 'Modul 3', 1614540600),
(137, 12, 'Modul 4', 1615145400),
(138, 12, 'Modul 5', 1615750200),
(139, 12, 'Modul 6', 1616355000),
(140, 12, 'Modul 7', 1616959800),
(141, 12, 'Modul 8', 1618774200),
(142, 12, 'Modul 9', 1619379000),
(143, 12, 'Modul 10', 1619983800),
(144, 12, 'Modul 11', 1621798200),
(145, 12, 'Modul 12', 1622403000);

-- --------------------------------------------------------

--
-- Table structure for table `recruitment`
--

CREATE TABLE `recruitment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `cv_id` int(11) NOT NULL,
  `ml_id` int(11) NOT NULL,
  `phase` int(11) NOT NULL,
  `written_id` int(11) NOT NULL,
  `interview_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recruitment`
--

INSERT INTO `recruitment` (`id`, `user_id`, `course_id`, `cv_id`, `ml_id`, `phase`, `written_id`, `interview_id`) VALUES
(15, 6, 1, 0, 0, 3, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `modul_id` int(11) NOT NULL,
  `complain` text NOT NULL,
  `attend` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `user_id`, `modul_id`, `complain`, `attend`) VALUES
(532, 6, 110, '', 1),
(533, 6, 111, '', 0),
(534, 6, 112, '', 0),
(535, 6, 113, '', 0),
(536, 6, 114, '', 0),
(537, 6, 115, '', 0),
(538, 6, 116, '', 0),
(539, 6, 117, '', 0),
(540, 6, 118, '', 0),
(541, 6, 119, '', 0),
(542, 6, 120, '', 0),
(543, 6, 121, '', 0),
(544, 3, 1, '', 1),
(545, 3, 2, '', 0),
(546, 3, 3, '', 0),
(547, 3, 4, '', 0),
(548, 3, 5, '', 0),
(549, 3, 6, '', 0),
(550, 3, 7, '', 0),
(551, 3, 8, '', 0),
(552, 3, 9, '', 0),
(553, 3, 10, '', 0),
(554, 3, 11, '', 0),
(555, 3, 12, '', 0);

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
(12, 'akmal santoso', 'santoso@gmail.com', '1301174379', '13', 'default.jpg', '$2y$10$71spVJ/So1DwdCE0y7vMgOtaDOnp0H4z01hBANEs2gSjxI/ZIRiLi', 2, 1, 1623854811),
(13, 'akmal santoso', 'santoso54321@gmail.com', '1301174378', '13', 'default.jpg', '$2y$10$TbFaiMbtzqv7pBYELAmPOulpFNj.iEqUdRcRXaVMouh8FfPLg.Gtu', 3, 1, 1623910175);

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
(7, 3, 'Recruitment Phase', 'practicum/recruitment', 'fas fa-fw fa-user-plus', 1),
(8, 1, 'Recruits', 'admin/recruits', 'fas fa-fw fa-users', 1);

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

-- --------------------------------------------------------

--
-- Table structure for table `written_test_schedule`
--

CREATE TABLE `written_test_schedule` (
  `id` int(11) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `written_test_schedule`
--

INSERT INTO `written_test_schedule` (`id`, `date`) VALUES
(0, 0),
(1, 1623493800),
(2, 1623501000),
(3, 1623508200);

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
-- Indexes for table `interview_schedule`
--
ALTER TABLE `interview_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recruitment`
--
ALTER TABLE `recruitment`
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
-- Indexes for table `written_test_schedule`
--
ALTER TABLE `written_test_schedule`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `interview_schedule`
--
ALTER TABLE `interview_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `modul`
--
ALTER TABLE `modul`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `recruitment`
--
ALTER TABLE `recruitment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=556;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `written_test_schedule`
--
ALTER TABLE `written_test_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
