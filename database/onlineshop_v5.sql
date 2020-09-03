-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 03, 2020 at 01:17 PM
-- Server version: 10.5.5-MariaDB
-- PHP Version: 7.4.9

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@romashop.com', '$2y$10$HtTy.C/3JTpi5SIYKOxcneyG5eo7VwpzbqVgPe5KPT4ZUIcw8cG4.');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(224, 88, '127.0.0.1', 27, 1),
(226, 38, '127.0.0.1', 33, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Telefoane - Tablete'),
(2, 'Laptop, IT'),
(3, 'TV, Audio - Video, Foto'),
(4, 'Casa - Gradina'),
(5, 'Electrocasnice mari'),
(6, 'Ingrijire personala');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'puneethreddy951@gmail.com'),
(5, 'puneethreddy@gmail.com'),
(6, 'george_tolocea@mail.com'),
(7, 'joedoe@mail.com'),
(8, 'romaangela@yahoo.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(16, 35, 'afsfsfds', 188787, 1, 499);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(100, 4, 90, 1, 159),
(104, 6, 91, 1, 79),
(105, 7, 39, 1, 299),
(106, 8, 37, 1, 14500),
(107, 9, 89, 1, 299),
(108, 9, 90, 1, 159),
(109, 9, 37, 1, 14500),
(110, 9, 74, 1, 5500),
(111, 9, 75, 1, 5500),
(113, 11, 39, 3, 897),
(114, 11, 40, 2, 6000),
(115, 12, 37, 2, 29000),
(116, 12, 7, 3, 8997),
(117, 13, 1, 2, 10000),
(118, 13, 5, 2, 20000),
(119, 14, 1, 2, 10000),
(120, 14, 5, 1, 10000),
(121, 14, 45, 3, 30000),
(122, 14, 71, 1, 5000),
(123, 14, 76, 1, 4500),
(124, 14, 47, 1, 650),
(125, 14, 74, 11, 60500),
(126, 14, 75, 1, 5500),
(127, 14, 78, 1, 4579),
(128, 14, 92, 1, 189),
(129, 14, 82, 6, 9000),
(130, 14, 83, 1, 400),
(131, 14, 93, 1, 1500),
(132, 14, 94, 3, 2040),
(133, 15, 37, 1, 14500),
(134, 16, 35, 1, 499);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Samsung Galaxy S7 Edge', 5000, 'Samsung galaxy s7 edge', 'product07.png', 'samsung mobile electronics'),
(2, 1, 3, 'Iphone 5S', 1400, 'iphone 5s', 'http___pluspng.com_img-png_iphone-hd-png-iphone-apple-png-file-550.png', 'mobile iphone apple telefon'),
(5, 1, 3, 'iPad 2', 10000, 'samsung ipad', 'iPad-air.png', 'ipad tablet samsung'),
(6, 2, 1, 'Samsung Laptop R Series', 13000, 'samsung Black combination Laptop', 'laptop_PNG5939.png', 'samsung laptop '),
(7, 2, 1, 'Laptop Pavillion', 2999, 'Laptop Hp Pavillion', 'laptop_PNG5930.png', 'Laptop Hp Pavillion'),
(35, 4, 9, 'Aspirator HellAspirer', 499, 'ilence Force 4A+ iti pune la indemana performante excelente si silentiozitate extrema pentru a obtine experiente de aspirare fara precedent.', 'aspirator01.jpg', 'aspirator'),
(37, 3, 5, 'LED TV LG WaveSensation', 14500, 'Cu cat rezolutia este mai mare, cu atat este mai mare detaliul imaginii. LG UHD TV are rezolutie de patru ori mai mare decat televizorul Full HD. Aceasta inseamna ca ai claritate de 4 ori.', 'tv_lg.jpg', 'led tv lg'),
(38, 5, 2, 'Cuptor cu microunde', 3500, 'Cuptor cu microunde GE83X, 23L, 800 W, Digital, Grill, Black Mirror Design elegant cu oglinda neagra\r\nDesignul elegant cu oglinda neagra va face o impresie deosebita in bucatarie si se va potrivi foarte bine cu interiorul casei dumneavoastra.', 'cuptormic01.jpg', 'cuptor, microunde'),
(39, 4, 9, 'Mixer Grinder', 299, 'De acum puteti sa amestecati aluatul, sa bateti albusul de ou si sa framantati compozitia amestecului mult mai simplu si usor. Un aparat nelipsit din in orice bucatarie, mixerul cu bol Heiver SMB-300W minimizeaza efortul de preparare al aluaturilor si al cremelor.', 'singer-mixer-grinder-mg-46-medium_4bfa018096c25dec7ba0af40662856ef.jpg', 'mixer, aluat'),
(40, 2, 10, 'Unitate Daismo SuperbGame', 3000, 'Acest Sistem PC este dedicat utilizarii zilnice, facand fata cu succes tuturor testelor. Este un sistem dedicat pentru gama sa de utilizare. \n\nExperianta oferita de acest Sistem PC este una pe masura, acesta reusind sa indeplineasca task-urile si celor mai exigenti utilizatori.', 'unitate_gaming.jpg', 'unitate, gaming, jocuri'),
(45, 1, 2, 'Samsung Galaxy Note 3', 10000, '0', 'note3.jpg', 'samsung galaxy Note 3 neo'),
(47, 2, 8, 'Laptop Dell', 650, 'nbk', 'product01.png', 'Dell Laptop'),
(71, 1, 2, 'Samsung galaxy s7', 5000, 'Samsung galaxy s7', 'product07.png', 'samsung mobile electronics'),
(74, 2, 1, 'HP i5 Laptop', 5500, 'HP i5 laptop', 'product01.png', 'HP i5 laptop electronics'),
(75, 2, 1, 'HP i7 Laptop 8gb ram', 5500, 'HP i7 laptop 8gb ram', 'product03.png', 'HP i7 laptop 8gb ram electronics'),
(76, 1, 5, 'Sony Note 6GB RAM', 4500, 'sony note 6gb ram', 'product04.png', 'sony note 6gb ram mobile electronics'),
(78, 2, 2, 'Samsung laptop 8gb RAM Intel Integerated Graphics', 4579, 'dell laptop 8gb ram intel integerated Graphics', 'product08.png', 'dell laptop 8gb ram intel integerated Graphics electronics'),
(82, 3, 7, 'Aparat foto Nikon D3500', 1500, 'Aparat foto DSLR Nikon D3500, 24.2MP, Negru + Obiectiv AF-P 18-55mm VR PUNETI IN UMBRA IMAGINILE BANALE De la momentele importante la cele din fiecare zi, traiti bucuria fotografierii adevarate. Compactul aparat foto D3500 imbina calitatea premium a constructiei cu performantele remarcabile. Operarea fara efort simplifica spectaculos fotografierea si partajarea momentelor memorabile.', 'nikon3500.jpg', 'nikon, foto 3500'),
(83, 3, 2, 'Boxa portabila KARAOKE 1001', 400, 'Aduceti petrecerea acasa cu acest sistem audio de mare putere, compact, cu o singura incinta. Bucurati-va de sunetul puternic al unui design complet, care economiseste spatiu, si intensificati frecventele joase cu ajutorul Mega Bass. Puteti experimenta cu efectele de DJ, va puteti invita prietenii acasa pentru karaoke si puteti sa concurati. ', 'portabila.jpg', 'audio, boxa, portabila'),
(84, 4, 2, 'Masina tuns gazonul GardenSuper A400', 1200, 'Masina de tuns gazonul dispune de trei functii: evacuare in cosul colector, evacuare in spate (atunci cand cosul nu este prezent), si mulcire. Operatiunea de mulcire presupune blocarea caii de evacuare a ierbii cu plasticul inclus in setul de livrare.', 'tunsgazonul.jpg', 'tuns gazonul, iarba'),
(85, 4, 9, 'Aparat de vopsit si zugravit HeinerKlass', 2000, 'Aparat de vopsit si zugravit, 200 W, 800/1300 ml, 15 mp/6 min, debit vopsea 500 ml/min; Tehnologia Flexio: Acoperire completa cu vopsea dintr-o singura trecere cu toate vopselele standard nediluate;\r\n', 'aparatvopsit.jpg', 'zugravit, vopsit, gradina'),
(86, 4, 9, 'Scara aluminiu', 899, 'Scara universala din aluminiu cu 3 tronsoane pentru diverse activitati casnice.\r\nTerminatie din material antiderapant pentru o buna stabilitate.', 'scara.jpg', 'scara, gradina, aluminiu'),
(87, 5, 9, 'Frigider cu doua usi AD631 ', 2399, 'Garanteaza o economie substantiala de energie, comparativ cu produsele din clasa A+ si A. Economisesti vizibil cu fiecare factura! TERMOSTAT AJUSTABIL.\r\n', 'frigider01.jpg', 'frigider, 2 usi, heiver'),
(88, 5, 2, 'Masina de spalat rufe Add-Wash', 3999, 'Mai ingusta la exterior, capacitate mai mare in interior.\r\nIn pofida designului sau ingust, capacitatea mare, de 7 kg, va permite sa spalati rapid o multime de rufe dintr-o singura incarcare – pana la 12 prosoape de baie.', 'spalat01.jpg', 'spalat, masina'),
(89, 6, 10, 'Uscator de par D5210', 299, 'Uscatorul de par are 3 trepte de temperatura si 2 trepte de viteza, cat si un jet de aer rece pentru fixarea coafurii perfecte.', 'uscator01.jpg', 'uscator, par'),
(90, 6, 10, 'Aparat de tuns HC5035 ColourCut', 159, 'Cu ajutorul Aparatului de Tuns ColourCut de la Remington tunsul devine mai usor si mai distractiv. Pe langa faptul ca este un aparat de tuns de inalta calitate, acesta vine impreuna cu noua piepteni colorati cu dimensiuni intre 0.5 - 2mm.', 'tuns01.jpg', 'aparat, tuns, par'),
(91, 6, 2, 'Placa de indreptat parul PRO-Ceramic', 79, 'Conceputa special pentru parul lung si des, aceasta placa de indreptat parul are niste placi mai lungi si extra-late care iti vor tine parul sub control in doar cateva minute.', 'indreptat01.jpg', 'placa indreptat, par'),
(92, 2, 9, 'HDD Extern BigSeaGate', 189, 'HDD-ul portabil BigSeaGate se instaleaza usor prin introducerea unei singure mufe USB in computerul dvs. Puteti sa il folositi in cateva secunde de la despachetare.', 'hdd_seagate.jpg', 'hdd, extern'),
(93, 3, 2, 'Televizor Samsung GF3200', 1500, 'Culori bogate si luminoase asteapta. Wide Color Enhancer imbunatateste calitatea imaginii si dezvaluie detalii ale culorilor, asa cum au fost menite sa fie vazute.', 'televizor_samsung.jpg', 'televizor, 80cm'),
(94, 3, 6, 'Subwoofer Gutti BassBoy ', 680, 'Cu o putere maxima de 1000W , acest subwoofer tub de tip bass reflex  \"ready-to-use\"  este exact ceea ce trebuie pentru fanii de bass. Un grilaj de protectie asigura ca nimic din ce se afla in portbagaj nu va lovi difuzorul de bass.', 'subwoofer_auto.jpg', 'bass, subwoofer, auto'),
(109, 4, 6, 'Drujba electrica Procraft 745', 2399, 'Drujba electrica Procraft 745 este un utilaj semi-profesional si de uz casnic. Desi acest model are o putere de motor de mare, are in acelasi timp o greutate mica si este compacta, ceea ce va va ajuta sa lucrati chiar si cu o mana, fiind foarte convenabil atunci cand taiati la inaltime.', 'drujbaelectrica.jpg', 'drujba, casa, gradina, unelte'),
(112, 5, 2, 'Combina frigorifica Samsung PolarBreeze 911', 2999, 'Dispune de mai mult spatiu interior decat o combina frigorifica obisnuita, dar are aceleasi dimensiuni exterioare.* Tehnologia sa SpaceMax Technology™ consta intr-un perete cu design suplu, oferind capacitate interna suplimentara, fara a compromite eficienta energetica. ', 'combinasamsung.jpg', 'samsung, frigider, aparat');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(15, 'Traista', 'Vasile', 'punmartoo@gmail.com', '346778', '536487276', 'Jud. Teleorman, sat Calimanesti, nr. 13', '872883'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(27, 'Laurentiu', 'Stefan', 'stefanlaurentiu@gmail.com', '$2y$10$HtTy.C/3JTpi5SIYKOxcneyG5eo7VwpzbqVgPe5KPT4ZUIcw8cG4.', '0721510023', 'Prahova, Ploiesti, Bulevardul Castanelor', '123499'),
(28, 'Tataru', 'Laura', 'tataru_laurici@outlook.com', '$2y$10$RjInzquEYVgixPQ3uxINCetUrNz.TtwI1keC8htN5LNeKbdNG0kj.', '0721510023', 'Jud. Bacau, Bulevardul Alunelor, nr. 13', '120870'),
(29, 'Zaru', 'Alin', 'zaru_alin@yahoo.com', '$2y$10$czELGDUgcUmlfU4d2ETbw.4jhgupEhKY6h84nhB82Jx99kDd17.VW', '0721510031', 'Ju', '123878'),
(31, 'Vladu', 'Maria', 'vladu_maria@yahoo.com', '$2y$10$KX5dn6oYGwOiSZI/rJX0NelDkmgdG5p3bO7gqkrtkUNKrmKWkqhcC', '0721512314', 'Vaslui', '123899'),
(32, 'Angela', 'Roma', 'romaangela@yahoo.com', '$2y$10$CQyaLGtzU5Dkhia6l7mAbOvkQY1uXfuC9T9l5DE23/NB331PlP4Jy', '0721510024', 'Bucuresti', '109487'),
(33, 'Ionela', 'Maghernita', 'maghernitaionela@yahoo.com', '$2y$12$poB/CRcM3GelW.5/GLdvV.bRgNXT3llAWKzoQoNNznAHpfaW.Ixhq', '0724000111', 'Bucuresti', '189703'),
(34, 'Giulia', 'Csaba', 'csabagiulia@yahoo.com', '$2y$10$0jJTWsaA0SCWk.tPFIPdNeSaSXnxApiDQHTdZZWWEAV5Y.Lj/7zMa', '0724000111', 'Cluj', '129803'),
(35, 'bara', 'Ana', 'aaaaa@yahoo.com', '$2y$10$mX8kTdbrq9Qa.PpXazq9Pu.zP8LV6dqwvP7A2J9.4C.ptLhYCj4dq', '0721510023', 'afsfsfds', '188787');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(35, 'bara', 'Ana', 'aaaaa@yahoo.com', '$2y$10$mX8kTdbrq9Qa.PpXazq9Pu.zP8LV6dqwvP7A2J9.4C.ptLhYCj4dq', '0721510023', 'afsfsfds', '188787');

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
