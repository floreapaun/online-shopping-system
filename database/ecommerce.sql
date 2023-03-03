-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2023 at 11:24 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@alphashop.app', '$2y$10$apnW.HszqY9U.HYL9gyKuuej1SB0BSwdD/bJFRtFOKf4CFDDon3TC');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'Motorolla'),
(5, 'LG'),
(6, ' Gutti'),
(7, 'Nikon'),
(8, 'Dell'),
(9, 'Heiver'),
(10, 'Daismo');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(11, 45, '::1', 15, 1),
(44, 5, '::1', 15, 0),
(46, 2, '::1', 15, 0),
(51, 1, '::1', 15, 1),
(52, 5, '::1', 15, 1),
(56, 1, '::1', 15, 1),
(57, 2, '::1', 15, 1),
(148, 74, '127.0.0.1', 15, 1),
(223, 35, '127.0.0.1', 27, 1),
(224, 88, '127.0.0.1', 27, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Telefoane'),
(2, 'Laptop-uri'),
(3, 'Imprimante'),
(4, 'Periferice'),
(5, 'Desktop-uri'),
(6, 'Tablete');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'puneethreddy951@gmail.com'),
(5, 'puneethreddy@gmail.com'),
(6, 'george_tolocea@mail.com'),
(7, 'joedoe@mail.com'),
(8, 'romaangela@yahoo.com'),
(9, 'florea.user@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `prod_count` int(15) DEFAULT NULL COMMENT 'number of product types',
  `total_amt` int(15) DEFAULT NULL COMMENT 'order total price'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `address`, `zip`, `prod_count`, `total_amt`) VALUES
