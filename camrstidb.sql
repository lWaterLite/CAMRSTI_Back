-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: camrstidb
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `basicinfo`
--

DROP TABLE IF EXISTS `basicinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basicinfo` (
  `sampleId` varchar(20) NOT NULL DEFAULT 'undefined' COMMENT '样品号',
  `sampleType` varchar(10) DEFAULT NULL COMMENT '样品类型',
  `sampleSource` varchar(30) DEFAULT NULL COMMENT '样品来源',
  `samplingYear` year DEFAULT NULL COMMENT '取样年份',
  `samplingPeople` varchar(6) DEFAULT NULL COMMENT '取样人',
  `imageId` json DEFAULT NULL COMMENT '图片文件名',
  `sampleDescribe` text COMMENT '描述',
  `sampleExplain` text COMMENT '样品制备说明',
  `experimentId` json DEFAULT NULL COMMENT '实验编号',
  PRIMARY KEY (`sampleId`),
  UNIQUE KEY `basicinfo_sampleId_uindex` (`sampleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='基本信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basicinfo`
--

LOCK TABLES `basicinfo` WRITE;
/*!40000 ALTER TABLE `basicinfo` DISABLE KEYS */;
INSERT INTO `basicinfo` VALUES ('11Y1:9','炉壁','北京延庆水泉沟',2019,'刘海峰','[\"IMG_20190512_33333.jpg\"]','取自炉体上半部分，红色，质地疏松多空','自内向外取三处，分别做薄片后矿相观察，制备粉末样品开展XRD分析','[\"11Y1:9-1\", \"11Y1:9-2\", \"11Y1:9-3\"]');
/*!40000 ALTER TABLE `basicinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `basicinfo_insert_metalphase_trigger` AFTER INSERT ON `basicinfo` FOR EACH ROW begin
        insert into metalphase(sampleId, sfImgList) value (NEW.sampleId, '[]');
    end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `basicinfo_insert_minephase_trigger` AFTER INSERT ON `basicinfo` FOR EACH ROW begin
        insert into minephase(sampleId, mpImgList) value (NEW.sampleId, '[]');
    end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `basicinfo_insert_emphase_trigger` AFTER INSERT ON `basicinfo` FOR EACH ROW begin
        insert into electron_micro(sampleId, emImgList) value (NEW.sampleId, '[]');
    end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `basicinfo_insert_physical_trigger` AFTER INSERT ON `basicinfo` FOR EACH ROW begin
        insert into physical_property(sampleId) value (NEW.sampleId);
    end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `basicinfo_delete_experiment_trigger` BEFORE DELETE ON `basicinfo` FOR EACH ROW begin
    delete from experiment_data where experiment_data.sampleId = OLD.sampleId;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `electron_micro`
--

DROP TABLE IF EXISTS `electron_micro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electron_micro` (
  `sampleId` varchar(20) NOT NULL COMMENT '样品编号',
  `emPhase` varchar(2) DEFAULT '无' COMMENT '无',
  `emFullImg` varchar(20) DEFAULT '无' COMMENT '样品全图',
  `emDescription` text COMMENT '描述',
  `emEquipment` varchar(15) DEFAULT '无' COMMENT '设备',
  `emZoom` varchar(5) DEFAULT '无' COMMENT '放大倍数',
  `emPhotoMod` varchar(4) DEFAULT '无' COMMENT '拍摄模式',
  `emImgList` json NOT NULL COMMENT '电子显微照片',
  PRIMARY KEY (`sampleId`),
  UNIQUE KEY `electron_micro_sampleId_uindex` (`sampleId`),
  CONSTRAINT `electron_micro_fk` FOREIGN KEY (`sampleId`) REFERENCES `basicinfo` (`sampleId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electron_micro`
--

LOCK TABLES `electron_micro` WRITE;
/*!40000 ALTER TABLE `electron_micro` DISABLE KEYS */;
INSERT INTO `electron_micro` VALUES ('11Y1:9','无','无',NULL,'无','无','无','[]');
/*!40000 ALTER TABLE `electron_micro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiment_data`
--

DROP TABLE IF EXISTS `experiment_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiment_data` (
  `experimentId` varchar(20) NOT NULL COMMENT '实验编号',
  `sampleId` varchar(20) DEFAULT NULL,
  `mineralContent` json DEFAULT NULL COMMENT '矿物含量',
  `XRDContent` json DEFAULT NULL COMMENT 'XRD成分',
  `chemicalContent` json DEFAULT NULL COMMENT '化学成分',
  `thermalPerform` json DEFAULT NULL COMMENT '热分析',
  `diameterDisplay` json DEFAULT NULL COMMENT '岩屑直径分布',
  `cavityDisplay` json DEFAULT NULL COMMENT '空洞长度分布',
  PRIMARY KEY (`experimentId`),
  UNIQUE KEY `experiment_data_experimentId_uindex` (`experimentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='实验编号';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_data`
--

LOCK TABLES `experiment_data` WRITE;
/*!40000 ALTER TABLE `experiment_data` DISABLE KEYS */;
INSERT INTO `experiment_data` VALUES ('11Y1:9-1','11Y1:9','{\"test\": \"1\", \"石英粉砂\": 21.7, \"粘土基质\": 62.3}','{\"石英\": 57, \"钠长石\": 17}','{\"MgO\": 1.7, \"Na2O\": 1.5}','{\"耐火度\": 1254, \"终止温度\": 1089}','{}','{}'),('11Y1:9-2','11Y1:9','{\"test\": \"1\", \"石英粉砂\": 30.1, \"粘土基质\": 55.6}','{\"石英\": 57.2, \"钠长石\": 17.1}','{\"MgO\": 2.31, \"Na2O\": 1.33}','{\"耐火度\": 1200, \"终止温度\": 1100}','{}','{}');
/*!40000 ALTER TABLE `experiment_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metalphase`
--

DROP TABLE IF EXISTS `metalphase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metalphase` (
  `sampleId` varchar(20) NOT NULL DEFAULT 'undefined' COMMENT '样品编号',
  `metalPhase` varchar(2) NOT NULL DEFAULT '无' COMMENT '金相',
  `sfFullImg` varchar(20) DEFAULT '无' COMMENT '样品全图',
  `sfDescription` text COMMENT '金相描述',
  `sfEquipment` varchar(10) DEFAULT '无' COMMENT '金相设备',
  `sfZoom` varchar(5) DEFAULT '无' COMMENT '金相放大倍数',
  `sfPhotoMod` varchar(4) DEFAULT '无' COMMENT '金相拍摄模式',
  `sfImgList` json NOT NULL COMMENT '金相照片',
  PRIMARY KEY (`sampleId`),
  UNIQUE KEY `metalphase_sampleId_uindex` (`sampleId`),
  CONSTRAINT `metalphase_basicinfo_sampleId_fk` FOREIGN KEY (`sampleId`) REFERENCES `basicinfo` (`sampleId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='样品金相数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metalphase`
--

LOCK TABLES `metalphase` WRITE;
/*!40000 ALTER TABLE `metalphase` DISABLE KEYS */;
INSERT INTO `metalphase` VALUES ('11Y1:9','无','无',NULL,'123','无','无','[\"01.jpg\", \"image001.jpg\"]');
/*!40000 ALTER TABLE `metalphase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minephase`
--

DROP TABLE IF EXISTS `minephase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `minephase` (
  `sampleId` varchar(20) NOT NULL COMMENT '样品编号',
  `minePhase` varchar(2) DEFAULT '无' COMMENT '矿相',
  `mpFullImg` varchar(20) DEFAULT '无' COMMENT '薄片扫描图',
  `mpDescription` text COMMENT '描述',
  `mpEquipment` varchar(10) DEFAULT '无' COMMENT '拍摄设备',
  `mpZoom` varchar(5) DEFAULT '无' COMMENT '放大倍数',
  `mpPhotoMod` varchar(4) DEFAULT '无' COMMENT '拍摄模式',
  `mpImgList` json NOT NULL COMMENT '图片列表',
  PRIMARY KEY (`sampleId`),
  UNIQUE KEY `minephase_sampleId_uindex` (`sampleId`),
  CONSTRAINT `minephase_fk` FOREIGN KEY (`sampleId`) REFERENCES `basicinfo` (`sampleId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='矿相数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minephase`
--

LOCK TABLES `minephase` WRITE;
/*!40000 ALTER TABLE `minephase` DISABLE KEYS */;
INSERT INTO `minephase` VALUES ('11Y1:9','无','无',NULL,'无','无','无','[]');
/*!40000 ALTER TABLE `minephase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `om_graphic`
--

DROP TABLE IF EXISTS `om_graphic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `om_graphic` (
  `imageIndex` varchar(20) NOT NULL COMMENT '图片索引',
  `omDescription` text COMMENT '图片描述',
  `omEquipment` varchar(10) DEFAULT '无' COMMENT '拍摄设备',
  `omZoom` varchar(5) DEFAULT '无' COMMENT '放大倍数',
  `omPhotoMod` varchar(4) DEFAULT '无' COMMENT '拍摄模式',
  PRIMARY KEY (`imageIndex`),
  UNIQUE KEY `om_graphic_imageIndex_uindex` (`imageIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='显微组织观察样品图片索引';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `om_graphic`
--

LOCK TABLES `om_graphic` WRITE;
/*!40000 ALTER TABLE `om_graphic` DISABLE KEYS */;
INSERT INTO `om_graphic` VALUES ('01.jpg','无','无','无','无'),('image001.jpg','无','无','无','无');
/*!40000 ALTER TABLE `om_graphic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physical_property`
--

DROP TABLE IF EXISTS `physical_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `physical_property` (
  `sampleId` varchar(20) NOT NULL COMMENT '样品编号',
  `apparentPorosity` float DEFAULT '0' COMMENT '显气孔率',
  `trueDensity` float DEFAULT '0' COMMENT '真密度',
  `waterAbsorption` float DEFAULT '0' COMMENT '吸水率',
  PRIMARY KEY (`sampleId`),
  UNIQUE KEY `physical_property_sampleId_uindex` (`sampleId`),
  CONSTRAINT `physical_property_fk` FOREIGN KEY (`sampleId`) REFERENCES `basicinfo` (`sampleId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physical_property`
--

LOCK TABLES `physical_property` WRITE;
/*!40000 ALTER TABLE `physical_property` DISABLE KEYS */;
INSERT INTO `physical_property` VALUES ('11Y1:9',0,0,0);
/*!40000 ALTER TABLE `physical_property` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-04 14:41:10
