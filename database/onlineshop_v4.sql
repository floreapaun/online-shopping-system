-- MariaDB dump 10.17  Distrib 10.4.10-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	10.4.10-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_info`
--

DROP TABLE IF EXISTS `admin_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_info`
--

LOCK TABLES `admin_info` WRITE;
/*!40000 ALTER TABLE `admin_info` DISABLE KEYS */;
INSERT INTO `admin_info` VALUES (1,'admin','admin@romashop.com','$2y$10$HtTy.C/3JTpi5SIYKOxcneyG5eo7VwpzbqVgPe5KPT4ZUIcw8cG4.');
/*!40000 ALTER TABLE `admin_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL AUTO_INCREMENT,
  `brand_title` text NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'HP'),(2,'Samsung'),(3,'Apple'),(4,'Motorolla'),(5,'LG'),(6,' Gutti'),(7,'Nikon'),(8,'Dell'),(9,'Heiver'),(10,'Daismo');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ProductCart` (`p_id`),
  KEY `FK_UserCart` (`user_id`),
  CONSTRAINT `FK_ProductCart` FOREIGN KEY (`p_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FK_UserCart` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (11,45,'::1',15,1),(44,5,'::1',15,0),(46,2,'::1',15,0),(51,1,'::1',15,1),(52,5,'::1',15,1),(56,1,'::1',15,1),(57,2,'::1',15,1),(148,74,'127.0.0.1',15,1),(209,1,'127.0.0.1',27,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL AUTO_INCREMENT,
  `cat_title` text NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Telefoane - Tablete'),(2,'Laptop, IT'),(3,'TV, Audio - Video, Foto'),(4,'Casa - Gradina'),(5,'Electrocasnice mari'),(6,'Ingrijire personala');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_info`
--

DROP TABLE IF EXISTS `email_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_info`
--

