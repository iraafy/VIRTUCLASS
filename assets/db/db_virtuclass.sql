-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2022 at 03:17 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_virtuclass`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `email`, `password`) VALUES
(1, 'admin1', 'admin1@mail.com', 'admin1'),
(2, 'admin2', 'admin2@mail.com', 'admin2');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id_course` int(11) NOT NULL,
  `nama_course` varchar(100) NOT NULL,
  `url_bg` varchar(255) NOT NULL,
  `desc_course` varchar(255) NOT NULL,
  `id_kelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id_course`, `nama_course`, `url_bg`, `desc_course`, `id_kelas`) VALUES
(1, 'Matematika', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum', 2),
(2, 'Matematika', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum', 3),
(3, 'Matematika', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum', 5),
(4, 'Fisika', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum', 2),
(5, 'Fisika', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum', 3),
(6, 'Fisika', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum', 5),
(7, 'Kimia', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum', 2),
(8, 'Kimia', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum', 3),
(9, 'Kimia', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum', 5),
(10, 'Inggris', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum', 2),
(11, 'Inggris', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum', 3),
(12, 'Inggris', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum', 5);

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id_guru` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id_guru`, `nama`, `email`, `password`) VALUES
(1, 'Budiman', 'budiman@mail.com', 'budiman');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`) VALUES
(2, 'X'),
(3, 'XI'),
(5, 'XII');

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE `modul` (
  `id_modul` int(11) NOT NULL,
  `nama_modul` varchar(255) NOT NULL,
  `id_course` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `modul`
--

INSERT INTO `modul` (`id_modul`, `nama_modul`, `id_course`) VALUES
(1, 'Narative Text', 10),
(2, 'Recount Text', 10),
(3, 'Descriptive Text', 10),
(4, 'Narative Text', 11),
(5, 'Recount Text', 11),
(6, 'Descriptive Text', 11),
(7, 'Narative Text', 12),
(8, 'Recount Text', 12),
(9, 'Descriptive Text', 12),
(10, 'SPLDV', 1),
(11, 'SPLDV', 2),
(12, 'SPLDV', 3),
(13, 'Statistika', 1),
(14, 'Statistika', 2),
(15, 'Statistika', 3),
(16, 'Trigonometri', 1),
(17, 'Trigonometri', 2),
(18, 'Trigonometri', 3),
(21, 'amnmas', 11);

-- --------------------------------------------------------

--
-- Table structure for table `record_siswa`
--

CREATE TABLE `record_siswa` (
  `id_record` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nilai` float NOT NULL,
  `kategori_nilai` enum('UTS','UAS','PHB') NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_course` int(11) NOT NULL,
  `bukti_nilai` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `record_siswa`
--

INSERT INTO `record_siswa` (`id_record`, `tanggal`, `nilai`, `kategori_nilai`, `id_siswa`, `id_course`, `bukti_nilai`) VALUES
(1, '2022-06-18', 90, 'UTS', 6, 2, 'bukti_raport.jpg'),
(2, '2022-11-15', 65, 'UAS', 6, 2, 'bukti_raport.jpg'),
(3, '2022-08-17', 78, 'UTS', 5, 3, 'bukti_raport.jpg'),
(4, '2022-04-19', 93, 'UAS', 2, 2, 'bukti_raport.jpg'),
(5, '2023-02-13', 68, 'UAS', 2, 2, 'bukti_raport.jpg'),
(6, '2023-03-15', 88, 'PHB', 3, 3, 'bukti_raport.jpg'),
(7, '2023-02-13', 93, 'UTS', 2, 3, 'bukti_raport.jpg'),
(9, '2022-10-16', 99, 'UTS', 1, 2, 'bukti_raport.jpg'),
(11, '2023-02-13', 65, 'UAS', 4, 2, 'bukti_raport.jpg'),
(13, '2023-02-13', 96, 'UAS', 2, 2, 'bukti_raport.jpg'),
(14, '2023-03-15', 91, 'PHB', 6, 2, 'bukti_raport.jpg'),
(19, '2022-05-23', 84, 'UAS', 7, 9, 'ede3c5aeecf897156e0b4103657850bf-Abighailllllll-bukti_raport.jpg'),
(20, '2022-09-20', 40, 'PHB', 7, 2, 'bukti_raport.jpg'),
(21, '2024-02-12', 62, 'PHB', 5, 3, 'bukti_raport.jpg'),
(22, '2024-01-13', 55, 'PHB', 6, 10, 'bukti_raport.jpg'),
(23, '2023-06-17', 64, 'PHB', 5, 3, 'bukti_raport.jpg'),
(24, '2022-06-22', 89, 'PHB', 3, 5, 'bukti_raport.jpg'),
(25, '2023-09-15', 70, 'UAS', 4, 1, 'bukti_raport.jpg'),
(26, '2022-04-23', 82, 'UTS', 7, 4, 'bukti_raport.jpg'),
(27, '2023-07-17', 49, 'UAS', 2, 2, 'bukti_raport.jpg'),
(28, '2022-05-23', 96, 'UTS', 4, 5, 'bukti_raport.jpg'),
(29, '2021-05-28', 46, 'UAS', 5, 2, 'bukti_raport.jpg'),
(30, '2022-06-22', 63, 'PHB', 4, 4, 'bukti_raport.jpg'),
(31, '2023-04-18', 69, 'PHB', 4, 8, 'bukti_raport.jpg'),
(32, '2022-01-23', 46, 'UTS', 2, 3, 'bukti_raport.jpg'),
(33, '2023-01-18', 89, 'UTS', 2, 2, 'bukti_raport.jpg'),
(34, '2023-11-14', 58, 'UAS', 1, 11, 'bukti_raport.jpg'),
(35, '2021-09-25', 44, 'UTS', 6, 9, 'bukti_raport.jpg'),
(36, '2023-01-18', 57, 'PHB', 1, 10, 'bukti_raport.jpg'),
(37, '2022-07-22', 44, 'UTS', 7, 9, 'bukti_raport.jpg'),
(38, '2023-12-14', 77, 'UTS', 1, 5, 'bukti_raport.jpg'),
(39, '2022-01-23', 92, 'UAS', 6, 6, 'bukti_raport.jpg'),
(40, '2021-07-27', 59, 'UAS', 7, 4, 'bukti_raport.jpg'),
(41, '2022-11-19', 95, 'UTS', 6, 11, 'bukti_raport.jpg'),
(42, '2021-06-27', 68, 'UAS', 5, 7, 'bukti_raport.jpg'),
(43, '2023-08-16', 57, 'UAS', 1, 12, 'bukti_raport.jpg'),
(44, '2023-05-18', 99, 'UAS', 4, 11, 'bukti_raport.jpg'),
(45, '2024-03-13', 84, 'UAS', 3, 7, 'bukti_raport.jpg'),
(46, '2024-03-13', 92, 'PHB', 5, 5, 'bukti_raport.jpg'),
(47, '2022-01-23', 63, 'PHB', 2, 2, 'bukti_raport.jpg'),
(48, '2021-06-27', 87, 'UAS', 2, 9, 'bukti_raport.jpg'),
(49, '2020-07-02', 86, 'UAS', 7, 7, 'bukti_raport.jpg'),
(50, '2022-12-19', 58, 'UAS', 7, 1, 'bukti_raport.jpg'),
(51, '2021-07-27', 57, 'PHB', 1, 4, 'bukti_raport.jpg'),
(52, '2024-04-12', 94, 'UTS', 6, 3, 'bukti_raport.jpg'),
(53, '2020-08-31', 87, 'UTS', 7, 5, 'bukti_raport.jpg'),
(54, '2023-06-17', 64, 'UTS', 5, 4, 'bukti_raport.jpg'),
(55, '2021-02-27', 66, 'PHB', 1, 8, 'bukti_raport.jpg'),
(56, '2023-11-14', 77, 'UAS', 6, 12, 'bukti_raport.jpg'),
(57, '2021-09-25', 91, 'UAS', 2, 8, 'bukti_raport.jpg'),
(58, '2023-04-18', 94, 'UAS', 7, 12, 'bukti_raport.jpg'),
(59, '2020-12-29', 76, 'UTS', 4, 5, 'bukti_raport.jpg'),
(60, '2022-04-23', 77, 'UTS', 5, 2, 'bukti_raport.jpg'),
(61, '2022-12-19', 43, 'PHB', 1, 4, 'bukti_raport.jpg'),
(62, '2022-07-22', 92, 'UTS', 6, 12, 'bukti_raport.jpg'),
(63, '2023-12-14', 95, 'UAS', 1, 3, 'bukti_raport.jpg'),
(64, '2021-09-25', 52, 'PHB', 3, 8, 'bukti_raport.jpg'),
(65, '2022-03-24', 43, 'UTS', 1, 3, 'bukti_raport.jpg'),
(66, '2023-09-15', 97, 'UAS', 7, 11, 'bukti_raport.jpg'),
(67, '2022-10-20', 98, 'PHB', 6, 4, 'bukti_raport.jpg'),
(68, '2022-01-23', 55, 'UTS', 4, 3, 'bukti_raport.jpg'),
(69, '2023-11-14', 79, 'UAS', 2, 6, 'bukti_raport.jpg'),
(70, '2020-09-30', 65, 'UAS', 2, 12, 'bukti_raport.jpg'),
(71, '2021-02-27', 84, 'UAS', 4, 10, 'bukti_raport.jpg'),
(72, '2023-05-18', 62, 'PHB', 5, 4, 'bukti_raport.jpg'),
(73, '2020-06-02', 67, 'UTS', 7, 5, 'bukti_raport.jpg'),
(74, '2021-06-27', 96, 'UTS', 1, 12, 'bukti_raport.jpg'),
(75, '2022-07-22', 50, 'PHB', 6, 1, 'bukti_raport.jpg'),
(76, '2022-07-22', 42, 'UAS', 1, 9, 'bukti_raport.jpg'),
(77, '2023-04-18', 93, 'PHB', 5, 10, 'bukti_raport.jpg'),
(78, '2023-04-18', 77, 'PHB', 4, 11, 'bukti_raport.jpg'),
(79, '2021-08-26', 41, 'UAS', 4, 5, 'bukti_raport.jpg'),
(80, '2023-08-16', 66, 'UAS', 3, 6, 'bukti_raport.jpg'),
(81, '2024-05-12', 88, 'UTS', 7, 1, 'bukti_raport.jpg'),
(82, '2020-07-02', 100, 'UTS', 5, 6, 'bukti_raport.jpg'),
(83, '2022-10-20', 62, 'UTS', 1, 8, 'bukti_raport.jpg'),
(84, '2023-06-17', 50, 'UAS', 5, 10, 'bukti_raport.jpg'),
(85, '2021-03-29', 49, 'PHB', 4, 3, 'bukti_raport.jpg'),
(86, '2021-01-28', 88, 'PHB', 1, 1, 'bukti_raport.jpg'),
(87, '2021-12-24', 41, 'UTS', 2, 1, 'bukti_raport.jpg'),
(88, '2023-09-15', 63, 'UTS', 4, 7, 'bukti_raport.jpg'),
(89, '2021-05-28', 86, 'PHB', 2, 6, 'bukti_raport.jpg'),
(90, '2020-10-30', 50, 'PHB', 5, 9, 'bukti_raport.jpg'),
(91, '2020-08-01', 59, 'UAS', 6, 7, 'bukti_raport.jpg'),
(92, '2023-09-15', 94, 'UTS', 6, 12, 'bukti_raport.jpg'),
(93, '2023-10-15', 99, 'UTS', 4, 2, 'bukti_raport.jpg'),
(94, '2022-02-22', 76, 'UTS', 2, 11, 'bukti_raport.jpg'),
(95, '2023-01-18', 71, 'UAS', 1, 7, 'bukti_raport.jpg'),
(96, '2021-05-28', 82, 'UTS', 5, 9, 'bukti_raport.jpg'),
(97, '2020-12-29', 67, 'PHB', 7, 5, 'bukti_raport.jpg'),
(98, '2022-03-24', 40, 'UTS', 5, 10, 'bukti_raport.jpg'),
(99, '2020-06-02', 54, 'UTS', 6, 3, 'bukti_raport.jpg'),
(100, '2023-09-15', 42, 'PHB', 5, 4, 'bukti_raport.jpg'),
(101, '2023-12-14', 57, 'PHB', 7, 2, 'bukti_raport.jpg'),
(102, '2020-08-01', 86, 'PHB', 1, 6, 'bukti_raport.jpg'),
(103, '2022-06-22', 50, 'UTS', 2, 2, 'bukti_raport.jpg'),
(104, '2023-06-17', 82, 'PHB', 3, 5, 'bukti_raport.jpg'),
(105, '2022-05-23', 67, 'UAS', 5, 4, 'bukti_raport.jpg'),
(106, '2022-11-19', 69, 'UTS', 1, 5, 'bukti_raport.jpg'),
(107, '2024-04-12', 54, 'UTS', 5, 4, 'bukti_raport.jpg'),
(108, '2022-10-20', 70, 'UTS', 5, 3, 'bukti_raport.jpg'),
(109, '2023-05-18', 53, 'UAS', 7, 11, 'bukti_raport.jpg'),
(110, '2023-04-18', 45, 'UAS', 3, 4, 'bukti_raport.jpg'),
(111, '2023-12-14', 63, 'UAS', 1, 9, 'bukti_raport.jpg'),
(112, '2023-05-18', 64, 'UTS', 4, 7, 'bukti_raport.jpg'),
(113, '2021-05-28', 77, 'UTS', 4, 7, 'bukti_raport.jpg'),
(114, '2022-07-22', 82, 'UAS', 4, 11, 'bukti_raport.jpg'),
(115, '2022-11-19', 52, 'UAS', 2, 10, 'bukti_raport.jpg'),
(116, '2020-10-30', 41, 'UTS', 1, 4, 'bukti_raport.jpg'),
(117, '2020-08-01', 92, 'PHB', 2, 10, 'bukti_raport.jpg'),
(118, '2021-02-27', 83, 'PHB', 3, 11, 'bukti_raport.jpg'),
(119, '2020-09-30', 53, 'PHB', 5, 4, 'bukti_raport.jpg'),
(120, '2022-11-19', 54, 'UAS', 5, 4, 'bukti_raport.jpg'),
(121, '2022-09-20', 56, 'UAS', 7, 11, 'bukti_raport.jpg'),
(122, '2024-04-12', 90, 'PHB', 6, 8, 'bukti_raport.jpg'),
(123, '2023-01-18', 100, 'UTS', 5, 2, 'bukti_raport.jpg'),
(124, '2021-06-27', 79, 'UAS', 3, 7, 'bukti_raport.jpg'),
(125, '2024-01-13', 79, 'UTS', 2, 2, 'bukti_raport.jpg'),
(126, '2021-12-24', 65, 'PHB', 2, 1, 'bukti_raport.jpg'),
(127, '2022-08-21', 70, 'PHB', 2, 1, 'bukti_raport.jpg'),
(128, '2022-06-22', 47, 'UTS', 4, 12, 'bukti_raport.jpg'),
(129, '2023-08-16', 81, 'UTS', 2, 3, 'bukti_raport.jpg'),
(130, '2022-03-24', 72, 'UTS', 5, 2, 'bukti_raport.jpg'),
(131, '2024-02-12', 40, 'UTS', 7, 3, 'bukti_raport.jpg'),
(132, '2023-03-19', 85, 'PHB', 3, 1, 'bukti_raport.jpg'),
(133, '2021-12-24', 57, 'PHB', 1, 7, 'bukti_raport.jpg'),
(134, '2023-07-17', 53, 'PHB', 3, 4, 'bukti_raport.jpg'),
(135, '2022-01-23', 72, 'UTS', 5, 2, 'bukti_raport.jpg'),
(136, '2020-10-30', 85, 'PHB', 2, 9, 'bukti_raport.jpg'),
(137, '2023-11-14', 81, 'UAS', 7, 3, 'bukti_raport.jpg'),
(138, '2024-04-12', 60, 'UAS', 3, 9, 'bukti_raport.jpg'),
(139, '2024-01-13', 76, 'UTS', 6, 5, 'bukti_raport.jpg'),
(140, '2023-03-19', 97, 'UAS', 5, 10, 'bukti_raport.jpg'),
(141, '2022-12-19', 75, 'UAS', 4, 9, 'bukti_raport.jpg'),
(142, '2021-02-27', 51, 'UAS', 1, 11, 'bukti_raport.jpg'),
(143, '2023-07-17', 79, 'UAS', 2, 8, 'bukti_raport.jpg'),
(144, '2022-05-23', 42, 'PHB', 6, 8, 'bukti_raport.jpg'),
(145, '2024-05-12', 41, 'UAS', 7, 4, 'bukti_raport.jpg'),
(146, '2023-02-17', 44, 'UTS', 6, 8, 'bukti_raport.jpg'),
(147, '2023-06-17', 40, 'UAS', 2, 3, 'bukti_raport.jpg'),
(148, '2021-07-27', 44, 'PHB', 5, 9, 'bukti_raport.jpg'),
(149, '2023-02-17', 67, 'PHB', 2, 7, 'bukti_raport.jpg'),
(150, '2022-06-22', 52, 'PHB', 6, 10, 'bukti_raport.jpg'),
(151, '2024-05-12', 79, 'PHB', 7, 9, 'bukti_raport.jpg'),
(152, '2024-03-13', 55, 'UAS', 6, 2, 'bukti_raport.jpg'),
(153, '2023-04-18', 100, 'UTS', 3, 3, 'bukti_raport.jpg'),
(154, '2021-02-27', 62, 'UTS', 6, 10, 'bukti_raport.jpg'),
(155, '2021-02-27', 72, 'UAS', 7, 5, 'bukti_raport.jpg'),
(156, '2024-05-12', 69, 'UAS', 7, 10, 'bukti_raport.jpg'),
(157, '2024-02-12', 96, 'PHB', 3, 9, 'bukti_raport.jpg'),
(158, '2020-12-29', 51, 'UTS', 2, 12, 'bukti_raport.jpg'),
(159, '2022-11-19', 96, 'UTS', 7, 10, 'bukti_raport.jpg'),
(160, '2020-12-29', 45, 'UAS', 7, 5, 'bukti_raport.jpg'),
(161, '2022-12-19', 96, 'UTS', 5, 7, 'bukti_raport.jpg'),
(162, '2022-01-23', 69, 'UAS', 2, 3, 'bukti_raport.jpg'),
(163, '2024-03-13', 63, 'PHB', 3, 7, 'bukti_raport.jpg'),
(164, '2023-01-18', 61, 'UAS', 5, 10, 'bukti_raport.jpg'),
(165, '2021-10-25', 49, 'UTS', 6, 11, 'bukti_raport.jpg'),
(166, '2024-05-12', 41, 'PHB', 3, 11, 'bukti_raport.jpg'),
(167, '2022-09-20', 80, 'UAS', 6, 8, 'bukti_raport.jpg'),
(168, '2024-02-12', 84, 'PHB', 7, 10, 'bukti_raport.jpg'),
(169, '2022-03-24', 99, 'UAS', 1, 10, 'bukti_raport.jpg'),
(170, '2020-09-30', 53, 'UAS', 2, 5, 'bukti_raport.jpg'),
(171, '2022-08-21', 55, 'PHB', 4, 7, 'bukti_raport.jpg'),
(172, '2023-09-15', 57, 'UTS', 7, 1, 'bukti_raport.jpg'),
(173, '2021-11-24', 59, 'UAS', 3, 10, 'bukti_raport.jpg'),
(174, '2022-03-24', 55, 'PHB', 6, 3, 'bukti_raport.jpg'),
(175, '2023-03-19', 77, 'UAS', 4, 10, 'bukti_raport.jpg'),
(176, '2021-06-27', 85, 'PHB', 4, 2, 'bukti_raport.jpg'),
(177, '2020-07-02', 51, 'PHB', 4, 9, 'bukti_raport.jpg'),
(178, '2020-10-30', 86, 'UAS', 2, 7, 'bukti_raport.jpg'),
(179, '2023-11-14', 76, 'PHB', 7, 8, 'bukti_raport.jpg'),
(180, '2021-06-27', 80, 'UAS', 3, 7, 'bukti_raport.jpg'),
(181, '2023-11-14', 71, 'UTS', 6, 11, 'bukti_raport.jpg'),
(182, '2023-06-17', 99, 'UTS', 6, 7, 'bukti_raport.jpg'),
(183, '2023-12-14', 56, 'UTS', 2, 7, 'bukti_raport.jpg'),
(184, '2020-09-30', 62, 'PHB', 7, 12, 'bukti_raport.jpg'),
(185, '2023-02-17', 90, 'UTS', 5, 2, 'bukti_raport.jpg'),
(186, '2023-01-18', 69, 'UAS', 1, 12, 'bukti_raport.jpg'),
(187, '2021-10-25', 52, 'UAS', 1, 5, 'bukti_raport.jpg'),
(188, '2022-01-23', 44, 'UAS', 7, 2, 'bukti_raport.jpg'),
(189, '2021-07-27', 71, 'UTS', 4, 5, 'bukti_raport.jpg'),
(190, '2022-02-22', 96, 'UTS', 6, 11, 'bukti_raport.jpg'),
(191, '2021-11-24', 52, 'UAS', 1, 1, 'bukti_raport.jpg'),
(192, '2021-06-27', 67, 'UTS', 6, 1, 'bukti_raport.jpg'),
(193, '2020-08-31', 63, 'PHB', 2, 9, 'bukti_raport.jpg'),
(194, '2023-02-17', 49, 'PHB', 5, 5, 'bukti_raport.jpg'),
(195, '2021-01-28', 72, 'UAS', 7, 11, 'bukti_raport.jpg'),
(196, '2021-04-28', 77, 'UTS', 5, 11, 'bukti_raport.jpg'),
(197, '2023-04-18', 45, 'UTS', 3, 1, 'bukti_raport.jpg'),
(198, '2023-10-15', 67, 'PHB', 4, 6, 'bukti_raport.jpg'),
(199, '2024-03-13', 60, 'UTS', 5, 12, 'bukti_raport.jpg'),
(200, '2022-10-20', 43, 'UTS', 1, 6, 'bukti_raport.jpg'),
(201, '2020-08-31', 77, 'PHB', 4, 5, 'bukti_raport.jpg'),
(202, '2024-03-13', 47, 'UTS', 6, 12, 'bukti_raport.jpg'),
(203, '2022-09-20', 90, 'PHB', 4, 8, 'bukti_raport.jpg'),
(204, '2023-02-17', 84, 'UAS', 6, 9, 'bukti_raport.jpg'),
(205, '2023-09-15', 79, 'UAS', 3, 9, 'bukti_raport.jpg'),
(206, '2020-11-29', 95, 'UAS', 5, 1, 'bukti_raport.jpg'),
(207, '2020-07-02', 40, 'UAS', 5, 4, 'bukti_raport.jpg'),
(208, '2020-11-29', 81, 'PHB', 6, 8, 'bukti_raport.jpg'),
(209, '2022-10-20', 89, 'UAS', 6, 1, 'bukti_raport.jpg'),
(210, '2020-08-01', 60, 'PHB', 3, 5, 'bukti_raport.jpg'),
(211, '2021-02-27', 100, 'UTS', 7, 3, 'bukti_raport.jpg'),
(212, '2022-06-22', 51, 'PHB', 5, 9, 'bukti_raport.jpg'),
(213, '2022-06-22', 92, 'UTS', 7, 6, 'bukti_raport.jpg'),
(214, '2024-04-12', 76, 'PHB', 2, 9, 'bukti_raport.jpg'),
(215, '2024-02-12', 56, 'UTS', 1, 9, 'bukti_raport.jpg'),
(216, '2022-09-20', 66, 'UAS', 1, 12, 'bukti_raport.jpg'),
(217, '2022-06-22', 45, 'UAS', 2, 7, 'bukti_raport.jpg'),
(218, '2020-07-02', 62, 'UTS', 5, 9, 'bukti_raport.jpg'),
(219, '2020-10-30', 100, 'UTS', 1, 2, 'bukti_raport.jpg'),
(220, '2021-12-24', 43, 'UTS', 3, 6, 'bukti_raport.jpg'),
(221, '2024-03-13', 88, 'UTS', 7, 12, 'bukti_raport.jpg'),
(222, '2024-01-13', 62, 'PHB', 2, 10, 'bukti_raport.jpg'),
(223, '2024-03-13', 95, 'UTS', 4, 6, 'bukti_raport.jpg'),
(224, '2024-05-12', 83, 'PHB', 7, 10, 'bukti_raport.jpg'),
(225, '2023-11-14', 49, 'UTS', 4, 4, 'bukti_raport.jpg'),
(226, '2021-05-28', 84, 'PHB', 5, 6, 'bukti_raport.jpg'),
(227, '2023-06-17', 88, 'PHB', 3, 3, 'bukti_raport.jpg'),
(228, '2021-11-24', 42, 'UTS', 7, 4, 'bukti_raport.jpg'),
(229, '2022-09-20', 91, 'UTS', 2, 3, 'bukti_raport.jpg'),
(230, '2021-03-29', 79, 'UTS', 3, 6, 'bukti_raport.jpg'),
(231, '2023-06-17', 86, 'UAS', 1, 6, 'bukti_raport.jpg'),
(232, '2023-11-14', 47, 'PHB', 3, 1, 'bukti_raport.jpg'),
(233, '2024-01-13', 100, 'PHB', 4, 3, 'bukti_raport.jpg'),
(234, '2020-06-02', 47, 'PHB', 2, 11, 'bukti_raport.jpg'),
(235, '2022-04-23', 72, 'UAS', 6, 7, 'bukti_raport.jpg'),
(236, '2021-10-25', 58, 'PHB', 1, 5, 'bukti_raport.jpg'),
(237, '2023-09-15', 52, 'UAS', 4, 11, 'bukti_raport.jpg'),
(238, '2023-02-17', 49, 'UTS', 4, 2, 'bukti_raport.jpg'),
(239, '2022-03-24', 85, 'UAS', 1, 1, 'bukti_raport.jpg'),
(240, '2022-02-22', 92, 'UTS', 4, 11, 'bukti_raport.jpg'),
(241, '2020-11-29', 79, 'UAS', 4, 1, 'bukti_raport.jpg'),
(242, '2023-10-15', 73, 'UAS', 6, 3, 'bukti_raport.jpg'),
(243, '2022-08-21', 53, 'PHB', 5, 2, 'bukti_raport.jpg'),
(244, '2020-10-30', 91, 'UTS', 1, 9, 'bukti_raport.jpg'),
(245, '2022-05-23', 90, 'PHB', 7, 5, 'bukti_raport.jpg'),
(246, '2022-02-22', 88, 'UAS', 1, 12, 'bukti_raport.jpg'),
(247, '2021-04-28', 62, 'UTS', 6, 4, 'bukti_raport.jpg'),
(248, '2023-03-19', 75, 'UAS', 7, 8, 'bukti_raport.jpg'),
(249, '2024-03-13', 84, 'UAS', 5, 10, 'bukti_raport.jpg'),
(250, '2022-03-24', 57, 'UAS', 2, 12, 'bukti_raport.jpg'),
(251, '2022-12-19', 50, 'PHB', 4, 1, 'bukti_raport.jpg'),
(252, '2022-08-21', 98, 'PHB', 5, 9, 'bukti_raport.jpg'),
(253, '2024-01-13', 44, 'UAS', 6, 8, 'bukti_raport.jpg'),
(254, '2021-02-27', 78, 'UAS', 4, 2, 'bukti_raport.jpg'),
(255, '2022-03-24', 85, 'UTS', 6, 4, 'bukti_raport.jpg'),
(256, '2021-11-24', 79, 'UAS', 2, 7, 'bukti_raport.jpg'),
(257, '2022-11-19', 57, 'UTS', 2, 5, 'bukti_raport.jpg'),
(258, '2024-05-12', 48, 'PHB', 2, 6, 'bukti_raport.jpg'),
(259, '2023-07-17', 46, 'UTS', 5, 4, 'bukti_raport.jpg'),
(260, '2020-08-01', 53, 'PHB', 4, 3, 'bukti_raport.jpg'),
(261, '2022-06-22', 74, 'UTS', 1, 1, 'bukti_raport.jpg'),
(262, '2020-07-02', 77, 'UAS', 7, 9, 'bukti_raport.jpg'),
(263, '2023-05-18', 69, 'PHB', 7, 11, 'bukti_raport.jpg'),
(264, '2020-11-29', 51, 'UAS', 1, 6, 'bukti_raport.jpg'),
(265, '2024-01-13', 70, 'PHB', 2, 3, 'bukti_raport.jpg'),
(266, '2023-05-18', 77, 'UTS', 3, 10, 'bukti_raport.jpg'),
(267, '2021-02-27', 67, 'UAS', 6, 2, 'bukti_raport.jpg'),
(268, '2022-01-23', 60, 'PHB', 6, 6, 'bukti_raport.jpg'),
(269, '2021-09-25', 92, 'PHB', 2, 5, 'bukti_raport.jpg'),
(270, '2024-03-13', 79, 'UAS', 1, 4, 'bukti_raport.jpg'),
(271, '2021-02-27', 79, 'PHB', 1, 12, 'bukti_raport.jpg'),
(272, '2022-08-21', 60, 'UTS', 5, 3, 'bukti_raport.jpg'),
(273, '2021-10-25', 52, 'UTS', 4, 6, 'bukti_raport.jpg'),
(274, '2023-06-17', 91, 'UAS', 3, 7, 'bukti_raport.jpg'),
(275, '2023-04-18', 59, 'UAS', 3, 9, 'bukti_raport.jpg'),
(276, '2024-03-13', 73, 'UAS', 2, 1, 'bukti_raport.jpg'),
(277, '2022-08-21', 100, 'UTS', 3, 8, 'bukti_raport.jpg'),
(278, '2022-11-19', 48, 'UAS', 4, 7, 'bukti_raport.jpg'),
(279, '2023-03-19', 50, 'PHB', 4, 3, 'bukti_raport.jpg'),
(280, '2022-10-20', 89, 'PHB', 2, 5, 'bukti_raport.jpg'),
(281, '2021-05-28', 94, 'UTS', 6, 5, 'bukti_raport.jpg'),
(282, '2024-01-13', 62, 'UAS', 2, 7, 'bukti_raport.jpg'),
(283, '2022-11-19', 53, 'UTS', 5, 10, 'bukti_raport.jpg'),
(284, '2024-02-12', 65, 'UTS', 4, 1, 'bukti_raport.jpg'),
(285, '2020-12-29', 43, 'UAS', 6, 10, 'bukti_raport.jpg'),
(286, '2020-11-29', 45, 'PHB', 1, 9, 'bukti_raport.jpg'),
(287, '2022-12-19', 93, 'UAS', 1, 6, 'bukti_raport.jpg'),
(288, '2023-06-17', 57, 'UAS', 4, 4, 'bukti_raport.jpg'),
(289, '2022-07-22', 53, 'PHB', 2, 4, 'bukti_raport.jpg'),
(290, '2021-01-28', 53, 'UTS', 5, 8, 'bukti_raport.jpg'),
(291, '2021-02-27', 83, 'PHB', 3, 2, 'bukti_raport.jpg'),
(292, '2021-07-27', 65, 'UTS', 7, 4, 'bukti_raport.jpg'),
(293, '2021-06-27', 50, 'PHB', 4, 4, 'bukti_raport.jpg'),
(294, '2023-12-14', 69, 'UAS', 7, 3, 'bukti_raport.jpg'),
(295, '2022-07-22', 62, 'PHB', 6, 10, 'bukti_raport.jpg'),
(296, '2020-09-30', 80, 'UTS', 1, 1, 'bukti_raport.jpg'),
(297, '2021-06-27', 86, 'PHB', 4, 4, 'bukti_raport.jpg'),
(298, '2022-03-24', 82, 'UAS', 6, 4, 'bukti_raport.jpg'),
(299, '2020-06-02', 40, 'PHB', 6, 4, 'bukti_raport.jpg'),
(300, '2020-08-31', 66, 'UTS', 7, 2, 'bukti_raport.jpg'),
(301, '2023-10-15', 86, 'UTS', 5, 6, 'bukti_raport.jpg'),
(302, '2021-04-28', 62, 'UTS', 2, 5, 'bukti_raport.jpg'),
(303, '2020-07-02', 61, 'PHB', 2, 2, 'bukti_raport.jpg'),
(304, '2023-02-17', 91, 'PHB', 5, 8, 'bukti_raport.jpg'),
(305, '2023-01-18', 81, 'PHB', 6, 9, 'bukti_raport.jpg'),
(306, '2021-06-27', 100, 'PHB', 3, 3, 'bukti_raport.jpg'),
(307, '2020-12-29', 81, 'UTS', 2, 8, 'bukti_raport.jpg'),
(308, '2021-12-24', 45, 'UAS', 6, 6, 'bukti_raport.jpg'),
(309, '2022-11-19', 40, 'UTS', 7, 12, 'bukti_raport.jpg'),
(310, '2022-02-22', 99, 'UTS', 5, 12, 'bukti_raport.jpg'),
(311, '2021-02-27', 97, 'UTS', 6, 7, 'bukti_raport.jpg'),
(312, '2022-04-23', 86, 'UAS', 5, 3, 'bukti_raport.jpg'),
(313, '2022-05-23', 84, 'PHB', 6, 2, 'bukti_raport.jpg'),
(314, '2022-09-20', 78, 'UAS', 7, 5, 'bukti_raport.jpg'),
(315, '2023-04-18', 98, 'UTS', 7, 3, 'bukti_raport.jpg'),
(316, '2023-10-15', 85, 'UAS', 2, 4, 'bukti_raport.jpg'),
(317, '2022-11-19', 69, 'PHB', 5, 4, 'bukti_raport.jpg'),
(318, '2022-07-22', 83, 'PHB', 2, 8, 'bukti_raport.jpg'),
(319, '2023-09-15', 65, 'UAS', 5, 12, 'bukti_raport.jpg'),
(320, '2021-07-27', 99, 'UTS', 1, 8, 'bukti_raport.jpg'),
(321, '2021-09-25', 57, 'UAS', 5, 7, 'bukti_raport.jpg'),
(322, '2021-02-27', 41, 'PHB', 5, 10, 'bukti_raport.jpg'),
(323, '2021-02-27', 43, 'UAS', 6, 10, 'bukti_raport.jpg'),
(324, '2021-05-28', 62, 'UAS', 7, 5, 'bukti_raport.jpg'),
(325, '2022-10-20', 89, 'PHB', 6, 8, 'bukti_raport.jpg'),
(326, '2024-02-12', 42, 'PHB', 3, 7, 'bukti_raport.jpg'),
(327, '2022-03-24', 44, 'UTS', 5, 5, 'bukti_raport.jpg'),
(328, '2022-06-22', 71, 'UTS', 4, 1, 'bukti_raport.jpg'),
(329, '2021-04-28', 96, 'UTS', 2, 4, 'bukti_raport.jpg'),
(330, '2021-10-25', 92, 'PHB', 2, 1, 'bukti_raport.jpg'),
(331, '2022-11-19', 82, 'PHB', 4, 12, 'bukti_raport.jpg'),
(332, '2023-05-18', 72, 'UAS', 3, 7, 'bukti_raport.jpg'),
(333, '2020-09-30', 85, 'UTS', 4, 3, 'bukti_raport.jpg'),
(334, '2022-03-24', 60, 'UTS', 4, 3, 'bukti_raport.jpg'),
(335, '2020-07-02', 62, 'PHB', 6, 4, 'bukti_raport.jpg'),
(336, '2020-08-01', 67, 'UTS', 5, 7, 'bukti_raport.jpg'),
(337, '2023-03-19', 57, 'PHB', 4, 6, 'bukti_raport.jpg'),
(338, '2021-02-27', 51, 'UAS', 6, 11, 'bukti_raport.jpg'),
(339, '2024-02-12', 76, 'PHB', 4, 2, 'bukti_raport.jpg'),
(340, '2020-08-31', 77, 'UTS', 5, 12, 'bukti_raport.jpg'),
(341, '2021-08-26', 82, 'PHB', 3, 7, 'bukti_raport.jpg'),
(342, '2023-11-14', 67, 'UAS', 3, 5, 'bukti_raport.jpg'),
(343, '2023-03-19', 73, 'UTS', 2, 7, 'bukti_raport.jpg'),
(344, '2024-05-12', 97, 'UTS', 2, 8, 'bukti_raport.jpg'),
(345, '2023-12-14', 61, 'UTS', 2, 5, 'bukti_raport.jpg'),
(346, '2022-03-24', 55, 'PHB', 5, 3, 'bukti_raport.jpg'),
(347, '2021-06-27', 88, 'UTS', 4, 7, 'bukti_raport.jpg'),
(348, '2024-03-13', 79, 'UTS', 2, 6, 'bukti_raport.jpg'),
(349, '2022-10-20', 45, 'UAS', 3, 9, 'bukti_raport.jpg'),
(350, '2023-08-16', 63, 'UAS', 5, 11, 'bukti_raport.jpg'),
(351, '2024-04-12', 49, 'UTS', 1, 7, 'bukti_raport.jpg'),
(352, '2022-10-20', 89, 'UTS', 4, 10, 'bukti_raport.jpg'),
(353, '2022-07-22', 78, 'PHB', 3, 2, 'bukti_raport.jpg'),
(354, '2022-06-22', 64, 'UTS', 2, 5, 'bukti_raport.jpg'),
(355, '2023-03-19', 98, 'UAS', 2, 5, 'bukti_raport.jpg'),
(356, '2023-05-18', 57, 'UAS', 1, 4, 'bukti_raport.jpg'),
(357, '2021-12-24', 79, 'PHB', 4, 3, 'bukti_raport.jpg'),
(358, '2020-08-01', 66, 'UTS', 2, 11, 'bukti_raport.jpg'),
(359, '2021-11-24', 68, 'UTS', 4, 3, 'bukti_raport.jpg'),
(360, '2022-01-23', 43, 'UAS', 2, 3, 'bukti_raport.jpg'),
(361, '2020-12-29', 67, 'UTS', 2, 11, 'bukti_raport.jpg'),
(362, '2023-05-18', 95, 'UAS', 1, 3, 'bukti_raport.jpg'),
(363, '2022-07-22', 43, 'UAS', 1, 12, 'bukti_raport.jpg'),
(364, '2023-05-18', 59, 'UAS', 3, 8, 'bukti_raport.jpg'),
(365, '2020-07-02', 86, 'UTS', 1, 8, 'bukti_raport.jpg'),
(366, '2022-11-19', 85, 'UTS', 7, 4, 'bukti_raport.jpg'),
(367, '2021-03-29', 75, 'PHB', 4, 10, 'bukti_raport.jpg'),
(368, '2021-06-27', 83, 'UAS', 3, 10, 'bukti_raport.jpg'),
(369, '2021-01-28', 77, 'PHB', 1, 4, 'bukti_raport.jpg'),
(370, '2022-03-24', 54, 'UTS', 5, 6, 'bukti_raport.jpg'),
(371, '2023-10-15', 43, 'UAS', 4, 10, 'bukti_raport.jpg'),
(372, '2023-12-14', 58, 'UTS', 3, 11, 'bukti_raport.jpg'),
(373, '2023-02-17', 72, 'UTS', 4, 10, 'bukti_raport.jpg'),
(374, '2022-09-20', 100, 'UTS', 5, 4, 'bukti_raport.jpg'),
(375, '2020-08-01', 80, 'UTS', 3, 8, 'bukti_raport.jpg'),
(376, '2020-07-02', 97, 'UTS', 6, 11, 'bukti_raport.jpg'),
(377, '2022-01-23', 55, 'UAS', 4, 2, 'bukti_raport.jpg'),
(378, '2021-09-25', 50, 'PHB', 7, 4, 'bukti_raport.jpg'),
(379, '2021-09-25', 68, 'PHB', 5, 11, 'bukti_raport.jpg'),
(380, '2023-04-18', 50, 'UTS', 3, 10, 'bukti_raport.jpg'),
(381, '2021-05-28', 89, 'UTS', 5, 8, 'bukti_raport.jpg'),
(382, '2020-12-29', 81, 'UAS', 4, 6, 'bukti_raport.jpg'),
(383, '2020-12-29', 82, 'UTS', 2, 6, 'bukti_raport.jpg'),
(384, '2024-04-12', 59, 'PHB', 7, 6, 'bukti_raport.jpg'),
(385, '2023-11-14', 57, 'UAS', 7, 11, 'bukti_raport.jpg'),
(386, '2024-05-12', 97, 'UAS', 7, 9, 'bukti_raport.jpg'),
(387, '2021-07-27', 44, 'UAS', 6, 7, 'bukti_raport.jpg'),
(388, '2023-12-14', 55, 'UTS', 4, 4, 'bukti_raport.jpg'),
(389, '2020-11-29', 89, 'UAS', 6, 5, 'bukti_raport.jpg'),
(390, '2021-05-28', 55, 'UAS', 1, 7, 'bukti_raport.jpg'),
(391, '2020-07-02', 78, 'UAS', 6, 9, 'bukti_raport.jpg'),
(392, '2021-07-27', 91, 'UTS', 5, 11, 'bukti_raport.jpg'),
(393, '2023-03-19', 96, 'PHB', 4, 12, 'bukti_raport.jpg'),
(394, '2023-02-17', 46, 'UAS', 4, 8, 'bukti_raport.jpg'),
(395, '2023-01-18', 99, 'PHB', 1, 8, 'bukti_raport.jpg'),
(396, '2021-09-25', 91, 'UTS', 2, 2, 'bukti_raport.jpg'),
(397, '2024-05-12', 91, 'UTS', 5, 6, 'bukti_raport.jpg'),
(398, '2022-02-22', 57, 'UAS', 3, 4, 'bukti_raport.jpg'),
(399, '2022-10-20', 89, 'UAS', 4, 6, 'bukti_raport.jpg'),
(400, '2020-08-01', 92, 'UAS', 4, 7, 'bukti_raport.jpg'),
(401, '2020-08-01', 66, 'PHB', 3, 11, 'bukti_raport.jpg'),
(402, '2023-11-14', 100, 'PHB', 1, 4, 'bukti_raport.jpg'),
(403, '2024-02-12', 88, 'PHB', 6, 9, 'bukti_raport.jpg'),
(404, '2021-12-24', 56, 'UAS', 5, 2, 'bukti_raport.jpg'),
(405, '2021-03-29', 49, 'UAS', 4, 4, 'bukti_raport.jpg'),
(406, '2024-05-12', 96, 'PHB', 4, 6, 'bukti_raport.jpg'),
(407, '2023-03-19', 53, 'UAS', 7, 12, 'bukti_raport.jpg'),
(408, '2022-12-19', 44, 'UAS', 7, 7, 'bukti_raport.jpg'),
(409, '2023-11-14', 83, 'PHB', 3, 5, 'bukti_raport.jpg'),
(410, '2024-04-12', 92, 'UAS', 5, 2, 'bukti_raport.jpg'),
(411, '2023-11-14', 93, 'UTS', 1, 1, 'bukti_raport.jpg'),
(412, '2020-07-02', 43, 'UTS', 7, 8, 'bukti_raport.jpg'),
(413, '2022-01-23', 53, 'PHB', 7, 2, 'bukti_raport.jpg'),
(414, '2023-10-15', 87, 'PHB', 4, 8, 'bukti_raport.jpg'),
(415, '2020-12-29', 76, 'PHB', 3, 9, 'bukti_raport.jpg'),
(416, '2022-06-22', 60, 'UTS', 7, 12, 'bukti_raport.jpg'),
(417, '2020-08-31', 68, 'UAS', 6, 7, 'bukti_raport.jpg'),
(418, '2021-02-27', 100, 'PHB', 6, 9, 'bukti_raport.jpg'),
(419, '2020-11-29', 74, 'UTS', 7, 10, 'bukti_raport.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nama_siswa` varchar(255) NOT NULL,
  `asal_sekolah` varchar(100) NOT NULL,
  `jk` enum('Perempuan','Laki-Laki') NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telepon` varchar(13) NOT NULL,
  `password` varchar(50) NOT NULL,
  `kartu_pelajar` varchar(255) NOT NULL,
  `validated` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nama_siswa`, `asal_sekolah`, `jk`, `kelas`, `email`, `telepon`, `password`, `kartu_pelajar`, `validated`) VALUES
(1, 'Iqbal', 'SMA 1', 'Laki-Laki', 'X', 'Iqbal@mail.com', '000011112222', 'Iqbal123', 'kartu-pelajar-dummy.jpg', 1),
(2, 'Rahmat', 'SMA 2', 'Laki-Laki', 'X', 'Rahmat@mail.com', '000011112223', 'Rahmat123', 'kartu-pelajar-dummy.jpg', 1),
(3, 'Azka', 'SMA 3', 'Laki-Laki', 'null', 'Azka@mail.com', '000011112222', 'Azka123', 'kartu-pelajar-dummy.jpg', 1),
(4, 'Iraa', 'SMA 4', 'Perempuan', 'XII', 'Iraa@mail.com', '000011112222', 'Iraa123', 'kartu-pelajar-dummy.jpg', 1),
(5, 'Aysha', 'SMA 5', 'Perempuan', 'null', 'Aysha@mail.com', '000011112222', 'Aysha123', 'kartu-pelajar-dummy.jpg', 1),
(6, 'Zahra', 'SMA 6', 'Perempuan', 'null', 'Zahra@mail.com', '000011112222', 'Zahra123', 'kartu-pelajar-dummy.jpg', 1),
(7, 'Abighailllllllllllll', 'SMA 7', 'Perempuan', 'XII', 'Abighail@mail.com', '000011112222', 'Abighail123', 'kartu-pelajar-dummy.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `submodul`
--

CREATE TABLE `submodul` (
  `id_submodul` int(11) NOT NULL,
  `judul_content` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `id_modul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `submodul`
--

INSERT INTO `submodul` (`id_submodul`, `judul_content`, `content`, `id_modul`) VALUES
(1, 'Pengertian Descriptive Text', 'Descriptive Text adalah salah satu jenis text dalam Bahasa Inggris yang menggambarkan dengan jelas sifat-sifat yang melekat pada sesuatu, baik itu manusia, hewan, tumbuhan mau pun benda mati. Tujuan dari teks ini adalah memberikan informasi dengan jelas mengenai objek yang digambarkan kepada pembaca.', 3),
(2, 'Pengertian Descriptive Text', 'Descriptive Text adalah salah satu jenis text dalam Bahasa Inggris yang menggambarkan dengan jelas sifat-sifat yang melekat pada sesuatu, baik itu manusia, hewan, tumbuhan mau pun benda mati. Tujuan dari teks ini adalah memberikan informasi dengan jelas mengenai objek yang digambarkan kepada pembaca.', 6),
(3, 'Pengertian Descriptive Text', 'Descriptive Text adalah salah satu jenis text dalam Bahasa Inggris yang menggambarkan dengan jelas sifat-sifat yang melekat pada sesuatu, baik itu manusia, hewan, tumbuhan mau pun benda mati. Tujuan dari teks ini adalah memberikan informasi dengan jelas mengenai objek yang digambarkan kepada pembaca.', 9),
(4, 'Ciri-ciri Descriptive Text', '<ul>\r\n<li>\r\nMenggunakan Simple Present Tense <br>\r\nTeks ini menggunakan Simple Present Tense karena kita akan mendiskripsikan fakta-fakta yang melekat pada suatu objek, dan salah fungsi dari Simple Present Tense sendiri adalah untuk menunjukkan suatu fakta atau kebenaran.\r\nMisalkan kamu ingin mendeskripsikan mengenai tempat tidur kamu, kamu bisa menggunakan kalimat:\r\nThe color of my bedroom is blue.\r\n</li>\r\n<li> \r\nMenggunakan banyak kata sifat (adjective). <br>\r\nKarena fungsi dari teks ini adalah untuk memberikan informasi dengan menggambarkan suatu objek yang dideskripsikan, maka dalam Descriptive Text akan banyak dijumpai kata sifat (adjective). Contohnya adalah big, small, colorful, dan lain sebagainya.\r\n</li>\r\n<li>\r\nMenggunakan kata kerja penghubung (relating verb).<br>\r\nRelating verb adalah kata kerja yang memberikan penjelasan kepada kata benda yang menjadi subjek dari suatu kalimat. Contohnya: is, have, seem, appear, dan kata kerja lainnya.\r\n</li>', 3),
(5, 'Ciri-ciri Descriptive Text', '<ul>\r\n<li>\r\nMenggunakan Simple Present Tense <br>\r\nTeks ini menggunakan Simple Present Tense karena kita akan mendiskripsikan fakta-fakta yang melekat pada suatu objek, dan salah fungsi dari Simple Present Tense sendiri adalah untuk menunjukkan suatu fakta atau kebenaran.\r\nMisalkan kamu ingin mendeskripsikan mengenai tempat tidur kamu, kamu bisa menggunakan kalimat:\r\nThe color of my bedroom is blue.\r\n</li>\r\n<li> \r\nMenggunakan banyak kata sifat (adjective). <br>\r\nKarena fungsi dari teks ini adalah untuk memberikan informasi dengan menggambarkan suatu objek yang dideskripsikan, maka dalam Descriptive Text akan banyak dijumpai kata sifat (adjective). Contohnya adalah big, small, colorful, dan lain sebagainya.\r\n</li>\r\n<li>\r\nMenggunakan kata kerja penghubung (relating verb).<br>\r\nRelating verb adalah kata kerja yang memberikan penjelasan kepada kata benda yang menjadi subjek dari suatu kalimat. Contohnya: is, have, seem, appear, dan kata kerja lainnya.\r\n</li>', 6),
(6, 'Ciri-ciri Descriptive Text', '<ul>\r\n<li>\r\nMenggunakan Simple Present Tense <br>\r\nTeks ini menggunakan Simple Present Tense karena kita akan mendiskripsikan fakta-fakta yang melekat pada suatu objek, dan salah fungsi dari Simple Present Tense sendiri adalah untuk menunjukkan suatu fakta atau kebenaran.\r\nMisalkan kamu ingin mendeskripsikan mengenai tempat tidur kamu, kamu bisa menggunakan kalimat:\r\nThe color of my bedroom is blue.\r\n</li>\r\n<li> \r\nMenggunakan banyak kata sifat (adjective). <br>\r\nKarena fungsi dari teks ini adalah untuk memberikan informasi dengan menggambarkan suatu objek yang dideskripsikan, maka dalam Descriptive Text akan banyak dijumpai kata sifat (adjective). Contohnya adalah big, small, colorful, dan lain sebagainya.\r\n</li>\r\n<li>\r\nMenggunakan kata kerja penghubung (relating verb).<br>\r\nRelating verb adalah kata kerja yang memberikan penjelasan kepada kata benda yang menjadi subjek dari suatu kalimat. Contohnya: is, have, seem, appear, dan kata kerja lainnya.\r\n</li>', 9),
(7, 'Generic Structure of Descriptive Text', 'Descriptive Text mempunyai aturan tersendiri mengenai strukturnya. Berikut ini adalah generic structure descriptive text: <br>\r\n<ol>\r\n<li>\r\nIdentification <br>\r\nBagian ini, terletak pada paragraf pertama, tujuannya adalah untuk mengidentifikasi suatu objek yang ingin dideskripsikan. Indentification berfungsi untuk memperkenalkan kepada pembaca tentang objek yang akan kita jelaskan, sebelum kita memberitahu tentang lebih rinci mengenai objek tersebut pada paragraf selanjutnya.\r\n</li>\r\n<li>\r\nDescription <br>\r\nBagian ini, terletak pada paragraf kedua dan seterusnya, berisi tentang sifat-sifat yang melekat pada sesuatu yang sudah kamu kenalkan pada pembaca pada paragraf pertama.\r\n</li>', 3),
(8, 'Generic Structure of Descriptive Text', 'Descriptive Text mempunyai aturan tersendiri mengenai strukturnya. Berikut ini adalah generic structure descriptive text: <br>\r\n<ol>\r\n<li>\r\nIdentification <br>\r\nBagian ini, terletak pada paragraf pertama, tujuannya adalah untuk mengidentifikasi suatu objek yang ingin dideskripsikan. Indentification berfungsi untuk memperkenalkan kepada pembaca tentang objek yang akan kita jelaskan, sebelum kita memberitahu tentang lebih rinci mengenai objek tersebut pada paragraf selanjutnya.\r\n</li>\r\n<li>\r\nDescription <br>\r\nBagian ini, terletak pada paragraf kedua dan seterusnya, berisi tentang sifat-sifat yang melekat pada sesuatu yang sudah kamu kenalkan pada pembaca pada paragraf pertama.\r\n</li>', 6),
(9, 'Generic Structure of Descriptive Text', 'Descriptive Text mempunyai aturan tersendiri mengenai strukturnya. Berikut ini adalah generic structure descriptive text: <br>\r\n<ol>\r\n<li>\r\nIdentification <br>\r\nBagian ini, terletak pada paragraf pertama, tujuannya adalah untuk mengidentifikasi suatu objek yang ingin dideskripsikan. Indentification berfungsi untuk memperkenalkan kepada pembaca tentang objek yang akan kita jelaskan, sebelum kita memberitahu tentang lebih rinci mengenai objek tersebut pada paragraf selanjutnya.\r\n</li>\r\n<li>\r\nDescription <br>\r\nBagian ini, terletak pada paragraf kedua dan seterusnya, berisi tentang sifat-sifat yang melekat pada sesuatu yang sudah kamu kenalkan pada pembaca pada paragraf pertama.\r\n</li>', 9),
(10, 'Pengertian Recount Text', 'Recount text adalah jenis text dalam Bahasa Inggris yang menceritakan tentang suatu cerita, tindakan, atau kegiatan. Biasanya, recount text menceritakan tentang pengalaman seseorang. Tujuan dari recount text adalah untuk menghibur pembaca, sehingga tidak terdapat konflik dalam text ini. Selain itu, teks ini juga bertujuan untuk memberikan informasi pada pembaca.', 2),
(11, 'Pengertian Recount Text', 'Recount text adalah jenis text dalam Bahasa Inggris yang menceritakan tentang suatu cerita, tindakan, atau kegiatan. Biasanya, recount text menceritakan tentang pengalaman seseorang. Tujuan dari recount text adalah untuk menghibur pembaca, sehingga tidak terdapat konflik dalam text ini. Selain itu, teks ini juga bertujuan untuk memberikan informasi pada pembaca.', 5),
(12, 'Pengertian Recount Text', 'Recount text adalah jenis text dalam Bahasa Inggris yang menceritakan tentang suatu cerita, tindakan, atau kegiatan. Biasanya, recount text menceritakan tentang pengalaman seseorang. Tujuan dari recount text adalah untuk menghibur pembaca, sehingga tidak terdapat konflik dalam text ini. Selain itu, teks ini juga bertujuan untuk memberikan informasi pada pembaca.', 8),
(13, 'Ciri-ciri Recount Text', '<ul>\r\n<li>\r\nMenggunakan kalimat Past Tense (lampau), seperti went, departed, would, woke up, dan lain sebagainya.\r\n</li>\r\n<li>\r\nMenggunakan adverb dan adverbial phrase untuk mengungkapkan waktu, tempat dan cara, seperti: last September, Pari Island, on then second day, dan lain sebagainya.\r\n</li>\r\n<li>\r\nMenggunakan conjunction dan time connectives guna mengurutkan peristiwa atau kejadian, seperti: and, before, then, after that, dan lain sebagainya. </li>\r\n</ul', 2),
(14, 'Ciri-ciri Recount Text', '<ul>\r\n<li>\r\nMenggunakan kalimat Past Tense (lampau), seperti went, departed, would, woke up, dan lain sebagainya.\r\n</li>\r\n<li>\r\nMenggunakan adverb dan adverbial phrase untuk mengungkapkan waktu, tempat dan cara, seperti: last September, Pari Island, on then second day, dan lain sebagainya.\r\n</li>\r\n<li>\r\nMenggunakan conjunction dan time connectives guna mengurutkan peristiwa atau kejadian, seperti: and, before, then, after that, dan lain sebagainya. </li>\r\n</ul', 5),
(15, 'Ciri-ciri Recount Text', '<ul>\r\n<li>\r\nMenggunakan kalimat Past Tense (lampau), seperti went, departed, would, woke up, dan lain sebagainya.\r\n</li>\r\n<li>\r\nMenggunakan adverb dan adverbial phrase untuk mengungkapkan waktu, tempat dan cara, seperti: last September, Pari Island, on then second day, dan lain sebagainya.\r\n</li>\r\n<li>\r\nMenggunakan conjunction dan time connectives guna mengurutkan peristiwa atau kejadian, seperti: and, before, then, after that, dan lain sebagainya. </li>\r\n</ul', 8),
(16, 'Generic Structure of Recount Text', '<ol>\r\n<li>\r\nOrientation <br>\r\nMenceritakan mengenai latar belakang informasi tentang siapa, di mana, kapan kejadian atau peristiwa terjadi.\r\n</li> \r\n<li> \r\nEvents <br>\r\nMenceritakan serangkaian peristiwa yang terjadi sesuai urutan kronologis.\r\n</li>\r\n<li>\r\nRe-orientation <br>\r\nMerupakan penutup atau kesimpulan cerita. Untuk menutup suatu cerita, kita bisa memberikan opini kita mengenai cerita tersebut.\r\n</li>', 2),
(17, 'Generic Structure of Recount Text', '<ol>\r\n<li>\r\nOrientation <br>\r\nMenceritakan mengenai latar belakang informasi tentang siapa, di mana, kapan kejadian atau peristiwa terjadi.\r\n</li> \r\n<li> \r\nEvents <br>\r\nMenceritakan serangkaian peristiwa yang terjadi sesuai urutan kronologis.\r\n</li>\r\n<li>\r\nRe-orientation <br>\r\nMerupakan penutup atau kesimpulan cerita. Untuk menutup suatu cerita, kita bisa memberikan opini kita mengenai cerita tersebut.\r\n</li>', 5),
(18, 'Generic Structure of Recount Text', '<ol>\r\n<li>\r\nOrientation <br>\r\nMenceritakan mengenai latar belakang informasi tentang siapa, di mana, kapan kejadian atau peristiwa terjadi.\r\n</li> \r\n<li> \r\nEvents <br>\r\nMenceritakan serangkaian peristiwa yang terjadi sesuai urutan kronologis.\r\n</li>\r\n<li>\r\nRe-orientation <br>\r\nMerupakan penutup atau kesimpulan cerita. Untuk menutup suatu cerita, kita bisa memberikan opini kita mengenai cerita tersebut.\r\n</li>', 8),
(19, 'Pengertian Narrative Text', 'Narrative text adalah jenis text dalam Bahasa Inggris untuk menceritakan suatu cerita yang memiliki rangkaian peristiwa kronologis yang saling terhubung. Tujuan dari teks ini adalah untuk menghibur pembaca tentang suatu kisah atau cerita.\r\nNarrative text bisa berbentuk imajiner atau pun faktual. Berikut adalah contoh genre dari Narrative text: <br>\r\n<ul>\r\n<li> Fairy tale </li>\r\n<li> Mystery </li>\r\n<li> Science fiction </li>\r\n<li> Romance </li>\r\n<li> Horror </li>\r\n<li> Fable </li>\r\n<li> Myth and legend </li>\r\n<li> History </li>\r\n<li> Slice of life </li>\r\n<li> Personal experience </li>\r\n<li> dan lain sebagainya </li>\r\n</ul>', 1),
(20, 'Pengertian Narrative Text', 'Narrative text adalah jenis text dalam Bahasa Inggris untuk menceritakan suatu cerita yang memiliki rangkaian peristiwa kronologis yang saling terhubung. Tujuan dari teks ini adalah untuk menghibur pembaca tentang suatu kisah atau cerita.\r\nNarrative text bisa berbentuk imajiner atau pun faktual. Berikut adalah contoh genre dari Narrative text: <br>\r\n<ul>\r\n<li> Fairy tale </li>\r\n<li> Mystery </li>\r\n<li> Science fiction </li>\r\n<li> Romance </li>\r\n<li> Horror </li>\r\n<li> Fable </li>\r\n<li> Myth and legend </li>\r\n<li> History </li>\r\n<li> Slice of life </li>\r\n<li> Personal experience </li>\r\n<li> dan lain sebagainya </li>\r\n</ul>', 6),
(21, 'Pengertian Narrative Text', 'Narrative text adalah jenis text dalam Bahasa Inggris untuk menceritakan suatu cerita yang memiliki rangkaian peristiwa kronologis yang saling terhubung. Tujuan dari teks ini adalah untuk menghibur pembaca tentang suatu kisah atau cerita.\r\nNarrative text bisa berbentuk imajiner atau pun faktual. Berikut adalah contoh genre dari Narrative text: <br>\r\n<ul>\r\n<li> Fairy tale </li>\r\n<li> Mystery </li>\r\n<li> Science fiction </li>\r\n<li> Romance </li>\r\n<li> Horror </li>\r\n<li> Fable </li>\r\n<li> Myth and legend </li>\r\n<li> History </li>\r\n<li> Slice of life </li>\r\n<li> Personal experience </li>\r\n<li> dan lain sebagainya </li>\r\n</ul>', 7),
(22, 'EDIT SUB MODUL', '<ol>\r\n<li> Menggunakan Action Verb dalam bentuk Past Tenses. </li>\r\n<li> Menggunakan Noun tertentu untuk sebagai kata ganti orang. </li>\r\n<li> Menggunakan Adjective yang membentuk Noun Phrase. </li>\r\n<li> Menggunakan Conjunction untuk mengurutkan kejadian-kejadian. </li>\r\n</ol>', 1),
(23, 'Ciri-ciri Narrative Text', '<ol>\r\n<li> Menggunakan Action Verb dalam bentuk Past Tenses. </li>\r\n<li> Menggunakan Noun tertentu untuk sebagai kata ganti orang. </li>\r\n<li> Menggunakan Adjective yang membentuk Noun Phrase. </li>\r\n<li> Menggunakan Conjunction untuk mengurutkan kejadian-kejadian. </li>\r\n</ol>', 4),
(24, 'Ciri-ciri Narrative Text', '<ol>\r\n<li> Menggunakan Action Verb dalam bentuk Past Tenses. </li>\r\n<li> Menggunakan Noun tertentu untuk sebagai kata ganti orang. </li>\r\n<li> Menggunakan Adjective yang membentuk Noun Phrase. </li>\r\n<li> Menggunakan Conjunction untuk mengurutkan kejadian-kejadian. </li>\r\n</ol>', 7),
(25, 'Struktur Narrative Text', 'Struktur dari narrative text berfokus pada serangkaian tahapan yang diusulkan untuk membangun sebuah teks ini sendiri. Secara umum, terdapat empat tahapan dalam Narrative text, yaitu:\r\n<ol>\r\n<li> Orientation <br>\r\nOrientation atau biasa disebut dengan pendahuluan, berisi tentang siapa, kapan, di mana suatu cerita ditetapkan.\r\n</li>\r\n<li> Complication <br>\r\nComplication menceritakan awal masalah yang menyebabkan puncak masalah atau yang biasa disebut dengan klimaks. Bagian ini biasanya melibatkan karakter utama dari cerita tersebut.\r\n</li>\r\n<li> Complication <br>\r\nBagian ini adalah akhir dari cerita atau berupa solusi dari masalah yang terjadi. Masalah dapat diselesaikan dapat menjadi lebih baik atau malah lebih buruk yang nantinya akan membuat cerita berakhir dengan bahagia atau sebaliknya. <br>\r\nTerkadang, ada beberapa resolusi yang berupa masalah lain untuk dipecahkan. Hal ini sengaja dibuat oleh penulis untuk menambah dan mempertahankan minat dan ketegangan bagi pembacanya. Biasanya, jenis resolusi ini terdapat pada genre mysteries dan horror.\r\n</li>\r\n<li> Reorientation <br>\r\nBagian adalah penutup dari suatu cerita yang bersifat opsional. Re-orientation bisa berisi tentang pelajaran moral, saran atau pengajaran dari penulis.\r\n</li>\r\n</ol>', 1),
(28, 'Struktur Narrative Text', 'Struktur dari narrative text berfokus pada serangkaian tahapan yang diusulkan untuk membangun sebuah teks ini sendiri. Secara umum, terdapat empat tahapan dalam Narrative text, yaitu:\r\n<ol>\r\n<li> Orientation <br>\r\nOrientation atau biasa disebut dengan pendahuluan, berisi tentang siapa, kapan, di mana suatu cerita ditetapkan.\r\n</li>\r\n<li> Complication <br>\r\nComplication menceritakan awal masalah yang menyebabkan puncak masalah atau yang biasa disebut dengan klimaks. Bagian ini biasanya melibatkan karakter utama dari cerita tersebut.\r\n</li>\r\n<li> Complication <br>\r\nBagian ini adalah akhir dari cerita atau berupa solusi dari masalah yang terjadi. Masalah dapat diselesaikan dapat menjadi lebih baik atau malah lebih buruk yang nantinya akan membuat cerita berakhir dengan bahagia atau sebaliknya. <br>\r\nTerkadang, ada beberapa resolusi yang berupa masalah lain untuk dipecahkan. Hal ini sengaja dibuat oleh penulis untuk menambah dan mempertahankan minat dan ketegangan bagi pembacanya. Biasanya, jenis resolusi ini terdapat pada genre mysteries dan horror.\r\n</li>\r\n<li> Reorientation <br>\r\nBagian adalah penutup dari suatu cerita yang bersifat opsional. Re-orientation bisa berisi tentang pelajaran moral, saran atau pengajaran dari penulis.\r\n</li>\r\n</ol>', 4),
(29, 'Struktur Narrative Text', 'Struktur dari narrative text berfokus pada serangkaian tahapan yang diusulkan untuk membangun sebuah teks ini sendiri. Secara umum, terdapat empat tahapan dalam Narrative text, yaitu:\r\n<ol>\r\n<li> Orientation <br>\r\nOrientation atau biasa disebut dengan pendahuluan, berisi tentang siapa, kapan, di mana suatu cerita ditetapkan.\r\n</li>\r\n<li> Complication <br>\r\nComplication menceritakan awal masalah yang menyebabkan puncak masalah atau yang biasa disebut dengan klimaks. Bagian ini biasanya melibatkan karakter utama dari cerita tersebut.\r\n</li>\r\n<li> Complication <br>\r\nBagian ini adalah akhir dari cerita atau berupa solusi dari masalah yang terjadi. Masalah dapat diselesaikan dapat menjadi lebih baik atau malah lebih buruk yang nantinya akan membuat cerita berakhir dengan bahagia atau sebaliknya. <br>\r\nTerkadang, ada beberapa resolusi yang berupa masalah lain untuk dipecahkan. Hal ini sengaja dibuat oleh penulis untuk menambah dan mempertahankan minat dan ketegangan bagi pembacanya. Biasanya, jenis resolusi ini terdapat pada genre mysteries dan horror.\r\n</li>\r\n<li> Reorientation <br>\r\nBagian adalah penutup dari suatu cerita yang bersifat opsional. Re-orientation bisa berisi tentang pelajaran moral, saran atau pengajaran dari penulis.\r\n</li>\r\n</ol>', 7),
(30, 'Pengertian SPLDV', 'Sistem persamaan linear dua variabel (SPLDV) adalah pasangan dari dua nilai peubah x atau y yang ekuivalen dengan bentuk umumnya yang mempunyai pasangan terurut (xo, yo). Bentuk umum dari SPLDV adalah sebagai berikut : <br> \r\nax + by = p <br>\r\ncx + dy = q <br>\r\nSedangkan solusi dari hasil bentuk umum di atas disebut (xo,yo) disebut himpunan penyelesaiannya. Contoh SPLDV adalah sebagai berikut : <br>\r\n3x + 2y = 10 <br>\r\n9x – 7y = 43 <br>\r\nDan Himpunan Penyelesaiannya adalah {(x,y) (4,-1)}.', 10),
(31, 'Pengertian SPLDV', 'Sistem persamaan linear dua variabel (SPLDV) adalah pasangan dari dua nilai peubah x atau y yang ekuivalen dengan bentuk umumnya yang mempunyai pasangan terurut (xo, yo). Bentuk umum dari SPLDV adalah sebagai berikut : <br> \r\nax + by = p <br>\r\ncx + dy = q <br>\r\nSedangkan solusi dari hasil bentuk umum di atas disebut (xo,yo) disebut himpunan penyelesaiannya. Contoh SPLDV adalah sebagai berikut : <br>\r\n3x + 2y = 10 <br>\r\n9x – 7y = 43 <br>\r\nDan Himpunan Penyelesaiannya adalah {(x,y) (4,-1)}.', 11),
(32, 'Pengertian SPLDV', 'Sistem persamaan linear dua variabel (SPLDV) adalah pasangan dari dua nilai peubah x atau y yang ekuivalen dengan bentuk umumnya yang mempunyai pasangan terurut (xo, yo). Bentuk umum dari SPLDV adalah sebagai berikut : <br> \r\nax + by = p <br>\r\ncx + dy = q <br>\r\nSedangkan solusi dari hasil bentuk umum di atas disebut (xo,yo) disebut himpunan penyelesaiannya. Contoh SPLDV adalah sebagai berikut : <br>\r\n3x + 2y = 10 <br>\r\n9x – 7y = 43 <br>\r\nDan Himpunan Penyelesaiannya adalah {(x,y) (4,-1)}.', 12),
(33, 'Metode Penyelesaian SPLDV', 'Ada beberapa metode untuk menyelesaikan SPLDV sehingga diperoleh nilai himpunan penyelesaiannya yaitu metode grafik, metode eliminasi dengan penyamaan, metode eliminasi dengan substitusi, dan metode eliminasi dengan menjumlahkan atau mengurangkan. Setiap metode mempunyai keunggulan dan kelemahannya. Penjelasannya setiap metode SPLDV adalah sebagai berikut : <br>\r\n<ol>\r\n<li> Metode Eliminasi dengan Penyamaan. <br>\r\nMisalkan kita mempunyai SPLDV dalam variabel x dan y. Andaikan kita membuat suatu persamaan yang tidak lagi mengandung nilai x nya, maka dikatakan bahwa x telah dieliminasikan dengan penyamaan. Langkah strateginya adalah dengan mencari nilai x dari kedua persamaan yang diberikan itu (nilai y seolah-olah dianggap sebagai bilangan yang diketahui, maka dikatakan bahwa x dinyatakan dalam y). Kemudian hasil yang didapat dipersamakan. Dalam kasus ini kita juga dapat menyatakan nilai y ke dalam x, kemudian kita samakan dari persamaan-persamaan itu. <br>\r\nKelemahan dari metode eliminasi dengan penyamaan adalah akan memerlukan banyak langkah (dapat sampai 4 langkah), karena misalnya salah satu variabel yang diketahui tidak langsung disubstitusi ke persamaan, namun dicari variabel yang lain menggunakan eliminasi sehingga rawan akan ketidaktelitian saat menghitung. \r\n</li>\r\n<li> Metode Eliminasi dengan Substitusi <br>\r\nApabila kita mempunyai SPLDV dalam variabel x dan y. langkah-langkah penyelesaian metode Eliminasi dengan Substitusi adalah sebagai berikut : <br>\r\n1. Pilihlah salah satu persamaan yang sederhana, kemudian nyatakan y dalam x atau x dalam y. <br>\r\n2. Substitusikan x atau y yang diperoleh pada langkah 1 ke dalam persamaan lainnya. <br>\r\n3. Selesaikan persamaan yang diperoleh pada langkah 2. <br>\r\n4. Tuliskan himpunan penyelesainnya. <br>\r\nKeunggulan Metode Eliminasi dengan Substitusi adalah sangat mudah \\digunakan dan efektif untuk menyelesaikan soal SPLDV secara cepat dan tepat. Kelemahan dari metode ini adalah tidak disarankan apabila digunakan untuk masalah persamaan linear yang kompleks seperti sistem persamaan linear 3 variabel.\r\n</li>\r\n</ol>', 10),
(34, 'Metode Penyelesaian SPLDV', 'Ada beberapa metode untuk menyelesaikan SPLDV sehingga diperoleh nilai himpunan penyelesaiannya yaitu metode grafik, metode eliminasi dengan penyamaan, metode eliminasi dengan substitusi, dan metode eliminasi dengan menjumlahkan atau mengurangkan. Setiap metode mempunyai keunggulan dan kelemahannya. Penjelasannya setiap metode SPLDV adalah sebagai berikut : <br>\r\n<ol>\r\n<li> Metode Eliminasi dengan Penyamaan. <br>\r\nMisalkan kita mempunyai SPLDV dalam variabel x dan y. Andaikan kita membuat suatu persamaan yang tidak lagi mengandung nilai x nya, maka dikatakan bahwa x telah dieliminasikan dengan penyamaan. Langkah strateginya adalah dengan mencari nilai x dari kedua persamaan yang diberikan itu (nilai y seolah-olah dianggap sebagai bilangan yang diketahui, maka dikatakan bahwa x dinyatakan dalam y). Kemudian hasil yang didapat dipersamakan. Dalam kasus ini kita juga dapat menyatakan nilai y ke dalam x, kemudian kita samakan dari persamaan-persamaan itu. <br>\r\nKelemahan dari metode eliminasi dengan penyamaan adalah akan memerlukan banyak langkah (dapat sampai 4 langkah), karena misalnya salah satu variabel yang diketahui tidak langsung disubstitusi ke persamaan, namun dicari variabel yang lain menggunakan eliminasi sehingga rawan akan ketidaktelitian saat menghitung. \r\n</li>\r\n<li> Metode Eliminasi dengan Substitusi <br>\r\nApabila kita mempunyai SPLDV dalam variabel x dan y. langkah-langkah penyelesaian metode Eliminasi dengan Substitusi adalah sebagai berikut : <br>\r\n1. Pilihlah salah satu persamaan yang sederhana, kemudian nyatakan y dalam x atau x dalam y. <br>\r\n2. Substitusikan x atau y yang diperoleh pada langkah 1 ke dalam persamaan lainnya. <br>\r\n3. Selesaikan persamaan yang diperoleh pada langkah 2. <br>\r\n4. Tuliskan himpunan penyelesainnya. <br>\r\nKeunggulan Metode Eliminasi dengan Substitusi adalah sangat mudah \\digunakan dan efektif untuk menyelesaikan soal SPLDV secara cepat dan tepat. Kelemahan dari metode ini adalah tidak disarankan apabila digunakan untuk masalah persamaan linear yang kompleks seperti sistem persamaan linear 3 variabel.\r\n</li>\r\n</ol>', 11),
(35, 'Metode Penyelesaian SPLDV', 'Ada beberapa metode untuk menyelesaikan SPLDV sehingga diperoleh nilai himpunan penyelesaiannya yaitu metode grafik, metode eliminasi dengan penyamaan, metode eliminasi dengan substitusi, dan metode eliminasi dengan menjumlahkan atau mengurangkan. Setiap metode mempunyai keunggulan dan kelemahannya. Penjelasannya setiap metode SPLDV adalah sebagai berikut : <br>\r\n<ol>\r\n<li> Metode Eliminasi dengan Penyamaan. <br>\r\nMisalkan kita mempunyai SPLDV dalam variabel x dan y. Andaikan kita membuat suatu persamaan yang tidak lagi mengandung nilai x nya, maka dikatakan bahwa x telah dieliminasikan dengan penyamaan. Langkah strateginya adalah dengan mencari nilai x dari kedua persamaan yang diberikan itu (nilai y seolah-olah dianggap sebagai bilangan yang diketahui, maka dikatakan bahwa x dinyatakan dalam y). Kemudian hasil yang didapat dipersamakan. Dalam kasus ini kita juga dapat menyatakan nilai y ke dalam x, kemudian kita samakan dari persamaan-persamaan itu. <br>\r\nKelemahan dari metode eliminasi dengan penyamaan adalah akan memerlukan banyak langkah (dapat sampai 4 langkah), karena misalnya salah satu variabel yang diketahui tidak langsung disubstitusi ke persamaan, namun dicari variabel yang lain menggunakan eliminasi sehingga rawan akan ketidaktelitian saat menghitung. \r\n</li>\r\n<li> Metode Eliminasi dengan Substitusi <br>\r\nApabila kita mempunyai SPLDV dalam variabel x dan y. langkah-langkah penyelesaian metode Eliminasi dengan Substitusi adalah sebagai berikut : <br>\r\n1. Pilihlah salah satu persamaan yang sederhana, kemudian nyatakan y dalam x atau x dalam y. <br>\r\n2. Substitusikan x atau y yang diperoleh pada langkah 1 ke dalam persamaan lainnya. <br>\r\n3. Selesaikan persamaan yang diperoleh pada langkah 2. <br>\r\n4. Tuliskan himpunan penyelesainnya. <br>\r\nKeunggulan Metode Eliminasi dengan Substitusi adalah sangat mudah \\digunakan dan efektif untuk menyelesaikan soal SPLDV secara cepat dan tepat. Kelemahan dari metode ini adalah tidak disarankan apabila digunakan untuk masalah persamaan linear yang kompleks seperti sistem persamaan linear 3 variabel.\r\n</li>\r\n</ol>', 12),
(36, 'Pengertian', 'Statistika adalah salah satu cabang dari matematika yang berkaitan dengan cara pengumpulan data, penyusunan data, penyajian data, dan pengolahan data, kemudian hasilnya dapat digunakan untuk pengambilan keputusan atau kesimpulan sesua karakteristik data tersebut.', 13),
(37, 'Pengertian', 'Statistika adalah salah satu cabang dari matematika yang berkaitan dengan cara pengumpulan data, penyusunan data, penyajian data, dan pengolahan data, kemudian hasilnya dapat digunakan untuk pengambilan keputusan atau kesimpulan sesua karakteristik data tersebut.', 14),
(38, 'Pengertian', 'Statistika adalah salah satu cabang dari matematika yang berkaitan dengan cara pengumpulan data, penyusunan data, penyajian data, dan pengolahan data, kemudian hasilnya dapat digunakan untuk pengambilan keputusan atau kesimpulan sesua karakteristik data tersebut.', 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id_course`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`id_modul`),
  ADD KEY `id_course` (`id_course`);

--
-- Indexes for table `record_siswa`
--
ALTER TABLE `record_siswa`
  ADD PRIMARY KEY (`id_record`),
  ADD KEY `id_course` (`id_course`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `submodul`
--
ALTER TABLE `submodul`
  ADD PRIMARY KEY (`id_submodul`),
  ADD KEY `id_modul` (`id_modul`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id_course` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `modul`
--
ALTER TABLE `modul`
  MODIFY `id_modul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `record_siswa`
--
ALTER TABLE `record_siswa`
  MODIFY `id_record` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=420;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `submodul`
--
ALTER TABLE `submodul`
  MODIFY `id_submodul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `modul`
--
ALTER TABLE `modul`
  ADD CONSTRAINT `modul_ibfk_1` FOREIGN KEY (`id_course`) REFERENCES `course` (`id_course`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `record_siswa`
--
ALTER TABLE `record_siswa`
  ADD CONSTRAINT `record_siswa_ibfk_1` FOREIGN KEY (`id_course`) REFERENCES `course` (`id_course`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `record_siswa_ibfk_3` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `submodul`
--
ALTER TABLE `submodul`
  ADD CONSTRAINT `submodul_ibfk_1` FOREIGN KEY (`id_modul`) REFERENCES `modul` (`id_modul`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
