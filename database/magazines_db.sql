-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Feb 2024 pada 21.12
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `magazines_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0= Inactive, 1 = Active',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `status`, `date_created`) VALUES
(2, 'Art', 'This is an Art Magazines Categories', 1, '2021-11-27 10:21:23'),
(3, 'Business', 'This is a Business Magazine Category', 1, '2021-11-27 10:24:03'),
(4, 'Cooking', 'This is a Cooking Magazines Category', 1, '2021-11-27 10:25:35'),
(5, 'Fashion', 'This is a Fashion Magazines Category', 1, '2021-11-27 10:30:22'),
(6, 'Technology', 'This is a Technology Magazines Category', 1, '2021-11-27 10:30:46'),
(7, 'Riders and Drivers', 'This is a Riders and Drivers Magazines Categories', 1, '2021-11-27 10:31:27'),
(8, 'Wild', 'This is a Wild Magazines Category.', 0, '2021-11-27 10:31:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `comment_list`
--

CREATE TABLE `comment_list` (
  `id` int(30) NOT NULL,
  `magazine_id` int(30) NOT NULL,
  `comment` text NOT NULL,
  `name` text NOT NULL,
  `user_id` int(30) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = not verified,1= verified ',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `magazine_list`
--

CREATE TABLE `magazine_list` (
  `id` int(30) NOT NULL,
  `title` text NOT NULL,
  `category_id` int(30) NOT NULL,
  `description` text NOT NULL,
  `banner_path` text NOT NULL,
  `pdf_path` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 = Not Published, 1= Published',
  `user_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `magazine_list`
--

INSERT INTO `magazine_list` (`id`, `title`, `category_id`, `description`, `banner_path`, `pdf_path`, `status`, `user_id`, `date_created`, `date_updated`) VALUES
(3, 'Majalah ICT', 6, '&lt;p&gt;Majalah ICT&lt;br&gt;&lt;/p&gt;', 'uploads/banners/magazine-3.png?v=1708113775', 'uploads/pdf/magazine-.pdf?v=1708113775', 1, 1, '2024-02-17 03:02:55', '2024-02-17 03:02:55'),
(4, 'Menjadi Programmer Handal', 6, '&lt;p&gt;Menjadi Programmer Handal&lt;br&gt;&lt;/p&gt;', 'uploads/banners/magazine-4.png?v=1708114051', 'uploads/pdf/magazine-.pdf?v=1708114051', 1, 1, '2024-02-17 03:07:31', '2024-02-17 03:07:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'UNSIA MAJALAH'),
(6, 'short_name', 'UNSIA MAJALAH'),
(11, 'logo', 'uploads/logo-1708111891.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1708111873.png'),
(15, 'content', 'Array');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1635556826', NULL, 1, 1, '2021-01-20 14:02:37', '2021-11-27 13:39:11'),
(5, 'agung', 'D', 'jaya', 'agung jaya', 'e59cd3ce33a68f536c19fedb82a7936f', 'uploads/avatar-5.png?v=1708113568', NULL, 2, 1, '2021-11-27 14:24:16', '2024-02-17 02:59:28'),
(6, 'imam', 'C', 'hadi', 'hadi', '76671d4b83f6e6f953ea2dfb75ded921', 'uploads/avatar-6.png?v=1708113503', NULL, 2, 1, '2021-11-27 14:25:31', '2024-02-17 02:58:54'),
(7, 'naufal', NULL, 'naufal', 'naufal', 'a7ef174d3ed272acd2b72913a7ef9d40', 'uploads/avatar-7.png?v=1708113606', NULL, 2, 0, '2024-02-17 03:00:06', '2024-02-17 03:00:06');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `comment_list`
--
ALTER TABLE `comment_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `magazine_id` (`magazine_id`);

--
-- Indeks untuk tabel `magazine_list`
--
ALTER TABLE `magazine_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `comment_list`
--
ALTER TABLE `comment_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `magazine_list`
--
ALTER TABLE `magazine_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `comment_list`
--
ALTER TABLE `comment_list`
  ADD CONSTRAINT `comment_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `comment_list_ibfk_2` FOREIGN KEY (`magazine_id`) REFERENCES `magazine_list` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `magazine_list`
--
ALTER TABLE `magazine_list`
  ADD CONSTRAINT `magazine_list_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `magazine_list_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
