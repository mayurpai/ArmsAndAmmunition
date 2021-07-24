-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2021 at 02:19 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `armsandammunition`
--

-- --------------------------------------------------------

--
-- Table structure for table `ammos`
--

CREATE TABLE `ammos` (
  `Aname` varchar(50) NOT NULL,
  `Adiameter` varchar(20) NOT NULL,
  `Alength` varchar(20) NOT NULL,
  `Aweight` varchar(20) NOT NULL,
  `Manufactid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ammos`
--

INSERT INTO `ammos` (`Aname`, `Adiameter`, `Alength`, `Aweight`, `Manufactid`) VALUES
('.45 ACP', '.45 in', '22.8 mm', '15 g', 1),
('0.44', '.429 in', '32.6 mm', '16 g', 2),
('0.44', '.500 in', '32.6 mm', '16 g', 3),
('9mm', '9.01 mm', '32.6 mm', '7 g', 4),
('9mm', '9.01 mm', '32.6 mm', '7 g', 5),
('9mm', '9.01 mm', '32.6 mm', '7 g', 6),
('7.62mm', '7.92mm', '25 mm', '5.5 g', 7),
('9mm', '9.01 mm', '32.6 mm', '7 g', 8),
('9mm', '9.01 mm', '32.6 mm', '7 g', 9),
('9mm', '9.01 mm', '32.6 mm', '7 g', 10),
('9mm', '9.01 mm', '32.6 mm', '7 g', 11),
('5.7mm', '5.7mm', '28.9 mm', '6 g', 12),
('9mm', '9.01 mm', '32.6 mm', '7 g', 13),
('9mm', '9.01 mm', '32.6 mm', '7 g', 14),
('9mm', '9.01 mm', '32.6 mm', '7 g', 15),
('9mm', '9.01 mm', '32.6 mm', '7 g', 16),
('9mm', '9.01 mm', '32.6 mm', '7 g', 17),
('9mm', '7.92 mm', '25 mm', '5.5 g', 18),
('9mm', '9.01 mm', '32.6 mm', '7 g', 19),
('10mm', '9.01 mm', '32.6 mm', '7 g', 20),
('7.62x39mm', '7.85 mm', '38.7 mm', '7.9 g', 21),
('.30 carbine', '.308 in', '32.8 mm', '7.1 g', 22),
('5.56x45mm', '5.7 mm', '44.7 mm', '4 g', 23),
('5.56x45mm NATO', '5.7 mm', '44.7 mm', '4 g', 24),
('5.56x45mm', '5.7 mm', '44.7 mm', '4 g', 25),
('7.62x39mm', '7.85 mm', '38.7 mm', '7.9 g', 26),
('7.62x45 NATO', '7.83 mm', '45 mm', '8 g', 27),
('5.56x45mm NATO', '5.7 mm', '44.7 mm', '4 g', 28),
('7.62x39mm', '7.85 mm', '38.7 mm', '7.9 g', 29),
('5.56x45mm NATO', '5.7 mm', '44.7 mm', '4 g', 30),
('7.62x51mm NATO', '.308 in', '51.2 mm', '9.5 g', 31),
('.300 Winchester magnum', '.308 in', '67 mm', '9 g', 32),
('7.62x57mm mauser', '8.22 mm', '57 mm', '9.9 g', 33),
('7.62x51 NATO / .308 Winchester', '.308 in', '51.2 mm', '9.5 g', 34),
('.416 Barrett / .50 BMG', '.416 in', '83 mm', '27.5 g', 35),
('7.62x51mm NATO', '.308 in', '51.2 mm', '9.5 g', 36),
('.416 Barrett / .50 BMG', '.416 in', '83 mm', '27.5 g', 37),
('5.56x45mm NATO', '5.7 mm', '44.7 mm', '4 g', 38);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `Cname` varchar(50) NOT NULL,
  `Clocation` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`Cname`, `Clocation`) VALUES
