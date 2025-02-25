-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-02-2025 a las 06:55:15
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `isp_config`
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
  `MAC` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Estructura de tabla para la tabla `catalogo_municipio`
--

CREATE TABLE `catalogo_municipio` (
  `id` int(11) NOT NULL,
  `municipio` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `catalogo_municipio`
--

INSERT INTO `catalogo_municipio` (`id`, `municipio`) VALUES
(1, 'Genaro Codina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_paquetes`
--

CREATE TABLE `catalogo_paquetes` (
  `id` int(11) NOT NULL,
  `paquetes` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `costo` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `catalogo_paquetes`
--

INSERT INTO `catalogo_paquetes` (`id`, `paquetes`, `costo`) VALUES
(1, '7 GB', '10.50'),
(2, '12 GB', '12.12'),
(3, '18 GB', '18.09');

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
  `direccionip` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
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
(1, '202502242354403E354EAA', 'JesusRLV', 'Tulipanes 12 A', NULL, NULL, '1', '1', '1', 98608, '4915000', 'Casa', 'INE', 'luz', 2, '', '', '2025-02-24', '2025-03-24', '2025-03-29', '12.12', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conceptos`
--

CREATE TABLE `conceptos` (
  `id` int(11) NOT NULL,
  `concepto` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `ip` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `concepto` int(11) NOT NULL,
  `periodo` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_pago` int(11) NOT NULL,
  `descuento` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `id` int(11) NOT NULL,
  `promo` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `servicio` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `velocidad` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `cuota` varchar(7) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnicos`
--

CREATE TABLE `tecnicos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `id` int(11) NOT NULL,
  `tipo` varchar(12) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `pwd` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_usr` int(11) NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `catalogo_municipio`
--
ALTER TABLE `catalogo_municipio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `catalogo_paquetes`
--
ALTER TABLE `catalogo_paquetes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cat_pagos`
--
ALTER TABLE `cat_pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `conceptos`
--
ALTER TABLE `conceptos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `logs_users`
--
ALTER TABLE `logs_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tecnicos`
--
ALTER TABLE `tecnicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
