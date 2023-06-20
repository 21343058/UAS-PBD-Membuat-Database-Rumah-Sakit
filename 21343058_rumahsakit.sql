-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2023 at 04:04 PM
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
-- Database: `21343058_rumahsakit`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ppasien` ()  begin
select* from tb058_pasien;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `rawatinapdata` ()  begin
select
ri.rawatinapid, p.nama as nama_pasien,p.jenis_kelamin, p.tanggal_lahir,
p.alamat as alamat_pasien, p.nohp as nohp_pasien, p.golongan_darah,
d.nama as nama_dokter, d.spesialisasi, d.tanggal_lahir as tanggal_lahir_dokter,
d.alamat as alamat_dokter, d.nohp as nohp_dokter, d.email,
ri.tanggal_masuk,
ri.tanggal_keluar, ri.kamar
from
tb058_rawatinap ri inner join tb058_pasien p on ri.pasienid = p.pasienid
inner join tb058_dokter d on ri.dokterid = d.dokterid;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `hasil_pemeriksaan`
-- (See below for the actual view)
--
CREATE TABLE `hasil_pemeriksaan` (
`Pasien` varchar(50)
,`tanggal_pemeriksaan` date
,`diagnosa` varchar(40)
,`dosis` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pasdos`
-- (See below for the actual view)
--
CREATE TABLE `pasdos` (
`pasien` varchar(50)
,`dokterid` int(5)
,`diagnosa` varchar(40)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pasien_rawatinap`
-- (See below for the actual view)
--
CREATE TABLE `pasien_rawatinap` (
`Pasien` varchar(50)
,`dokter` varchar(50)
,`rawatinapid` int(5)
,`tanggal_masuk` date
,`tanggal_keluar` date
);

-- --------------------------------------------------------

--
-- Table structure for table `tb058_dokter`
--

CREATE TABLE `tb058_dokter` (
  `DokterID` int(5) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Spesialisasi` varchar(30) NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `Alamat` varchar(75) NOT NULL,
  `NoHp` varchar(15) DEFAULT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb058_dokter`
--

INSERT INTO `tb058_dokter` (`DokterID`, `Nama`, `Spesialisasi`, `tanggal_lahir`, `Alamat`, `NoHp`, `Email`) VALUES
(1, 'junaidi', 'umum', '2023-05-01', 'jakarta', '111111111111', '1111@gmail.com'),
(9901, 'dr. Achmad Triadi, Sp.OG', 'Sp. Kandungan & Kebidanan', '1987-05-01', 'Simpang Presiden', '089911111111', 'achmadtriadi@gmail.com'),
(9902, 'dr. Adelia Wulandari, Sp.KK', 'Sp. Kulit & Kelamin', '1985-06-16', 'Astratek', '089922222222', 'adelwulan@gmail.com'),
(9903, 'dr. Afif Zjauhari, Sp.THT-KL', 'Sp. THT', '1980-07-13', 'Lolong', '089933333333', 'afifzjau@gmail.com'),
(9904, 'dr. Agraini, Sp.KJ', 'Sp. Jiwa', '1988-09-28', 'Gunung Pangilun', '089944444444', 'agraini@gmail.com'),
(9905, 'dr. Abdul Rahman, Sp.PD', 'Sp. Penyakit Dalam', '1979-10-25', 'Tabing', '089955555555', 'abdulman@gmail.com'),
(9906, 'dr. Adil, Sp.PD', 'Sp. Penyakit Dalam', '1984-02-06', 'Ulak Karang', '089966666666', 'adil@gmail.com'),
(9907, 'dr. A. D. Pasaribu, Sp.A', 'Sp. Anak', '1960-01-15', 'Astratek', '089977777777', 'pasaribu@gmail.com'),
(9908, 'dr. Adria Rusli, Sp.P', 'Sp. Paru', '1988-02-03', 'Pondok', '089988888888', 'adrusli@gmail.com'),
(9909, 'dr. A. Setiawan Zulkarnain', 'Dokter Umum', '1988-04-03', 'Lubuk Begalung', '089999999999', 'setiazul@gmail.com'),
(9910, 'dr. Alicia Sandjaja', 'Dokter Umum', '1985-02-14', 'Lubuk Buaya', '089900000000', 'Alicisand@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tb058_jadwaldokter`
--

CREATE TABLE `tb058_jadwaldokter` (
  `JadwalID` int(5) NOT NULL,
  `DokterID` int(5) NOT NULL,
  `Hari` varchar(30) NOT NULL,
  `jam_mulai` varchar(20) DEFAULT NULL,
  `jam_selesai` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb058_jadwaldokter`
--

INSERT INTO `tb058_jadwaldokter` (`JadwalID`, `DokterID`, `Hari`, `jam_mulai`, `jam_selesai`) VALUES
(987, 9910, 'Senin - Minggu', '10.00', '17.00'),
(1234, 9901, 'Jumat - Sabtu', '10.00 ', '16.00'),
(2345, 9902, 'Jumat - Minggu', '09.00 ', '17.00'),
(3456, 9903, 'Senin - Jumat', '09.00', '15.00'),
(4567, 9904, 'Senin - Kamis', '10.00', '15.00'),
(5678, 9905, 'Senin dan Kamis', '08.00', '17.00'),
(6789, 9906, 'Senin - Jumat', '09.00', '18.00'),
(7891, 9907, 'Senin , Selasa', '09.00', '15.00'),
(8912, 9908, 'Jumat , Sabtu', '10.00', '17.00'),
(9123, 9909, 'Jumat - Minggu', '08.00', '15.00');

-- --------------------------------------------------------

--
-- Table structure for table `tb058_obat`
--

CREATE TABLE `tb058_obat` (
  `ObatID` int(5) NOT NULL,
  `Nama Obat` varchar(50) NOT NULL,
  `Keterangan` varchar(50) NOT NULL,
  `Harga` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb058_obat`
--

INSERT INTO `tb058_obat` (`ObatID`, `Nama Obat`, `Keterangan`, `Harga`) VALUES
(10, 'Amoxicillin', 'Antibiotik', 68000),
(11, 'Ibuprofen', ' Mengatasi demam, sakit kepala, atau sakit gigi.', 22000),
(22, 'Panadol Biru', 'Mengatasi Demam dan Batuk', 13000),
(33, 'Krim hidrokortison', 'Mengobati eksim, inflamasi, kemerahan,serta gatal-', 40000),
(44, 'Mixagrip Flu', 'Mengatasi Flu dan Batuk', 5000),
(55, 'Sanmol', 'Penurun panas, pereda nyeri', 5000),
(66, 'Antihistamin', ' mengatasi pusing dan mual.', 15000),
(77, 'Komix Herbal Sirup', 'melegakan pernapasan dan mengencerkan dahak yang k', 20000),
(88, 'Acetaminophen (paracetamol)', 'mengobati nyeri ringan sampai sedang serta meredak', 10000),
(99, 'Kortikosteroid', 'mengurangi peradangan di paru-paru', 35000),
(777, 'Dumin', 'Demam', 23000);

--
-- Triggers `tb058_obat`
--
DELIMITER $$
CREATE TRIGGER `paja_obat` BEFORE INSERT ON `tb058_obat` FOR EACH ROW begin
set new.harga = new.harga + 5000;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `pajak_obat` BEFORE INSERT ON `tb058_obat` FOR EACH ROW begin
set new.harga = new.harga + 5000;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb058_pasien`
--

CREATE TABLE `tb058_pasien` (
  `PasienID` int(5) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Jenis_kelamin` varchar(10) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `Alamat` varchar(75) NOT NULL,
  `NoHp` varchar(20) DEFAULT NULL,
  `golongan_darah` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb058_pasien`
--

INSERT INTO `tb058_pasien` (`PasienID`, `Nama`, `Jenis_kelamin`, `tanggal_lahir`, `Alamat`, `NoHp`, `golongan_darah`) VALUES
(1101, 'Muhammad Farel Fahlevi', 'Lk', '2003-08-15', 'Jl.Selasih', '085295450485', 'B-'),
(1102, 'Muhammad Fathur Rahman', 'Lk', '2004-02-02', 'Lapai', '082222222222', 'A'),
(1103, 'Ghenta Alif Alde', 'Lk', '2003-02-18', 'Puruih', '083333333333', 'A'),
(1104, 'Arafil Azmi', 'Lk', '2002-01-25', 'Tabing', '084444444444', 'O'),
(1105, 'Fadhil Nugraha Wikarya', 'Lk', '2003-12-23', 'Lubuk Buaya', '085555555555', 'B'),
(1106, 'Aisyah', 'Pr', '2003-05-09', 'Limau Manih', '086666666666', 'B-'),
(1107, 'Dinda', 'Pr', '2003-07-28', 'Gadut', '087777777777', 'A'),
(1108, 'Nabilla', 'Pr', '2003-03-16', 'Ulak Karang', '088888888888', 'O'),
(1109, 'Hanifah', 'Pr', '2002-09-19', 'Pondok', '089999999999', 'A'),
(1110, 'Fanny', 'Pr', '2001-08-26', 'Lubuk Begalung', '080000000000', 'B-'),
(5555, 'RAFAEL LEVII', 'lk', '2023-05-01', 'Alamat: indonesia', '5555555555', 'B-');

--
-- Triggers `tb058_pasien`
--
DELIMITER $$
CREATE TRIGGER `tambah_pasien` BEFORE INSERT ON `tb058_pasien` FOR EACH ROW begin
set new.nama = upper(new.nama);
set new.alamat = concat('Alamat: ', new.alamat);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb058_pemeriksaan`
--

CREATE TABLE `tb058_pemeriksaan` (
  `PemeriksaanID` int(5) NOT NULL,
  `PasienID` int(5) NOT NULL,
  `DokterID` int(5) NOT NULL,
  `tanggal_pemeriksaan` date DEFAULT NULL,
  `Diagnosa` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb058_pemeriksaan`
--

INSERT INTO `tb058_pemeriksaan` (`PemeriksaanID`, `PasienID`, `DokterID`, `tanggal_pemeriksaan`, `Diagnosa`) VALUES
(1468, 1105, 9906, '2023-05-19', 'Usus Buntu (Nyeri parah di perut kanan)'),
(2141, 1108, 9906, '2023-05-19', 'Dismenore'),
(4324, 1101, 9910, '2023-05-21', 'Demam dan Batuk'),
(4376, 1106, 9902, '2023-05-20', 'Dermatitis'),
(5131, 1102, 9910, '2023-05-23', 'Flu & Batuk'),
(8421, 1107, 9910, '2023-05-18', 'Demam Tinggi'),
(8432, 1110, 9910, '2023-05-22', 'Pusing & Mual'),
(8564, 1104, 9910, '2023-05-21', 'Batuk Berdahak'),
(8774, 1109, 9910, '2023-05-17', 'Deman dan Pegal\" di seluruh tubuh'),
(9653, 1103, 9908, '2023-05-20', 'PPOK');

-- --------------------------------------------------------

--
-- Table structure for table `tb058_rawatinap`
--

CREATE TABLE `tb058_rawatinap` (
  `RawatInapID` int(5) NOT NULL,
  `PasienID` int(5) NOT NULL,
  `DokterID` int(5) NOT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `tanggal_keluar` date DEFAULT NULL,
  `kamar` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb058_rawatinap`
--

INSERT INTO `tb058_rawatinap` (`RawatInapID`, `PasienID`, `DokterID`, `tanggal_masuk`, `tanggal_keluar`, `kamar`) VALUES
(101, 1101, 9910, '2023-05-21', '2023-05-21', '-'),
(102, 1108, 9906, '2023-05-19', '2023-05-21', 'VVIP-1'),
(103, 1102, 9910, '2023-05-23', '2023-05-24', 'Kelas III A'),
(104, 1109, 9910, '2023-05-17', '2023-05-17', '-'),
(105, 1103, 9908, '2023-05-20', '2023-05-23', 'VIP-1'),
(106, 1110, 9910, '2023-05-22', '2023-05-22', '-'),
(107, 1105, 9906, '2023-05-19', '2023-05-25', 'VVIP-2'),
(108, 1107, 9910, '2023-05-18', '2023-05-18', '-'),
(109, 1104, 9910, '2023-05-21', '2023-05-21', '-'),
(110, 1106, 9902, '2023-05-20', '2023-05-20', '-');

-- --------------------------------------------------------

--
-- Table structure for table `tb058_resep`
--

CREATE TABLE `tb058_resep` (
  `ResepID` int(5) NOT NULL,
  `PasienID` int(5) NOT NULL,
  `DokterID` int(5) NOT NULL,
  `Tanggal_resep` date DEFAULT NULL,
  `Dosis` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb058_resep`
--

INSERT INTO `tb058_resep` (`ResepID`, `PasienID`, `DokterID`, `Tanggal_resep`, `Dosis`) VALUES
(0, 1106, 9902, '2023-05-20', 'Krim hidrokortison (Pagi dan M'),
(111, 1101, 9910, '2023-05-21', 'Panadol (3x sehari)'),
(222, 1108, 9906, '2023-05-19', 'Ibuprofen (ketika sakit lagi)'),
(333, 1102, 9910, '2023-05-23', 'Mixagrip Flu (3x Sehari)'),
(444, 1109, 9910, '2023-05-17', ' Acetaminophen (3x sehari)'),
(555, 1103, 9908, '2023-05-20', 'Kortikosteroid (3x sehari)'),
(666, 1110, 9910, '2023-05-22', 'Antihistamin (3x sehari)'),
(777, 1105, 9906, '2023-05-19', 'Amoxicillin (3x sehari)'),
(888, 1107, 9910, '2023-05-18', 'Sanmol'),
(999, 1104, 9910, '2023-05-21', 'Komix Herbal Sirup (3x sehari)');

-- --------------------------------------------------------

--
-- Structure for view `hasil_pemeriksaan`
--
DROP TABLE IF EXISTS `hasil_pemeriksaan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hasil_pemeriksaan`  AS SELECT `tb058_pasien`.`Nama` AS `Pasien`, `tb058_pemeriksaan`.`tanggal_pemeriksaan` AS `tanggal_pemeriksaan`, `tb058_pemeriksaan`.`Diagnosa` AS `diagnosa`, `tb058_resep`.`Dosis` AS `dosis` FROM ((`tb058_pasien` join `tb058_pemeriksaan` on(`tb058_pasien`.`PasienID` = `tb058_pemeriksaan`.`PasienID`)) join `tb058_resep` on(`tb058_pasien`.`PasienID` = `tb058_resep`.`PasienID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pasdos`
--
DROP TABLE IF EXISTS `pasdos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pasdos`  AS SELECT `tb058_pasien`.`Nama` AS `pasien`, `tb058_pemeriksaan`.`DokterID` AS `dokterid`, `tb058_pemeriksaan`.`Diagnosa` AS `diagnosa` FROM (`tb058_pasien` join `tb058_pemeriksaan` on(`tb058_pasien`.`PasienID` = `tb058_pemeriksaan`.`PasienID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pasien_rawatinap`
--
DROP TABLE IF EXISTS `pasien_rawatinap`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pasien_rawatinap`  AS SELECT `p`.`Nama` AS `Pasien`, `d`.`Nama` AS `dokter`, `r`.`RawatInapID` AS `rawatinapid`, `r`.`tanggal_masuk` AS `tanggal_masuk`, `r`.`tanggal_keluar` AS `tanggal_keluar` FROM ((`tb058_pasien` `p` join `tb058_rawatinap` `r` on(`p`.`PasienID` = `r`.`PasienID`)) join `tb058_dokter` `d` on(`r`.`DokterID` = `d`.`DokterID`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb058_dokter`
--
ALTER TABLE `tb058_dokter`
  ADD PRIMARY KEY (`DokterID`);

--
-- Indexes for table `tb058_jadwaldokter`
--
ALTER TABLE `tb058_jadwaldokter`
  ADD PRIMARY KEY (`JadwalID`),
  ADD KEY `DokterID` (`DokterID`);

--
-- Indexes for table `tb058_obat`
--
ALTER TABLE `tb058_obat`
  ADD PRIMARY KEY (`ObatID`);

--
-- Indexes for table `tb058_pasien`
--
ALTER TABLE `tb058_pasien`
  ADD PRIMARY KEY (`PasienID`);

--
-- Indexes for table `tb058_pemeriksaan`
--
ALTER TABLE `tb058_pemeriksaan`
  ADD PRIMARY KEY (`PemeriksaanID`),
  ADD KEY `PasienID` (`PasienID`),
  ADD KEY `DokterID` (`DokterID`);

--
-- Indexes for table `tb058_rawatinap`
--
ALTER TABLE `tb058_rawatinap`
  ADD PRIMARY KEY (`RawatInapID`),
  ADD KEY `PasienID` (`PasienID`),
  ADD KEY `DokterID` (`DokterID`);

--
-- Indexes for table `tb058_resep`
--
ALTER TABLE `tb058_resep`
  ADD PRIMARY KEY (`ResepID`),
  ADD KEY `DokterID` (`DokterID`),
  ADD KEY `tb058_resep_ibfk_1` (`PasienID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb058_jadwaldokter`
--
ALTER TABLE `tb058_jadwaldokter`
  ADD CONSTRAINT `tb058_jadwaldokter_ibfk_1` FOREIGN KEY (`DokterID`) REFERENCES `tb058_dokter` (`DokterID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb058_pemeriksaan`
--
ALTER TABLE `tb058_pemeriksaan`
  ADD CONSTRAINT `tb058_pemeriksaan_ibfk_1` FOREIGN KEY (`PasienID`) REFERENCES `tb058_pasien` (`PasienID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb058_pemeriksaan_ibfk_2` FOREIGN KEY (`DokterID`) REFERENCES `tb058_dokter` (`DokterID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb058_rawatinap`
--
ALTER TABLE `tb058_rawatinap`
  ADD CONSTRAINT `tb058_rawatinap_ibfk_1` FOREIGN KEY (`PasienID`) REFERENCES `tb058_pasien` (`PasienID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb058_rawatinap_ibfk_2` FOREIGN KEY (`DokterID`) REFERENCES `tb058_dokter` (`DokterID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb058_resep`
--
ALTER TABLE `tb058_resep`
  ADD CONSTRAINT `tb058_resep_ibfk_1` FOREIGN KEY (`PasienID`) REFERENCES `tb058_pasien` (`PasienID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb058_resep_ibfk_2` FOREIGN KEY (`DokterID`) REFERENCES `tb058_dokter` (`DokterID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
