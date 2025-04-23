-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 24-04-2025 a las 00:39:56
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `conectwi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones`
--

CREATE TABLE `acciones` (
  `id` int(11) NOT NULL,
  `accion` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `antenas`
--

CREATE TABLE `antenas` (
  `id` int(11) NOT NULL,
  `marca` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `modelo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `num_serie` int(11) NOT NULL,
  `MAC` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_alta` date NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `antenas`
--

INSERT INTO `antenas` (`id`, `marca`, `modelo`, `num_serie`, `MAC`, `fecha_alta`, `estatus`) VALUES
(1, '54', '4', 4, '4', '2025-04-10', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_adelanto`
--

CREATE TABLE `catalogo_adelanto` (
  `id` int(11) NOT NULL,
  `tipo_adelanto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `costo` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `catalogo_adelanto`
--

INSERT INTO `catalogo_adelanto` (`id`, `tipo_adelanto`, `costo`) VALUES
(1, 'Enero', '0.00'),
(2, 'Febrero', '0.00'),
(3, 'Marzo', '0.00'),
(4, 'Abril', '0.00'),
(5, 'Mayo', '0.00'),
(6, 'Junio', '0.00'),
(7, 'Julio', '0.00'),
(8, 'Agosto', '0.00'),
(9, 'Septiembre', '0.00'),
(10, 'Octubre', '0.00'),
(11, 'Noviembre', '0.00'),
(12, 'Diciembre', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_comunidades`
--

CREATE TABLE `catalogo_comunidades` (
  `id` int(11) NOT NULL,
  `comunidad` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `catalogo_comunidades`
--

INSERT INTO `catalogo_comunidades` (`id`, `comunidad`) VALUES
(1, 'Comunidad 1'),
(2, 'Comunidad 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_estado`
--

CREATE TABLE `catalogo_estado` (
  `id` int(11) NOT NULL,
  `estado` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `catalogo_estado`
--

INSERT INTO `catalogo_estado` (`id`, `estado`) VALUES
(1, 'Zacatecas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_instalacion`
--

CREATE TABLE `catalogo_instalacion` (
  `id` int(11) NOT NULL,
  `tipo_instalacion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `costo` decimal(5,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `catalogo_instalacion`
--

INSERT INTO `catalogo_instalacion` (`id`, `tipo_instalacion`, `costo`) VALUES
(1, 'Instalación sencilla', '1.000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_municipio`
--

CREATE TABLE `catalogo_municipio` (
  `id` int(11) NOT NULL,
  `municipio` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(70) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `catalogo_municipio`
--

INSERT INTO `catalogo_municipio` (`id`, `municipio`, `estado`) VALUES
(1, 'Genaro Codina', 'Zacatecas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_paquetes`
--

CREATE TABLE `catalogo_paquetes` (
  `id` int(11) NOT NULL,
  `paquetes` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `velocidad` int(11) NOT NULL,
  `costo` decimal(5,2) NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `catalogo_paquetes`
--

INSERT INTO `catalogo_paquetes` (`id`, `paquetes`, `velocidad`, `costo`, `estatus`) VALUES
(1, 'Básico', 7, '350.00', 1),
(2, 'Intermedio', 12, '550.00', 0),
(3, 'Avanzado', 18, '850.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_reconexion`
--

CREATE TABLE `catalogo_reconexion` (
  `id` int(11) NOT NULL,
  `tipo_reconexion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `costo` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `catalogo_reconexion`
--

INSERT INTO `catalogo_reconexion` (`id`, `tipo_reconexion`, `costo`) VALUES
(1, 'Reconexión regular', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_pagos`
--

CREATE TABLE `cat_pagos` (
  `id` int(11) NOT NULL,
  `nombre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `folio` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `domicilio` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `calle` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `colonia` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comunidad` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `municipio` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cp` int(6) NOT NULL,
  `telefono` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `referencias` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `identificacion` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `comprobante` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `servicio` int(11) NOT NULL,
  `antena` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `direccionip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_contrato` date NOT NULL,
  `fecha_limite` date NOT NULL,
  `fecha_corte` date NOT NULL,
  `cuota` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `folio`, `nombre`, `domicilio`, `calle`, `colonia`, `comunidad`, `municipio`, `estado`, `cp`, `telefono`, `referencias`, `identificacion`, `comprobante`, `servicio`, `antena`, `direccionip`, `fecha_contrato`, `fecha_limite`, `fecha_corte`, `cuota`, `estatus`) VALUES
(1, '202502242354403E354EAA', 'JesusRLV', 'Tulipanes 12 A', NULL, NULL, '1', '1', '1', 98608, '4915000', 'Casa', 'INE', 'luz', 2, '', '', '2025-02-24', '2025-03-24', '2024-02-01', '12.12', 1),
(2, '202502242354403E354EA1', 'JesusRLV 2', 'Tulipanes 12 A', NULL, NULL, '1', '1', '1', 98608, '4915000', 'Casa', 'INE', 'luz', 2, '', '', '2025-02-24', '2025-03-24', '2025-03-29', '12.12', 1),
(3, '202502242354403E354EA2', 'JesusRLV 3', 'Tulipanes 12 A', NULL, NULL, '1', '1', '1', 98608, '4915000', 'Casa', 'INE', 'luz', 2, '', '', '2025-02-24', '2025-03-24', '2025-03-29', '12.12', 1),
(4, '202502242354403E354EA3', 'Ana Elisa B', 'Tulipanes 12 A', NULL, NULL, '1', '1', '1', 98608, '4915000', 'Casa', 'INE', 'luz', 2, '', '', '2024-01-03', '2025-03-24', '2024-01-01', '12.12', 1),
(5, '20250410155630FE88FECB', 'Contrato con antena', '2', NULL, NULL, '1', '1', '1', 98000, '99999', 'Casa', 'INE', 'agua', 1, '1', '', '2025-04-10', '2025-05-10', '2025-05-15', '350.00', 1),
(6, '2025041015593805441E2E', 'Contrato con antena 2', '3', NULL, NULL, '1', '', '1', 98000, '99999', 'Casa', 'INE', 'agua', 2, '1', '', '2025-04-10', '2025-05-10', '2025-05-15', '550.00', 1),
(7, '20250410160422DC243E3A', 'Contrato con antena 3', '4', NULL, NULL, '1', '1', '1', 98000, '99999', 'Casa', 'INE', 'agua', 3, '1', '', '2025-04-10', '2025-05-10', '2025-05-15', '850.00', 1),
(8, '20250410160533EF9C5D6A', 'Contrato con antena 4', '4', NULL, NULL, '2', '1', '1', 98000, '99999', 'Casa', 'INE', 'agua', 1, '1', '10.125.80.12', '2025-04-10', '2025-05-10', '2025-05-15', '350.00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conceptos`
--

CREATE TABLE `conceptos` (
  `id` int(11) NOT NULL,
  `concepto` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `costo` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `conceptos`
--

INSERT INTO `conceptos` (`id`, `concepto`, `costo`) VALUES
(1, 'Mensualidad', '350.00'),
(2, 'Instalación', '500.00'),
(3, 'Reconexión', '80.00'),
(4, 'Adelanto', '350.00'),
(5, 'Promociones', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cortes`
--

CREATE TABLE `cortes` (
  `id` int(11) NOT NULL,
  `folio_cliente` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `folio_corte` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tecnico` int(11) NOT NULL,
  `estatus` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencias`
--

CREATE TABLE `incidencias` (
  `id` int(11) NOT NULL,
  `folio_incidencia` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `folio_cliente` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `tecnico` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha_reporte` datetime NOT NULL,
  `fecha_resolucion` datetime NOT NULL,
  `comentario_tecnico` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs_login`
--

CREATE TABLE `logs_login` (
  `id` int(11) NOT NULL,
  `username` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `inicio` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `ip` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_ext` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `logs_login`
--

INSERT INTO `logs_login` (`id`, `username`, `inicio`, `fin`, `ip`, `id_ext`) VALUES
(1, 'jesus', '2025-04-01 00:38:14', '2025-04-01 18:38:14', '11111', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs_users`
--

CREATE TABLE `logs_users` (
  `id` int(11) NOT NULL,
  `username` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `accion` int(11) NOT NULL,
  `hora` datetime NOT NULL,
  `folio_cliente` varchar(35) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `num_pago` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `folio_contrato` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `concepto` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `periodo` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `annio` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_pago` int(11) NOT NULL,
  `descuento` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `num_pago`, `fecha_pago`, `folio_contrato`, `concepto`, `periodo`, `annio`, `tipo_pago`, `descuento`, `total`) VALUES
(2, 'CW2025-002', '2025-04-09 06:22:28', '202502242354403E354EA3', 'Mensualidad', '1', '2004', 1, '0', 350),
(3, 'CW2025-002', '2025-04-09 06:33:31', '202502242354403E354EA3', 'Mensualidad', '5', '2004', 1, '0', 350),
(4, 'CW2025-002', '2025-04-09 06:35:51', '202502242354403E354EA3', 'Mensualidad', '2', '2004', 1, '0', 350),
(5, 'CW2025-002', '2025-04-09 06:37:04', '202502242354403E354EA3', 'Mensualidad', '4', '2004', 1, '0', 350),
(6, 'CW2025-002', '2025-04-09 06:37:48', '202502242354403E354EA3', 'Mensualidad', '7', '2004', 1, '0', 350),
(7, 'CW2025-002', '2025-04-09 06:45:09', '202502242354403E354EA3', 'Mensualidad', '9', '2004', 1, '0', 350),
(8, 'CW2025-002', '2025-04-09 06:46:45', '202502242354403E354EA3', 'Mensualidad', '3', '2004', 1, '0', 350),
(9, 'CW2025-002', '2025-04-09 07:09:09', '202502242354403E354EA3', 'Mensualidad', '6', '2004', 1, '0', 350),
(10, 'CW2025-002', '2025-04-11 00:20:21', '202502242354403E354EA3', 'Mensualidad', '2', '2005', 1, '0', 350),
(11, 'CW2025-002', '2025-04-11 00:21:04', '202502242354403E354EA3', 'Mensualidad', '8', '2004', 1, '0', 350),
(12, 'CW2025-002', '2025-04-11 00:25:24', '202502242354403E354EA3', 'Mensualidad', '11', '2004', 1, '0', 350),
(13, 'CW2025-002', '2025-04-11 00:25:24', '202502242354403E354EAA', 'Mensualidad', '4', '2005', 1, '0', 350);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_generales`
--

CREATE TABLE `pagos_generales` (
  `id` int(11) NOT NULL,
  `folio_contrato` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `tarjeta` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `folio_pago` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `id` int(11) NOT NULL,
  `promo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `tipo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descuento` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `id_catalogo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `promociones`
--

INSERT INTO `promociones` (`id`, `promo`, `fecha_inicio`, `fecha_fin`, `tipo`, `descuento`, `estatus`, `id_catalogo`) VALUES
(1, '1', '2025-04-07 00:00:00', '2025-04-07 00:00:00', 'Mensualidad', 1, 1, NULL),
(2, '1', '2025-04-07 00:00:00', '2025-04-07 00:00:00', 'Mensualidad', 1, 1, NULL),
(3, '2', '2025-04-08 00:00:00', '2025-04-08 00:00:00', 'Instalación', 2, 1, NULL),
(4, 'Promoción de prueba', '2025-04-11 00:00:26', '2025-04-11 00:00:26', 'Mensualidad', 70, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnicos`
--

CREATE TABLE `tecnicos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_actualizacion` date DEFAULT NULL,
  `color` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tecnicos`
--

INSERT INTO `tecnicos` (`id`, `nombre`, `estatus`, `fecha_creacion`, `fecha_actualizacion`, `color`) VALUES
(1, 'jesus', 1, '2025-03-18', '2025-03-21', ''),
(2, 'a', 1, '2025-03-21', '2025-04-07', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `id` int(11) NOT NULL,
  `tipo` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_pago`
--

INSERT INTO `tipo_pago` (`id`, `tipo`) VALUES
(1, 'Efectivo'),
(2, 'Transferencia'),
(3, 'Tarjeta Débito'),
(4, 'Tarjeta Crédito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `pwd` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_usr` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_editar` datetime NOT NULL,
  `color` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `pwd`, `nombre`, `tipo_usr`, `estatus`, `fecha_creacion`, `fecha_editar`, `color`) VALUES
(1, 'aebarba', '123456789', 'Ana Elisa Barba', 2, 1, '2025-03-11', '0000-00-00 00:00:00', ''),
(2, 'color', 'color', 'user color', 2, 1, '2025-04-07', '0000-00-00 00:00:00', '#64c1da');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acciones`
--
ALTER TABLE `acciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `antenas`
--
ALTER TABLE `antenas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `catalogo_adelanto`
--
ALTER TABLE `catalogo_adelanto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `catalogo_comunidades`
--
ALTER TABLE `catalogo_comunidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `catalogo_estado`
--
ALTER TABLE `catalogo_estado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `catalogo_instalacion`
--
ALTER TABLE `catalogo_instalacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `catalogo_municipio`
--
ALTER TABLE `catalogo_municipio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `catalogo_paquetes`
--
ALTER TABLE `catalogo_paquetes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `catalogo_reconexion`
--
ALTER TABLE `catalogo_reconexion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cat_pagos`
--
ALTER TABLE `cat_pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `conceptos`
--
ALTER TABLE `conceptos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cortes`
--
ALTER TABLE `cortes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `incidencias`
--
ALTER TABLE `incidencias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `logs_login`
--
ALTER TABLE `logs_login`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `logs_users`
--
ALTER TABLE `logs_users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos_generales`
--
ALTER TABLE `pagos_generales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tecnicos`
--
ALTER TABLE `tecnicos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acciones`
--
ALTER TABLE `acciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `antenas`
--
ALTER TABLE `antenas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `catalogo_adelanto`
--
ALTER TABLE `catalogo_adelanto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `catalogo_comunidades`
--
ALTER TABLE `catalogo_comunidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `catalogo_estado`
--
ALTER TABLE `catalogo_estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `catalogo_instalacion`
--
ALTER TABLE `catalogo_instalacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `catalogo_municipio`
--
ALTER TABLE `catalogo_municipio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `catalogo_paquetes`
--
ALTER TABLE `catalogo_paquetes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `catalogo_reconexion`
--
ALTER TABLE `catalogo_reconexion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cat_pagos`
--
ALTER TABLE `cat_pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `conceptos`
--
ALTER TABLE `conceptos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cortes`
--
ALTER TABLE `cortes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `incidencias`
--
ALTER TABLE `incidencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `logs_login`
--
ALTER TABLE `logs_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `logs_users`
--
ALTER TABLE `logs_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `pagos_generales`
--
ALTER TABLE `pagos_generales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `promociones`
--
ALTER TABLE `promociones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tecnicos`
--
ALTER TABLE `tecnicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
