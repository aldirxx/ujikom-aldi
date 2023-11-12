-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Okt 2023 pada 04.33
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_founders`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_document_delivery`
--

CREATE TABLE `tbl_document_delivery` (
  `id_document_derevery` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `receipt` varchar(250) NOT NULL,
  `expedition_name` varchar(250) NOT NULL,
  `shipping_cost` varchar(250) NOT NULL,
  `recipients_name` varchar(250) NOT NULL,
  `delete_at` int(11) NOT NULL DEFAULT 0 COMMENT '0= active, 1= non active',
  `created_time` varchar(250) NOT NULL,
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_document_delivery`
--

INSERT INTO `tbl_document_delivery` (`id_document_derevery`, `id_orders`, `receipt`, `expedition_name`, `shipping_cost`, `recipients_name`, `delete_at`, `created_time`, `updated_time`) VALUES
(1, 1, 'JP0192838238gpx', 'J&T', '290000', 'Abdul Rahman', 0, '2023-10-09 10:02:45', '2023-10-10 14:25:35'),
(2, 0, 'JP2029102SPX', 'Gojek', '20000', 'Aman', 0, '2023-10-15', '2023-10-16 13:41:17'),
(3, 0, 'JP2029102SPX', 'Sicepat', '30000', 'Oji', 1, '2023-10-10', '2023-10-16 14:04:18'),
(4, 0, 'JP2029102SPX', 'Sicepat', '40000', 'Pak Bayu', 1, '2023-10-16', '2023-10-16 14:03:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kbli`
--

CREATE TABLE `tbl_kbli` (
  `id_kbli` int(11) NOT NULL,
  `data_kbli` varchar(100) NOT NULL,
  `data_judul` text NOT NULL,
  `data_uraian` text NOT NULL,
  `delete_at` int(11) NOT NULL DEFAULT 0 COMMENT '0=active, 1= non active',
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_kbli`
--

INSERT INTO `tbl_kbli` (`id_kbli`, `data_kbli`, `data_judul`, `data_uraian`, `delete_at`, `created_time`, `updated_time`) VALUES
(1, 'KBLI 46311', 'Perdagangan Besar Alat Tulis Kantor', 'Usaha perdagangan besar alat tulis kantor seperti pena, kertas, printer, dan perlengkapan kantor lainnya', 0, '2023-09-20 14:36:07', '2023-10-16 10:40:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_notes`
--

CREATE TABLE `tbl_notes` (
  `id_notes` int(11) NOT NULL,
  `notes` text NOT NULL,
  `delete_at` int(11) NOT NULL DEFAULT 0 COMMENT '0=active, 1=non active',
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_notes`
--

INSERT INTO `tbl_notes` (`id_notes`, `notes`, `delete_at`, `created_time`, `updated_time`) VALUES
(1, 'Pastikan membawa semua dokumen yang relevan: identitas (KTP, paspor), bukti kepemilikan (sertifikat tanah, dokumen properti), dokumen keuangan (rekening bank, surat utang), surat pernyataan, dsb.', 0, '2023-10-11 11:14:54', '2023-10-11 11:14:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `id_orders` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_sales` int(11) NOT NULL,
  `id_legal` int(11) NOT NULL,
  `id_notaris` int(11) NOT NULL,
  `id_products` int(11) NOT NULL,
  `id_order_detail` int(11) NOT NULL,
  `id_order_kbli` int(11) NOT NULL,
  `id_founders` int(11) NOT NULL,
  `id_supporting_documents` int(11) NOT NULL,
  `id_proof_of_payment` int(11) NOT NULL,
  `status_order` enum('Draft','Pengajuan','Pengerjaan','Tertahan','Selesai','Gagal') NOT NULL,
  `status_progress` enum('Mulai','Pengajuan Order','Distribusi Notaris dan Staff Legal','Pengerjaan SK Kemenkumham','Pengerjaan Akta Notaris','Cek Minuta dan Penandatanganan','Pengerjaan NIB dan NPWP','Pengecekan Pembayaran','Pengiriman Dokumen','Selesai') NOT NULL,
  `status_notaris` enum('Mulai','Pengerjaan','Selesai') NOT NULL,
  `status_legal` enum('Mulai','Pengerjaan','Selesai') NOT NULL,
  `delete_at` int(11) NOT NULL DEFAULT 0 COMMENT '0= active, 1= non active',
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_orders`
--

INSERT INTO `tbl_orders` (`id_orders`, `id_customer`, `id_sales`, `id_legal`, `id_notaris`, `id_products`, `id_order_detail`, `id_order_kbli`, `id_founders`, `id_supporting_documents`, `id_proof_of_payment`, `status_order`, `status_progress`, `status_notaris`, `status_legal`, `delete_at`, `created_time`, `updated_time`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 'Pengajuan', 'Pengajuan Order', 'Mulai', 'Mulai', 0, '2023-09-20 15:54:23', '2023-10-16 10:58:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_order_detail`
--

CREATE TABLE `tbl_order_detail` (
  `id_order_detail` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `name_company` varchar(50) NOT NULL,
  `business_fields` varchar(50) NOT NULL,
  `initial_capital` bigint(20) NOT NULL,
  `number_of_employees` int(11) NOT NULL,
  `office_area` varchar(20) NOT NULL,
  `no_telp_office` varchar(20) NOT NULL,
  `email_office` varchar(50) NOT NULL,
  `password_office` varchar(255) NOT NULL,
  `address_office` text NOT NULL,
  `delete_at` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_order_detail`
--

INSERT INTO `tbl_order_detail` (`id_order_detail`, `id_orders`, `name_company`, `business_fields`, `initial_capital`, `number_of_employees`, `office_area`, `no_telp_office`, `email_office`, `password_office`, `address_office`, `delete_at`, `created_time`, `updated_time`) VALUES
(1, 1, 'PT. Founder Media Partner', 'Layanan Hukum', 10000000, 5, '500 m2', '628812839383', 'yaop@gmail.com', 'admin123!', 'jakarta, Blok M 1 No 17', 0, '2023-09-20 15:53:24', '2023-10-09 11:34:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_order_files`
--

CREATE TABLE `tbl_order_files` (
  `id_order_files` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `id_kbli` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `title` text NOT NULL,
  `size` varchar(50) NOT NULL,
  `extention` varchar(5) NOT NULL,
  `dir` varchar(50) NOT NULL,
  `change_date` varchar(250) NOT NULL,
  `delete_at` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_order_files`
--

INSERT INTO `tbl_order_files` (`id_order_files`, `id_orders`, `id_kbli`, `name`, `title`, `size`, `extention`, `dir`, `change_date`, `delete_at`, `created_time`, `updated_time`) VALUES
(1, 1, 1, 'KTP', 'KTP aman.jpg', '6 mb', 'pdf', '/images/', '2023-10-19', 0, '2023-09-20 15:58:36', '2023-10-16 15:14:29'),
(11, 2, 2, 'NPWP', '6c733ad9c84f754082ad0febe5b0f07f-12-10-2023.pdf', '2 mb', '', '', '2023-10-11', 0, '2023-10-12 22:23:37', '2023-10-16 15:02:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_order_founders`
--

CREATE TABLE `tbl_order_founders` (
  `id_founders` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `no_telp_founders` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `jml_saham` varchar(50) NOT NULL,
  `delete_at` int(11) NOT NULL DEFAULT 0 COMMENT '0= active, 1= non active',
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_order_founders`
--

INSERT INTO `tbl_order_founders` (`id_founders`, `id_orders`, `name`, `position`, `no_telp_founders`, `email`, `jml_saham`, `delete_at`, `created_time`, `updated_time`) VALUES
(1, 1, 'Abdul Rahmann', 'Direkturr', '62881239383890', 'abdulrahman@gmail.comm', '100000001', 0, '2023-09-20 15:59:35', '2023-10-12 22:24:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_order_kbli`
--

CREATE TABLE `tbl_order_kbli` (
  `id_order_kbli` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `id_kbli` int(11) NOT NULL,
  `delete_at` int(11) NOT NULL COMMENT '0= active, 1= non active',
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_order_kbli`
--

INSERT INTO `tbl_order_kbli` (`id_order_kbli`, `id_orders`, `id_kbli`, `delete_at`, `created_time`, `updated_time`) VALUES
(1, 1, 1, 0, '2023-09-20 15:59:47', '2023-09-20 15:59:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_products`
--

CREATE TABLE `tbl_products` (
  `id_products` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` bigint(20) NOT NULL,
  `delete_at` int(11) NOT NULL DEFAULT 0 COMMENT '0= active, 1= non active',
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_products`
--

INSERT INTO `tbl_products` (`id_products`, `name`, `price`, `delete_at`, `created_time`, `updated_time`) VALUES
(1, 'PT Perorangan - Basic', 1500000, 0, '2023-09-20 14:38:21', '2023-09-26 13:13:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_proof_of_payment`
--

CREATE TABLE `tbl_proof_of_payment` (
  `id_proof_of_payment` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `sent_date` varchar(100) NOT NULL,
  `status_payment` varchar(50) NOT NULL,
  `sending_bank` varchar(50) NOT NULL,
  `payment_amount` varchar(50) NOT NULL,
  `file` text NOT NULL,
  `delete_at` int(11) NOT NULL COMMENT '0= active, 1= non active',
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_proof_of_payment`
--

INSERT INTO `tbl_proof_of_payment` (`id_proof_of_payment`, `id_orders`, `sent_date`, `status_payment`, `sending_bank`, `payment_amount`, `file`, `delete_at`, `updated_time`) VALUES
(2, 1, '2023-10-11', 'Dp', 'Bank Mandiri', '800000', '89278878978950d628f780b1b8cc7c79-643a917a01b5c89ba84ae300c24a0418.pdf', 0, '2023-10-16 10:52:07'),
(13, 0, '', '', '', '', '', 1, '2023-10-16 14:18:33'),
(14, 0, '2023-10-20', 'Cash', 'Bank Mandiri', '2000000', '6c733ad9c84f754082ad0febe5b0f07f-49f9d3812f5022f265b1b899f837b49c.pdf', 0, '2023-10-16 11:59:06'),
(15, 0, '2023-10-18', 'Cash', 'Bank Mandiri', '200000', '954c11561f97516febf691550251b8ba-49f9d3812f5022f265b1b899f837b49c.pdf', 1, '2023-10-16 12:09:31'),
(16, 0, '2023-10-15', 'Cash', 'Bank Mandiri', '16000', '6c733ad9c84f754082ad0febe5b0f07f-49f9d3812f5022f265b1b899f837b49c.pdf', 0, '2023-10-16 14:27:34'),
(17, 0, '2023-10-20', 'Cash', 'Bank Mandiri', '300000', '6c733ad9c84f754082ad0febe5b0f07f-49f9d3812f5022f265b1b899f837b49c.pdf', 0, '2023-10-16 14:33:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_supporting_documents`
--

CREATE TABLE `tbl_supporting_documents` (
  `id_supporting_documents` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `filename` text NOT NULL,
  `file_size` varchar(10) NOT NULL,
  `change_date` varchar(250) NOT NULL,
  `delete_at` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_supporting_documents`
--

INSERT INTO `tbl_supporting_documents` (`id_supporting_documents`, `id_orders`, `filename`, `file_size`, `change_date`, `delete_at`, `created_time`, `updated_time`) VALUES
(1, 1, 'KTP Bayo Binsar.jpg', '1 mb', '2023-09-19', 0, '2023-09-26 15:30:18', '2023-10-12 18:25:03'),
(2, 0, '7076f88ec363102a47b2338573fd007a-643a917a01b5c89ba', '1 mb', '2023-10-11', 1, '2023-10-12 19:02:34', '2023-10-12 22:21:23'),
(3, 0, '7076f88ec363102a47b2338573fd007a-643a917a01b5c89ba', '1 mb', '2023-10-11', 1, '2023-10-12 19:02:46', '2023-10-12 22:21:17'),
(4, 0, 'fcfb753d1d0cd624d2d4d3269da82790-643a917a01b5c89ba', '1 mb', '2023-10-26', 1, '2023-10-12 19:07:45', '2023-10-12 22:21:12'),
(5, 0, '954c11561f97516febf691550251b8ba-643a917a01b5c89ba', '2 mb', '2023-10-25', 1, '2023-10-12 19:11:30', '2023-10-12 22:21:07'),
(6, 0, 'Dokumentasi Ujikom.pdf-954c11561f97516febf69155025', '1 mb', '2023-10-11', 1, '2023-10-12 22:08:50', '2023-10-12 22:21:03'),
(7, 0, '954c11561f97516febf691550251b8ba-12/10/2023 22:12:', '2 mb', '2023-10-11', 1, '2023-10-12 22:12:08', '2023-10-12 22:20:59'),
(8, 0, '954c11561f97516febf691550251b8ba-12/10/2023 22:13:32.pdf', '2 mb', '2023-10-11', 1, '2023-10-12 22:13:32', '2023-10-12 22:20:53'),
(9, 0, '38a5b9f360c49f1c1420af8335f92773-12/10/2023 22:14:36.pdf', '2 mb', '2023-10-11', 1, '2023-10-12 22:14:36', '2023-10-12 22:20:43'),
(10, 0, '38a5b9f360c49f1c1420af8335f92773-12-10-2023-22:15:30.pdf', '2 mb', '2023-10-11', 1, '2023-10-12 22:15:30', '2023-10-12 22:20:48'),
(11, 0, '38a5b9f360c49f1c1420af8335f92773-12-10-2023.pdf', '2 mb', '2023-10-11', 1, '2023-10-12 22:16:23', '2023-10-16 16:20:02'),
(12, 0, '954c11561f97516febf691550251b8ba-12-10-2023.pdf', '', '', 1, '2023-10-12 22:57:37', '2023-10-16 10:37:55'),
(13, 0, '954c11561f97516febf691550251b8ba-12-10-2023.pdf', '', '', 1, '2023-10-12 23:00:37', '2023-10-12 23:00:43'),
(14, 0, '6c733ad9c84f754082ad0febe5b0f07f-12-10-2023.pdf', '', '', 1, '2023-10-12 23:04:16', '2023-10-16 10:37:49'),
(15, 0, 'ca887bffda45378b9074e0f1507ef742-49f9d3812f5022f265b1b899f837b49c.pdf', '2 mb', '2023-10-15', 0, '2023-10-16 10:36:37', '2023-10-16 10:36:37'),
(16, 0, '38a5b9f360c49f1c1420af8335f92773-49f9d3812f5022f265b1b899f837b49c.pdf', '2 mb', '2023-10-15', 1, '2023-10-16 10:37:40', '2023-10-16 15:33:59'),
(17, 0, '954c11561f97516febf691550251b8ba-49f9d3812f5022f265b1b899f837b49c.pdf', '3 mb', '2023-10-15', 0, '2023-10-16 15:38:15', '2023-10-16 15:38:15'),
(18, 0, '6c733ad9c84f754082ad0febe5b0f07f-49f9d3812f5022f265b1b899f837b49c.pdf', '10 mb', '2023-10-27', 0, '2023-10-16 15:39:00', '2023-10-16 15:39:00'),
(19, 0, 'ca887bffda45378b9074e0f1507ef742-49f9d3812f5022f265b1b899f837b49c.pdf', '2 mb', '2023-10-17', 0, '2023-10-16 16:19:46', '2023-10-16 16:19:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_example`
--

CREATE TABLE `tb_example` (
  `id` int(11) NOT NULL,
  `example` varchar(255) NOT NULL,
  `delete_at` int(2) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_example`
--

INSERT INTO `tb_example` (`id`, `example`, `delete_at`, `created_at`, `updated_at`) VALUES
(1, '1', 1, '2022-07-24 15:47:54', '2022-07-30 15:39:43'),
(2, '3', 1, '2022-07-24 15:47:54', '2022-07-30 15:39:47'),
(3, 'example 3 edit', 1, '2022-07-24 15:58:05', '2022-07-30 15:39:53'),
(4, 'Penrekrutan', 1, '2022-07-24 16:27:47', '2022-07-30 14:02:59'),
(5, 'tes 1', 1, '2022-07-30 13:58:04', '2022-07-30 14:02:55'),
(6, 'example 4 edit', 1, '2022-07-30 14:03:09', '2022-07-30 15:39:56'),
(7, 'example 5 edit', 1, '2022-07-30 14:08:02', '2022-07-30 15:40:01'),
(8, 'test', 1, '2022-07-30 15:26:43', '2022-07-30 15:40:05'),
(9, 'tes 2', 1, '2022-07-30 15:27:20', '2022-08-09 09:58:03'),
(10, '4', 0, '2022-07-30 15:34:03', '2022-07-30 15:34:03'),
(11, '5', 0, '2022-07-30 15:34:27', '2022-07-30 15:34:27'),
(12, '6', 0, '2022-07-30 15:35:14', '2022-07-30 15:35:14'),
(13, 'tes', 0, '2022-08-09 09:57:40', '2022-08-09 09:57:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_group`
--

CREATE TABLE `tb_group` (
  `id` int(11) NOT NULL,
  `nama_group` varchar(255) NOT NULL,
  `delete_at` int(2) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_group`
--

INSERT INTO `tb_group` (`id`, `nama_group`, `delete_at`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 0, '2022-07-24 13:55:23', '2022-07-24 13:55:23'),
(2, 'Admin', 0, '2022-07-24 13:55:23', '2022-07-24 13:55:23'),
(3, 'Sales', 0, '2023-10-17 14:13:39', '2023-10-17 14:13:39'),
(4, 'Customer', 0, '2023-10-17 14:13:39', '2023-10-17 14:13:39'),
(5, 'Legal', 0, '2023-10-17 14:13:57', '2023-10-17 14:13:57'),
(6, 'Notaris', 0, '2023-10-17 14:13:57', '2023-10-17 14:13:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_identity`
--

CREATE TABLE `tb_identity` (
  `id` int(11) NOT NULL,
  `identity_name` varchar(255) NOT NULL,
  `identity_phone` varchar(15) NOT NULL,
  `identity_email` varchar(255) NOT NULL,
  `identity_company` varchar(255) NOT NULL,
  `identity_logo` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) NOT NULL,
  `id_group` int(11) NOT NULL,
  `hash_user` varchar(100) NOT NULL,
  `id_sales` int(11) DEFAULT NULL COMMENT 'Sales yang terhubung dengan customer(Berlaku hanyak untuk role customer)',
  `nip` varchar(100) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `tempat_lahir` varchar(255) NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `foto` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `delete_at` int(2) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_users`
--

INSERT INTO `tb_users` (`id`, `id_group`, `hash_user`, `id_sales`, `nip`, `nama_lengkap`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `no_telepon`, `alamat`, `foto`, `email`, `password`, `delete_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'JHB89sjh288', NULL, '', 'Super Admin', '', NULL, 'Laki-Laki', '081234567890', 'Jl Raya Inkopad Blok O-5 No.9, Sasak Panjang. Tajurhalang, Bogor Kode Pos 16320', '', 'superadmin@demo.com', '17c4520f6cfd1ab53d8745e84681eb49', 0, '2022-07-24 13:56:31', '2022-07-24 13:56:31'),
(2, 2, 'KZWG8rTa', NULL, '', 'User Admin', 'Serang', '2023-10-02', 'Laki-Laki', '081234567890', 'Jl. Raya Inkopad Blok O-5 No.9, Sasak Panjang, Tajurhalang, Bogor Kode Pos 16320, Indonesia', 'assets/files/users/f56f1914f00bb051ea1fb8014137b3cb.png', 'admin@demo.com', '21232f297a57a5a743894a0e4a801fc3', 0, '2023-10-17 14:47:22', '2023-10-18 15:16:29'),
(3, 3, 'aiPmJqG8', NULL, '', 'User Sales', 'Serang', '2023-10-17', 'Laki-Laki', '081234567890', 'Jl. Raya Inkopad Blok O-5 No.9, Sasak Panjang, Tajurhalang, Bogor Kode Pos 16320, Indonesia', 'assets/files/users/ce80ff2d2a961ce48578c1028a0ff3be.png', 'sales@demo.com', '9ed083b1436e5f40ef984b28255eef18', 0, '2023-10-17 14:48:34', '2023-10-18 15:15:24'),
(4, 4, 'fakuVBZA', 3, '', 'User Customer', 'Serang', '1999-02-16', 'Laki-Laki', '081234567890', 'Jl. Raya Inkopad Blok O-5 No.9, Sasak Panjang, Tajurhalang, Bogor Kode Pos 16320, Indonesia', 'assets/files/user.png', 'customer@demo.com', '91ec1f9324753048c0096d036a694f86', 0, '2023-10-18 15:07:56', '2023-10-22 13:53:33'),
(5, 4, '23ebhjaj', 3, '', 'Muhammad Alfikri', '', NULL, 'Laki-Laki', '081234567890', 'Jl Raya Inkopad', 'assets/files/user.png', 'alfikri@demo.com', 'e83c3a23f1e84372ba2f2356abc79dbc', 0, '2023-10-22 13:51:47', '2023-10-22 13:59:48'),
(6, 4, 'dja2n9q', 3, '', 'Muhammad Alfikri', '', NULL, 'Laki-Laki', '083872806501', 'Jl. Raya Inkopad Blok O-5 No.9, Sasak Panjang, Tajurhalang, Bogor Kode Pos 16320, Indonesia', 'assets/files/user.png', 'alfikrites@demo.com', '91ec1f9324753048c0096d036a694f86', 1, '2023-10-22 13:52:46', '2023-10-22 13:59:50'),
(7, 4, 'OwaYiCtL', 3, '', 'Amansley', '', NULL, 'Laki-Laki', '081234567890', 'Jl. Raya Inkopad Blok O-5 No.9, Sasak Panjang, Tajurhalang, Bogor Kode Pos 16320, Indonesia', 'assets/files/user.png', 'amansley@demo.com', '91ec1f9324753048c0096d036a694f86', 0, '2023-10-22 13:59:29', '2023-10-22 13:59:52'),
(8, 5, 'VO53oywC', NULL, '', 'Abdul Rahman', 'Bogor', '2023-10-22', 'Laki-Laki', '0858234567890', 'Komplek inkopad Blok 05 No 17', 'assets/files/user.png', 'legal@gmail.com', '202cb962ac59075b964b07152d234b70', 0, '2023-10-23 02:44:25', '2023-10-23 02:44:25'),
(9, 3, 'o8TQwxRS', NULL, '', 'Abdul Rahman', 'Bogor', '2023-10-22', 'Laki-Laki', '085823456789', 'Komplek Inkopad ', 'assets/files/user.png', 'sales@gmail.com', '202cb962ac59075b964b07152d234b70', 0, '2023-10-23 02:51:35', '2023-10-23 02:51:35'),
(10, 4, '6nt3cdRz', 9, '', 'abdul fajar', '', NULL, 'Laki-Laki', '0858234567890', 'Komplek Inkopad Blok O5 No 17', 'assets/files/user.png', 'fajar@gmail.com', '202cb962ac59075b964b07152d234b70', 0, '2023-10-23 02:52:42', '2023-10-23 02:52:42');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_document_delivery`
--
ALTER TABLE `tbl_document_delivery`
  ADD PRIMARY KEY (`id_document_derevery`);

--
-- Indeks untuk tabel `tbl_kbli`
--
ALTER TABLE `tbl_kbli`
  ADD PRIMARY KEY (`id_kbli`);

--
-- Indeks untuk tabel `tbl_notes`
--
ALTER TABLE `tbl_notes`
  ADD PRIMARY KEY (`id_notes`);

--
-- Indeks untuk tabel `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`id_orders`);

--
-- Indeks untuk tabel `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  ADD PRIMARY KEY (`id_order_detail`);

--
-- Indeks untuk tabel `tbl_order_files`
--
ALTER TABLE `tbl_order_files`
  ADD PRIMARY KEY (`id_order_files`);

--
-- Indeks untuk tabel `tbl_order_founders`
--
ALTER TABLE `tbl_order_founders`
  ADD PRIMARY KEY (`id_founders`);

--
-- Indeks untuk tabel `tbl_order_kbli`
--
ALTER TABLE `tbl_order_kbli`
  ADD PRIMARY KEY (`id_order_kbli`);

--
-- Indeks untuk tabel `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`id_products`);

--
-- Indeks untuk tabel `tbl_proof_of_payment`
--
ALTER TABLE `tbl_proof_of_payment`
  ADD PRIMARY KEY (`id_proof_of_payment`);

--
-- Indeks untuk tabel `tbl_supporting_documents`
--
ALTER TABLE `tbl_supporting_documents`
  ADD PRIMARY KEY (`id_supporting_documents`);

--
-- Indeks untuk tabel `tb_example`
--
ALTER TABLE `tb_example`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_group`
--
ALTER TABLE `tb_group`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_identity`
--
ALTER TABLE `tb_identity`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_document_delivery`
--
ALTER TABLE `tbl_document_delivery`
  MODIFY `id_document_derevery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_kbli`
--
ALTER TABLE `tbl_kbli`
  MODIFY `id_kbli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_notes`
--
ALTER TABLE `tbl_notes`
  MODIFY `id_notes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `id_orders` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_order_detail`
--
ALTER TABLE `tbl_order_detail`
  MODIFY `id_order_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_order_files`
--
ALTER TABLE `tbl_order_files`
  MODIFY `id_order_files` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `tbl_order_founders`
--
ALTER TABLE `tbl_order_founders`
  MODIFY `id_founders` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tbl_order_kbli`
--
ALTER TABLE `tbl_order_kbli`
  MODIFY `id_order_kbli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `id_products` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_proof_of_payment`
--
ALTER TABLE `tbl_proof_of_payment`
  MODIFY `id_proof_of_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `tbl_supporting_documents`
--
ALTER TABLE `tbl_supporting_documents`
  MODIFY `id_supporting_documents` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `tb_example`
--
ALTER TABLE `tb_example`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tb_group`
--
ALTER TABLE `tb_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_identity`
--
ALTER TABLE `tb_identity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
