-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Nov-2024 às 13:20
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `inventario`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `botao_src` varchar(100) NOT NULL,
  `nomecategoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `componentes` (
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

CREATE TABLE `componentes_saida` (
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

CREATE TABLE `cpu` (
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
  `PROCESSO` varchar(100) NOT NULL,
  `OBS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cpu`
--

INSERT INTO `cpu` (`ID`, `MARCA`, `MODELO`, `SERIE`, `PATRIMONIO`, `DVAT`, `PROCESSADOR`, `MEMORIA_RAM`, `ARMAZENAMENTO`, `QUANTIDADE`, `SALA`, `PROCESSO`, `OBS`) VALUES
(1, ' Samsung', ' TESTE', ' 0001', ' 00500', ' ', ' 1111', ' ', ' 256', 1, 15, ' ', ' Teste xx');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cpu_saida`
--

CREATE TABLE `cpu_saida` (
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

CREATE TABLE `diversos` (
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

CREATE TABLE `impressora` (
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

CREATE TABLE `impressora_saida` (
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

CREATE TABLE `monitor` (
  `ID` int(11) NOT NULL,
  `MARCA` varchar(100) NOT NULL,
  `MODELO` varchar(100) NOT NULL,
  `SERIE` varchar(100) NOT NULL,
  `TAMANHO` varchar(100) NOT NULL,
  `RESOLUCAO` varchar(100) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL,
  `OBS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `monitor_saida`
--

CREATE TABLE `monitor_saida` (
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

CREATE TABLE `mouse` (
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

CREATE TABLE `mouse_saida` (
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

CREATE TABLE `notebook` (
  `ID` int(11) NOT NULL,
  `MARCA` varchar(100) NOT NULL,
  `MODELO` varchar(100) NOT NULL,
  `SERIE` varchar(100) NOT NULL,
  `PROCESSADOR` varchar(100) NOT NULL,
  `MEMORIA_RAM` varchar(100) NOT NULL,
  `ARMAZENAMENTO` varchar(100) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL,
  `OBS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notebook_saida`
--

CREATE TABLE `notebook_saida` (
  `NOTEBOOK_ID` int(11) NOT NULL,
  `MARCA` varchar(100) NOT NULL,
  `MODELO` varchar(100) NOT NULL,
  `SERIE` varchar(100) NOT NULL,
  `PROCESSADOR` varchar(100) NOT NULL,
  `MEMORIA_RAM` varchar(100) NOT NULL,
  `ARMAZENAMENTO` varchar(100) NOT NULL,
  `QUANTIDADE` int(11) NOT NULL,
  `OBS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `processo_compra`
--

CREATE TABLE `processo_compra` (
  `id` int(11) NOT NULL,
  `numerosei` varchar(100) DEFAULT NULL,
  `notafiscal` varchar(100) DEFAULT NULL,
  `notafiscal_valor` varchar(100) DEFAULT NULL,
  `objeto` text DEFAULT NULL,
  `objeto_detalhes` text NOT NULL,
  `quantidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `processo_compra`
--

INSERT INTO `processo_compra` (`id`, `numerosei`, `notafiscal`, `notafiscal_valor`, `objeto`, `objeto_detalhes`, `quantidade`) VALUES
(1, '22.27.000001375-0', '484276', '26.850,00', 'TABLET SAMSUNG TAB A8 4G GRAFITE', 'TABLET SAMSUNG BSM-X205 GALAXY TAB A8 4G GRAFITE: Modelo: SM-x205NZAUZTO Conectividade: 4G e Wi-Fi Memória RAM: 8GB (mínimo) Capacidade de Armazenamento: 256GB Tela: 11 polegadas', 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tablet`
--

CREATE TABLE `tablet` (
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

CREATE TABLE `teclado` (
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

CREATE TABLE `teclado_saida` (
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
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `componentes`
--
ALTER TABLE `componentes`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `componentes_saida`
--
ALTER TABLE `componentes_saida`
  ADD KEY `componente_id` (`COMPONENTE_ID`);

--
-- Índices para tabela `cpu`
--
ALTER TABLE `cpu`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `cpu_saida`
--
ALTER TABLE `cpu_saida`
  ADD KEY `CPU_ID` (`CPU_ID`);

--
-- Índices para tabela `diversos`
--
ALTER TABLE `diversos`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `impressora`
--
ALTER TABLE `impressora`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `impressora_saida`
--
ALTER TABLE `impressora_saida`
  ADD PRIMARY KEY (`IMPRESSORA_ID`);

--
-- Índices para tabela `monitor`
--
ALTER TABLE `monitor`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `monitor_saida`
--
ALTER TABLE `monitor_saida`
  ADD PRIMARY KEY (`MONITOR_ID`);

--
-- Índices para tabela `mouse`
--
ALTER TABLE `mouse`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `mouse_saida`
--
ALTER TABLE `mouse_saida`
  ADD PRIMARY KEY (`MOUSE_ID`);

--
-- Índices para tabela `notebook`
--
ALTER TABLE `notebook`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `notebook_saida`
--
ALTER TABLE `notebook_saida`
  ADD PRIMARY KEY (`NOTEBOOK_ID`);

--
-- Índices para tabela `processo_compra`
--
ALTER TABLE `processo_compra`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tablet`
--
ALTER TABLE `tablet`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `teclado`
--
ALTER TABLE `teclado`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `teclado_saida`
--
ALTER TABLE `teclado_saida`
  ADD PRIMARY KEY (`TECLADO_ID`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `componentes`
--
ALTER TABLE `componentes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cpu`
--
ALTER TABLE `cpu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `diversos`
--
ALTER TABLE `diversos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `impressora`
--
ALTER TABLE `impressora`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `monitor`
--
ALTER TABLE `monitor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mouse`
--
ALTER TABLE `mouse`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notebook`
--
ALTER TABLE `notebook`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `processo_compra`
--
ALTER TABLE `processo_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tablet`
--
ALTER TABLE `tablet`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `teclado`
--
ALTER TABLE `teclado`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
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
-- Limitadores para a tabela `notebook_saida`
--
ALTER TABLE `notebook_saida`
  ADD CONSTRAINT `notebook_saida_ibfk_1` FOREIGN KEY (`NOTEBOOK_ID`) REFERENCES `notebook` (`ID`);

--
-- Limitadores para a tabela `teclado_saida`
--
ALTER TABLE `teclado_saida`
  ADD CONSTRAINT `teclado_saida_ibfk_1` FOREIGN KEY (`TECLADO_ID`) REFERENCES `teclado` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