(2, 27, 'Prahova', 107314, 8, 27887),
(4, 27, 'Prahova', 107314, 1, 159),
(6, 27, 'Prahova', 123456, 1, 79),
(7, 27, 'Prahova', 123877, 1, 299),
(8, 27, 'Prahova', 899711, 1, 14500),
(9, 27, 'Prahova', 102324, 5, 25958),
(11, 27, 'Prahova, Ploiesti, Bulevardul Castanelor', 123499, 2, 3299),
(12, 27, 'Prahova, Ploiesti, Bulevardul Castanelor', 123499, 2, 17499),
(13, 27, 'Prahova, Ploiesti, Bulevardul Castanelor', 123499, 2, 30000),
(14, 27, 'Prahova, Ploiesti, Bulevardul Castanelor', 123499, 14, 143858),
(15, 32, 'Bucuresti', 109487, 1, 14500),
(16, 35, 'afsfsfds', 188787, 1, 499),
(17, 33, 'Bucuresti', 189703, 3, 19699),
(18, 33, 'Bucuresti', 189703, 6, 33049),
(19, 33, 'Bucuresti', 189703, 4, 21400),
(20, 33, 'Bucuresti', 189703, 4, 22149),
(21, 33, 'Bucuresti', 189703, 4, 4496),
(22, 37, 'Bucuresti', 123879, 4, 4796);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL COMMENT 'total price of all products with this id'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(135, 17, 76, 1, 4500),
(136, 17, 120, 1, 2199),
(137, 17, 6, 1, 13000),
(138, 18, 1, 1, 5000),
(139, 18, 2, 1, 1400),
(140, 18, 45, 1, 10000),
(141, 18, 6, 1, 13000),
(142, 18, 7, 1, 2999),
(143, 18, 47, 1, 650),
(144, 19, 71, 1, 5000),
(145, 19, 1, 1, 5000),
(146, 19, 2, 1, 1400),
(147, 19, 45, 1, 10000),
(148, 20, 6, 1, 13000),
(149, 20, 7, 1, 2999),
(150, 20, 47, 1, 650),
(151, 20, 74, 1, 5500),
(152, 21, 120, 1, 2199),
(153, 21, 121, 1, 499),
(154, 21, 122, 1, 799),
(155, 21, 123, 1, 999),
(156, 22, 124, 1, 1299),
(157, 22, 122, 1, 799),
(158, 22, 121, 1, 499),
(159, 22, 120, 1, 2199);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Samsung Galaxy S7 Edge', 5000, 'Samsung galaxy s7 edge', 'product07.png', 'samsung mobile electronics'),
(2, 1, 3, 'Iphone 5S', 1400, 'iphone 5s', 'http___pluspng.com_img-png_iphone-hd-png-iphone-apple-png-file-550.png', 'mobile iphone apple telefon'),
(5, 6, 3, 'iPad 2', 10000, 'Odata ce tii in mana noul iPad 2, o sa iti fie dificil sa il mai pui deoparte. Asta-i si ideea din spatele design-ului complet nou. Este cu 33% mai subtire si cu 15% mai usor decat primul iPad, astfel ca sta perfect in mainile tale. Si face navigatul pe internet, cititul e-mail-urilor si stirilor, vizionatul filmelor si cititul cartilor atat de natural, ca ai putea sa uiti ca in mainile tale se afla o adevarata revolutie tehnologica.', 'iPad-air.png', 'ipad tablet samsung'),
(6, 2, 1, 'Samsung Laptop R Series', 13000, 'samsung Black combination Laptop', 'laptop_PNG5939.png', 'samsung laptop '),
(7, 2, 1, 'Laptop Pavillion', 2999, 'Laptop Hp Pavillion', 'laptop_PNG5930.png', 'Laptop Hp Pavillion'),
(40, 5, 10, 'Unitate Daismo SuperbGame', 3000, 'Acest Sistem PC este dedicat utilizarii zilnice, facand fata cu succes tuturor testelor. Este un sistem dedicat pentru gama sa de utilizare. \n\nExperianta oferita de acest Sistem PC este una pe masura, acesta reusind sa indeplineasca task-urile si celor mai exigenti utilizatori.', 'unitate_gaming.jpg', 'unitate, gaming, jocuri'),
(45, 1, 2, 'Samsung Galaxy Note 3', 10000, '0', 'note3.jpg', 'samsung galaxy Note 3 neo'),
(47, 2, 8, 'Laptop Dell', 650, 'nbk', 'product01.png', 'Dell Laptop'),
(71, 1, 2, 'Samsung galaxy s7', 5000, 'Samsung galaxy s7', 'product07.png', 'samsung mobile electronics'),
(74, 2, 1, 'HP i5 Laptop', 5500, 'HP i5 laptop', 'product01.png', 'HP i5 laptop electronics'),
(75, 2, 1, 'HP i7 Laptop 8gb ram', 5500, 'HP i7 laptop 8gb ram', 'product03.png', 'HP i7 laptop 8gb ram electronics'),
(76, 6, 5, 'Tableta LG Note 6GB RAM', 4500, '\nLG Note este un intreg display – 9.7 inch de fotografii la inalta rezolutie, filme, pagini web, carti si mai mult. Iluminarea LED face tot ceea ce vezi extrem de clar, viu si luminos, Chiar si in locurile cu lumina scazuta – cum ar fi in avion. ', 'product04.png', 'sony note 6gb ram mobile electronics'),
(78, 2, 2, 'Samsung laptop 8gb RAM Intel Integerated Graphics', 4579, 'dell laptop 8gb ram intel integerated Graphics', 'product08.png', 'dell laptop 8gb ram intel integerated Graphics electronics'),
(92, 4, 9, 'HDD Extern BigSeaGate', 189, 'HDD-ul portabil BigSeaGate se instaleaza usor prin introducerea unei singure mufe USB in computerul dvs. Puteti sa il folositi in cateva secunde de la despachetare.', 'hdd_seagate.jpg', 'hdd, extern'),
(113, 6, 2, 'Tableta Samsung G Tab 100', 1299, 'Samsung G Tab 100 este special creat pentru utilizatorii care apreciaza stilul si design-ul bun. Este subtire, cu un capac metalic si margini rotunjite. O vei simti excelent in mainile tale.', 'tabletasamsunggtab100.png', 'tableta samsung'),
(114, 6, 3, 'Tableta Apple Ipad 9', 5999, 'Descarcati fisiere, redati filme, colaborati cu colegii si incarcati continut de aproape oriunde.\r\nWi-Fi-ul rapid va permite sa ramaneti conectat acasa, la serviciu, la scoala sau oriunde mergeti cu iPad 9.\r\nCu Gigabit class LTE, va puteti conecta chiar si atunci cand nu puteti accesa Wi-Fi.', 'tabletaappleipad9.jpg', 'tableta apple ipad'),
(115, 6, 1, 'Tableta HP MTAB 10', 2399, 'Propria ta ecranizare privata te asteapta acum oriunde ai fi cu Dolby Vision™ pe un ecran 2K uluitor. Vizioneaza serialul tau preferat fara griji, multumita ecranului cu certificat TÜV.', 'tabletahpmtab10.jpg', 'tableta hp'),
(116, 5, 1, 'Sistem Desktop PC HP Live 3', 1899, 'Intel I3-10100F pana la 4.3GHz, 8GB, 1TB + SSD 240GB, NVIDIA GeForce GT 730 2GB, Ubuntu\r\nSistem desktop PC HP Live 3 ideal pentru utilizarea aplicatiilor Office & Multimedia (navigare internet, email-uri, programe tip office, vizionare filme, muzica) fiind echipat cu un procesor grafic dedicate NVIDIA GeForce Graphics', 'hplive3.jpg', 'sistem pc desktop hp intel'),
(117, 5, 2, 'Sistem Desktop PC Samsung Duron F 100', 3999, 'Intel i7-11700 pana la 4.9GHz, 16GB, SSD 1TB, Intel UHD Graphics 750, Ubuntu.\r\nEsti pasionat de navigare pe internet sau diverse jocuri? Si noi! Din acest motiv venim in intampinarea ta cu cele mai noi desktop-uri Samsung dotate cu componente de ultima generatie, capabile sa faca fata atat exigentelor tale, cat si jocurilor din ce in ce mai infometate dupa resurse.', 'samsungduronf100.jpg', 'sistem desktop samsung'),
(118, 5, 8, 'Sistem Desktop PC Dell AES 500', 2999, 'Intel Core i5-11400 pana la 4.4 GHz, 8GB, 1 TB + SSD 256GB, Intel UHD Graphics 730, Free Dos.\r\nDell AES 500 este un computer desktop de acasa puternic, elegant si versatil, ideal pentru o gama larga de utilizari, de la crearea de continut de zi cu zi si lucrul la domiciliu pana la invatarea online si jocurile ocazionale. Dispune de un procesor de ultima generatie Inte® Core™ si grafica NVIDIA® de inalta performanta, anulare bidirectionala a zgomotului AI si un sistem termic optimizat, pentru a mentine lucrurile rapide, clare si reci. ', 'dellaes500.jpg', 'sistem desktop dell intel'),
(119, 4, 9, 'Tastatura Gaming Heiver VG7501', 199, 'Tastatura profesionala iluminata (rosu) 104 taste, inclusiv 8 taste cu functii rapide.\r\nTaste cu dispunere ergonomica si tastatura numerica intr-un design compact.\r\nTastele inalte reduc zgomotul in timpul tastarii, imbunatatesc viteza de raspuns si asigura apasarea silentioasa a tastelor.\r\nTaste multimedia.', 'tastaturaheivervg7501.jpg', 'tastatura gaming heiver'),
(120, 3, 1, 'Imprimanta HP LaserJet 100', 2199, 'Alege o imprimant? HP LaserJet 100 conceput? pentru a gestiona solu?iile de afaceri în mod sigur ?i eficient ?i pentru a economisi energia cu tonerul HP EcoSmart negru. ?ine pasul cu cerin?ele unei afaceri în dezvoltare folosind o imprimant? pe care po?i conta.', 'imprimantahplaserjet100.jpg', 'imprimanta hp '),
(121, 3, 1, 'Imprimanta HP LaserJet Tank', 499, 'Oricat de mica ar fi afacerea dumneavoastra, exigentele sunt mari. Imprimanta HP LaserJet Tank cu design ultra-compact este conceputa pentru utilizatorii individuali. Configurarea este rapida, utilizarea de zi cu zi e simpla, imprimarea se realizeaza prompt.', 'imprimantahplaserjettank.png', 'imprimanta hp'),
(122, 3, 8, 'Imprimanta Dell S2342', 799, '\r\n    Potrivire perfecta. Designul compact specific imprimantei Dell S2342 asigura integrarea perfecta in spatii mici.\r\n    Nu e complicat. Imprimanta poate fi asezata oriunde doriti: reteaua Wi-Fi standard face posibil acest lucru.\r\n    Interfata cu utilizatorul intuitiva. Utilizati panoul frontal intuitiv pentru a indeplini cu usurinta activitatile de zi cu zi.\r\n', 'imprimantadells2342.jpg', 'imprimanta dell'),
(124, 3, 1, 'Imprimanta HP DesktopJet F1', 1299, '\r\n    Performante si capacitate mare de lucru. DesktopJet F1 face fata cu usurinta unui volum extins de lucrari.\r\n    Asteptare mai scurta. Viteza de imprimare de pana la 20 ppm va reduce timpul de asteptare. De acum inainte veti avea mai mult timp pentru clientii dumneavoastra.\r\n    Dimensiuni reduse. Productivitate maxima', 'imprimantahpdeskjetf1.jpg', 'imprimanta hp');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL,
  `exp_date` varchar(255) DEFAULT NULL,
  `reset_link_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`, `exp_date`, `reset_link_token`) VALUES
