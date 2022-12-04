-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2022 at 11:30 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pbarang`
--

-- --------------------------------------------------------

--
-- Table structure for table `informasi`
--

CREATE TABLE `informasi` (
  `id_informasi` int(2) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `informasi`
--

INSERT INTO `informasi` (`id_informasi`, `judul`, `isi`) VALUES
(1, 'PT Kirimin ID', '<p>PT Kirimin ID&nbsp;<span style=\"font-family:arial,helvetica,sans-serif\">merupakan perusahaan yang bergerak di bidang jasa ekspedisi pengiriman paket barang yang bertempat dipusat kota Medan. melayani tujuan dengan menggunakan angkutan darat maupun laut. Dalam era globalisasi dan persaingan yang semakin sengit, setiap perusahaan dituntut untuk bisa mencermati segala situasi dan langkah-langkah efektif untuk menghadapinya. Ekspedisi ataupun Cargo adalah salah satu cara yang efektif untuk mentransportasikan produk/ barang suatu perusahaan kepada pelanggan maupun investornya. Untuk itu kami </span>PT Kirimin ID<span style=\"font-family:arial,helvetica,sans-serif\">&nbsp;terlahir untuk membantu Perusahaan tersebut dalam mengirimkan barang atau produknya ke luar Kota maupun keluar Pulau yang telah kami tentukan.</span></p>'),
(2, 'Layanan PT Kirimin ID', '<p>Layanan jasa yang dimiliki oleh&nbsp;PT Kirimi ID sebagai berikut :</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Tagih Tujuan </strong></p>\r\n\r\n<p style=\"text-align:justify\">Layanan yang memberikan kesempatan untuk menagih biaya</p>\r\n\r\n<p style=\"text-align:justify\">kiriman kepada penerima, dengan sistem pembayaran dapat</p>\r\n\r\n<p style=\"text-align:justify\">dilakukan secara tunai pada saat penyerahan kiriman.</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><strong>PAC (Packing)</strong></p>\r\n\r\n<p style=\"text-align:justify\">PAC disediakan untuk melayani kebutuhan anda sebagai jaminan</p>\r\n\r\n<p style=\"text-align:justify\">kondisi dan keamanan barang / paket dengan kemasan yang memadai.</p>\r\n\r\n<p style=\"text-align:justify\">Layanan ini berupa tambahan kemasan pada sisi luarnya .</p>');

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `no_polisi` varchar(11) NOT NULL,
  `merk` varchar(20) NOT NULL,
  `no_mesin` varchar(17) NOT NULL,
  `tahun` char(4) NOT NULL,
  `warna` varchar(10) NOT NULL,
  `supir` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`no_polisi`, `merk`, `no_mesin`, `tahun`, `warna`, `supir`) VALUES
('Bk 123', 'Samsung', '123', '2022', 'merah', '123'),
('bk123bk', 'honda', '123', '2022', 'hitam', '123456789');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `no_ktp` varchar(16) NOT NULL,
  `nama_pelanggan` varchar(30) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`no_ktp`, `nama_pelanggan`, `jenis_kelamin`, `alamat`, `telepon`) VALUES
('12345', 'Agung', 'Laki-laki', 'Jl. Tembung', '54321'),
('12345678', 'Willi', 'Perempuan', 'Jl, Pancing', '011120289'),
('127072821810', 'Badi', 'Perempuan', 'Jl. Sukadia', '0812345678'),
('9876543212345671', 'Fitri Maryana', 'Perempuan', 'Jalan Pagar Alam No. 110, Kedaton, Bandar Lampung', '085858859500');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(2) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_pengguna` varchar(30) NOT NULL,
  `hak_akses` enum('Admin','Pimpinan') NOT NULL DEFAULT 'Admin'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `username`, `password`, `nama_pengguna`, `hak_akses`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 'Admin', 'Admin'),
(2, 'pimpinan', '202cb962ac59075b964b07152d234b70', 'Pimpinan', 'Pimpinan'),
(3, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman`
--

CREATE TABLE `pengiriman` (
  `no_pengiriman` varchar(50) NOT NULL,
  `tgl_pengiriman` date NOT NULL,
  `pengirim` varchar(16) NOT NULL,
  `penerima` varchar(30) NOT NULL,
  `alamat_penerima` varchar(100) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `berat_barang` int(11) NOT NULL,
  `biaya_kirim` int(11) NOT NULL,
  `kendaraan` varchar(11) NOT NULL,
  `status` enum('Proses Pengiriman','Barang Terkirim') NOT NULL DEFAULT 'Proses Pengiriman'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supir`
--

CREATE TABLE `supir` (
  `no_ktp` varchar(16) NOT NULL,
  `nama_supir` varchar(30) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supir`
--

INSERT INTO `supir` (`no_ktp`, `nama_supir`, `alamat`, `telepon`) VALUES
('123', 'Fulan', 'Jl. Siantar', '08111111'),
('123456789', 'willi', 'jl. pancing', '987654321');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `informasi`
--
ALTER TABLE `informasi`
  ADD PRIMARY KEY (`id_informasi`);

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`no_polisi`),
  ADD KEY `supir` (`supir`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`no_ktp`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD PRIMARY KEY (`no_pengiriman`),
  ADD KEY `pelanggan` (`pengirim`,`kendaraan`),
  ADD KEY `kendaraan` (`kendaraan`);

--
-- Indexes for table `supir`
--
ALTER TABLE `supir`
  ADD PRIMARY KEY (`no_ktp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `informasi`
--
ALTER TABLE `informasi`
  MODIFY `id_informasi` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD CONSTRAINT `kendaraan_ibfk_1` FOREIGN KEY (`supir`) REFERENCES `supir` (`no_ktp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD CONSTRAINT `pengiriman_ibfk_1` FOREIGN KEY (`pengirim`) REFERENCES `pelanggan` (`no_ktp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengiriman_ibfk_2` FOREIGN KEY (`kendaraan`) REFERENCES `kendaraan` (`no_polisi`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