LOCK TABLES `email_info` WRITE;
/*!40000 ALTER TABLE `email_info` DISABLE KEYS */;
INSERT INTO `email_info` VALUES (3,'admin@gmail.com'),(4,'puneethreddy951@gmail.com'),(5,'puneethreddy@gmail.com'),(6,'george_tolocea@mail.com'),(7,'joedoe@mail.com');
/*!40000 ALTER TABLE `email_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL COMMENT 'total price of all products with this id',
  PRIMARY KEY (`order_pro_id`),
  KEY `order_products` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` VALUES (100,4,90,1,159),(101,5,37,1,14500),(102,5,82,1,1500),(103,5,83,1,400),(104,6,91,1,79),(105,7,39,1,299),(106,8,37,1,14500),(107,9,89,1,299),(108,9,90,1,159),(109,9,37,1,14500),(110,9,74,1,5500),(111,9,75,1,5500),(113,11,39,3,897),(114,11,40,2,6000),(115,12,37,2,29000),(116,12,7,3,8997),(117,13,1,2,10000),(118,13,5,2,20000);
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_UserOrder` (`user_id`),
  KEY `FK_ProductOrder` (`product_id`),
  CONSTRAINT `FK_ProductOrder` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FK_UserOrder` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,12,7,1,'07M47684BS5725041','Completed'),(3,12,1,5,'07M47684BS5725041','Completed'),(4,12,2,4,'07M47684BS5725041','Completed'),(5,12,5,3,'07M47684BS5725041','Completed'),(6,12,45,2,'07M47684BS5725041','Completed'),(7,12,6,5,'07M47684BS5725041','Completed'),(8,12,7,4,'07M47684BS5725041','Completed'),(9,12,40,3,'07M47684BS5725041','Completed'),(11,12,37,5,'07M47684BS5725041','Completed'),(12,12,82,4,'07M47684BS5725041','Completed');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_info`
--

DROP TABLE IF EXISTS `orders_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `prod_count` int(15) DEFAULT NULL COMMENT 'number of product types',
  `total_amt` int(15) DEFAULT NULL COMMENT 'order total price',
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_info`
--

LOCK TABLES `orders_info` WRITE;
/*!40000 ALTER TABLE `orders_info` DISABLE KEYS */;
INSERT INTO `orders_info` VALUES (2,27,'Prahova',107314,8,27887),(4,27,'Prahova',107314,1,159),(5,27,'Prahova',107319,3,16400),(6,27,'Prahova',123456,1,79),(7,27,'Prahova',123877,1,299),(8,27,'Prahova',899711,1,14500),(9,27,'Prahova',102324,5,25958),(11,27,'Prahova, Ploiesti, Bulevardul Castanelor',123499,2,3299),(12,27,'Prahova, Ploiesti, Bulevardul Castanelor',123499,2,17499),(13,27,'Prahova, Ploiesti, Bulevardul Castanelor',123499,2,30000);
/*!40000 ALTER TABLE `orders_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK_CategoryProduct` (`product_cat`),
  KEY `FK_BrandProduct` (`product_brand`),
  CONSTRAINT `FK_BrandProduct` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  CONSTRAINT `FK_CategoryProduct` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,2,'Samsung Galaxy S7 Edge',5000,'Samsung galaxy s7 edge','product07.png','samsung mobile electronics'),(2,1,3,'Iphone 5S',1400,'iphone 5s','http___pluspng.com_img-png_iphone-hd-png-iphone-apple-png-file-550.png','mobile iphone apple telefon'),(5,1,3,'iPad 2',10000,'samsung ipad','iPad-air.png','ipad tablet samsung'),(6,2,1,'Samsung Laptop R Series',13000,'samsung Black combination Laptop','laptop_PNG5939.png','samsung laptop '),(7,2,1,'Laptop Pavillion',2999,'Laptop Hp Pavillion','laptop_PNG5930.png','Laptop Hp Pavillion'),(35,4,9,'Aspirator HellAspirer',499,'ilence Force 4A+ iti pune la indemana performante excelente si silentiozitate extrema pentru a obtine experiente de aspirare fara precedent.','aspirator01.jpg','aspirator'),(37,3,5,'LED TV LG WaveSensation',14500,'Cu cat rezolutia este mai mare, cu atat este mai mare detaliul imaginii. LG UHD TV are rezolutie de patru ori mai mare decat televizorul Full HD. Aceasta inseamna ca ai claritate de 4 ori.','tv_lg.jpg','led tv lg'),(38,5,2,'Cuptor cu microunde',3500,'Cuptor cu microunde GE83X, 23L, 800 W, Digital, Grill, Black Mirror Design elegant cu oglinda neagra\r\nDesignul elegant cu oglinda neagra va face o impresie deosebita in bucatarie si se va potrivi foarte bine cu interiorul casei dumneavoastra.','cuptormic01.jpg','cuptor, microunde'),(39,4,9,'Mixer Grinder',299,'De acum puteti sa amestecati aluatul, sa bateti albusul de ou si sa framantati compozitia amestecului mult mai simplu si usor. Un aparat nelipsit din in orice bucatarie, mixerul cu bol Heiver SMB-300W minimizeaza efortul de preparare al aluaturilor si al cremelor.','singer-mixer-grinder-mg-46-medium_4bfa018096c25dec7ba0af40662856ef.jpg','mixer, aluat'),(40,2,10,'Unitate Daismo SuperbGame',3000,'Acest Sistem PC este dedicat utilizarii zilnice, facand fata cu succes tuturor testelor. Este un sistem dedicat pentru gama sa de utilizare. \n\nExperianta oferita de acest Sistem PC este una pe masura, acesta reusind sa indeplineasca task-urile si celor mai exigenti utilizatori.','unitate_gaming.jpg','unitate, gaming, jocuri'),(45,1,2,'Samsung Galaxy Note 3',10000,'0','note3.jpg','samsung galaxy Note 3 neo'),(47,2,8,'Laptop Dell',650,'nbk','product01.png','Dell Laptop'),(71,1,2,'Samsung galaxy s7',5000,'Samsung galaxy s7','product07.png','samsung mobile electronics'),(74,2,1,'HP i5 Laptop',5500,'HP i5 laptop','product01.png','HP i5 laptop electronics'),(75,2,1,'HP i7 Laptop 8gb ram',5500,'HP i7 laptop 8gb ram','product03.png','HP i7 laptop 8gb ram electronics'),(76,1,5,'Sony Note 6GB RAM',4500,'sony note 6gb ram','product04.png','sony note 6gb ram mobile electronics'),(78,2,2,'Samsung laptop 8gb RAM Intel Integerated Graphics',4579,'dell laptop 8gb ram intel integerated Graphics','product08.png','dell laptop 8gb ram intel integerated Graphics electronics'),(82,3,7,'Aparat foto Nikon D3500',1500,'Aparat foto DSLR Nikon D3500, 24.2MP, Negru + Obiectiv AF-P 18-55mm VR PUNETI IN UMBRA IMAGINILE BANALE De la momentele importante la cele din fiecare zi, traiti bucuria fotografierii adevarate. Compactul aparat foto D3500 imbina calitatea premium a constructiei cu performantele remarcabile. Operarea fara efort simplifica spectaculos fotografierea si partajarea momentelor memorabile.','nikon3500.jpg','nikon, foto 3500'),(83,3,2,'Boxa portabila KARAOKE 1001',400,'Aduceti petrecerea acasa cu acest sistem audio de mare putere, compact, cu o singura incinta. Bucurati-va de sunetul puternic al unui design complet, care economiseste spatiu, si intensificati frecventele joase cu ajutorul Mega Bass. Puteti experimenta cu efectele de DJ, va puteti invita prietenii acasa pentru karaoke si puteti sa concurati. ','portabila.jpg','audio, boxa, portabila'),(84,4,2,'Masina tuns gazonul GardenSuper A400',1200,'Masina de tuns gazonul dispune de trei functii: evacuare in cosul colector, evacuare in spate (atunci cand cosul nu este prezent), si mulcire. Operatiunea de mulcire presupune blocarea caii de evacuare a ierbii cu plasticul inclus in setul de livrare.','tunsgazonul.jpg','tuns gazonul, iarba'),(85,4,9,'Aparat de vopsit si zugravit HeinerKlass',2000,'Aparat de vopsit si zugravit, 200 W, 800/1300 ml, 15 mp/6 min, debit vopsea 500 ml/min; Tehnologia Flexio: Acoperire completa cu vopsea dintr-o singura trecere cu toate vopselele standard nediluate;\r\n','aparatvopsit.jpg','zugravit, vopsit, gradina'),(86,4,9,'Scara aluminiu',899,'Scara universala din aluminiu cu 3 tronsoane pentru diverse activitati casnice.\r\nTerminatie din material antiderapant pentru o buna stabilitate.','scara.jpg','scara, gradina, aluminiu'),(87,5,9,'Frigider cu doua usi AD631 ',2399,'Garanteaza o economie substantiala de energie, comparativ cu produsele din clasa A+ si A. Economisesti vizibil cu fiecare factura! TERMOSTAT AJUSTABIL.\r\n','frigider01.jpg','frigider, 2 usi, heiver'),(88,5,2,'Masina de spalat rufe Add-Wash',3999,'Mai ingusta la exterior, capacitate mai mare in interior.\r\nIn pofida designului sau ingust, capacitatea mare, de 7 kg, va permite sa spalati rapid o multime de rufe dintr-o singura incarcare – pana la 12 prosoape de baie.','spalat01.jpg','spalat, masina'),(89,6,10,'Uscator de par D5210',299,'Uscatorul de par are 3 trepte de temperatura si 2 trepte de viteza, cat si un jet de aer rece pentru fixarea coafurii perfecte.','uscator01.jpg','uscator, par'),(90,6,10,'Aparat de tuns HC5035 ColourCut',159,'Cu ajutorul Aparatului de Tuns ColourCut de la Remington tunsul devine mai usor si mai distractiv. Pe langa faptul ca este un aparat de tuns de inalta calitate, acesta vine impreuna cu noua piepteni colorati cu dimensiuni intre 0.5 - 2mm.','tuns01.jpg','aparat, tuns, par'),(91,6,2,'Placa de indreptat parul PRO-Ceramic',79,'Conceputa special pentru parul lung si des, aceasta placa de indreptat parul are niste placi mai lungi si extra-late care iti vor tine parul sub control in doar cateva minute.','indreptat01.jpg','placa indreptat, par'),(92,2,9,'HDD Extern BigSeaGate',189,'HDD-ul portabil BigSeaGate se instaleaza usor prin introducerea unei singure mufe USB in computerul dvs. Puteti sa il folositi in cateva secunde de la despachetare.','hdd_seagate.jpg','hdd, extern'),(93,3,2,'Televizor Samsung GF3200',1500,'Culori bogate si luminoase asteapta. Wide Color Enhancer imbunatateste calitatea imaginii si dezvaluie detalii ale culorilor, asa cum au fost menite sa fie vazute.','televizor_samsung.jpg','televizor, 80cm'),(94,3,6,'Subwoofer Gutti BassBoy ',680,'Cu o putere maxima de 1000W , acest subwoofer tub de tip bass reflex  \"ready-to-use\"  este exact ceea ce trebuie pentru fanii de bass. Un grilaj de protectie asigura ca nimic din ce se afla in portbagaj nu va lovi difuzorul de bass.','subwoofer_auto.jpg','bass, subwoofer, auto'),(109,4,6,'Drujba electrica Procraft 745',2399,'Drujba electrica Procraft 745 este un utilaj semi-profesional si de uz casnic. Desi acest model are o putere de motor de mare, are in acelasi timp o greutate mica si este compacta, ceea ce va va ajuta sa lucrati chiar si cu o mana, fiind foarte convenabil atunci cand taiati la inaltime.','drujbaelectrica.jpg','drujba, casa, gradina, unelte'),(112,5,2,'Combina frigorifica Samsung PolarBreeze 911',2999,'Dispune de mai mult spatiu interior decat o combina frigorifica obisnuita, dar are aceleasi dimensiuni exterioare.* Tehnologia sa SpaceMax Technology™ consta intr-un perete cu design suplu, oferind capacitate interna suplimentara, fara a compromite eficienta energetica. ','combinasamsung.jpg','samsung, frigider, aparat');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (12,'puneeth','Reddyy','puneethreddy951@gmail.com','puneeth','9448121558','123456789','sdcjns,djc'),(15,'Traista','Vasile','punmartoo@gmail.com','346778','536487276','Jud. Teleorman, sat Calimanesti, nr. 13','872883'),(23,'hemanth','reddy','hemanth@gmail.com','Puneeth@123','9876543234','Bangalore','Kumbalagodu'),(24,'newuser','user','newuser@gmail.com','puneeth@123','9535688928','Bangalore','Kumbalagodu'),(25,'otheruser','user','otheruser@gmail.com','puneeth@123','9535688928','Bangalore','Kumbalagodu'),(27,'Laurentiu','Stefan','stefanlaurentiu@gmail.com','$2y$10$HtTy.C/3JTpi5SIYKOxcneyG5eo7VwpzbqVgPe5KPT4ZUIcw8cG4.','0721510023','Prahova, Ploiesti, Bulevardul Castanelor','123499'),(28,'Tataru','Laura','tataru_laurici@outlook.com','$2y$10$RjInzquEYVgixPQ3uxINCetUrNz.TtwI1keC8htN5LNeKbdNG0kj.','0721510023','Jud. Bacau, Bulevardul Alunelor, nr. 13','120870'),(29,'Zaru','Alin','zaru_alin@yahoo.com','$2y$10$czELGDUgcUmlfU4d2ETbw.4jhgupEhKY6h84nhB82Jx99kDd17.VW','0721510031','Ju','123878'),(31,'Vladu','Maria','vladu_maria@yahoo.com','$2y$10$KX5dn6oYGwOiSZI/rJX0NelDkmgdG5p3bO7gqkrtkUNKrmKWkqhcC','0721512314','Vaslui','123899');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_info_backup`
--

DROP TABLE IF EXISTS `user_info_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info_backup`
--

LOCK TABLES `user_info_backup` WRITE;
/*!40000 ALTER TABLE `user_info_backup` DISABLE KEYS */;
INSERT INTO `user_info_backup` VALUES (12,'puneeth','Reddy','puneethreddy951@gmail.com','123456789','9448121558','123456789','sdcjns,djc'),(14,'hemanthu','reddy','hemanthreddy951@gmail.com','123456788','6526436723','s,dc wfjvnvn','b efhfhvvbr'),(15,'hemu','ajhgdg','keeru@gmail.com','346778','536487276',',mdnbca','asdmhmhvbv'),(16,'venky','vs','venkey@gmail.com','1234534','9877654334','snhdgvajfehyfygv','asdjbhfkeur'),(19,'abhishek','bs','abhishekbs@gmail.com','asdcsdcc','9871236534','bangalore','hassan'),(20,'pramod','vh','pramod@gmail.com','124335353','9767645653','ksbdfcdf','sjrgrevgsib'),(21,'prajval','mcta','prajvalmcta@gmail.com','1234545662','202-555-01','bangalore','kumbalagodu'),(22,'puneeth','v','hemu@gmail.com','1234534','9877654334','snhdgvajfehyfygv','asdjbhfkeur'),(23,'hemanth','reddy','hemanth@gmail.com','Puneeth@123','9876543234','Bangalore','Kumbalagodu'),(24,'newuser','user','newuser@gmail.com','puneeth@123','9535688928','Bangalore','Kumbalagodu'),(25,'otheruser','user','otheruser@gmail.com','puneeth@123','9535688928','Bangalore','Kumbalagodu'),(26,'Laurentiu','Stefan','stefanlaurentiu@gmail.com','password_hash(qwertyuiop123, PASSWORD_BCRYPT)','0721510023','Prahova','Ploiesti'),(27,'Laurentiu','Stefan','stefanlaurentiu@gmail.com','$2y$10$HtTy.C/3JTpi5SIYKOxcneyG5eo7VwpzbqVgPe5KPT4ZUIcw8cG4.','0721510023','Prahova','Ploiesti'),(28,'Tataru','Laura','tataru_laurici@outlook.com','$2y$10$RjInzquEYVgixPQ3uxINCetUrNz.TtwI1keC8htN5LNeKbdNG0kj.','0721510023','Jud. Bacau, Bulevardul Alunelor, nr. 13','120870'),(29,'Zaru','Alin','zaru_alin@yahoo.com','$2y$10$czELGDUgcUmlfU4d2ETbw.4jhgupEhKY6h84nhB82Jx99kDd17.VW','0721510031','Ju','123878'),(30,'Zaru','Alin','zaru_alin@yahoo.com','$2y$10$VNk84pOb7rkCim0mu4sXieNUg/6E2eVjJv5NyWyZ4/kVJ6nnBGg1S','0721510031','Ju','123878'),(31,'Vladu','Maria','vladu_maria@yahoo.com','$2y$10$KX5dn6oYGwOiSZI/rJX0NelDkmgdG5p3bO7gqkrtkUNKrmKWkqhcC','0721512314','Vaslui','123899');
/*!40000 ALTER TABLE `user_info_backup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-21 21:34:11
