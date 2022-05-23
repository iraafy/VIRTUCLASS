-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2022 at 07:04 AM
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
(2, 'Matematika', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum dolor sit amet', 2),
(3, 'Matematika', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum dolor sit amet', 3),
(4, 'Fisika', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum dolor sit amet', 2),
(5, 'Fisika', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum dolor sit amet', 3),
(6, 'Kimia', 'https://mtusite.files.wordpress.com/2015/10/868336-physics-wallpaper.jpg', 'lorem ipsum dolor sit amet', 2),
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
(2, 'Trigonometri', 3),
(3, 'Besaran dan satuan', 5),
(4, 'Suhu dan kalor', 4),
(5, 'Teori Atom', 6),
(6, 'Modul baru', 10);

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
  `id_course` int(11) NOT NULL,
  `bukti_nilai` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `record_siswa`
--

INSERT INTO `record_siswa` (`id_record`, `tanggal`, `nilai`, `kategori_nilai`, `id_user`, `id_course`, `bukti_nilai`) VALUES
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
(14, '2023-03-15', 91, 'PHB', 6, 2, 'bukti_raport.jpg');

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
(11, 'cek sub modul1', 'nsjfasf', 3),
(12, 'nadjnajf', 'afnmasnmfnam', 6),
(13, 'baru ni', 'adkjakda', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(255) NOT NULL,
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
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `asal_sekolah`, `jk`, `kelas`, `email`, `telepon`, `password`, `kartu_pelajar`, `validated`) VALUES
(1, 'Iqbal', 'SMA 1', 'Laki-Laki', 'X', 'Iqbal@mail.com', '000011112222', 'Iqbal123', 'kartu-pelajar-dummy.jpg', 1),
(2, 'Rahmat', 'SMA 2', 'Laki-Laki', 'X', 'Rahmat@mail.com', '000011112223', 'Rahmat123', 'kartu-pelajar-dummy.jpg', 1),
(3, 'Azka', 'SMA 3', 'Laki-Laki', 'null', 'Azka@mail.com', '000011112222', 'Azka123', 'kartu-pelajar-dummy.jpg', 0),
(4, 'Iraa', 'SMA 4', 'Perempuan', 'XII', 'Iraa@mail.com', '000011112222', 'Iraa123', 'kartu-pelajar-dummy.jpg', 1),
(5, 'Aysha', 'SMA 5', 'Perempuan', 'null', 'Aysha@mail.com', '000011112222', 'Aysha123', 'kartu-pelajar-dummy.jpg', 1),
(6, 'Zahra', 'SMA 6', 'Perempuan', 'null', 'Zahra@mail.com', '000011112222', 'Zahra123', 'kartu-pelajar-dummy.jpg', 1),
(7, 'Abighailllllll', 'SMA 7', 'Perempuan', 'XII', 'Abighail@mail.com', '000011112222', 'Abighail123', 'kartu-pelajar-dummy.jpg', 1),
(8, 'ahjsahfjkh', 'jbsafjba', 'Laki-Laki', 'null', 'jdbjga@jsab.cs', '2849178', '123', '6c04db0908899315efef1d9623e026e0-kartu-pelajar-dummy.jpg', 0);

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
  ADD PRIMARY KEY (`id_user`);

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
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `modul`
--
ALTER TABLE `modul`
  MODIFY `id_modul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `record_siswa`
--
ALTER TABLE `record_siswa`
  MODIFY `id_record` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `submodul`
--
ALTER TABLE `submodul`
  MODIFY `id_submodul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
