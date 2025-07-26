-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 26-Nov-2019 às 22:12
-- Versão do servidor: 5.5.36
-- PHP Version: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `odonto`
--
CREATE DATABASE IF NOT EXISTS `odonto` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `odonto`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `data_nascimento` date NOT NULL,
  `data_cadastro` date NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `rg` varchar(45) NOT NULL,
  `telefone` varchar(14) NOT NULL,
  `email` varchar(45) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `cep` varchar(15) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `data_nascimento`, `data_cadastro`, `cpf`, `rg`, `telefone`, `email`, `endereco`, `cep`, `sexo`) VALUES
(1, 'Cliente teste', '2000-06-02', '2019-11-19', 'teste', 'teste', '2', 'teste', 'teste', 'teste', 'M'),
(2, 'Maria', '2000-06-02', '2019-11-21', 'teste', 'teste', 'teste', 'teste', 'teste', 'teste', 'M'),
(4, 'teste2020', '1998-12-10', '2019-11-24', 'teste2002', 'teste2001', 'teste2004', 'teste2003', 'teste2005', 'teste2030', 'M');

-- --------------------------------------------------------

--
-- Estrutura da tabela `consulta`
--

CREATE TABLE IF NOT EXISTS `consulta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_consulta` date NOT NULL,
  `hora_consulta` time NOT NULL,
  `valor_consulta` decimal(10,2) DEFAULT NULL,
  `status_consulta` varchar(45) DEFAULT NULL,
  `pagou` datetime DEFAULT NULL,
  `tipo_pagamento` varchar(45) DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_dentista` int(11) NOT NULL,
  `id_servico` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Consulta_Cliente_idx` (`id_cliente`),
  KEY `fk_Consulta_Dentista1_idx` (`id_dentista`),
  KEY `fk_consulta_servicos1_idx` (`id_servico`),
  KEY `fk_consulta_funcionario1_idx` (`id_funcionario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `consulta`
--

INSERT INTO `consulta` (`id`, `data_consulta`, `hora_consulta`, `valor_consulta`, `status_consulta`, `pagou`, `tipo_pagamento`, `id_cliente`, `id_dentista`, `id_servico`, `id_funcionario`) VALUES
(2, '2001-06-02', '11:00:00', '50.00', 'compareceu', '2019-11-23 21:44:02', 'cartao', 1, 1, 3, 1),
(3, '2000-06-02', '11:00:00', '500.00', 'compareceu', '2019-11-23 21:50:49', 'dinheiro', 2, 1, 1, 1),
(4, '1228-12-15', '15:00:00', '5000.00', 'compareceu', '2019-11-24 21:53:42', 'dinheiro', 1, 1, 1, 1),
(5, '2005-12-18', '11:30:00', NULL, 'ausente', NULL, NULL, 1, 8, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `dentista`
--

CREATE TABLE IF NOT EXISTS `dentista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `data_nascimento` date NOT NULL,
  `data_cadastro` date NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `rg` varchar(45) NOT NULL,
  `cfo` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `cep` varchar(15) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `status` varchar(10) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Dentista_Perfil1_idx` (`id_perfil`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `dentista`
--

INSERT INTO `dentista` (`id`, `nome`, `data_nascimento`, `data_cadastro`, `cpf`, `rg`, `cfo`, `telefone`, `email`, `endereco`, `cep`, `sexo`, `login`, `senha`, `status`, `id_perfil`) VALUES
(1, 'Dentista teste 1', '2000-06-02', '2019-11-19', 'teste', 'teste', 'teste', 'teste', 'teste', 'teste', 'teste', 'M', 'teste', '1', 'ativo', 2),
(3, 'marcos', '2000-06-02', '2019-11-24', 'teste', 'teste', 'teste', 'v', 'teste', 'teste', 'v', 'F', 'lucas', '1234', 'ativo', 2),
(8, 'jackão', '2000-06-02', '2019-11-24', 'meu cu', 'teste', 'v', 'teste', 'teste', 'teste', 'teste', 'F', 'marcos', '10', 'ativo', 2),
(9, 'teste4020', '1885-12-15', '2019-11-24', 'teste4002', 'teste4001', 'teste4003', 'teste4005', 'teste4004', 'teste4006', 'teste4040', 'M', 'teste4008', 'teste4009', 'ativo', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `data_nascimento` date NOT NULL,
  `data_cadastro` date NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `rg` varchar(45) NOT NULL,
  `telefone` varchar(14) NOT NULL,
  `email` varchar(45) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  `cep` varchar(15) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `status` varchar(10) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Funcionario_Perfil1_idx` (`id_perfil`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`id`, `nome`, `data_nascimento`, `data_cadastro`, `cpf`, `rg`, `telefone`, `email`, `endereco`, `cep`, `sexo`, `login`, `senha`, `status`, `id_perfil`) VALUES
(1, 'Admin', '2001-06-02', '2019-11-19', 'teste', 'teste', 'teste', 'teste', 'teste', 'teste', 'M', 'admin', '1', 'ativo', 1),
(2, 'teste', '2000-06-02', '2019-11-23', 'teste', 'teste', 'teste', 'teste', 'teste', 'teste', 'M', 'teste', '5', 'ativo', 1),
(5, 'teste58', '2000-06-02', '2019-11-24', 'teste58', 'teste58', 'v', 'teste58', 'teste58', 'v', 'F', 'teste58', 'vteste58', 'ativo', 1),
(6, 'teste3000', '1500-12-15', '2019-11-24', 'teste3002', 'teste3001', 'teste3004', 'teste3003', 'teste3005', 'teste3006', 'M', 'teste3007', 'teste3008', 'ativo', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `icone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `menu`
--

INSERT INTO `menu` (`id`, `titulo`, `link`, `icone`) VALUES
(1, 'Clientes', 'listar_cliente.jsp', 'cliente.png'),
(2, 'Dentistas', 'listar_dentista.jsp', 'dentista.png'),
(3, 'Menus', 'listar_menu.jsp', 'menu.png'),
(4, 'Perfis', 'listar_perfil.jsp', 'perfil.png'),
(5, 'Funcionários', 'listar_funcionario.jsp', 'funcionario.png'),
(6, 'Serviços ', 'listar_servicos.jsp', 'servicos.png'),
(7, 'Consultas', 'listar_consulta.jsp', 'consulta.png'),
(8, 'Consultas ', 'listar_consulta_dentista.jsp', 'consulta_dentista.png'),
(9, 'Clientes ', 'listar_cliente_dentista.jsp', 'cliente_dentista.png'),
(10, 'Funcionários', 'listar_funcionario_dentista.jsp', 'dentista.png'),
(11, 'Dentistas', 'listar_dentista_dentista.jsp', 'dentista.png'),
(12, 'Serviços', 'listar_servicos_dentista.jsp', 'servicos.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`id`, `nome`, `descricao`) VALUES
(1, 'Administrador', 'Administrador do Sistema'),
(2, 'Dentista ', 'Dentista de manutenÃ§Ã£o'),
(3, 'Funcionario ', 'Atedente ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil_menu`
--

CREATE TABLE IF NOT EXISTS `perfil_menu` (
  `id_perfil` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  PRIMARY KEY (`id_perfil`,`id_menu`),
  KEY `fk_Perfil_has_Menu_Menu1_idx` (`id_menu`),
  KEY `fk_Perfil_has_Menu_Perfil1_idx` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `perfil_menu`
--

INSERT INTO `perfil_menu` (`id_perfil`, `id_menu`) VALUES
(1, 1),
(3, 1),
(1, 2),
(3, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(3, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE IF NOT EXISTS `servicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`id`, `nome`) VALUES
(1, 'Manutençao'),
(3, 'Ortondontia');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `fk_Consulta_Cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Consulta_Dentista1` FOREIGN KEY (`id_dentista`) REFERENCES `dentista` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_consulta_funcionario1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_consulta_servicos1` FOREIGN KEY (`id_servico`) REFERENCES `servicos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `dentista`
--
ALTER TABLE `dentista`
  ADD CONSTRAINT `fk_Dentista_Perfil1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_Funcionario_Perfil1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `perfil_menu`
--
ALTER TABLE `perfil_menu`
  ADD CONSTRAINT `fk_Perfil_has_Menu_Menu1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Perfil_has_Menu_Perfil1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;