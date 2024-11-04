-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 04-Nov-2024 às 21:46
-- Versão do servidor: 10.6.19-MariaDB
-- PHP Version: 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventario`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(11) NOT NULL,
  `botao_src` varchar(100) NOT NULL,
  `nomecategoria` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `botao_src`, `nomecategoria`) VALUES
(1, 'cpu.png', 'CPU'),
(2, 'teclado.png', 'TECLADO'),
(3, 'monitor.png', 'MONITOR'),
(4, 'mouse.png', 'MOUSE'),
(5, 'notebook.png', 'NOTEBOOK'),
(6, 'componentes.png', 'COMPONENTES'),
(7, 'tablet.png', 'TABLET'),
(8, 'outros.png', 'DIVERSOS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `componentes`
--

CREATE TABLE IF NOT EXISTS `componentes` (
  `ID` int(11) NOT NULL,
  `MARCA` varchar(100) NOT NULL,
  `MODELO` varchar(100) NOT NULL,
  `SERIE` varchar(100) NOT NULL,
  `TIPO` varchar(100) NOT NULL,
  `DESCRICAO` varchar(100) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL,
  `OBS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `componentes_saida`
--

CREATE TABLE IF NOT EXISTS `componentes_saida` (
  `COMPONENTE_ID` int(11) NOT NULL,
  `MARCA` varchar(100) NOT NULL,
  `MODELO` varchar(100) NOT NULL,
  `SERIE` varchar(100) NOT NULL,
  `TIPO` varchar(100) NOT NULL,
  `DESCRICAO` varchar(100) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL,
  `OBS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cpu`
--

CREATE TABLE IF NOT EXISTS `cpu` (
  `ID` int(11) NOT NULL,
  `MARCA` varchar(100) NOT NULL,
  `MODELO` varchar(100) NOT NULL,
  `SERIE` varchar(100) NOT NULL,
  `PATRIMONIO` varchar(100) NOT NULL,
  `DVAT` varchar(100) NOT NULL,
  `PROCESSADOR` varchar(100) NOT NULL,
  `MEMORIA_RAM` varchar(100) NOT NULL,
  `ARMAZENAMENTO` varchar(100) NOT NULL,
  `QUANTIDADE` int(11) DEFAULT NULL,
  `SALA` int(11) NOT NULL,
  `SITUACAO` varchar(100) DEFAULT NULL,
  `PROCESSO` varchar(100) NOT NULL,
  `ORIGEM` varchar(100) DEFAULT NULL,
  `OBS` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cpu`
--

INSERT INTO `cpu` (`ID`, `MARCA`, `MODELO`, `SERIE`, `PATRIMONIO`, `DVAT`, `PROCESSADOR`, `MEMORIA_RAM`, `ARMAZENAMENTO`, `QUANTIDADE`, `SALA`, `SITUACAO`, `PROCESSO`, `ORIGEM`, `OBS`) VALUES
(1, 'C3TECH', 'SEM MODELO', 'S/N', 'ILEGIVEL', '47736', '', '', '', 1, 15, NULL, '', NULL, ''),
(2, 'C3TECH', 'SEM MODELO', 'S/N', '5006866', '41739', '', '', '', 1, 15, '', '', '', ''),
(3, 'C3TECH', 'SEM MODELO', 'S/N', '5006860', '41735', '', '', '', 1, 15, NULL, '', NULL, ''),
(4, 'C3TECH', 'SEM MODELO', 'S/N', '5006861', '41734', '', '', '', 1, 15, NULL, '', NULL, ''),
(5, 'GABINETE SAMSUNG', 'MONTADO', 'S/N', 'S/N', 'S/N', '', '', '', 1, 15, NULL, '', NULL, ''),
(6, 'HP', 'HP PRODESK 600 G1 BRAZIL SSF', 'BRJ539YHV1', '5005558', '40356', '', '', '', 1, 15, NULL, '', NULL, ''),
(7, 'HP', 'HP PRODESK 600 G1 BRAZIL SSF', 'BRJ539YJ57', '5005563', '40225', '', '', '', 1, 15, NULL, '', NULL, ''),
(8, 'HP', 'HP PRODESK 600 G1 BRAZIL SSF', 'BRJ539YJWG', '5005645', '40248', '', '', '', 1, 15, NULL, '', NULL, ''),
(9, 'HP', 'HP PRODESK 600 G1 BRAZIL SSF', 'BRJ539YJZX', '5005587', '40393', '', '', '', 1, 15, NULL, '', NULL, ''),
(10, 'HP', 'HP PRODESK 600 G1 BRAZIL SSF', 'BRJ539YHP6', '5005600', '40214', '', '', '', 1, 15, NULL, '', NULL, ''),
(11, 'HP', 'HP PRODESK 600 G1 BRAZIL SSF', 'BRJ539YK30', '5005643', '40242', '', '', '', 1, 15, NULL, '', NULL, ''),
(12, 'HP', 'HP PRODESK 600 G1 BRAZIL SSF', 'BRJ539YJWQ', '5005624', '40294', '', '', '', 1, 15, NULL, '', NULL, ''),
(13, 'HP', 'HP PRODESK 600 G1 BRAZIL SSF', 'BRJ539YHP3', '5004498', '40232', '', '', '', 1, 15, NULL, '', NULL, ''),
(14, 'HP', 'HP PRODESK 600 G1 BRAZIL SSF', 'S/N', '5005621', '40262', '', '', '', 1, 15, NULL, '', NULL, ''),
(15, 'HP', 'HP PRODESK 600 G1 BRAZIL SSF', 'BRJ539YJC0', '5005602', '40205', '', '', '', 1, 15, NULL, '', NULL, ''),
(16, 'HP', 'HP PRODESK 600 G1 BRAZIL SSF', 'BRJ539YJ2Z', '5005505', '40344', '', '', '', 1, 15, NULL, '', NULL, ''),
(17, 'HP', 'HP PRODESK 600 G1 BRAZIL SSF', 'BRJ539YHPK', '5005599', '40220', '', '', '', 1, 15, NULL, '', NULL, ''),
(18, 'HP', 'HP PRODESK 600 G1 BRAZIL SSF', 'BRJ539YJBF', '5005603', '40230', '', '', '', 1, 15, NULL, '', NULL, ''),
(19, 'ITAUTEC S/A', 'INFOWAY SM 3330', '4005762400105', '5008246', 'S/N', '', '', '', 1, 15, NULL, '', NULL, ''),
(20, 'ITAUTEC S/A', 'INFOWAY SM 3330', '4004420000065', '27000101', 'S/N', '', '', '', 1, 15, NULL, '', NULL, ''),
(21, 'ITAUTEC S/A', 'INFOWAY SM 3330', '4005762300391', '52000287', 'S/N', '', '', '', 1, 15, NULL, '', NULL, ''),
(22, 'ITAUTEC S/A', 'INFOWAY SM 3330', '4005762200095', '5008252', 'S/N', '', '', '', 1, 15, NULL, '', NULL, ''),
(23, 'ITAUTEC S/A', 'INFOWAY SM 3330', '4005762300198', '5008247', 'S/N', '', '', '', 1, 15, NULL, '', NULL, ''),
(24, 'LENOVO', 'THINKCENTRE M910S', 'PE02YFTV', '45000442', '50020', '', '', '', 1, 15, NULL, '', NULL, ''),
(25, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A317RP8T', '5008679', '48803', '', '', '', 1, 15, NULL, '', NULL, ''),
(26, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A320BC16', '5008699', '48806', '', '', '', 1, 15, NULL, '', NULL, ''),
(27, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A320B19D', '5008698', '48807', '', '', '', 1, 15, NULL, '', NULL, ''),
(28, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A434T849', '5008693', '47013', '', '', '', 1, 15, NULL, '', NULL, ''),
(29, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A317RB6D', '5008692', '47009', '', '', '', 1, 15, NULL, '', NULL, ''),
(30, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A434QL61', '5008696', '48805', '', '', '', 1, 15, NULL, '', NULL, ''),
(31, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A320B24R', '5008690', '48804', '', '', '', 1, 15, NULL, '', NULL, ''),
(32, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A317QQ6F', 'S/N', 'S/N', '', '', '', 1, 15, NULL, '', NULL, ''),
(33, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A3175L03', '5008689', '48800', '', '', '', 1, 15, NULL, '', NULL, ''),
(34, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A317R394', 'S/N', 'S/N', '', '', '', 1, 15, NULL, '', NULL, ''),
(35, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A305NQ4A', '5008688', '48808', '', '', '', 1, 15, NULL, '', NULL, ''),
(36, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A2788P1U', '5008697', 'S/N', '', '', '', 1, 15, NULL, '', NULL, ''),
(37, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A3307522', '5008695', '48801', '', '', '', 1, 15, NULL, '', NULL, ''),
(38, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A243BG22', '5008694', '48802', '', '', '', 1, 15, NULL, '', NULL, ''),
(39, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A434PY3I', '5008691', '47010', '', '', '', 1, 15, NULL, '', NULL, ''),
(40, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A434SY7N', '5008682', '48077', '', '', '', 1, 15, NULL, '', NULL, ''),
(41, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A315Q166', '5008706', '47015', '', '', '', 1, 15, NULL, '', NULL, ''),
(42, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A315Q254', '5008700', '48799', '', '', '', 1, 15, NULL, '', NULL, ''),
(43, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A4357X0L', '5008703', '47012', '', '', '', 1, 15, NULL, '', NULL, ''),
(44, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A313P32F', '5008676', '48086', '', '', '', 1, 15, NULL, '', NULL, ''),
(45, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A250T195', '5008704', '47011', '', '', '', 1, 15, NULL, '', NULL, ''),
(46, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A305MW5Q', '5008677', '48032', '', '', '', 1, 15, NULL, '', NULL, ''),
(47, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A316FM2B', '5008687', '48085', '', '', '', 1, 15, NULL, '', NULL, ''),
(48, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A320BC85', '5008702', '48084', '', '', '', 1, 15, NULL, '', NULL, ''),
(49, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A250SH4L', '5008684', '48087', '', '', '', 1, 15, NULL, '', NULL, ''),
(50, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A315PN3E', '5008675', '48076', '', '', '', 1, 15, NULL, '', NULL, ''),
(51, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A4357B7Q', '5008678', '48080', '', '', '', 1, 15, NULL, '', NULL, ''),
(52, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A305MY5W', '5008705', '47014', '', '', '', 1, 15, NULL, '', NULL, ''),
(53, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A434R429', '5008701', '48088', '', '', '', 1, 15, NULL, '', NULL, ''),
(54, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A305MX04', '5008685', '48079', '', '', '', 1, 15, NULL, '', NULL, ''),
(55, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A250SV9G', '5008681', '48083', '', '', '', 1, 15, NULL, '', NULL, ''),
(56, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A436394G', '5008680', '48078', '', '', '', 1, 15, NULL, '', NULL, ''),
(57, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A3175T90', '5008686', '48081', '', '', '', 1, 15, NULL, '', NULL, ''),
(58, 'POSITIVO', 'POS-AT SERIES K I5PE', '1A320BD04', '5008683', 'S/N', '', '', '', 1, 15, '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cpu_saida`
--

CREATE TABLE IF NOT EXISTS `cpu_saida` (
  `CPU_ID` int(11) NOT NULL,
  `MARCA` varchar(100) NOT NULL,
  `MODELO` varchar(100) NOT NULL,
  `SERIE` varchar(100) NOT NULL,
  `PATRIMONIO` varchar(100) NOT NULL,
  `PROCESSADOR` varchar(100) NOT NULL,
  `MEMORIA_RAM` varchar(100) NOT NULL,
  `ARMAZENAMENTO` varchar(100) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL,
  `OBS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `diversos`
--

CREATE TABLE IF NOT EXISTS `diversos` (
  `ID` int(11) NOT NULL,
  `PROCESSO` varchar(100) DEFAULT NULL,
  `NF` varchar(100) NOT NULL,
  `MARCA` varchar(100) DEFAULT NULL,
  `MODELO` varchar(100) DEFAULT NULL,
  `TIPO` varchar(100) DEFAULT NULL,
  `COR` varchar(100) DEFAULT NULL,
  `PATRIMONIO` varchar(100) DEFAULT NULL,
  `DESCRICAO` text DEFAULT NULL,
  `QUANTIDADE` int(11) DEFAULT NULL,
  `OBS` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `impressora`
--

CREATE TABLE IF NOT EXISTS `impressora` (
  `ID` int(11) NOT NULL,
  `MARCA` varchar(100) NOT NULL,
  `MODELO` varchar(100) NOT NULL,
  `SERIE` varchar(100) NOT NULL,
  `TIPO` varchar(100) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL,
  `OBS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `impressora_saida`
--

CREATE TABLE IF NOT EXISTS `impressora_saida` (
  `IMPRESSORA_ID` int(11) NOT NULL,
  `MARCA` varchar(100) NOT NULL,
  `MODELO` varchar(100) NOT NULL,
  `SERIE` varchar(100) NOT NULL,
  `TIPO` varchar(100) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL,
  `OBS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `monitor`
--

CREATE TABLE IF NOT EXISTS `monitor` (
  `ID` int(11) NOT NULL,
  `MARCA` varchar(100) NOT NULL,
  `MODELO` varchar(100) NOT NULL,
  `SERIE` varchar(100) DEFAULT NULL,
  `PATRIMONIO` varchar(100) DEFAULT NULL,
  `DVAT` varchar(100) DEFAULT NULL,
  `TAMANHO` varchar(100) DEFAULT NULL,
  `RESOLUCAO` varchar(100) DEFAULT NULL,
  `QUANTIDADE` int(11) NOT NULL,
  `SALA` varchar(100) DEFAULT NULL,
  `SITUACAO` varchar(100) DEFAULT NULL,
  `PROCESSO` varchar(100) DEFAULT NULL,
  `ORIGEM` varchar(100) DEFAULT NULL,
  `DATA_ENTRADA` datetime DEFAULT NULL,
  `DATA_SAIDA` datetime DEFAULT NULL,
  `OBS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `monitor`
--

INSERT INTO `monitor` (`ID`, `MARCA`, `MODELO`, `SERIE`, `PATRIMONIO`, `DVAT`, `TAMANHO`, `RESOLUCAO`, `QUANTIDADE`, `SALA`, `SITUACAO`, `PROCESSO`, `ORIGEM`, `DATA_ENTRADA`, `DATA_SAIDA`, `OBS`) VALUES
(1, 'ACER', 'K222HQL', 'MMT1LAA00773000B204221', '5006914', '41765', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(2, 'ACER', 'K222HQL', 'MMT1LAA00773000B294221', '5006924', '41777', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(3, 'HP', 'HSTND - 4031 - G', 'BRG530087L', '5005598', '40491', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(4, 'HP', 'HSTND - 4031 - G', 'BRG53009K9', '5005600', '40576', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(5, 'HP', 'HSTND - 4031 - G', 'BRG530088F', '5005643', '40509', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(6, 'HP', 'HSTND - 4031 - G', 'BRG52903KK', '5005595', '40572', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(7, 'HP', 'HSTND - 4031 - G', 'BRG530096Q', '5005645', '40530', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(8, 'HP', 'HSTND - 4031 - G', 'BRG52902LQ', '5005563', '40419', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(9, 'HP', 'HSTND - 4031 - G', 'BRG530088D', '5005621', '40502', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(10, 'HP', 'HSTND - 4031 - G', 'BRG52903PP', '5005599', '40428', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(11, 'HP', 'HSTND - 4031 - G', 'BRG530087K', '5005602', '40508', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(12, 'HP', 'HSTND - 4031 - G', 'BRG52902NR', '5005587', '40416', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(13, 'ITAUTEC', 'L1750S', '1437501001618', '5008713', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(14, 'ITAUTEC', 'W1942PEU', '0000002054313', '5008245', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(15, 'LENOVO', 'THINKVISION T22I-10', 'SVA151985', '5007876', '43822', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(16, 'LENOVO', 'THINKVISION T22I-10', 'SVA198378', '5007904', '43850', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(17, 'LENOVO', 'THINKVISION T22I-10', 'SVA199475', '5007895', '43841', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(18, 'LENOVO', 'THINKVISION T22I-10', 'SVA198890', '5007765', '43711', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(19, 'LENOVO', 'THINKVISION T22I-10', 'SVA198249', '5007773', '43719', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(20, 'LENOVO', 'THINKVISION T22I-10', 'SVA199324', '5007744', '43690', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(21, 'LENOVO', 'THINKVISION T22I-10', 'SVA152069', '5007737', '43683', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(22, 'LENOVO', 'THINKVISION T22I-10', 'SVA202937', '5007855', '43801', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(23, 'LENOVO', 'THINKVISION T22I-10', 'SVA128851', '5007695', '43641', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(24, 'LENOVO', 'THINKVISION T22I-10', 'SVA153336', '5007825', '43771', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(25, 'LENOVO', 'THINKVISION T22I-10', 'SVA199502', '5007683', '43629', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(26, 'LENOVO', 'THINKVISION T22I-10', 'SVA157354', '5007838', '43784', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(27, 'LENOVO', 'THINKVISION T22I-10', 'SVA197501', '5007777', '43723', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(28, 'LENOVO', 'THINKVISION T22I-10', 'SVA199342', '5007885', '43831', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(29, 'LENOVO', 'THINKVISION T22I-10', 'SVA152129', '5007792', '43738', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(30, 'LENOVO', 'THINKVISION T22I-10', 'SVA199729', '5007793', '43739', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(31, 'LENOVO', 'THINKVISION T22I-10', 'SVA199442', '5007751', '43697', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(32, 'LENOVO', 'THINKVISION T22I-10', 'SVA199317', '5007691', '43637', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(33, 'LENOVO', 'THINKVISION T22I-10', 'SVA202951', '5007753', '43699', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(34, 'LENOVO', 'THINKVISION T22I-10', 'SVA199730', '5007826', '43772', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(35, 'LENOVO', 'THINKVISION T22I-10', 'SVA197184', '5007635', '43581', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(36, 'LENOVO', 'THINKVISION T22I-10', 'SVA198068', '5007717', '43663', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(37, 'LENOVO', 'THINKVISION T22I-10', 'SVA199322', '5007873', '43819', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(38, 'LENOVO', 'THINKVISION T22I-10', 'SVA151253', '5007837', '43783', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(39, 'LENOVO', 'THINKVISION T22I-10', 'SVA198872', '5007775', '43721', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(40, 'LENOVO', 'THINKVISION T22I-10', 'SVA151139', '5007883', '43829', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(41, 'LENOVO', 'THINKVISION T22I-10', 'SVA197217', '5007684', '43630', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(42, 'LENOVO', 'THINKVISION T22I-10', 'SVA199478', '5007854', '43800', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(43, 'LENOVO', 'THINKVISION T22I-10', 'SVA198879', '5007799', '43745', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(44, 'LENOVO', 'THINKVISION T22I-10', 'SVA199507', '5007671', '43617', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(45, 'LENOVO', 'THINKVISION T22I-10', 'SVA199344', '5007761', '43707', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(46, 'LENOVO', 'THINKVISION T22I-10', 'SVA153418', '5007894', '43840', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(47, 'LENOVO', 'THINKVISION T22I-10', 'SVA198392', '5007787', '43733', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(48, 'LENOVO', 'THINKVISION T22I-10', 'SVA198579', '5007772', '43718', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(49, 'LENOVO', 'THINKVISION T22I-10', 'SVA199466', '5007803', '43749', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(50, 'LENOVO', 'THINKVISION T22I-10', 'SVA202568', '5007762', '43708', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(51, 'LENOVO', 'THINKVISION T22I-10', 'SVA198499', '5007747', '43693', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(52, 'LENOVO', 'THINKVISION T22I-10', 'SVA198845', '5007846', '43792', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(53, 'LENOVO', 'THINKVISION T22I-10', 'SVA199485', '5007819', '43765', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(54, 'LENOVO', 'THINKVISION T22I-10', 'SVA198894', '5007804', '43750', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(55, 'LENOVO', 'THINKVISION T22I-10', 'SVA199452', '5007754', '43700', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(56, 'LENOVO', 'THINKVISION T22I-10', 'SVA157020', '5007810', '43756', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(57, 'LENOVO', 'THINKVISION T22I-10', 'SVA197194', '5007808', '43754', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(58, 'LENOVO', 'THINKVISION T22I-10', 'SVA 15199', '5007756', '43702', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(59, 'LENOVO', 'THINKVISION T22I-10', 'SVA151129', '5007801', '43747', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(60, 'LENOVO', 'THINKVISION T22I-10', 'SVA199457', '5007802', '43746', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(61, 'LENOVO', 'THINKVISION T22I-10', 'SVA199736', '5007692', '43638', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(62, 'LENOVO', 'THINKVISION T22I-10', 'SVA198866', '5007634', '43580', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(63, 'LENOVO', 'THINKVISION T22I-10', 'SVA198320', '5007714', '43660', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(64, 'LENOVO', 'THINKVISION T22I-10', 'SVA198047', '5007880', '43826', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(65, 'LENOVO', 'THINKVISION T22I-10', 'SVA199447', '5007764', '43710', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(66, 'LENOVO', 'THINKVISION T22I-10', 'SVA198498', '5007766', '43712', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(67, 'LENOVO', 'THINKVISION T22I-10', 'SVA199714', '5007646', '43592', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(68, 'LENOVO', 'THINKVISION T22I-10', 'SVA151272', '5007685', '43631', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(69, 'LENOVO', 'THINKVISION T22I-10', 'SVA197211', '5007652', '43598', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(70, 'LENOVO', 'THINKVISION T22I-10', 'SVA199347', '5007757', '43703', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(71, 'LENOVO', 'THINKVISION T22I-10', 'SVA197410', '5007797', '43743', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(72, 'LENOVO', 'THINKVISION T22I-10', 'SVA198462', '5007700', '43646', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(73, 'LENOVO', 'THINKVISION T22I-10', 'SVA199323', '5007659', '43605', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(74, 'LENOVO', 'THINKVISION T22I-10', 'SVA198662', '5007778', '43724', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(75, 'LENOVO', 'THINKVISION T22I-10', 'SVA199353', '5007774', '43720', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(76, 'LENOVO', 'THINKVISION T22I-10', 'SVA151907', '5007664', '43610', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(77, 'LENOVO', 'THINKVISION T22I-10', 'SVA202939', '5007752', '43698', '-', '-', 1, '15', '-', '-', '23', '2024-10-30 12:00:00', NULL, ''),
(78, 'LENOVO', 'THINKVISION T22I-10', 'SVA151435', '5007865', '43881', '-', '-', 1, '15', '-', '-', '23', '2024-10-30 12:00:00', NULL, ''),
(79, 'LENOVO', 'THINKVISION T22I-10', 'SVA198030', '5007829', '43775', '-', '-', 1, '15', '-', '-', '20', '2024-10-30 12:00:00', NULL, ''),
(80, 'LENOVO', 'THINKVISION T22I-11', 'SVA151167', '5007779', '43725', '', '-', 1, '15', '-', '-', '19', '2024-10-30 12:00:00', NULL, ''),
(81, 'LENOVO', 'THINKVISION T22I-10', 'SVA201428', '5007851', '43797', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(82, 'LENOVO', 'THINKVISION T22I-10', 'SVA198512', '5007746', '43692', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(83, 'LENOVO', 'THINKVISION T22I-10', 'SVA199717', '5007813', '43759', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(84, 'LENOVO', 'THINKVISION T22I-10', 'SVA198396', '5007749', '43695', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(85, 'LENOVO', 'THINKVISION T22I-10', 'SVA198245', '5007833', '43779', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(86, 'LENOVO', 'THINKVISION T22I-10', 'SVA198081', '5007807', '43757', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(87, 'LG', 'L17NS - 7', '509SPMZ03763', '5008709', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(88, 'LG', 'L17NS - 7', '509SPKN03813', '5008710', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(89, 'LG', 'L17NS-7', '603SPGS51239', '5008707', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(90, 'LG', 'L17NS-7', '509SPGS03471', '5008708', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(91, 'LG', 'L17NS-7', '508SPBF80661', '5008711', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(92, 'LG', 'L17NS-7', '509SPGS03039', '5008712', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(93, 'LG', '22BN550Y - B', '310AZQV2X828', '5009127', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(94, 'LG', '22BN550Y - B', '303AZUJ7B574', '5009119', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(95, 'LG', '22BN550Y - B', '308AZKACN157', '5009123', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(96, 'LG', '22BN550Y - B', '303AZTH7D569', '5009142', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(97, 'LG', '22BN550Y - B', '310AZGF2X759', '5009143', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(98, 'LG', '22BN550Y - B', '310AZTH2X785', '5009144', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(99, 'LG', '22BN550Y - B', '308AZTHCN129', '5009145', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(100, 'LG', '22BN550Y - B', '310AZWS2X889', '5009113', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(101, 'LG', '22BN550Y - B', '310AZVN2X775', '5009114', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(102, 'POSITIVO', '22MP55PK', '904E00067', '5007115', '42689', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(103, 'POSITIVO', '22MP55PK', '904E00046', '5007128', '42655', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(104, 'POSITIVO', '22MP55PK', '904E04924', '5007098', '42670', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(105, 'POSITIVO', '22MP55PK', '904E00141', '5007008', '42669', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(106, 'POSITIVO', '22MP55PK', '904E00130', '5007118', '42675', '-', '-', 1, '6', 'OK', '-', '15', '2024-10-30 12:00:00', '2024-11-04 08:00:00', ''),
(107, 'POSITIVO', '22MP55PK', '904E00108', '5007108', '42671', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(108, 'POSITIVO', '22MP55PK', '904E00166', '5007091', '42683', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(109, 'POSITIVO', '22MP55PK', '904E00160', '5007088', '42668', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(110, 'POSITIVO', '22MP55PK', '904E02369', '5007099', '42686', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(111, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZSP48902', '5009075', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(112, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZFM48963', '5009053', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(113, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZUJ48886', '5009076', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(114, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZWS48577', '5008832', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(115, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZXC48266', '5008808', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(116, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZYE48922', '5009068', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(117, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZYE48946', '5009077', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(118, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZSP48950', '5009084', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(119, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZLW48904', '5009055', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(120, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZUJ48742', '5009067', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(121, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZZX48925', '5009086', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(122, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZFM59363', '5009089', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(123, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZJT48964', '5009054', 'S/N', '', '', 1, '17', 'OK', '', '', '2024-10-30 12:00:00', '2024-11-04 08:00:00', ''),
(124, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZDB48594', '5008786', 'S/N', '', '', 1, '17', 'OK', '', '', '2024-10-30 12:00:00', '2024-11-04 08:00:00', ''),
(125, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZKA48957', '5009082', 'S/N', '', '', 1, 'GABINETE', 'OK', '', '', '2024-10-30 12:00:00', '2024-11-04 08:00:00', ''),
(126, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZZX56493', '5009061', 'S/N', '', '', 1, '23', 'OK', '', '', '2024-10-30 12:00:00', '2024-11-04 08:00:00', ''),
(127, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZNK48887', '5009074', 'S/N', '', '', 1, '23', 'OK', '', '', '2024-10-30 12:00:00', '2024-11-04 08:00:00', ''),
(128, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZQV56492', '5009060', 'S/N', '', '', 1, '19', 'OK', '', '', '2024-10-30 12:00:00', '2024-11-04 08:00:00', ''),
(129, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZDB48930', '5009062', 'S/N', '', '', 1, '20', 'OK', '', '', '2024-10-30 12:00:00', '2024-11-04 08:00:00', ''),
(130, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZSP56350', '5009070', 'S/N', '', '', 1, '19', 'OK', '', '', '2024-10-30 12:00:00', '2024-11-04 08:00:00', ''),
(131, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZZX48949', '5009059', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(132, 'POSITIVO', '22BN550Y - DI.APOOFDZ', '305AZQV48948', '5009066', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(133, 'POSITIVO', '22MP55PK', '710E04164', '5007092', '42608', '', '', 1, '15', '-', '', '', '2024-10-30 12:00:00', NULL, ''),
(134, 'POSITIVO', '22MP55PK', '904E05008', '5007125', '42657', '', '', 1, '15', '-', '', '', '2024-10-30 12:00:00', NULL, ''),
(135, 'POSITIVO', '22MP55PK', '904E04729', '5007130', '42656', '', '', 1, '15', '-', '', '', '2024-10-30 12:00:00', NULL, ''),
(136, 'POSITIVO', '22MP55PK', '904E00155', '5007137', '42687', '', '', 1, '15', '-', '', '', '2024-10-30 12:00:00', NULL, ''),
(137, 'POSITIVO', '22MP55PK', '904E00150', '5007127', '42649', '', '', 1, '15', '-', '', '', '2024-10-30 12:00:00', NULL, ''),
(138, 'POSITIVO', '22MP55PK', '904E02370', '5007094', '42653', '', '', 1, '15', '-', '', '', '2024-10-30 12:00:00', NULL, ''),
(139, 'POSITIVO', '22MP55PK', '904E01094', '5007095', '42654', '', '', 1, '15', '-', '', '', '2024-10-30 12:00:00', NULL, ''),
(140, 'POSITIVO', '22MP55PK', '904E00174', '5007093', '42665', '', '', 1, '15', '-', '', '', '2024-10-30 12:00:00', NULL, ''),
(141, 'SAMSUNG', '633NW', 'CM16HQCSC05924P', '5003986', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(142, 'SAMSUNG', '633NW', 'CM16HQASC02387L', '5004092', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(143, 'SAMSUNG', '633NW', 'CM16HQASC01123Z', '5003957', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(144, 'SAMSUNG', '633NW', 'CM16HQASC02678H', '5004091', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(145, 'SAMSUNG', '633NW', 'CM16HQBSC00605L', 'S/N', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(146, 'SAMSUNG', '633NW', 'CM16HQASC02198Z', '5003950', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(147, 'SAMSUNG', '633NW', 'CM16HQASCZ3283J', '5003933', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, ''),
(148, 'SAMSUNG', '633NW', 'CM16HQCSC05363F', '5004131', 'S/N', '', '', 1, '15', 'OK', '', '', '2024-10-30 12:00:00', NULL, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `monitor_saida`
--

CREATE TABLE IF NOT EXISTS `monitor_saida` (
  `MONITOR_ID` int(11) NOT NULL,
  `MARCA` varchar(100) NOT NULL,
  `MODELO` varchar(100) NOT NULL,
  `SERIE` varchar(100) NOT NULL,
  `TAMANHO` varchar(100) NOT NULL,
  `RESOLUCAO` varchar(100) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL,
  `OBS` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mouse`
--

CREATE TABLE IF NOT EXISTS `mouse` (
  `ID` int(11) NOT NULL,
  `MARCA` varchar(100) NOT NULL,
  `MODELO` varchar(100) NOT NULL,
  `SERIE` varchar(100) NOT NULL,
  `TIPO` varchar(100) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL,
  `OBS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mouse_saida`
--

CREATE TABLE IF NOT EXISTS `mouse_saida` (
  `MOUSE_ID` int(11) NOT NULL,
  `MARCA` varchar(100) NOT NULL,
  `MODELO` varchar(100) NOT NULL,
  `SERIE` varchar(100) NOT NULL,
  `TIPO` varchar(100) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL,
  `OBS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notebook`
--

CREATE TABLE IF NOT EXISTS `notebook` (
  `ID` int(11) NOT NULL,
  `MARCA` varchar(100) NOT NULL,
  `MODELO` varchar(100) NOT NULL,
  `SERIE` varchar(100) DEFAULT NULL,
  `PATRIMONIO` varchar(100) DEFAULT NULL,
  `DVAT` varchar(100) DEFAULT NULL,
  `PROCESSADOR` varchar(100) DEFAULT NULL,
  `MEMORIA_RAM` varchar(100) DEFAULT NULL,
  `ARMAZENAMENTO` varchar(100) DEFAULT NULL,
  `QUANTIDADE` int(11) NOT NULL,
  `SALA` int(11) DEFAULT NULL,
  `SITUACAO` varchar(100) DEFAULT NULL,
  `PROCESSO` varchar(100) DEFAULT NULL,
  `ORIGEM` varchar(100) DEFAULT NULL,
  `DATA_ENTRADA` datetime DEFAULT NULL,
  `DATA_SAIDA` datetime DEFAULT NULL,
  `OBS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `notebook`
--

INSERT INTO `notebook` (`ID`, `MARCA`, `MODELO`, `SERIE`, `PATRIMONIO`, `DVAT`, `PROCESSADOR`, `MEMORIA_RAM`, `ARMAZENAMENTO`, `QUANTIDADE`, `SALA`, `SITUACAO`, `PROCESSO`, `ORIGEM`, `DATA_ENTRADA`, `DATA_SAIDA`, `OBS`) VALUES
(1, 'DELL', 'P53G', '3PNY442', '1003124', '40017', '-', '-', '-', 1, 15, 'OK', '-', '-', NULL, NULL, ''),
(2, 'SAMSUNG', 'NP370E4K-KD2BR', '068N9QAG800546T', '14001606', 'S/N', '', '', '', 1, 15, 'COM DEFEITO', '-', '', NULL, NULL, 'NÃO LIGA, SEM SINAL'),
(3, 'SAMSUNG', 'NP370E4K-KD2BR', '068N9QAG800579P', '14001607', '40819', '', '', '', 1, 15, 'COM DEFEITO', '-', '', NULL, NULL, ''),
(4, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087372W', '5008864', 'S/N', '', '', '', 1, 15, 'EM ANALISE', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, 'Windows não atualiza, windows corrompido.'),
(5, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087282S', '5005562', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(6, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087371R', '5008857', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(7, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087244Q', '5008859', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(8, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087345C', '5008860', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(9, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87089119Z', '5008865', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(10, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087260C', '5008866', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(11, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087180B', '5008867', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(12, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087138A', '5008868', 'S/N', '', '', '', 1, 15, 'EM ANALISE', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, 'Windows não atualiza, windows corrompido.'),
(13, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087187S', '5008869', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(14, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087169E', '5008870', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(15, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087188F', '5008873', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(16, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087280I', '5008874', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(17, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087195D', '5008875', 'S/N', '', '', '', 1, 15, 'EM ANALISE', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, 'Windows não atualiza, windows corrompido.'),
(18, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087220A', '5008876', 'S/N', '', '', '', 1, 15, 'EM ANALISE', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, 'Windows não atualiza, windows corrompido.'),
(19, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087118U', '5008877', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(20, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087366D', '5008878', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(21, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087255Y', '5008879', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(22, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087300B', '5008880', 'S/N', '', '', '', 1, 15, 'EM ANALISE', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, 'Windows não atualiza, windows corrompido.'),
(23, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087351L', '5008881', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(24, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087152C', '5008882', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(25, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087342N', '5008883', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(26, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087374G', '5008884', 'S/N', '', '', '', 1, 15, 'EM ANALISE', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, 'Windows não atualiza, windows corrompido.'),
(27, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087325W', '5008885', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(28, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087129C', '5008886', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(29, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087186F', '5008887', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(30, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087117P', '5008888', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(31, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087357F', '5008889', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(32, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087115F', '5008890', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(33, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087317D', '5008892', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(34, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087285H', '5008893', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(35, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87807071G', '5008894', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(36, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087338E', '5008895', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(37, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087216R', '5008896', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(38, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087079A', '5008897', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(39, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087341I', '5008898', 'S/N', '', '', '', 1, 15, 'EM ANALISE', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, 'Windows não atualiza, windows corrompido.'),
(40, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087354A', '5008899', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, ''),
(41, 'VAIO POSITIVO', 'VAIO FE15VJFE54F11X', '87087192O', '5008900', 'S/N', '', '', '', 1, 15, 'OK', '23.27.000000791-8', 'COMPRA', '2023-08-17 15:00:00', NULL, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `processo_compra`
--

CREATE TABLE IF NOT EXISTS `processo_compra` (
  `id` int(11) NOT NULL,
  `numerosei` varchar(100) DEFAULT NULL,
  `notafiscal` varchar(100) DEFAULT NULL,
  `notafiscal_valor` varchar(100) DEFAULT NULL,
  `objeto` text DEFAULT NULL,
  `objeto_detalhes` text NOT NULL,
  `quantidade` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `processo_compra`
--

INSERT INTO `processo_compra` (`id`, `numerosei`, `notafiscal`, `notafiscal_valor`, `objeto`, `objeto_detalhes`, `quantidade`) VALUES
(1, '22.27.000001375-0', '484276', '26.850,00', 'TABLET SAMSUNG TAB A8 4G GRAFITE', 'TABLET SAMSUNG BSM-X205 GALAXY TAB A8 4G GRAFITE: Modelo: SM-x205NZAUZTO Conectividade: 4G e Wi-Fi Memória RAM: 8GB (mínimo) Capacidade de Armazenamento: 256GB Tela: 11 polegadas', 15),
(2, '23.27.000000791-8', '000.003.790', '269.280,00', 'AQUISIÇÃO DE NOTEBOOKS', 'Notebook Processador: Intel Core i5 11ª Geração ou AMD Ryzen 5 seie 5000 com desempenho mínimo de 10.000 no cpumark. Conforme especificações do Edital. Marca: Positivo', 44);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tablet`
--

CREATE TABLE IF NOT EXISTS `tablet` (
  `ID` int(11) NOT NULL,
  `MARCA` varchar(100) NOT NULL,
  `CAPACIDADE` varchar(100) NOT NULL,
  `VELOCIDADE` varchar(100) NOT NULL,
  `INTERFACE` varchar(100) NOT NULL,
  `CONEXAO` varchar(100) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL,
  `OBS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `teclado`
--

CREATE TABLE IF NOT EXISTS `teclado` (
  `ID` int(11) NOT NULL,
  `MARCA` varchar(100) NOT NULL,
  `MODELO` varchar(100) NOT NULL,
  `SERIE` varchar(100) NOT NULL,
  `TIPO` varchar(100) NOT NULL,
  `LAYOUT` varchar(100) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL,
  `OBS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `teclado_saida`
--

CREATE TABLE IF NOT EXISTS `teclado_saida` (
  `TECLADO_ID` int(11) NOT NULL,
  `MARCA` varchar(100) NOT NULL,
  `MODELO` varchar(100) NOT NULL,
  `SERIE` varchar(100) NOT NULL,
  `TIPO` varchar(100) NOT NULL,
  `LAYOUT` varchar(100) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL,
  `OBS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `componentes`
--
ALTER TABLE `componentes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `componentes_saida`
--
ALTER TABLE `componentes_saida`
  ADD KEY `componente_id` (`COMPONENTE_ID`);

--
-- Indexes for table `cpu`
--
ALTER TABLE `cpu`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cpu_saida`
--
ALTER TABLE `cpu_saida`
  ADD KEY `CPU_ID` (`CPU_ID`);

--
-- Indexes for table `diversos`
--
ALTER TABLE `diversos`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `impressora`
--
ALTER TABLE `impressora`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `impressora_saida`
--
ALTER TABLE `impressora_saida`
  ADD PRIMARY KEY (`IMPRESSORA_ID`);

--
-- Indexes for table `monitor`
--
ALTER TABLE `monitor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `monitor_saida`
--
ALTER TABLE `monitor_saida`
  ADD PRIMARY KEY (`MONITOR_ID`);

--
-- Indexes for table `mouse`
--
ALTER TABLE `mouse`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mouse_saida`
--
ALTER TABLE `mouse_saida`
  ADD PRIMARY KEY (`MOUSE_ID`);

--
-- Indexes for table `notebook`
--
ALTER TABLE `notebook`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `processo_compra`
--
ALTER TABLE `processo_compra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tablet`
--
ALTER TABLE `tablet`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `teclado`
--
ALTER TABLE `teclado`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `teclado_saida`
--
ALTER TABLE `teclado_saida`
  ADD PRIMARY KEY (`TECLADO_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `componentes`
--
ALTER TABLE `componentes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cpu`
--
ALTER TABLE `cpu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `diversos`
--
ALTER TABLE `diversos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `impressora`
--
ALTER TABLE `impressora`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `monitor`
--
ALTER TABLE `monitor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=149;
--
-- AUTO_INCREMENT for table `mouse`
--
ALTER TABLE `mouse`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notebook`
--
ALTER TABLE `notebook`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `processo_compra`
--
ALTER TABLE `processo_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tablet`
--
ALTER TABLE `tablet`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `teclado`
--
ALTER TABLE `teclado`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `componentes_saida`
--
ALTER TABLE `componentes_saida`
  ADD CONSTRAINT `componentes_saida_ibfk_1` FOREIGN KEY (`COMPONENTE_ID`) REFERENCES `componentes` (`ID`);

--
-- Limitadores para a tabela `cpu_saida`
--
ALTER TABLE `cpu_saida`
  ADD CONSTRAINT `cpu_saida_ibfk_1` FOREIGN KEY (`CPU_ID`) REFERENCES `cpu` (`ID`);

--
-- Limitadores para a tabela `impressora_saida`
--
ALTER TABLE `impressora_saida`
  ADD CONSTRAINT `impressora_saida_ibfk_1` FOREIGN KEY (`IMPRESSORA_ID`) REFERENCES `impressora` (`ID`);

--
-- Limitadores para a tabela `monitor_saida`
--
ALTER TABLE `monitor_saida`
  ADD CONSTRAINT `monitor_saida_ibfk_1` FOREIGN KEY (`MONITOR_ID`) REFERENCES `monitor` (`ID`);

--
-- Limitadores para a tabela `mouse_saida`
--
ALTER TABLE `mouse_saida`
  ADD CONSTRAINT `mouse_saida_ibfk_1` FOREIGN KEY (`MOUSE_ID`) REFERENCES `mouse` (`ID`);

--
-- Limitadores para a tabela `teclado_saida`
--
ALTER TABLE `teclado_saida`
  ADD CONSTRAINT `teclado_saida_ibfk_1` FOREIGN KEY (`TECLADO_ID`) REFERENCES `teclado` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
