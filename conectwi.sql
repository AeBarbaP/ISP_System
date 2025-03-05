-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2025 at 10:31 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `conectwi`
--

-- --------------------------------------------------------

--
-- Table structure for table `acciones`
--

CREATE TABLE `acciones` (
  `id` int(11) NOT NULL,
  `accion` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `antenas`
--

CREATE TABLE `antenas` (
  `id` int(11) NOT NULL,
  `marca` varchar(15) NOT NULL,
  `MAC` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catalogo_comunidades`
--

CREATE TABLE `catalogo_comunidades` (
  `id` int(11) NOT NULL,
  `comunidad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `catalogo_comunidades`
--

INSERT INTO `catalogo_comunidades` (`id`, `comunidad`) VALUES
(1, 'Comunidad 1'),
(2, 'Comunidad 2');

-- --------------------------------------------------------

--
-- Table structure for table `catalogo_estado`
--

CREATE TABLE `catalogo_estado` (
  `id` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `catalogo_estado`
--

INSERT INTO `catalogo_estado` (`id`, `estado`) VALUES
(1, 'Zacatecas');

-- --------------------------------------------------------

--
-- Table structure for table `catalogo_municipio`
--

CREATE TABLE `catalogo_municipio` (
  `id` int(11) NOT NULL,
  `municipio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `catalogo_municipio`
--

INSERT INTO `catalogo_municipio` (`id`, `municipio`) VALUES
(1, 'Genaro Codina');

-- --------------------------------------------------------

--
-- Table structure for table `catalogo_paquetes`
--

CREATE TABLE `catalogo_paquetes` (
  `id` int(11) NOT NULL,
  `paquetes` varchar(100) NOT NULL,
  `velocidad` int(11) NOT NULL,
  `costo` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `catalogo_paquetes`
--

INSERT INTO `catalogo_paquetes` (`id`, `paquetes`, `velocidad`, `costo`) VALUES
(1, 'Básico', 7, '10.50'),
(2, 'Intermedio', 12, '12.12'),
(3, 'Avanzado', 18, '18.09');

-- --------------------------------------------------------

--
-- Table structure for table `cat_pagos`
--

CREATE TABLE `cat_pagos` (
  `id` int(11) NOT NULL,
  `nombre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `folio` varchar(35) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `domicilio` varchar(150) NOT NULL,
  `calle` varchar(30) DEFAULT NULL,
  `colonia` varchar(30) DEFAULT NULL,
  `comunidad` varchar(30) NOT NULL,
  `municipio` varchar(30) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `cp` int(6) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `referencias` varchar(200) NOT NULL,
  `identificacion` varchar(20) NOT NULL,
  `comprobante` varchar(20) NOT NULL,
  `servicio` int(11) NOT NULL,
  `antena` varchar(25) NOT NULL,
  `direccionip` varchar(12) NOT NULL,
  `fecha_contrato` date NOT NULL,
  `fecha_limite` date NOT NULL,
  `fecha_corte` date NOT NULL,
  `cuota` varchar(6) NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id`, `folio`, `nombre`, `domicilio`, `calle`, `colonia`, `comunidad`, `municipio`, `estado`, `cp`, `telefono`, `referencias`, `identificacion`, `comprobante`, `servicio`, `antena`, `direccionip`, `fecha_contrato`, `fecha_limite`, `fecha_corte`, `cuota`, `estatus`) VALUES
(1, '202502242354403E354EAA', 'JesusRLV', 'Tulipanes 12 A', NULL, NULL, '1', '1', '1', 98608, '4915000', 'Casa', 'INE', 'luz', 2, '', '', '2025-02-24', '2025-03-24', '2025-03-29', '12.12', 1),
(2, '202502242354403E354EA1', 'JesusRLV 2', 'Tulipanes 12 A', NULL, NULL, '1', '1', '1', 98608, '4915000', 'Casa', 'INE', 'luz', 2, '', '', '2025-02-24', '2025-03-24', '2025-03-29', '12.12', 1),
(3, '202502242354403E354EA2', 'JesusRLV 3', 'Tulipanes 12 A', NULL, NULL, '1', '1', '1', 98608, '4915000', 'Casa', 'INE', 'luz', 2, '', '', '2025-02-24', '2025-03-24', '2025-03-29', '12.12', 1),
(4, '202502242354403E354EA3', 'Ana Elisa B', 'Tulipanes 12 A', NULL, NULL, '1', '1', '1', 98608, '4915000', 'Casa', 'INE', 'luz', 2, '', '', '2025-02-24', '2025-03-24', '2025-03-29', '12.12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `conceptos`
--

CREATE TABLE `conceptos` (
  `id` int(11) NOT NULL,
  `concepto` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cortes`
--

CREATE TABLE `cortes` (
  `id` int(11) NOT NULL,
  `folio_cliente` varchar(35) NOT NULL,
  `username` varchar(15) NOT NULL,
  `folio_corte` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tecnico` int(11) NOT NULL,
  `estatus` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incidencias`
--

CREATE TABLE `incidencias` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `folio_cliente` varchar(35) NOT NULL,
  `username` varchar(15) NOT NULL,
  `tecnico` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha_reporte` datetime NOT NULL,
  `fecha_resolucion` datetime NOT NULL,
  `comentario_tecnico` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs_login`
--

CREATE TABLE `logs_login` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `inicio` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `ip` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs_users`
--

CREATE TABLE `logs_users` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `accion` int(11) NOT NULL,
  `hora` datetime NOT NULL,
  `folio_cliente` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `num_pago` varchar(35) NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `folio_contrato` varchar(35) NOT NULL,
  `concepto` int(11) NOT NULL,
  `periodo` varchar(25) NOT NULL,
  `tipo_pago` int(11) DEFAULT NULL,
  `descuento` varchar(7) DEFAULT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pagos`
--

INSERT INTO `pagos` (`id`, `num_pago`, `fecha_pago`, `folio_contrato`, `concepto`, `periodo`, `tipo_pago`, `descuento`, `total`) VALUES
(1, '1', '2025-03-05 00:55:00', '202502242354403E354EA3', 1, '1', 1, '0', 1000),
(2, 'CW2025-002', '2025-03-05 21:09:30', '202502242354403E354EA3', 1, '2', NULL, NULL, 350);

-- --------------------------------------------------------

--
-- Table structure for table `pagos_generales`
--

CREATE TABLE `pagos_generales` (
  `id` int(11) NOT NULL,
  `folio_pago` varchar(12) NOT NULL,
  `monto_total` varchar(7) NOT NULL,
  `usuario` varchar(15) NOT NULL,
  `folio_contrato` varchar(15) NOT NULL,
  `fecha_pago` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promociones`
--

CREATE TABLE `promociones` (
  `id` int(11) NOT NULL,
  `promo` varchar(15) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tecnicos`
--

CREATE TABLE `tecnicos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_actualizacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `id` int(11) NOT NULL,
  `tipo` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `pwd` varchar(10) NOT NULL,
  `nombre` varchar(11) NOT NULL,
  `tipo_usr` int(11) NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `pwd`, `nombre`, `tipo_usr`, `estatus`) VALUES
(1, 'aebarba', '123456789', 'Ana Elisa B', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acciones`
--
ALTER TABLE `acciones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `antenas`
--
ALTER TABLE `antenas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalogo_comunidades`
--
ALTER TABLE `catalogo_comunidades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalogo_estado`
--
ALTER TABLE `catalogo_estado`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalogo_municipio`
--
ALTER TABLE `catalogo_municipio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalogo_paquetes`
--
ALTER TABLE `catalogo_paquetes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cat_pagos`
--
ALTER TABLE `cat_pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conceptos`
--
ALTER TABLE `conceptos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cortes`
--
ALTER TABLE `cortes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `incidencias`
--
ALTER TABLE `incidencias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs_login`
--
ALTER TABLE `logs_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs_users`
--
ALTER TABLE `logs_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagos_generales`
--
ALTER TABLE `pagos_generales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tecnicos`
--
ALTER TABLE `tecnicos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acciones`
--
ALTER TABLE `acciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `antenas`
--
ALTER TABLE `antenas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalogo_comunidades`
--
ALTER TABLE `catalogo_comunidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `catalogo_estado`
--
ALTER TABLE `catalogo_estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `catalogo_municipio`
--
ALTER TABLE `catalogo_municipio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `catalogo_paquetes`
--
ALTER TABLE `catalogo_paquetes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cat_pagos`
--
ALTER TABLE `cat_pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `conceptos`
--
ALTER TABLE `conceptos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cortes`
--
ALTER TABLE `cortes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incidencias`
--
ALTER TABLE `incidencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs_login`
--
ALTER TABLE `logs_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs_users`
--
ALTER TABLE `logs_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pagos_generales`
--
ALTER TABLE `pagos_generales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tecnicos`
--
ALTER TABLE `tecnicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
