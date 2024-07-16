-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 24, 2024 at 10:39 AM
-- Server version: 8.0.30
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_finanseira`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_beban`
--

CREATE TABLE `tb_beban` (
  `beban_id` int NOT NULL,
  `user_id` int NOT NULL,
  `tanggal` date NOT NULL,
  `jenis_beban` varchar(55) COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `jumlah` bigint NOT NULL,
  `tipe` enum('Nonkas','Kas') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_buyyer`
--

CREATE TABLE `tb_buyyer` (
  `buy_id` int NOT NULL,
  `user_id` int NOT NULL,
  `tanggal` date NOT NULL,
  `jenis_pembelian` varchar(55) COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `jumlah` bigint NOT NULL,
  `tipe` enum('Nonkas','Kas') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_customer_support`
--

CREATE TABLE `tb_customer_support` (
  `cs_id` int NOT NULL,
  `tanggal` date NOT NULL,
  `user_id` int NOT NULL,
  `jenis_pengaduan` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kas`
--

CREATE TABLE `tb_kas` (
  `kas_id` int NOT NULL,
  `user_id` int NOT NULL,
  `tanggal` date NOT NULL,
  `jenis_kas` varchar(155) COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` varchar(155) COLLATE utf8mb4_general_ci NOT NULL,
  `debit` varchar(30) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `kredit` varchar(30) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `tipe` enum('Pendapatan','Harga Pokok Penjualan') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `kategori_id` int NOT NULL,
  `penjelasan_kategori` varchar(155) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`kategori_id`, `penjelasan_kategori`) VALUES
(1, 'Pendapatan'),
(2, 'Pengeluaran');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pajak`
--

CREATE TABLE `tb_pajak` (
  `pajak_id` int NOT NULL,
  `user_id` int NOT NULL,
  `tanggal` date NOT NULL,
  `gaji` bigint NOT NULL,
  `nama_lengkap` varchar(155) COLLATE utf8mb4_general_ci NOT NULL,
  `jenis_pajak` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `npwp` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `persentase` int NOT NULL,
  `jumlah` bigint NOT NULL,
  `deskripsi` text COLLATE utf8mb4_general_ci NOT NULL,
  `tipe` enum('Kas') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_piutang`
--

CREATE TABLE `tb_piutang` (
  `piutang_id` int NOT NULL,
  `user_id` int NOT NULL,
  `tanggal` date NOT NULL,
  `no_transaksi` varchar(55) COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(155) COLLATE utf8mb4_general_ci NOT NULL,
  `jatuh_tempo` date NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `jumlah` bigint NOT NULL,
  `tipe` enum('Nonkas','Kas') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_piutang`
--

INSERT INTO `tb_piutang` (`piutang_id`, `user_id`, `tanggal`, `no_transaksi`, `nama`, `jatuh_tempo`, `deskripsi`, `jumlah`, `tipe`, `created_at`) VALUES
(4, 1, '2024-05-24', 'Invoice #1', 'test', '2024-05-24', 'test', 150000, 'Nonkas', '2024-05-24 16:34:01');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pos`
--

CREATE TABLE `tb_pos` (
  `kode` varchar(3) COLLATE utf8mb4_general_ci NOT NULL,
  `pos` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_pos`
--

INSERT INTO `tb_pos` (`kode`, `pos`) VALUES
('2', 'Hutang'),
('3', 'Modal'),
('4', 'Pendapatan'),
('5', 'Beban'),
('6', 'Pembelian'),
('7', 'Penjualan');

-- --------------------------------------------------------

--
-- Table structure for table `tb_sell`
--

CREATE TABLE `tb_sell` (
  `sell_id` int NOT NULL,
  `user_id` int NOT NULL,
  `tanggal` date NOT NULL,
  `jenis_penjualan` varchar(55) COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `jumlah` bigint NOT NULL DEFAULT '0',
  `tipe` enum('Nonkas','Kas') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_sell`
--

INSERT INTO `tb_sell` (`sell_id`, `user_id`, `tanggal`, `jenis_penjualan`, `deskripsi`, `jumlah`, `tipe`, `created_at`) VALUES
(13, 1, '2024-05-24', '701', 'data penjualan', 350000, 'Nonkas', '2024-05-24 17:20:08');

-- --------------------------------------------------------

--
-- Table structure for table `tb_subpos`
--

CREATE TABLE `tb_subpos` (
  `kode` varchar(3) COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `pos` varchar(3) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_subpos`
--

INSERT INTO `tb_subpos` (`kode`, `nama`, `pos`) VALUES
('101', 'Harta Tanah', '1'),
('102', 'Harta Emas', '1'),
('103', 'Harta Uang', '1'),
('104', 'Harta Peralatan', '1'),
('105', 'Harta Piutang', '1'),
('201', 'Hutang Pinjaman Bangunan', '2'),
('202', 'Hutang Gaji Karyawan', '2'),
('203', 'Obligasi', '2'),
('204', 'Hutang Dagang', '2'),
('205', 'Hutang Pinjaman Aset Kredit', '2'),
('301', 'Modal Tanah', '3'),
('302', 'Modal Saham', '3'),
('401', 'Pendapatan Bunga', '4'),
('402', 'Pendapatan Laba Gaji', '4'),
('403', 'Pendapatan Laba Tanah', '4'),
('501', 'Beban Listrik', '5'),
('502', 'Beban Air', '5'),
('503', 'Beban Telephone Fiber', '55'),
('504', 'Beban Gaji', '5'),
('505', 'Beban Penyusutan', '5'),
('601', 'Pembelian Saham', '6'),
('602', 'Pembelian Aset', '6'),
('603', 'Pembelian Baku', '6'),
('604', 'Pembelian Peralatan', '6'),
('701', 'Penjualan Tunai', '7'),
('702', 'Penjualan Grosir', '7'),
('703', 'Penjualan Online', '7'),
('704', 'Penjualan Proyek', '7');


-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `transaksi_id` int NOT NULL,
  `user_id` int NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jumlah` decimal(10,2) DEFAULT NULL,
  `tipe` enum('Nonkas','Kas') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`transaksi_id`, `user_id`, `deskripsi`, `jumlah`, `tipe`, `created_at`) VALUES
(1, 1, 'Pendapatan', '1000000.00', 'Nonkas', '2024-05-24 09:59:48'),
(2, 1, 'Diskon Penjualan', '50000.00', 'Kas', '2024-05-24 09:59:48'),
(3, 1, 'Retur Penjualan', '20000.00', 'Kas', '2024-05-24 09:59:48'),
(4, 1, 'Biaya Tambahan Pelanggan', '5000.00', 'Nonkas', '2024-05-24 09:59:48'),
(5, 1, 'Beban Pokok Pendapatan', '600000.00', 'Nonkas', '2024-05-24 09:59:48'),
(6, 1, 'Diskon Deposit', '10000.00', 'Kas', '2024-05-24 09:59:48');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `user_id` int NOT NULL,
  `username` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(155) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_lengkap` varchar(155) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatar` varchar(155) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` enum('admin','operator','user') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_changed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`user_id`, `username`, `email`, `password`, `nama_lengkap`, `avatar`, `role`, `created_at`, `last_changed`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$d.7WoXjA1pifSW0F0rAZue0f6zwRXaqGDn8Y8ESaZJvCibR5dlwFq', 'Administrator', NULL, 'admin', '2024-02-20 11:30:06', '2024-03-10 20:42:38'),
(2, 'staffinansial', 'finansial@gmail.com', '$2y$10$eMS2BOdyHOlWNPU89Oq87.RMH/J8RdnoOMkz70Ll4TjB8n3iuVjk2', NULL, NULL, 'user', '2024-02-20 11:30:06', '2024-02-20 11:02:50'),
(4, 'finansial11', 'finansial1@gmail.com', '$2y$10$Z6mCecuqAUJXntVe0nH/3u8lZEecdiVQupXnsWeCnDf9uR2VufhoK', NULL, NULL, 'user', '2024-02-21 08:46:04', '2024-02-21 08:46:04'),
(7, 'Staff keuangan', 'staff@01', '$2y$10$woVu0VvjL/A4ASP2OcufQ.6SCLOHyL1mN3I2RWNenGjiKvLPR4FAe', NULL, NULL, 'user', '2024-05-15 12:54:43', '2024-05-15 12:54:43'),
(8, 'mas_yusuf', 'yusufblabla@gmail.com', '$2y$10$xcxURqAz9EN5s/MoMneAvOn82EX2Lm0Ak25WCfU6Q.tINzZzHyhXa', NULL, NULL, 'admin', '2024-05-22 14:49:04', '2024-05-22 14:49:04'),
(9, 'mas_aziz', 'aziz@gmail.com', '$2y$10$8I01SxnvOe/vVqCZFUtQFu958dv19xNSfmNRcmhTJIJrM7VtI0wGa', NULL, NULL, 'user', '2024-05-22 14:50:15', '2024-05-22 14:50:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_beban`
--
ALTER TABLE `tb_beban`
  ADD PRIMARY KEY (`beban_id`);

--
-- Indexes for table `tb_buyyer`
--
ALTER TABLE `tb_buyyer`
  ADD PRIMARY KEY (`buy_id`);

--
-- Indexes for table `tb_customer_support`
--
ALTER TABLE `tb_customer_support`
  ADD PRIMARY KEY (`cs_id`);

--
-- Indexes for table `tb_kas`
--
ALTER TABLE `tb_kas`
  ADD PRIMARY KEY (`kas_id`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `tb_pajak`
--
ALTER TABLE `tb_pajak`
  ADD PRIMARY KEY (`pajak_id`);

--
-- Indexes for table `tb_piutang`
--
ALTER TABLE `tb_piutang`
  ADD PRIMARY KEY (`piutang_id`);

--
-- Indexes for table `tb_sell`
--
ALTER TABLE `tb_sell`
  ADD PRIMARY KEY (`sell_id`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`transaksi_id`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_beban`
--
ALTER TABLE `tb_beban`
  MODIFY `beban_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_buyyer`
--
ALTER TABLE `tb_buyyer`
  MODIFY `buy_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tb_customer_support`
--
ALTER TABLE `tb_customer_support`
  MODIFY `cs_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_kas`
--
ALTER TABLE `tb_kas`
  MODIFY `kas_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `kategori_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_pajak`
--
ALTER TABLE `tb_pajak`
  MODIFY `pajak_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_piutang`
--
ALTER TABLE `tb_piutang`
  MODIFY `piutang_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_sell`
--
ALTER TABLE `tb_sell`
  MODIFY `sell_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `transaksi_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
