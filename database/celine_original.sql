-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Lun 20 Avril 2026 à 08:25
-- Version du serveur: 5.5.54
-- Version de PHP: 5.3.10-1ubuntu3.26

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `celine`
--

-- --------------------------------------------------------

--
-- Structure de la table `batiments`
--

CREATE TABLE IF NOT EXISTS `batiments` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `designation` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Structure de la table `fiphfp`
--

CREATE TABLE IF NOT EXISTS `fiphfp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_fiphfp` varchar(100) NOT NULL,
  `pole_fiphfp` varchar(100) NOT NULL,
  `demande_fiphfp` varchar(100) NOT NULL,
  `date_demande_fiphfp` varchar(10) NOT NULL,
  `objet_fiphfp` varchar(255) NOT NULL,
  `etat_demande_fiphfp` varchar(255) NOT NULL,
  `detail_demande_fiphfp` varchar(1000) NOT NULL,
  `montant_depense_fiphfp` int(6) NOT NULL,
  `montant_demande_fiphfp` int(6) NOT NULL,
  `montant_accorde_fiphfp` int(6) NOT NULL,
  `accord_paye_le` varchar(10) NOT NULL,
  `urgence_fiphfp` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Contenu de la table `fiphfp`
--

INSERT INTO `fiphfp` (`id`, `agent_fiphfp`, `pole_fiphfp`, `demande_fiphfp`, `date_demande_fiphfp`, `objet_fiphfp`, `etat_demande_fiphfp`, `detail_demande_fiphfp`, `montant_depense_fiphfp`, `montant_demande_fiphfp`, `montant_accorde_fiphfp`, `accord_paye_le`, `urgence_fiphfp`) VALUES
(11, 'Paris Sandie', 'ACM', '01AKC791250923112314', '23/09/2025', 'ProthÃ¨ses auditives', 'Nofitication accord de la demande', 'Entendre\nFacture acquittÃ©e transmise le 17 mars 2026', 4190, 1700, 0, '', 0),
(12, 'Henry Natacha', 'Ecole/Entretien', '01AKC791250312113721', '12/03/2025', 'AmÃ©nagement de poste', 'Notification accord de paiement', 'Chaise ergonomique (133.13)\nTable Ã  langer avec escabeau (414.90)\nPayÃ© le 05/09/2025', 549, 467, 467, '', 0),
(13, 'Ducloy Christophe', 'Techniques', '01AKC791250228105330', '28/02/2025', 'ProthÃ¨ses auditives', 'Notification accord de paiement', 'Amplifon\r\nPayÃ© le 28/08/2025', 3504, 1194, 1194, '', 0),
(14, 'Hocq JÃ©rÃ¨my', 'Techniques', '01AKC791250515091852', '15/05/2025', 'ProthÃ¨ses auditives', 'Demande de documents', '13/10/2025 : Suite appel tÃ©lÃ©phonique, rÃ©ception des dÃ©comptes de CPAM (480e) et mutuelle (1700e) par Amplifon\n14/10/2025 : Transmettre les dÃ©comptes de SÃ©curitÃ© Sociale avant le 13.11.2025 car ceux transmis ne conviennent pas.\n\nNÂ° de tÃ©lÃ©phone MAman : 0631753916\n', 3099, 1329, 1329, '', 0),
(15, 'Vautier Marie Paule', 'Ecole/Entretien', '	01AKC791250206112017', '06/02/2025', 'AmÃ©nagement de poste', 'Notification accord de paiement', 'Chaise ergonomique petite enfance (804â‚¬)\nTable Ã  langer avec escabeau (414.90â‚¬)\nPayÃ© le 03/07/2025', 1219, 1073, 1073, '', 0),
(16, 'Carpe ChristÃ¨le', 'Ecole/Entretien', '	01AKC791250206103458', '06/02/2025', 'AmÃ©nagement de poste', 'Notification accord de paiement', 'SiÃ¨ge ergonomique petite enfance\nPayÃ© le 02/07/2025', 396, 270, 208, '', 0),
(17, 'Laverdure GÃ©raldine', 'CrÃ¨che', '01AKC791241106081322', '06/11/2024', 'AmÃ©nagement de poste', 'Notification accord de paiement', 'Clavier - Souris -Repose pieds -Pose documents\r\nChaise ergonomique\r\nPayÃ© le 08/04/2025', 1524, 1371, 1371, '', 0),
(29, 'MARETTE StÃ©phanie', 'SENOU', '01AKC791251218092717', '18/12/2025', 'AmÃ©nagement de poste', 'AccusÃ© de rÃ©ception de la demande', '', 1854, 1854, 0, '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `inter`
--

CREATE TABLE IF NOT EXISTS `inter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(10) NOT NULL,
  `heure` int(5) NOT NULL,
  `service` varchar(100) NOT NULL,
  `panne_annonce` varchar(255) NOT NULL,
  `cout_matos` decimal(10,2) NOT NULL,
  `inter_effect` varchar(1000) NOT NULL,
  `duree` decimal(10,2) NOT NULL,
  `intervenant` varchar(1000) NOT NULL,
  `taux_intervenant` decimal(10,2) NOT NULL,
  `intervenant2` varchar(60) NOT NULL,
  `taux_intervenant2` decimal(10,2) NOT NULL,
  `intervenant3` varchar(60) NOT NULL,
  `taux_intervenant3` decimal(10,2) NOT NULL,
  `agent_visite` varchar(255) NOT NULL,
  `agent_rqth` varchar(255) NOT NULL,
  `pole_service_visite` varchar(255) NOT NULL,
  `pole_service_rqth` varchar(255) NOT NULL,
  `date_visite` varchar(60) NOT NULL,
  `observation` varchar(255) NOT NULL,
  `rqth_visite` varchar(3) NOT NULL,
  `restriction_visite` varchar(1000) NOT NULL,
  `user` varchar(60) NOT NULL,
  `urgence` varchar(5) NOT NULL,
  `type` varchar(60) NOT NULL,
  `recommandation_visite` varchar(1000) NOT NULL,
  `limitation_visite` varchar(1000) NOT NULL,
  `temps_partiel_visite` varchar(3) NOT NULL,
  `tpt1_du` varchar(10) NOT NULL,
  `tpt1_au` varchar(10) NOT NULL,
  `tpt2_du` varchar(10) NOT NULL,
  `tpt2_au` varchar(10) NOT NULL,
  `tpt3_du` varchar(10) NOT NULL,
  `tpt3_au` varchar(10) NOT NULL,
  `tpt4_du` varchar(10) NOT NULL,
  `tpt4_au` varchar(10) NOT NULL,
  `emploi_visite` varchar(255) NOT NULL,
  `emploi_rqth` varchar(255) NOT NULL,
  `prix1` decimal(10,2) NOT NULL,
  `etat_rqth` varchar(1000) NOT NULL,
  `taux_total` decimal(10,2) NOT NULL,
  `par` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=95 ;

--
-- Contenu de la table `inter`
--

INSERT INTO `inter` (`id`, `date`, `heure`, `service`, `panne_annonce`, `cout_matos`, `inter_effect`, `duree`, `intervenant`, `taux_intervenant`, `intervenant2`, `taux_intervenant2`, `intervenant3`, `taux_intervenant3`, `agent_visite`, `agent_rqth`, `pole_service_visite`, `pole_service_rqth`, `date_visite`, `observation`, `rqth_visite`, `restriction_visite`, `user`, `urgence`, `type`, `recommandation_visite`, `limitation_visite`, `temps_partiel_visite`, `tpt1_du`, `tpt1_au`, `tpt2_du`, `tpt2_au`, `tpt3_du`, `tpt3_au`, `tpt4_du`, `tpt4_au`, `emploi_visite`, `emploi_rqth`, `prix1`, `etat_rqth`, `taux_total`, `par`) VALUES
(6, '28/02/2025', 8, 'Techniques', 'Demande aide FIPHFP', 0.00, '- 28/02/2025 : Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n- Demande des dÃ©comptes Mutuelle et SÃ©curitÃ© Sociale Ã  lâ€™agent\n- 28/08/2025 : Transmission des piÃ¨ces manquantes\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', 'RÃ©f : 01AKC791250228105330', '000', '', 'DUCLOY CHRISTOPHE', '', 'FIPHFP - ProthÃ¨se auditives', '', '0', '119', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 1194.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(7, '20/02/2025', 10, 'Ecole/Entretien', 'Demande de la mÃ©decine de prÃ©vention', 0.00, '- Etude de poste \n- Besoin de chaise adaptÃ©e petite enfance qui sera laissÃ© en test par la sociÃ©tÃ© Auptinov\n- Demande de transport vers lâ€™Ã©cole PrÃ©vert', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, 'CAP EMPLOI LITTORAL', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', 'Dossier FIPHFP Ã  constituer', '000', '', 'CARPE CHRISTÃˆLE', '', 'ANALYSE DE POSTE', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(8, '06/02/2025', 10, 'Ecole/Entretien', 'Demande aide FIPHFP', 0.00, '- 06/02/2025 : Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n- Transmission des piÃ¨ces manquantes \n- 19/06/25 : envoi de la facture acquittÃ©e', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', 'RÃ©f : 01AKC791250206103458', '000', '', 'CARPE CHRISTÃˆLE', '', 'FIPHFP - Adaptation de poste', '', '0', '208', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 268.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(10, '20/02/2025', 0, 'Ecole/Entretien', 'Demande de la mÃ©decine de prÃ©vention', 0.00, '- Etude de poste \n- Besoin de chaise adaptÃ©e petite enfance qui sera laissÃ© en test par la sociÃ©tÃ© Auptinov\n- Commande dâ€™une table Ã  langer chez Wesco\n- RÃ©ception du matÃ©riel Wesco Ã  lâ€™hÃ´tel de ville\n- Demande de transport vers lâ€™Ã©cole PrÃ©vert', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', 'Dossier FIPHFP Ã  constituer', '000', '', 'VAUTIER MARIE PAULE', '', 'ANALYSE DE POSTE', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(11, '06/02/2025', 0, 'Ecole/Entretien', 'Demande aide FIPHFP', 0.00, '- 06/02/2025 : Instruction du dossier FIPHFP pour lâ€™achat dâ€™un siÃ¨ge adaptÃ© et dâ€™une table Ã  langer\n- Transmission des documents nÃ©cessaires\n- Transmission des piÃ¨ces manquantes\n- 03/07/2025 : Envoi de la facture acquittÃ©e', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', 'RÃ©f : 01AKC791250206112017', '000', '', 'VAUTIER MARIE PAULE', '', 'FIPHFP - Adaptation de poste', '', '0', '107', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 1073.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(13, '15/07/2025', 0, 'Espaces Verts', 'Dossier papier', 0.00, 'Constitution du dossier â€papierâ€\nEnvoi du dossier\n15/09/25 : Entretien agent, rejet du dossier, nouvelle demande\n22/09/25 : Demande de rendez vous afin de finaliser le dossier\n23/09/25 : Envoi du dossier', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', '', '000', '', 'BLOQUEL DIDIER', '', 'CNAS - Prime retraite', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(20, '12/03/2025', 0, 'Ecole/Entretien', 'Demande aide FIPHFP', 0.00, '- 13/03/2025 : Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n- 05/09/2025 : Transmission des piÃ¨ces manquantes', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', 'RÃ©f : 01AKC791250312113721', '000', '', 'HENRY NATACHA', '', 'FIPHFP - Adaptation de poste', '', '0', '467', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 467.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(21, '15/10/2024', 0, 'Ecole/Entretien', 'Demande de la mÃ©decine de prÃ©vention', 0.00, '- Etude de poste \n- Suite demande de 3 devis, commande de siÃ¨ge adaptÃ© chez Bureau VallÃ©e\n- Commande dâ€™une table Ã  langer chez Wesco\n- RÃ©ception du matÃ©riel Ã  lâ€™hÃ´tel de ville\n- Demande de transport vers lâ€™Ã©cole Kergomard auprÃ¨s des ST\n- 15/07/2025 :  demande de tapis Ã  langer pour la table\n- Demande de 3 devis pour les 2 tables achetÃ©es chez Wesco', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, 'CAP EMPLOI LITTORAL', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', 'Dossier FIPHFP Ã  constituer', '000', '', 'HENRY NATACHA', '', 'ANALYSE DE POSTE', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(23, '06/11/2024', 0, 'CrÃ¨che', 'Demande aide FIPHFP', 0.00, '- 06/11/2024 : Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n- 08/04/2025 : Transmission des piÃ¨ces manquantes\n- 11/09/2025 : Versement de lâ€™aide', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', 'RÃ©f : 01AKC791241106081322', '000', '', 'LAVERDURE GÃ‰RALDINE', '', 'FIPHFP - Adaptation de poste', '', '0', '137', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 1371.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(24, '15/02/2024', 0, 'CrÃ¨che', 'Demande de la mÃ©decine de prÃ©vention', 0.00, '- Etude de poste. Besoin dâ€™une chaise, dâ€™un repose pieds, souris, porte documents.\nRemplacement de la table informatique nÃ©cessaire.\n- RÃ©ception du matÃ©riel adaptÃ© en prÃªt par Auptinov.\n- Evaluation du matÃ©riel par lâ€™agent\n- Commande du matÃ©riel\n- Changement du mobilier de bureau\n- Plan sur site avec LBS\n- Proposition de devis ', 0.00, '', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', '', '000', '', 'LAVERDURE GÃ‰RALDINE', '', 'ANALYSE DE POSTE', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(25, '07/10/2024', 0, 'CrÃ¨che', 'AmÃ©nagement de poste', 0.00, '07/10/24 :\nEtude de poste \nProposition de matÃ©riel adaptÃ© et de modification de lâ€™espace de travail.\nLâ€™agent bÃ©nÃ©ficie de lâ€™assistance dâ€™un 2Ã¨me agent Ã  temps plein.\n\n14/10/2024 : Inventaire sur site des modifications Ã  effectuer  en interne par les services techniques avec Fabrice Joiris\n\n11/04/2025 : Achat dâ€™un marche pied\n\n07/10/2025 : \nVisite mÃ©dicale de lâ€™agent : AmÃ©nagement de poste Ã  finaliser\n\n15/10/2025 : Demande dâ€™intervention des ST\n\n16/10/2025 : \nEtude de la faisabilitÃ© dâ€™Ã©change des Ã©viers sur site avec Dimitri Caffier\nEnvoi du rapport prÃ©vention\n\n17/10/2025 : \nDemande de nouveaux devis pour les rÃ©hausses Ã©viers auprÃ¨s de Auptinov\n\n22/10/2025 : transmissions devis Desenfans M. Baillard, S. Carlu, I. Calon\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, 'CAP EMPLOI LITTORAL', 0.00, 'Demande de la mÃ©decine de prÃ©vention', 0.00, '', '0.00', '', '0.00', '0', '', '000', '', 'PAINSET DELPHINE', '', 'ANALYSE DE POSTE', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(26, '18/09/2025', 0, 'CrÃ¨che', 'Demande aide FIPHFP', 0.00, 'Demande Ã  effectuer', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', '', '000', '', 'PAINSET DELPHINE', '1', 'FIPHFP - Adaptation de poste', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(27, '04/12/2023', 0, 'Espaces Verts', 'Demande aide FIPHFP', 0.00, '- 04/12/2023: Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n- 09/05/2024 : Transmission des piÃ¨ces manquantes', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', 'RÃ©f : 01AKC791231204085635', '000', '', 'NOEL PATRICK', '', 'FIPHFP - ProthÃ¨se auditives', '', '0', '129', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(28, '13/11/2023', 0, 'Techniques', 'Demande aide FIPHFP', 0.00, '- 13/11/2023 : Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n- 12/04/2024 : Transmission des piÃ¨ces manquantes', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', 'RÃ©f : 01AKC791231113165712', '000', '', 'JOIRIS FABRICE', '', 'FIPHFP - ProthÃ¨se auditives', '', '0', '690', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(29, '15/05/2025', 0, 'Techniques', 'Demande aide FIPHFP', 0.00, '- 15/05/2025: Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires \n\n- 13/10/2025 : Transmission facture acquittÃ©e, dÃ©comptes CPAM et mutuelle\n\n-14/10/2025 : Transmettre le dÃ©compte de SÃ©curitÃ© Sociale avant le 13.11.2025\n\n- 07/11/2025 : Documents envoyÃ©s FIPHFP', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', 'RÃ©f : 01AKC791250515091852', '000', '', 'HOCQ JÃ‰RÃˆMY', '', 'FIPHFP - ProthÃ¨se auditives', '', '0', '170', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 1700.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(30, '24/07/2025', 0, 'Espaces Verts', 'Dossier papier', 0.00, 'Constitution du dossier â€papierâ€\nEnvoi du dossier\n15 et 16/09/25 : Entretien agent, rejet du dossier, nouvelle demande envoyÃ©e le 17/09/2025\n\n06/11/2025 : Nouveau rejet du dossier. 3Ã¨me demande envoyÃ©e ce jour', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', '', '000', '', 'FAVREZ PHILIPPE', '', 'CNAS - Prime retraite', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(31, '04/09/2025', 0, 'Espaces Verts', 'Dossier papier', 0.00, 'Constitution du dossier â€papierâ€\nEn attente certificat administratif\n\nEnvoi du dossier le 23 10 2025\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', '', '000', '', 'FOUGERAY CHRISTOPHE', '', 'CNAS - Prime retraite', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(32, '27/05/2025', 0, 'Espaces Verts', 'Dossier papier', 0.00, 'Constitution du dossier â€papierâ€\nEnvoi du dossier\n', 0.00, '', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', '', '000', '', 'GAMBART PHILIPPE', '', 'CNAS - Prime retraite', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(33, '27/05/2025', 0, 'Ecole/Entretien', 'Dossier papier', 0.00, '- Constitution du dossier â€papierâ€\n- Envoi du dossier\n- 04/09/25 : Entretien agent, rejet du dossier\n- Envoi nouvelle demande le 16/09/2025', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', '', '000', '', 'LACOUR KALIDA', '', 'CNAS - Prime retraite', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(34, '25/08/2025', 0, 'Ecole/Entretien', 'Prime rentrÃ©e scolaire', 0.00, '- Demande dâ€™aide administrative afin de solliciter la prime de rentrÃ©e scolaire au CNAS\n\nCodes erronÃ©s, pas dâ€™accÃ¨s Ã  la boÃ®te mail pour rÃ©initialiser le mot de passe.\n\nNouvel entretien dans la journÃ©e : crÃ©ation dâ€™un nouveau mot', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', '', '000', '', 'DUVIVIER MARJORIE', '', 'CNAS - RentrÃ©e scolaire', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(35, '18/09/2025', 0, 'CrÃ¨che', 'Livraison des EPI', 0.00, '- Appel Tony Pavy suite livraison Protecthoms au service scolaire\n- VÃ©rification du bon de commande - Destinataire crÃ¨che\n- Appel ST pour demande de transport\n- Confirmation Tony Pavy du transport le 18/09 aprÃ¨s midi\n06/10/2025 : Appel Sandrine Gricourt - Livraison des EPI crÃ¨che en mairie\nAppel Laurent Caron pour transport Mairie - CrÃ¨che', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', 'Protecthoms - Geodis', '000', '', 'CRÃˆCHE', '', 'EPI', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(36, '21/08/2025', 0, 'Ecole/Entretien', 'RentrÃ©e scolaire - SÃ©jour vacances enfant - ChÃ¨ques ANCV', 0.00, 'Demande dâ€™aide administrative afin de solliciter plusieurs aides au CNAS\n\nDocuments manquants : Imposition 2023 en 2024 pour Monsieur et Madame\nReÃ§us par mail\n\nDemandes faites sur le site du CNAS le 22/08/2025\n\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', '', '000', '', 'MAVAUT SÃ‰VERINE', '', 'CNAS - DIVERS DEMANDES', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(37, '18/09/2025', 0, 'Techniques', 'Harnais nacelle', 0.00, '18/09/25 :\n- Besoin de harnais pour intervenir dans la nacelle.\n- Contact Protecthoms pour conseils \n- RÃ©ception de la fiche technique â€Harnais nacelleâ€\n- Diffusion de la fiche technique aux participants de la rÃ©union\n- Accord par S. Carlu, par mail pour la commande\n \n23/09/2025 :\n- RÃ©ception du devis \n- Envoi du devis Ã  JP Carpe pour BdC \n\n07/10/2025 :\nEnvoi du BdC Ã  Protechoms par mail', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', '', '000', '', 'ST - ELECTRICIENS', '', 'EPI', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(38, '07/04/2025', 0, 'Espaces Verts', 'DÃ©cÃ¨s agent', 0.00, '07/04/2025 : Suite dÃ©cÃ¨s agent, demande dâ€™aide auprÃ¨s du CNAS pour les filles de Monsieur.\nLâ€™aide devra Ãªtre versÃ©e aux pompes funÃ¨bres.\n\n13/05/2025 : Transmission du RIB de PFI au CNAS', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', '', '000', '', 'PAUCHET LUDOVIC', '', 'CNAS - DECES', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(39, '07/11/2024', 0, 'CAJ', 'Demande de lâ€™agent', 0.00, 'Suite Ã  ses pathologies l&rsquo;agent souhaite un amÃ©nagement de son poste de travail.\nElle ne bÃ©nÃ©ficie pas d&rsquo;une RQTH. La collectivitÃ© ne peut pas prÃ©tendre Ã  une aide du FIPHFP.\n\nCommande d&rsquo;une souris Trackball et d&rsquo;une chaise adaptÃ©e aprÃ¨s demandes de 3 devis.\n\nLivraison de la chaise Ã  l&rsquo;hÃ´tel de ville. Demande de transport vers les ACM auprÃ¨s des ST.\n\nL&rsquo;amÃ©nagement du bureau nÃ©cessite une modification.\nVÃ©rification de la disponibilitÃ© d&rsquo;un bureau aux ST.\nDemande d&rsquo;intervention auprÃ¨s des ST pour retirer l&rsquo;ancien mobilier et installer le nouveau.\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', '', '000', '', 'MONFLIER FLORENCE', '', 'ANALYSE DE POSTE', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(40, '01/04/2025', 0, 'SENOU', 'Demande de la mÃ©decine de prÃ©vention', 0.00, 'Etude de poste :\nNÃ©cessitÃ© de matÃ©riel (clavier, souris, chaise, repose pieds, bras articulÃ©, porte documents)\nMatÃ©riel en prÃªt par la sociÃ©tÃ© Bureau Ergonomie\nNÃ©cessitÃ© de changer le bureau\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, 'CAP EMPLOI LITTORAL', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', 'Faire une demande FIPHFP', '000', '', 'MARETTE STÃ‰PHANIE', '1', 'ANALYSE DE POSTE', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(41, '03/07/2025', 0, 'Ecole/Entretien', 'Demande de la mÃ©decine de prÃ©vention', 0.00, '-27/06, 30/06, 01/07 : Mail Cap emploi. Organisation RV pour analyse de poste\n\nAnalyse de poste Ã  l&rsquo;Ã©cole St ExupÃ©ry\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, 'CAP EMPLOI LITTORAL', 0.00, 'Demande de la mÃ©decine de prÃ©vention', 0.00, '', '0.00', '', '0.00', '0', '', '000', '', 'VAUTIER ROXANE', '', 'ANALYSE DE POSTE', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(42, '14/10/2024', 0, 'Administratif Population', 'Demande de lâ€™agent', 0.00, 'Achat dâ€™une souris Trackball et dâ€™une chaise ergonomique\n\nLe renfort dorsal de la chaise nâ€™est pas rÃ©glable et gÃ¨ne lâ€™agent dont la morphologie de convient pas.\n\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '0.00', '', '0.00', '0', '', '000', '', 'GRARE NATHALIE', '', 'ANALYSE DE POSTE', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(48, '22/09/2025', 0, 'ACM', '', 0.00, '22/09/2025 : RÃ©ception du devis de chez Entendre suite rÃ©ception de la notification dâ€™accord par la MDPH\n\n23/09/2025 : RÃ©ception de la notification MDPH \n\n24/09/2025 : RÃ©ception du bulletin de paie et de lâ€™arrÃªtÃ©\n\n25/09/2025 : Instruction de la demande dâ€™aide FIPHFP\n\n30/10/2025 : Demande Ã©tat d&rsquo;avancement du dossier par l&rsquo;agent car doit changer de mutuelle au 01.01.2026', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, 'Demande aide FIPHFP', 0.00, '', '0.00', '', '0.00', '0', '', '000', '', 'PARIS SANDIE', '', 'FIPHFP - ProthÃ¨se auditives', '', '0', '0.0', '', '0', '0.00', '', '0', '0.00', '', '0', '0.00', '', 0.00, '0.00', 0.00, 'CÃ©line GOSSE'),
(54, '05/08/2025', 0, 'Finances', 'DÃ©blocage avoir', 0.00, '05/08/2025 Appel du CNAS 2 avoirs doivent Ãªtre dÃ©bloquÃ©s (212â‚¬ du 24.11.2023 et 868â‚¬ du 21.01.2025)\n\nDemande des avoirs au service finances pour effectuer la demande de dÃ©blocage au CNAS par mail\n\nRÃ©ception de l&rsquo;avoir de 2025 par Sandrine NoÃ«l\nDemande de l&rsquo;avoir de 2023 Ã  faire au CNAS\n\n21/08/2025 : Envoi des avoirs et du RIB de la collectivitÃ© au Cnas par mail \n\n10/09/2025 : Paiement des avoirs pour un total de 1080â‚¬', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'AVOIRS', '', 'CNAS', '', '', '', '', '', '', '', '', '', '', '', '', '', 1080.00, '', 0.00, 'CÃ©line GOSSE'),
(55, '24/09/2025', 0, 'Espaces Verts', 'Chaussures de sÃ©curitÃ©', 0.00, '\n\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', 'Suite Ã  une douleur au talon, l&rsquo;agent a adoptÃ© une mauvaise posture, bascule du bassin qui a occasionnÃ© une douleur au cÃ´tÃ© gauche.\nPubalgie.\nL&rsquo;agent a informÃ© la mÃ©decine de prÃ©vention et le responsable de service sur la nÃ©cessitÃ© d', '', '', 'LEDEZ GRÃ‰GORY', '', 'EPI', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(56, '26/09/2025', 0, '', 'Prime CNAS mÃ©daillÃ©s', 0.00, 'RÃ©ception par Sylvia des diplÃ´mes afin dâ€™instruire les demande de prime au CNAS\n\nDavy JEANSON et MickaÃ«l HANQUEZ : vont faire la demande seuls\n\nDossier de Mesdames LUCE et BOULANGER envoyÃ©s le 25/11/25\n\n\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', 'ValÃ©rie DUQUENOY : Message rÃ©pondeur\nMickaÃ«l HANQUEZ : Va faire la demande seul\nDavy JEANSON : Va faire la demande seul\nLaurence LUCE : Message - Demande faite par Laurence Debove\nJÃ©rÃ´me MARLIERE : Va faire la demande seul\nChristÃ¨le AGNIERAY : Dossi', '', '', 'MÃ‰DAILLÃ‰S 2025', '', 'CNAS', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(57, '26/09/2025', 0, 'Espaces Verts', 'Demande de bouchons moulÃ©s', 0.00, '', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'HEDIN JEAN LUC', '', 'EPI', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(59, '06/10/2025', 0, 'CrÃ¨che', 'Anomalie sur sabot', 0.00, '- 02/10/2025 Mail de Karine Landry : Anomalie sur sabot.\n- 06/10/2025 : Mail Protecthoms afin de signaler le problÃ¨me. En attente de retour.\n- 07/10/2025 : Retour de la paire dÃ©fectueuse en mairie par Mme Landry\nProblÃ¨me signalÃ© sur les polaires â€Hommesâ€. La taille ne correspond pas. Ils seront retournÃ©s Ã  Protecthoms.\n- 09/10/25 : Appel Ã  G. Beuvelet : Va se rendre Ã  la crÃ¨che le 10.10 pour reprendre les EPI qui ne conviennent pas.\n- 10/10/25 : Appel de G. Beuvelet (message rÃ©pondeur) : Ne peut pas reprendre les sabots car il sâ€™agit de â€Diversâ€\n- 14/10/25 : Demande de contact Ã  G. Beuvelet\n- 27/10/25 : Mail de K. Landry : EPI non repris\n- 30/10/2025 : Mail Ã  G. Beuvelet pour reprise\n- 12/11/2025 : RÃ©ponse de G. Beuvelet. Passera le 14/11/2025 matin.', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'CRÃˆCHE', '', 'EPI', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(61, '06/10/2025', 0, 'Techniques', 'Renouvellement de RQTH\r\n', 0.00, 'Aide pour complÃ©ter le dossier de renouvellement de RQTH\n\nEnvoi du dossier le 23 10 2025\n\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'HOCQ JÃ‰RÃˆMY', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(62, '09/10/2025', 0, 'Ecole/Entretien', 'Connexion espace adhÃ©rent', 0.00, 'L&rsquo;agent ne parvient pas Ã  se connecter\nModification du mot de passe\nConnexion impossible Ã  l&rsquo;espace adhÃ©rent', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'DEGARDIN STÃ‰PHANIE', '', 'CNAS', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(63, '13/10/2025', 0, 'CrÃ¨che', 'Alerte Ã©tat de santÃ©', 0.00, '10/10/2025 : \n- Mail directrice de la crÃ¨che et Isabelle Calon : Lâ€™agent ne va pas bien.\n\n13/10/2025 : \nIsabelle Calon Voir si lâ€™agent peut bÃ©nÃ©ficier et serait dâ€™accord bÃ©nÃ©ficier dâ€™une retraite progressive pour la soulager\n\nRendez vous crÃ¨che avec Mme Goujon le 15/10/2025\n', 0.00, 'LANDRY KARINE', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'GOUJON SYLVIE', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(64, '13/10/2025', 0, 'Ecole/Entretien', 'Prise en charge de la MP', 0.00, '13/10/2025 : Dossier CPAM Ã  complÃ©ter pour le 14/10/2025 afin de statuer sur l&rsquo;employeur devant assumer la prise en charge de la MP\n\n14/10/2025 : Dossier complÃ©tÃ© pour I. Calon', 0.00, 'CALON ISABELLE', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'VIGREUX HÃ‰LÃˆNE', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(65, '09/10/2025', 0, '', 'CNAS', 0.00, 'L&rsquo;agent a modifiÃ© son RIB mais le dossier est toujours en cours de traitement.\nElle souhaite faire des demandes de prestation mais ne peut, de ce fait pas.\nMail envoyÃ© au CNAS', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'DELPLACE JESSICA', '', 'CNAS - DIVERS DEMANDES', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(66, '09/10/2025', 0, 'Administratif Techniques', 'Connexion CNAS', 0.00, 'L&rsquo;agent ne parvient pas Ã  se connecter Ã  son espace adhÃ©rent.\nMail au CNAS afin de demander la modification de l&rsquo;adresse mail', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'CARPE JEAN PIERRE', '', 'CNAS - DIVERS DEMANDES', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(67, '14/10/2025', 0, 'Sports', 'Accident de service', 0.00, 'DÃ©claration dâ€™accident de service du 13.10.2025\n\n15/10/2025 : \nSignature de la dÃ©claration d&rsquo;accident par l&rsquo;agent (Vu Isabelle CALON signature OK par C. GOSSE) \nRemise du bon de prise en charge Sofaxis', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'BOUR SYLVAIN', '', 'ACCIDENT DE TRAVAIL', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(68, '14/10/2025', 0, '', 'Connexion CNAS', 0.00, 'ProblÃ¨me de connexion Ã  l&rsquo;espace adhÃ©rent CNAS\nMise Ã  jour des donnÃ©es d&rsquo;authentification effectuÃ©e.', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'JENNEQUIN CARINE', '', 'CNAS - DIVERS DEMANDES', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(69, '15/10/2025', 0, 'Sports', 'Organisation de travail', 0.00, 'Lâ€™agent a Ã©tÃ© informÃ© ce jour par sa collÃ¨gue quâ€™elle nâ€™intervient plus pour lâ€™entretien le samedi.\nIl aurait Ã©tÃ© prÃ©fÃ©rable d&rsquo;Ã©changer sur cette nouvelle organisation avec tous les agents qui interviennent sur ce lieu.\nLâ€™agent pense que cette organisation de travail ne va pas convenir avec lâ€™occupation des lieux.\n\nVu I. Calon, Laurie H a validÃ© cette organisation.', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'BOUR SYLVAIN', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(70, '16/10/2025', 0, 'Sports', 'Mal Ãªtre au travail', 0.00, 'Souffrance psychologique et sâ€™effondre rapidement aprÃ¨s quelques minutes de discussion.\nRÃ©fÃ©rente Sport santÃ© et Handi sport, elle intervient Ã©galement pour les sÃ©ances de sport sur ordonnance et mÃ¨ne dâ€™autres projets.\nRessent une dÃ©valorisation de son travail, une minimisation de ses compÃ©tences, car elle nâ€™a pas eu, comme ses deux autres collÃ¨gues, lâ€™augmentation de son IFSE.\n\nElle souhaite un entretien avec Monsieur le Maire\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'DUMONT DELPHINE', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(71, '14/10/2025', 0, '', 'Prime retraite CNAS', 0.00, 'Demande de prime retraite CNAS Ã  instruire\nTransmission de la liste des documents Ã  fournir\n\n16/10/2025 :\nDocuments collectÃ©s par lâ€™agent\nDemande dâ€™attestation employeur', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, 'Demande de lâ€™agent', 0.00, '', '', '', '', '', '', '', '', 'LACROIX THIERRY', '', 'CNAS - Prime retraite', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(72, '16/10/2025', 0, 'Ecole/Entretien', 'Trousse de secours', 0.00, 'Appel Sandrine Gricourt :\nEnfant blessÃ©. Absence de grande compresse.\nRÃ©ponse apportÃ©e : les trousses de secours mises Ã  disposition sont pour les agents de la collectivitÃ©. Il est nÃ©cessaire de vÃ©rifier si ce n&rsquo;est pas l&rsquo;Ã©ducation nationale qui doit fournir le matÃ©riel de secours nÃ©cessaires pour les enfants\n\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'ECOLE ST EXUPÃ‰RY', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(73, '22/10/2025', 0, 'Ecole/Entretien', '', 0.00, 'Pb de connexion CNAS\nModif du mot de passe\nAppel Cnas NE : site en maintenance\nFaire un nouvel essai le 23.10\n\n23.10 : Nouvel essai : site en maintenance\n\n30.10.25 : Modif Adresse mail de lâ€™agent\nRenseignements prestation permis enfant + doit venir faire la demande de rentrÃ©e scolaire', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'LASSALLE MICHELE', '', 'CNAS', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(74, '22/10/2025', 0, '', '', 0.00, 'Pb de connexion Cnas\nRetraitÃ© - Plus de droit', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'GEST DIDIER', '', 'CNAS', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(75, '30/10/2025', 0, 'CAJ', 'Exercice dâ€™Ã©vacuation', 0.00, '30/10/2025 : Mail de Marc Baheux pour rÃ©alisation d&rsquo;un exercice d&rsquo;Ã©vacuation au CAJ\nMail envoyÃ© au CdG62 pour renseignements\n14/11/2025 : Demande de rendez vous au CAJ pour groupe de travail \n18/11/2025 : Groupe de travail Exercice Evacuation', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'CAJ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(76, '24/11/2025', 0, '[POLE ACJS', 'Vieillissement des Ã©ducateurs ', 0.00, '25/11/25 :\nEnvoi mail Ã  S. Carlu et I. Calon avec documentation et recommandation formation PRAP', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', 'Apporter Ã  la responsable RH de la ville de Le Portel des Ã©lÃ©ments concernant les actions qui peuvent Ãªtre menÃ©es pour les Ã©ducateurs de la piscine OcÃ©ane', '', '', 'SILPO', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(77, '13/01/2026', 0, '', 'Actualisation 2026', 0.00, '- Demande au CCAS et RH mairie de la base de donnÃ©es agents titulaires mise Ã  jour au 01 01 26.\n\n15/01/2026 :\nSuite Ã  rÃ©ception de la base des agents titulaires du CCAS et les informations fournies par le service RH :\n- envoi au CNAS de la base agents mise Ã  jour \n- rÃ©ception du lien sÃ©curisÃ© et mot de passe du Cnas pour dÃ©pÃ´t du fichier\n- transfert du fichier\n\n16.01.2026 :\n- Appel du Cnas : informations sur les changements dâ€™adresse Ã  ne pas modifier (doit Ãªtre fait uniquement par lâ€™agent)\n- Modification et envoi du nouveau fichier\n- Validation de lâ€™actualisation 2026 par le Cnas', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'ACTUALISATION 2026', '', 'CNAS', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(78, '12/01/2026', 0, 'Ecole/Entretien', 'Devis chariot mÃ©nage', 0.00, 'Suite Ã  mon intervention Ã  la salle Gambart en 2025, 3 devis et fiches techniques ont Ã©tÃ© demandÃ©s par HÃ©lÃ¨ne DECHAMPS et transmis Ã  M. Baillard, I. HagnerÃ©, S. Carlu et I. Calon le 21.07.2025.\n\nNouvel envoi Ã  Isabelle HAGNERE le 12 01 2026.', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'SALLE GAMBART', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(79, '15/01/2026', 0, '', '', 0.00, '10h - Webinaire CPAM\nAccompagnement des entreprises sur les dispositifs PrÃ©vention de la DÃ©sinsertion Professionnelle\n', 0.00, '', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', 'Eviter l&rsquo;inaptitude ou la perte d&rsquo;emploi grÃ¢ce Ã  plusieurs acteurs (mÃ©decin, mÃ©decin conseil, employeur, CPAM, mÃ©decin du travail, Agefiph, Mdph et Mda, Cap emploi.\n\nPlusieurs dispositifs : essai encadrÃ©, visite de prÃ© reprise, rendez v', '', '', 'AGENTS NON TITULAIRES', '', 'ANALYSE DE POSTE', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(80, '27/01/2026', 0, '[POLE TECHNIQUE]', 'Entretien des EPI', 0.00, '27/01/26 :\nRÃ©ception de Davy Jeanson et Julien Lebas\nSollicitent des chaussures adaptÃ©es pour le poste en plantation\nNÃ©cessitÃ© dâ€™installer une machine Ã  laver Ã  la ferme Ravel \n\n28/01/26 :\nEnvoi de mail Ã  JM Tartare, L. Caron, D. Jeanson, S. Carlu et I. Calon\n\n29/01/2026 : Franck Cordier sollicite les mÃªmes chaussures pour lui ainsi que PM Lecompte et JL Hedin\nEn qualitÃ© d&rsquo;agent des espaces verts, souhaite savoir si la machine qu&rsquo;il devra utiliser sera celle des ST ou des EV.', 0.00, '', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', 'Lâ€™objection du responsable de pÃ´le est de mutualiser la machine avec les agents des services techniques et installer la machine Ã  laver dans les bÃ¢timents du services techniques.\n!!! Cela implique des allers retours entre les services, une survei', '', '', 'PÃ”LE TECHNIQUE', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(81, '27/01/2026', 0, '', 'Droit Ã  la dÃ©connexion', 0.00, 'La responsable de pÃ´le de l&rsquo;agent a transmis le numÃ©ro de tÃ©lÃ©phone personnel de Madame Dumont Ã  certaines associations et aux pratiquants.\n\nMadame DUMONT est affectÃ©e.\nLe droit Ã  la dÃ©connexion est clairement impliquÃ© et il s&rsquo;agit de prÃ©server la vie privÃ©e des agents.\n\nJ&rsquo;ai demandÃ© Ã  l&rsquo;agent de rÃ©pondre au mail reÃ§u en demandant Ã  la responsable de pÃ´le, ce qui est lÃ©gitime, de ne pas transmettre son numÃ©ro personnel.', 0.00, '', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', 'La responsable de pÃ´le  s&rsquo;est excusÃ©e auprÃ¨s de Mme Dumont', '', '', 'DUMONT DELPHINE', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(82, '13/01/2026', 0, 'MÃ©diathÃ¨que', 'Demande de siÃ¨ge ergonomique', 0.00, '13/01/26 : Travail avec l&rsquo;agent pour le choix du siÃ¨ge le plus adaptÃ©\n\n05/02/26 : Devis Kqueo et mail S. Carlu et B. Bourgeois pour les informer du besoin\n\n19/02 : Topo envoyÃ© Ã  S. Carlu avec le nÂ° du bon de commande\n17/03/26 : Appel Krista pour suite du dossier', 0.00, '', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', 'Bon de commande : 26D000785', '', '', 'SAUVAGE KRISTA', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(84, '02/04/2026', 0, '[CENTRE JACQUE BREL]', '', 0.00, '02/04/2026 :\nDemande de prime retraite CNAS\nDocuments manquants : Attestation employeur et arrÃªtÃ©\nAppel Isa H : Attestation en attente de signature M. Le Maire et envoi de l&rsquo;arrÃªtÃ© par mail\n\nAppel de l&rsquo;agent l&rsquo;aprÃ¨s midi : ne parvient pas Ã  se connecter Ã  son compte. \nMail Cnas : RÃ©siliation au 31 12 2026. Il ne s&rsquo;agit que d&rsquo;un &rdquo;bug&rdquo;\n\n07/04/2026 : RÃ©ception de l&rsquo;attestation employeur par Isa H.\nDemande de prime CNAS faite sur l&rsquo;espace adhÃ©rent de l&rsquo;agent.\n', 0.00, '', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'VASSEUR VALÃ‰RIE', '', 'CNAS - Prime retraite', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(85, '01/04/2026', 0, '', '', 0.00, 'L&rsquo;agent s&rsquo;est rendu Ã  la mÃ©decine de prÃ©vention.\nElle doit utiliser une chaise haute pour donner Ã  manger aux enfants.\nDemande d&rsquo;acquisition faite auprÃ¨s de M. Baillard\nVÃ©rification de la fiche de visite : rien n&rsquo;est mentionnÃ©.\n\n02/04/26 :\nDemande de modification de la fiche de visite auprÃ¨s de G. Vialet. RÃ©ception et transmission Ã  M. Baillard.\n\n03/04/26 : Demande de prÃ©cision de M. Baillard qui s&rsquo;Ã©tonne que Mmes Fourcroy et Flahaut ne soient pas prÃ©venues de ce besoin.\nS&rsquo;agit t&rsquo;il d&rsquo;une chaise haute pour l&rsquo;enfant ou pour l&rsquo;agent ?\nRÃ©ponse apportÃ©e le 07/04/26\n', 0.00, '', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'CARLU VALÃ‰RIE', '', 'Demande dâ€™Ã©quipement/matÃ©riel', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(86, '', 0, '', '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'GERME MYRIAM', '', 'CNAS - Prime retraite', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(87, '', 0, '', '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'BOUCHONS D OREILLES', '', 'EPI', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(88, '', 0, '', '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'FORMATION HYGIENE ALIMENTAIRE', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(89, '', 0, '', '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'DELATTRE STEEVE', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(90, '', 0, '', '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'CORDIER FRANCK', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(91, '', 0, '', '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'GEL MANAGERS', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(92, '02/04/2026', 0, 'CrÃ¨che', '', 0.00, 'Lors de mon passage Ã  la crÃ¨che lâ€™agent mâ€™a fait constater que le lave-vaisselle nÃ©cessitait un entretien (notamment pour le sel).\nElle nâ€™arrive pas Ã  joindre le technicien ce qui lui occasionne un stress car elle craint une panne.\nElle a contactÃ© Dimitri Caffier qui ne peut pas intervenir.\nJâ€™ai tÃ©lÃ©phonÃ© ce jour au magasin (03 21 80 63 24 - Boulevard Daunou) et lâ€™entretien va Ãªtre fait (compris apparemment dans la prestation lors de lâ€™achat).\n', 0.00, '', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', 'L&rsquo;agent me fait part Ã©galement de son souhait de voir son contrat en CDD, qui est renouvelÃ© depuis plusieurs annÃ©es Ã©voluer.\n\n03/04/2026 : Mail de M. Baillard mâ€™informant de la mise en place dâ€™une â€direction par intÃ©rimâ€ pour gÃ©rer les', '', '', 'BRULIN CÃ‰CILE', '', 'Demande dâ€™Ã©quipement/matÃ©riel', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(93, '02/04/2026', 0, 'Techniques', '', 0.00, 'Lâ€™agent bÃ©nÃ©ficie de chaussures qui ne sont pas adaptÃ©es Ã  sa taille.\nIl est nÃ©cessaire de lui commander des chaussures Mercury en taille 41.\n\nMail Ã  JMT et JP Carpe sollicitant la commande.', 0.00, '', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'ARNOUT VINCENT', '', 'EPI', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE'),
(94, '', 0, '', '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', '', '', '', '', '', '', '', 'IIHIH', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0.00, '', 0.00, 'CÃ©line GOSSE');

-- --------------------------------------------------------

--
-- Structure de la table `intervenant`
--

CREATE TABLE IF NOT EXISTS `intervenant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(60) NOT NULL,
  `service` varchar(60) NOT NULL,
  `taux_inter` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `intervenant`
--

INSERT INTO `intervenant` (`id`, `nom`, `service`, `taux_inter`) VALUES
(5, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', '', 0.00),
(6, 'CAP EMPLOI LITTORAL', '', 0.00),
(8, 'BAILLARD MARYLINE', '', 0.00),
(9, 'CALON ISABELLE', '', 0.00),
(10, 'LANDRY KARINE', '', 0.00),
(11, 'HAGNERE ISABELLE', '', 0.00);

-- --------------------------------------------------------

--
-- Structure de la table `inter_ok`
--

CREATE TABLE IF NOT EXISTS `inter_ok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(10) NOT NULL,
  `heure` int(5) NOT NULL,
  `service` varchar(100) NOT NULL,
  `panne_annonce` text NOT NULL,
  `cout_matos` decimal(10,2) NOT NULL,
  `inter_effect` varchar(1000) NOT NULL,
  `duree` decimal(10,2) NOT NULL,
  `intervenant` varchar(1000) NOT NULL,
  `taux_intervenant` decimal(10,2) NOT NULL,
  `intervenant2` varchar(60) NOT NULL,
  `taux_intervenant2` decimal(10,2) NOT NULL,
  `intervenant3` varchar(60) NOT NULL,
  `taux_intervenant3` decimal(10,2) NOT NULL,
  `intervenant4` varchar(255) NOT NULL,
  `taux_intervenant4` decimal(10,2) NOT NULL,
  `intervenant5` varchar(60) NOT NULL,
  `taux_intervenant5` decimal(10,2) NOT NULL,
  `cout_intervention` int(3) NOT NULL,
  `observation` varchar(255) NOT NULL,
  `date_enregistrer` date NOT NULL,
  `date_terminer` varchar(10) NOT NULL,
  `user` varchar(60) NOT NULL,
  `urgence` varchar(5) NOT NULL,
  `type` varchar(60) NOT NULL,
  `matos1` varchar(60) NOT NULL,
  `quantite1` int(3) NOT NULL,
  `prix1` decimal(10,2) NOT NULL,
  `matos2` varchar(60) NOT NULL,
  `quantite2` int(3) NOT NULL,
  `prix2` decimal(10,2) NOT NULL,
  `matos3` varchar(60) NOT NULL,
  `quantite3` int(3) NOT NULL,
  `prix3` decimal(10,2) NOT NULL,
  `matos4` varchar(60) NOT NULL,
  `quantite4` int(3) NOT NULL,
  `prix4` decimal(10,2) NOT NULL,
  `matos5` varchar(60) NOT NULL,
  `quantite5` int(3) NOT NULL,
  `prix5` decimal(10,2) NOT NULL,
  `taux_total` decimal(10,2) NOT NULL,
  `par` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Contenu de la table `inter_ok`
--

INSERT INTO `inter_ok` (`id`, `date`, `heure`, `service`, `panne_annonce`, `cout_matos`, `inter_effect`, `duree`, `intervenant`, `taux_intervenant`, `intervenant2`, `taux_intervenant2`, `intervenant3`, `taux_intervenant3`, `intervenant4`, `taux_intervenant4`, `intervenant5`, `taux_intervenant5`, `cout_intervention`, `observation`, `date_enregistrer`, `date_terminer`, `user`, `urgence`, `type`, `matos1`, `quantite1`, `prix1`, `matos2`, `quantite2`, `prix2`, `matos3`, `quantite3`, `prix3`, `matos4`, `quantite4`, `prix4`, `matos5`, `quantite5`, `prix5`, `taux_total`, `par`) VALUES
(6, '28/02/2025', 8, 'Techniques', 'Demande aide FIPHFP', 0.00, '- 28/02/2025 : Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n- Demande des dÃ©comptes Mutuelle et SÃ©curitÃ© Sociale Ã  lâ€™agent\n- 28/08/2025 : Transmission des piÃ¨ces manquantes\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'RÃ©f : 01AKC791250228105330', '0000-00-00', '', 'DUCLOY CHRISTOPHE', '', 'FIPHFP - ProthÃ¨se auditives', '', 0, 1194.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(7, '20/02/2025', 10, 'Ecole/Entretien', 'Demande de la mÃ©decine de prÃ©vention', 0.00, '- Etude de poste \n- Besoin de chaise adaptÃ©e petite enfance qui sera laissÃ© en test par la sociÃ©tÃ© Auptinov\n- Demande de transport vers lâ€™Ã©cole PrÃ©vert', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, 'CAP EMPLOI LITTORAL', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'Dossier FIPHFP Ã  constituer', '0000-00-00', '', 'CARPE CHRISTÃˆLE', '', 'ANALYSE DE POSTE', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(8, '06/02/2025', 10, 'Ecole/Entretien', 'Demande aide FIPHFP', 0.00, '- 06/02/2025 : Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n- Transmission des piÃ¨ces manquantes \n- 19/06/25 : envoi de la facture acquittÃ©e', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'RÃ©f : 01AKC791250206103458', '0000-00-00', '', 'CARPE CHRISTÃˆLE', '', 'FIPHFP - Adaptation de poste', '', 0, 208.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(10, '20/02/2025', 0, 'Ecole/Entretien', 'Demande de la mÃ©decine de prÃ©vention', 0.00, '- Etude de poste \n- Besoin de chaise adaptÃ©e petite enfance qui sera laissÃ© en test par la sociÃ©tÃ© Auptinov\n- Commande dâ€™une table Ã  langer chez Wesco\n- RÃ©ception du matÃ©riel Wesco Ã  lâ€™hÃ´tel de ville\n- Demande de transport vers lâ€™Ã©cole PrÃ©vert', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'Dossier FIPHFP Ã  constituer', '0000-00-00', '', 'VAUTIER MARIE PAULE', '', 'ANALYSE DE POSTE', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(11, '06/02/2025', 0, 'Ecole/Entretien', 'Demande aide FIPHFP', 0.00, '- 06/02/2025 : Instruction du dossier FIPHFP pour l&rsquo;achat d&rsquo;un siÃ¨ge adaptÃ© et d&rsquo;une table Ã  langer\n- Transmission des documents nÃ©cessaires\n- Transmission des piÃ¨ces manquantes\n- 03/07/2025 : Envoi de la facture acquittÃ©e', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'RÃ©f : 01AKC791250206112017', '0000-00-00', '', 'VAUTIER MARIE PAULE', '', 'FIPHFP - Adaptation de poste', '', 0, 1072.68, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(13, '15/07/2025', 0, 'Espaces Verts', 'Dossier papier', 0.00, 'Constitution du dossier â€papierâ€\nEnvoi du dossier\n15/09/25 : Entretien agent, rejet du dossier, nouvelle demande\n22/09/25 : Demande de rendez vous afin de finaliser le dossier', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'BLOQUEL DIDIER', '', 'CNAS - Prime retraite', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(20, '12/03/2025', 0, 'Ecole/Entretien', 'Demande aide FIPHFP', 0.00, '- 13/03/2025 : Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n- 05/09/2025 : Transmission des piÃ¨ces manquantes', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'RÃ©f : 01AKC791250312113721', '0000-00-00', '', 'HENRY NATACHA', '', 'FIPHFP - Adaptation de poste', '', 0, 467.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(21, '15/10/2024', 0, 'Ecole/Entretien', 'Demande de la mÃ©decine de prÃ©vention', 0.00, '- Etude de poste \n- Suite demande de 3 devis, commande de siÃ¨ge adaptÃ© chez Bureau VallÃ©e\n- Commande dâ€™une table Ã  langer chez Wesco\n- RÃ©ception du matÃ©riel Ã  lâ€™hÃ´tel de ville\n- Demande de transport vers lâ€™Ã©cole Kergomard auprÃ¨s des ST\n- 15/07/2025 :  demande de tapis Ã  langer pour la table\n- Demande de 3 devis pour les 2 tables achetÃ©es chez Wesco', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, 'CAP EMPLOI LITTORAL', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'Dossier FIPHFP Ã  constituer', '0000-00-00', '', 'HENRY NATACHA', '', 'ANALYSE DE POSTE', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(23, '06/11/2024', 0, 'CrÃ¨che', 'Demande aide FIPHFP', 0.00, '- 06/11/2024 : Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n- 08/04/2025 : Transmission des piÃ¨ces manquantes\n- 11/09/2025 : Versement de lâ€™aide', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'RÃ©f : 01AKC791241106081322', '0000-00-00', '', 'LAVERDURE GÃ‰RALDINE', '', 'FIPHFP - Adaptation de poste', '', 0, 1370.80, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(24, '15/02/2024', 0, 'CrÃ¨che', 'Demande de la mÃ©decine de prÃ©vention', 0.00, '- Etude de poste. Besoin dâ€™une chaise, dâ€™un repose pieds, souris, porte documents.\nRemplacement de la table informatique nÃ©cessaire.\n- RÃ©ception du matÃ©riel adaptÃ© en prÃªt par Auptinov.\n- Evaluation du matÃ©riel par lâ€™agent\n- Commande du matÃ©riel\n- Changement du mobilier de bureau\n- Plan sur site avec LBS\n- Proposition de devis ', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'LAVERDURE GÃ‰RALDINE', '', 'ANALYSE DE POSTE', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(25, '07/10/2024', 0, 'CrÃ¨che', 'Demande de la mÃ©decine de prÃ©vention', 0.00, '- Etude de poste \n- Proposition de matÃ©riel adaptÃ© et de modification de lâ€™espace de travail\n- AmÃ©nagements fait par les services techniques\n- Aide humaine ', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, 'CAP EMPLOI LITTORAL', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'PAINSET DELPHINE', '', 'ANALYSE DE POSTE', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(26, '18/09/2025', 0, 'CrÃ¨che', 'Demande aide FIPHFP', 0.00, 'Demande Ã  effectuer', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'PAINSET DELPHINE', '1', 'FIPHFP - Adaptation de poste', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(27, '04/12/2023', 0, 'Espaces Verts', 'Demande aide FIPHFP', 0.00, '- 04/12/2023: Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n- 09/05/2024 : Transmission des piÃ¨ces manquantes', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'RÃ©f : 01AKC791231204085635', '0000-00-00', '', 'NOEL PATRICK', '', 'FIPHFP - ProthÃ¨se auditives', '', 0, 1290.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(28, '13/11/2023', 0, 'Techniques', 'Demande aide FIPHFP', 0.00, '- 13/11/2023 : Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n- 12/04/2024 : Transmission des piÃ¨ces manquantes', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'RÃ©f : 01AKC791231113165712', '0000-00-00', '', 'JOIRIS FABRICE', '', 'FIPHFP - ProthÃ¨se auditives', '', 0, 690.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(29, '15/05/2025', 0, 'Techniques', 'Demande aide FIPHFP', 0.00, '- 15/05/2025: Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'RÃ©f : 01AKC791250515091852', '0000-00-00', '', 'HOCQ JÃ‰RÃˆMY', '1', 'FIPHFP - ProthÃ¨se auditives', '', 0, 1700.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(30, '24/07/2025', 0, 'Espaces Verts', 'Dossier papier', 0.00, 'Constitution du dossier â€papierâ€\nEnvoi du dossier\n15 et 16/09/25 : Entretien agent, rejet du dossier, nouvelle demande envoyÃ©e le 17/09/2025', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'FAVREZ PHILIPPE', '', 'CNAS - Prime retraite', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(31, '04/09/2025', 0, 'Espaces Verts', 'Dossier papier', 0.00, 'Constitution du dossier â€papierâ€\nEn attente certificat administratif\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'FOUGERAY CHRISTOPHE', '', 'CNAS - Prime retraite', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(32, '27/05/2025', 0, 'Espaces Verts', 'Dossier papier', 0.00, 'Constitution du dossier â€papierâ€\nEnvoi du dossier\n', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'GAMBART PHILIPPE', '', 'CNAS - Prime retraite', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(33, '27/05/2025', 0, 'Ecole/Entretien', 'Dossier papier', 0.00, '- Constitution du dossier â€papierâ€\n- Envoi du dossier\n- 04/09/25 : Entretien agent, rejet du dossier\n- Envoi nouvelle demande le 16/09/2025', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'LACOUR KALIDA', '', 'CNAS - Prime retraite', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(34, '25/08/2025', 0, 'Ecole/Entretien', 'Prime rentrÃ©e scolaire', 0.00, '- Demande dâ€™aide administrative afin de solliciter la prime de rentrÃ©e scolaire au CNAS\n\nCodes erronÃ©s, pas dâ€™accÃ¨s Ã  la boÃ®te mail pour rÃ©initialiser le mot de passe.\n\nNouvel entretien dans la journÃ©e : crÃ©ation dâ€™un nouveau mot', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'DUVIVIER MARJORIE', '', 'CNAS - RentrÃ©e scolaire', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(35, '18/09/2025', 0, 'CrÃ¨che', 'Livraison Protecthoms', 0.00, '- Appel Tony Pavy suite livraison Protecthoms au service scolaire\n- VÃ©rification du bon de commande - Destinataire crÃ¨che\n- Appel ST pour demande de transport\n- Confirmation Tony Pavy du transport le 18/09 aprÃ¨s midi ou le 19/09\n- Vu Laurent Caron : tr', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'CRÃˆCHE', '', 'EPI', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(36, '21/08/2025', 0, 'Ecole/Entretien', 'RentrÃ©e scolaire - SÃ©jour vacances enfant - ChÃ¨ques ANCV', 0.00, 'Demande dâ€™aide administrative afin de solliciter plusieurs aides au CNAS\n\nDocuments manquants : Imposition 2023 en 2024 pour Monsieur et Madame\nReÃ§us par mail\n\nDemandes faites sur le site du CNAS le 22/08/2025\n\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'MAVAUT SÃ‰VERINE', '', 'CNAS - DIVERS DEMANDES', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(37, '18/09/2025', 0, 'Techniques', 'Absence de harnais nacelle', 0.00, '18/09/25 :\n- Besoin de harnais pour intervenir dans la nacelle.\n- Contact Protecthoms pour conseils \n- RÃ©ception de la fiche technique â€Harnais nacelleâ€\n- Diffusion de la fiche technique aux participants de la rÃ©union\n- Accord par S. Carlu, par mail pour la commande \n- RÃ©ception du devis le 23/09/2025\n- Envoi du devis Ã  JP Carpe pour BdC le 23/09/25', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'ST - ELECTRICIENS', '', 'EPI', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(38, '07/04/2025', 0, 'Espaces Verts', 'DÃ©cÃ¨s agent', 0.00, '07/04/2025 : Suite dÃ©cÃ¨s agent, demande dâ€™aide auprÃ¨s du CNAS pour les filles de Monsieur.\nLâ€™aide devra Ãªtre versÃ©e aux pompes funÃ¨bres.\n\n13/05/2025 : Transmission du RIB de PFI au CNAS', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'PAUCHET LUDOVIC', '', 'CNAS - DECES', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(39, '07/11/2024', 0, 'CAJ', 'Demande de lâ€™agent', 0.00, 'Suite Ã  ses pathologies l&rsquo;agent souhaite un amÃ©nagement de son poste de travail.\nElle ne bÃ©nÃ©ficie pas d&rsquo;une RQTH. La collectivitÃ© ne peut pas prÃ©tendre Ã  une aide du FIPHFP.\n\nCommande d&rsquo;une souris Trackball et d&rsquo;une chaise adaptÃ©e aprÃ¨s demandes de 3 devis.\n\nLivraison de la chaise Ã  l&rsquo;hÃ´tel de ville. Demande de transport vers les ACM auprÃ¨s des ST.\n\nL&rsquo;amÃ©nagement du bureau nÃ©cessite une modification.\nVÃ©rification de la disponibilitÃ© d&rsquo;un bureau aux ST.\nDemande d&rsquo;intervention auprÃ¨s des ST pour retirer l&rsquo;ancien mobilier et installer le nouveau.\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'MONFLIER FLORENCE', '', 'ANALYSE DE POSTE', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(40, '01/04/2025', 0, 'SENOU', 'Demande de la mÃ©decine de prÃ©vention', 0.00, 'Etude de poste :\nNÃ©cessitÃ© de matÃ©riel (clavier, souris, chaise, repose pieds, bras articulÃ©, porte documents)\nMatÃ©riel en prÃªt par la sociÃ©tÃ© Bureau Ergonomie\nNÃ©cessitÃ© de changer le bureau\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, 'CAP EMPLOI LITTORAL', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'Faire une demande FIPHFP', '0000-00-00', '', 'MARETTE STÃ‰PHANIE', '1', 'ANALYSE DE POSTE', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(41, '03/07/2025', 0, 'Ecole/Entretien', '', 0.00, '-27/06, 30/06, 01/07 : Mail Cap emploi. Organisation RV pour analyse de poste\n\nAnalyse de poste Ã  lâ€™Ã©cole St ExupÃ©ry\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, 'CAP EMPLOI LITTORAL', 0.00, 'Demande de la mÃ©decine de prÃ©vention', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'VAUTIER ROXANE', '', 'ANALYSE DE POSTE', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(42, '', 0, 'Administratif Population', 'Demande de lâ€™agent', 0.00, 'Achat d&rsquo;une souris Trackball et d&rsquo;une chaise ergonomique\n\nLe renfort dorsal de la chaise n&rsquo;est pas rÃ©glable et gÃ¨ne l&rsquo;agent dont la morphologie de convient pas.\n\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'GRARE NATHALIE', '', 'ANALYSE DE POSTE', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(48, '22/09/2025', 0, 'ACM', 'Aide FIPHFP', 0.00, '22/09/2025 :Suite Ã  la rÃ©ception de la notification de la MDPH lui attribuant la RQTH, l&rsquo;agent transmet son devis de chez Entendre afin que je puisse instruire la demande d&rsquo;aide auprÃ¨s du FIPHFP.', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'PARIS SANDIE', '', 'FIPHFP - ProthÃ¨se auditives', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE');

-- --------------------------------------------------------

--
-- Structure de la table `inter_save`
--

CREATE TABLE IF NOT EXISTS `inter_save` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(10) NOT NULL,
  `heure` int(5) NOT NULL,
  `service` varchar(100) NOT NULL,
  `panne_annonce` varchar(255) NOT NULL,
  `cout_matos` decimal(10,2) NOT NULL,
  `inter_effect` varchar(1000) NOT NULL,
  `duree` decimal(10,2) NOT NULL,
  `intervenant` varchar(1000) NOT NULL,
  `taux_intervenant` decimal(10,2) NOT NULL,
  `intervenant2` varchar(60) NOT NULL,
  `taux_intervenant2` decimal(10,2) NOT NULL,
  `intervenant3` varchar(60) NOT NULL,
  `taux_intervenant3` decimal(10,2) NOT NULL,
  `intervenant4` varchar(255) NOT NULL,
  `taux_intervenant4` decimal(10,2) NOT NULL,
  `intervenant5` varchar(60) NOT NULL,
  `taux_intervenant5` decimal(10,2) NOT NULL,
  `cout_intervention` int(3) NOT NULL,
  `observation` varchar(255) NOT NULL,
  `date_enregistrer` date NOT NULL,
  `date_terminer` varchar(10) NOT NULL,
  `user` varchar(60) NOT NULL,
  `urgence` varchar(5) NOT NULL,
  `type` varchar(60) NOT NULL,
  `matos1` varchar(60) NOT NULL,
  `quantite1` int(3) NOT NULL,
  `prix1` decimal(10,2) NOT NULL,
  `matos2` varchar(60) NOT NULL,
  `quantite2` int(3) NOT NULL,
  `prix2` decimal(10,2) NOT NULL,
  `matos3` varchar(60) NOT NULL,
  `quantite3` int(3) NOT NULL,
  `prix3` decimal(10,2) NOT NULL,
  `matos4` varchar(60) NOT NULL,
  `quantite4` int(3) NOT NULL,
  `prix4` decimal(10,2) NOT NULL,
  `matos5` varchar(60) NOT NULL,
  `quantite5` int(3) NOT NULL,
  `prix5` decimal(10,2) NOT NULL,
  `taux_total` decimal(10,2) NOT NULL,
  `par` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Contenu de la table `inter_save`
--

INSERT INTO `inter_save` (`id`, `date`, `heure`, `service`, `panne_annonce`, `cout_matos`, `inter_effect`, `duree`, `intervenant`, `taux_intervenant`, `intervenant2`, `taux_intervenant2`, `intervenant3`, `taux_intervenant3`, `intervenant4`, `taux_intervenant4`, `intervenant5`, `taux_intervenant5`, `cout_intervention`, `observation`, `date_enregistrer`, `date_terminer`, `user`, `urgence`, `type`, `matos1`, `quantite1`, `prix1`, `matos2`, `quantite2`, `prix2`, `matos3`, `quantite3`, `prix3`, `matos4`, `quantite4`, `prix4`, `matos5`, `quantite5`, `prix5`, `taux_total`, `par`) VALUES
(6, '28/02/2025', 8, 'Techniques', 'Demande aide FIPHFP', 0.00, '- 28/02/2025 : Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n- Demande des dÃ©comptes Mutuelle et SÃ©curitÃ© Sociale Ã  lâ€™agent\n- 28/08/2025 : Transmission des piÃ¨ces manquantes\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'RÃ©f : 01AKC791250228105330', '0000-00-00', '', 'DUCLOY CHRISTOPHE', '', 'FIPHFP - ProthÃ¨se auditives', '', 0, 1194.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(7, '20/02/2025', 10, 'Ecole/Entretien', 'Demande de la mÃ©decine de prÃ©vention', 0.00, '- Etude de poste \n- Besoin de chaise adaptÃ©e petite enfance qui sera laissÃ© en test par la sociÃ©tÃ© Auptinov\n- Demande de transport vers lâ€™Ã©cole PrÃ©vert', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, 'CAP EMPLOI LITTORAL', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'Dossier FIPHFP Ã  constituer', '0000-00-00', '', 'CARPE CHRISTÃˆLE', '', 'ANALYSE DE POSTE', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(8, '06/02/2025', 10, 'Ecole/Entretien', 'Demande aide FIPHFP', 0.00, '- 06/02/2025 : Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n- Transmission des piÃ¨ces manquantes \n- 19/06/25 : envoi de la facture acquittÃ©e', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'RÃ©f : 01AKC791250206103458', '0000-00-00', '', 'CARPE CHRISTÃˆLE', '', 'FIPHFP - Adaptation de poste', '', 0, 208.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(10, '20/02/2025', 0, 'Ecole/Entretien', 'Demande de la mÃ©decine de prÃ©vention', 0.00, '- Etude de poste \n- Besoin de chaise adaptÃ©e petite enfance qui sera laissÃ© en test par la sociÃ©tÃ© Auptinov\n- Commande dâ€™une table Ã  langer chez Wesco\n- RÃ©ception du matÃ©riel Wesco Ã  lâ€™hÃ´tel de ville\n- Demande de transport vers lâ€™Ã©cole PrÃ©vert', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'Dossier FIPHFP Ã  constituer', '0000-00-00', '', 'VAUTIER MARIE PAULE', '', 'ANALYSE DE POSTE', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(11, '06/02/2025', 0, 'Ecole/Entretien', 'Demande aide FIPHFP', 0.00, '- 06/02/2025 : Instruction du dossier FIPHFP pour l&rsquo;achat d&rsquo;un siÃ¨ge adaptÃ© et d&rsquo;une table Ã  langer\n- Transmission des documents nÃ©cessaires\n- Transmission des piÃ¨ces manquantes\n- 03/07/2025 : Envoi de la facture acquittÃ©e', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'RÃ©f : 01AKC791250206112017', '0000-00-00', '', 'VAUTIER MARIE PAULE', '', 'FIPHFP - Adaptation de poste', '', 0, 1072.68, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(13, '15/07/2025', 0, 'Espaces Verts', 'Dossier papier', 0.00, 'Constitution du dossier â€papierâ€\nEnvoi du dossier\n15/09/25 : Entretien agent, rejet du dossier, nouvelle demande\n22/09/25 : Demande de rendez vous afin de finaliser le dossier', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'BLOQUEL DIDIER', '', 'CNAS - Prime retraite', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(20, '12/03/2025', 0, 'Ecole/Entretien', 'Demande aide FIPHFP', 0.00, '- 13/03/2025 : Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n- 05/09/2025 : Transmission des piÃ¨ces manquantes', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'RÃ©f : 01AKC791250312113721', '0000-00-00', '', 'HENRY NATACHA', '', 'FIPHFP - Adaptation de poste', '', 0, 467.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(21, '15/10/2024', 0, 'Ecole/Entretien', 'Demande de la mÃ©decine de prÃ©vention', 0.00, '- Etude de poste \n- Suite demande de 3 devis, commande de siÃ¨ge adaptÃ© chez Bureau VallÃ©e\n- Commande dâ€™une table Ã  langer chez Wesco\n- RÃ©ception du matÃ©riel Ã  lâ€™hÃ´tel de ville\n- Demande de transport vers lâ€™Ã©cole Kergomard auprÃ¨s des ST\n- 15/07/2025 :  demande de tapis Ã  langer pour la table\n- Demande de 3 devis pour les 2 tables achetÃ©es chez Wesco', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, 'CAP EMPLOI LITTORAL', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'Dossier FIPHFP Ã  constituer', '0000-00-00', '', 'HENRY NATACHA', '', 'ANALYSE DE POSTE', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(23, '06/11/2024', 0, 'CrÃ¨che', 'Demande aide FIPHFP', 0.00, '- 06/11/2024 : Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n- 08/04/2025 : Transmission des piÃ¨ces manquantes\n- 11/09/2025 : Versement de lâ€™aide', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'RÃ©f : 01AKC791241106081322', '0000-00-00', '', 'LAVERDURE GÃ‰RALDINE', '', 'FIPHFP - Adaptation de poste', '', 0, 1370.80, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(24, '15/02/2024', 0, 'CrÃ¨che', 'Demande de la mÃ©decine de prÃ©vention', 0.00, '- Etude de poste. Besoin dâ€™une chaise, dâ€™un repose pieds, souris, porte documents.\nRemplacement de la table informatique nÃ©cessaire.\n- RÃ©ception du matÃ©riel adaptÃ© en prÃªt par Auptinov.\n- Evaluation du matÃ©riel par lâ€™agent\n- Commande du matÃ©riel\n- Changement du mobilier de bureau\n- Plan sur site avec LBS\n- Proposition de devis ', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'LAVERDURE GÃ‰RALDINE', '', 'ANALYSE DE POSTE', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(25, '07/10/2024', 0, 'CrÃ¨che', 'Demande de la mÃ©decine de prÃ©vention', 0.00, '- Etude de poste \n- Proposition de matÃ©riel adaptÃ© et de modification de lâ€™espace de travail\n- AmÃ©nagements fait par les services techniques\n- Aide humaine ', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, 'CAP EMPLOI LITTORAL', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'PAINSET DELPHINE', '', 'ANALYSE DE POSTE', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(26, '18/09/2025', 0, 'CrÃ¨che', 'Demande aide FIPHFP', 0.00, 'Demande Ã  effectuer', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'PAINSET DELPHINE', '1', 'FIPHFP - Adaptation de poste', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(27, '04/12/2023', 0, 'Espaces Verts', 'Demande aide FIPHFP', 0.00, '- 04/12/2023: Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n- 09/05/2024 : Transmission des piÃ¨ces manquantes', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'RÃ©f : 01AKC791231204085635', '0000-00-00', '', 'NOEL PATRICK', '', 'FIPHFP - ProthÃ¨se auditives', '', 0, 1290.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(28, '13/11/2023', 0, 'Techniques', 'Demande aide FIPHFP', 0.00, '- 13/11/2023 : Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n- 12/04/2024 : Transmission des piÃ¨ces manquantes', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'RÃ©f : 01AKC791231113165712', '0000-00-00', '', 'JOIRIS FABRICE', '', 'FIPHFP - ProthÃ¨se auditives', '', 0, 690.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(29, '15/05/2025', 0, 'Techniques', 'Demande aide FIPHFP', 0.00, '- 15/05/2025: Instruction du dossier FIPHFP \n- Transmission des documents nÃ©cessaires\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'RÃ©f : 01AKC791250515091852', '0000-00-00', '', 'HOCQ JÃ‰RÃˆMY', '1', 'FIPHFP - ProthÃ¨se auditives', '', 0, 1700.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(30, '24/07/2025', 0, 'Espaces Verts', 'Dossier papier', 0.00, 'Constitution du dossier â€papierâ€\nEnvoi du dossier\n15 et 16/09/25 : Entretien agent, rejet du dossier, nouvelle demande envoyÃ©e le 17/09/2025', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'FAVREZ PHILIPPE', '', 'CNAS - Prime retraite', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(31, '04/09/2025', 0, 'Espaces Verts', 'Dossier papier', 0.00, 'Constitution du dossier â€papierâ€\nEn attente certificat administratif\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'FOUGERAY CHRISTOPHE', '', 'CNAS - Prime retraite', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(32, '27/05/2025', 0, 'Espaces Verts', 'Dossier papier', 0.00, 'Constitution du dossier â€papierâ€\nEnvoi du dossier\n', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'GAMBART PHILIPPE', '', 'CNAS - Prime retraite', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(33, '27/05/2025', 0, 'Ecole/Entretien', 'Dossier papier', 0.00, '- Constitution du dossier â€papierâ€\n- Envoi du dossier\n- 04/09/25 : Entretien agent, rejet du dossier\n- Envoi nouvelle demande le 16/09/2025', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'LACOUR KALIDA', '', 'CNAS - Prime retraite', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(34, '25/08/2025', 0, 'Ecole/Entretien', 'Prime rentrÃ©e scolaire', 0.00, '- Demande dâ€™aide administrative afin de solliciter la prime de rentrÃ©e scolaire au CNAS\n\nCodes erronÃ©s, pas dâ€™accÃ¨s Ã  la boÃ®te mail pour rÃ©initialiser le mot de passe.\n\nNouvel entretien dans la journÃ©e : crÃ©ation dâ€™un nouveau mot', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'DUVIVIER MARJORIE', '', 'CNAS - RentrÃ©e scolaire', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(35, '18/09/2025', 0, 'CrÃ¨che', 'Livraison Protecthoms', 0.00, '- Appel Tony Pavy suite livraison Protecthoms au service scolaire\n- VÃ©rification du bon de commande - Destinataire crÃ¨che\n- Appel ST pour demande de transport\n- Confirmation Tony Pavy du transport le 18/09 aprÃ¨s midi ou le 19/09\n- Vu Laurent Caron : tr', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'CRÃˆCHE', '', 'EPI', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(36, '21/08/2025', 0, 'Ecole/Entretien', 'RentrÃ©e scolaire - SÃ©jour vacances enfant - ChÃ¨ques ANCV', 0.00, 'Demande dâ€™aide administrative afin de solliciter plusieurs aides au CNAS\n\nDocuments manquants : Imposition 2023 en 2024 pour Monsieur et Madame\nReÃ§us par mail\n\nDemandes faites sur le site du CNAS le 22/08/2025\n\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'MAVAUT SÃ‰VERINE', '', 'CNAS - DIVERS DEMANDES', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(37, '18/09/2025', 0, 'Techniques', 'Absence de harnais nacelle', 0.00, '18/09/25 :\n- Besoin de harnais pour intervenir dans la nacelle.\n- Contact Protecthoms pour conseils \n- RÃ©ception de la fiche technique â€Harnais nacelleâ€\n- Diffusion de la fiche technique aux participants de la rÃ©union\n- Accord par S. Carlu, par mail pour la commande \n- RÃ©ception du devis le 23/09/2025\n- Envoi du devis Ã  JP Carpe pour BdC le 23/09/25', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'ST - ELECTRICIENS', '', 'EPI', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(38, '07/04/2025', 0, 'Espaces Verts', 'DÃ©cÃ¨s agent', 0.00, '07/04/2025 : Suite dÃ©cÃ¨s agent, demande dâ€™aide auprÃ¨s du CNAS pour les filles de Monsieur.\nLâ€™aide devra Ãªtre versÃ©e aux pompes funÃ¨bres.\n\n13/05/2025 : Transmission du RIB de PFI au CNAS', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'PAUCHET LUDOVIC', '', 'CNAS - DECES', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(39, '07/11/2024', 0, 'CAJ', 'Demande de lâ€™agent', 0.00, 'Suite Ã  ses pathologies l&rsquo;agent souhaite un amÃ©nagement de son poste de travail.\nElle ne bÃ©nÃ©ficie pas d&rsquo;une RQTH. La collectivitÃ© ne peut pas prÃ©tendre Ã  une aide du FIPHFP.\n\nCommande d&rsquo;une souris Trackball et d&rsquo;une chaise adaptÃ©e aprÃ¨s demandes de 3 devis.\n\nLivraison de la chaise Ã  l&rsquo;hÃ´tel de ville. Demande de transport vers les ACM auprÃ¨s des ST.\n\nL&rsquo;amÃ©nagement du bureau nÃ©cessite une modification.\nVÃ©rification de la disponibilitÃ© d&rsquo;un bureau aux ST.\nDemande d&rsquo;intervention auprÃ¨s des ST pour retirer l&rsquo;ancien mobilier et installer le nouveau.\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'MONFLIER FLORENCE', '', 'ANALYSE DE POSTE', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(40, '01/04/2025', 0, 'SENOU', 'Demande de la mÃ©decine de prÃ©vention', 0.00, 'Etude de poste :\nNÃ©cessitÃ© de matÃ©riel (clavier, souris, chaise, repose pieds, bras articulÃ©, porte documents)\nMatÃ©riel en prÃªt par la sociÃ©tÃ© Bureau Ergonomie\nNÃ©cessitÃ© de changer le bureau\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, 'CAP EMPLOI LITTORAL', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, 'Faire une demande FIPHFP', '0000-00-00', '', 'MARETTE STÃ‰PHANIE', '1', 'ANALYSE DE POSTE', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(41, '03/07/2025', 0, 'Ecole/Entretien', 'Demande de la mÃ©decine de prÃ©vention', 0.00, '-27/06, 30/06, 01/07 : Mail Cap emploi. Organisation RV pour analyse de poste\n\nAnalyse de poste Ã  l&rsquo;Ã©cole St ExupÃ©ry\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, 'CAP EMPLOI LITTORAL', 0.00, 'Demande de la mÃ©decine de prÃ©vention', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'VAUTIER ROXANE', '', 'ANALYSE DE POSTE', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(42, '', 0, 'Administratif Population', 'Demande de lâ€™agent', 0.00, 'Achat d&rsquo;une souris Trackball et d&rsquo;une chaise ergonomique\n\nLe renfort dorsal de la chaise n&rsquo;est pas rÃ©glable et gÃ¨ne l&rsquo;agent dont la morphologie de convient pas.\n\n', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'GRARE NATHALIE', '', 'ANALYSE DE POSTE', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(48, '22/09/2025', 0, 'ACM', 'Aide FIPHFP', 0.00, '22/09/2025 :Suite Ã  la rÃ©ception de la notification de la MDPH lui attribuant la RQTH, l&rsquo;agent transmet son devis de chez Entendre afin que je puisse instruire la demande d&rsquo;aide auprÃ¨s du FIPHFP.', 0.00, 'CELINE GOSSE - ASSISTANTE DE PRÃ‰VENTION', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'PARIS SANDIE', '', 'FIPHFP - ProthÃ¨se auditives', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'CÃ©line GOSSE'),
(49, '11/09/2025', 0, 'Administratif Population', '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, '', 0.00, 0, '', '0000-00-00', '', 'MAJE1358HGHGGH', '', 'CNAS - Prime retraite', '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, '', 0, 0.00, 0.00, 'Admin MARLIERE');

-- --------------------------------------------------------

--
-- Structure de la table `rqth`
--

CREATE TABLE IF NOT EXISTS `rqth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_rqth` varchar(255) NOT NULL,
  `pole_service_rqth` varchar(255) NOT NULL,
  `emploi_rqth` varchar(255) NOT NULL,
  `etat_rqth` varchar(1000) NOT NULL,
  `date_attribution_rqth` varchar(10) NOT NULL,
  `date_fin_attribution_rqth` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Contenu de la table `rqth`
--

INSERT INTO `rqth` (`id`, `agent_rqth`, `pole_service_rqth`, `emploi_rqth`, `etat_rqth`, `date_attribution_rqth`, `date_fin_attribution_rqth`) VALUES
(18, 'PARIS Sandie', 'ACM', '', 'AttribuÃ©e', '28/08/2025', '31/08/2030'),
(19, 'CARLU ValÃ©rie', 'CrÃ¨che', '', 'AttribuÃ©e', '14/08/2025', '31/08/2030'),
(20, 'CARPE ChristÃ¨le', 'Ecole/Entretien', '', 'AttribuÃ©e', '12/01/2023', '11/01/2028'),
(21, 'DUBOIS Corinne', 'CrÃ¨che', '', 'AttribuÃ©e', '23/12/2021', 'DÃ©finitif'),
(22, 'DUCLOY Christophe', 'Techniques', '', 'AttribuÃ©e', '13/02/2025', 'DÃ©finitif'),
(23, 'GEST Didier', 'Techniques', '', 'AttribuÃ©e', '28/01/2021', '31/12/2025'),
(24, 'GORRE Michel', 'Espaces Verts', '', 'A revouveler', '01/05/2019', '30/04/2024'),
(25, 'GOSSE CÃ©line', 'RH', '', 'AttribuÃ©e', '14/11/2024', '30/11/2027'),
(26, 'GOUJON Sylvie', 'CrÃ¨che', '', 'AttribuÃ©e', '11/01/2024', 'DÃ©finitif'),
(27, 'HENRY Natacha', 'Ecole/Entretien', '', 'AttribuÃ©e', '01/09/2023', '31/08/2028'),
(28, 'HOCQ JÃ©rÃ¨my', 'Techniques', '', 'AttribuÃ©e', '09/03/2021', '31/03/2026'),
(29, 'JOIRIS Fabrice', 'Techniques', '', 'AttribuÃ©e', '01/05/2022', 'DÃ©finitif'),
(30, 'LANNOY Laurent', 'DGS', '', 'AttribuÃ©e', '06/04/1992', 'DÃ©finitif'),
(31, 'LAVERDURE GÃ©raldine', 'CrÃ¨che', '', 'AttribuÃ©e', '01/01/2022', 'DÃ©finitif'),
(32, 'MARETTE StÃ©phanie', 'SENOU', '', 'AttribuÃ©e', '26/09/2024', 'DÃ©finitif'),
(33, 'MONFLIER Florence', 'CAJ', '', 'Demande en cours', 'En cours', 'En cours'),
(34, 'NATIER Corinne', 'Ecole/Entretien', '', 'AttribuÃ©e', '09/01/2025', 'DÃ©finitif'),
(35, 'PAINSET Delphine', 'CrÃ¨che', '', 'AttribuÃ©e', '12/09/2024', 'DÃ©finitif'),
(36, 'SAISON Pascale', 'PM Administratif', '', 'AttribuÃ©e', '11/08/2022', 'DÃ©finitif'),
(37, 'VAUTIER Marie Paule', 'Ecole/Entretien', '', 'AttribuÃ©e', '23/03/2023', 'DÃ©finitif'),
(38, 'VAUTIER Roxane', 'Ecole/Entretien', '', 'AttribuÃ©e', '22/06/2023', '30/06/2026'),
(40, 'BRUNET Nancy', 'Ecole/Entretien', '', 'A revouveler', '07/01/2021', '06/01/2026'),
(41, 'SAISON Dominique', 'Espaces Verts', '', 'A revouveler', '01/07/2019', '30/06/2024');

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `service`
--

INSERT INTO `service` (`id`, `service`) VALUES
(1, 'INFORMATIQUE'),
(2, 'SPORTS'),
(3, 'TECHNIQUE');

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE IF NOT EXISTS `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `stock_mini` int(3) NOT NULL,
  `stock_reel` int(3) NOT NULL,
  `donnee` int(3) NOT NULL,
  `ref` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `stock`
--

INSERT INTO `stock` (`id`, `designation`, `prix`, `stock_mini`, `stock_reel`, `donnee`, `ref`) VALUES
(4, 'AGENT TECHNIQUE CATERGORIE C', 10.00, 0, 0, 0, 'CAT C'),
(5, 'AGENT TECHNIQUE CATERGORIE B', 15.00, 0, 0, 0, 'CAT B');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `id_profil` int(1) NOT NULL,
  `nom` varchar(60) NOT NULL,
  `service` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `id_profil`, `nom`, `service`) VALUES
(1, 'Admin', 'sopxsopx', 2, 'MARLIERE', 'INFORMATIQUE'),
(3, 'Jerome', 'sopxsopx', 1, 'MARLIERE', 'INFORMATIQUE'),
(4, 'CÃ©line', 'louisejeanne', 2, 'GOSSE', 'PRÃ‰VENTION'),
(5, 'Isabelle', 'calon', 1, 'CALON', 'RH');

-- --------------------------------------------------------

--
-- Structure de la table `visite`
--

CREATE TABLE IF NOT EXISTS `visite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_visite` varchar(255) NOT NULL,
  `pole_service_visite` varchar(255) NOT NULL,
  `date_visite` varchar(10) NOT NULL,
  `observation` varchar(255) NOT NULL,
  `rqth_visite` varchar(10) NOT NULL,
  `restriction_visite` varchar(1000) NOT NULL,
  `user` varchar(60) NOT NULL,
  `type` varchar(60) NOT NULL,
  `recommandation_visite` varchar(1000) NOT NULL,
  `limitation_visite` varchar(1000) NOT NULL,
  `temps_partiel_visite` varchar(3) NOT NULL,
  `tpt1_du` varchar(10) NOT NULL,
  `tpt1_au` varchar(10) NOT NULL,
  `tpt2_du` varchar(10) NOT NULL,
  `tpt2_au` varchar(10) NOT NULL,
  `tpt3_du` varchar(10) NOT NULL,
  `tpt3_au` varchar(10) NOT NULL,
  `tpt4_du` varchar(10) NOT NULL,
  `tpt4_au` varchar(10) NOT NULL,
  `qte1` int(2) NOT NULL,
  `qte2` int(2) NOT NULL,
  `qte3` int(2) NOT NULL,
  `qte4` int(2) NOT NULL,
  `emploi_visite` varchar(255) NOT NULL,
  `tdt_oui_non` varchar(3) NOT NULL,
  `travail_penche_visite` int(1) NOT NULL,
  `debout_visite` int(1) NOT NULL,
  `conduite_visite` int(1) NOT NULL,
  `utilisation_visite` int(1) NOT NULL,
  `travail_haut_visite` int(1) NOT NULL,
  `travail_iso_visite` int(1) NOT NULL,
  `travail_bas_visite` int(1) NOT NULL,
  `effort__visite` int(1) NOT NULL,
  `port` varchar(10) NOT NULL,
  `epi` varchar(3) NOT NULL,
  `epi_detail` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Contenu de la table `visite`
--

INSERT INTO `visite` (`id`, `agent_visite`, `pole_service_visite`, `date_visite`, `observation`, `rqth_visite`, `restriction_visite`, `user`, `type`, `recommandation_visite`, `limitation_visite`, `temps_partiel_visite`, `tpt1_du`, `tpt1_au`, `tpt2_du`, `tpt2_au`, `tpt3_du`, `tpt3_au`, `tpt4_du`, `tpt4_au`, `qte1`, `qte2`, `qte3`, `qte4`, `emploi_visite`, `tdt_oui_non`, `travail_penche_visite`, `debout_visite`, `conduite_visite`, `utilisation_visite`, `travail_haut_visite`, `travail_iso_visite`, `travail_bas_visite`, `effort__visite`, `port`, `epi`, `epi_detail`) VALUES
(1, 'MARETTE StÃ©phanie', 'Senou  ', '04/03/2025', '', 'Oui', 'Contre indication Ã  la conduite automobile pour le transport de personnes\r\n', '', '', 'AmÃ©nagement de poste', '', 'Non', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Adjoint administratif', '', 0, 1, 1, 0, 0, 0, 0, 0, '', '', ''),
(28, 'LEFEBVRE Camille', 'Ecole/Entretien           ', '25/06/2025', '', 'Non', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Agent entretien', '', 0, 0, 0, 0, 0, 0, 1, 0, '>=7', 'Non', ''),
(29, 'MAGRIT Jovanique', 'CAJ  ', '04/02/2025', '', 'Non', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Agent administratif', '', 0, 0, 0, 0, 0, 0, 0, 1, '>=7', '', ''),
(30, 'LE SCIELLOUR Sylvie', '  ', '14/05/2025', '', 'Non', '', '', '', '', '', 'Oui', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Adjoint administratif', '', 0, 0, 0, 0, 0, 0, 0, 1, '>=7', '', ''),
(31, 'MERLIN Gilles', 'Techniques   ', '03/03/2026', '', 'Non', 'Poste adaptÃ© : peinture - serres', '', '', '', '', 'Oui', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Peintre', '', 0, 0, 0, 0, 0, 0, 0, 1, '>=7', 'Non', ''),
(32, 'CONDETTE Rebecca', 'CrÃ¨che  ', '16/10/2024', '', 'Non', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Agent animation', '', 0, 0, 0, 0, 0, 0, 1, 0, '>=10', '', ''),
(33, 'GRARE Nathalie', 'Administratif Population     ', '15/01/2025', '', 'Non', 'Mettre Ã  dispo une souris et un siÃ¨ge ergonomique', '', '', 'AmÃ©nagement de poste', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Adjoint administratif', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', ''),
(34, 'CARON Caroline', 'CrÃ¨che     ', '08/10/2024', '', 'Non', 'Mettre Ã  disposition une chaise haute pour Ãªtre en capacitÃ© de donner les repas solides Ã  hauteur', '', '', 'AmÃ©nagement de poste', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Auxiliaire de puÃ©riculture', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', ''),
(35, 'ALLEAU BÃ©atrice', 'Ecole/Entretien ', '08/10/2024', '', 'Non', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Agent entretien', '', 1, 0, 0, 0, 0, 0, 0, 0, '>=10', '', ''),
(36, 'DEPERLECQUE ChristÃ¨le', 'Ecole/Entretien ', '16/07/2025', '', 'Non', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Agent entretien', '', 1, 0, 0, 0, 0, 0, 0, 0, '>=5', '', ''),
(37, 'MONFLIER Florence', 'CAJ ', '05/08/2024', '', 'En cours', 'Fauteuil ergonomique recommandÃ©', '', '', 'AmÃ©nagement de poste', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Adjoint administratif', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', ''),
(38, 'JOIRIS Fabrice', '[POLE TECHNIQUE] ', '05/08/2024', '', 'Oui', 'EPI Ã  adapter', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Directeur adjoint st', '', 0, 0, 0, 0, 0, 0, 0, 0, '', 'Oui', ''),
(40, 'VAUTIER Roxane', 'Ecole/Entretien ', '27/07/2024', '', 'Oui', 'Eviter la classe des tout petits\r\n', '', '', 'AmÃ©nagement de poste', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Atsem', '', 1, 0, 0, 0, 0, 0, 0, 0, '>=10', '', ''),
(41, 'VANHELLE VÃ©ronique', 'CrÃ¨che ', '23/04/2024', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'InfirmiÃ¨re ', '', 1, 0, 0, 0, 0, 0, 0, 0, '>=7', '', ''),
(42, 'GORRE Michel', 'Techniques ', '22/07/2025', '', 'Oui', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Agent entretien cimetiÃ¨re', '', 0, 0, 0, 0, 0, 1, 0, 1, '>=5', '', ''),
(43, 'MAGNIER Natacha', 'Ecole/Entretien ', '10/04/2024', '', 'Non', 'Limitation montÃ©e et descente escaliers', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Agent entretien', '', 0, 0, 0, 0, 0, 0, 0, 0, '>=15', '', ''),
(44, 'CAFFIER Dimitri', 'Techniques ', '20/03/2024', '', 'Non', 'Mise Ã  dispostion de bouchons oreilles', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Plombier chauffagiste', '', 0, 0, 0, 0, 0, 0, 0, 0, '>=15', 'Oui', ''),
(45, 'GOUJON Sylvie', 'CrÃ¨che ', '17/12/2024', '', 'Oui', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Auxiliaire de puÃ©riculture', '', 0, 0, 0, 0, 0, 0, 0, 0, '>=5', '', ''),
(46, 'MENNEFILE Christophe', 'Techniques ', '21/02/2024', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Agent de voierie', '', 1, 0, 0, 0, 0, 0, 0, 0, '>=15', '', ''),
(47, 'DUCLOY Christophe', 'Techniques ', '19/02/2025', '', 'Oui', 'Limitation des heures supplÃ©mentaires\r\nDoit pouvoir alterner les activitÃ©s\r\nPas de contre indication Ã  la rÃ©alisation de travaux Ã©lectriques', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Gardien maison des asso', '', 1, 0, 0, 0, 1, 0, 0, 0, '>=10', '', ''),
(48, 'SAISON Dominique', 'Espaces Verts ', '11/02/2025', '', 'Oui', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Jardinier', '', 1, 0, 0, 0, 0, 0, 1, 0, '>=5', '', ''),
(49, 'NOEL Romaric', 'Espaces Verts ', '24/01/2024', '', 'Non', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Jardinier', '', 1, 0, 0, 0, 0, 0, 0, 0, '>=15', '', ''),
(50, 'CAFFIER Anne Marie', 'Ecole/Entretien ', '16/09/2025', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Agent entretien', '', 1, 0, 0, 0, 0, 0, 0, 0, '>=7', '', ''),
(51, 'VIGREUX HÃ©lÃ¨ne', 'Ecole/Entretien ', '15/07/2025', '', '', 'Pas de mouvements rÃ©pÃ©titifs en rotation des membres supÃ©rieurs', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Agent entretien', '', 0, 0, 0, 0, 0, 0, 1, 0, '>=7', '', ''),
(52, 'CARPE ChristÃ¨le', 'Ecole/Entretien ', '17/06/2025', '', 'Oui', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Atsem', '', 1, 1, 0, 0, 0, 0, 1, 0, '>=7', '', ''),
(53, 'ROQUE Luis', 'Techniques ', '18/03/2024', '', 'Non', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Agent de voierie', '', 0, 0, 0, 0, 0, 0, 1, 0, '>=15', '', ''),
(55, 'PAINSET Delphine', 'CrÃ¨che  ', '10/02/2026', '', 'Oui', 'MP 57A Gauche', '', '', 'AmÃ©nagement de poste', '', 'Oui', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Agent de restauration', '', 0, 0, 0, 0, 0, 0, 1, 0, '>=5', 'Non', ''),
(56, 'BAILLARD Maryline', 'Administratif Population  ', '06/01/2026', '', 'Non', 'Clavier et souris ergonomique\r\nPorte document\r\nNon compatible avec MP 57B Droite', '', '', 'AmÃ©nagement de poste', '', 'Non', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Responsable de pÃ´le', '', 0, 0, 0, 0, 0, 0, 0, 0, '', 'Non', ''),
(57, 'LASSALLE StÃ©phanie', 'Ecole/Entretien ', '13/01/2026', '', 'Non', 'Limiter les mouvements de torsion du poignet\r\nUtiliser un chariot', '', '', '', '', 'Non', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Agent entretien et restauration', '', 0, 0, 0, 0, 0, 0, 0, 0, '>=7', 'Non', ''),
(58, 'BOUVOT ChristÃ¨le', 'Ecole/Entretien', '03/02/2026', '', '', '', '', '', '', '', 'Oui', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Agent de restauration', '', 0, 0, 0, 0, 0, 0, 0, 0, '>=10', 'Non', ''),
(59, 'FONTAINE Marion', 'Ecole/Entretien', '28/01/2026', '', '', '', '', '', '', '', 'Oui', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Agent entretien et restauration', '', 1, 0, 0, 0, 0, 0, 0, 0, '>=5', 'Non', ''),
(60, 'HENRY Natacha', 'Ecole/Entretien', '04/03/2026', '', 'Oui', '', '', '', '', '', 'Non', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Atsem', '', 0, 0, 0, 0, 0, 0, 0, 0, '>=10', 'Oui', ''),
(61, 'MAGNIER HÃ©lÃ¨ne', 'Ecole/Entretien', '04/02/2026', '', '', '', '', '', '', '', 'Non', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Agent entretien et restauration', '', 0, 0, 0, 0, 0, 0, 0, 0, '', 'Oui', ''),
(62, 'BERNARD MÃ©lanie', 'EMMD', '24/02/2026', '', '', '', '', '', '', '', 'Non', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Agent administratif', '', 0, 0, 0, 0, 0, 1, 0, 0, '', 'Non', ''),
(63, 'PARIS Sandie', 'ACM', '10/02/2026', '', 'Oui', '', '', '', '', '', 'Non', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Responsable acm', '', 0, 0, 0, 0, 0, 0, 0, 0, '', 'Non', ''),
(64, 'NATIER Corinne', 'Ecole/Entretien', '14/01/2026', '', '', '', '', '', '', '', 'Non', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'Agent entretien', '', 0, 0, 0, 0, 0, 0, 0, 0, '', 'Non', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
