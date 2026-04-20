-- MySQL dump 10.11
--
-- Host: localhost    Database: celine_symfony
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt

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
-- Table structure for table `batiments`
--

DROP TABLE IF EXISTS `batiments`;
CREATE TABLE `batiments` (
  `id` int(11) NOT NULL auto_increment,
  `designation` varchar(60) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `batiments`
--

LOCK TABLES `batiments` WRITE;
/*!40000 ALTER TABLE `batiments` DISABLE KEYS */;
/*!40000 ALTER TABLE `batiments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) collate utf8_unicode_ci NOT NULL,
  `executed_at` datetime default NULL,
  `execution_time` int(11) default NULL,
  PRIMARY KEY  (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20260420000001','2026-04-20 08:00:06',516);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiphfp`
--

DROP TABLE IF EXISTS `fiphfp`;
CREATE TABLE `fiphfp` (
  `id` int(11) NOT NULL auto_increment,
  `agent_fiphfp` varchar(100) collate utf8_unicode_ci default NULL,
  `pole_fiphfp` varchar(100) collate utf8_unicode_ci default NULL,
  `demande_fiphfp` varchar(100) collate utf8_unicode_ci default NULL,
  `date_demande_fiphfp` varchar(10) collate utf8_unicode_ci default NULL,
  `objet_fiphfp` varchar(255) collate utf8_unicode_ci default NULL,
  `etat_demande_fiphfp` varchar(255) collate utf8_unicode_ci default NULL,
  `detail_demande_fiphfp` varchar(1000) collate utf8_unicode_ci default NULL,
  `montant_depense_fiphfp` int(11) default NULL,
  `montant_demande_fiphfp` int(11) default NULL,
  `montant_accorde_fiphfp` int(11) default NULL,
  `accord_paye_le` varchar(10) collate utf8_unicode_ci default NULL,
  `urgence_fiphfp` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fiphfp`
--

LOCK TABLES `fiphfp` WRITE;
/*!40000 ALTER TABLE `fiphfp` DISABLE KEYS */;
INSERT INTO `fiphfp` VALUES (1,'Paris Sandie','ACM','01AKC791250923112314','23/09/2025','Prothèses auditives','Nofitication accord de la demande','Entendre\nFacture acquittée transmise le 17 mars 2026',4190,1700,0,'',0),(2,'Henry Natacha','Ecole/Entretien','01AKC791250312113721','12/03/2025','Aménagement de poste','Notification accord de paiement','Chaise ergonomique (133.13)\nTable à langer avec escabeau (414.90)\nPayé le 05/09/2025',549,467,467,'',0),(3,'Ducloy Christophe','Techniques','01AKC791250228105330','28/02/2025','Prothèses auditives','Notification accord de paiement','Amplifon\r\nPayé le 28/08/2025',3504,1194,1194,'',0),(4,'Hocq Jérèmy','Techniques','01AKC791250515091852','15/05/2025','Prothèses auditives','Demande de documents','13/10/2025 : Suite appel téléphonique, réception des décomptes de CPAM (480e) et mutuelle (1700e) par Amplifon\n14/10/2025 : Transmettre les décomptes de Sécurité Sociale avant le 13.11.2025 car ceux transmis ne conviennent pas.\n\nN° de téléphone MAman : 0631753916\n',3099,1329,1329,'',0),(5,'Vautier Marie Paule','Ecole/Entretien','	01AKC791250206112017','06/02/2025','Aménagement de poste','Notification accord de paiement','Chaise ergonomique petite enfance (804€)\nTable à langer avec escabeau (414.90€)\nPayé le 03/07/2025',1219,1073,1073,'',0),(6,'Carpe Christèle','Ecole/Entretien','	01AKC791250206103458','06/02/2025','Aménagement de poste','Notification accord de paiement','Siège ergonomique petite enfance\nPayé le 02/07/2025',396,270,208,'',0),(7,'Laverdure Géraldine','Crèche','01AKC791241106081322','06/11/2024','Aménagement de poste','Notification accord de paiement','Clavier - Souris -Repose pieds -Pose documents\r\nChaise ergonomique\r\nPayé le 08/04/2025',1524,1371,1371,'',0),(8,'MARETTE Stéphanie','SENOU','01AKC791251218092717','18/12/2025','Aménagement de poste','Accusé de réception de la demande','',1854,1854,0,'',0);
/*!40000 ALTER TABLE `fiphfp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inter`
--

DROP TABLE IF EXISTS `inter`;
CREATE TABLE `inter` (
  `id` int(11) NOT NULL auto_increment,
  `date` varchar(10) collate utf8_unicode_ci default NULL,
  `heure` int(11) default NULL,
  `service` varchar(100) collate utf8_unicode_ci default NULL,
  `panne_annonce` varchar(255) collate utf8_unicode_ci default NULL,
  `cout_matos` decimal(10,2) default NULL,
  `inter_effect` varchar(1000) collate utf8_unicode_ci default NULL,
  `duree` decimal(10,2) default NULL,
  `intervenant` varchar(1000) collate utf8_unicode_ci default NULL,
  `taux_intervenant` decimal(10,2) default NULL,
  `intervenant2` varchar(60) collate utf8_unicode_ci default NULL,
  `taux_intervenant2` decimal(10,2) default NULL,
  `intervenant3` varchar(60) collate utf8_unicode_ci default NULL,
  `taux_intervenant3` decimal(10,2) default NULL,
  `agent_visite` varchar(255) collate utf8_unicode_ci default NULL,
  `agent_rqth` varchar(255) collate utf8_unicode_ci default NULL,
  `pole_service_visite` varchar(255) collate utf8_unicode_ci default NULL,
  `pole_service_rqth` varchar(255) collate utf8_unicode_ci default NULL,
  `date_visite` varchar(60) collate utf8_unicode_ci default NULL,
  `observation` varchar(255) collate utf8_unicode_ci default NULL,
  `rqth_visite` varchar(3) collate utf8_unicode_ci default NULL,
  `restriction_visite` varchar(1000) collate utf8_unicode_ci default NULL,
  `user_inter` varchar(60) collate utf8_unicode_ci default NULL,
  `urgence` varchar(5) collate utf8_unicode_ci default NULL,
  `type` varchar(60) collate utf8_unicode_ci default NULL,
  `recommandation_visite` varchar(1000) collate utf8_unicode_ci default NULL,
  `limitation_visite` varchar(1000) collate utf8_unicode_ci default NULL,
  `temps_partiel_visite` varchar(3) collate utf8_unicode_ci default NULL,
  `tpt1_du` varchar(10) collate utf8_unicode_ci default NULL,
  `tpt1_au` varchar(10) collate utf8_unicode_ci default NULL,
  `tpt2_du` varchar(10) collate utf8_unicode_ci default NULL,
  `tpt2_au` varchar(10) collate utf8_unicode_ci default NULL,
  `tpt3_du` varchar(10) collate utf8_unicode_ci default NULL,
  `tpt3_au` varchar(10) collate utf8_unicode_ci default NULL,
  `tpt4_du` varchar(10) collate utf8_unicode_ci default NULL,
  `tpt4_au` varchar(10) collate utf8_unicode_ci default NULL,
  `emploi_visite` varchar(255) collate utf8_unicode_ci default NULL,
  `emploi_rqth` varchar(255) collate utf8_unicode_ci default NULL,
  `prix1` decimal(10,2) default NULL,
  `etat_rqth` varchar(1000) collate utf8_unicode_ci default NULL,
  `taux_total` decimal(10,2) default NULL,
  `par` varchar(60) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `inter`
--

LOCK TABLES `inter` WRITE;
/*!40000 ALTER TABLE `inter` DISABLE KEYS */;
INSERT INTO `inter` VALUES (1,'28/02/2025',8,'Techniques','Demande aide FIPHFP','0.00','- 28/02/2025 : Instruction du dossier FIPHFP \n- Transmission des documents nécessaires\n- Demande des décomptes Mutuelle et Sécurité Sociale à l’agent\n- 28/08/2025 : Transmission des pièces manquantes\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','Réf : 01AKC791250228105330','000','','DUCLOY CHRISTOPHE','','FIPHFP - Prothèse auditives','','0','119','','0','0.00','','0','0.00','','0','0.00','','1194.00','0.00','0.00','Céline GOSSE'),(2,'20/02/2025',10,'Ecole/Entretien','Demande de la médecine de prévention','0.00','- Etude de poste \n- Besoin de chaise adaptée petite enfance qui sera laissé en test par la société Auptinov\n- Demande de transport vers l’école Prévert','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','CAP EMPLOI LITTORAL','0.00','','0.00','','0.00','','0.00','0','Dossier FIPHFP à constituer','000','','CARPE CHRISTÈLE','','ANALYSE DE POSTE','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(3,'06/02/2025',10,'Ecole/Entretien','Demande aide FIPHFP','0.00','- 06/02/2025 : Instruction du dossier FIPHFP \n- Transmission des documents nécessaires\n- Transmission des pièces manquantes \n- 19/06/25 : envoi de la facture acquittée','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','Réf : 01AKC791250206103458','000','','CARPE CHRISTÈLE','','FIPHFP - Adaptation de poste','','0','208','','0','0.00','','0','0.00','','0','0.00','','268.00','0.00','0.00','Céline GOSSE'),(4,'20/02/2025',0,'Ecole/Entretien','Demande de la médecine de prévention','0.00','- Etude de poste \n- Besoin de chaise adaptée petite enfance qui sera laissé en test par la société Auptinov\n- Commande d’une table à langer chez Wesco\n- Réception du matériel Wesco à l’hôtel de ville\n- Demande de transport vers l’école Prévert','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','0','Dossier FIPHFP à constituer','000','','VAUTIER MARIE PAULE','','ANALYSE DE POSTE','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(5,'06/02/2025',0,'Ecole/Entretien','Demande aide FIPHFP','0.00','- 06/02/2025 : Instruction du dossier FIPHFP pour l’achat d’un siège adapté et d’une table à langer\n- Transmission des documents nécessaires\n- Transmission des pièces manquantes\n- 03/07/2025 : Envoi de la facture acquittée','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','Réf : 01AKC791250206112017','000','','VAUTIER MARIE PAULE','','FIPHFP - Adaptation de poste','','0','107','','0','0.00','','0','0.00','','0','0.00','','1073.00','0.00','0.00','Céline GOSSE'),(6,'15/07/2025',0,'Espaces Verts','Dossier papier','0.00','Constitution du dossier ”papier”\nEnvoi du dossier\n15/09/25 : Entretien agent, rejet du dossier, nouvelle demande\n22/09/25 : Demande de rendez vous afin de finaliser le dossier\n23/09/25 : Envoi du dossier','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','','000','','BLOQUEL DIDIER','','CNAS - Prime retraite','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(7,'12/03/2025',0,'Ecole/Entretien','Demande aide FIPHFP','0.00','- 13/03/2025 : Instruction du dossier FIPHFP \n- Transmission des documents nécessaires\n- 05/09/2025 : Transmission des pièces manquantes','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','Réf : 01AKC791250312113721','000','','HENRY NATACHA','','FIPHFP - Adaptation de poste','','0','467','','0','0.00','','0','0.00','','0','0.00','','467.00','0.00','0.00','Céline GOSSE'),(8,'15/10/2024',0,'Ecole/Entretien','Demande de la médecine de prévention','0.00','- Etude de poste \n- Suite demande de 3 devis, commande de siège adapté chez Bureau Vallée\n- Commande d’une table à langer chez Wesco\n- Réception du matériel à l’hôtel de ville\n- Demande de transport vers l’école Kergomard auprès des ST\n- 15/07/2025 :  demande de tapis à langer pour la table\n- Demande de 3 devis pour les 2 tables achetées chez Wesco','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','CAP EMPLOI LITTORAL','0.00','','0.00','','0.00','','0.00','0','Dossier FIPHFP à constituer','000','','HENRY NATACHA','','ANALYSE DE POSTE','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(9,'06/11/2024',0,'Crèche','Demande aide FIPHFP','0.00','- 06/11/2024 : Instruction du dossier FIPHFP \n- Transmission des documents nécessaires\n- 08/04/2025 : Transmission des pièces manquantes\n- 11/09/2025 : Versement de l’aide','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','Réf : 01AKC791241106081322','000','','LAVERDURE GÉRALDINE','','FIPHFP - Adaptation de poste','','0','137','','0','0.00','','0','0.00','','0','0.00','','1371.00','0.00','0.00','Céline GOSSE'),(10,'15/02/2024',0,'Crèche','Demande de la médecine de prévention','0.00','- Etude de poste. Besoin d’une chaise, d’un repose pieds, souris, porte documents.\nRemplacement de la table informatique nécessaire.\n- Réception du matériel adapté en prêt par Auptinov.\n- Evaluation du matériel par l’agent\n- Commande du matériel\n- Changement du mobilier de bureau\n- Plan sur site avec LBS\n- Proposition de devis ','0.00','','0.00','','0.00','','0.00','','0.00','','0.00','0','','000','','LAVERDURE GÉRALDINE','','ANALYSE DE POSTE','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(11,'07/10/2024',0,'Crèche','Aménagement de poste','0.00','07/10/24 :\nEtude de poste \nProposition de matériel adapté et de modification de l’espace de travail.\nL’agent bénéficie de l’assistance d’un 2ème agent à temps plein.\n\n14/10/2024 : Inventaire sur site des modifications à effectuer  en interne par les services techniques avec Fabrice Joiris\n\n11/04/2025 : Achat d’un marche pied\n\n07/10/2025 : \nVisite médicale de l’agent : Aménagement de poste à finaliser\n\n15/10/2025 : Demande d’intervention des ST\n\n16/10/2025 : \nEtude de la faisabilité d’échange des éviers sur site avec Dimitri Caffier\nEnvoi du rapport prévention\n\n17/10/2025 : \nDemande de nouveaux devis pour les réhausses éviers auprès de Auptinov\n\n22/10/2025 : transmissions devis Desenfans M. Baillard, S. Carlu, I. Calon\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','CAP EMPLOI LITTORAL','0.00','Demande de la médecine de prévention','0.00','','0.00','','0.00','0','','000','','PAINSET DELPHINE','','ANALYSE DE POSTE','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(12,'18/09/2025',0,'Crèche','Demande aide FIPHFP','0.00','Demande à effectuer','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','','000','','PAINSET DELPHINE','1','FIPHFP - Adaptation de poste','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(13,'04/12/2023',0,'Espaces Verts','Demande aide FIPHFP','0.00','- 04/12/2023: Instruction du dossier FIPHFP \n- Transmission des documents nécessaires\n- 09/05/2024 : Transmission des pièces manquantes','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','Réf : 01AKC791231204085635','000','','NOEL PATRICK','','FIPHFP - Prothèse auditives','','0','129','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(14,'13/11/2023',0,'Techniques','Demande aide FIPHFP','0.00','- 13/11/2023 : Instruction du dossier FIPHFP \n- Transmission des documents nécessaires\n- 12/04/2024 : Transmission des pièces manquantes','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','Réf : 01AKC791231113165712','000','','JOIRIS FABRICE','','FIPHFP - Prothèse auditives','','0','690','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(15,'15/05/2025',0,'Techniques','Demande aide FIPHFP','0.00','- 15/05/2025: Instruction du dossier FIPHFP \n- Transmission des documents nécessaires \n\n- 13/10/2025 : Transmission facture acquittée, décomptes CPAM et mutuelle\n\n-14/10/2025 : Transmettre le décompte de Sécurité Sociale avant le 13.11.2025\n\n- 07/11/2025 : Documents envoyés FIPHFP','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','Réf : 01AKC791250515091852','000','','HOCQ JÉRÈMY','','FIPHFP - Prothèse auditives','','0','170','','0','0.00','','0','0.00','','0','0.00','','1700.00','0.00','0.00','Céline GOSSE'),(16,'24/07/2025',0,'Espaces Verts','Dossier papier','0.00','Constitution du dossier ”papier”\nEnvoi du dossier\n15 et 16/09/25 : Entretien agent, rejet du dossier, nouvelle demande envoyée le 17/09/2025\n\n06/11/2025 : Nouveau rejet du dossier. 3ème demande envoyée ce jour','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','','000','','FAVREZ PHILIPPE','','CNAS - Prime retraite','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(17,'04/09/2025',0,'Espaces Verts','Dossier papier','0.00','Constitution du dossier ”papier”\nEn attente certificat administratif\n\nEnvoi du dossier le 23 10 2025\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','','000','','FOUGERAY CHRISTOPHE','','CNAS - Prime retraite','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(18,'27/05/2025',0,'Espaces Verts','Dossier papier','0.00','Constitution du dossier ”papier”\nEnvoi du dossier\n','0.00','','0.00','','0.00','','0.00','','0.00','','0.00','0','','000','','GAMBART PHILIPPE','','CNAS - Prime retraite','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(19,'27/05/2025',0,'Ecole/Entretien','Dossier papier','0.00','- Constitution du dossier ”papier”\n- Envoi du dossier\n- 04/09/25 : Entretien agent, rejet du dossier\n- Envoi nouvelle demande le 16/09/2025','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','','000','','LACOUR KALIDA','','CNAS - Prime retraite','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(20,'25/08/2025',0,'Ecole/Entretien','Prime rentrée scolaire','0.00','- Demande d’aide administrative afin de solliciter la prime de rentrée scolaire au CNAS\n\nCodes erronés, pas d’accès à la boîte mail pour réinitialiser le mot de passe.\n\nNouvel entretien dans la journée : création d’un nouveau mot','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','','000','','DUVIVIER MARJORIE','','CNAS - Rentrée scolaire','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(21,'18/09/2025',0,'Crèche','Livraison des EPI','0.00','- Appel Tony Pavy suite livraison Protecthoms au service scolaire\n- Vérification du bon de commande - Destinataire crèche\n- Appel ST pour demande de transport\n- Confirmation Tony Pavy du transport le 18/09 après midi\n06/10/2025 : Appel Sandrine Gricourt - Livraison des EPI crèche en mairie\nAppel Laurent Caron pour transport Mairie - Crèche','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','Protecthoms - Geodis','000','','CRÈCHE','','EPI','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(22,'21/08/2025',0,'Ecole/Entretien','Rentrée scolaire - Séjour vacances enfant - Chèques ANCV','0.00','Demande d’aide administrative afin de solliciter plusieurs aides au CNAS\n\nDocuments manquants : Imposition 2023 en 2024 pour Monsieur et Madame\nReçus par mail\n\nDemandes faites sur le site du CNAS le 22/08/2025\n\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','','000','','MAVAUT SÉVERINE','','CNAS - DIVERS DEMANDES','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(23,'18/09/2025',0,'Techniques','Harnais nacelle','0.00','18/09/25 :\n- Besoin de harnais pour intervenir dans la nacelle.\n- Contact Protecthoms pour conseils \n- Réception de la fiche technique ”Harnais nacelle”\n- Diffusion de la fiche technique aux participants de la réunion\n- Accord par S. Carlu, par mail pour la commande\n \n23/09/2025 :\n- Réception du devis \n- Envoi du devis à JP Carpe pour BdC \n\n07/10/2025 :\nEnvoi du BdC à Protechoms par mail','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','','000','','ST - ELECTRICIENS','','EPI','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(24,'07/04/2025',0,'Espaces Verts','Décès agent','0.00','07/04/2025 : Suite décès agent, demande d’aide auprès du CNAS pour les filles de Monsieur.\nL’aide devra être versée aux pompes funèbres.\n\n13/05/2025 : Transmission du RIB de PFI au CNAS','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','','000','','PAUCHET LUDOVIC','','CNAS - DECES','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(25,'07/11/2024',0,'CAJ','Demande de l’agent','0.00','Suite à ses pathologies l&rsquo;agent souhaite un aménagement de son poste de travail.\nElle ne bénéficie pas d&rsquo;une RQTH. La collectivité ne peut pas prétendre à une aide du FIPHFP.\n\nCommande d&rsquo;une souris Trackball et d&rsquo;une chaise adaptée après demandes de 3 devis.\n\nLivraison de la chaise à l&rsquo;hôtel de ville. Demande de transport vers les ACM auprès des ST.\n\nL&rsquo;aménagement du bureau nécessite une modification.\nVérification de la disponibilité d&rsquo;un bureau aux ST.\nDemande d&rsquo;intervention auprès des ST pour retirer l&rsquo;ancien mobilier et installer le nouveau.\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','','000','','MONFLIER FLORENCE','','ANALYSE DE POSTE','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(26,'01/04/2025',0,'SENOU','Demande de la médecine de prévention','0.00','Etude de poste :\nNécessité de matériel (clavier, souris, chaise, repose pieds, bras articulé, porte documents)\nMatériel en prêt par la société Bureau Ergonomie\nNécessité de changer le bureau\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','CAP EMPLOI LITTORAL','0.00','','0.00','','0.00','','0.00','0','Faire une demande FIPHFP','000','','MARETTE STÉPHANIE','1','ANALYSE DE POSTE','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(27,'03/07/2025',0,'Ecole/Entretien','Demande de la médecine de prévention','0.00','-27/06, 30/06, 01/07 : Mail Cap emploi. Organisation RV pour analyse de poste\n\nAnalyse de poste à l&rsquo;école St Exupéry\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','CAP EMPLOI LITTORAL','0.00','Demande de la médecine de prévention','0.00','','0.00','','0.00','0','','000','','VAUTIER ROXANE','','ANALYSE DE POSTE','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(28,'14/10/2024',0,'Administratif Population','Demande de l’agent','0.00','Achat d’une souris Trackball et d’une chaise ergonomique\n\nLe renfort dorsal de la chaise n’est pas réglable et gène l’agent dont la morphologie de convient pas.\n\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00','0','','000','','GRARE NATHALIE','','ANALYSE DE POSTE','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(29,'22/09/2025',0,'ACM','','0.00','22/09/2025 : Réception du devis de chez Entendre suite réception de la notification d’accord par la MDPH\n\n23/09/2025 : Réception de la notification MDPH \n\n24/09/2025 : Réception du bulletin de paie et de l’arrêté\n\n25/09/2025 : Instruction de la demande d’aide FIPHFP\n\n30/10/2025 : Demande état d&rsquo;avancement du dossier par l&rsquo;agent car doit changer de mutuelle au 01.01.2026','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','Demande aide FIPHFP','0.00','','0.00','','0.00','0','','000','','PARIS SANDIE','','FIPHFP - Prothèse auditives','','0','0.0','','0','0.00','','0','0.00','','0','0.00','','0.00','0.00','0.00','Céline GOSSE'),(30,'05/08/2025',0,'Finances','Déblocage avoir','0.00','05/08/2025 Appel du CNAS 2 avoirs doivent être débloqués (212€ du 24.11.2023 et 868€ du 21.01.2025)\n\nDemande des avoirs au service finances pour effectuer la demande de déblocage au CNAS par mail\n\nRéception de l&rsquo;avoir de 2025 par Sandrine Noël\nDemande de l&rsquo;avoir de 2023 à faire au CNAS\n\n21/08/2025 : Envoi des avoirs et du RIB de la collectivité au Cnas par mail \n\n10/09/2025 : Paiement des avoirs pour un total de 1080€','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','','','','AVOIRS','','CNAS','','','','','','','','','','','','','','1080.00','','0.00','Céline GOSSE'),(31,'24/09/2025',0,'Espaces Verts','Chaussures de sécurité','0.00','\n\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','Suite à une douleur au talon, l&rsquo;agent a adopté une mauvaise posture, bascule du bassin qui a occasionné une douleur au côté gauche.\nPubalgie.\nL&rsquo;agent a informé la médecine de prévention et le responsable de service sur la nécessité d','','','LEDEZ GRÉGORY','','EPI','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(32,'26/09/2025',0,'','Prime CNAS médaillés','0.00','Réception par Sylvia des diplômes afin d’instruire les demande de prime au CNAS\n\nDavy JEANSON et Mickaël HANQUEZ : vont faire la demande seuls\n\nDossier de Mesdames LUCE et BOULANGER envoyés le 25/11/25\n\n\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','Valérie DUQUENOY : Message répondeur\nMickaël HANQUEZ : Va faire la demande seul\nDavy JEANSON : Va faire la demande seul\nLaurence LUCE : Message - Demande faite par Laurence Debove\nJérôme MARLIERE : Va faire la demande seul\nChristèle AGNIERAY : Dossi','','','MÉDAILLÉS 2025','','CNAS','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(33,'26/09/2025',0,'Espaces Verts','Demande de bouchons moulés','0.00','','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','','','','HEDIN JEAN LUC','','EPI','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(34,'06/10/2025',0,'Crèche','Anomalie sur sabot','0.00','- 02/10/2025 Mail de Karine Landry : Anomalie sur sabot.\n- 06/10/2025 : Mail Protecthoms afin de signaler le problème. En attente de retour.\n- 07/10/2025 : Retour de la paire défectueuse en mairie par Mme Landry\nProblème signalé sur les polaires ”Hommes”. La taille ne correspond pas. Ils seront retournés à Protecthoms.\n- 09/10/25 : Appel à G. Beuvelet : Va se rendre à la crèche le 10.10 pour reprendre les EPI qui ne conviennent pas.\n- 10/10/25 : Appel de G. Beuvelet (message répondeur) : Ne peut pas reprendre les sabots car il s’agit de ”Divers”\n- 14/10/25 : Demande de contact à G. Beuvelet\n- 27/10/25 : Mail de K. Landry : EPI non repris\n- 30/10/2025 : Mail à G. Beuvelet pour reprise\n- 12/11/2025 : Réponse de G. Beuvelet. Passera le 14/11/2025 matin.','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','','','','CRÈCHE','','EPI','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(35,'06/10/2025',0,'Techniques','Renouvellement de RQTH\r\n','0.00','Aide pour compléter le dossier de renouvellement de RQTH\n\nEnvoi du dossier le 23 10 2025\n\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','','','','HOCQ JÉRÈMY','','','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(36,'09/10/2025',0,'Ecole/Entretien','Connexion espace adhérent','0.00','L&rsquo;agent ne parvient pas à se connecter\nModification du mot de passe\nConnexion impossible à l&rsquo;espace adhérent','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','','','','DEGARDIN STÉPHANIE','','CNAS','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(37,'13/10/2025',0,'Crèche','Alerte état de santé','0.00','10/10/2025 : \n- Mail directrice de la crèche et Isabelle Calon : L’agent ne va pas bien.\n\n13/10/2025 : \nIsabelle Calon Voir si l’agent peut bénéficier et serait d’accord bénéficier d’une retraite progressive pour la soulager\n\nRendez vous crèche avec Mme Goujon le 15/10/2025\n','0.00','LANDRY KARINE','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','','','','','','','','GOUJON SYLVIE','','','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(38,'13/10/2025',0,'Ecole/Entretien','Prise en charge de la MP','0.00','13/10/2025 : Dossier CPAM à compléter pour le 14/10/2025 afin de statuer sur l&rsquo;employeur devant assumer la prise en charge de la MP\n\n14/10/2025 : Dossier complété pour I. Calon','0.00','CALON ISABELLE','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','','','','','','','','VIGREUX HÉLÈNE','','','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(39,'09/10/2025',0,'','CNAS','0.00','L&rsquo;agent a modifié son RIB mais le dossier est toujours en cours de traitement.\nElle souhaite faire des demandes de prestation mais ne peut, de ce fait pas.\nMail envoyé au CNAS','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','','','','DELPLACE JESSICA','','CNAS - DIVERS DEMANDES','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(40,'09/10/2025',0,'Administratif Techniques','Connexion CNAS','0.00','L&rsquo;agent ne parvient pas à se connecter à son espace adhérent.\nMail au CNAS afin de demander la modification de l&rsquo;adresse mail','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','','','','CARPE JEAN PIERRE','','CNAS - DIVERS DEMANDES','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(41,'14/10/2025',0,'Sports','Accident de service','0.00','Déclaration d’accident de service du 13.10.2025\n\n15/10/2025 : \nSignature de la déclaration d&rsquo;accident par l&rsquo;agent (Vu Isabelle CALON signature OK par C. GOSSE) \nRemise du bon de prise en charge Sofaxis','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','','','','BOUR SYLVAIN','','ACCIDENT DE TRAVAIL','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(42,'14/10/2025',0,'','Connexion CNAS','0.00','Problème de connexion à l&rsquo;espace adhérent CNAS\nMise à jour des données d&rsquo;authentification effectuée.','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','','','','JENNEQUIN CARINE','','CNAS - DIVERS DEMANDES','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(43,'15/10/2025',0,'Sports','Organisation de travail','0.00','L’agent a été informé ce jour par sa collègue qu’elle n’intervient plus pour l’entretien le samedi.\nIl aurait été préférable d&rsquo;échanger sur cette nouvelle organisation avec tous les agents qui interviennent sur ce lieu.\nL’agent pense que cette organisation de travail ne va pas convenir avec l’occupation des lieux.\n\nVu I. Calon, Laurie H a validé cette organisation.','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','','','','BOUR SYLVAIN','','','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(44,'16/10/2025',0,'Sports','Mal être au travail','0.00','Souffrance psychologique et s’effondre rapidement après quelques minutes de discussion.\nRéférente Sport santé et Handi sport, elle intervient également pour les séances de sport sur ordonnance et mène d’autres projets.\nRessent une dévalorisation de son travail, une minimisation de ses compétences, car elle n’a pas eu, comme ses deux autres collègues, l’augmentation de son IFSE.\n\nElle souhaite un entretien avec Monsieur le Maire\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','','','','DUMONT DELPHINE','','','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(45,'14/10/2025',0,'','Prime retraite CNAS','0.00','Demande de prime retraite CNAS à instruire\nTransmission de la liste des documents à fournir\n\n16/10/2025 :\nDocuments collectés par l’agent\nDemande d’attestation employeur','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','Demande de l’agent','0.00','','','','','','','','','LACROIX THIERRY','','CNAS - Prime retraite','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(46,'16/10/2025',0,'Ecole/Entretien','Trousse de secours','0.00','Appel Sandrine Gricourt :\nEnfant blessé. Absence de grande compresse.\nRéponse apportée : les trousses de secours mises à disposition sont pour les agents de la collectivité. Il est nécessaire de vérifier si ce n&rsquo;est pas l&rsquo;éducation nationale qui doit fournir le matériel de secours nécessaires pour les enfants\n\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','','','','ECOLE ST EXUPÉRY','','','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(47,'22/10/2025',0,'Ecole/Entretien','','0.00','Pb de connexion CNAS\nModif du mot de passe\nAppel Cnas NE : site en maintenance\nFaire un nouvel essai le 23.10\n\n23.10 : Nouvel essai : site en maintenance\n\n30.10.25 : Modif Adresse mail de l’agent\nRenseignements prestation permis enfant + doit venir faire la demande de rentrée scolaire','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','','','','LASSALLE MICHELE','','CNAS','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(48,'22/10/2025',0,'','','0.00','Pb de connexion Cnas\nRetraité - Plus de droit','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','','','','GEST DIDIER','','CNAS','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(49,'30/10/2025',0,'CAJ','Exercice d’évacuation','0.00','30/10/2025 : Mail de Marc Baheux pour réalisation d&rsquo;un exercice d&rsquo;évacuation au CAJ\nMail envoyé au CdG62 pour renseignements\n14/11/2025 : Demande de rendez vous au CAJ pour groupe de travail \n18/11/2025 : Groupe de travail Exercice Evacuation','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','','','','CAJ','','','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(50,'24/11/2025',0,'[POLE ACJS','Vieillissement des éducateurs ','0.00','25/11/25 :\nEnvoi mail à S. Carlu et I. Calon avec documentation et recommandation formation PRAP','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','Apporter à la responsable RH de la ville de Le Portel des éléments concernant les actions qui peuvent être menées pour les éducateurs de la piscine Océane','','','SILPO','','','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(51,'13/01/2026',0,'','Actualisation 2026','0.00','- Demande au CCAS et RH mairie de la base de données agents titulaires mise à jour au 01 01 26.\n\n15/01/2026 :\nSuite à réception de la base des agents titulaires du CCAS et les informations fournies par le service RH :\n- envoi au CNAS de la base agents mise à jour \n- réception du lien sécurisé et mot de passe du Cnas pour dépôt du fichier\n- transfert du fichier\n\n16.01.2026 :\n- Appel du Cnas : informations sur les changements d’adresse à ne pas modifier (doit être fait uniquement par l’agent)\n- Modification et envoi du nouveau fichier\n- Validation de l’actualisation 2026 par le Cnas','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','','','','ACTUALISATION 2026','','CNAS','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(52,'12/01/2026',0,'Ecole/Entretien','Devis chariot ménage','0.00','Suite à mon intervention à la salle Gambart en 2025, 3 devis et fiches techniques ont été demandés par Hélène DECHAMPS et transmis à M. Baillard, I. Hagneré, S. Carlu et I. Calon le 21.07.2025.\n\nNouvel envoi à Isabelle HAGNERE le 12 01 2026.','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','','','','','','','','SALLE GAMBART','','','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(53,'15/01/2026',0,'','','0.00','10h - Webinaire CPAM\nAccompagnement des entreprises sur les dispositifs Prévention de la Désinsertion Professionnelle\n','0.00','','0.00','','0.00','','0.00','','','','','','Eviter l&rsquo;inaptitude ou la perte d&rsquo;emploi grâce à plusieurs acteurs (médecin, médecin conseil, employeur, CPAM, médecin du travail, Agefiph, Mdph et Mda, Cap emploi.\n\nPlusieurs dispositifs : essai encadré, visite de pré reprise, rendez v','','','AGENTS NON TITULAIRES','','ANALYSE DE POSTE','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(54,'27/01/2026',0,'[POLE TECHNIQUE]','Entretien des EPI','0.00','27/01/26 :\nRéception de Davy Jeanson et Julien Lebas\nSollicitent des chaussures adaptées pour le poste en plantation\nNécessité d’installer une machine à laver à la ferme Ravel \n\n28/01/26 :\nEnvoi de mail à JM Tartare, L. Caron, D. Jeanson, S. Carlu et I. Calon\n\n29/01/2026 : Franck Cordier sollicite les mêmes chaussures pour lui ainsi que PM Lecompte et JL Hedin\nEn qualité d&rsquo;agent des espaces verts, souhaite savoir si la machine qu&rsquo;il devra utiliser sera celle des ST ou des EV.','0.00','','0.00','','0.00','','0.00','','','','','','L’objection du responsable de pôle est de mutualiser la machine avec les agents des services techniques et installer la machine à laver dans les bâtiments du services techniques.\n!!! Cela implique des allers retours entre les services, une survei','','','PÔLE TECHNIQUE','','','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(55,'27/01/2026',0,'','Droit à la déconnexion','0.00','La responsable de pôle de l&rsquo;agent a transmis le numéro de téléphone personnel de Madame Dumont à certaines associations et aux pratiquants.\n\nMadame DUMONT est affectée.\nLe droit à la déconnexion est clairement impliqué et il s&rsquo;agit de préserver la vie privée des agents.\n\nJ&rsquo;ai demandé à l&rsquo;agent de répondre au mail reçu en demandant à la responsable de pôle, ce qui est légitime, de ne pas transmettre son numéro personnel.','0.00','','0.00','','0.00','','0.00','','','','','','La responsable de pôle  s&rsquo;est excusée auprès de Mme Dumont','','','DUMONT DELPHINE','','','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(56,'13/01/2026',0,'Médiathèque','Demande de siège ergonomique','0.00','13/01/26 : Travail avec l&rsquo;agent pour le choix du siège le plus adapté\n\n05/02/26 : Devis Kqueo et mail S. Carlu et B. Bourgeois pour les informer du besoin\n\n19/02 : Topo envoyé à S. Carlu avec le n° du bon de commande\n17/03/26 : Appel Krista pour suite du dossier','0.00','','0.00','','0.00','','0.00','','','','','','Bon de commande : 26D000785','','','SAUVAGE KRISTA','','','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(57,'02/04/2026',0,'[CENTRE JACQUE BREL]','','0.00','02/04/2026 :\nDemande de prime retraite CNAS\nDocuments manquants : Attestation employeur et arrêté\nAppel Isa H : Attestation en attente de signature M. Le Maire et envoi de l&rsquo;arrêté par mail\n\nAppel de l&rsquo;agent l&rsquo;après midi : ne parvient pas à se connecter à son compte. \nMail Cnas : Résiliation au 31 12 2026. Il ne s&rsquo;agit que d&rsquo;un &rdquo;bug&rdquo;\n\n07/04/2026 : Réception de l&rsquo;attestation employeur par Isa H.\nDemande de prime CNAS faite sur l&rsquo;espace adhérent de l&rsquo;agent.\n','0.00','','0.00','','0.00','','0.00','','','','','','','','','VASSEUR VALÉRIE','','CNAS - Prime retraite','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(58,'01/04/2026',0,'','','0.00','L&rsquo;agent s&rsquo;est rendu à la médecine de prévention.\nElle doit utiliser une chaise haute pour donner à manger aux enfants.\nDemande d&rsquo;acquisition faite auprès de M. Baillard\nVérification de la fiche de visite : rien n&rsquo;est mentionné.\n\n02/04/26 :\nDemande de modification de la fiche de visite auprès de G. Vialet. Réception et transmission à M. Baillard.\n\n03/04/26 : Demande de précision de M. Baillard qui s&rsquo;étonne que Mmes Fourcroy et Flahaut ne soient pas prévenues de ce besoin.\nS&rsquo;agit t&rsquo;il d&rsquo;une chaise haute pour l&rsquo;enfant ou pour l&rsquo;agent ?\nRéponse apportée le 07/04/26\n','0.00','','0.00','','0.00','','0.00','','','','','','','','','CARLU VALÉRIE','','Demande d’équipement/matériel','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(59,'',0,'','','0.00','','0.00','','0.00','','0.00','','0.00','','','','','','','','','GERME MYRIAM','','CNAS - Prime retraite','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(60,'',0,'','','0.00','','0.00','','0.00','','0.00','','0.00','','','','','','','','','BOUCHONS D OREILLES','','EPI','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(61,'',0,'','','0.00','','0.00','','0.00','','0.00','','0.00','','','','','','','','','FORMATION HYGIENE ALIMENTAIRE','','','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(62,'',0,'','','0.00','','0.00','','0.00','','0.00','','0.00','','','','','','','','','DELATTRE STEEVE','','','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(63,'',0,'','','0.00','','0.00','','0.00','','0.00','','0.00','','','','','','','','','CORDIER FRANCK','','','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(64,'',0,'','','0.00','','0.00','','0.00','','0.00','','0.00','','','','','','','','','GEL MANAGERS','','','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(65,'02/04/2026',0,'Crèche','','0.00','Lors de mon passage à la crèche l’agent m’a fait constater que le lave-vaisselle nécessitait un entretien (notamment pour le sel).\nElle n’arrive pas à joindre le technicien ce qui lui occasionne un stress car elle craint une panne.\nElle a contacté Dimitri Caffier qui ne peut pas intervenir.\nJ’ai téléphoné ce jour au magasin (03 21 80 63 24 - Boulevard Daunou) et l’entretien va être fait (compris apparemment dans la prestation lors de l’achat).\n','0.00','','0.00','','0.00','','0.00','','','','','','L&rsquo;agent me fait part également de son souhait de voir son contrat en CDD, qui est renouvelé depuis plusieurs années évoluer.\n\n03/04/2026 : Mail de M. Baillard m’informant de la mise en place d’une ”direction par intérim” pour gérer les','','','BRULIN CÉCILE','','Demande d’équipement/matériel','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(66,'02/04/2026',0,'Techniques','','0.00','L’agent bénéficie de chaussures qui ne sont pas adaptées à sa taille.\nIl est nécessaire de lui commander des chaussures Mercury en taille 41.\n\nMail à JMT et JP Carpe sollicitant la commande.','0.00','','0.00','','0.00','','0.00','','','','','','','','','ARNOUT VINCENT','','EPI','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE'),(67,'',0,'','','0.00','','0.00','','0.00','','0.00','','0.00','','','','','','','','','IIHIH','','','','','','','','','','','','','','','','0.00','','0.00','Céline GOSSE');
/*!40000 ALTER TABLE `inter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inter_ok`
--

DROP TABLE IF EXISTS `inter_ok`;
CREATE TABLE `inter_ok` (
  `id` int(11) NOT NULL auto_increment,
  `date` varchar(10) collate utf8_unicode_ci default NULL,
  `heure` int(11) default NULL,
  `service` varchar(100) collate utf8_unicode_ci default NULL,
  `panne_annonce` longtext collate utf8_unicode_ci,
  `cout_matos` decimal(10,2) default NULL,
  `inter_effect` varchar(1000) collate utf8_unicode_ci default NULL,
  `duree` decimal(10,2) default NULL,
  `intervenant` varchar(1000) collate utf8_unicode_ci default NULL,
  `taux_intervenant` decimal(10,2) default NULL,
  `intervenant2` varchar(60) collate utf8_unicode_ci default NULL,
  `taux_intervenant2` decimal(10,2) default NULL,
  `intervenant3` varchar(60) collate utf8_unicode_ci default NULL,
  `taux_intervenant3` decimal(10,2) default NULL,
  `intervenant4` varchar(255) collate utf8_unicode_ci default NULL,
  `taux_intervenant4` decimal(10,2) default NULL,
  `intervenant5` varchar(60) collate utf8_unicode_ci default NULL,
  `taux_intervenant5` decimal(10,2) default NULL,
  `cout_intervention` int(11) default NULL,
  `observation` varchar(255) collate utf8_unicode_ci default NULL,
  `date_enregistrer` date default NULL,
  `date_terminer` varchar(10) collate utf8_unicode_ci default NULL,
  `user_inter` varchar(60) collate utf8_unicode_ci default NULL,
  `urgence` varchar(5) collate utf8_unicode_ci default NULL,
  `type` varchar(60) collate utf8_unicode_ci default NULL,
  `matos1` varchar(60) collate utf8_unicode_ci default NULL,
  `quantite1` int(11) default NULL,
  `prix1` decimal(10,2) default NULL,
  `matos2` varchar(60) collate utf8_unicode_ci default NULL,
  `quantite2` int(11) default NULL,
  `prix2` decimal(10,2) default NULL,
  `matos3` varchar(60) collate utf8_unicode_ci default NULL,
  `quantite3` int(11) default NULL,
  `prix3` decimal(10,2) default NULL,
  `matos4` varchar(60) collate utf8_unicode_ci default NULL,
  `quantite4` int(11) default NULL,
  `prix4` decimal(10,2) default NULL,
  `matos5` varchar(60) collate utf8_unicode_ci default NULL,
  `quantite5` int(11) default NULL,
  `prix5` decimal(10,2) default NULL,
  `taux_total` decimal(10,2) default NULL,
  `par` varchar(60) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `inter_ok`
--

LOCK TABLES `inter_ok` WRITE;
/*!40000 ALTER TABLE `inter_ok` DISABLE KEYS */;
INSERT INTO `inter_ok` VALUES (1,'28/02/2025',8,'Techniques','Demande aide FIPHFP','0.00','- 28/02/2025 : Instruction du dossier FIPHFP \n- Transmission des documents nécessaires\n- Demande des décomptes Mutuelle et Sécurité Sociale à l’agent\n- 28/08/2025 : Transmission des pièces manquantes\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'Réf : 01AKC791250228105330','0000-00-00','','DUCLOY CHRISTOPHE','','FIPHFP - Prothèse auditives','',0,'1194.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(2,'20/02/2025',10,'Ecole/Entretien','Demande de la médecine de prévention','0.00','- Etude de poste \n- Besoin de chaise adaptée petite enfance qui sera laissé en test par la société Auptinov\n- Demande de transport vers l’école Prévert','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','CAP EMPLOI LITTORAL','0.00','','0.00','','0.00','','0.00',0,'Dossier FIPHFP à constituer','0000-00-00','','CARPE CHRISTÈLE','','ANALYSE DE POSTE','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(3,'06/02/2025',10,'Ecole/Entretien','Demande aide FIPHFP','0.00','- 06/02/2025 : Instruction du dossier FIPHFP \n- Transmission des documents nécessaires\n- Transmission des pièces manquantes \n- 19/06/25 : envoi de la facture acquittée','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'Réf : 01AKC791250206103458','0000-00-00','','CARPE CHRISTÈLE','','FIPHFP - Adaptation de poste','',0,'208.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(4,'20/02/2025',0,'Ecole/Entretien','Demande de la médecine de prévention','0.00','- Etude de poste \n- Besoin de chaise adaptée petite enfance qui sera laissé en test par la société Auptinov\n- Commande d’une table à langer chez Wesco\n- Réception du matériel Wesco à l’hôtel de ville\n- Demande de transport vers l’école Prévert','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00',0,'Dossier FIPHFP à constituer','0000-00-00','','VAUTIER MARIE PAULE','','ANALYSE DE POSTE','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(5,'06/02/2025',0,'Ecole/Entretien','Demande aide FIPHFP','0.00','- 06/02/2025 : Instruction du dossier FIPHFP pour l&rsquo;achat d&rsquo;un siège adapté et d&rsquo;une table à langer\n- Transmission des documents nécessaires\n- Transmission des pièces manquantes\n- 03/07/2025 : Envoi de la facture acquittée','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'Réf : 01AKC791250206112017','0000-00-00','','VAUTIER MARIE PAULE','','FIPHFP - Adaptation de poste','',0,'1072.68','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(6,'15/07/2025',0,'Espaces Verts','Dossier papier','0.00','Constitution du dossier ”papier”\nEnvoi du dossier\n15/09/25 : Entretien agent, rejet du dossier, nouvelle demande\n22/09/25 : Demande de rendez vous afin de finaliser le dossier','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'','0000-00-00','','BLOQUEL DIDIER','','CNAS - Prime retraite','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(7,'12/03/2025',0,'Ecole/Entretien','Demande aide FIPHFP','0.00','- 13/03/2025 : Instruction du dossier FIPHFP \n- Transmission des documents nécessaires\n- 05/09/2025 : Transmission des pièces manquantes','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'Réf : 01AKC791250312113721','0000-00-00','','HENRY NATACHA','','FIPHFP - Adaptation de poste','',0,'467.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(8,'15/10/2024',0,'Ecole/Entretien','Demande de la médecine de prévention','0.00','- Etude de poste \n- Suite demande de 3 devis, commande de siège adapté chez Bureau Vallée\n- Commande d’une table à langer chez Wesco\n- Réception du matériel à l’hôtel de ville\n- Demande de transport vers l’école Kergomard auprès des ST\n- 15/07/2025 :  demande de tapis à langer pour la table\n- Demande de 3 devis pour les 2 tables achetées chez Wesco','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','CAP EMPLOI LITTORAL','0.00','','0.00','','0.00','','0.00',0,'Dossier FIPHFP à constituer','0000-00-00','','HENRY NATACHA','','ANALYSE DE POSTE','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(9,'06/11/2024',0,'Crèche','Demande aide FIPHFP','0.00','- 06/11/2024 : Instruction du dossier FIPHFP \n- Transmission des documents nécessaires\n- 08/04/2025 : Transmission des pièces manquantes\n- 11/09/2025 : Versement de l’aide','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'Réf : 01AKC791241106081322','0000-00-00','','LAVERDURE GÉRALDINE','','FIPHFP - Adaptation de poste','',0,'1370.80','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(10,'15/02/2024',0,'Crèche','Demande de la médecine de prévention','0.00','- Etude de poste. Besoin d’une chaise, d’un repose pieds, souris, porte documents.\nRemplacement de la table informatique nécessaire.\n- Réception du matériel adapté en prêt par Auptinov.\n- Evaluation du matériel par l’agent\n- Commande du matériel\n- Changement du mobilier de bureau\n- Plan sur site avec LBS\n- Proposition de devis ','0.00','','0.00','','0.00','','0.00','','0.00','','0.00',0,'','0000-00-00','','LAVERDURE GÉRALDINE','','ANALYSE DE POSTE','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(11,'07/10/2024',0,'Crèche','Demande de la médecine de prévention','0.00','- Etude de poste \n- Proposition de matériel adapté et de modification de l’espace de travail\n- Aménagements fait par les services techniques\n- Aide humaine ','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','CAP EMPLOI LITTORAL','0.00','','0.00','','0.00','','0.00',0,'','0000-00-00','','PAINSET DELPHINE','','ANALYSE DE POSTE','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(12,'18/09/2025',0,'Crèche','Demande aide FIPHFP','0.00','Demande à effectuer','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'','0000-00-00','','PAINSET DELPHINE','1','FIPHFP - Adaptation de poste','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(13,'04/12/2023',0,'Espaces Verts','Demande aide FIPHFP','0.00','- 04/12/2023: Instruction du dossier FIPHFP \n- Transmission des documents nécessaires\n- 09/05/2024 : Transmission des pièces manquantes','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'Réf : 01AKC791231204085635','0000-00-00','','NOEL PATRICK','','FIPHFP - Prothèse auditives','',0,'1290.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(14,'13/11/2023',0,'Techniques','Demande aide FIPHFP','0.00','- 13/11/2023 : Instruction du dossier FIPHFP \n- Transmission des documents nécessaires\n- 12/04/2024 : Transmission des pièces manquantes','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'Réf : 01AKC791231113165712','0000-00-00','','JOIRIS FABRICE','','FIPHFP - Prothèse auditives','',0,'690.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(15,'15/05/2025',0,'Techniques','Demande aide FIPHFP','0.00','- 15/05/2025: Instruction du dossier FIPHFP \n- Transmission des documents nécessaires\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'Réf : 01AKC791250515091852','0000-00-00','','HOCQ JÉRÈMY','1','FIPHFP - Prothèse auditives','',0,'1700.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(16,'24/07/2025',0,'Espaces Verts','Dossier papier','0.00','Constitution du dossier ”papier”\nEnvoi du dossier\n15 et 16/09/25 : Entretien agent, rejet du dossier, nouvelle demande envoyée le 17/09/2025','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'','0000-00-00','','FAVREZ PHILIPPE','','CNAS - Prime retraite','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(17,'04/09/2025',0,'Espaces Verts','Dossier papier','0.00','Constitution du dossier ”papier”\nEn attente certificat administratif\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'','0000-00-00','','FOUGERAY CHRISTOPHE','','CNAS - Prime retraite','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(18,'27/05/2025',0,'Espaces Verts','Dossier papier','0.00','Constitution du dossier ”papier”\nEnvoi du dossier\n','0.00','','0.00','','0.00','','0.00','','0.00','','0.00',0,'','0000-00-00','','GAMBART PHILIPPE','','CNAS - Prime retraite','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(19,'27/05/2025',0,'Ecole/Entretien','Dossier papier','0.00','- Constitution du dossier ”papier”\n- Envoi du dossier\n- 04/09/25 : Entretien agent, rejet du dossier\n- Envoi nouvelle demande le 16/09/2025','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'','0000-00-00','','LACOUR KALIDA','','CNAS - Prime retraite','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(20,'25/08/2025',0,'Ecole/Entretien','Prime rentrée scolaire','0.00','- Demande d’aide administrative afin de solliciter la prime de rentrée scolaire au CNAS\n\nCodes erronés, pas d’accès à la boîte mail pour réinitialiser le mot de passe.\n\nNouvel entretien dans la journée : création d’un nouveau mot','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'','0000-00-00','','DUVIVIER MARJORIE','','CNAS - Rentrée scolaire','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(21,'18/09/2025',0,'Crèche','Livraison Protecthoms','0.00','- Appel Tony Pavy suite livraison Protecthoms au service scolaire\n- Vérification du bon de commande - Destinataire crèche\n- Appel ST pour demande de transport\n- Confirmation Tony Pavy du transport le 18/09 après midi ou le 19/09\n- Vu Laurent Caron : tr','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'','0000-00-00','','CRÈCHE','','EPI','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(22,'21/08/2025',0,'Ecole/Entretien','Rentrée scolaire - Séjour vacances enfant - Chèques ANCV','0.00','Demande d’aide administrative afin de solliciter plusieurs aides au CNAS\n\nDocuments manquants : Imposition 2023 en 2024 pour Monsieur et Madame\nReçus par mail\n\nDemandes faites sur le site du CNAS le 22/08/2025\n\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'','0000-00-00','','MAVAUT SÉVERINE','','CNAS - DIVERS DEMANDES','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(23,'18/09/2025',0,'Techniques','Absence de harnais nacelle','0.00','18/09/25 :\n- Besoin de harnais pour intervenir dans la nacelle.\n- Contact Protecthoms pour conseils \n- Réception de la fiche technique ”Harnais nacelle”\n- Diffusion de la fiche technique aux participants de la réunion\n- Accord par S. Carlu, par mail pour la commande \n- Réception du devis le 23/09/2025\n- Envoi du devis à JP Carpe pour BdC le 23/09/25','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'','0000-00-00','','ST - ELECTRICIENS','','EPI','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(24,'07/04/2025',0,'Espaces Verts','Décès agent','0.00','07/04/2025 : Suite décès agent, demande d’aide auprès du CNAS pour les filles de Monsieur.\nL’aide devra être versée aux pompes funèbres.\n\n13/05/2025 : Transmission du RIB de PFI au CNAS','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'','0000-00-00','','PAUCHET LUDOVIC','','CNAS - DECES','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(25,'07/11/2024',0,'CAJ','Demande de l’agent','0.00','Suite à ses pathologies l&rsquo;agent souhaite un aménagement de son poste de travail.\nElle ne bénéficie pas d&rsquo;une RQTH. La collectivité ne peut pas prétendre à une aide du FIPHFP.\n\nCommande d&rsquo;une souris Trackball et d&rsquo;une chaise adaptée après demandes de 3 devis.\n\nLivraison de la chaise à l&rsquo;hôtel de ville. Demande de transport vers les ACM auprès des ST.\n\nL&rsquo;aménagement du bureau nécessite une modification.\nVérification de la disponibilité d&rsquo;un bureau aux ST.\nDemande d&rsquo;intervention auprès des ST pour retirer l&rsquo;ancien mobilier et installer le nouveau.\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'','0000-00-00','','MONFLIER FLORENCE','','ANALYSE DE POSTE','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(26,'01/04/2025',0,'SENOU','Demande de la médecine de prévention','0.00','Etude de poste :\nNécessité de matériel (clavier, souris, chaise, repose pieds, bras articulé, porte documents)\nMatériel en prêt par la société Bureau Ergonomie\nNécessité de changer le bureau\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','CAP EMPLOI LITTORAL','0.00','','0.00','','0.00','','0.00',0,'Faire une demande FIPHFP','0000-00-00','','MARETTE STÉPHANIE','1','ANALYSE DE POSTE','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(27,'03/07/2025',0,'Ecole/Entretien','','0.00','-27/06, 30/06, 01/07 : Mail Cap emploi. Organisation RV pour analyse de poste\n\nAnalyse de poste à l’école St Exupéry\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','CAP EMPLOI LITTORAL','0.00','Demande de la médecine de prévention','0.00','','0.00','','0.00',0,'','0000-00-00','','VAUTIER ROXANE','','ANALYSE DE POSTE','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(28,'',0,'Administratif Population','Demande de l’agent','0.00','Achat d&rsquo;une souris Trackball et d&rsquo;une chaise ergonomique\n\nLe renfort dorsal de la chaise n&rsquo;est pas réglable et gène l&rsquo;agent dont la morphologie de convient pas.\n\n','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'','0000-00-00','','GRARE NATHALIE','','ANALYSE DE POSTE','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE'),(29,'22/09/2025',0,'ACM','Aide FIPHFP','0.00','22/09/2025 :Suite à la réception de la notification de la MDPH lui attribuant la RQTH, l&rsquo;agent transmet son devis de chez Entendre afin que je puisse instruire la demande d&rsquo;aide auprès du FIPHFP.','0.00','CELINE GOSSE - ASSISTANTE DE PRÉVENTION','0.00','','0.00','','0.00','','0.00','','0.00',0,'','0000-00-00','','PARIS SANDIE','','FIPHFP - Prothèse auditives','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','',0,'0.00','0.00','Céline GOSSE');
/*!40000 ALTER TABLE `inter_ok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intervenant`
--

DROP TABLE IF EXISTS `intervenant`;
CREATE TABLE `intervenant` (
  `id` int(11) NOT NULL auto_increment,
  `nom` varchar(60) collate utf8_unicode_ci NOT NULL,
  `service` varchar(60) collate utf8_unicode_ci NOT NULL,
  `taux_inter` decimal(10,2) NOT NULL default '0.00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `intervenant`
--

LOCK TABLES `intervenant` WRITE;
/*!40000 ALTER TABLE `intervenant` DISABLE KEYS */;
INSERT INTO `intervenant` VALUES (1,'CELINE GOSSE - ASSISTANTE DE PRÉVENTION','','0.00'),(2,'CAP EMPLOI LITTORAL','','0.00'),(3,'BAILLARD MARYLINE','','0.00'),(4,'CALON ISABELLE','','0.00'),(5,'LANDRY KARINE','','0.00'),(6,'HAGNERE ISABELLE','','0.00');
/*!40000 ALTER TABLE `intervenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rqth`
--

DROP TABLE IF EXISTS `rqth`;
CREATE TABLE `rqth` (
  `id` int(11) NOT NULL auto_increment,
  `agent_rqth` varchar(255) collate utf8_unicode_ci default NULL,
  `pole_service_rqth` varchar(255) collate utf8_unicode_ci default NULL,
  `emploi_rqth` varchar(255) collate utf8_unicode_ci default NULL,
  `etat_rqth` varchar(1000) collate utf8_unicode_ci default NULL,
  `date_attribution_rqth` varchar(10) collate utf8_unicode_ci default NULL,
  `date_fin_attribution_rqth` varchar(10) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rqth`
--

LOCK TABLES `rqth` WRITE;
/*!40000 ALTER TABLE `rqth` DISABLE KEYS */;
INSERT INTO `rqth` VALUES (1,'PARIS Sandie','ACM','','Attribuée','28/08/2025','31/08/2030'),(2,'CARLU Valérie','Crèche','','Attribuée','14/08/2025','31/08/2030'),(3,'CARPE Christèle','Ecole/Entretien','','Attribuée','12/01/2023','11/01/2028'),(4,'DUBOIS Corinne','Crèche','','Attribuée','23/12/2021','Définitif'),(5,'DUCLOY Christophe','Techniques','','Attribuée','13/02/2025','Définitif'),(6,'GEST Didier','Techniques','','Attribuée','28/01/2021','31/12/2025'),(7,'GORRE Michel','Espaces Verts','','A revouveler','01/05/2019','30/04/2024'),(8,'GOSSE Céline','RH','','Attribuée','14/11/2024','30/11/2027'),(9,'GOUJON Sylvie','Crèche','','Attribuée','11/01/2024','Définitif'),(10,'HENRY Natacha','Ecole/Entretien','','Attribuée','01/09/2023','31/08/2028'),(11,'HOCQ Jérèmy','Techniques','','Attribuée','09/03/2021','31/03/2026'),(12,'JOIRIS Fabrice','Techniques','','Attribuée','01/05/2022','Définitif'),(13,'LANNOY Laurent','DGS','','Attribuée','06/04/1992','Définitif'),(14,'LAVERDURE Géraldine','Crèche','','Attribuée','01/01/2022','Définitif'),(15,'MARETTE Stéphanie','SENOU','','Attribuée','26/09/2024','Définitif'),(16,'MONFLIER Florence','CAJ','','Demande en cours','En cours','En cours'),(17,'NATIER Corinne','Ecole/Entretien','','Attribuée','09/01/2025','Définitif'),(18,'PAINSET Delphine','Crèche','','Attribuée','12/09/2024','Définitif'),(19,'SAISON Pascale','PM Administratif','','Attribuée','11/08/2022','Définitif'),(20,'VAUTIER Marie Paule','Ecole/Entretien','','Attribuée','23/03/2023','Définitif'),(21,'VAUTIER Roxane','Ecole/Entretien','','Attribuée','22/06/2023','30/06/2026'),(22,'BRUNET Nancy','Ecole/Entretien','','A revouveler','07/01/2021','06/01/2026'),(23,'SAISON Dominique','Espaces Verts','','A revouveler','01/07/2019','30/06/2024');
/*!40000 ALTER TABLE `rqth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `id` int(11) NOT NULL auto_increment,
  `service` varchar(60) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'INFORMATIQUE'),(2,'SPORTS'),(3,'TECHNIQUE');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL auto_increment,
  `designation` varchar(255) collate utf8_unicode_ci default NULL,
  `prix` decimal(10,2) default NULL,
  `stock_mini` int(11) default NULL,
  `stock_reel` int(11) default NULL,
  `donnee` int(11) default NULL,
  `ref` varchar(60) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,'AGENT TECHNIQUE CATERGORIE C','10.00',0,0,0,'CAT C'),(2,'AGENT TECHNIQUE CATERGORIE B','15.00',0,0,0,'CAT B');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(60) collate utf8_unicode_ci NOT NULL,
  `password` varchar(255) collate utf8_unicode_ci NOT NULL,
  `id_profil` int(11) NOT NULL default '0',
  `nom` varchar(60) collate utf8_unicode_ci NOT NULL,
  `service` varchar(60) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin','$2y$13$6turlAnRsLae5zq0K3S4OePMI3t2mJ6HLvKxb9POZdd57IAGB5IES',2,'MARLIERE','INFORMATIQUE'),(2,'Jerome','$2y$13$GNH8NIHF/ItFFvxmdP89zeQQpAxjpqbPaFBNhaSCEgRjuAHSOfxAa',1,'MARLIERE','INFORMATIQUE'),(3,'Celine','$2y$13$BZtZQ66x9ROWoWBPAsMUP.nupwL5xKmpasvhp9.dndQs.UWABvbOu',2,'GOSSE','PRÉVENTION'),(4,'Isabelle','$2y$13$qROsF0bkZOM55bUFnuxnNeso8/e.CQ1ba8OMQrO/LQW7VAVOCVNoi',1,'CALON','RH');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visite`
--

DROP TABLE IF EXISTS `visite`;
CREATE TABLE `visite` (
  `id` int(11) NOT NULL auto_increment,
  `agent_visite` varchar(255) collate utf8_unicode_ci default NULL,
  `pole_service_visite` varchar(255) collate utf8_unicode_ci default NULL,
  `date_visite` varchar(10) collate utf8_unicode_ci default NULL,
  `observation` varchar(255) collate utf8_unicode_ci default NULL,
  `rqth_visite` varchar(10) collate utf8_unicode_ci default NULL,
  `restriction_visite` varchar(1000) collate utf8_unicode_ci default NULL,
  `user_visite` varchar(60) collate utf8_unicode_ci default NULL,
  `type` varchar(60) collate utf8_unicode_ci default NULL,
  `recommandation_visite` varchar(1000) collate utf8_unicode_ci default NULL,
  `limitation_visite` varchar(1000) collate utf8_unicode_ci default NULL,
  `temps_partiel_visite` varchar(3) collate utf8_unicode_ci default NULL,
  `tpt1_du` varchar(10) collate utf8_unicode_ci default NULL,
  `tpt1_au` varchar(10) collate utf8_unicode_ci default NULL,
  `tpt2_du` varchar(10) collate utf8_unicode_ci default NULL,
  `tpt2_au` varchar(10) collate utf8_unicode_ci default NULL,
  `tpt3_du` varchar(10) collate utf8_unicode_ci default NULL,
  `tpt3_au` varchar(10) collate utf8_unicode_ci default NULL,
  `tpt4_du` varchar(10) collate utf8_unicode_ci default NULL,
  `tpt4_au` varchar(10) collate utf8_unicode_ci default NULL,
  `qte1` int(11) default NULL,
  `qte2` int(11) default NULL,
  `qte3` int(11) default NULL,
  `qte4` int(11) default NULL,
  `emploi_visite` varchar(255) collate utf8_unicode_ci default NULL,
  `tdt_oui_non` varchar(3) collate utf8_unicode_ci default NULL,
  `travail_penche_visite` int(11) default NULL,
  `debout_visite` int(11) default NULL,
  `conduite_visite` int(11) default NULL,
  `utilisation_visite` int(11) default NULL,
  `travail_haut_visite` int(11) default NULL,
  `travail_iso_visite` int(11) default NULL,
  `travail_bas_visite` int(11) default NULL,
  `effort_visite` int(11) default NULL,
  `port` varchar(10) collate utf8_unicode_ci default NULL,
  `epi` varchar(3) collate utf8_unicode_ci default NULL,
  `epi_detail` varchar(1000) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `visite`
--

LOCK TABLES `visite` WRITE;
/*!40000 ALTER TABLE `visite` DISABLE KEYS */;
INSERT INTO `visite` VALUES (1,'MARETTE Stéphanie','Senou  ','04/03/2025','','Oui','Contre indication à la conduite automobile pour le transport de personnes\r\n','','','Aménagement de poste','','Non','','','','','','','','',0,0,0,0,'Adjoint administratif','',0,1,1,0,0,0,0,0,'','',''),(2,'LEFEBVRE Camille','Ecole/Entretien           ','25/06/2025','','Non','','','','','','','','','','','','','','',0,0,0,0,'Agent entretien','',0,0,0,0,0,0,1,0,'>=7','Non',''),(3,'MAGRIT Jovanique','CAJ  ','04/02/2025','','Non','','','','','','','','','','','','','','',0,0,0,0,'Agent administratif','',0,0,0,0,0,0,0,1,'>=7','',''),(4,'LE SCIELLOUR Sylvie','  ','14/05/2025','','Non','','','','','','Oui','','','','','','','','',0,0,0,0,'Adjoint administratif','',0,0,0,0,0,0,0,1,'>=7','',''),(5,'MERLIN Gilles','Techniques   ','03/03/2026','','Non','Poste adapté : peinture - serres','','','','','Oui','','','','','','','','',0,0,0,0,'Peintre','',0,0,0,0,0,0,0,1,'>=7','Non',''),(6,'CONDETTE Rebecca','Crèche  ','16/10/2024','','Non','','','','','','','','','','','','','','',0,0,0,0,'Agent animation','',0,0,0,0,0,0,1,0,'>=10','',''),(7,'GRARE Nathalie','Administratif Population     ','15/01/2025','','Non','Mettre à dispo une souris et un siège ergonomique','','','Aménagement de poste','','','','','','','','','','',0,0,0,0,'Adjoint administratif','',0,0,0,0,0,0,0,0,'','',''),(8,'CARON Caroline','Crèche     ','08/10/2024','','Non','Mettre à disposition une chaise haute pour être en capacité de donner les repas solides à hauteur','','','Aménagement de poste','','','','','','','','','','',0,0,0,0,'Auxiliaire de puériculture','',0,0,0,0,0,0,0,0,'','',''),(9,'ALLEAU Béatrice','Ecole/Entretien ','08/10/2024','','Non','','','','','','','','','','','','','','',0,0,0,0,'Agent entretien','',1,0,0,0,0,0,0,0,'>=10','',''),(10,'DEPERLECQUE Christèle','Ecole/Entretien ','16/07/2025','','Non','','','','','','','','','','','','','','',0,0,0,0,'Agent entretien','',1,0,0,0,0,0,0,0,'>=5','',''),(11,'MONFLIER Florence','CAJ ','05/08/2024','','En cours','Fauteuil ergonomique recommandé','','','Aménagement de poste','','','','','','','','','','',0,0,0,0,'Adjoint administratif','',0,0,0,0,0,0,0,0,'','',''),(12,'JOIRIS Fabrice','[POLE TECHNIQUE] ','05/08/2024','','Oui','EPI à adapter','','','','','','','','','','','','','',0,0,0,0,'Directeur adjoint st','',0,0,0,0,0,0,0,0,'','Oui',''),(13,'VAUTIER Roxane','Ecole/Entretien ','27/07/2024','','Oui','Eviter la classe des tout petits\r\n','','','Aménagement de poste','','','','','','','','','','',0,0,0,0,'Atsem','',1,0,0,0,0,0,0,0,'>=10','',''),(14,'VANHELLE Véronique','Crèche ','23/04/2024','','','','','','','','','','','','','','','','',0,0,0,0,'Infirmière ','',1,0,0,0,0,0,0,0,'>=7','',''),(15,'GORRE Michel','Techniques ','22/07/2025','','Oui','','','','','','','','','','','','','','',0,0,0,0,'Agent entretien cimetière','',0,0,0,0,0,1,0,1,'>=5','',''),(16,'MAGNIER Natacha','Ecole/Entretien ','10/04/2024','','Non','Limitation montée et descente escaliers','','','','','','','','','','','','','',0,0,0,0,'Agent entretien','',0,0,0,0,0,0,0,0,'>=15','',''),(17,'CAFFIER Dimitri','Techniques ','20/03/2024','','Non','Mise à dispostion de bouchons oreilles','','','','','','','','','','','','','',0,0,0,0,'Plombier chauffagiste','',0,0,0,0,0,0,0,0,'>=15','Oui',''),(18,'GOUJON Sylvie','Crèche ','17/12/2024','','Oui','','','','','','','','','','','','','','',0,0,0,0,'Auxiliaire de puériculture','',0,0,0,0,0,0,0,0,'>=5','',''),(19,'MENNEFILE Christophe','Techniques ','21/02/2024','','','','','','','','','','','','','','','','',0,0,0,0,'Agent de voierie','',1,0,0,0,0,0,0,0,'>=15','',''),(20,'DUCLOY Christophe','Techniques ','19/02/2025','','Oui','Limitation des heures supplémentaires\r\nDoit pouvoir alterner les activités\r\nPas de contre indication à la réalisation de travaux électriques','','','','','','','','','','','','','',0,0,0,0,'Gardien maison des asso','',1,0,0,0,1,0,0,0,'>=10','',''),(21,'SAISON Dominique','Espaces Verts ','11/02/2025','','Oui','','','','','','','','','','','','','','',0,0,0,0,'Jardinier','',1,0,0,0,0,0,1,0,'>=5','',''),(22,'NOEL Romaric','Espaces Verts ','24/01/2024','','Non','','','','','','','','','','','','','','',0,0,0,0,'Jardinier','',1,0,0,0,0,0,0,0,'>=15','',''),(23,'CAFFIER Anne Marie','Ecole/Entretien ','16/09/2025','','','','','','','','','','','','','','','','',0,0,0,0,'Agent entretien','',1,0,0,0,0,0,0,0,'>=7','',''),(24,'VIGREUX Hélène','Ecole/Entretien ','15/07/2025','','','Pas de mouvements répétitifs en rotation des membres supérieurs','','','','','','','','','','','','','',0,0,0,0,'Agent entretien','',0,0,0,0,0,0,1,0,'>=7','',''),(25,'CARPE Christèle','Ecole/Entretien ','17/06/2025','','Oui','','','','','','','','','','','','','','',0,0,0,0,'Atsem','',1,1,0,0,0,0,1,0,'>=7','',''),(26,'ROQUE Luis','Techniques ','18/03/2024','','Non','','','','','','','','','','','','','','',0,0,0,0,'Agent de voierie','',0,0,0,0,0,0,1,0,'>=15','',''),(27,'PAINSET Delphine','Crèche  ','10/02/2026','','Oui','MP 57A Gauche','','','Aménagement de poste','','Oui','','','','','','','','',0,0,0,0,'Agent de restauration','',0,0,0,0,0,0,1,0,'>=5','Non',''),(28,'BAILLARD Maryline','Administratif Population  ','06/01/2026','','Non','Clavier et souris ergonomique\r\nPorte document\r\nNon compatible avec MP 57B Droite','','','Aménagement de poste','','Non','','','','','','','','',0,0,0,0,'Responsable de pôle','',0,0,0,0,0,0,0,0,'','Non',''),(29,'LASSALLE Stéphanie','Ecole/Entretien ','13/01/2026','','Non','Limiter les mouvements de torsion du poignet\r\nUtiliser un chariot','','','','','Non','','','','','','','','',0,0,0,0,'Agent entretien et restauration','',0,0,0,0,0,0,0,0,'>=7','Non',''),(30,'BOUVOT Christèle','Ecole/Entretien','03/02/2026','','','','','','','','Oui','','','','','','','','',0,0,0,0,'Agent de restauration','',0,0,0,0,0,0,0,0,'>=10','Non',''),(31,'FONTAINE Marion','Ecole/Entretien','28/01/2026','','','','','','','','Oui','','','','','','','','',0,0,0,0,'Agent entretien et restauration','',1,0,0,0,0,0,0,0,'>=5','Non',''),(32,'HENRY Natacha','Ecole/Entretien','04/03/2026','','Oui','','','','','','Non','','','','','','','','',0,0,0,0,'Atsem','',0,0,0,0,0,0,0,0,'>=10','Oui',''),(33,'MAGNIER Hélène','Ecole/Entretien','04/02/2026','','','','','','','','Non','','','','','','','','',0,0,0,0,'Agent entretien et restauration','',0,0,0,0,0,0,0,0,'','Oui',''),(34,'BERNARD Mélanie','EMMD','24/02/2026','','','','','','','','Non','','','','','','','','',0,0,0,0,'Agent administratif','',0,0,0,0,0,1,0,0,'','Non',''),(35,'PARIS Sandie','ACM','10/02/2026','','Oui','','','','','','Non','','','','','','','','',0,0,0,0,'Responsable acm','',0,0,0,0,0,0,0,0,'','Non',''),(36,'NATIER Corinne','Ecole/Entretien','14/01/2026','','','','','','','','Non','','','','','','','','',0,0,0,0,'Agent entretien','',0,0,0,0,0,0,0,0,'','Non','');
/*!40000 ALTER TABLE `visite` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-20  8:39:09
