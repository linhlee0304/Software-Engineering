-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: flight
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chuyenbay`
--

DROP TABLE IF EXISTS `chuyenbay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chuyenbay` (
  `ma_cb` int NOT NULL AUTO_INCREMENT,
  `ngay_khoi_hanh` date NOT NULL,
  `gio_khoi_hanh` time NOT NULL,
  `thoi_gian_bay` time NOT NULL,
  `ma_noi_di` int NOT NULL,
  `ma_noi_den` int NOT NULL,
  `so_hieu_mb` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `san_bay_trung_gian` int DEFAULT NULL,
  `thoi_gian_dung` time DEFAULT NULL,
  PRIMARY KEY (`ma_cb`),
  KEY `ma_noi_di` (`ma_noi_di`),
  KEY `ma_noi_den` (`ma_noi_den`),
  KEY `so_hieu_mb` (`so_hieu_mb`),
  KEY `san_bay_trung_gian` (`san_bay_trung_gian`),
  CONSTRAINT `chuyenbay_ibfk_1` FOREIGN KEY (`ma_noi_di`) REFERENCES `sanbay` (`ma_sb`),
  CONSTRAINT `chuyenbay_ibfk_2` FOREIGN KEY (`ma_noi_den`) REFERENCES `sanbay` (`ma_sb`),
  CONSTRAINT `chuyenbay_ibfk_3` FOREIGN KEY (`so_hieu_mb`) REFERENCES `maybay` (`so_hieu`),
  CONSTRAINT `chuyenbay_ibfk_4` FOREIGN KEY (`san_bay_trung_gian`) REFERENCES `sanbay` (`ma_sb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuyenbay`
--

LOCK TABLES `chuyenbay` WRITE;
/*!40000 ALTER TABLE `chuyenbay` DISABLE KEYS */;
/*!40000 ALTER TABLE `chuyenbay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghe`
--

DROP TABLE IF EXISTS `ghe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghe` (
  `ma_ghe` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trang_thai` tinyint(1) DEFAULT NULL,
  `hang_ghe` int NOT NULL,
  `may_bay` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ma_ghe`),
  KEY `may_bay` (`may_bay`),
  CONSTRAINT `ghe_ibfk_1` FOREIGN KEY (`may_bay`) REFERENCES `maybay` (`so_hieu`),
  CONSTRAINT `ghe_chk_1` CHECK ((`trang_thai` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghe`
--

LOCK TABLES `ghe` WRITE;
/*!40000 ALTER TABLE `ghe` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `ma_kh` int NOT NULL AUTO_INCREMENT,
  `ten_kh` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sdt` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cmnd` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ma_kh`),
  CONSTRAINT `khachhang_chk_1` CHECK ((`active` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maybay`
--

DROP TABLE IF EXISTS `maybay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maybay` (
  `so_hieu` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hang_bay` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `so_ghe_hang_1` int NOT NULL,
  `so_ghe_hang_2` int NOT NULL,
  `tong_ghe` int NOT NULL,
  PRIMARY KEY (`so_hieu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maybay`
--

LOCK TABLES `maybay` WRITE;
/*!40000 ALTER TABLE `maybay` DISABLE KEYS */;
INSERT INTO `maybay` VALUES ('BB201','BamBoo',36,165,201),('JS404','Jetstar',44,360,404),('VA304','VietNamAirlines',34,270,304),('VJ202','VietJet',22,180,202);
/*!40000 ALTER TABLE `maybay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `ma_nv` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sdt` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dia_chi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngay_dk` date DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `ma_user` int NOT NULL,
  PRIMARY KEY (`ma_nv`),
  KEY `ma_user` (`ma_user`),
  CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`ma_user`) REFERENCES `user` (`id`),
  CONSTRAINT `nhanvien_chk_1` CHECK ((`active` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieudatcho`
--

DROP TABLE IF EXISTS `phieudatcho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieudatcho` (
  `ma_phieu` int NOT NULL AUTO_INCREMENT,
  `ma_ve` int NOT NULL,
  `ma_kh` int DEFAULT NULL,
  `ngay_dat_phieu` date DEFAULT NULL,
  PRIMARY KEY (`ma_phieu`),
  KEY `ma_ve` (`ma_ve`),
  KEY `ma_kh` (`ma_kh`),
  CONSTRAINT `phieudatcho_ibfk_1` FOREIGN KEY (`ma_ve`) REFERENCES `vemaybay` (`ma_ve`),
  CONSTRAINT `phieudatcho_ibfk_2` FOREIGN KEY (`ma_kh`) REFERENCES `khachhang` (`ma_kh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieudatcho`
--

LOCK TABLES `phieudatcho` WRITE;
/*!40000 ALTER TABLE `phieudatcho` DISABLE KEYS */;
/*!40000 ALTER TABLE `phieudatcho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanbay`
--

DROP TABLE IF EXISTS `sanbay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanbay` (
  `ma_sb` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quoc_gia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trang_thai` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ma_sb`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanbay`
--

LOCK TABLES `sanbay` WRITE;
/*!40000 ALTER TABLE `sanbay` DISABLE KEYS */;
INSERT INTO `sanbay` VALUES (1,'Nội Bài','VietNam','Trống'),(2,'Phnom Penh','Cambodia','Trống'),(3,'Beijing','China','Trống'),(4,'HongKong','HongKong','Trống'),(5,'India','India','Trống'),(6,'Japan','Japan','Trống'),(7,'Myanmar','Myanmar','Trống'),(8,'Thailand','Thailand','Trống'),(9,'Singapore','Singapore','Trống');
/*!40000 ALTER TABLE `sanbay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ten_tk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mat_khau` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `user_role` enum('ADMIN','EMP') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_chk_1` CHECK ((`active` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'my','mykhung','123',1,'ADMIN');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vemaybay`
--

DROP TABLE IF EXISTS `vemaybay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vemaybay` (
  `ma_ve` int NOT NULL AUTO_INCREMENT,
  `hang_ve` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gia_ve` float DEFAULT NULL,
  `ngay_xuat_ve` date DEFAULT NULL,
  `ma_nv` int NOT NULL,
  `ma_kh` int NOT NULL,
  `ma_cb` int NOT NULL,
  PRIMARY KEY (`ma_ve`),
  KEY `ma_nv` (`ma_nv`),
  KEY `ma_kh` (`ma_kh`),
  KEY `ma_cb` (`ma_cb`),
  CONSTRAINT `vemaybay_ibfk_1` FOREIGN KEY (`ma_nv`) REFERENCES `nhanvien` (`ma_nv`),
  CONSTRAINT `vemaybay_ibfk_2` FOREIGN KEY (`ma_kh`) REFERENCES `khachhang` (`ma_kh`),
  CONSTRAINT `vemaybay_ibfk_3` FOREIGN KEY (`ma_cb`) REFERENCES `chuyenbay` (`ma_cb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vemaybay`
--

LOCK TABLES `vemaybay` WRITE;
/*!40000 ALTER TABLE `vemaybay` DISABLE KEYS */;
/*!40000 ALTER TABLE `vemaybay` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-15 20:17:55