('Austria', 'Central Europe'),
('Belgium', 'Western Europe'),
('China', 'East Asia'),
('Croatia', 'Southeast Europe'),
('Czech Republic', 'Central Europe'),
('England', 'United Kingdom'),
('France', 'Western Europe'),
('Germany', 'Western Europe'),
('India', 'New Delhi'),
('Israel', 'Western Asia'),
('Italy', 'Western Europe'),
('Poland', 'Central Europe'),
('Russia', 'Eastern Europe'),
('South Korea', 'East Aisa'),
('Spain', 'South Western Europe'),
('Taipei', 'Taiwan'),
('United Kingdom', 'United Kingdom'),
('United States', 'North America');

-- --------------------------------------------------------

--
-- Table structure for table `equip`
--

CREATE TABLE `equip` (
  `Weaponid` int(10) NOT NULL,
  `Userid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equip`
--

INSERT INTO `equip` (`Weaponid`, `Userid`) VALUES
(10, 1),
(10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `Mid` int(10) NOT NULL,
  `Mname` varchar(50) NOT NULL,
  `Maddress` varchar(50) NOT NULL,
  `Memail` varchar(50) NOT NULL,
  `Countryname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`Mid`, `Mname`, `Maddress`, `Memail`, `Countryname`) VALUES
(1, 'Colt\'s Manufacturing Company, LLC', 'West Hartford, Connecticut, United States', '', 'United States'),
(2, 'Smith & Wesson Brands, Inc.', ' Springfield, Massachusetts, United States', '', 'United States'),
(3, 'Magnum Research Inc.', 'Minnesota, United States', '', 'United States'),
(4, 'Glock Ges.m.b.H.', 'Deutsch-Wagram, Austria', '', 'Austria'),
(5, 'HS Produkt', 'Karlovac, Croatia', '', 'Croatia'),
(6, 'Heckler & Koch GmbH', 'Oberndorf, Germany', '', 'Germany'),
(7, 'Tula Arms Plant', 'Tula, Russia', '', 'Russia'),
(8, 'Carl Walther GmbH Sportwaffen', 'Ulm, Germany', '', 'Germany'),
(9, 'Fabbrica d\'Armi Pietro Beretta', 'Gardone Val Trompia BS', '', 'Italy'),
(10, 'Kel-Tec CNC Industries Inc.', 'Cocoa, Florida, United States', '', 'United States'),
(11, 'SIG Sauer GmbH', 'Eckernförde, Germany', '', 'Germany'),
(12, 'FN Herstal', 'Herstal, Belgium', '', 'Belgium'),
(13, 'Steyr Arms GmbH', 'Kleinraming, Austria', '', 'Austria'),
(14, 'Vyatskiye Polyany Machine-Building Plant', 'Vyatskiye Polyany, Russia', '', 'Russia'),
(15, 'Ceska zbrojovka a.s. Uhersky Brod', 'Uhersky Brod, Czechia', '', 'Czech Republic'),
(16, 'Military Armament Corporation', 'United States ', '', 'United States'),
(17, 'C.G. Haenel', 'Suhl, Germany', '', 'Germany'),
(18, 'Nationale d\'Armes de Tulle', 'Tulle, France', '', 'France'),
(19, 'JSC Kalashnikov Concern', 'Khamovniki District, Moscow', '', 'Russia'),
(20, 'Kriss USA, Inc', '912 Corporate Ln, Chesapeake, VA 23320', '', 'United States'),
(21, 'Norinco', 'Xicheng District, Beijing, China', '', 'China'),
(22, 'Kahr\'s state-of-the-art manufacturing plant', 'United States', '', 'United States'),
(23, 'S&T Motiv Co., Ltd', 'Busan, South Korea', '', 'South Korea'),
(24, 'Nexter Systems', 'France', '', 'France'),
(25, 'Royal Ordnance plc', 'Farnborough, United Kingdom', '', 'England'),
(26, 'Fabryka Broni \"Lucznik\" - Radom', 'Aleksego Grobickiego 23, 26-617 Radom', '', 'Poland'),
(27, 'Israel Military Industries', 'Ramat Hasharon, Israel', '', 'Israel'),
(28, 'Armament Research & Development Establishment', 'Pune', '', 'India'),
(29, 'TsKIB SOO', 'Tula, Russia', '', 'Russia'),
(30, '205th Arsenal', 'Kaohsiung', '', 'Taipei'),
(31, 'Remington Arms Company, LLC', 'Huntsville, Alabama, United States', '', 'United States'),
(32, 'Accuracy International', 'Portsmouth, United Kingdom', '', 'United Kingdom'),
(33, 'Mauser', 'Isny im Allgäu, Germany', '', 'Germany'),
(34, 'Tactical Operations Inc.', 'Beverly Hills, California', '', 'United States'),
(35, 'Barrett Firearms Company', 'Murfreesboro, Tennessee, United States', '', 'United States'),
(36, 'Naval Surface Warfare Center Crane Division', '300 Highway 361, Crane', '', 'United States'),
(37, 'Desert Tech', 'West Valley City, Utah, United States', '', 'United States'),
(38, 'Textron Marine & Land Systems', 'Slidell, Louisiana, United States', '', 'United States');

-- --------------------------------------------------------

--
-- Table structure for table `sellsto`
--

CREATE TABLE `sellsto` (
  `Manufactureid` int(10) NOT NULL,
  `Vendorid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sellsto`
--

INSERT INTO `sellsto` (`Manufactureid`, `Vendorid`) VALUES
(28, 1);

-- --------------------------------------------------------

--
-- Table structure for table `trig`
--

CREATE TABLE `trig` (
  `Triggerid` int(10) NOT NULL,
  `Wid` int(10) NOT NULL,
  `Wname` varchar(20) NOT NULL,
  `Wtype` varchar(40) NOT NULL,
  `Wlicense` int(20) NOT NULL,
  `Action` varchar(30) NOT NULL,
  `Time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trig`
--

INSERT INTO `trig` (`Triggerid`, `Wid`, `Wname`, `Wtype`, `Wlicense`, `Action`, `Time`) VALUES
(10, 1, 'Colt 1911', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 17:03:58'),
(11, 2, 'Magnum', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 17:50:05'),
(12, 25, 'Thompson M1921', 'Sub-Machine gun', 0, 'Weapon Inserted!', '2021-01-01 17:55:54'),
(13, 34, 'Colt 9mm SMG', 'Sub-Machine gun', 0, 'Weapon Inserted!', '2021-01-01 17:55:54'),
(14, 45, 'M16A1', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 17:55:54'),
(15, 46, 'M16A2', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 17:55:54'),
(16, 47, 'M16A4', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 17:55:54'),
(17, 62, 'M4A1', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 17:55:54'),
(18, 65, 'T91', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 17:57:20'),
(19, 68, 'Accuracy Internation', 'Sniper Rifle', 0, 'Weapon Inserted!', '2021-01-01 17:58:17'),
(20, 61, 'INSAS', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 17:59:00'),
(21, 72, 'Barrett M82', 'Sniper Rifle', 0, 'Weapon Inserted!', '2021-01-01 17:59:36'),
(22, 26, 'MP 40', 'Sub-Machine gun', 0, 'Weapon Inserted!', '2021-01-01 18:01:39'),
(23, 40, 'Sturmgewehr 44', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:01:39'),
(24, 10, 'Walther Q4 Steel', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:02:30'),
(25, 11, 'CZ 75', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:03:48'),
(26, 21, 'Skorpion vz. 61', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:03:48'),
(27, 27, 'Sa vz. 23 (CZ 25)', 'Sub-Machine gun', 0, 'Weapon Inserted!', '2021-01-01 18:03:48'),
(28, 75, 'Desert Tech Stealth ', 'Sniper Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:05:25'),
(29, 76, 'Desert Tech Hard Tar', 'Sniper Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:05:25'),
(30, 13, 'Beretta M9', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:07:02'),
(31, 29, 'Beretta M12', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:07:02'),
(32, 56, 'Beretta ARX160', 'Sub-Machine gun', 0, 'Weapon Inserted!', '2021-01-01 18:07:02'),
(33, 57, 'FB Beryl', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:07:36'),
(34, 18, 'FN Five Seven', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:09:52'),
(35, 31, 'UZI', 'Sub-Machine gun', 0, 'Weapon Inserted!', '2021-01-01 18:09:52'),
(36, 37, 'FN P90', 'Sub-Machine gun', 0, 'Weapon Inserted!', '2021-01-01 18:09:52'),
(37, 55, 'FN F2000', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:09:52'),
(38, 58, 'FN SCAR', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:09:52'),
(39, 5, 'Glock 19', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:10:20'),
(40, 7, 'Heckler & Koch USP', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:11:09'),
(41, 12, 'Heckler & Koch VP9', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:14:04'),
(42, 16, 'Heckler & Koch P2000', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:14:04'),
(43, 23, 'Heckler & Koch MP5K', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:14:04'),
(44, 30, 'Heckler & Koch MP5', 'Sub-Machine gun', 0, 'Weapon Inserted!', '2021-01-01 18:14:04'),
(45, 32, 'Heckler & Koch UMP', 'Sub-Machine gun', 0, 'Weapon Inserted!', '2021-01-01 18:14:04'),
(46, 38, 'Heckler & Koch MP7', 'Sub-Machine gun', 0, 'Weapon Inserted!', '2021-01-01 18:14:04'),
(47, 44, 'Heckler & Koch G3', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:14:04'),
(48, 48, 'Heckler & Koch HK33', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:14:04'),
(49, 59, 'Heckler & Koch HK416', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:14:04'),
(50, 66, 'Heckler & Koch G36', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:14:04'),
(51, 6, 'Springfield XDM elit', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:14:38'),
(52, 6, 'Springfield XDM elit', 'Handgun', 0, 'Weapon Info Updated!', '2021-01-01 18:15:15'),
(53, 6, 'Springfield XDM elit', 'Handgun', 0, 'Weapon Info Updated!', '2021-01-01 18:15:21'),
(54, 60, 'IMI Galil', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:16:10'),
(55, 35, 'Vityaz-SN', 'Sub-Machine gun', 0, 'Weapon Inserted!', '2021-01-01 18:18:57'),
(56, 39, 'Pistolet Pulemyot-19', 'Sub-Machine gun', 0, 'Weapon Inserted!', '2021-01-01 18:18:57'),
(57, 41, 'Avtomat Kalashnikova', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:18:57'),
(58, 49, 'AK-74', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:18:57'),
(59, 43, 'M1 carbine', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:19:39'),
(60, 14, 'Kel-Tec P-11', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:20:49'),
(61, 36, 'Kriss Vector', 'Sub-Machine gun', 0, 'Weapon Inserted!', '2021-01-01 18:20:49'),
(62, 4, 'MK19T', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:22:26'),
(63, 15, 'Desert Eagle', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:22:26'),
(64, 69, 'Karabiner 98k', 'Sniper Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:22:59'),
(65, 22, 'MAC-11', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:24:13'),
(66, 33, 'MAC-10', 'Sub-Machine gun', 0, 'Weapon Inserted!', '2021-01-01 18:24:13'),
(67, 28, 'MAT-49', 'Sub-Machine gun', 0, 'Weapon Inserted!', '2021-01-01 18:25:04'),
(68, 74, 'Mk 14 Enhanced', 'Sniper Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:26:17'),
(69, 52, 'FAMAS F1', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:26:49'),
(70, 42, 'Chinese Type 56', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:27:37'),
(71, 54, 'QBZ-95', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:27:37'),
(72, 67, 'M24', 'Sniper Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:29:00'),
(73, 70, 'M40', 'Sniper Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:29:00'),
(74, 73, 'Remington MSR', 'Sniper Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:29:00'),
(75, 53, 'SA80-A2', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:29:30'),
(76, 50, 'Daewoo K1A', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:30:07'),
(77, 17, 'SIG Sauer P320', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:30:34'),
(78, 3, 'M29s magnum', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:31:13'),
(79, 8, 'M&P Shield 2.0', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:31:13'),
(80, 19, 'Steyr M1912 / P12', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:32:54'),
(81, 24, 'Steyr TMP', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:32:54'),
(82, 51, 'Steyr AUG', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:32:54'),
(83, 71, 'Tango 51', 'Sniper Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:36:15'),
(84, 64, 'Stoner 63', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:36:15'),
(85, 63, 'Ots-14 Groza', 'Assault Rifle', 0, 'Weapon Inserted!', '2021-01-01 18:36:15'),
(86, 9, 'Tula Tokarev', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:36:15'),
(87, 20, 'Stechkin APS', 'Handgun', 0, 'Weapon Inserted!', '2021-01-01 18:36:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Uid` int(10) NOT NULL,
  `Uname` varchar(100) NOT NULL,
  `Uwing` varchar(50) NOT NULL,
  `Upass` varchar(100) NOT NULL,
  `Vendid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Uid`, `Uname`, `Uwing`, `Upass`, `Vendid`) VALUES
(1, 'Mayur', 'A', 'pbkdf2:sha256:150000$5ZZ1aUD1$a1d5bc2b8b36af00738d89682f2f5bdd1b0e869270c76fdc7a31e1aae1f5ead1', 1),
(2, 'Krishna', 'C', 'pbkdf2:sha256:150000$T7zDpic9$10b4f937655fd39cec0981f2092ff155a4e3e9ee5d9d2e50801871fb144a9a4d', 1),
(3, 'Maithri', 'B', 'pbkdf2:sha256:150000$Q19GUaWj$5596ef053be4e1398c76d807eae16cbf6d753a34d3fa50cf5bb0789a81c774a6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `Vid` int(10) NOT NULL,
  `Vname` varchar(20) NOT NULL,
  `Vemail` varchar(50) NOT NULL,
  `Vaddress` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`Vid`, `Vname`, `Vemail`, `Vaddress`) VALUES
(1, 'Manoj', 'manojkumar1@gmail.com', 'Mangalore');

-- --------------------------------------------------------

--
-- Table structure for table `weapons`
--

CREATE TABLE `weapons` (
  `Wid` int(10) NOT NULL,
  `Wname` varchar(40) NOT NULL,
  `Wtype` varchar(40) NOT NULL,
  `Wlicense` varchar(20) NOT NULL,
  `Manid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `weapons`
--

INSERT INTO `weapons` (`Wid`, `Wname`, `Wtype`, `Wlicense`, `Manid`) VALUES
(1, 'Colt 1911', 'Handgun', '', 1),
(2, 'Magnum', 'Handgun', '', 1),
(3, 'M29s magnum', 'Handgun', '', 2),
(4, 'MK19T', 'Handgun', '', 3),
(5, 'Glock 19', 'Handgun', '', 4),
(6, 'Springfield XDM elite', 'Handgun', '', 5),
(7, 'Heckler & Koch USP', 'Handgun', '', 6),
(8, 'M&P Shield 2.0', 'Handgun', '', 1),
(9, 'Tula Tokarev', 'Handgun', '', 7),
(10, 'Walther Q4 Steel', 'Handgun', '', 8),
(11, 'CZ 75', 'Handgun', '', 15),
(12, 'Heckler & Koch VP9', 'Handgun', '', 6),
(13, 'Beretta M9', 'Handgun', '', 9),
(14, 'Kel-Tec P-11', 'Handgun', '', 10),
(15, 'Desert Eagle', 'Handgun', '', 3),
(16, 'Heckler & Koch P2000', 'Handgun', '', 6),
(17, 'SIG Sauer P320', 'Handgun', '', 11),
(18, 'FN Five Seven', 'Handgun', '', 12),
(19, 'Steyr M1912 / P12', 'Handgun', '', 13),
(20, 'Stechkin APS', 'Handgun', '', 14),
(21, 'Skorpion vz. 61', 'Handgun', '', 15),
(22, 'MAC-11', 'Handgun', '', 16),
(23, 'Heckler & Koch MP5K', 'Handgun', '', 6),
(24, 'Steyr TMP', 'Handgun', '', 13),
(25, 'Thompson M1921', 'Sub-Machine gun', '', 1),
(26, 'MP 40', 'Sub-Machine gun', '', 17),
(27, 'Sa vz. 23 (CZ 25)', 'Sub-Machine gun', '', 15),
(28, 'MAT-49', 'Sub-Machine gun', '', 18),
(29, 'Beretta M12', 'Assault Rifle', '', 9),
(30, 'Heckler & Koch MP5', 'Sub-Machine gun', '', 6),
(31, 'UZI', 'Sub-Machine gun', '', 12),
(32, 'Heckler & Koch UMP', 'Sub-Machine gun', '', 6),
(33, 'MAC-10', 'Sub-Machine gun', '', 16),
(34, 'Colt 9mm SMG', 'Sub-Machine gun', '', 1),
(35, 'Vityaz-SN', 'Sub-Machine gun', '', 19),
(36, 'Kriss Vector', 'Sub-Machine gun', '', 20),
(37, 'FN P90', 'Sub-Machine gun', '', 12),
(38, 'Heckler & Koch MP7', 'Sub-Machine gun', '', 6),
(39, 'Pistolet Pulemyot-19 Bizon', 'Sub-Machine gun', '', 19),
(40, 'Sturmgewehr 44', 'Assault Rifle', '', 17),
(41, 'Avtomat Kalashnikova (AK-47)', 'Assault Rifle', '', 19),
(42, 'Chinese Type 56', 'Assault Rifle', '', 21),
(43, 'M1 carbine', 'Assault Rifle', '', 22),
(44, 'Heckler & Koch G3', 'Assault Rifle', '', 6),
(45, 'M16A1', 'Assault Rifle', '', 1),
(46, 'M16A2', 'Assault Rifle', '', 1),
(47, 'M16A4', 'Assault Rifle', '', 1),
(48, 'Heckler & Koch HK33', 'Assault Rifle', '', 6),
(49, 'AK-74', 'Assault Rifle', '', 19),
(50, 'Daewoo K1A', 'Assault Rifle', '', 23),
(51, 'Steyr AUG', 'Assault Rifle', '', 13),
(52, 'FAMAS F1', 'Assault Rifle', '', 24),
(53, 'SA80-A2', 'Assault Rifle', '', 25),
(54, 'QBZ-95', 'Assault Rifle', '', 21),
(55, 'FN F2000', 'Assault Rifle', '', 12),
(56, 'Beretta ARX160', 'Sub-Machine gun', '', 9),
(57, 'FB Beryl', 'Assault Rifle', '', 26),
(58, 'FN SCAR', 'Assault Rifle', '', 12),
(59, 'Heckler & Koch HK416', 'Assault Rifle', '', 6),
(60, 'IMI Galil', 'Assault Rifle', '', 27),
(61, 'INSAS', 'Assault Rifle', '', 28),
(62, 'M4A1', 'Assault Rifle', '', 1),
(63, 'Ots-14 Groza', 'Assault Rifle', '', 29),
(64, 'Stoner 63', 'Assault Rifle', '', 38),
(65, 'T91', 'Assault Rifle', '', 30),
(66, 'Heckler & Koch G36', 'Assault Rifle', '', 6),
(67, 'M24', 'Sniper Rifle', '', 31),
(68, 'Accuracy Internation', 'Sniper Rifle', '', 32),
(69, 'Karabiner 98k', 'Sniper Rifle', '', 33),
(70, 'M40', 'Sniper Rifle', '', 31),
(71, 'Tango 51', 'Sniper Rifle', '', 34),
(72, 'Barrett M82', 'Sniper Rifle', '', 35),
(73, 'Remington MSR', 'Sniper Rifle', '', 31),
(74, 'Mk 14 Enhanced', 'Sniper Rifle', '', 36),
(75, 'Desert Tech Stealth ', 'Sniper Rifle', '', 37),
(76, 'Desert Tech Hard Tar', 'Sniper Rifle', '', 37);

--
-- Triggers `weapons`
--
DELIMITER $$
CREATE TRIGGER `weaponDeletion` BEFORE DELETE ON `weapons` FOR EACH ROW INSERT INTO trig VALUES(null,OLD.Wid,OLD.Wname,OLD.Wtype,OLD.Wlicense,'Weapon Deleted!',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `weaponInsertion` AFTER INSERT ON `weapons` FOR EACH ROW INSERT INTO trig 
VALUES (null,NEW.Wid,NEW.Wname,NEW.Wtype,NEW.Wlicense,'Weapon Inserted!',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `weaponUpdation` AFTER UPDATE ON `weapons` FOR EACH ROW INSERT INTO trig 
VALUES (null,NEW.Wid,NEW.Wname,NEW.Wtype,NEW.Wlicense,'Weapon Info Updated!',NOW())
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ammos`
--
ALTER TABLE `ammos`
  ADD PRIMARY KEY (`Manufactid`),
  ADD KEY `Manufactid` (`Manufactid`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`Cname`);

--
-- Indexes for table `equip`
--
ALTER TABLE `equip`
  ADD KEY `Weaponid` (`Weaponid`),
  ADD KEY `Userid` (`Userid`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`Mid`),
  ADD KEY `Countryname` (`Countryname`);

--
-- Indexes for table `sellsto`
--
ALTER TABLE `sellsto`
  ADD KEY `Manufactureid` (`Manufactureid`),
  ADD KEY `Vendorid` (`Vendorid`);

--
-- Indexes for table `trig`
--
ALTER TABLE `trig`
  ADD PRIMARY KEY (`Triggerid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Uid`),
  ADD KEY `Vendid` (`Vendid`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`Vid`);

--
-- Indexes for table `weapons`
--
ALTER TABLE `weapons`
  ADD PRIMARY KEY (`Wid`),
  ADD KEY `Manid` (`Manid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `trig`
--
ALTER TABLE `trig`
  MODIFY `Triggerid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `Vid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ammos`
--
ALTER TABLE `ammos`
  ADD CONSTRAINT `Manufactid` FOREIGN KEY (`Manufactid`) REFERENCES `manufacturers` (`Mid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `equip`
--
ALTER TABLE `equip`
  ADD CONSTRAINT `Userid` FOREIGN KEY (`Userid`) REFERENCES `users` (`Uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Weaponid` FOREIGN KEY (`Weaponid`) REFERENCES `weapons` (`Wid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD CONSTRAINT `Countryname` FOREIGN KEY (`Countryname`) REFERENCES `country` (`Cname`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sellsto`
--
ALTER TABLE `sellsto`
  ADD CONSTRAINT `Manufactureid` FOREIGN KEY (`Manufactureid`) REFERENCES `manufacturers` (`Mid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Vendorid` FOREIGN KEY (`Vendorid`) REFERENCES `vendors` (`Vid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `Vendid` FOREIGN KEY (`Vendid`) REFERENCES `vendors` (`Vid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `weapons`
--
ALTER TABLE `weapons`
  ADD CONSTRAINT `Manid` FOREIGN KEY (`Manid`) REFERENCES `manufacturers` (`Mid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;