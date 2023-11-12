-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2023 at 04:24 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `ID_Barang` int(11) NOT NULL,
  `NamaBarang` varchar(30) NOT NULL,
  `Satuan` char(20) NOT NULL,
  `HargaSatuan` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`ID_Barang`, `NamaBarang`, `Satuan`, `HargaSatuan`) VALUES
(1, 'Baju aman', '2', 2000),
(3, 'Baju aman', '2', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_detail_penjualan`
--

CREATE TABLE `tbl_detail_penjualan` (
  `ID_Penjualan` int(11) NOT NULL,
  `ID_Barang` int(11) NOT NULL,
  `Kuantitas` smallint(6) NOT NULL,
  `HargaSatuan` float NOT NULL,
  `Sub_Total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kasir`
--

CREATE TABLE `tbl_kasir` (
  `ID_Kasir` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `NamaKasir` varchar(30) NOT NULL,
  `Alamat` text NOT NULL,
  `NomerHP` varchar(40) NOT NULL,
  `NomerKTP` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_kasir`
--

INSERT INTO `tbl_kasir` (`ID_Kasir`, `Username`, `NamaKasir`, `Alamat`, `NomerHP`, `NomerKTP`, `password`) VALUES
(1, 'aman', 'Amansley', 'Komplek Inkopad Blok o5 No 17', '0812345678', '3245783456789', '123'),
(4, 'aman', 'abdul rahman', 'inkopad', '0823456789', '3234567890', '123');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penjualan`
--

CREATE TABLE `tbl_penjualan` (
  `ID_Penjualan` int(11) NOT NULL,
  `WaktuTransaksi` datetime NOT NULL DEFAULT current_timestamp(),
  `Total` float NOT NULL,
  `ID_Shift` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_penjualan`
--

INSERT INTO `tbl_penjualan` (`ID_Penjualan`, `WaktuTransaksi`, `Total`, `ID_Shift`) VALUES
(1, '2023-11-22 13:08:03', 2000000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shift`
--

CREATE TABLE `tbl_shift` (
  `ID_Shift` int(11) NOT NULL,
  `ID_Kasir` int(11) NOT NULL,
  `WaktuBuka` datetime NOT NULL DEFAULT current_timestamp(),
  `SaldoAwal` double NOT NULL,
  `JumlahPenjualan` double NOT NULL,
  `SaldoAkhir` double NOT NULL,
  `WaktuTutup` datetime NOT NULL DEFAULT current_timestamp(),
  `Status` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_shift`
--

INSERT INTO `tbl_shift` (`ID_Shift`, `ID_Kasir`, `WaktuBuka`, `SaldoAwal`, `JumlahPenjualan`, `SaldoAkhir`, `WaktuTutup`, `Status`) VALUES
(1, 1, '2023-11-21 13:08:37', 230000, 2000000, 320000, '2023-11-15 13:08:37', 'buka');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`ID_Barang`);

--
-- Indexes for table `tbl_detail_penjualan`
--
ALTER TABLE `tbl_detail_penjualan`
  ADD PRIMARY KEY (`ID_Penjualan`);

--
-- Indexes for table `tbl_kasir`
--
ALTER TABLE `tbl_kasir`
  ADD PRIMARY KEY (`ID_Kasir`);

--
-- Indexes for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  ADD PRIMARY KEY (`ID_Penjualan`);

--
-- Indexes for table `tbl_shift`
--
ALTER TABLE `tbl_shift`
  ADD PRIMARY KEY (`ID_Shift`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `ID_Barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_detail_penjualan`
--
ALTER TABLE `tbl_detail_penjualan`
  MODIFY `ID_Penjualan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_kasir`
--
ALTER TABLE `tbl_kasir`
  MODIFY `ID_Kasir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_penjualan`
--
ALTER TABLE `tbl_penjualan`
  MODIFY `ID_Penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_shift`
--
ALTER TABLE `tbl_shift`
  MODIFY `ID_Shift` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
