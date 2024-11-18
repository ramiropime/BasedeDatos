-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 18, 2024 at 11:04 PM
-- Server version: 8.0.17
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `calculoalgebra`
--

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--

CREATE TABLE `departamentos` (
  `code_dep` int(5) NOT NULL,
  `nombre_dep` varchar(30) NOT NULL,
  `cedula_jefe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `departamentos`
--

INSERT INTO `departamentos` (`code_dep`, `nombre_dep`, `cedula_jefe`) VALUES
(0, 'Gerencia', 43890231),
(1, 'Teleinformatico', 75556734),
(2, 'Desarrollo', 23423445),
(3, 'Soporte Tecnico', 71145643);

-- --------------------------------------------------------

--
-- Table structure for table `dependientes`
--

CREATE TABLE `dependientes` (
  `cedula` int(11) NOT NULL,
  `nombre_dep` varchar(30) NOT NULL,
  `sexo` enum('F','M','','') NOT NULL,
  `fechan` date NOT NULL,
  `parentesco` enum('Hijo','Hija','Conyuge','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dependientes`
--

INSERT INTO `dependientes` (`cedula`, `nombre_dep`, `sexo`, `fechan`, `parentesco`) VALUES
(2313141, 'Hector', 'M', '2000-01-16', 'Conyuge'),
(78321312, 'Juanita', 'F', '2000-11-12', 'Hija'),
(435333221, 'Jorge', 'M', '1998-02-12', 'Hijo'),
(711347234, 'Gloria', 'F', '2009-08-15', 'Hija');

-- --------------------------------------------------------

--
-- Table structure for table `personas`
--

CREATE TABLE `personas` (
  `cedula` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `primer_apellido` varchar(30) NOT NULL,
  `segundo_apellido` varchar(30) NOT NULL,
  `sexo` enum('F','M') NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` int(11) NOT NULL,
  `salario` int(10) NOT NULL,
  `cedula_sub(jefe)` int(11) NOT NULL,
  `code_dep` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `personas`
--

INSERT INTO `personas` (`cedula`, `nombre`, `primer_apellido`, `segundo_apellido`, `sexo`, `direccion`, `telefono`, `salario`, `cedula_sub(jefe)`, `code_dep`) VALUES
(1221343, 'Gloria', 'Betancur', 'Graces', 'F', 'Tr. 2313', 34253426, 1235000, 75556734, 2),
(2131532, 'Pedro', 'Ochoa', 'Pelaez', 'M', 'Cr.432', 65463343, 170000, 75556734, 1),
(2313141, 'Ana maria', 'Betancur', 'Bermudez', 'F', 'Cra.342', 2343246, 170000, 43890231, 2),
(23128321, 'Fabio', 'Solano', 'Perez', 'M', 'Clr.3432', 2315544, 120000, 75556734, 1),
(78321312, 'Carlos', 'Betancur', 'Agudelo', 'M', 'Cll.43223', 43254367, 150000, 75556734, 1),
(435333221, 'Patricia', 'Angel', 'Guzman', 'F', 'Cll.23131', 574532234, 1350000, 71145643, 3),
(438912301, 'Claudia', 'Gonzalez', 'Beltran', 'F', 'Cl.2312', 485935839, 1800000, 43890231, 0),
(711347234, 'Juan', 'Mesa', 'Uribe', 'M', 'Cra.2312', 564232314, 160000, 71145643, 3),
(734532849, 'Mario', 'Gomez', 'Angel', 'M', 'Cr. 2313', 34324234, 120000, 23423445, 2);

-- --------------------------------------------------------

--
-- Table structure for table `proyectos`
--

CREATE TABLE `proyectos` (
  `num_proyecto` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `lugar` varchar(30) NOT NULL,
  `code_dep` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `proyectos`
--

INSERT INTO `proyectos` (`num_proyecto`, `nombre`, `lugar`, `code_dep`) VALUES
(129001, 'Registro y Matricula', 'Bloque1', 2),
(129002, 'Notas', 'Campus', 2),
(129003, 'Paso de Aplicativos', 'Bloque21', 2),
(139001, 'RedLan', 'Bloque 14', 1),
(149002, 'Licenciamiento', 'Campus', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`code_dep`),
  ADD KEY `cedula_jefe` (`cedula_jefe`);

--
-- Indexes for table `dependientes`
--
ALTER TABLE `dependientes`
  ADD PRIMARY KEY (`cedula`),
  ADD KEY `cedula` (`cedula`);

--
-- Indexes for table `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`cedula`),
  ADD KEY `cod_dep` (`code_dep`),
  ADD KEY `cedula_sub(jefe)` (`cedula_sub(jefe)`);

--
-- Indexes for table `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`num_proyecto`),
  ADD KEY `code_dep` (`code_dep`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dependientes`
--
ALTER TABLE `dependientes`
  ADD CONSTRAINT `cedula` FOREIGN KEY (`cedula`) REFERENCES `personas` (`cedula`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `ced_jefe` FOREIGN KEY (`cedula_sub(jefe)`) REFERENCES `departamentos` (`cedula_jefe`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `code_dep` FOREIGN KEY (`code_dep`) REFERENCES `departamentos` (`code_dep`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
