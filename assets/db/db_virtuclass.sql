-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2022 at 06:58 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

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
(1, 'Matematika', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum dolor sit amet', 1),
(2, 'Matematika', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum dolor sit amet', 2),
(3, 'Matematika', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum dolor sit amet', 3),
(4, 'Fisika', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum dolor sit amet', 2),
(5, 'Fisika', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum dolor sit amet', 3),
(6, 'Kimia', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum dolor sit amet', 2),
(7, 'Fisika', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum dolor sit amet', 1),
(8, 'Kimia', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum dolor sit amet', 1),
(9, 'Kimia', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum dolor sit amet', 3),
(10, 'Course Baru', 'http://', 'lorem ipsum', 5),
(11, 'Course Baru 2', 'http://', 'lorem ipsum', 2);

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
(2, 'Budiman', 'budiman@mail.com', 'budiman'),
(3, 'ani', 'ani@mail.com', 'ani');

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
(1, 'IX'),
(2, 'X'),
(3, 'XI'),
(4, ''),
(5, 'XII'),
(6, 'Umum');

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
(1, 'SPLDV', 1),
(2, 'Trigonometri', 3),
(3, 'Besaran dan satuan', 5),
(4, 'Suhu dan kalor', 4),
(5, 'Teori Atom', 6),
(6, 'Modul baru', 10),
(7, 'SPLTV', 1),
(8, 'SPLEV', 1);

-- --------------------------------------------------------

--
-- Table structure for table `record_siswa`
--

CREATE TABLE `record_siswa` (
  `id_record` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nilai` float NOT NULL,
  `kategori_nilai` enum('UTS','UAS','PHB') NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_course` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `record_siswa`
--

INSERT INTO `record_siswa` (`id_record`, `tanggal`, `nilai`, `kategori_nilai`, `id_user`, `id_kelas`, `id_course`) VALUES
(1, '2022-06-18', 90, 'UTS', 6, 2, 2),
(2, '2022-11-15', 65, 'UAS', 6, 1, 2),
(3, '2022-08-17', 78, 'UTS', 5, 2, 3),
(4, '2022-04-19', 93, 'UAS', 2, 2, 2),
(5, '2023-02-13', 68, 'UAS', 2, 2, 2),
(6, '2023-03-15', 88, 'PHB', 3, 3, 3),
(7, '2023-02-13', 93, 'UTS', 2, 3, 3),
(8, '2022-06-18', 98, 'PHB', 5, 3, 1),
(9, '2022-10-16', 99, 'UTS', 1, 3, 2),
(10, '2023-02-13', 78, 'PHB', 4, 3, 1),
(11, '2023-02-13', 65, 'UAS', 4, 1, 2),
(12, '2022-07-18', 74, 'PHB', 3, 1, 1),
(13, '2023-02-13', 96, 'UAS', 2, 3, 2),
(14, '2023-03-15', 91, 'PHB', 6, 3, 2),
(15, '2022-05-19', 92, 'PHB', 4, 2, 1),
(16, '2022-04-19', 63, 'PHB', 2, 3, 3),
(17, '2022-06-18', 98, 'PHB', 7, 3, 3),
(18, '2022-04-19', 92, 'UAS', 3, 2, 1),
(19, '2022-10-16', 82, 'PHB', 7, 2, 1),
(20, '2022-11-15', 67, 'UAS', 3, 2, 2),
(21, '2022-06-18', 100, 'UTS', 3, 2, 1),
(22, '2022-11-15', 83, 'UTS', 6, 3, 1),
(23, '2022-12-15', 91, 'UTS', 6, 2, 2),
(24, '2022-08-17', 87, 'UTS', 6, 2, 2),
(25, '2023-03-15', 83, 'UTS', 3, 3, 3),
(26, '2022-04-19', 89, 'PHB', 2, 1, 2),
(27, '2022-10-16', 66, 'UTS', 6, 2, 2),
(28, '2022-06-18', 98, 'PHB', 1, 1, 1),
(29, '2023-02-13', 92, 'UAS', 7, 3, 1),
(30, '2022-07-18', 62, 'UAS', 2, 2, 2),
(31, '2022-04-19', 60, 'PHB', 6, 1, 1),
(32, '2022-07-18', 61, 'UTS', 4, 1, 3),
(33, '2022-05-19', 74, 'UAS', 7, 1, 1),
(34, '2022-04-19', 86, 'PHB', 6, 1, 1),
(35, '2022-11-15', 98, 'PHB', 4, 1, 2),
(36, '2023-03-15', 70, 'PHB', 3, 1, 3),
(37, '2022-04-19', 67, 'UAS', 7, 1, 1),
(38, '2022-12-15', 92, 'PHB', 1, 1, 1),
(39, '2022-09-16', 94, 'UAS', 7, 3, 2),
(40, '2022-07-18', 63, 'UTS', 5, 2, 2),
(41, '2023-03-15', 89, 'PHB', 6, 2, 1),
(42, '2023-03-15', 72, 'UAS', 3, 2, 3),
(43, '2022-09-16', 87, 'UTS', 6, 1, 1),
(44, '2023-03-15', 99, 'UTS', 2, 3, 3),
(45, '2022-10-16', 69, 'UAS', 3, 1, 1),
(46, '2022-09-16', 71, 'UAS', 4, 3, 3),
(47, '2022-06-18', 80, 'PHB', 4, 3, 1),
(48, '2022-07-18', 65, 'UAS', 4, 2, 1),
(49, '2023-02-13', 76, 'PHB', 1, 2, 1),
(50, '2022-05-19', 72, 'UTS', 2, 3, 2),
(51, '2022-08-17', 82, 'UTS', 5, 2, 3),
(52, '2022-08-17', 83, 'UTS', 1, 3, 1),
(53, '2022-09-16', 100, 'PHB', 5, 2, 1),
(54, '2023-02-13', 68, 'UAS', 7, 2, 1),
(55, '2022-12-15', 65, 'UAS', 1, 1, 1),
(56, '2022-09-16', 92, 'UTS', 4, 2, 3),
(57, '2022-12-15', 85, 'PHB', 4, 1, 3),
(58, '2022-08-17', 82, 'PHB', 4, 3, 1),
(59, '2022-07-18', 93, 'UTS', 7, 3, 2),
(60, '2022-11-15', 84, 'UAS', 1, 3, 3),
(61, '2022-09-16', 80, 'PHB', 3, 3, 1),
(62, '2022-12-15', 71, 'UTS', 3, 2, 3),
(63, '2022-12-15', 98, 'PHB', 7, 1, 2),
(64, '2022-05-19', 89, 'PHB', 7, 2, 1),
(65, '2022-10-16', 91, 'UTS', 4, 1, 1),
(66, '2022-08-17', 68, 'UAS', 4, 2, 3),
(67, '2023-02-13', 90, 'UAS', 2, 3, 1),
(68, '2022-12-15', 92, 'UAS', 2, 1, 1),
(69, '2022-12-15', 72, 'UAS', 7, 1, 2),
(70, '2022-12-15', 86, 'UTS', 3, 1, 1),
(71, '2022-08-17', 91, 'UAS', 6, 1, 2),
(72, '2022-04-19', 100, 'UTS', 1, 2, 2),
(73, '2023-02-13', 63, 'UAS', 2, 3, 3),
(74, '2023-02-13', 73, 'UAS', 1, 2, 3),
(75, '2023-01-14', 74, 'UTS', 2, 2, 1),
(76, '2023-02-13', 64, 'PHB', 4, 1, 3),
(77, '2022-10-16', 72, 'UTS', 6, 3, 1),
(78, '2022-07-18', 71, 'PHB', 5, 3, 3),
(79, '2022-07-18', 60, 'PHB', 3, 3, 2),
(80, '2022-04-19', 95, 'PHB', 1, 2, 3),
(81, '2022-07-18', 62, 'PHB', 3, 1, 1),
(82, '2022-12-15', 75, 'UAS', 5, 3, 3),
(83, '2022-09-16', 92, 'UAS', 4, 2, 1),
(84, '2022-04-19', 61, 'UAS', 6, 1, 1),
(85, '2022-11-15', 60, 'UTS', 6, 1, 2),
(86, '2022-06-18', 68, 'UTS', 6, 1, 2),
(87, '2022-11-15', 70, 'UTS', 7, 2, 2),
(88, '2022-05-19', 82, 'UTS', 4, 2, 2),
(89, '2023-02-13', 86, 'UAS', 3, 1, 1),
(90, '2022-04-19', 78, 'UAS', 1, 3, 3),
(91, '2022-05-19', 61, 'UTS', 4, 3, 1),
(92, '2022-11-15', 91, 'UAS', 5, 3, 2),
(93, '2022-05-19', 68, 'UAS', 4, 3, 3),
(94, '2022-11-15', 62, 'PHB', 4, 2, 3),
(95, '2022-09-16', 73, 'UTS', 5, 3, 2),
(96, '2022-09-16', 99, 'UAS', 1, 3, 2),
(97, '2022-07-18', 87, 'PHB', 7, 2, 2),
(98, '2022-08-17', 85, 'UAS', 6, 2, 3),
(99, '2022-04-19', 76, 'UAS', 3, 3, 2),
(100, '2022-05-19', 68, 'UTS', 6, 2, 1);

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
(7, 'sub modul1', 'content submodul1', 3),
(8, 'submodul2', 'content submodul2', 5),
(9, '', 'anabnfba', 2),
(10, 'cek sub modul', 'ahjdha', 1),
(11, 'cek sub modul1', 'nsjfasf', 3),
(12, 'nadjnajf', 'afnmasnmfnam', 6),
(13, 'baru ni', 'adkjakda', 2),
(14, 'cobaaaaa', 'andmada', 2),
(15, 'badban', 'adnab', 4),
(16, 'cek video  youtube', '<iframe style=\"width: 100%; height: 710px; overflow: auto;\" src=\"https://www.youtube.com/embed/0JqvJ8oEvg0\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 1),
(17, 'Cek konten dan gambar', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam aliquet mi et orci malesuada, accumsan maximus leo viverra. Nam porta ut magna sit amet faucibus. Aliquam gravida tellus at tincidunt ultrices. Proin nunc lorem, imperdiet eu velit sit amet, tempus rutrum magna. Suspendisse faucibus velit ex. Integer ex tellus, tincidunt a ultricies non, pretium sed sapien. Cras sed felis at eros lobortis pellentesque quis et lacus. Proin tristique lacus vitae magna ornare hendrerit. Aenean cursus, ipsum nec dignissim tempus, metus ligula congue velit, eu eleifend odio ipsum eget ante. Proin ac aliquam nunc. Sed consectetur in turpis id cursus. In vestibulum varius placerat. Suspendisse potenti. Sed iaculis tempor massa dignissim facilisis. Donec fringilla, lectus vitae tempus feugiat, tellus sem condimentum sem, in malesuada sem erat in neque.</br>\r\n</br>\r\nMauris sodales convallis egestas. Mauris congue tortor et dictum ornare. Praesent viverra lacinia elit, eu posuere dolor hendrerit sit amet. Aenean ullamcorper dui at nulla hendrerit tincidunt. Donec eu velit et tellus pharetra viverra at at orci. Donec sed dui vitae lacus lobortis consequat. Proin a ante vel nisi sodales finibus. Phasellus ac interdum mi, ac dapibus eros. Suspendisse at iaculis velit.</br>\r\n</br>\r\n<img src=\"https://images.theconversation.com/files/458000/original/file-20220413-16-ptwkj1.jpg?ixlib=rb-1.1.0&rect=23%2C746%2C5014%2C2507&q=45&auto=format&w=668&h=324&fit=crop\" alt=\"fisika\"></br>\r\n</br>\r\nOrci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce eget placerat elit. In quis eleifend leo. In quis ex a odio efficitur congue non ac ligula. Etiam tincidunt augue lectus, sed mattis ex consequat quis. Vivamus quis velit eu magna mollis maximus. Mauris lectus felis, euismod a volutpat sed, venenatis id est. Nunc lorem ex, rutrum ut lacus ac, venenatis fermentum leo. Donec tempus volutpat libero, bibendum egestas risus laoreet sed. Morbi pretium ac mauris vitae imperdiet. Nullam eu scelerisque metus. Ut viverra eleifend ipsum id cursus. Etiam feugiat iaculis viverra. Vivamus scelerisque non dui ac mattis.</br>\r\n<img src=\"https://i.ytimg.com/vi/Q_qgWQXc5io/maxresdefault.jpg\" alt=\"monyet joged\"></br>\r\n</br>\r\nInteger et volutpat leo. Etiam metus orci, pellentesque consequat varius at, placerat et odio. Etiam eget ligula non purus commodo laoreet in eget est. Nulla vel erat quam. Nulla facilisi. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vestibulum malesuada dui vel imperdiet tristique. Suspendisse at nunc sit amet dui sollicitudin vulputate id id nulla.', 1),
(18, 'Fisika Kuantum', '<iframe style=\"width: 100%; height: 710px; overflow: auto;\"  src=\"https://www.youtube.com/embed/GT7HS_gZoOM\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 4),
(19, 'Video 2', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/JVANLCfV70w\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 7),
(20, 'HOHOHIHE', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/jDaEkGZ8mZI\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 8);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
  `asal_sekolah` varchar(100) NOT NULL,
  `jk` enum('Perempuan','Laki-Laki') NOT NULL,
  `email` varchar(100) NOT NULL,
  `telepon` varchar(13) NOT NULL,
  `password` varchar(50) NOT NULL,
  `kartu_pelajar` varchar(255) NOT NULL,
  `validated` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `asal_sekolah`, `jk`, `email`, `telepon`, `password`, `kartu_pelajar`, `validated`) VALUES
(1, 'Iqbal', 'SMA 1', 'Laki-Laki', 'Iqbal@mail.com', '000011112222', 'Iqbal123', '', 1),
(2, 'Rahmat', 'SMA 2', 'Laki-Laki', 'Rahmat@mail.com', '000011112222', 'Rahmat123', '', 1),
(3, 'Azka', 'SMA 3', 'Laki-Laki', 'Azka@mail.com', '000011112222', 'Azka123', '', 1),
(4, 'Iraa', 'SMA 4', 'Perempuan', 'Iraa@mail.com', '000011112222', 'Iraa123', '', 1),
(5, 'Aysha', 'SMA 5', 'Perempuan', 'Aysha@mail.com', '000011112222', 'Aysha123', '', 0),
(6, 'Zahra', 'SMA 6', 'Perempuan', 'Zahra@mail.com', '000011112222', 'Zahra123', '', 0),
(7, 'Abighail', 'SMA 7', 'Perempuan', 'Abighail@mail.com', '000011112222', 'Abighail123', '', 0),
(9, 'data dummy', 'SMK Asal', '', 'admin1@mail.com', '', '123', 'Capture.PNG', 0),
(10, 'data dummy2', 'Sekolah Menengah Kejuruan 200 Bandung', '', 'dmmy@mail.com', '09889791', 'dummy123', 'Capture.PNG', 1),
(11, 'coba', 'coba', 'Perempuan', 'coba', 'coba', 'coba', 'coba', 0),
(12, 'bsdhdbh', 'sjdhjhsj', 'Laki-Laki', 'jahdjfh@jsdfj.com', '72567265', '123', 'Untitled Diagram.drawio (6).png', 0),
(13, 'jdjhd', 'kdfjkhdaj', 'Perempuan', 'iraaaa@mail.com', '358773', '123', 'Untitled Diagram.drawio (6).png', 1),
(14, 'coba', 'Sekolah Menengah Kejuruan Coba', 'Perempuan', 'cobaa@mail.com', '0983959275', '123', '1-Untitled Diagram.drawio (6).png', 0),
(32, 'daghg', 'adghg', 'Perempuan', 'jdhfj@sf.svik', '83275925', '123', 'b70f495d81a98b2991ee7191ea5d815b', 0),
(34, 'hdfjkahjhd', 'dsgjhsj', 'Perempuan', 'sjsa@ksjf.coja', '185782', '123', 'a917276f30546e6d8442c5235e8ec237', 0),
(39, 'jadjfh', 'jdhja', 'Perempuan', 'ajhdj@lks.vsn', '0983959275', '123', '881d559e96a3cfae34df7144d68ae57c-Untitled Diagram.drawio (6).png', 0);

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
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_course` (`id_course`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `submodul`
--
ALTER TABLE `submodul`
  ADD PRIMARY KEY (`id_submodul`),
  ADD KEY `id_modul` (`id_modul`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

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
  MODIFY `id_course` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `modul`
--
ALTER TABLE `modul`
  MODIFY `id_modul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `record_siswa`
--
ALTER TABLE `record_siswa`
  MODIFY `id_record` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `submodul`
--
ALTER TABLE `submodul`
  MODIFY `id_submodul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

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
  ADD CONSTRAINT `record_siswa_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `record_siswa_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `submodul`
--
ALTER TABLE `submodul`
  ADD CONSTRAINT `submodul_ibfk_1` FOREIGN KEY (`id_modul`) REFERENCES `modul` (`id_modul`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
