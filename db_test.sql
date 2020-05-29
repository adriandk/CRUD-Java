-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Bulan Mei 2020 pada 05.57
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_test`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `laundry`
--

CREATE TABLE `laundry` (
  `kode_baju` int(11) NOT NULL,
  `jenis_baju` varchar(100) NOT NULL,
  `harga` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `laundry`
--

INSERT INTO `laundry` (`kode_baju`, `jenis_baju`, `harga`) VALUES
(1, 'Basah', '1000'),
(2, 'Kering', '2000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `kode_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(25) NOT NULL,
  `alamat` text NOT NULL,
  `nohp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`kode_pelanggan`, `nama_pelanggan`, `alamat`, `nohp`) VALUES
(1, 'aa', 'aaa', '123456789'),
(2, 'bb', 'dawdawdawd', '1234567890'),
(3, 'aaa', 'wdwad', '122222');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `kode_pelanggan` int(11) NOT NULL,
  `kode_baju` int(11) NOT NULL,
  `berat_baju` varchar(25) NOT NULL,
  `total` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`kode_pelanggan`, `kode_baju`, `berat_baju`, `total`) VALUES
(1, 2, '3', '6000');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `laundry`
--
ALTER TABLE `laundry`
  ADD PRIMARY KEY (`kode_baju`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`kode_pelanggan`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD KEY `kode_pelanggan` (`kode_pelanggan`),
  ADD KEY `kode_baju` (`kode_baju`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`kode_pelanggan`) REFERENCES `pelanggan` (`kode_pelanggan`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`kode_baju`) REFERENCES `laundry` (`kode_baju`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
