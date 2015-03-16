CREATE DATABASE  IF NOT EXISTS `dbcorecto` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbcorecto`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: dbcorecto
-- ------------------------------------------------------
-- Server version	5.5.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `anatomia_patologica_post`
--

DROP TABLE IF EXISTS `anatomia_patologica_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anatomia_patologica_post` (
  `IDANATOMIAPATOPOST` bigint(20) NOT NULL,
  `IDCONSULTA` bigint(20) DEFAULT NULL,
  `NRO_BIOPSIA` varchar(100) DEFAULT NULL,
  `FECHA_AP` date DEFAULT NULL,
  `DIAG_HISTO` varchar(200) DEFAULT NULL,
  `GRADO_DIF` varchar(25) DEFAULT NULL,
  `TUMOR` varchar(25) DEFAULT NULL,
  `GAN_RESECADOS` varchar(50) DEFAULT NULL,
  `GAN_POSITIVOS` varchar(50) DEFAULT NULL,
  `INV_VASCULAR` varchar(25) DEFAULT NULL,
  `INV_PERI` varchar(25) DEFAULT NULL,
  `LINFA` varchar(25) DEFAULT NULL,
  `BUDDING_TUMORAL` varchar(25) DEFAULT NULL,
  `PUSHING_BORDER` varchar(25) DEFAULT NULL,
  `GRADO_REGRESION` varchar(100) DEFAULT NULL,
  `CAP` varchar(100) DEFAULT NULL,
  `RTA_COM_PATO` varchar(25) DEFAULT NULL,
  `IHQ` varchar(25) DEFAULT NULL,
  `KRAS` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`IDANATOMIAPATOPOST`),
  KEY `IDCONSULTA` (`IDCONSULTA`),
  CONSTRAINT `anatomia_patologica_post_ibfk_1` FOREIGN KEY (`IDCONSULTA`) REFERENCES `consulta` (`IDCONSULTA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anatomia_patologica_post`
--

LOCK TABLES `anatomia_patologica_post` WRITE;
/*!40000 ALTER TABLE `anatomia_patologica_post` DISABLE KEYS */;
INSERT INTO `anatomia_patologica_post` VALUES (1,4,'nrobio','2014-04-08','diagnostico ','1','3//3','ee','eee','1','1','0',NULL,'1','ee','ee','1','1','0//0');
/*!40000 ALTER TABLE `anatomia_patologica_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anotomia_patologica`
--

DROP TABLE IF EXISTS `anotomia_patologica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anotomia_patologica` (
  `IDANOTOMIA` bigint(20) NOT NULL,
  `IDCONSULTA` bigint(20) DEFAULT NULL,
  `BIOPSIA` varchar(100) DEFAULT NULL,
  `FECHA_DIAG` date DEFAULT NULL,
  `DIAG_HISTOLOGICO` varchar(200) DEFAULT NULL,
  `AP_SUGESTIVA` varchar(25) DEFAULT NULL,
  `IHQ` varchar(25) DEFAULT NULL,
  `EXPRESION_CONSERV` varchar(100) DEFAULT NULL,
  `DIAGNOSTICADO_EN` varchar(200) DEFAULT NULL,
  `GRADO_DIF` varchar(50) DEFAULT NULL,
  `BASE_DIAG_CIRUGIA` varchar(25) DEFAULT NULL,
  `BASE_DIAG` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IDANOTOMIA`),
  KEY `IDCONSULTA` (`IDCONSULTA`),
  CONSTRAINT `anotomia_patologica_ibfk_1` FOREIGN KEY (`IDCONSULTA`) REFERENCES `consulta` (`IDCONSULTA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anotomia_patologica`
--

LOCK TABLES `anotomia_patologica` WRITE;
/*!40000 ALTER TABLE `anotomia_patologica` DISABLE KEYS */;
INSERT INTO `anotomia_patologica` VALUES (1,4,'biopsia','2014-04-15','diagno','1','0','1//notaaa','eeeen','2','0','');
/*!40000 ALTER TABLE `anotomia_patologica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `antecedentes`
--

DROP TABLE IF EXISTS `antecedentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `antecedentes` (
  `IDANTECEDENTE` bigint(20) NOT NULL,
  `IDCONSULTA` bigint(20) DEFAULT NULL,
  `PERSONALES` varchar(100) DEFAULT NULL,
  `PERSONALES_PATOLOGICOS` varchar(100) DEFAULT NULL,
  `NEOPLASIA` varchar(300) DEFAULT NULL,
  `FAMILIAR_CANCER` varchar(100) DEFAULT NULL,
  `ANTECEDENTES_CCRH` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IDANTECEDENTE`),
  KEY `IDCONSULTA` (`IDCONSULTA`),
  CONSTRAINT `antecedentes_ibfk_1` FOREIGN KEY (`IDCONSULTA`) REFERENCES `consulta` (`IDCONSULTA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antecedentes`
--

LOCK TABLES `antecedentes` WRITE;
/*!40000 ALTER TABLE `antecedentes` DISABLE KEYS */;
INSERT INTO `antecedentes` VALUES (3,4,'-apersonal1//','-apersonalPat2','','-checkfamMenor60*3','4//-checkLYNCH'),(5,5,'-apersonal1-apersonal2-apersonal3-apersonal4-apersonal5//otro mas','-apersonalPat1-apersonalPat2-apersonalPat3-apersonalPat5-neoplasia','neopla','-checkfamMenor60*22-checkfamMayor60*23-checkfamSegundoGrado*24','4//-checkPAF-checkLYNCH');
/*!40000 ALTER TABLE `antecedentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_hospital`
--

DROP TABLE IF EXISTS `cat_hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_hospital` (
  `IDCATHOSPITAL` int(11) NOT NULL,
  `NOMBRE` varchar(200) DEFAULT NULL,
  `DIRECCION` varchar(250) DEFAULT NULL,
  `ESTADO` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`IDCATHOSPITAL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_hospital`
--

LOCK TABLES `cat_hospital` WRITE;
/*!40000 ALTER TABLE `cat_hospital` DISABLE KEYS */;
INSERT INTO `cat_hospital` VALUES (1,'Hospital 1','direccopm',1);
/*!40000 ALTER TABLE `cat_hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_os`
--

DROP TABLE IF EXISTS `cat_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_os` (
  `IDOS` int(11) NOT NULL,
  `NOMBRE` varchar(200) DEFAULT NULL,
  `DESCRIPCION` varchar(200) DEFAULT NULL,
  `ESTADO` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`IDOS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_os`
--

LOCK TABLES `cat_os` WRITE;
/*!40000 ALTER TABLE `cat_os` DISABLE KEYS */;
INSERT INTO `cat_os` VALUES (0,'Ninguna','Ninguna',1),(1,'OSDE','OSDE',1),(2,'SWG','SWG',1),(3,'Otra','Otra',1);
/*!40000 ALTER TABLE `cat_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conducta_post_neo`
--

DROP TABLE IF EXISTS `conducta_post_neo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conducta_post_neo` (
  `IDCONDUCTAPOSTNEO` bigint(20) NOT NULL,
  `IDCONSULTA` bigint(20) DEFAULT NULL,
  `CIRUGIA` varchar(25) DEFAULT NULL,
  `MILES_CILINDRICO` varchar(100) DEFAULT NULL,
  `URGENCIA` varchar(25) DEFAULT NULL,
  `URGENCIA_FECHA` date DEFAULT NULL,
  `CIRUJANO` varchar(200) DEFAULT NULL,
  `W_S` varchar(25) DEFAULT NULL,
  `FECHA_INICIO` date DEFAULT NULL,
  PRIMARY KEY (`IDCONDUCTAPOSTNEO`),
  KEY `IDCONSULTA` (`IDCONSULTA`),
  CONSTRAINT `conducta_post_neo_ibfk_1` FOREIGN KEY (`IDCONSULTA`) REFERENCES `consulta` (`IDCONSULTA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conducta_post_neo`
--

LOCK TABLES `conducta_post_neo` WRITE;
/*!40000 ALTER TABLE `conducta_post_neo` DISABLE KEYS */;
INSERT INTO `conducta_post_neo` VALUES (1,4,'1//0','1//otro','1','2014-04-30','matias','1','2014-04-23');
/*!40000 ALTER TABLE `conducta_post_neo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta` (
  `IDCONSULTA` bigint(20) NOT NULL,
  `IDHOSPITAL` int(11) DEFAULT NULL,
  `MEDICO` varchar(200) DEFAULT NULL,
  `DIAGHISTOLOGICO` tinyint(1) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `IDPACIENTE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`IDCONSULTA`),
  KEY `IDHOSPITAL` (`IDHOSPITAL`),
  KEY `IDPACIENTE` (`IDPACIENTE`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`IDHOSPITAL`) REFERENCES `cat_hospital` (`IDCATHOSPITAL`),
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`IDPACIENTE`) REFERENCES `paciente` (`IDPACIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (4,1,'',1,'2013-11-19',6),(5,1,'',1,'2014-04-29',1);
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desc_trata_neo`
--

DROP TABLE IF EXISTS `desc_trata_neo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desc_trata_neo` (
  `IDDESCTRATANEO` bigint(20) NOT NULL,
  `IDCONSULTA` bigint(20) DEFAULT NULL,
  `RADIOTERAPIA` varchar(25) DEFAULT NULL,
  `RADIO_DOSIS` varchar(25) DEFAULT NULL,
  `RADIO_FECHA_INICIO` date DEFAULT NULL,
  `RADIO_FECHA_FINAL` date DEFAULT NULL,
  `RADIO_SUSPENDIO` varchar(25) DEFAULT NULL,
  `QUIMIO_ESQUEMA` varchar(25) DEFAULT NULL,
  `QUIMIO_NRO_CICLOS` varchar(25) DEFAULT NULL,
  `QUIMIO_FECHA_INICIO` date DEFAULT NULL,
  `QUIMIO_FECHA_FINAL` date DEFAULT NULL,
  `TOXICIDAD` varchar(25) DEFAULT NULL,
  `TOX_GRADO` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`IDDESCTRATANEO`),
  KEY `IDCONSULTA` (`IDCONSULTA`),
  CONSTRAINT `desc_trata_neo_ibfk_1` FOREIGN KEY (`IDCONSULTA`) REFERENCES `consulta` (`IDCONSULTA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desc_trata_neo`
--

LOCK TABLES `desc_trata_neo` WRITE;
/*!40000 ALTER TABLE `desc_trata_neo` DISABLE KEYS */;
INSERT INTO `desc_trata_neo` VALUES (1,4,'1','dosisss','2014-04-01','2014-04-02','1//','1//esquemaaa','1','2014-04-01','2014-04-22','1','0');
/*!40000 ALTER TABLE `desc_trata_neo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadificacion`
--

DROP TABLE IF EXISTS `estadificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadificacion` (
  `IDESTADIFICACION` bigint(20) NOT NULL,
  `IDCONSULTA` bigint(20) DEFAULT NULL,
  `RM_CENTRO` varchar(50) DEFAULT NULL,
  `RM_FECHA` date DEFAULT NULL,
  `RM_DIST_ESFINTER` varchar(25) DEFAULT NULL,
  `RM_DIST_ANAL` varchar(25) DEFAULT NULL,
  `RM_ALTURA` varchar(25) DEFAULT NULL,
  `RM_TUMOR` varchar(50) DEFAULT NULL,
  `CRM` varchar(25) DEFAULT NULL,
  `EMVI` varchar(25) DEFAULT NULL,
  `DEP_SATELITES` varchar(25) DEFAULT NULL,
  `TUMO_RECTO_INFERIOR` varchar(25) DEFAULT NULL,
  `GANGLIOS` varchar(25) DEFAULT NULL,
  `INFILTRA_ESFINTER` varchar(25) DEFAULT NULL,
  `TC_TORAX` varchar(25) DEFAULT NULL,
  `TC_ABD` varchar(25) DEFAULT NULL,
  `PET_CT` varchar(25) DEFAULT NULL,
  `MTS` varchar(25) DEFAULT NULL,
  `SUV` varchar(100) DEFAULT NULL,
  `MAR_TUM_FECHA` date DEFAULT NULL,
  `CEA_AUMENTADO` varchar(25) DEFAULT NULL,
  `CA_19` varchar(25) DEFAULT NULL,
  `TNM_T` varchar(25) DEFAULT NULL,
  `TNM_N` varchar(25) DEFAULT NULL,
  `TNM_M` varchar(25) DEFAULT NULL,
  `TNM_PT` varchar(25) DEFAULT NULL,
  `TNM_PN` varchar(25) DEFAULT NULL,
  `TNM_PM` varchar(25) DEFAULT NULL,
  `METASTASIS` varchar(100) DEFAULT NULL,
  `REV_RM_FECHA` date DEFAULT NULL,
  `REV_DISTAN_ESFINTER` varchar(50) DEFAULT NULL,
  `REV_DISTAN_ANAL` varchar(50) DEFAULT NULL,
  `REV_ALTURA` varchar(25) DEFAULT NULL,
  `REV_TUMOR` varchar(25) DEFAULT NULL,
  `REV_CRM` varchar(25) DEFAULT NULL,
  `REV_EMVI` varchar(25) DEFAULT NULL,
  `REV_ESTADIF_TUMORES` varchar(25) DEFAULT NULL,
  `REV_GAN_INGUI` varchar(25) DEFAULT NULL,
  `REV_GAN_LATERAL` varchar(25) DEFAULT NULL,
  `REV_INFILTRA_ESF` varchar(25) DEFAULT NULL,
  `GANGLIOS_LATE` varchar(25) DEFAULT NULL,
  `METASTASIS_OTRA` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IDESTADIFICACION`),
  KEY `IDCONSULTA` (`IDCONSULTA`),
  CONSTRAINT `estadificacion_ibfk_1` FOREIGN KEY (`IDCONSULTA`) REFERENCES `consulta` (`IDCONSULTA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadificacion`
--

LOCK TABLES `estadificacion` WRITE;
/*!40000 ALTER TABLE `estadificacion` DISABLE KEYS */;
INSERT INTO `estadificacion` VALUES (1,4,'12331','2014-04-08','12345','0','1234','3//4','1','4','1','2','1','0','1','1','1','0','suvvvvv','2014-04-09','1','1','1','2','3','1','2','3','-metastaDist3','2014-04-01','fre','0','1112','4//3','1','0','3','0','0','0','0','otras');
/*!40000 ALTER TABLE `estadificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eva_clinica`
--

DROP TABLE IF EXISTS `eva_clinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eva_clinica` (
  `IDEVACLINICA` bigint(20) NOT NULL,
  `IDCONSULTA` bigint(20) DEFAULT NULL,
  `ABDOMEN` varchar(80) DEFAULT NULL,
  `COLON` varchar(80) DEFAULT NULL,
  `RECTO` varchar(80) DEFAULT NULL,
  `ADENOPATIAS` varchar(100) DEFAULT NULL,
  `NOTAS` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`IDEVACLINICA`),
  KEY `IDCONSULTA` (`IDCONSULTA`),
  CONSTRAINT `eva_clinica_ibfk_1` FOREIGN KEY (`IDCONSULTA`) REFERENCES `consulta` (`IDCONSULTA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eva_clinica`
--

LOCK TABLES `eva_clinica` WRITE;
/*!40000 ALTER TABLE `eva_clinica` DISABLE KEYS */;
INSERT INTO `eva_clinica` VALUES (2,4,'-haAbdomen1-haAbdomen2-haAbdomen3-haAbdomen4-haAbdomen5','-haColon1-haColon2','-haRecto1-haRecto2-haRecto3','-haAdenopatia1-haAdenopatia2','notasssss');
/*!40000 ALTER TABLE `eva_clinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exa_procto`
--

DROP TABLE IF EXISTS `exa_procto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exa_procto` (
  `IDEXAPROCTO` bigint(20) NOT NULL,
  `IDCONSULTA` bigint(20) DEFAULT NULL,
  `TACTO_RECTAL` varchar(25) DEFAULT NULL,
  `RSC` varchar(25) DEFAULT NULL,
  `RSC_ALTURA` varchar(25) DEFAULT NULL,
  `RSC_FECHA` date DEFAULT NULL,
  `VCC` varchar(25) DEFAULT NULL,
  `VCC_ALTURA` varchar(25) DEFAULT NULL,
  `VCC_FECHA` date DEFAULT NULL,
  `EE` varchar(25) DEFAULT NULL,
  `EE_INFILTRA` varchar(25) DEFAULT NULL,
  `EE_FECHA` date DEFAULT NULL,
  `TACTO_RECTAL_INFILTRA` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`IDEXAPROCTO`),
  KEY `IDCONSULTA` (`IDCONSULTA`),
  CONSTRAINT `exa_procto_ibfk_1` FOREIGN KEY (`IDCONSULTA`) REFERENCES `consulta` (`IDCONSULTA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exa_procto`
--

LOCK TABLES `exa_procto` WRITE;
/*!40000 ALTER TABLE `exa_procto` DISABLE KEYS */;
INSERT INTO `exa_procto` VALUES (1,5,'1//1','1//2','100','2014-04-09','1//1//2','200','2014-04-30','1//2//undefined','1//2','2014-04-30','2');
/*!40000 ALTER TABLE `exa_procto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motivo`
--

DROP TABLE IF EXISTS `motivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motivo` (
  `IDMOTIVO` bigint(20) NOT NULL,
  `IDCONSULTA` bigint(20) DEFAULT NULL,
  `MOTIVO` varchar(100) DEFAULT NULL,
  `FECHA_INICIO` date DEFAULT NULL,
  `EVO_MESES` int(11) DEFAULT NULL,
  `MOTIVO_OTRO` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IDMOTIVO`),
  KEY `IDCONSULTA` (`IDCONSULTA`),
  CONSTRAINT `motivo_ibfk_1` FOREIGN KEY (`IDCONSULTA`) REFERENCES `consulta` (`IDCONSULTA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motivo`
--

LOCK TABLES `motivo` WRITE;
/*!40000 ALTER TABLE `motivo` DISABLE KEYS */;
INSERT INTO `motivo` VALUES (1,4,'-motivo1-motivo2-motivo3-motivo4-motivo5-motivo6-motivo8','2014-04-09',12,'otro'),(2,5,'-motivo1-motivo5-motivo6-motivo8','2014-04-10',11,'otro');
/*!40000 ALTER TABLE `motivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
  `IDPACIENTE` bigint(20) NOT NULL,
  `NOMBRE` varchar(150) DEFAULT NULL,
  `SEXO` varchar(1) DEFAULT NULL,
  `FECHANAC` date DEFAULT NULL,
  `DIRECCION` varchar(200) DEFAULT NULL,
  `LOCALIDAD` varchar(200) DEFAULT NULL,
  `TELEFONO` varchar(40) DEFAULT NULL,
  `MAIL` varchar(100) DEFAULT NULL,
  `IDOS` int(11) DEFAULT NULL,
  `NRO_OS` varchar(100) DEFAULT NULL,
  `NOTAS` varchar(300) DEFAULT NULL,
  `DNI` varchar(50) DEFAULT NULL,
  `FECHA_AGREGADO` datetime DEFAULT NULL,
  `AGREGADO_POR` varchar(100) DEFAULT NULL,
  `FECHA_MODIFICADO` datetime DEFAULT NULL,
  `MODIFICADO_POR` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IDPACIENTE`),
  KEY `IDOS` (`IDOS`),
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`IDOS`) REFERENCES `cat_os` (`IDOS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'matias ','M','2013-10-23',NULL,NULL,'44444444','asdas@asdas.com',1,'11122','una nota','1111',NULL,NULL,NULL,NULL),(6,'Corecto','F',NULL,NULL,NULL,'','',0,'',NULL,'11112',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preconsulta`
--

DROP TABLE IF EXISTS `preconsulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preconsulta` (
  `IDPRECONSULTA` bigint(20) NOT NULL,
  `PESO` double DEFAULT NULL,
  `TALLA` double DEFAULT NULL,
  `SUPCORPORAL` double DEFAULT NULL,
  `PERFORMANCE_STATUS` varchar(10) DEFAULT NULL,
  `COMENTARIO` varchar(2000) DEFAULT NULL,
  `IDCONSULTA` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`IDPRECONSULTA`),
  KEY `IDCONSULTA` (`IDCONSULTA`),
  CONSTRAINT `preconsulta_ibfk_1` FOREIGN KEY (`IDCONSULTA`) REFERENCES `consulta` (`IDCONSULTA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preconsulta`
--

LOCK TABLES `preconsulta` WRITE;
/*!40000 ALTER TABLE `preconsulta` DISABLE KEYS */;
INSERT INTO `preconsulta` VALUES (1,12,10,10,'2','comentario presonculta',5),(2,10,10,10,'2','comentario presonculta',4);
/*!40000 ALTER TABLE `preconsulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta_trata_neo`
--

DROP TABLE IF EXISTS `respuesta_trata_neo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuesta_trata_neo` (
  `IDRESPUESTATRATANEO` bigint(20) NOT NULL,
  `IDCONSULTA` bigint(20) DEFAULT NULL,
  `RM_FECHA` date DEFAULT NULL,
  `RM_CENTRO` varchar(50) DEFAULT NULL,
  `RM_DIST_ESFINTER` varchar(25) DEFAULT NULL,
  `RM_DIST_ANAL` varchar(25) DEFAULT NULL,
  `RM_ALTURA` varchar(25) DEFAULT NULL,
  `RM_TUMOR` varchar(50) DEFAULT NULL,
  `CRM` varchar(25) DEFAULT NULL,
  `EMVI` varchar(25) DEFAULT NULL,
  `DEP_SATELITES` varchar(25) DEFAULT NULL,
  `GANGLIOS_IMGUI` varchar(25) DEFAULT NULL,
  `GANGLIOS_LATERAL` varchar(25) DEFAULT NULL,
  `INFILTRA_ESF` varchar(25) DEFAULT NULL,
  `ESTADIF_TUMOR` varchar(25) DEFAULT NULL,
  `GRADO_REGRE` varchar(25) DEFAULT NULL,
  `EVA_RESPUESTA` varchar(25) DEFAULT NULL,
  `TACTO_RECTAL` varchar(25) DEFAULT NULL,
  `EXA_INFILTRA_ESF` varchar(25) DEFAULT NULL,
  `RSC` varchar(25) DEFAULT NULL,
  `RSC_ALTURA` varchar(25) DEFAULT NULL,
  `RSC_FECHA` date DEFAULT NULL,
  `VCC` varchar(25) DEFAULT NULL,
  `VCC_ALTURA` varchar(25) DEFAULT NULL,
  `VCC_FECHA` date DEFAULT NULL,
  `EE` varchar(25) DEFAULT NULL,
  `EE_INFILTRA_ESF` varchar(25) DEFAULT NULL,
  `EE_FECHA` date DEFAULT NULL,
  PRIMARY KEY (`IDRESPUESTATRATANEO`),
  KEY `IDCONSULTA` (`IDCONSULTA`),
  CONSTRAINT `respuesta_trata_neo_ibfk_1` FOREIGN KEY (`IDCONSULTA`) REFERENCES `consulta` (`IDCONSULTA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta_trata_neo`
--

LOCK TABLES `respuesta_trata_neo` WRITE;
/*!40000 ALTER TABLE `respuesta_trata_neo` DISABLE KEYS */;
INSERT INTO `respuesta_trata_neo` VALUES (1,4,NULL,'centrooo','disaaa','2','900','6//3','1','4','1','1','1','1','2','2','4','0//0','1','1//0','',NULL,'1//0//0',NULL,NULL,'1//2//undefined','1//0',NULL);
/*!40000 ALTER TABLE `respuesta_trata_neo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamiento`
--

DROP TABLE IF EXISTS `tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tratamiento` (
  `IDTRATAMIENTO` bigint(20) NOT NULL,
  `IDCONSULTA` bigint(20) DEFAULT NULL,
  `UDAONDO` varchar(100) DEFAULT NULL,
  `CIRUGIA` varchar(25) DEFAULT NULL,
  `QUIMIOTERAPIA_INDUC` varchar(100) DEFAULT NULL,
  `QUIMIOTE_INDUC_NRO_CICLOS` varchar(25) DEFAULT NULL,
  `QUIMIO_OTRA` varchar(100) DEFAULT NULL,
  `QUIMIOTERAPIA_INTER` varchar(100) DEFAULT NULL,
  `QUIMIOTE_INTER_NRO_CIC` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`IDTRATAMIENTO`),
  KEY `IDCONSULTA` (`IDCONSULTA`),
  CONSTRAINT `tratamiento_ibfk_1` FOREIGN KEY (`IDCONSULTA`) REFERENCES `consulta` (`IDCONSULTA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamiento`
--

LOCK TABLES `tratamiento` WRITE;
/*!40000 ALTER TABLE `tratamiento` DISABLE KEYS */;
INSERT INTO `tratamiento` VALUES (1,5,'1//','1','1//','4','0//','1//','3');
/*!40000 ALTER TABLE `tratamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamiento_adyu`
--

DROP TABLE IF EXISTS `tratamiento_adyu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tratamiento_adyu` (
  `IDTRATAMIENTOADYU` bigint(20) NOT NULL,
  `IDCONSULTA` bigint(20) DEFAULT NULL,
  `QUIMIOTERAPIA` varchar(100) DEFAULT NULL,
  `QUIMIO_NRO_CICLOS` varchar(25) DEFAULT NULL,
  `RADIOTERAPIA` varchar(25) DEFAULT NULL,
  `RADIO_DOSIS` varchar(25) DEFAULT NULL,
  `RADIO_FECHA_INICIO` date DEFAULT NULL,
  `RADIO_FECHA_FINAL` date DEFAULT NULL,
  `SUSPENDIO` varchar(25) DEFAULT NULL,
  `NOTAS` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`IDTRATAMIENTOADYU`),
  KEY `IDCONSULTA` (`IDCONSULTA`),
  CONSTRAINT `tratamiento_adyu_ibfk_1` FOREIGN KEY (`IDCONSULTA`) REFERENCES `consulta` (`IDCONSULTA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamiento_adyu`
--

LOCK TABLES `tratamiento_adyu` WRITE;
/*!40000 ALTER TABLE `tratamiento_adyu` DISABLE KEYS */;
INSERT INTO `tratamiento_adyu` VALUES (5,4,'1//2//','3','1','1234','2013-11-01','2013-11-08','undefined//',''),(6,4,'1//1//otrooo','3','1','aaaaa','2014-04-30','2014-04-07','1//22','adasdasdasd');
/*!40000 ALTER TABLE `tratamiento_adyu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-16  8:36:26
