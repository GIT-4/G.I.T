-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2018 at 11:50 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ikan_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `benih`
--
/*
+---------------+---------+------+-----+---------+-------+
| Field         | Type    | Null | Key | Default | Extra |
+---------------+---------+------+-----+---------+-------+
| id            | int(11) | NO   | PRI | NULL    |       |
| id_benih_ikan | int(11) | NO   | MUL | NULL    |       |
+---------------+---------+------+-----+---------+-------+
*/

CREATE TABLE `benih` (
  `id` int(11) NOT NULL,
  `id_benih_ikan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `benih`
--

INSERT INTO `benih` (`id`, `id_benih_ikan`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ikan`
--
/*
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int(11)     | NO   | PRI | NULL    |       |
| nama  | varchar(45) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
*/

CREATE TABLE `ikan` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ikan`
--

INSERT INTO `ikan` (`id`, `nama`) VALUES
(1, 'Lele');

-- --------------------------------------------------------

--
-- Table structure for table `investor`
--

/*
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| id          | int(11)     | NO   | PRI | NULL    |       |
| nama        | varchar(45) | NO   |     | NULL    |       |
| NIK         | varchar(45) | NO   | UNI | NULL    |       |
| umur        | int(11)     | NO   |     | NULL    |       |
| alamat      | varchar(45) | NO   |     | NULL    |       |
| kontak      | varchar(20) | NO   |     | NULL    |       |
| no_rekening | varchar(45) | NO   | UNI | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
*/

CREATE TABLE `investor` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `NIK` varchar(45) NOT NULL,
  `umur` int(11) NOT NULL,
  `alamat` varchar(45) NOT NULL,
  `kontak` varchar(20) NOT NULL,
  `no_rekening` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `investor`
--

INSERT INTO `investor` (`id`, `nama`, `NIK`, `umur`, `alamat`, `kontak`, `no_rekening`) VALUES
(1, 'Muhammad Ridwan', '000451233001120', 40, 'Jl Melati no 45 mampang jakarta timur', '085790897656', '0223-9078-0098');

-- --------------------------------------------------------

--
-- Table structure for table `konsumen`
--

/*
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| id          | int(11)     | NO   | PRI | NULL    |       |
| nama        | varchar(45) | NO   |     | NULL    |       |
| id_wilayah  | int(11)     | YES  | MUL | NULL    |       |
| alamat      | varchar(45) | NO   |     | NULL    |       |
| kontak      | varchar(45) | NO   |     | NULL    |       |
| email       | varchar(45) | NO   |     | NULL    |       |
| no_rekening | varchar(45) | NO   | UNI | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
*/

CREATE TABLE `konsumen` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `id_wilayah` int(11) DEFAULT NULL,
  `alamat` varchar(45) NOT NULL,
  `kontak` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `no_rekening` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konsumen`
--

INSERT INTO `konsumen` (`id`, `nama`, `id_wilayah`, `alamat`, `kontak`, `email`, `no_rekening`) VALUES
(1, 'Nuha Taqwa', 1, 'Kampung Sawah,Gang Arus, RT/RW 09/09, Srengse', '082220885531', 'nuhataqwa@gmail.com', '009 555 5554');

-- --------------------------------------------------------

--
-- Table structure for table `modal`
--
/*
+-----------------+---------+------+-----+---------+-------+
| Field           | Type    | Null | Key | Default | Extra |
+-----------------+---------+------+-----+---------+-------+
| id              | int(11) | NO   | PRI | NULL    |       |
| id_tambak       | int(11) | YES  | MUL | NULL    |       |
| kebutuhan_modal | int(11) | YES  |     | NULL    |       |
| dana_diterima   | int(11) | YES  |     | NULL    |       |
+-----------------+---------+------+-----+---------+-------+
*/
CREATE TABLE `modal` (
  `id` int(11) NOT NULL,
  `id_tambak` int(11) DEFAULT NULL,
  `kebutuhan_modal` int(11) DEFAULT NULL,
  `dana_diterima` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modal`
--

INSERT INTO `modal` (`id`, `id_tambak`, `kebutuhan_modal`, `dana_diterima`) VALUES
(1, 1, 2000000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `monitor_ikan`
--
/*
+-------------+-----------+------+-----+-------------------+-----------------------------+
| Field       | Type      | Null | Key | Default           | Extra                       |
+-------------+-----------+------+-----+-------------------+-----------------------------+
| id          | int(11)   | NO   | PRI | NULL              |                             |
| id_penambak | int(11)   | YES  | MUL | NULL              |                             |
| id_pakar    | int(11)   | YES  | MUL | NULL              |                             |
| id_tambak   | int(11)   | YES  | MUL | NULL              |                             |
| usia_ikan   | int(11)   | YES  |     | NULL              |                             |
| deskripsi   | text      | YES  |     | NULL              |                             |
| tgl_monitor | timestamp | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
+-------------+-----------+------+-----+-------------------+-----------------------------+
*/

CREATE TABLE `monitor_ikan` (
  `id` int(11) NOT NULL,
  `id_penambak` int(11) DEFAULT NULL,
  `id_pakar` int(11) DEFAULT NULL,
  `id_tambak` int(11) DEFAULT NULL,
  `usia_ikan` int(11) DEFAULT NULL,
  `deskripsi` text,
  `tgl_monitor` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `monitor_ikan`
--

INSERT INTO `monitor_ikan` (`id`, `id_penambak`, `id_pakar`, `id_tambak`, `usia_ikan`, `deskripsi`, `tgl_monitor`) VALUES
(1, 1, 1, 1, 3, 'rata-rata panjang ikan 6-8 cm, status ikan : sehat, rata-rata berat keseluruhan ikan  : 2 kg ', '2018-04-28 01:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `pakan`
--
/*
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| id        | int(11)     | NO   | PRI | NULL    |       |
| jenis     | varchar(45) | YES  |     | NULL    |       |
| deskripsi | text        | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
*/
CREATE TABLE `pakan` (
  `id` int(11) NOT NULL,
  `jenis` varchar(45) DEFAULT NULL,
  `deskripsi` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pakan`
--

INSERT INTO `pakan` (`id`, `jenis`, `deskripsi`) VALUES
(1, 'pelet apung', 'untuk ikan nila');

-- --------------------------------------------------------

--
-- Table structure for table `pakar`
--
/*
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| id       | int(11)     | NO   | PRI | NULL    |       |
| NIK      | varchar(45) | NO   | UNI | NULL    |       |
| nama     | varchar(45) | NO   |     | NULL    |       |
| alamat   | varchar(45) | NO   |     | NULL    |       |
| kontak   | varchar(45) | NO   |     | NULL    |       |
| email    | varchar(45) | NO   |     | NULL    |       |
| keahlian | varchar(45) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
*/
CREATE TABLE `pakar` (
  `id` int(11) NOT NULL,
  `NIK` varchar(45) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `alamat` varchar(45) NOT NULL,
  `kontak` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `keahlian` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pakar`
--

INSERT INTO `pakar` (`id`, `NIK`, `nama`, `alamat`, `kontak`, `email`, `keahlian`) VALUES
(1, '908719971123', 'Muhammad Ali', 'Jln.Serengseng Mawar No.9 Jakarta', '081280889000', 'ali@hotmail.com', 'Fish Parasitology');

-- --------------------------------------------------------

--
-- Table structure for table `panen`
--
/*
+-------------+-----------+------+-----+-------------------+-----------------------------+
| Field       | Type      | Null | Key | Default           | Extra                       |
+-------------+-----------+------+-----+-------------------+-----------------------------+
| id          | int(11)   | NO   | PRI | NULL              |                             |
| id_wilayah  | int(11)   | YES  | MUL | NULL              |                             |
| id_penambak | int(11)   | YES  | MUL | NULL              |                             |
| waktu_panen | timestamp | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
+-------------+-----------+------+-----+-------------------+-----------------------------+
*/

CREATE TABLE `panen` (
  `id` int(11) NOT NULL,
  `id_wilayah` int(11) DEFAULT NULL,
  `id_penambak` int(11) DEFAULT NULL,
  `waktu_panen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `panen`
--

INSERT INTO `panen` (`id`, `id_wilayah`, `id_penambak`, `waktu_panen`) VALUES
(1, 1, 1, '2018-04-28 02:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `penambak`
--
/*
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| id         | int(11)     | NO   | PRI | NULL    |       |
| nama       | varchar(45) | NO   |     | NULL    |       |
| NIK        | varchar(45) | NO   | UNI | NULL    |       |
| umur       | int(11)     | NO   |     | NULL    |       |
| id_wilayah | int(11)     | NO   | MUL | NULL    |       |
| alamat     | varchar(45) | NO   |     | NULL    |       |
| kontak     | varchar(20) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
*/
CREATE TABLE `penambak` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `NIK` varchar(45) NOT NULL,
  `umur` int(11) NOT NULL,
  `id_wilayah` int(11) NOT NULL,
  `alamat` varchar(45) NOT NULL,
  `kontak` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penambak`
--

INSERT INTO `penambak` (`id`, `nama`, `NIK`, `umur`, `id_wilayah`, `alamat`, `kontak`) VALUES
(1, 'Angling Samarkhandi', '6781672853674562', 35, 1, 'Senayan, Jl. Gatot Subroto, RT.1/RW.3, Gelora', '085643387639');

-- --------------------------------------------------------

--
-- Table structure for table `penjual_benih`
--
/*
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| id          | int(11)     | NO   | PRI | NULL    |       |
| nama        | varchar(45) | NO   |     | NULL    |       |
| nama_toko   | varchar(45) | YES  |     | NULL    |       |
| id_benih    | int(11)     | NO   | MUL | NULL    |       |
| id_wilayah  | int(11)     | NO   | MUL | NULL    |       |
| alamat      | varchar(45) | NO   |     | NULL    |       |
| kontak      | varchar(45) | NO   |     | NULL    |       |
| no_rekening | varchar(45) | NO   | UNI | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
*/

CREATE TABLE `penjual_benih` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `nama_toko` varchar(45) DEFAULT NULL,
  `id_benih` int(11) NOT NULL,
  `id_wilayah` int(11) NOT NULL,
  `alamat` varchar(45) NOT NULL,
  `kontak` varchar(45) NOT NULL,
  `no_rekening` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjual_benih`
--

INSERT INTO `penjual_benih` (`id`, `nama`, `nama_toko`, `id_benih`, `id_wilayah`, `alamat`, `kontak`, `no_rekening`) VALUES
(1, 'Aisyah Nur Sabrina', 'Nursa Jaya', 1, 1, 'Jl. Taman Margasatwa No. 12, Nursa Jaya, Jaka', '098761256712', '070 00 0187777 3');

-- --------------------------------------------------------

--
-- Table structure for table `penjual_pakan`
--
/*
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| id          | int(11)     | NO   | PRI | NULL    |       |
| nama        | varchar(45) | NO   |     | NULL    |       |
| nama_toko   | varchar(45) | YES  |     | NULL    |       |
| id_pakan    | int(11)     | NO   | MUL | NULL    |       |
| id_wilayah  | int(11)     | NO   | MUL | NULL    |       |
| alamat      | varchar(45) | NO   |     | NULL    |       |
| kontak      | varchar(45) | NO   |     | NULL    |       |
| no_rekening | varchar(45) | NO   | UNI | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
*/

CREATE TABLE `penjual_pakan` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `nama_toko` varchar(45) DEFAULT NULL,
  `id_pakan` int(11) NOT NULL,
  `id_wilayah` int(11) NOT NULL,
  `alamat` varchar(45) NOT NULL,
  `kontak` varchar(45) NOT NULL,
  `no_rekening` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjual_pakan`
--

INSERT INTO `penjual_pakan` (`id`, `nama`, `nama_toko`, `id_pakan`, `id_wilayah`, `alamat`, `kontak`, `no_rekening`) VALUES
(1, 'Raditya Ramadhan', 'Raditya Sukses', 1, 1, 'Jl. KH Agus Salim 16, Sabang, Menteng Jakarta', '089567352132', '301 007 0752');

-- --------------------------------------------------------

--
-- Table structure for table `tambak`
--
/*
+-------------+---------+------+-----+---------+-------+
| Field       | Type    | Null | Key | Default | Extra |
+-------------+---------+------+-----+---------+-------+
| id          | int(11) | NO   | PRI | NULL    |       |
| id_penambak | int(11) | NO   | MUL | NULL    |       |
| id_ikan     | int(11) | NO   | MUL | NULL    |       |
| luas        | double  | NO   |     | NULL    |       |
+-------------+---------+------+-----+---------+-------+
*/

CREATE TABLE `tambak` (
  `id` int(11) NOT NULL,
  `id_penambak` int(11) NOT NULL,
  `id_ikan` int(11) NOT NULL,
  `luas` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tambak`
--

INSERT INTO `tambak` (`id`, `id_penambak`, `id_ikan`, `luas`) VALUES
(1, 1, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `total_transaksi`
--
/*
+-------------------+----------+------+-----+---------+-------+
| Field             | Type     | Null | Key | Default | Extra |
+-------------------+----------+------+-----+---------+-------+
| id                | int(11)  | NO   | PRI | NULL    |       |
| waktu_dan_tanggal | datetime | YES  |     | NULL    |       |
| total_harga       | int(11)  | YES  |     | NULL    |       |
+-------------------+----------+------+-----+---------+-------+
*/

CREATE TABLE `total_transaksi` (
  `id` int(11) NOT NULL,
  `waktu_dan_tanggal` datetime DEFAULT NULL,
  `total_harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `total_transaksi`
--

INSERT INTO `total_transaksi` (`id`, `waktu_dan_tanggal`, `total_harga`) VALUES
(1, '2018-04-28 10:01:00', 60000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_benih`
--
/*
+-------------------+----------+------+-----+---------+-------+
| Field             | Type     | Null | Key | Default | Extra |
+-------------------+----------+------+-----+---------+-------+
| id                | int(11)  | NO   | PRI | NULL    |       |
| id_penjual        | int(11)  | NO   | MUL | NULL    |       |
| id_konsumen       | int(11)  | NO   | MUL | NULL    |       |
| id_benih          | int(11)  | NO   | MUL | NULL    |       |
| jumlah            | int(11)  | YES  |     | NULL    |       |
| harga             | int(11)  | YES  |     | NULL    |       |
| waktu_dan_tanggal | datetime | YES  |     | NULL    |       |
+-------------------+----------+------+-----+---------+-------+
*/

CREATE TABLE `transaksi_benih` (
  `id` int(11) NOT NULL,
  `id_penjual` int(11) NOT NULL,
  `id_konsumen` int(11) NOT NULL,
  `id_benih` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `waktu_dan_tanggal` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_benih`
--

INSERT INTO `transaksi_benih` (`id`, `id_penjual`, `id_konsumen`, `id_benih`, `jumlah`, `harga`, `waktu_dan_tanggal`) VALUES
(1, 1, 1, 1, 10, 500, '2018-04-28 08:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_ikan`
--
/*
+---------------+-----------+------+-----+-------------------+-----------------------------+
| Field         | Type      | Null | Key | Default           | Extra                       |
+---------------+-----------+------+-----+-------------------+-----------------------------+
| id            | int(11)   | NO   | PRI | NULL              |                             |
| id_penambak   | int(11)   | NO   | MUL | NULL              |                             |
| id_ikan       | int(11)   | NO   | MUL | NULL              |                             |
| id_konsumen   | int(11)   | YES  | MUL | NULL              |                             |
| tgl_transaksi | timestamp | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
| jumlah        | int(11)   | YES  |     | NULL              |                             |
| harga         | int(11)   | YES  |     | NULL              |                             |
+---------------+-----------+------+-----+-------------------+-----------------------------+
*/

CREATE TABLE `transaksi_ikan` (
  `id` int(11) NOT NULL,
  `id_penambak` int(11) NOT NULL,
  `id_ikan` int(11) NOT NULL,
  `id_konsumen` int(11) DEFAULT NULL,
  `tgl_transaksi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_ikan`
--

INSERT INTO `transaksi_ikan` (`id`, `id_penambak`, `id_ikan`, `id_konsumen`, `tgl_transaksi`, `jumlah`, `harga`) VALUES
(1, 1, 1, 1, '2018-04-28 01:00:00', 2, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_investor`
--
/*
+------------------+-----------+------+-----+-------------------+-----------------------------+
| Field            | Type      | Null | Key | Default           | Extra                       |
+------------------+-----------+------+-----+-------------------+-----------------------------+
| id               | int(11)   | NO   | PRI | NULL              |                             |
| id_investor      | int(11)   | NO   | MUL | NULL              |                             |
| id_ikan          | int(11)   | NO   | MUL | NULL              |                             |
| jumlah_investasi | int(11)   | NO   |     | NULL              |                             |
| waktu_investasi  | timestamp | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
+------------------+-----------+------+-----+-------------------+-----------------------------+
*/

CREATE TABLE `transaksi_investor` (
  `id` int(11) NOT NULL,
  `id_investor` int(11) NOT NULL,
  `id_ikan` int(11) NOT NULL,
  `jumlah_investasi` int(11) NOT NULL,
  `waktu_investasi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_investor`
--

INSERT INTO `transaksi_investor` (`id`, `id_investor`, `id_ikan`, `jumlah_investasi`, `waktu_investasi`) VALUES
(1, 1, 1, 250000000, '2018-04-26 23:00:15');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_pakan`
--
/*
+-------------------------+----------+------+-----+---------+-------+
| Field                   | Type     | Null | Key | Default | Extra |
+-------------------------+----------+------+-----+---------+-------+
| id_transaksi_pakan      | int(11)  | NO   | PRI | NULL    |       |
| id_konsumen             | int(11)  | YES  | MUL | NULL    |       |
| id_pakan                | int(11)  | YES  | MUL | NULL    |       |
| id_penjual              | int(11)  | YES  | MUL | NULL    |       |
| waktu_tanggal_transaksi | datetime | YES  |     | NULL    |       |
| jumlah                  | int(11)  | YES  |     | NULL    |       |
| harga                   | int(11)  | YES  |     | NULL    |       |
+-------------------------+----------+------+-----+---------+-------+
*/

CREATE TABLE `transaksi_pakan` (
  `id_transaksi_pakan` int(11) NOT NULL,
  `id_konsumen` int(11) DEFAULT NULL,
  `id_pakan` int(11) DEFAULT NULL,
  `id_penjual` int(11) DEFAULT NULL,
  `waktu_tanggal_transaksi` datetime DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_pakan`
--

INSERT INTO `transaksi_pakan` (`id_transaksi_pakan`, `id_konsumen`, `id_pakan`, `id_penjual`, `waktu_tanggal_transaksi`, `jumlah`, `harga`) VALUES
(1, 1, 1, 1, '2018-04-28 08:00:00', 1, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_pendanaan`
--
/*
+------------------+-----------+------+-----+-------------------+-----------------------------+
| Field            | Type      | Null | Key | Default           | Extra                       |
+------------------+-----------+------+-----+-------------------+-----------------------------+
| id               | int(11)   | NO   | PRI | NULL              |                             |
| id_penambak      | int(11)   | NO   | MUL | NULL              |                             |
| id_modal         | int(11)   | NO   | MUL | NULL              |                             |
| waktu_pendanaan  | timestamp | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
| jumlah_pendanaan | int(11)   | YES  |     | NULL              |                             |
+------------------+-----------+------+-----+-------------------+-----------------------------+
*/
CREATE TABLE `transaksi_pendanaan` (
  `id` int(11) NOT NULL,
  `id_penambak` int(11) NOT NULL,
  `id_modal` int(11) NOT NULL,
  `waktu_pendanaan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `jumlah_pendanaan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_pendanaan`
--

INSERT INTO `transaksi_pendanaan` (`id`, `id_penambak`, `id_modal`, `waktu_pendanaan`, `jumlah_pendanaan`) VALUES
(1, 1, 1, '2018-04-28 01:00:00', 2000000);

-- --------------------------------------------------------

--
-- Table structure for table `wilayah`
--
/*
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int(11)     | NO   | PRI | NULL    |       |
| nama  | varchar(45) | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
*/

CREATE TABLE `wilayah` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wilayah`
--

INSERT INTO `wilayah` (`id`, `nama`) VALUES
(1, 'Jakarta');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `benih`
--
ALTER TABLE `benih`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_benih_ikan` (`id_benih_ikan`);

--
-- Indexes for table `ikan`
--
ALTER TABLE `ikan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investor`
--
ALTER TABLE `investor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `NIK` (`NIK`),
  ADD UNIQUE KEY `no_rekening` (`no_rekening`);

--
-- Indexes for table `konsumen`
--
ALTER TABLE `konsumen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_rekening` (`no_rekening`),
  ADD KEY `id_wilayah` (`id_wilayah`);

--
-- Indexes for table `modal`
--
ALTER TABLE `modal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tambak` (`id_tambak`);

--
-- Indexes for table `monitor_ikan`
--
ALTER TABLE `monitor_ikan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_penambak` (`id_penambak`),
  ADD KEY `id_pakar` (`id_pakar`),
  ADD KEY `id_tambak` (`id_tambak`);

--
-- Indexes for table `pakan`
--
ALTER TABLE `pakan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pakar`
--
ALTER TABLE `pakar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `NIK` (`NIK`);

--
-- Indexes for table `panen`
--
ALTER TABLE `panen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_wilayah` (`id_wilayah`),
  ADD KEY `id_penambak` (`id_penambak`);

--
-- Indexes for table `penambak`
--
ALTER TABLE `penambak`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `NIK` (`NIK`),
  ADD KEY `id_wilayah` (`id_wilayah`);

--
-- Indexes for table `penjual_benih`
--
ALTER TABLE `penjual_benih`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_rekening` (`no_rekening`),
  ADD KEY `id_benih` (`id_benih`),
  ADD KEY `id_wilayah` (`id_wilayah`);

--
-- Indexes for table `penjual_pakan`
--
ALTER TABLE `penjual_pakan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_rekening` (`no_rekening`),
  ADD KEY `id_pakan` (`id_pakan`),
  ADD KEY `id_wilayah` (`id_wilayah`);

--
-- Indexes for table `tambak`
--
ALTER TABLE `tambak`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_penambak` (`id_penambak`),
  ADD KEY `id_ikan` (`id_ikan`);

--
-- Indexes for table `total_transaksi`
--
ALTER TABLE `total_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi_benih`
--
ALTER TABLE `transaksi_benih`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_penjual` (`id_penjual`),
  ADD KEY `id_konsumen` (`id_konsumen`),
  ADD KEY `id_benih` (`id_benih`);

--
-- Indexes for table `transaksi_ikan`
--
ALTER TABLE `transaksi_ikan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_penambak` (`id_penambak`),
  ADD KEY `id_ikan` (`id_ikan`),
  ADD KEY `id_konsumen` (`id_konsumen`);

--
-- Indexes for table `transaksi_investor`
--
ALTER TABLE `transaksi_investor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_investor` (`id_investor`),
  ADD KEY `id_ikan` (`id_ikan`);

--
-- Indexes for table `transaksi_pakan`
--
ALTER TABLE `transaksi_pakan`
  ADD PRIMARY KEY (`id_transaksi_pakan`),
  ADD KEY `id_pakan` (`id_pakan`),
  ADD KEY `id_konsumen` (`id_konsumen`),
  ADD KEY `id_penjual` (`id_penjual`);

--
-- Indexes for table `transaksi_pendanaan`
--
ALTER TABLE `transaksi_pendanaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_penambak` (`id_penambak`),
  ADD KEY `id_modal` (`id_modal`);

--
-- Indexes for table `wilayah`
--
ALTER TABLE `wilayah`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `benih`
--
ALTER TABLE `benih`
  ADD CONSTRAINT `benih_ibfk_1` FOREIGN KEY (`id_benih_ikan`) REFERENCES `ikan` (`id`);

--
-- Constraints for table `konsumen`
--
ALTER TABLE `konsumen`
  ADD CONSTRAINT `konsumen_ibfk_1` FOREIGN KEY (`id_wilayah`) REFERENCES `wilayah` (`id`);

--
-- Constraints for table `modal`
--
ALTER TABLE `modal`
  ADD CONSTRAINT `modal_ibfk_1` FOREIGN KEY (`id_tambak`) REFERENCES `tambak` (`id`);

--
-- Constraints for table `monitor_ikan`
--
ALTER TABLE `monitor_ikan`
  ADD CONSTRAINT `monitor_ikan_ibfk_1` FOREIGN KEY (`id_penambak`) REFERENCES `penambak` (`id`),
  ADD CONSTRAINT `monitor_ikan_ibfk_2` FOREIGN KEY (`id_pakar`) REFERENCES `pakar` (`id`),
  ADD CONSTRAINT `monitor_ikan_ibfk_3` FOREIGN KEY (`id_tambak`) REFERENCES `ikan` (`id`);

--
-- Constraints for table `panen`
--
ALTER TABLE `panen`
  ADD CONSTRAINT `panen_ibfk_1` FOREIGN KEY (`id_wilayah`) REFERENCES `wilayah` (`id`),
  ADD CONSTRAINT `panen_ibfk_2` FOREIGN KEY (`id_penambak`) REFERENCES `penambak` (`id`);

--
-- Constraints for table `penambak`
--
ALTER TABLE `penambak`
  ADD CONSTRAINT `penambak_ibfk_1` FOREIGN KEY (`id_wilayah`) REFERENCES `wilayah` (`id`);

--
-- Constraints for table `penjual_benih`
--
ALTER TABLE `penjual_benih`
  ADD CONSTRAINT `penjual_benih_ibfk_1` FOREIGN KEY (`id_benih`) REFERENCES `benih` (`id`),
  ADD CONSTRAINT `penjual_benih_ibfk_2` FOREIGN KEY (`id_wilayah`) REFERENCES `wilayah` (`id`);

--
-- Constraints for table `penjual_pakan`
--
ALTER TABLE `penjual_pakan`
  ADD CONSTRAINT `penjual_pakan_ibfk_1` FOREIGN KEY (`id_pakan`) REFERENCES `pakan` (`id`),
  ADD CONSTRAINT `penjual_pakan_ibfk_2` FOREIGN KEY (`id_wilayah`) REFERENCES `wilayah` (`id`);

--
-- Constraints for table `tambak`
--
ALTER TABLE `tambak`
  ADD CONSTRAINT `tambak_ibfk_1` FOREIGN KEY (`id_penambak`) REFERENCES `penambak` (`id`),
  ADD CONSTRAINT `tambak_ibfk_2` FOREIGN KEY (`id_ikan`) REFERENCES `ikan` (`id`);

--
-- Constraints for table `transaksi_benih`
--
ALTER TABLE `transaksi_benih`
  ADD CONSTRAINT `transaksi_benih_ibfk_1` FOREIGN KEY (`id_penjual`) REFERENCES `penjual_benih` (`id`),
  ADD CONSTRAINT `transaksi_benih_ibfk_2` FOREIGN KEY (`id_konsumen`) REFERENCES `konsumen` (`id`),
  ADD CONSTRAINT `transaksi_benih_ibfk_3` FOREIGN KEY (`id_benih`) REFERENCES `benih` (`id`);

--
-- Constraints for table `transaksi_ikan`
--
ALTER TABLE `transaksi_ikan`
  ADD CONSTRAINT `transaksi_ikan_ibfk_1` FOREIGN KEY (`id_penambak`) REFERENCES `penambak` (`id`),
  ADD CONSTRAINT `transaksi_ikan_ibfk_2` FOREIGN KEY (`id_ikan`) REFERENCES `ikan` (`id`),
  ADD CONSTRAINT `transaksi_ikan_ibfk_3` FOREIGN KEY (`id_konsumen`) REFERENCES `konsumen` (`id`);

--
-- Constraints for table `transaksi_investor`
--
ALTER TABLE `transaksi_investor`
  ADD CONSTRAINT `transaksi_investor_ibfk_1` FOREIGN KEY (`id_investor`) REFERENCES `investor` (`id`),
  ADD CONSTRAINT `transaksi_investor_ibfk_2` FOREIGN KEY (`id_ikan`) REFERENCES `ikan` (`id`);

--
-- Constraints for table `transaksi_pakan`
--
ALTER TABLE `transaksi_pakan`
  ADD CONSTRAINT `transaksi_pakan_ibfk_1` FOREIGN KEY (`id_pakan`) REFERENCES `pakan` (`id`),
  ADD CONSTRAINT `transaksi_pakan_ibfk_2` FOREIGN KEY (`id_konsumen`) REFERENCES `konsumen` (`id`),
  ADD CONSTRAINT `transaksi_pakan_ibfk_3` FOREIGN KEY (`id_penjual`) REFERENCES `penjual_pakan` (`id`);

--
-- Constraints for table `transaksi_pendanaan`
--
ALTER TABLE `transaksi_pendanaan`
  ADD CONSTRAINT `transaksi_pendanaan_ibfk_1` FOREIGN KEY (`id_penambak`) REFERENCES `penambak` (`id`),
  ADD CONSTRAINT `transaksi_pendanaan_ibfk_2` FOREIGN KEY (`id_modal`) REFERENCES `penambak` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*
MariaDB [ikan_db]> select*from ikan;
+----+------+
| id | nama |
+----+------+
|  1 | Lele |
+----+------+
1 row in set (0.00 sec)

MariaDB [ikan_db]> select*from wilayah;
+----+---------+
| id | nama    |
+----+---------+
|  1 | Jakarta |
+----+---------+
1 row in set (0.02 sec)

MariaDB [ikan_db]> select*from konsumen;
+----+------------+------------+-----------------------------------------------+--------------+---------------------+--------------+
| id | nama       | id_wilayah | alamat                                        | kontak       | email               | no_rekening  |
+----+------------+------------+-----------------------------------------------+--------------+---------------------+--------------+
|  1 | Nuha Taqwa |          1 | Kampung Sawah,Gang Arus, RT/RW 09/09, Srengse | 082220885531 | nuhataqwa@gmail.com | 009 555 5554 |
+----+------------+------------+-----------------------------------------------+--------------+---------------------+--------------+
1 row in set (0.01 sec)

MariaDB [ikan_db]> select*from penambak;
+----+---------------------+------------------+------+------------+-----------------------------------------------+--------------+
| id | nama                | NIK              | umur | id_wilayah | alamat                                        | kontak       |
+----+---------------------+------------------+------+------------+-----------------------------------------------+--------------+
|  1 | Angling Samarkhandi | 6781672853674562 |   35 |          1 | Senayan, Jl. Gatot Subroto, RT.1/RW.3, Gelora | 085643387639 |
+----+---------------------+------------------+------+------------+-----------------------------------------------+--------------+
1 row in set (0.00 sec)

MariaDB [ikan_db]> select*from tambak;
+----+-------------+---------+------+
| id | id_penambak | id_ikan | luas |
+----+-------------+---------+------+
|  1 |           1 |       1 |    8 |
+----+-------------+---------+------+
1 row in set (0.00 sec)

MariaDB [ikan_db]> select*from modal;
+----+-----------+-----------------+---------------+
| id | id_tambak | kebutuhan_modal | dana_diterima |
+----+-----------+-----------------+---------------+
|  1 |         1 |         2000000 |             0 |
+----+-----------+-----------------+---------------+
1 row in set (0.00 sec)

MariaDB [ikan_db]> select*from transaksi_pendanaan;
+----+-------------+----------+---------------------+------------------+
| id | id_penambak | id_modal | waktu_pendanaan     | jumlah_pendanaan |
+----+-------------+----------+---------------------+------------------+
|  1 |           1 |        1 | 2018-04-28 08:00:00 |          2000000 |
+----+-------------+----------+---------------------+------------------+
1 row in set (0.00 sec)

MariaDB [ikan_db]> select*from transaksi_ikan;
+----+-------------+---------+-------------+---------------------+--------+-------+
| id | id_penambak | id_ikan | id_konsumen | tgl_transaksi       | jumlah | harga |
+----+-------------+---------+-------------+---------------------+--------+-------+
|  1 |           1 |       1 |           1 | 2018-04-28 08:00:00 |      2 | 40000 |
+----+-------------+---------+-------------+---------------------+--------+-------+
1 row in set (0.00 sec)

MariaDB [ikan_db]> select*from pakar;
+----+--------------+--------------+-----------------------------------+--------------+-----------------+-------------------+
| id | NIK          | nama         | alamat                            | kontak       | email           | keahlian          |
+----+--------------+--------------+-----------------------------------+--------------+-----------------+-------------------+
|  1 | 908719971123 | Muhammad Ali | Jln.Serengseng Mawar No.9 Jakarta | 081280889000 | ali@hotmail.com | Fish Parasitology |
+----+--------------+--------------+-----------------------------------+--------------+-----------------+-------------------+
1 row in set (0.00 sec)

MariaDB [ikan_db]> select*from monitor_ikan;
+----+-------------+----------+-----------+-----------+-----------------------------------------------------------------------------------------------+---------------------+
| id | id_penambak | id_pakar | id_tambak | usia_ikan | deskripsi                                                                                     | tgl_monitor         |
+----+-------------+----------+-----------+-----------+-----------------------------------------------------------------------------------------------+---------------------+
|  1 |           1 |        1 |         1 |         3 | rata-rata panjang ikan 6-8 cm, status ikan : sehat, rata-rata berat keseluruhan ikan  : 2 kg  | 2018-04-28 08:10:00 |
+----+-------------+----------+-----------+-----------+-----------------------------------------------------------------------------------------------+---------------------+
1 row in set (0.00 sec)

MariaDB [ikan_db]> select*from panen;
+----+------------+-------------+---------------------+
| id | id_wilayah | id_penambak | waktu_panen         |
+----+------------+-------------+---------------------+
|  1 |          1 |           1 | 2018-04-28 09:00:00 |
+----+------------+-------------+---------------------+
1 row in set (0.00 sec)

MariaDB [ikan_db]> select*from penjual_pakan;
+----+------------------+----------------+----------+------------+-----------------------------------------------+--------------+--------------+
| id | nama             | nama_toko      | id_pakan | id_wilayah | alamat                                        | kontak       | no_rekening  |
+----+------------------+----------------+----------+------------+-----------------------------------------------+--------------+--------------+
|  1 | Raditya Ramadhan | Raditya Sukses |        1 |          1 | Jl. KH Agus Salim 16, Sabang, Menteng Jakarta | 089567352132 | 301 007 0752 |
+----+------------------+----------------+----------+------------+-----------------------------------------------+--------------+--------------+
1 row in set (0.00 sec)

MariaDB [ikan_db]> select*from investor;
+----+-----------------+-----------------+------+---------------------------------------+--------------+----------------+
| id | nama            | NIK             | umur | alamat                                | kontak       | no_rekening    |
+----+-----------------+-----------------+------+---------------------------------------+--------------+----------------+
|  1 | Muhammad Ridwan | 000451233001120 |   40 | Jl Melati no 45 mampang jakarta timur | 085790897656 | 0223-9078-0098 |
+----+-----------------+-----------------+------+---------------------------------------+--------------+----------------+
1 row in set (0.00 sec)

MariaDB [ikan_db]> select*from transaksi_investor;
+----+-------------+---------+------------------+---------------------+
| id | id_investor | id_ikan | jumlah_investasi | waktu_investasi     |
+----+-------------+---------+------------------+---------------------+
|  1 |           1 |       1 |        250000000 | 2018-04-27 06:00:15 |
+----+-------------+---------+------------------+---------------------+
1 row in set (0.00 sec)

MariaDB [ikan_db]> select*from benih
    -> ;
+----+---------------+
| id | id_benih_ikan |
+----+---------------+
|  1 |             1 |
+----+---------------+
1 row in set (0.00 sec)

MariaDB [ikan_db]> select*from penjual_benih;
+----+--------------------+------------+----------+------------+-----------------------------------------------+--------------+------------------+
| id | nama               | nama_toko  | id_benih | id_wilayah | alamat                                        | kontak       | no_rekening      |
+----+--------------------+------------+----------+------------+-----------------------------------------------+--------------+------------------+
|  1 | Aisyah Nur Sabrina | Nursa Jaya |        1 |          1 | Jl. Taman Margasatwa No. 12, Nursa Jaya, Jaka | 098761256712 | 070 00 0187777 3 |
+----+--------------------+------------+----------+------------+-----------------------------------------------+--------------+------------------+
1 row in set (0.00 sec)

MariaDB [ikan_db]> select*from transaksi_pakan;
+--------------------+-------------+----------+------------+-------------------------+--------+-------+
| id_transaksi_pakan | id_konsumen | id_pakan | id_penjual | waktu_tanggal_transaksi | jumlah | harga |
+--------------------+-------------+----------+------------+-------------------------+--------+-------+
|                  1 |           1 |        1 |          1 | 2018-04-28 08:00:00     |      1 | 15000 |
+--------------------+-------------+----------+------------+-------------------------+--------+-------+
1 row in set (0.00 sec)

MariaDB [ikan_db]> select*from transaksi_benih;
+----+------------+-------------+----------+--------+-------+---------------------+
| id | id_penjual | id_konsumen | id_benih | jumlah | harga | waktu_dan_tanggal   |
+----+------------+-------------+----------+--------+-------+---------------------+
|  1 |          1 |           1 |        1 |     10 |   500 | 2018-04-28 08:00:00 |
+----+------------+-------------+----------+--------+-------+---------------------+
1 row in set (0.00 sec)

MariaDB [ikan_db]> select*from total_transaksi;
+----+---------------------+-------------+
| id | waktu_dan_tanggal   | total_harga |
+----+---------------------+-------------+
|  1 | 2018-04-28 10:01:00 |       60000 |
+----+---------------------+-------------+
1 row in set (0.00 sec)

MariaDB [ikan_db]>
*/
