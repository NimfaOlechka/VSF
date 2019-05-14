-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Vært: 127.0.0.1
-- Genereringstid: 14. 05 2019 kl. 10:25:42
-- Serverversion: 10.1.38-MariaDB
-- PHP-version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vsf`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `bruger_kurser`
--

CREATE TABLE `bruger_kurser` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `kurs_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `fag`
--

CREATE TABLE `fag` (
  `fag_uid` int(11) NOT NULL,
  `fag_title` varchar(255) NOT NULL,
  `startdato` date NOT NULL,
  `enddato` date NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `fag`
--

INSERT INTO `fag` (`fag_uid`, `fag_title`, `startdato`, `enddato`, `created`, `modified`) VALUES
(1609, 'Embedded controller projekt(efter H5)', '2019-02-25', '2019-05-03', '2019-05-10 11:07:39', '2019-05-10 11:08:13'),
(6245, 'Gateway sikkerhed', '2019-03-18', '2019-03-22', '2019-05-10 11:09:44', '2019-05-10 11:09:44'),
(6295, 'Core applications', '2019-03-11', '2019-03-15', '2019-05-10 11:09:44', '2019-05-10 11:09:44');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `kurser`
--

CREATE TABLE `kurser` (
  `kurs_id` int(11) NOT NULL,
  `fag_uid` int(11) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `merc_udd`
--

CREATE TABLE `merc_udd` (
  `udd_id` int(11) NOT NULL,
  `udd_uid` int(11) NOT NULL,
  `udd_title` varchar(50) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `risros`
--

CREATE TABLE `risros` (
  `id` int(11) NOT NULL,
  `navn` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `kommentar` longtext NOT NULL,
  `dato` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabel der indeholder alle data fra risros systemet.';

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `roles`
--

CREATE TABLE `roles` (
  `role_key` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `roles`
--

INSERT INTO `roles` (`role_key`, `description`, `created`, `modified`) VALUES
('admin', 'administrator rettigheder', '2019-04-30 14:12:18', '2019-04-30 14:12:18'),
('elev', 'elev rettigheder', '2019-04-30 14:12:18', '2019-04-30 14:12:18');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `uddannelse`
--

CREATE TABLE `uddannelse` (
  `udd_uid` int(11) NOT NULL,
  `udd_title` varchar(50) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `uddannelse`
--

INSERT INTO `uddannelse` (`udd_uid`, `udd_title`, `created`, `modified`) VALUES
(1, 'IT Support', '2019-05-10 11:12:01', '2019-05-10 11:12:01'),
(2, 'Datatekniker Programmør', '2019-05-10 11:12:01', '2019-05-10 11:12:01'),
(3, 'Datatekniker Infrastruktur', '2019-05-10 11:13:21', '2019-05-10 11:13:21'),
(4, 'Elektrikker', '2019-05-13 13:07:42', '2019-05-13 13:07:42');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `udd_og_fag`
--

CREATE TABLE `udd_og_fag` (
  `udd_id` int(11) NOT NULL,
  `fag_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `udd_og_fag`
--

INSERT INTO `udd_og_fag` (`udd_id`, `fag_id`, `created`, `modified`) VALUES
(2, 6295, '2019-05-10 11:14:01', '2019-05-10 11:14:01'),
(3, 6295, '2019-05-10 11:14:01', '2019-05-10 11:14:01');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `contact_number` varchar(64) NOT NULL,
  `address` text NOT NULL,
  `password` varchar(512) NOT NULL,
  `udd_uid` int(11) NOT NULL,
  `access_level` varchar(16) NOT NULL,
  `access_code` text NOT NULL,
  `status` int(11) NOT NULL COMMENT '0=pending,1=confirmed',
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='admin and customer users';

--
-- Data dump for tabellen `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `contact_number`, `address`, `password`, `udd_uid`, `access_level`, `access_code`, `status`, `created`, `modified`) VALUES
(1, 'Mike', 'Dalisay', 'mike@example.com', '0999999999', 'Blk. 24 A, Lot 6, Ph. 3, Peace Village', '$2y$10$AUBptrm9sQF696zr8Hv31On3x4wqnTihdCLocZmGLbiDvyLpyokL.', 1, 'Admin', '', 1, '0000-00-00 00:00:00', '2019-05-14 08:22:12'),
(2, 'Lauro', 'Abogne', 'lauro@eacomm.com', '08888888', 'Pasig City', '$2y$10$it4i11kRKrB19FfpPRWsRO5qtgrgajL7NnxOq180MsIhCKhAmSdDa', 1, 'Customer', '', 1, '0000-00-00 00:00:00', '2019-05-14 08:22:20'),
(4, 'Darwin', 'Dalisay', 'darwin@example.com', '9331868359', 'Blk 24 A Lot 6 Ph 3\r\nPeace Village, San Luis', '$2y$10$tLq9lTKDUt7EyTFhxL0QHuen/BgO9YQzFYTUyH50kJXLJ.ISO3HAO', 3, 'Customer', 'ILXFBdMAbHVrJswNDnm231cziO8FZomn', 1, '2014-10-29 17:31:09', '2019-05-14 08:22:24'),
(7, 'Marisol Jane', 'Dalisay', 'mariz@gmail.com', '09998765432', 'Blk. 24 A, Lot 6, Ph. 3, Peace Village', 'mariz', 4, 'Customer', '', 1, '2015-02-25 09:35:52', '2019-05-14 08:22:27'),
(9, 'Marykris', 'De Leon', 'marykrisdarell.deleon@gmail.com', '09194444444', 'Project 4, QC', '$2y$10$uUy7D5qmvaRYttLCx9wnU.WOD3/8URgOX7OBXHPpWyTDjU4ZteSEm', 2, 'Customer', '', 1, '2015-02-27 14:28:46', '2019-05-14 08:22:33'),
(10, 'Merlin', 'Duckerberg', 'merlin@gmail.com', '09991112333', 'Project 2, Quezon City', '$2y$10$VHY58eALB1QyYsP71RHD1ewmVxZZp.wLuhejyQrufvdy041arx1Kq', 1, 'Admin', '', 1, '2015-03-18 06:45:28', '2019-05-14 08:22:36'),
(14, 'Charlon', 'Ignacio', 'charlon@gmail.com', '09876543345', 'Tandang Sora, QC', '$2y$10$Fj6O1tPYI6UZRzJ9BNfFJuhURN9DnK5fQGHEsfol5LXRu.tCYYggu', 3, 'Customer', '', 1, '2015-03-24 08:06:57', '2019-05-14 08:22:39'),
(15, 'Kobe Bro', 'Bryant', 'kobe@gmail.com', '09898787674', 'Los Angeles, California', '$2y$10$fmanyjJxNfJ8O3p9jjUixu6EOHkGZrThtcd..TeNz2g.XZyCIuVpm', 3, 'Customer', '', 1, '2015-03-26 11:28:01', '2019-05-14 08:22:43'),
(20, 'Tim', 'Duncan', 'tim@example.com', '9999999', 'San Antonio, Texas, USA', '$2y$10$9OSKHLhiDdBkJTmd3VLnQeNPCtyH1IvZmcHrz4khBMHdxc8PLX5G6', 4, 'Customer', '0X4JwsRmdif8UyyIHSOUjhZz9tva3Czj', 1, '2016-05-26 01:25:59', '2019-05-14 08:22:47'),
(21, 'Tony', 'Parker', 'tony@example.com', '8888888', 'Blk 24 A Lot 6 Ph 3\r\nPeace Village, San Luis', '$2y$10$lBJfvLyl/X5PieaztTYADOxOQeZJCqETayF.O9ld17z3hcKSJwZae', 2, 'Customer', 'THM3xkZzXeza5ISoTyPKl6oLpVa88tYl', 1, '2016-05-26 01:29:01', '2019-05-14 08:22:52'),
(22, 'Test', 'Testname', 'test@test.com', '20356254', 'HC Andersensvej 9', '$2y$10$ZJVXvloAJvwEukap4smdEOhpZrzrCkZocVRaFUtfOaw8PS66mtvwC', 3, 'Customer', '', 1, '2019-05-07 14:03:17', '2019-05-14 08:22:57'),
(23, 'Testa', 'Testovich', 'test1@test.com', '20203022', 'test vej 9', '$2y$10$kPhpI8UDOXBuYXvaHO70M.1tGQSrQWzu2xCBIVrnk6ynJa2.S134.', 2, 'Customer', '', 1, '2019-05-13 13:32:43', '2019-05-13 11:32:43'),
(24, 'Fname', 'Lname', 'lname@test.dk', '45452356', 'Grontvigsvej 56', '$2y$10$40MSYZFFP0hhnfvn1ag6JuwA3CCPkAIpmjKYZ1DAdxjPUG3.cgB4K', 2, 'Customer', '', 1, '2019-05-14 09:30:08', '2019-05-14 07:30:08');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `usersadmin`
--

CREATE TABLE `usersadmin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `usersadmin`
--

INSERT INTO `usersadmin` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin', '$2y$10$53Ls1n/IXCmI8EfcIxaXx.HPaDnwBi0vRjoOlmUsRxdkGLaoDloYq', '2019-04-29 10:45:28');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `user_details`
--

CREATE TABLE `user_details` (
  `detail_id` int(11) NOT NULL,
  `user_uid` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `telefon` varchar(100) NOT NULL,
  `virksomhed` varchar(255) NOT NULL,
  `virk_email` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `bruger_kurser`
--
ALTER TABLE `bruger_kurser`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `fag`
--
ALTER TABLE `fag`
  ADD PRIMARY KEY (`fag_uid`);

--
-- Indeks for tabel `merc_udd`
--
ALTER TABLE `merc_udd`
  ADD PRIMARY KEY (`udd_id`);

--
-- Indeks for tabel `risros`
--
ALTER TABLE `risros`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_key`),
  ADD UNIQUE KEY `role_key` (`role_key`);

--
-- Indeks for tabel `uddannelse`
--
ALTER TABLE `uddannelse`
  ADD PRIMARY KEY (`udd_uid`);

--
-- Indeks for tabel `udd_og_fag`
--
ALTER TABLE `udd_og_fag`
  ADD PRIMARY KEY (`udd_id`,`fag_id`),
  ADD KEY `fagID` (`fag_id`);

--
-- Indeks for tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `udd_fk` (`udd_uid`);

--
-- Indeks for tabel `usersadmin`
--
ALTER TABLE `usersadmin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks for tabel `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`detail_id`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `bruger_kurser`
--
ALTER TABLE `bruger_kurser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `merc_udd`
--
ALTER TABLE `merc_udd`
  MODIFY `udd_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `risros`
--
ALTER TABLE `risros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Tilføj AUTO_INCREMENT i tabel `usersadmin`
--
ALTER TABLE `usersadmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tilføj AUTO_INCREMENT i tabel `user_details`
--
ALTER TABLE `user_details`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `udd_og_fag`
--
ALTER TABLE `udd_og_fag`
  ADD CONSTRAINT `UddID` FOREIGN KEY (`udd_id`) REFERENCES `uddannelse` (`udd_uid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fagID` FOREIGN KEY (`fag_id`) REFERENCES `fag` (`fag_uid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Begrænsninger for tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `udd_fk` FOREIGN KEY (`udd_uid`) REFERENCES `uddannelse` (`udd_uid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