(27, 'Laurentiu', 'Stefan', 'stefanlaurentiu@gmail.com', '$2y$10$HtTy.C/3JTpi5SIYKOxcneyG5eo7VwpzbqVgPe5KPT4ZUIcw8cG4.', '0721510023', 'Prahova, Ploiesti, Bulevardul Castanelor', '123499', NULL, NULL),
(28, 'Tataru', 'Laura', 'tataru_laurici@outlook.com', '$2y$10$RjInzquEYVgixPQ3uxINCetUrNz.TtwI1keC8htN5LNeKbdNG0kj.', '0721510023', 'Jud. Bacau, Bulevardul Alunelor, nr. 13', '120870', NULL, NULL),
(29, 'Zaru', 'Alin', 'zaru_alin@yahoo.com', '$2y$10$czELGDUgcUmlfU4d2ETbw.4jhgupEhKY6h84nhB82Jx99kDd17.VW', '0721510031', 'Ju', '123878', NULL, NULL),
(31, 'Vladu', 'Maria', 'vladu_maria@yahoo.com', '$2y$10$KX5dn6oYGwOiSZI/rJX0NelDkmgdG5p3bO7gqkrtkUNKrmKWkqhcC', '0721512314', 'Vaslui', '123899', NULL, NULL),
(32, 'Angela', 'Roma', 'romaangela@yahoo.com', '$2y$10$CQyaLGtzU5Dkhia6l7mAbOvkQY1uXfuC9T9l5DE23/NB331PlP4Jy', '0721510024', 'Bucuresti', '109487', NULL, NULL),
(33, 'Ionela', 'Maghernita', 'maghernitaionela@yahoo.com', '$2y$10$6aSlT.rAgnJVluR1BwQP0O6/YQDofWIzd5hq0UsAwXElfH5D8P/LC', '0724000111', 'Bucuresti', '189703', NULL, NULL),
(34, 'Giulia', 'Csaba', 'csabagiulia@yahoo.com', '$2y$10$0jJTWsaA0SCWk.tPFIPdNeSaSXnxApiDQHTdZZWWEAV5Y.Lj/7zMa', '0724000111', 'Cluj', '129803', NULL, NULL),
(37, 'Tolocea', 'George', 'george_tolocea@mail.com', '$2y$10$eSjx47ibAt0/aAJki3C0UeoxwpfpxkrukeBmtkfwnPqDKE51TGHEm', '0734245508', 'Bucuresti', '123879', '', '');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(26, 'Laurentiu', 'Stefan', 'stefanlaurentiu@gmail.com', 'password_hash(qwertyuiop123, PASSWORD_BCRYPT)', '0721510023', 'Prahova', 'Ploiesti'),
(27, 'Laurentiu', 'Stefan', 'stefanlaurentiu@gmail.com', '$2y$10$HtTy.C/3JTpi5SIYKOxcneyG5eo7VwpzbqVgPe5KPT4ZUIcw8cG4.', '0721510023', 'Prahova', 'Ploiesti'),
(28, 'Tataru', 'Laura', 'tataru_laurici@outlook.com', '$2y$10$RjInzquEYVgixPQ3uxINCetUrNz.TtwI1keC8htN5LNeKbdNG0kj.', '0721510023', 'Jud. Bacau, Bulevardul Alunelor, nr. 13', '120870'),
(29, 'Zaru', 'Alin', 'zaru_alin@yahoo.com', '$2y$10$czELGDUgcUmlfU4d2ETbw.4jhgupEhKY6h84nhB82Jx99kDd17.VW', '0721510031', 'Ju', '123878'),
(30, 'Zaru', 'Alin', 'zaru_alin@yahoo.com', '$2y$10$VNk84pOb7rkCim0mu4sXieNUg/6E2eVjJv5NyWyZ4/kVJ6nnBGg1S', '0721510031', 'Ju', '123878'),
(31, 'Vladu', 'Maria', 'vladu_maria@yahoo.com', '$2y$10$KX5dn6oYGwOiSZI/rJX0NelDkmgdG5p3bO7gqkrtkUNKrmKWkqhcC', '0721512314', 'Vaslui', '123899'),
(32, 'Angela', 'Roma', 'romaangela@yahoo.com', '$2y$10$CQyaLGtzU5Dkhia6l7mAbOvkQY1uXfuC9T9l5DE23/NB331PlP4Jy', '0721510024', 'Bucuresti', '109487'),
(33, 'Ionela', 'Maghernita', 'maghernitaionela@yahoo.com', '$2y$10$IYg7T2U5eRKAnFx9zfdkoe8kbzpTnnzx6WHZe.a.RasoKVxARb0EW', '0724000111', 'Bucuresti', '189703'),
(34, 'Giulia', 'Csaba', 'csabagiulia@yahoo.com', '$2y$10$0jJTWsaA0SCWk.tPFIPdNeSaSXnxApiDQHTdZZWWEAV5Y.Lj/7zMa', '0724000111', 'Cluj', '129803'),
(35, 'bara', 'Ana', 'aaaaa@yahoo.com', '$2y$10$mX8kTdbrq9Qa.PpXazq9Pu.zP8LV6dqwvP7A2J9.4C.ptLhYCj4dq', '0721510023', 'afsfsfds', '188787'),
(36, 'Tolocea', 'George', 'george_tolocea@mail.com', '$2y$10$WVgvFyyd1cDATXGAu3cANOJ0sfJD5wyoktr6z2mItFO5yahQVgXwq', '0734245508', 'Bucuresti', '102343'),
(37, 'Tolocea', 'George', 'george_tolocea@mail.com', '$2y$10$dRi.tK2AAfS.KWnBcrwJ4eaVwJ05RRSgX.iYkMP5A9kKng1nwjP2W', '0734245508', 'Bucuresti', '123879');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ProductCart` (`p_id`),
  ADD KEY `FK_UserCart` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `FK_CategoryProduct` (`product_cat`),
  ADD KEY `FK_BrandProduct` (`product_brand`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_ProductCart` FOREIGN KEY (`p_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `FK_UserCart` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_BrandProduct` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `FK_CategoryProduct` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
