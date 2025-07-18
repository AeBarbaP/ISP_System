-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 14-07-2025 a las 19:45:21
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
  `num_serie` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `MAC` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_alta` date NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `antenas`
--

INSERT INTO `antenas` (`id`, `marca`, `modelo`, `num_serie`, `MAC`, `ip_address`, `fecha_alta`, `estatus`) VALUES
(3, 'TP-LINK', 'M8568', '0', '5t.69.4g.68', '125.125.125.0', '2025-05-29', 1),
(4, 'CISCO', 'HU-558', 'GS874DS684AF', '5h.54.g3.wc', '255.255.255.0', '2025-05-29', 1);

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
  `comunidad` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `municipio` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `catalogo_comunidades`
--

INSERT INTO `catalogo_comunidades` (`id`, `comunidad`, `municipio`, `estado`) VALUES
(1, 'Prueba', '7', 'Zacatecas'),
(2, 'Víboras', '7', 'Zacatecas'),
(3, 'La Escondida', '2', 'Zacatecas'),
(4, 'La Zacatecana', '4', 'Zacatecas');

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
  `costo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `catalogo_instalacion`
--

INSERT INTO `catalogo_instalacion` (`id`, `tipo_instalacion`, `costo`) VALUES
(1, 'Genaro Codina', 1060),
(2, 'Comunidades 1', 2800),
(3, 'Comunidades 2', 1600);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_logs`
--

CREATE TABLE `catalogo_logs` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `catalogo_logs`
--

INSERT INTO `catalogo_logs` (`id`, `descripcion`) VALUES
(1, 'Cambiar estatus técnico'),
(2, 'Editar usuario dashboard'),
(3, 'Editar corte'),
(4, 'Generar corte de caja'),
(5, 'Guardar pagos'),
(6, 'Guardar recibos'),
(7, 'Guardar contrato'),
(8, 'Guardar corte'),
(9, 'Guardar paquete'),
(10, 'Guardar técnico'),
(11, 'Guardar usuario'),
(12, 'Editar paquete'),
(13, 'Editar promoción'),
(14, 'Editar técnico'),
(15, 'Editar técnico incidencia'),
(16, 'Editar usuario'),
(17, 'Eliminar corte'),
(18, 'Editar fallas'),
(19, 'Guardar incidencias'),
(20, 'Registrar promoción'),
(21, 'Acceso sistema'),
(22, 'Salida sistema'),
(23, 'Agregar usuario (Reportes)'),
(24, 'Cambiar estatus usuario (Reportes)'),
(25, 'Cambiar estatus técnico (Reportes)'),
(26, 'Guardar antena (Reportes)'),
(27, 'Guardar comunidad (Reportes)'),
(28, 'Guardar contrato (Reportes)'),
(29, 'Guardar municipio (Reportes)'),
(30, 'Guardar paquete (Reportes)'),
(31, 'Guardar usuario (Reportes)'),
(32, 'Editar antena (Reportes)'),
(33, 'Editar municipio (Reportes)'),
(34, 'Editar paquete (Reportes)'),
(35, 'Editar promoción (Reportes)'),
(36, 'Editar técnico (Reportes)'),
(37, 'Editar usuario (Reportes)'),
(38, 'Eliminar antena (Reportes)'),
(39, 'Eliminar municipio (Reportes)'),
(40, 'Eliminar promoción (Reportes)'),
(41, 'Registrar promoción (Reportes)'),
(42, 'Editar Comunidad'),
(43, 'Eliminar Comunidad'),
(44, 'Eliminar reporte de corte'),
(45, 'Actualizar estatus corte');

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
(2, 'Zacatecas', 'Zacatecas'),
(3, 'Colotlán', 'Jalisco'),
(4, 'Genaro Codina', 'Zacatecas'),
(7, 'Villanueva', 'Zacatecas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_paquetes`
--

CREATE TABLE `catalogo_paquetes` (
  `id` int(11) NOT NULL,
  `paquetes` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `velocidad` int(11) NOT NULL,
  `costo` decimal(6,2) NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `catalogo_paquetes`
--

INSERT INTO `catalogo_paquetes` (`id`, `paquetes`, `velocidad`, `costo`, `estatus`) VALUES
(1, 'Comunidades - Básico', 5, '270.00', 1),
(2, 'Comunidades - Intermedio', 8, '470.00', 1),
(3, 'Genaro Codina - Básico', 5, '260.00', 1),
(4, 'Genaro Codina - Intermedio', 8, '460.00', 1),
(5, 'Purisima - Básico', 5, '300.00', 1),
(6, 'Torre', 5, '220.00', 1),
(7, 'Rancho Macías', 8, '500.00', 1),
(8, 'Rancho Santa Fe', 15, '1000.00', 1);

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
(1, 'Reconexión regular', '50.00');

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
  `folio` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domicilio` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calle` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `colonia` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comunidad` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `municipio` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp` int(6) DEFAULT NULL,
  `telefono` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referencias` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identificacion` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comprobante` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `servicio` int(11) DEFAULT NULL,
  `antena` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccionip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_contrato` date DEFAULT NULL,
  `fecha_limite` date DEFAULT NULL,
  `fecha_corte` date DEFAULT NULL,
  `cuota` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `folio`, `nombre`, `domicilio`, `calle`, `colonia`, `comunidad`, `municipio`, `estado`, `cp`, `telefono`, `referencias`, `identificacion`, `comprobante`, `servicio`, `antena`, `direccionip`, `fecha_contrato`, `fecha_limite`, `fecha_corte`, `cuota`, `estatus`) VALUES
(1, '20250625PQ1WD31Y', 'ROBERTO ACOSTA MENDEZ', '', '', '', 'BARQUILLO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '', '2020-08-14', '2025-06-19', '2025-06-20', '260', 1),
(2, '20250625AN2TU02F', 'FRANCISCO JAVIER ACOSTA DELGADO', '', '', '', 'BARQUILLO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '192.168.31.51', '2020-08-14', '2025-08-15', '2025-08-16', '260', 1),
(3, '20250625PB6UR73C', 'OSCAR ALEJANDRO ACOSTA H', '', '', '', 'BARQUILLO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '192.168.31.52', '2020-08-14', '2025-08-19', '2025-08-20', '260', 1),
(4, '20250625JX1UD14C', 'ROBERTO ACOSTA LOPEZ', '', '', '', 'BARQUILLO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '', '2020-08-14', '2025-08-19', '2025-08-20', '260', 1),
(5, '20250625OX4TR55E', 'ADRIANA MORALES GARCIA', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4922042516', '', '', '', 3, '', '192.16831.59', '2022-05-23', '2025-06-28', '2025-06-29', '260', 1),
(6, '20250625NM7KL66B', 'ANGELICA LOPEZ SAUCEDO', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4681372722', '', '', '', 3, '', '192.168.31.66', '2022-05-26', '2025-06-01', '2025-06-02', '260', 1),
(7, '20250625OP0IH17N', 'BEATRIZ DE LA ROSA ORTIZ', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4921198328', '', '', '', 3, '', '192.168.31.64', '2022-05-17', '2025-06-22', '2025-06-23', '260', 1),
(8, '20250625SR7NO58E', 'CARLOS GALLEGOS CARREON', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4921093201', '', '', '', 3, '', '192.16831.131', '2024-12-19', '2025-06-24', '2025-06-25', '260', 1),
(9, '20250625OX3TK79Y', 'CARLOS MANUEL LOPEZ CASTRO', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '3619770635', '', '', '', 3, '', '192.16831.217', '2023-09-22', '2025-09-19', '2025-09-20', '260', 1),
(10, '20250625GR5RO510I', 'DIEGO ALONSO CASTRO DELGADO', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4922519773', '', '', '', 3, '', '192.168.31.237', '2023-01-03', '2025-06-08', '2025-06-09', '260', 1),
(11, '20250625FA1GC211D', 'EDUARDO LOPEZ SAUCEDO', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4922043146', '', '', '', 3, '', '192.168.31.84', '2023-11-07', '2025-06-12', '2025-06-13', '260', 1),
(12, '20250625OC7LO612X', 'ERIK EDUARDO VALDEZ DURAN', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4925591285', '', '', '', 4, '', '192.168.32.79', '2023-01-17', '2025-06-22', '2025-06-23', '460', 1),
(13, '20250625YU0AL013T', 'ESTER MORENO CASTRO', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4922507795', '', '', '', 3, '', '192.168.31.55', '2022-05-19', '2025-06-24', '2025-06-25', '260', 1),
(14, '20250625BM4RZ314T', 'EZEQUIEL LOPEZ SAUCEDO', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.7', '2022-06-15', '2025-06-20', '2025-06-21', '260', 1),
(15, '20250625VY6SD715X', 'FLOR GUADALUPE DE LA CRUZ CASTRO', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4921040831', '', '', '', 3, '', '192.168.31.85', '2024-01-23', '2025-06-28', '2025-06-29', '260', 1),
(16, '20250625AH3HD716Q', 'GERARDO SAUCEDO ARENAS', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.65', '2022-05-24', '2025-06-29', '2025-06-30', '260', 1),
(17, '20250625PW4AL517F', 'HECTOR IVAN DURAN LOPEZ', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4922154625', '', '', '', 3, '', '192.168.31.8', '2023-06-29', '2025-06-08', '2025-06-09', '260', 1),
(18, '20250625VG5FN418E', 'HELIODORO LOPEZ', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4331021320', '', '', '', 3, '', '192.168.31.71', '2022-07-06', '2025-06-11', '2025-06-12', '260', 1),
(19, '20250625GG9UX219W', 'JESUS ALEJANDRO MU?OZ VALDEZ', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4921003900', '', '', '', 3, '', '192.168.31.57', '2022-05-20', '2025-06-25', '2025-06-26', '260', 1),
(20, '20250625RX4AM520K', 'JOEL SAUCEDO CASTRO', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4922519773', '', '', '', 3, '', '192.168.31.125', '2025-04-12', '2025-06-17', '2025-06-18', '260', 1),
(21, '20250625YH5HY121Z', 'JOSE MIGUEL CALDERA VELA', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4921304951', '', '', '', 3, '', '192.168.31.63', '2022-05-17', '2025-06-22', '2025-06-23', '260', 1),
(22, '20250625BB0MD622G', 'JUAN FLORES EZPINO', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4921911710', '', '', '', 3, '', '192.168.31.83', '2023-10-05', '0000-00-00', '2025-06-11', '260', 1),
(23, '20250625KO0QS723X', 'LORENZO ANTONIO REYES PADILLA', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4922678473', '', '', '', 3, '', '192.168.31.77', '2022-12-19', '2025-06-24', '2025-06-25', '260', 1),
(24, '20250625EW3GC024O', 'LUIS ALBERTO HERNANDEZ VILLA', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4924921903', '', '', '', 3, '', '192.168.31.104', '2025-03-21', '2025-06-26', '2025-06-27', '260', 1),
(25, '20250625MO9MH125W', 'MARIA DE LOURDES NAJERA COCOLAN', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4671060287', '', '', '', 3, '', '192.168.31.72', '2022-07-11', '2025-07-16', '2025-07-17', '260', 1),
(26, '20250625NF3JU226K', 'MARIA DEL CARMEN GAYTAN RODRIGUEZ', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.69', '2022-06-01', '2025-06-06', '2025-06-07', '260', 1),
(27, '20250625GW6LB827J', 'MARIA GUADALUPE FLORES ESTRADA', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.87', '2024-02-01', '2025-06-06', '2025-06-07', '260', 1),
(28, '20250625YC4BT728Z', 'MARTHA VALERIA TORRES MORENO', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4497163708', '', '', '', 3, '', '192.168.31.81', '2023-08-28', '2025-06-03', '2025-06-04', '260', 1),
(29, '20250625GW4ZT929N', 'NORMA LETICIA HERNANDEZ SAUCEDO', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4928692126', '', '', '', 3, '', '192.168.31.68', '2022-05-28', '2025-06-02', '2025-06-03', '260', 1),
(30, '20250625MQ8DU630Y', 'RAMONA JACOBO', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', 'TORRE', '2022-05-13', '2025-06-18', '2025-06-19', '200', 1),
(31, '20250625DQ4KG831B', 'RAQUEL CALDRA GONZALEZ', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4923140833', '', '', '', 3, '', '192.168.31.74', '2023-04-19', '2025-06-24', '2025-06-25', '260', 1),
(32, '20250625UB2KQ532O', 'RAUDEL SAUCEDO CALDERA', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4925936248', '', '', '', 3, '', '192.168.31.61', '2022-05-16', '2025-06-21', '2025-06-22', '260', 1),
(33, '20250625WG6IW133J', 'RAUL ACOSTA LOPEZ', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4922006519', '', '', '', 3, '', '192.168.31.62', '2022-05-16', '2025-06-21', '2025-06-22', '260', 1),
(34, '20250625GU9VQ534W', 'ROSALBA GARCIA RODRIGUEZ', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4922649004', '', '', '', 3, '', '192.168.31.56', '2022-05-17', '2025-06-22', '2025-06-23', '260', 1),
(35, '20250625PR4DJ035D', 'ROXANA ACOSTA SAUCEDO', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4921193389', '', '', '', 3, '', '192.168.31.6', '2022-05-16', '2025-06-21', '2025-06-22', '260', 1),
(36, '20250625OI5YI636U', 'SAMUEL CALDERA ARENAS', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4922507795', '', '', '', 3, '', '192.168.31.58', '2022-05-20', '2025-06-25', '2025-06-26', '260', 1),
(37, '20250625SV7UI437X', 'MATILDE ROBLES HERNANDEZ', '', '', '', 'PROGRESO', 'GENARO CODINA', 'ZACATECAS', 98663, '4921323075', '', '', '', 3, '', '192.168.31.128', '2025-05-02', '2025-06-07', '2025-06-08', '260', 1),
(38, '20250625PR0AG338O', 'AMPELIA ESQUIVEL VALDEZ', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '4922644893', '', '', '', 1, '', '192.168.32.66', '2020-08-20', '2025-08-25', '2025-08-26', '270', 1),
(39, '20250625LU8OY139N', 'ARTURO ORTIZ MEDEZ', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '4929461282', '', '', '', 4, '', '192.168.32.31', '2022-08-03', '2025-05-08', '2025-05-09', '460', 2),
(40, '20250625BA4AI140M', 'BERENICE MU?OZ RIVERA', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '4921300932', '', '', '', 1, '', '192.168.32.42', '2022-02-03', '2025-06-08', '2025-06-09', '270', 1),
(41, '20250625RV8II241Z', 'BERTHA PATRICIA MENDEZ DE LA CRUZ', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '4922461044', '', '', '', 1, '', '192.168.32.70', '2020-09-17', '2025-09-22', '2025-09-23', '270', 1),
(42, '20250625BE0QP342D', 'CLEMENTE JACOBO RODRIGUEZ', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '4581187408', '', '', '', 1, '', '192.168.33.93', '2020-08-27', '2025-09-01', '2025-09-02', '270', 1),
(43, '20250625WC3AM843X', 'DELIA FRAGOZA GARCIA', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '4925599729', '', '', '', 1, '', '192.168.32.99', '2020-10-09', '2025-10-14', '2025-10-15', '270', 1),
(44, '20250625EI0AH644E', 'FABIOLA RODRIGUEZ NORATO', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '4922033752', '', '', '', 1, '', '192.168.32.136', '2020-10-14', '2025-10-19', '2025-10-20', '270', 1),
(45, '20250625DO5IJ545W', 'JOSE ANTONIO MU?OZ DURAN', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '4581106874', '', '', '', 1, '', '192.168.32.156', '2023-12-27', '2025-12-25', '2025-12-26', '270', 1),
(46, '20250625BJ1IT546X', 'JOVITA RECENDEZ CASTA?EDA', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '4581201223', '', '', '', 1, '', '192.168.32.60', '2025-03-04', '2025-06-09', '2025-06-10', '270', 1),
(47, '20250625PH3BF747M', 'MA ESTHER ESQUIVEL SANTANA', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '4929972872', '', '', '', 1, '', '192.168.32.143', '2020-08-20', '2025-08-25', '2025-08-26', '270', 1),
(48, '20250625YH1AK148N', 'MA VERONICA ARTEAGA ESQUIVEL', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '4581063614', '', '', '', 6, '', '192.168.33.91', '2020-08-27', '2025-09-01', '2025-09-02', '220', 1),
(49, '20250625FI4GN349C', 'MARIA MAGDALENA JACOBO REZA', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '4922651098', '', '', '', 1, '', '192.168.32.149', '2020-08-27', '2025-09-01', '2025-09-02', '270', 1),
(50, '20250625LI3FK750E', 'MARICELA MACIAS LOPEZ', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '4928706420', '', '', '', 1, '', '192.168.32.161', '2020-08-27', '2025-09-01', '2025-09-02', '270', 1),
(51, '20250625JQ1HP051K', 'MAYELA CASTRO RENTERIA', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '4921733573', '', '', '', 1, '', '192.168.32.164', '2020-08-20', '2025-08-25', '2025-08-26', '270', 1),
(52, '20250625ZS8JP052T', 'NANCY KARINA DIOSDADO HERNANDEZ', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '4921977886', '', '', '', 1, '', '192.168.32.135', '2022-04-20', '2025-06-25', '2025-06-26', '270', 1),
(53, '20250625TL7DS053L', 'OLGA MARIA PEREA RODRIGUEZ', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '4921525655', '', '', '', 1, '', '192.168.32.181', '2020-10-12', '2025-10-17', '2025-10-18', '270', 1),
(54, '20250625GA9QV154K', 'ROCIO JACOBO MARES PAGA', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '', '', '', '', 6, '', 'TORRE', '2020-08-19', '2025-08-24', '2025-08-25', '220', 1),
(55, '20250625QQ0GV255M', 'ROCIO MARIBEL ESQUIVEL MU?OZ', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '4922003564', '', '', '', 1, '', '192.168.32.186', '2020-08-27', '2025-09-01', '2025-09-02', '270', 1),
(56, '20250625NK7VH356F', 'ROSAURA HERRERA GARCIA', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '', '', '', '', 1, '', '192.168.32.220', '2021-08-10', '2025-08-15', '2025-08-16', '270', 1),
(57, '20250625MW8GP457O', 'SIMON JACOBO CASTRO', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98666, '4921440639', '', '', '', 1, '', '192.168.32.87', '2020-08-20', '2025-08-25', '2025-08-26', '270', 1),
(58, '20250625FJ4NO858N', 'ADILENE GONZALEZ ROQUE', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4929097704', '', '', '', 1, '', '192.168.2.174', '2023-11-21', '2025-11-25', '2025-11-26', '270', 1),
(59, '20250625MW0SG959W', 'ADRIANA SAUCEDO CASTRO', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4581069845', '', '', '', 3, '', 'TORRE', '2020-11-27', '2025-05-02', '2025-05-03', '200', 2),
(60, '20250625EW9EH360S', 'ALEJANDRO GONZALEZ MU?OZ', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4922896067', '', '', '', 1, '', '192.168.2.65', '2021-12-04', '2025-12-09', '2025-12-10', '270', 1),
(61, '20250625ZD3YS861J', 'ALMA ROSA GONZALEZ DURAN', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4921434209', '', '', '', 1, '', '192.168.2.63', '2021-12-03', '2025-12-08', '2025-12-09', '270', 1),
(62, '20250625MC5NX162J', 'AMELIA MARTINEZ CASTRO', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4581176928', '', '', '', 1, '', '192.168.2.149', '2022-10-28', '2025-05-02', '2025-05-03', '270', 2),
(63, '20250625BO2LX863G', 'ANITA ADAME SAUCEDO', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4651496642', '', '', '', 1, '', '192.168.2.62', '2021-12-03', '2025-12-08', '2025-12-09', '270', 1),
(64, '20250625EF7BR564M', 'ANTONIO SOTO REZA ', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4922432431', '', '', '', 1, '', '192.168.2.53', '2020-11-12', '2025-11-17', '2025-11-18', '270', 1),
(65, '20250625XO6OH765B', 'AURORA GONZALEZ ADAME', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4921816093', '', '', '', 1, '', '192.168.2.57', '2020-11-27', '2025-12-02', '2025-12-03', '270', 1),
(66, '20250625VV8ZZ166H', 'CARLOS DURAN ESCOBAR ', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4921465416', '', '', '', 1, '', '192.168.2.61', '2021-12-03', '2025-12-08', '2025-12-09', '270', 1),
(67, '20250625TX5OS767N', 'CATALINA ESQUIVEL ADAME', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4921321157', '', '', '', 1, '', '192.168.2.59', '2020-12-02', '2025-12-07', '2025-12-08', '270', 1),
(68, '20250625SD5JA268G', 'CLAUDIA ESTELA MARTINEZ MEDINA', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4922017682', '', '', '', 1, '', '192.168.2.68', '2021-12-04', '2025-12-09', '2025-12-10', '270', 1),
(69, '20250625US9NK069E', 'GLORIA REZA MU?OZ', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4922949613', '', '', '', 1, '', '192.168.2.111', '2024-02-28', '2025-06-02', '2025-06-03', '270', 1),
(70, '20250625XD5AO470X', 'GRACIELA GARCIA GONZALEZ', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4921036014', '', '', '', 1, '', '192.168.2.67', '2021-12-04', '2025-12-09', '2025-12-10', '270', 1),
(71, '20250625ES4KW071X', 'ILIANE KARLA MARIA DOMINGUEZ GONZALEZ', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4581187034', '', '', '', 1, '', '192.168.2.70.', '2020-12-04', '2025-12-09', '2025-12-10', '270', 1),
(72, '20250625ID4SX672X', 'JOSE ANTONIO TORRES RODRIGUEZ', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4921378712', '', '', '', 1, '', '192.168.2.17', '2022-12-30', '2025-06-04', '2025-06-05', '270', 1),
(73, '20250625KO7MA373J', 'JOSE JORGE GONZALEZ ADAME ', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4581153483', '', '', '', 1, '', '192.168.2.148', '2022-09-06', '2025-09-11', '2025-09-12', '270', 1),
(74, '20250625FY9GS974G', 'JUAN CARLOS FRAGOZA GONZALEZ', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4922953660', '', '', '', 1, '', '192.168.2.161', '2023-01-04', '2025-06-07', '2025-06-08', '270', 1),
(75, '20250625SA5SH875A', 'KEILANI GONZALEZ CASTRO', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4581305735', '', '', '', 1, '', '192.168.2.186', '2024-12-04', '2025-12-09', '2025-12-10', '270', 1),
(76, '20250625FN4XA876E', 'LORENA FRAGOZA GARCIA', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4922652133', '', '', '', 1, '', '192.168.2.58', '2020-12-02', '2025-12-07', '2025-12-08', '270', 1),
(77, '20250625UG9MU277U', 'MARIA AUDET GONZALEZ RODRIGUEZ', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4922039936', '', '', '', 1, '', '192.168.2.93', '2020-12-23', '2025-12-28', '2025-12-29', '270', 1),
(78, '20250625IK2TJ178Y', 'MARIA DEL CARMEN FRAGOZA GONZALEZ', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4921034181', '', '', '', 1, '', '192.168.2.78', '2020-12-16', '2025-12-21', '2025-12-22', '270', 1),
(79, '20250625YU0RO779H', 'MARIA DEL ROSARIO MEDINA RODRIGUEZ', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4921048757', '', '', '', 1, '', '192.168.2.147', '2022-08-05', '2025-08-10', '2025-08-11', '270', 1),
(80, '20250625VP6WG980V', 'MARIA EUGENIA MU?OZ ESQUIVEL', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4922676109', '', '', '', 1, '', '192.168.2.52', '2020-11-12', '2025-11-17', '2025-11-18', '270', 1),
(81, '20250625BZ9PU181O', 'MARIA RAQUEL GARCIA MARTINEZ', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '7279198631', '', '', '', 1, '', '', '2025-03-13', '2025-06-18', '2025-06-19', '270', 1),
(82, '20250625UG9JU782E', 'MARIA TERESA MEDINA RODRIGUEZ', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4581206672', '', '', '', 1, '', '192.168.2.73', '2020-12-16', '2025-12-21', '2025-12-22', '270', 1),
(83, '20250625IS2VE883R', 'RICARDO NOE ANGUIANO CERVANTES', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '', '', '', '', 1, '', '192.168.2.135', '2021-12-11', '2025-12-16', '2025-12-17', '270', 1),
(84, '20250625HV8YB484T', 'ROBERTO ADAME SAUCEDO', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4929093021', '', '', '', 1, '', '192.168.2.72', '2020-12-15', '2025-12-20', '2025-12-21', '270', 1),
(85, '20250625SS6RY385U', 'TADEO ADAME GARCIA', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4581360011', '', '', '', 1, '', '192.168.2.51', '2020-11-12', '2025-11-17', '2025-11-18', '270', 1),
(86, '20250625DM6KU286E', 'TERESA FRAGOZA GARCIA', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4921367697', '', '', '', 1, '', '192.168.2.86', '2020-12-17', '2025-12-22', '2025-12-23', '270', 1),
(87, '20250625IZ4GP287S', 'VERONICA SOTO MEDINA', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4921310615', '', '', '', 1, '', '192.168.2.66', '2021-12-04', '2025-12-09', '2025-12-10', '270', 1),
(88, '20250625PO8CB288H', 'VICTOR HUGO GONZALEZ GARCIA', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '492-869-9761', '', '', '', 1, '', '192.168.2.109', '2021-02-17', '2025-06-22', '2025-06-23', '270', 1),
(89, '20250625BP7YB389M', 'VIRGINIA GONZALEZ CALDERA', '', '', '', 'CORRALILLO', 'GENARO CODINA', 'ZACATECAS', 98666, '4928924386', '', '', '', 1, '', '192.168.2.60.', '2021-12-02', '2025-12-07', '2025-12-08', '270', 1),
(90, '20250625QG5JX290K', 'JUANA CAMPOS', '', '', '', 'REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98666, '', '', '', '', 1, '', '', '2025-06-25', '2025-06-30', '2025-07-01', '270', 1),
(91, '20250625KK0EP491Q', 'ABEL GARCIA ROQUE', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581299566', '', '', '', 1, '', '192.168.2.178', '2023-08-15', '2025-08-20', '2025-08-21', '270', 1),
(92, '20250625CE5YK492K', 'ADRIAN RODRIGUEZ ADAME', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.136', '2021-12-24', '2025-12-29', '2025-12-30', '270', 1),
(93, '20250625QC1MK093X', 'ALFREDO GONZALEZ GONZALEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581440657', '', '', '', 1, '', '192.168.2.14', '2025-06-25', '2025-06-30', '2025-07-01', '270', 1),
(94, '20250625CI7HF694F', 'ANA BELEN MARTINEZ MEDINA', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '3344163394', '', '', '', 1, '', '192.168.2.224', '2023-08-29', '2025-08-09', '2025-08-10', '270', 1),
(95, '20250625IF2NF195M', 'ANA LAURA GARCIA ROQUE', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4925441290', '', '', '', 1, '', '192.168.2.145', '2023-07-28', '2025-07-22', '2025-07-23', '270', 1),
(96, '20250625NH9QS396O', 'ANAYELI ROQUE GONZALEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '458-129-9540', '', '', '', 1, '', '192.168.2.124', '2025-06-25', '2025-06-30', '2025-07-01', '270', 1),
(97, '20250625XO9YS097Y', 'AURORA FRAGOZA SOTO', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.117', '2021-01-05', '2025-06-10', '2025-06-11', '270', 1),
(98, '20250625OH0QA398L', 'BRAYAN EDUARDO LOPEZ JUAREZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4922067217', '', '', '', 1, '', '192.168.2.166', '2022-12-05', '2025-12-10', '2025-12-11', '270', 1),
(99, '20250625MQ8LN599P', 'BRENDA ESMERALDA HERRERA SOTO', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4921133427', '', '', '', 1, '', '192.168.2.184', '2024-10-03', '2025-10-08', '2025-10-09', '270', 1),
(100, '20250625ZG9ZQ7100N', 'CECILIA ESQUIVEL GARCIA ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581205289', '', '', '', 1, '', '192.168.2.112', '2020-12-23', '2025-12-28', '2025-12-29', '270', 1),
(101, '20250625MU2PZ3101S', 'CLAUDIA BERENICE RODRIGUEZ GARCIA', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581044781', '', '', '', 1, '', '192.168.2.84', '2020-12-16', '2025-12-21', '2025-12-22', '270', 1),
(102, '20250625UG6YL8102C', 'DIANA ESQUIVEL DELGADO', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581196909', '', '', '', 1, '', '192.168.2.139', '2022-02-19', '2025-06-24', '2025-06-25', '270', 1),
(103, '20250625VH9LT1103D', 'ELEAZAR GONZALEZ GONZALEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.134', '2021-09-01', '2025-09-06', '2025-09-07', '270', 1),
(104, '20250625MJ7QS5104P', 'ELIZABETH GARCIA SOTO', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.13', '2021-06-11', '2025-06-16', '2025-06-17', '270', 1),
(105, '20250625XB2HD5105X', 'ELIZABETH ROQUE ESQUIVEL ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4921019288', '', '', '', 1, '', '192.168.2.96', '2020-12-23', '2025-12-28', '2025-12-29', '270', 1),
(106, '20250625DC9FZ4106P', 'ENRIQUETA GONZALEZ ARAUJO', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.121', '2021-10-05', '2025-10-10', '2025-10-11', '270', 1),
(107, '20250625OD3BX2107W', 'ESTELA GARCIA ROQUE ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581187338', '', '', '', 1, '', '192.168.2.83', '2020-12-16', '2025-12-21', '2025-12-22', '270', 1),
(108, '20250625LC9CB1108X', 'ESTRELLA CITLALY HERNANDEZ GARCIA', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4922670540', '', '', '', 1, '', '192.168.2.87', '2020-12-17', '2025-12-22', '2025-12-23', '270', 1),
(109, '20250625LB4ZS1109K', 'FELIPA HERNANDEZ ESQUIVEL', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581069389', '', '', '', 1, '', '192.168.2.175', '2023-12-07', '2025-12-24', '2025-12-25', '270', 1),
(110, '20250625RF6RF6110P', 'FELIPE GARCIA ROQUE', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4921433822', '', '', '', 1, '', '192.168.2.173', '2025-01-15', '2025-06-20', '2025-06-21', '270', 1),
(111, '20250625PV4FS7111B', 'GABRIEL ESQUIVEL GARCIA', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581159994', '', '', '', 1, '', '192.168.2.94', '2020-12-23', '2025-12-28', '2025-12-29', '270', 1),
(112, '20250625VS6YE4112R', 'GABRIELA DE MATA HERNANDEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.115', '2021-01-05', '2025-06-10', '2025-06-11', '270', 1),
(113, '20250625XI2BV2113E', 'GABRIELA SAUCEDO GARCIA', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581091103', '', '', '', 1, '', '192.168.2.74', '2020-12-15', '2025-12-20', '2025-12-21', '270', 1),
(114, '20250625TN4GM0114I', 'GERARDO VAZQUEZ ESPARZA', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.143', '2022-03-02', '2025-06-07', '2025-06-08', '270', 1),
(115, '20250625WO3RU2115H', 'GLORIA EDITH VALDEZ FLORES', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4929057044', '', '', '', 1, '', '192.168.2.82', '2020-12-16', '2025-12-21', '2025-12-22', '270', 1),
(116, '20250625WR6LF5116Y', 'GLORIA SOTO DURAN', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.133', '2021-08-27', '2025-09-01', '2025-09-02', '270', 1),
(117, '20250625YI6XB1117V', 'HERMILA ESQUIVEL CASTRO', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.116', '2021-01-05', '2025-06-10', '2025-06-11', '270', 1),
(118, '20250625HT9RJ4118G', 'JAVIER GONZALEZ HERNANDEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4922663271', '', '', '', 1, '', '192.168.2.85', '2020-12-16', '2025-12-21', '2025-12-22', '270', 1),
(119, '20250625EA2XF4119L', 'JESUS MANUEL GONZALEZ GONZALEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4921124511', '', '', '', 1, '', '192.168.2.171', '2023-03-03', '2025-06-10', '2025-06-11', '270', 1),
(120, '20250625GO2VC7120P', 'JORGE ESQUIVEL GARCIA', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4921449105', '', '', '', 1, '', '192.168.2.128', '2021-04-13', '2025-06-18', '2025-06-19', '270', 1),
(121, '20250625TM5PA4121V', 'JOSE ANGEL RODRIGUEZ GARCIA', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.137', '2021-11-10', '2025-11-15', '2025-11-16', '270', 1),
(122, '20250625YJ1IH4122Q', 'JOSE FRANCISCO ADAME ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.123', '2025-06-25', '2025-06-30', '2025-07-01', '270', 1),
(123, '20250625AA0IF1123E', 'JOSE IVAN GONZALEZ  HERNANDEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4922419517', '', '', '', 1, '', '192.168.2.129', '2021-05-21', '2025-06-26', '2025-06-27', '270', 1),
(124, '20250625WC5KI4124D', 'JUAN DANIEL GONZALEZ GONZALEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581190626', '', '', '', 1, '', '192.168.2.120.', '2021-03-19', '2025-06-24', '2025-06-25', '270', 1),
(125, '20250625AQ7VL2125X', 'JULIANA GARCIA ROQUE', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581046095', '', '', '', 2, '', '192.168.2.76', '2020-12-15', '2025-12-20', '2025-12-21', '470', 1),
(126, '20250625CL9NC4126F', 'KAREN GUADALUPE GONZALEZ GARCIA', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4921016664', '', '', '', 1, '', '192.168.2.99', '2020-12-23', '2025-12-28', '2025-12-29', '270', 1),
(127, '20250625YS2FV8127K', 'KARLA YARELI GONZALEZ DURAN', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.119', '2025-06-25', '2025-06-30', '2025-07-01', '270', 1),
(128, '20250625CU0LI5128P', 'KARLA YESENIA ARTEAGA ESQUIVEL', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.79', '2020-12-16', '2025-12-21', '2025-12-22', '270', 1),
(129, '20250625IN5TL7129X', 'LETICIA ESQUIVEL VALDEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581040883', '', '', '', 1, '', '192.168.110', '2021-02-23', '2025-06-28', '2025-06-29', '270', 1),
(130, '20250625IZ5YU9130K', 'LUCIA HERNANDEZ CASTRO', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4921597926', '', '', '', 1, '', '192.168.2.90.', '2020-12-17', '2025-12-22', '2025-12-23', '270', 1),
(131, '20250625OP2AX4131U', 'LUZ VERONICA JACOBO MARES', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4921077616', '', '', '', 1, '', '192.168.2.152', '2022-10-10', '2025-10-15', '2025-10-16', '270', 1),
(132, '20250625ST8YG3132O', 'MA CONCEPCION NELVA ESQUIVEL FRIAS', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4921226820', '', '', '', 1, '', '192.168.2.217', '2023-09-02', '2025-09-20', '2025-09-21', '270', 1),
(133, '20250625MJ0HH7133Q', 'MA DEL CARMEN RODRIGUEZ ESQUIVEL', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4921055204', '', '', '', 1, '', '192.168.2.47', '2024-08-21', '2025-08-26', '2025-08-27', '270', 1),
(134, '20250625AG2ZJ8134A', 'MA GUADALUPE GONZALEZ GONZALEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4921620395', '', '', '', 1, '', '192.168.2.92', '2020-12-17', '2025-12-22', '2025-12-23', '270', 1),
(135, '20250625EH8OZ7135D', 'MARIA ADILENE CASTRO GARCIA', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4922887631', '', '', '', 1, '', '192.168.2.114', '2021-01-05', '2025-06-10', '2025-06-11', '270', 1),
(136, '20250625QA1DZ3136R', 'MARIA DE JESUS MEDINA RODRIGUEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.131', '2021-06-15', '2025-06-20', '2025-06-21', '270', 1),
(137, '20250625DV8AS4137H', 'MARIA DE LA LUZ GARCIA GONZALEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581205976', '', '', '', 1, '', '192.168.2.98', '2020-12-23', '2025-12-28', '2025-12-29', '270', 1),
(138, '20250625OG2SE3138V', 'MARIA DE LOS ANGELES SAUCEDO GARCIA', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4929260978', '', '', '', 1, '', '192.168.2.71', '2020-12-16', '2025-12-21', '2025-12-22', '270', 1),
(139, '20250625GR6RR5139K', 'MARIA DEL CARMEN GARCIA CERVANTES', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581368725', '', '', '', 1, '', '192.168.2.200', '2022-07-01', '2025-07-06', '2025-07-07', '270', 1),
(140, '20250625QC2KS8140Q', 'MARIA DEL CARMEN GONZALEZ GONZALEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4921505480', '', '', '', 1, '', '192.168.2.156', '2022-10-13', '2025-10-18', '2025-10-19', '270', 1),
(141, '20250625JE1OJ3141V', 'MARIA DEL PILAR GARCIA GONZALEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.28', '2021-03-19', '2025-06-24', '2025-06-25', '270', 1),
(142, '20250625HV9US5142E', 'MARIA DEL ROSARIO LOZANO CORTEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4929006004', '', '', '', 1, '', '192.168.2.77', '2020-12-15', '2025-12-20', '2025-12-21', '270', 1),
(143, '20250625UW7RN6143P', 'MARIA ELENA RODRIGUEZ GARCIA', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581285764', '', '', '', 1, '', '192.168.2.89', '2020-12-17', '2025-12-22', '2025-12-23', '270', 1),
(144, '20250625LI0XQ7144J', 'MARIA ELIZABETH GARCIA GONZALEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.55', '2024-02-28', '2025-06-02', '2025-06-03', '270', 1),
(145, '20250625QW4XI2145J', 'MARIA RAMONA GARCIA GONZALEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581207228', '', '', '', 1, '', '192.168.2.91', '2020-12-17', '2025-12-22', '2025-12-23', '270', 1),
(146, '20250625WG0TO5146X', 'MARISELA ESQUIVEL RODRIGUEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4922676217', '', '', '', 1, '', '192.168.2.146', '2022-06-08', '2025-06-13', '2025-06-14', '270', 1),
(147, '20250625KN2HD6147F', 'MIRNA GARCIA ESQUIVEL', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4921456607', '', '', '', 1, '', '192.168.2.168', '2024-06-25', '2025-06-30', '2025-07-01', '270', 1),
(148, '20250625NH8VY8148M', 'OLGA LIDIA GARCIA GONZALEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4589898700', '', '', '', 1, '', '192.168.2.97', '2020-12-23', '2025-12-28', '2025-12-29', '270', 1),
(149, '20250625AB1LK0149Z', 'OLGA MARIA RODRIGUEZ DURAN', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4922655459', '', '', '', 1, '', '192.168.2.88', '2020-12-17', '2025-12-22', '2025-12-23', '270', 1),
(150, '20250625MT0IS6150O', 'PAOLA ESQUIVEL GARCIA', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581162854', '', '', '', 1, '', '192.168.2.69', '2024-02-14', '2025-06-19', '2025-06-20', '270', 1),
(151, '20250625XI4QH7151U', 'PERLA FERNANDA DURAN MORALES', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4922059144', '', '', '', 1, '', '192.168.2.126', '2023-11-02', '2025-12-03', '2025-12-04', '270', 1),
(152, '20250625VP8YW1152U', 'PETRA GARCIA GONZALEZ ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4922903031', '', '', '', 1, '', '192.168.2.64', '2021-12-03', '2025-12-08', '2025-12-09', '270', 1),
(153, '20250625VJ4II6153C', 'RITA RODRIGUEZ ADAME', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '458102383', '', '', '', 1, '', '192.168.2.141', '2024-01-10', '2025-06-15', '2025-06-16', '270', 1),
(154, '20250625YK6XI1154A', 'ROSAURA GONZALEZ GONZALEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.142', '2022-03-02', '2025-06-07', '2025-06-08', '270', 1),
(155, '20250625WF7JU3155D', 'RUBEN SOTO ESQUIVEL', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581239192', '', '', '', 1, '', '192.168.2.163', '2022-11-12', '2025-11-17', '2025-11-18', '270', 1),
(156, '20250625DY3NF8156C', 'SALVADOR GARCIA ROQUE ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.107', '2024-02-28', '2025-06-02', '2025-06-03', '270', 1),
(157, '20250625WR2XY6157F', 'SANDRA ALICIA GARCIA MEDINA', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4922674028', '', '', '', 1, '', '192.168.2.125', '2025-06-25', '2025-06-30', '2025-07-01', '270', 1),
(158, '20250625XY2RQ8158O', 'SANJUANA ODALY GARCIA SOTO', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.108', '2021-01-15', '2025-06-20', '2025-06-21', '270', 1),
(159, '20250625HV0CX0159U', 'SUSANA MURILLO BECERRA', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.106', '2021-01-04', '2025-06-09', '2025-06-10', '270', 1),
(160, '20250625AJ9AQ1160H', 'TADEO ROQUE ADAME  DELFINA', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581207887', '', '', '', 1, '', '192.168.2.95', '2020-12-23', '2025-12-28', '2025-12-29', '270', 1),
(161, '20250625ES6QW8161S', 'TANIA GARCIA HERNANDEZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.132', '2021-07-09', '2025-07-14', '2025-07-15', '270', 1),
(162, '20250625IG7UG7162F', 'URIEL JOBANI SOTO NU?EZ', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.136', '2021-10-22', '2025-10-27', '2025-10-28', '270', 1),
(163, '20250625HE9FI6163D', 'VERONICA HERRERA GARCIA', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '', '', '', '', 1, '', '192.168.2.123', '2021-04-07', '2025-06-12', '2025-06-13', '270', 1),
(164, '20250625PB1WT1164O', 'VICTORIA ROQUE MEDINA', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4581067905', '', '', '', 1, '', '192.168.2.80.', '2020-12-15', '2025-12-20', '2025-12-21', '270', 1),
(165, '20250625BM7WZ2165S', 'YAZMIN JACOBO ARENAS', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4922671136', '', '', '', 1, '', '192.168.2.19', '2022-04-04', '2025-06-09', '2025-06-10', '270', 1),
(166, '20250625XU7AM9166B', 'YURIDIA MAYRANY MEDINA SOTO', '', '', '', 'RIO VERDE', 'CUAUHTEMOC', 'ZACATECAS', 98684, '4651548614', '', '', '', 1, '', '192.168.2.75', '2020-12-15', '2025-12-20', '2025-12-21', '270', 1),
(167, '20250625JL2EQ4167D', 'ADOLFO GARCIA MURO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.195', '2020-04-28', '2025-06-02', '2025-06-03', '260', 1),
(168, '20250625PE1UB2168E', 'ADRIANA HERNANDEZ SALAZAR', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922454928', '', '', '', 3, '', '192.168.33.211', '2023-10-07', '2025-10-14', '2025-10-15', '260', 1),
(169, '20250625ZJ5QP9169I', 'ALEJANDRA HERNANDEZ ESQUIVEL', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '3342474369', '', '', '', 3, '', '192.168.31.103', '2024-05-04', '2025-06-09', '2025-06-10', '260', 1),
(170, '20250625YF9CJ6170P', 'ALEJANDRA JACOBO GUERRERO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922917609', '', '', '', 3, '', '192.168.31.215', '2023-08-23', '2025-08-12', '2025-08-13', '260', 1),
(171, '20250625YK6UA8171K', 'ALEJANDRA MIREYA SALINAS SAUCEDO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921273679', '', '', '', 3, '', '192.168.31.164', '2022-09-17', '2025-09-22', '2025-09-23', '260', 1),
(172, '20250625NP5YC5172Y', 'ALEJANDRINA SALAZAR GARCIA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4589893488', '', '', '', 3, '', '192.168.33.22', '2022-12-01', '2025-12-06', '2025-12-07', '260', 1),
(173, '20250625BT7MX3173D', 'ALEJANDRO LOPEZ CHAVEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4924934433', '', '', '', 3, '', '192.168.31.186', '2022-02-16', '2025-06-21', '2025-06-22', '260', 1),
(174, '20250625EU7XT5174J', 'ALONSO LOPEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.108', '2021-10-30', '2025-11-04', '2025-11-05', '260', 1),
(175, '20250625ON5AC3175X', 'AMALIA MANDUJANO RAMIREZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.165', '2021-06-29', '2025-07-04', '2025-07-05', '260', 1),
(176, '20250625ME3ME2176D', 'ANA CECILIA HERNANDEZ GUERRERO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.232', '2019-04-10', '2025-06-15', '2025-06-16', '260', 1),
(177, '20250625UC3FC0177W', 'ANA KAREN GARCIA MU?OZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921469856', '', '', '', 3, '', '192.168.31.78', '2025-01-31', '2025-06-05', '2025-06-06', '260', 1),
(178, '20250625KF9OT5178M', 'ANA KAREN SIERRA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.171', '2021-07-07', '2025-07-12', '2025-07-13', '260', 1),
(179, '20250625BH9CA7179W', 'ANAHI HERNANDEZ LOPEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.101', '2020-09-14', '2025-09-19', '2025-09-20', '260', 1),
(180, '20250625PY3GK0180J', 'ANALILIA LOPEZ CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.229', '2020-09-09', '2025-09-14', '2025-09-15', '260', 1),
(181, '20250625ZE2IV6181O', 'ANGELA CASTRO CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922947306', '', '', '', 3, '', '192.168.31.124', '2025-04-09', '2025-06-14', '2025-06-15', '260', 1),
(182, '20250625MD3WP8182S', 'ANTONIO LOPEZ CHAVEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921309918', '', '', '', 3, '', '192.168.31.243', '2024-02-02', '2025-06-07', '2025-06-08', '260', 1),
(183, '20250625GR2AZ5183F', 'ARALY HERNANDEZ CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.166', '2020-06-30', '2025-07-05', '2025-07-06', '260', 1),
(184, '20250625BH5YX0184G', 'ARTURO LOPEZ HERNANDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921594026', '', '', '', 3, '', '192.168.31.196', '2022-09-24', '2025-09-29', '2025-09-30', '260', 1),
(185, '20250625WO3RQ6185R', 'AUDELIA CASTRO ARTEAGA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.167', '2020-05-18', '2025-06-23', '2025-06-24', '260', 1),
(186, '20250625SB2XO7186Z', 'AZUCENA CASTRO CHAVEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921323922', '', '', '', 3, '', '192.168.33.136', '2020-12-11', '2025-12-16', '2025-12-17', '260', 1),
(187, '20250625XF1BC7187U', 'BAUDELIO MURO CHAVEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.158', '2020-06-25', '2025-06-30', '2025-06-01', '260', 1),
(188, '20250625DZ1MQ4188K', 'BERNARDO LOPEZ CHAVEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.127', '2018-10-30', '2025-11-04', '2025-11-05', '260', 1),
(189, '20250625LC5FZ2189G', 'BLANCA AURORA CASTRO LOPEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.26', '2024-04-01', '2025-06-06', '2025-06-07', '260', 1),
(190, '20250625KP0GL2190O', 'BLANCA LORENA MURO HERNANDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921110069', '', '', '', 3, '', '192.168.33.32', '2023-11-15', '2025-12-05', '2025-12-06', '260', 1),
(191, '20250625JH1XR7191W', 'BRAULIO HERNANDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.102', '2020-02-06', '2025-06-11', '2025-06-12', '260', 1),
(192, '20250625PA5AN7192X', 'BRAYAN ABEL LOPEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.90', '2022-12-08', '2025-12-13', '2025-12-14', '260', 1),
(193, '20250625JK9MA6193M', 'BRAYAN MURO HERRERA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922286105', '', '', '', 3, '', '192.168.31.238', '2023-01-03', '2025-06-16', '2025-06-17', '260', 1),
(194, '20250625KA2BB5194X', 'CARITINA SANTAMARIA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.108', '2020-04-28', '2025-06-02', '2025-06-03', '260', 1),
(195, '20250625GG6VX1195R', 'CARLOS GILBERTO GARCIA MURO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.197', '2020-02-10', '2025-06-15', '2025-06-16', '260', 1),
(196, '20250625QD8ML0196T', 'CARLOS OMAR HERNANDEZ CHAVEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921071127', '', '', '', 3, '', '192.168.31.168', '2025-06-25', '2025-06-30', '2025-06-01', '260', 1),
(197, '20250625WD9YY1197T', 'CATALINA HERNANDEZ CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921810590', '', '', '', 3, '', '192.168.31.169', '2022-04-19', '2025-06-24', '2025-06-25', '260', 1),
(198, '20250625JZ6ZC1198V', 'CECILIA JACOBO GUERRERO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922431876', '', '', '', 3, '', '192.168.31.198', '2020-10-05', '2025-10-10', '2025-10-11', '260', 1),
(199, '20250625ER6VV5199G', 'CESAR EDUARDO MURO HERNANDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.205', '2020-08-25', '2025-08-30', '2025-08-31', '260', 1),
(200, '20250625VA0IO2200D', 'CINTIA CASTRO HERNANDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4581060775', '', '', '', 3, '', '192.168.33.49', '2021-09-15', '2025-09-20', '2025-09-21', '260', 1),
(201, '20250625MQ1IP1201E', 'CLARA SALAZAR JACOBO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.100', '2018-12-06', '2025-12-11', '2025-12-12', '260', 1),
(202, '20250625BW9QC7202O', 'CLAUDIA JACOBO SAUCEDO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.170.', '2021-10-04', '2025-10-09', '2025-10-10', '260', 1),
(203, '20250625BG8EV3203W', 'CLAUDIA LIZETH CASTRO SANCHEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4923189538', '', '', '', 3, '', '192.168.31.192', '2025-02-04', '2025-06-09', '2025-06-10', '260', 1),
(204, '20250625JN2JT1204H', 'CLAUDIA RUBI MURO FLORES', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.152', '2023-11-29', '2025-11-24', '2025-11-25', '260', 1),
(205, '20250625KQ8XI9205S', 'CRISTINA GUERRERO CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4925446555', '', '', '', 3, '', '192.168.31.115', '2024-07-30', '2025-08-04', '2025-08-05', '260', 1),
(206, '20250625ME5EC0206K', 'DANIELA MONSERRAT MURO HERNANDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921371317', '', '', '', 3, '', '192.168.33.85', '2022-03-09', '2025-06-14', '2025-06-15', '260', 1),
(207, '20250625ZK2SO4207O', 'DIANA LAURA GARCIA JACOBO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.223', '2019-11-28', '2025-12-03', '2025-12-04', '260', 1),
(208, '20250625HR8HW2208I', 'DOC LUMBRERAS', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.89', '2021-11-26', '2025-12-01', '2025-12-02', '260', 1),
(209, '20250625KQ4DM2209K', 'DOMITILA JACOBO SALAZAR', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.167', '2021-11-12', '2025-11-17', '2025-11-18', '260', 1),
(210, '20250625WR8WT4210C', 'DULCE YARISET DE LA CRUZ HERNANDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4589894358', '', '', '', 3, '', '192.168.31.233', '2022-05-12', '2025-06-17', '2025-06-18', '260', 1),
(211, '20250625JR7GK6211P', 'ELIA LOPEZ CHAVEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4581159321', '', '', '', 3, '', '192.168.33.251', '2021-07-16', '2025-07-21', '2025-07-22', '260', 1),
(212, '20250625VM6EY7212H', 'ESMERALDA CASTRO SALAZAR', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921365777', '', '', '', 3, '', '192.168.31.116', '2024-08-05', '2025-08-10', '2025-08-11', '260', 1),
(213, '20250625HF2OY3213Z', 'ESMERALDA LOPEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921050381', '', '', '', 3, '', '192.168.31.93', '2025-03-01', '2025-06-06', '2025-06-07', '260', 1),
(214, '20250625OR6UZ7214T', 'ESTEFANIA HERNANDEZ CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.172', '2021-08-18', '2025-08-23', '2025-08-24', '260', 1),
(215, '20250625ZX8YJ2215I', 'ESTHER ALEJANDRA HERNANDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.200', '2019-08-17', '2025-08-22', '2025-08-23', '260', 1),
(216, '20250625VF2HP6216M', 'ESTRELLA MARLEN CASTRO CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921164210', '', '', '', 3, '', '192.168.31.241', '2024-01-31', '2025-06-05', '2025-06-06', '260', 1),
(217, '20250625MT8CN7217L', 'EVA GARCIA LOPEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4923189538', '', '', '', 3, '', '192.168.31.199', '2022-02-01', '2025-06-06', '2025-06-07', '260', 1),
(218, '20250625NR6JH2218Y', 'FATIMA ENEDINA LOPEZ CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921628576', '', '', '', 3, '', '192.168.33.147', '2025-03-03', '2025-06-08', '2025-06-09', '260', 1),
(219, '20250625RB1QH2219Y', 'FELIPA SALAZAR MARTINEZ ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922434312', '', '', '', 3, '', '192.168.31.118', '2024-07-10', '2025-07-15', '2025-07-16', '260', 1),
(220, '20250625EO9XR4220J', 'FERNANDA CASTRO JACOBO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4581288865', '', '', '', 3, '', '192.168.31.236', '2023-12-28', '2025-12-06', '2025-12-07', '260', 1),
(221, '20250625YU1EI4221W', 'FRANCISCO LOPEZ CHAVEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921036011', '', '', '', 3, '', '192.168.33.221', '2023-08-02', '2025-08-23', '2025-08-24', '260', 1),
(222, '20250625BA0WT4222X', 'GABRIELA LOPEZ CHAVEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4924934433', '', '', '', 3, '', '192.168.31.88', '2025-01-31', '2025-06-05', '2025-06-06', '260', 1),
(223, '20250625BP4QU0223P', 'GABRIELA MARTINEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.172', '2020-01-08', '2025-06-13', '2025-06-14', '260', 1),
(224, '20250625UN1AV3224O', 'GLORIA MURO RODRIGUEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.218', '2020-01-16', '2025-06-21', '2025-06-22', '260', 1),
(225, '20250625OB8US2225F', 'GREGORIO MURO CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921170231', '', '', '', 3, '', '192.168.33.6', '2021-10-02', '2025-10-07', '2025-10-08', '260', 1),
(226, '20250625GE2MI4226F', 'GUADALUPE ORTIZ PALOMINO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.201', '2020-05-12', '2025-06-17', '2025-06-18', '260', 1),
(227, '20250625LA1FF0227Y', 'HECTOR HERNANDEZ MURO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.174', '2020-09-11', '2025-09-16', '2025-09-17', '260', 1),
(228, '20250625PF3IS1228H', 'HERIBERTO MURO HERNANDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.79', '2021-08-02', '2025-08-07', '2025-08-08', '260', 1),
(229, '20250625PH6MC1229S', 'HERMELINDA HERNANDEZ HERNANDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921025402', '', '', '', 3, '', '192.168.33.189', '2020-10-22', '2025-10-27', '2025-10-28', '260', 1),
(230, '20250625DD5YL7230J', 'HERMINIA DELGADO CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.125', '2024-02-16', '2025-06-21', '2025-06-22', '260', 1);
INSERT INTO `clientes` (`id`, `folio`, `nombre`, `domicilio`, `calle`, `colonia`, `comunidad`, `municipio`, `estado`, `cp`, `telefono`, `referencias`, `identificacion`, `comprobante`, `servicio`, `antena`, `direccionip`, `fecha_contrato`, `fecha_limite`, `fecha_corte`, `cuota`, `estatus`) VALUES
(231, '20250625CI2PR7231P', 'HUMBERTO HERNANDEZ CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921175083', '', '', '', 3, '', '192.168.31.175', '2022-11-23', '2025-11-28', '2025-11-29', '260', 1),
(232, '20250625EW4AF0232A', 'IRIS GARCIA DOMINGUEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.137', '2020-04-28', '2025-06-02', '2025-06-03', '260', 1),
(233, '20250625GO8BY2233A', 'ISAURA CASTRO ESQUIVEL', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '', '2025-02-21', '2025-06-26', '2025-06-27', '260', 1),
(234, '20250625TK5XF2234X', 'ISIDORA CASTRO HERNANDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.176', '2021-04-29', '2025-06-03', '2025-06-04', '260', 1),
(235, '20250625SC2EU6235C', 'ITZEL MURO LOPEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.106', '2018-12-11', '2025-12-16', '2025-12-17', '260', 1),
(236, '20250625QT5IH7236L', 'ITZEL SANCHEZ BERMUDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.177', '2021-08-18', '2025-08-23', '2025-08-24', '260', 1),
(237, '20250625SJ0EL5237W', 'J. JESUS GARCIA MACIAS', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.176', '2021-10-20', '2025-10-25', '2025-10-26', '260', 1),
(238, '20250625IW8VO7238P', 'JAIME MARTINEZ LOPEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.178', '2021-11-09', '2025-11-14', '2025-11-15', '260', 1),
(239, '20250625TC6VB7239Z', 'JAQUELIN REVELES MARTINEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921722766', '', '', '', 3, '', '192.168.31.228', '2023-06-02', '2025-07-03', '2025-07-04', '260', 1),
(240, '20250625SW6TH8240G', 'JESUS CASTRO GONZALEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '23', '', '', '', 3, '', '192.168.31.221', '2019-04-22', '2025-06-27', '2025-06-28', '260', 1),
(241, '20250625LA9VP5241L', 'JESUS LOPEZ CHAVEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '8329940736', '', '', '', 3, '', '192.168.31.76', '2025-01-16', '2025-06-21', '2025-06-22', '260', 1),
(242, '20250625IQ6KM9242K', 'JESUS MARTINEZ GARCIA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921612339', '', '', '', 3, '', '192.168.31.179', '2020-10-05', '2025-10-10', '2025-10-11', '260', 1),
(243, '20250625CH5MY8243T', 'JOEL GARCIA MARES ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.109', '2019-02-01', '2025-06-06', '2025-06-07', '260', 1),
(244, '20250625LX6LJ2244T', 'JORGE HERNANDEZ JACOBO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.107', '2018-12-08', '2025-12-13', '2025-12-14', '260', 1),
(245, '20250625GP3WG9245M', 'JORGE LUIS REVELES GARCIA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921027257', '', '', '', 3, '', '192.168.33.216', '2021-02-12', '2025-06-17', '2025-06-18', '260', 1),
(246, '20250625KS6OQ2246Z', 'JOSE BRANDON HERRERA GARCIA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.101', '2021-10-08', '2025-10-13', '2025-10-14', '260', 1),
(247, '20250625JY8ZL8247H', 'JOSE CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921805465', '', '', '', 3, '', '192.168.31.202', '2021-01-22', '2025-06-27', '2025-06-28', '260', 1),
(248, '20250625OU5BQ2248A', 'JOSE DE JESUS GARCIA MURO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.203', '2021-08-18', '2025-08-23', '2025-08-24', '260', 1),
(249, '20250625AH0XD1249S', 'JOSE DE JESUS JACOBO CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922446121', '', '', '', 3, '', '192.168.33.213', '2022-12-15', '2025-12-20', '2025-12-21', '260', 1),
(250, '20250625IF1UW0250A', 'JOSE DE JESUS JACOBO SANCHEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4581203021', '', '', '', 3, '', '192.168.31.213', '2023-07-19', '2025-07-06', '2025-07-07', '260', 1),
(251, '20250625NJ6MC0251O', 'JOSE ESAU LOPEZ HERNANDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '23', '', '', '', 3, '', '192.168.33.149', '2019-08-16', '2025-08-21', '2025-08-22', '260', 1),
(252, '20250625DL3GH5252X', 'JOSE JUAN GARCIA JACOBO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4581168602', '', '', '', 3, '', '192.168.31.180', '2023-04-15', '2025-06-17', '2025-06-18', '260', 1),
(253, '20250625XQ7ZC3253X', 'JOSE MANUEL HERNANDEZ CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4581057925', '', '', '', 3, '', '192.168.31.120', '2024-08-12', '2025-08-17', '2025-08-18', '260', 1),
(254, '20250625VU0SJ2254I', 'JOSE MANUEL JACOBO GUERRERO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.204', '2018-12-19', '2025-12-24', '2025-12-25', '260', 1),
(255, '20250625FQ1RV9255A', 'JOSE MANUEL SALAZAR RAMOS ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921324685', '', '', '', 3, '', '', '2024-06-14', '2025-06-19', '2025-06-20', '260', 1),
(256, '20250625SS3HQ9256U', 'JUAN ANTONIO CASTRO CHAVEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921369086', '', '', '', 3, '', '192.168.31.181', '2019-11-01', '2025-11-06', '2025-11-07', '260', 1),
(257, '20250625WV6FI5257B', 'JUAN CARLOS HERNANDEZ GARCIA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922014005', '', '', '', 3, '', '192.168.31.235', '2023-12-08', '2025-12-24', '2025-12-25', '260', 1),
(258, '20250625SK9QY5258D', 'JUAN CARLOS LOPEZ ZERME?O', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921193835', '', '', '', 3, '', '192.168.31.231', '2023-12-05', '2025-12-21', '2025-12-22', '260', 1),
(259, '20250625UQ5UD8259S', 'JUAN GABRIEL SALAZAR RAMOS', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.222', '2021-11-06', '2025-11-11', '2025-11-12', '260', 1),
(260, '20250625GK4BE7260E', 'JUAN HERRERA GUERRERO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922551910', '', '', '', 3, '', '', '2025-03-05', '2025-06-10', '2025-06-11', '260', 1),
(261, '20250625ZW9RX0261Q', 'JUANA HERNANDEZ GARCIA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.205', '2019-03-11', '2025-06-16', '2025-06-17', '260', 1),
(262, '20250625JS3UA5262V', 'JUANA HERRERA RAMIREZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921283343', '', '', '', 3, '', '192.168.33.172', '2022-05-23', '2025-06-28', '2025-06-29', '260', 1),
(263, '20250625CK3QS5263P', 'KARLA ALEJANDRA CASTRO J ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922010201', '', '', '', 3, '', '192.168.33.90.', '2024-03-07', '2025-06-12', '2025-06-13', '260', 1),
(264, '20250625HL3SN6264P', 'LAURA FABIOLA GARCIA ROQUE ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '492-137-62-20', '', '', '', 3, '', '192.168.33.139', '2019-11-23', '2025-11-28', '2025-11-29', '260', 1),
(265, '20250625LH7XR0265L', 'LEONARDO MURO HERNANDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4581026710', '', '', '', 3, '', '192.168.33.86', '2024-02-22', '2025-06-27', '2025-06-28', '260', 1),
(266, '20250625RH6QH6266I', 'LETICIA CASTRO MURO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921708952', '', '', '', 3, '', '192.168.31.182', '2022-06-23', '2025-06-28', '2025-06-29', '260', 1),
(267, '20250625DX9XM4267N', 'LETICIA SALAZAR', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.140.', '2020-09-09', '2025-09-14', '2025-09-15', '260', 1),
(268, '20250625BV9GH7268G', 'LIDIA SANCHEZ GARCIA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922937830', '', '', '', 3, '', '192.168.31.183', '2022-01-27', '2025-06-01', '2025-06-02', '260', 1),
(269, '20250625BD0XG7269B', 'LIZANDRA REVELES HERRERA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4581295261', '', '', '', 3, '', '192.168.31.184', '2022-07-06', '2025-07-11', '2025-07-12', '260', 1),
(270, '20250625EY5IP5270P', 'LORENA MU?OZ DURAN', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.52', '2021-09-27', '2025-10-02', '2025-10-03', '260', 1),
(271, '20250625KX7WK7271F', 'LUIS GERARDO GARCIA ROQUE', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.144', '2021-10-13', '2025-10-18', '2025-10-19', '260', 1),
(272, '20250625UK3HO2272D', 'LUIS GERARDO JACOBO CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.212', '2021-10-13', '2025-10-18', '2025-10-19', '260', 1),
(273, '20250625TY7MJ2273N', 'LUIS GERMAN NIETO MURO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921309309', '', '', '', 3, '', '192.168.33.210.', '2021-02-02', '2025-06-07', '2025-06-08', '260', 1),
(274, '20250625CE9UC8274K', 'LUZ ELENA RODRIGUEZ ARTEAGA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922675734', '', '', '', 3, '', '192.168.31.119', '2021-01-13', '2025-06-18', '2025-06-19', '260', 1),
(275, '20250625AU1ZV3275K', 'MA AZUCENA FRAGOZA GONZALEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921075515', '', '', '', 3, '', '192.168.31.123', '2024-04-08', '2025-06-13', '2025-06-14', '260', 1),
(276, '20250625VS0JK6276W', 'MA DE JESUS GONZALEZ SAUCEDO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4581155373', '', '', '', 3, '', '192.168.31.187', '2023-01-04', '2025-06-11', '2025-06-12', '260', 1),
(277, '20250625CM9OI3277Z', 'MA DEL CONSUELO MARTINEZ GARCIA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922918164', '', '', '', 3, '', '192.168.33.31', '2023-01-28', '2025-06-02', '2025-06-03', '260', 1),
(278, '20250625ZK3IQ4278N', 'MA DEL ROSARIO HERRERA CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921455722', '', '', '', 3, '', '192.168.31.99', '2025-03-19', '2025-06-24', '2025-06-25', '260', 1),
(279, '20250625PL4GC1279M', 'MA DEL ROSARIO ORTIZ PALOMINO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922662715', '', '', '', 3, '', '192.168.33.109', '2020-08-25', '2025-08-30', '2025-08-31', '260', 1),
(280, '20250625ET4SY4280U', 'MA GUADALUPE GUERRERO MACIAS', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4581151186', '', '', '', 3, '', '192.168.31.246', '2024-04-02', '2025-06-07', '2025-06-08', '260', 1),
(281, '20250625RI2JE7281D', 'MANUEL ALEJANDRO CASTA?ON DELGADO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 4, '', '192.168.33.141', '2020-04-27', '2025-06-01', '2025-06-02', '460', 1),
(282, '20250625UO2QP7282K', 'MANUEL DE JESUS MURO LOPEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.185', '2021-06-21', '2025-06-26', '2025-06-27', '260', 1),
(283, '20250625OP5JM5283W', 'MANUELA MURO HERNANDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.130.', '2020-07-31', '2025-08-05', '2025-08-06', '260', 1),
(284, '20250625IQ9KL6284A', 'MARIA AZUCENA GARCIA MACIAS', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.110.', '2019-09-17', '2025-09-22', '2025-09-23', '260', 1),
(285, '20250625XI1JO4285C', 'MARIA CRISTINA CASTRO CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922911023', '', '', '', 3, '', '192.168.31.127', '2020-11-25', '2025-11-30', '2025-12-01', '260', 1),
(286, '20250625AS5EZ8286Z', 'MARIA DEL ROSARIO CASTRO ARTEAGA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.112', '2020-04-01', '2025-06-06', '2025-06-07', '260', 1),
(287, '20250625BF3OQ0287P', 'MARIA DEL ROSARIO CASTRO CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.206', '2018-11-19', '2025-11-24', '2025-11-25', '260', 1),
(288, '20250625JG2EP6288E', 'MARIA DEL ROSARIO MURO REVELES', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.131', '2019-02-01', '2025-06-06', '2025-06-07', '260', 1),
(289, '20250625VQ3TI1289U', 'MARIA DEL ROSARIO SALAZAR GARCIA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.142', '2019-05-14', '2025-06-19', '2025-06-20', '260', 1),
(290, '20250625UY7WW3290X', 'MARIA ELENA RODRIGUEZ RODRIGUEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.188', '2021-07-21', '2025-07-26', '2025-07-27', '260', 1),
(291, '20250625VL0MA1291D', 'MARIA ESTELA SALAZAR RAMOS', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4581023178', '', '', '', 3, '', '192.168.31.219', '2021-01-25', '2025-06-30', '2025-06-01', '260', 1),
(292, '20250625WO9DO2292D', 'MARIA FLORES AQUILINO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4952613525', '', '', '', 3, '', '192.168.33.181', '2022-07-25', '2025-07-30', '2025-07-31', '260', 1),
(293, '20250625SG7BA8293I', 'MARIA GEORGINA ARTEAGA ESQUIVEL', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.104', '2019-06-24', '2025-06-29', '2025-06-30', '260', 1),
(294, '20250625HT4JI1294N', 'MARIA GLORIA SALAZAR GARCIA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4493579455', '', '', '', 3, '', '192.168.31.133', '2024-12-31', '2025-06-05', '2025-06-06', '260', 1),
(295, '20250625BE9PZ1295V', 'MARIA GUADALUPE CASTRO LOPEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.220', '2019-01-18', '2025-06-23', '2025-06-24', '260', 1),
(296, '20250625JN4MR9296Z', 'MARIA GUADALUPE GARCIA MURO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921329662', '', '', '', 3, '', '192.168.31.189', '2019-07-24', '2025-07-29', '2025-07-30', '260', 1),
(297, '20250625UM4VM8297F', 'MARIA HERNANDEZ LOPEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.234', '2021-05-24', '2025-06-29', '2025-06-30', '260', 1),
(298, '20250625BU0PT6298Y', 'MARIA JULICE REVELES MARTELL', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4442811094', '', '', '', 3, '', '192.168.33.83', '2024-02-22', '2025-06-27', '2025-06-28', '260', 1),
(299, '20250625GH2EM4299Y', 'MARIA PERLA GARCIA MACIAS', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921978776', '', '', '', 3, '', '', '2024-06-12', '2025-06-17', '2025-06-18', '260', 1),
(300, '20250625BQ6QQ1300L', 'MARIA REYES JACOBO SALAZAR', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.225', '2022-02-07', '2025-06-12', '2025-06-13', '260', 1),
(301, '20250625PE2IL2301A', 'MARIA REYNA PRADO PALOMARES', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.224', '2023-12-01', '2025-06-05', '2025-06-06', '260', 1),
(302, '20250625EJ2EO4302U', 'MARIANA GUERRERO LOPEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.190', '2020-05-07', '2025-06-12', '2025-06-13', '260', 1),
(303, '20250625VM6LR3303G', 'MARIANA ISABEL CHAVEZ REVELES', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922515353', '', '', '', 3, '', '192.168.31.90', '2025-02-14', '2025-06-19', '2025-06-20', '260', 1),
(304, '20250625ZE3QL4304A', 'MARICELA H ENRIQUEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4581109731', '', '', '', 3, '', '192.168.31.96', '2025-03-12', '2025-06-17', '2025-06-18', '260', 1),
(305, '20250625SW1HZ5305F', 'MARICELA MURO MACIAS', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.207', '2021-05-10', '2025-06-15', '2025-06-16', '260', 1),
(306, '20250625EI2IO2306N', 'MARIELA JACOBO SANCHEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.242', '2021-10-09', '2025-10-14', '2025-10-15', '260', 1),
(307, '20250625JX9RD5307K', 'MARINA JACOBO SANCHEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.113', '2020-09-09', '2025-09-14', '2025-09-15', '260', 1),
(308, '20250625CE8NU0308Z', 'MARIO ALBERTO SALAZAR RAMOS', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.33', '2021-11-04', '2025-11-09', '2025-11-10', '260', 1),
(309, '20250625ZZ3HB4309H', 'MARLEN HERRERA ESQUIVEL', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.132', '2019-02-04', '2025-06-09', '2025-06-10', '260', 1),
(310, '20250625QO5MZ7310G', 'MARTHA PATRICIA HERNANDEZ LOPEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922688488', '', '', '', 3, '', '192.168.31.248', '2023-06-02', '2025-06-19', '2025-06-20', '260', 1),
(311, '20250625BS8YZ6311Z', 'MAYDA ALEJANDRA MURO CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921077242', '', '', '', 3, '', '192.168.33.35', '2023-02-02', '2025-06-17', '2025-06-18', '260', 1),
(312, '20250625AA4GA3312Z', 'MAYELA GARCIA MURO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921166748', '', '', '', 3, '', '192.168.31.163', '2024-11-05', '2025-11-10', '2025-11-11', '260', 1),
(313, '20250625RA4TX9313B', 'MAYRA ADAME ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.114', '2020-02-06', '2025-06-11', '2025-06-12', '260', 1),
(314, '20250625TN0YG8314L', 'MARLEN SAUCEDO ROQUE', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4928701227', '', '', '', 3, '', '192.168.31.122', '2024-08-26', '2025-08-31', '2025-09-01', '260', 1),
(315, '20250625AB5QI3315E', 'MINERVA HERRERA CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.57', '2021-09-21', '2025-09-26', '2025-09-27', '260', 1),
(316, '20250625CA4BM0316B', 'MOISES MARTINEZ ZAMBRANO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.47', '2023-04-13', '2025-06-09', '2025-06-10', '260', 1),
(317, '20250625JY0KP2317L', 'MONICA HERRERA SALAZAR', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921762748', '', '', '', 3, '', '192.168.33.155', '2023-08-08', '2025-08-07', '2025-08-08', '260', 1),
(318, '20250625UC3HV1318Q', 'NANCY GONZALEZ ROQUE', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.252', '2020-01-03', '2025-06-08', '2025-06-09', '0', 1),
(319, '20250625OE4SX5319Y', 'NANCY LIZBETH JACOBO HERNANDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.134', '2019-05-21', '2025-06-26', '2025-06-27', '260', 1),
(320, '20250625UT5XK2320Q', 'NANCY YULIANA GARCIA JACOBO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.208', '2018-11-19', '2025-11-24', '2025-11-25', '260', 1),
(321, '20250625NS7SQ5321Q', 'OLGA LIDIA REVELES HERRERA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.191', '2020-04-20', '2025-06-25', '2025-06-26', '260', 1),
(322, '20250625QD5SZ2322E', 'OMAR HERRERA HERNANDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4928707402', '', '', '', 3, '', '192.168.31.91', '2025-02-17', '2025-06-22', '2025-06-23', '260', 1),
(323, '20250625VC3GR0323C', 'OMAR MARTINEZ MEDINA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.116', '2020-06-05', '2025-06-10', '2025-06-11', '260', 1),
(324, '20250625IH1LX6324Y', 'ORLANDO CASTRO HERNANDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.226', '2020-05-09', '2025-06-14', '2025-06-15', '260', 1),
(325, '20250625TO8AJ4325O', 'PATRICIA ARTEAGA ESQUIVEL', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922681376', '', '', '', 3, '', '192.168.31.102', '2024-04-20', '2025-06-25', '2025-06-26', '260', 1),
(326, '20250625XP6TY9326Q', 'PATRICIA SAUCEDO TORRES', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.143', '2020-05-26', '2025-07-01', '2025-07-02', '260', 1),
(327, '20250625JR0DA1327I', 'PAULINA HERRERA CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.118', '2018-11-22', '2025-11-27', '2025-11-28', '260', 1),
(328, '20250625KI3YK5328U', 'PEDRO GARCIA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.209', '2020-06-17', '2025-06-22', '2025-06-23', '260', 1),
(329, '20250625YF6CX9329Y', 'PRIMARIA JOSE MARIA MOELOS Y PAVON 1', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922032805', '', '', '', 3, '', '192.168.31.162', '2024-11-13', '2025-11-18', '2025-11-19', '260', 1),
(330, '20250625DI4ES6330O', 'PRIMARIA JOSE MARIA MOELOS Y PAVON 2', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4924938133', '', '', '', 3, '', '', '2025-01-09', '2025-06-14', '2025-06-15', '260', 1),
(331, '20250625LJ6AL2331Z', 'RAMIRO NIETO MURO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.120.', '2018-12-21', '2025-12-26', '2025-12-27', '260', 1),
(332, '20250625FT6GE8332H', 'RANCHO MACIAS', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 7, '', '192.168.31.154', '2023-02-21', '2025-06-25', '2025-06-26', '500', 1),
(333, '20250625CR5VT4333T', 'RAYMUNDO CARDONA CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921809421', '', '', '', 3, '', '192.168.31.230', '2023-01-10', '2025-07-01', '2025-07-02', '260', 1),
(334, '20250625AM6DX9334M', 'REGINA GARCIA HERRERA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922238131', '', '', '', 3, '', '192.168.31.94', '2025-03-04', '2025-06-09', '2025-06-10', '260', 1),
(335, '20250625AI5ES1335E', 'RENATA VERONICA JIMENEZ CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4581061249', '', '', '', 3, '', '192.168.33.91', '2023-03-01', '2025-06-06', '2025-06-07', '260', 1),
(336, '20250625MQ4NT5336U', 'REYES GERARDO ORTIZ RODRIGUEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4581162152', '', '', '', 3, '', '192.168.33.196', '2024-10-26', '2025-10-31', '2025-11-01', '260', 1),
(337, '20250625SE7YF6337O', 'RIGOBERTO HERRERA CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.121', '2019-11-13', '2025-11-18', '2025-11-19', '260', 1),
(338, '20250625SA3NY2338Q', 'ROCIO RODRIGUEZ RODRIGUEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.168', '2021-10-21', '2025-10-26', '2025-10-27', '260', 1),
(339, '20250625NR2HY5339B', 'RODRIGO JACOBO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.135', '2018-10-30', '2025-11-04', '2025-11-05', '260', 1),
(340, '20250625BT3KZ8340I', 'ROSALBA HERNANDEZ SALAZAR ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922885761', '', '', '', 3, '', '192.168.33.122', '2020-12-11', '2025-12-16', '2025-12-17', '260', 1),
(341, '20250625RA9QA6341X', 'ROSALBA HERNANDEZ SALAZAR (2)', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921070825', '', '', '', 3, '', '192.168.33.157', '2023-09-05', '2025-09-09', '2025-09-10', '260', 1),
(342, '20250625VJ6VU3342P', 'RUBY REVELES HERNANDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4497541041', '', '', '', 3, '', '192.168.31.250', '2023-04-04', '2025-06-09', '2025-06-10', '260', 1),
(343, '20250625TN8FI1343M', 'SALVADOR HERRERA MARQUEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.225', '2023-11-20', '2025-12-01', '2025-12-02', '260', 1),
(344, '20250625GN0GJ5344R', 'SAMUEL LOPEZ HERNANDEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922027893', '', '', '', 3, '', '192.168.31.106', '2024-05-13', '2025-06-18', '2025-06-19', '260', 1),
(345, '20250625UO8DW3345K', 'SANDRA HERNANDEZ GARCIA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.209', '2023-02-17', '2025-06-26', '2025-06-27', '260', 1),
(346, '20250625TZ2SG6346D', 'SARA MARTINEZ GARCIA  ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.123', '2019-01-10', '2025-06-15', '2025-06-16', '260', 1),
(347, '20250625DM9DN3347G', 'SARA MU?OZ CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.193', '2020-04-20', '2025-06-25', '2025-06-26', '260', 1),
(348, '20250625GJ8OH3348P', 'SERGIO ADRIAN DURAN SALAZAR', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.227', '2019-01-07', '2025-06-12', '2025-06-13', '260', 1),
(349, '20250625OG3DQ5349X', 'SERGIO JACOBO HERNANDEZ ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.67', '2022-12-30', '2025-06-04', '2025-06-05', '260', 1),
(350, '20250625VZ3XB4350G', 'SEVERO LOPEZ GARCIA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4581193949', '', '', '', 3, '', '192.168.31.216', '2023-09-07', '2025-09-25', '2025-09-26', '260', 1),
(351, '20250625FH8BS2351W', 'TANIA ESMERALDA IBARRA TAMAYO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921269431', '', '', '', 3, '', '192.168.31.97', '2025-03-13', '2025-06-18', '2025-06-19', '260', 1),
(352, '20250625FJ4QD2352H', 'TELESECUNDARIA JOSEFA ORTIZ DE DOMINGUEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921233438', '', '', '', 3, '', '192.168.33.87', '2022-06-09', '2025-06-14', '2025-06-15', '260', 1),
(353, '20250625QC8CC4353F', 'TERESA HERNANDEZ LOPEZ ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922690569', '', '', '', 3, '', '', '2024-06-08', '2025-06-13', '2025-06-14', '260', 1),
(354, '20250625XG8RQ0354Y', 'TOBIAS CASTRO ESQUIVEL', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4921265502', '', '', '', 3, '', '192.168.21.89', '2025-01-31', '2025-06-05', '2025-06-06', '260', 1),
(355, '20250625KD9HZ3355W', 'TORIBIO MURO CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4925595910', '', '', '', 3, '', '192.168.33.159', '2023-09-12', '2025-09-12', '2025-09-13', '260', 1),
(356, '20250625ML3MH9356A', 'TRINIDAD GUERRERO ESQUIVEL', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922921363', '', '', '', 3, '', '192.168.31.98', '2025-03-19', '2025-06-24', '2025-06-25', '260', 1),
(357, '20250625LU2XQ7357I', 'TRISTAN CHAVEZ CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4581196203', '', '', '', 3, '', '192.168.31.92', '2025-03-01', '2025-06-06', '2025-06-07', '260', 1),
(358, '20250625OZ7CQ2358L', 'VALERIA JACOBO SAUCEDO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.194', '2025-06-25', '2025-06-30', '2025-06-01', '260', 1),
(359, '20250625CY7LN6359Y', 'VANESSA JUDITH LOPEZ MURO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4928692822', '', '', '', 3, '', '192.168.31.225', '2023-09-29', '2025-09-14', '2025-09-15', '260', 1),
(360, '20250625ML4DO8360A', 'VERONICA HARO RODRIGUEZ', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4581151738', '', '', '', 3, '', '192.168.31.210', '2022-06-10', '2025-06-15', '2025-06-16', '260', 1),
(361, '20250625OW8ZW0361O', 'VIRIRIANA ESQUIVEL CASTRO', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4929055766', '', '', '', 3, '', '192.168.33.82', '2022-06-23', '2025-06-28', '2025-06-29', '260', 1),
(362, '20250625RI2BF6362D', 'YESENIA HERRERA ESQUIVEL', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4922457657', '', '', '', 3, '', '192.168.31.244', '2023-06-19', '2025-06-17', '2025-06-18', '260', 1),
(363, '20250625DQ3TG5363K', 'YOLANDA HERNANDEZ GARCIA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.31.211', '2019-02-06', '2025-06-11', '2025-06-12', '260', 1),
(364, '20250625NX9XM1364X', 'YOLANDA MARTINEZ GARCIA', '', '', '', 'PASO DE MENDEZ', 'GENARO CODINA', 'ZACATECAS', 98663, '4928925333', '', '', '', 3, '', '192.168.31.251', '2023-06-30', '2025-06-06', '2025-06-07', '260', 1),
(365, '20250625BJ0LA8365R', 'ADRIANA TREJO SOTO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921345502', '', '', '', 3, '', '192.168.33.145', '2023-12-22', '2025-12-30', '2025-12-31', '260', 1),
(366, '20250625XW1IO4366E', 'AGUSTIN JAIME RUIZ VELA', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921604478', '', '', '', 3, '', '192.168.33.76', '2020-07-13', '2025-07-18', '2025-07-19', '260', 1),
(367, '20250625ZE8BE9367L', 'ALEJANDRA VALDEZ FRIAS', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922042292', '', '', '', 3, '', '192.168.33.53', '2020-12-09', '2025-12-14', '2025-12-15', '260', 1),
(368, '20250625DP8EW1368S', 'ALEXANDER CASTRO CHAVEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922651083', '', '', '', 3, '', '192.168.33.46', '2021-09-01', '2025-09-06', '2025-09-07', '260', 1),
(369, '20250625TC2DK2369U', 'ALMA NIDIA SALINAS ESQUIVEL', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921762908', '', '', '', 3, '', '192.168.33.231', '2021-05-08', '2025-06-13', '2025-06-14', '260', 1),
(370, '20250625KJ6VV4370H', 'ANA MARIA ESQUIVEL', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.237', '2021-05-26', '2025-05-01', '2025-05-02', '260', 2),
(371, '20250625MW1ER3371G', 'ANGELICA MARIA MARES MU?OZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922380587', '', '', '', 3, '', '192.168.33.73', '2020-05-18', '2025-06-23', '2025-06-24', '200', 1),
(372, '20250625OV1HN7372I', 'ANTONIO DE LA RIVA GARCIA', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921137174', '', '', '', 3, '', '192.168.33.75', '2020-07-13', '2025-07-18', '2025-07-19', '260', 1),
(373, '20250625MP8WE7373V', 'ARNULFO DELGADO MARTINEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921065863', '', '', '', 3, '', '192.168.33.245', '2021-06-28', '2025-07-03', '2025-07-04', '260', 1),
(374, '20250625JN5RI1374A', 'AURORA MARTEL VILLALOBOS', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922623792', '', '', '', 3, '', '192.168.33.84', '2020-08-20', '2025-08-25', '2025-08-26', '260', 1),
(375, '20250625BT2JJ6375K', 'CAROLINA DE LA CRUZ DELGADO ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922889990', '', '', '', 3, '', '192.168.33.223', '2023-06-02', '2025-06-06', '2025-06-07', '260', 1),
(376, '20250625WL0AS5376X', 'CESAR ALEJANDRO ARENAS MARTINEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4581106833', '', '', '', 3, '', '192.168.33.158', '2023-09-05', '2025-09-13', '2025-09-14', '260', 1),
(377, '20250625MR5VR6377V', 'DANIELA GARCIA MU?OZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922658074', '', '', '', 3, '', '192.168.33.99', '2020-09-10', '2025-09-15', '2025-09-16', '260', 1),
(378, '20250625CL1MS3378M', 'DIANA LAURA SANCHEZ DOMINGUEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922008135', '', '', '', 3, '', '192.168.33.187', '2022-03-23', '2025-06-28', '2025-06-29', '260', 1),
(379, '20250625EN9SY2379W', 'DIEGO EMANUEL MARTINEZ MONTALVO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921260426', '', '', '', 3, '', '192.168.33.203', '2021-01-11', '2025-06-16', '2025-06-17', '260', 1),
(380, '20250625UY8KR7380J', 'EDUARDO RUIZ GUARDADO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922447788', '', '', '', 3, '', '192.168.33.117', '2023-03-29', '2025-06-03', '2025-06-04', '260', 1),
(381, '20250625AH8RC8381I', 'ELADIO DELGADO MARTELL COMPRO APARATOS)', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922889990', '', '', '', 3, '', '192.168.33.215', '2023-10-07', '2025-10-25', '2025-10-26', '260', 1),
(382, '20250625TC6FB1382C', 'ELEAZAR GARCIA ESCALERA', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921126034', '', '', '', 3, '', '192.168.33.124', '2021-09-08', '2025-05-13', '2025-05-14', '260', 2),
(383, '20250625EO0JB8383X', 'ELIZABETH DE LA RIVA PEREZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921799170', '', '', '', 3, '', '192.168.33.219', '2022-12-01', '2025-12-06', '2025-12-07', '260', 1),
(384, '20250625VK3IA4384H', 'ELOISA MURO RUIZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.226', '2021-03-24', '2025-06-29', '2025-06-30', '260', 1),
(385, '20250625MJ9MG3385B', 'ELVIA LOPEZ CHAVEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921321726', '', '', '', 3, '', '192.168.33.92', '2022-07-05', '2025-07-10', '2025-07-11', '260', 1),
(386, '20250625XP0DN7386W', 'ELVIRA LETICIA MARTINEZ LOMELI', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922677565', '', '', '', 3, '', '192.168.33.185', '2022-08-05', '2025-08-10', '2025-08-11', '260', 1),
(387, '20250625MU8AO4387Z', 'ENEDINA REYES MARTINEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922245004', '', '', '', 3, '', '192.168.33.247', '2022-01-13', '2025-06-18', '2025-06-19', '260', 1),
(388, '20250625BS5CY3388G', 'ERENDIDA GALLEGOS MARTINEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921053343', '', '', '', 3, '', '192.168.33.234', '2022-04-22', '2025-06-27', '2025-06-28', '260', 1),
(389, '20250625KB9EA4389R', 'ESTEBAN DOMINGUEZ DELGADO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922435534', '', '', '', 3, '', '192.168.33.23', '2022-08-19', '2025-08-24', '2025-08-25', '260', 1),
(390, '20250625SI4SB4390P', 'EVELIA DE LA CRUZ REYES', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.25', '2021-07-15', '2025-07-20', '2025-07-21', '260', 1),
(391, '20250625KJ9JQ6391O', 'FEDERICO RUIZ JIMENEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921299025', '', '', '', 3, '', '192.168.33.98', '2020-09-04', '2025-09-09', '2025-09-10', '260', 1),
(392, '20250625RE5RY4392N', 'FRANCISCA ACOSTA PEREZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922646464', '', '', '', 3, '', '192.168.33.214', '2021-01-12', '2025-06-17', '2025-06-18', '260', 1),
(393, '20250625WM0PQ8393D', 'FRANCISCO JAVIER ESQUIVEL MARTELL', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '83223557416', '', '', '', 3, '', '192.168.33.39', '2022-05-18', '2025-06-23', '2025-06-24', '260', 1),
(394, '20250625BA1ZN4394G', 'GABRIEL LOPEZ ACOSTA', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4928923563', '', '', '', 3, '', '192.168.33.77', '2020-08-19', '2025-08-24', '2025-08-25', '260', 1),
(395, '20250625EN7CW7395L', 'GISELA CASTRO RAMIREZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922278261', '', '', '', 3, '', '192.168.33.63', '2020-04-03', '2025-06-08', '2025-06-09', '260', 1),
(396, '20250625VZ3YO6396O', 'GLORIA MIREYA MARTINEZ G.', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921604163', '', '', '', 3, '', '192.168.33.244', '2021-11-01', '2025-11-06', '2025-11-07', '260', 1),
(397, '20250625HG1VV5397B', 'GRACIELA GARCIA REYES', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4928932245', '', '', '', 3, '', '192.168.33.66', '2020-04-23', '2025-06-28', '2025-06-29', '260', 1),
(398, '20250625JE5LY8398W', 'GRISELDA FRIAS SANTAMARIA', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921725037', '', '', '', 4, '', '192.168.33.194', '2023-10-13', '2025-10-09', '2025-10-10', '460', 1),
(399, '20250625OB6PH7399U', 'GUILLERMO MONTALVO DOMINGUEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '16303301801', '', '', '', 3, '', '192.168.33.160.', '2023-09-13', '2025-09-17', '2025-09-18', '260', 1),
(400, '20250625AJ6EK2400W', 'HERMELINDA CASTRO CASTRO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921712874', '', '', '', 3, '', '192.168.33.195', '2023-10-18', '2025-10-23', '2025-10-24', '260', 1),
(401, '20250625MS7HG8401K', 'HIPOLITO GARCIA MARTELL', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.191', '2020-11-03', '2025-11-08', '2025-11-09', '260', 1),
(402, '20250625TI7HG6402O', 'IVETTE GARCIA VILLALOBOS', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922122424', '', '', '', 3, '', '192.168.33.68', '2020-05-06', '2025-06-11', '2025-06-12', '260', 1),
(403, '20250625HC9GC1403A', 'JAIME LEON RUIZ MARTINEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.51', '2019-11-19', '2025-11-24', '2025-11-25', '260', 1),
(404, '20250625BH0ID7404I', 'JANETH DELGADO DE LA RIVA', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922280896', '', '', '', 3, '', '192.168.33.97', '2020-09-04', '2025-09-09', '2025-09-10', '260', 1),
(405, '20250625LO1AF8405D', 'JAVIER VALDEZ ESPINO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922247821', '', '', '', 3, '', '192.168.33.29', '2023-01-25', '2025-06-18', '2025-06-19', '260', 1),
(406, '20250625OR7FJ8406K', 'JAZMIN REYES MORENO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921714261', '', '', '', 3, '', '192.168.33.54', '2020-12-10', '2025-12-15', '2025-12-16', '260', 1),
(407, '20250625JU5KO1407A', 'JORGE RUIZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.182', '2021-10-26', '2025-10-31', '2025-11-01', '260', 1),
(408, '20250625PK5TY5408B', 'JOSE ADAN ACOSTA MARTINEZ', '', '', '', 'MONTEGRANDE', 'GENARO CODINA', 'ZACATECAS', 98663, '4921268930', '', '', '', 3, '', '192.168.33.201', '2021-01-12', '2025-06-17', '2025-06-18', '260', 1),
(409, '20250625SF5KJ7409M', 'JOSE CARLOS GARCIA TORRES', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922245004', '', '', '', 3, '', '192.168.33.248', '2022-02-21', '2025-06-26', '2025-06-27', '260', 1),
(410, '20250625YS1DM9410P', 'JOSE FEDERICO GARCIA TORRES', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921461888', '', '', '', 3, '', '192.168.33.69', '2020-05-06', '2025-06-11', '2025-06-12', '260', 1),
(411, '20250625WQ2QB5411T', 'JOSE GUADALUPE VILLALOBOS MARTINEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922035507', '', '', '', 3, '', '192.168.33.74', '2020-06-03', '2025-06-08', '2025-06-09', '260', 1),
(412, '20250625SH2LQ5412Y', 'JOSE LUIS VILLALOBOS HERNNADEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '33.27', '', '', '', 3, '', '192.168.33.71', '2020-05-06', '2025-06-11', '2025-06-12', '260', 1),
(413, '20250625DC0CX8413A', 'JOSE MANUEL VELA MARTINEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922899733', '', '', '', 3, '', '192.168.33.30', '2023-01-27', '2025-06-15', '2025-06-16', '260', 1),
(414, '20250625FB8GG2414B', 'JOSE RUIZ VELA', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.65', '2020-04-23', '2025-06-28', '2025-06-29', '260', 1),
(415, '20250625WO1NQ2415J', 'JUAN JOSE MONTALVO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921035781', '', '', '', 3, '', '192.168.33.59', '2020-01-02', '2025-06-07', '2025-06-08', '260', 1),
(416, '20250625EN0XB9416M', 'JUAN MIGUEL MARTELL JIMENEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4929099052', '', '', '', 3, '', '192.168.33.38', '2021-08-10', '2025-08-15', '2025-08-16', '260', 1),
(417, '20250625UW4AD2417H', 'JUAN PABLO DOMINGUEZ CASTRO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921270608', '', '', '', 3, '', '192.168.33.36', '2023-02-02', '2025-06-07', '2025-06-08', '260', 1),
(418, '20250625BC3RH3418C', 'LEISDY YOANA JIMENEZ DELGADO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921245507', '', '', '', 3, '', '192.168.33.55', '2020-12-12', '2025-05-17', '2025-05-18', '260', 2),
(419, '20250625IO8MO2419Y', 'LETICIA MARTINEZ RUIZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '16304158690', '', '', '', 3, '', '192.168.33.198', '2021-01-11', '2025-06-16', '2025-06-17', '260', 1),
(420, '20250625PK1FU8420W', 'LUIS HUMBERTO CASTRO DE LA CRUZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '13319806912', '', '', '', 3, '', '192.168.33.115', '2023-06-28', '2025-05-02', '2025-05-03', '260', 2),
(421, '20250625WC6GY8421Y', 'LUIS RUBIO HERNANSAEZ ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921372152', '', '', '', 3, '', '192.168.33.95', '2022-08-11', '2025-08-16', '2025-08-17', '260', 1),
(422, '20250625FL6EX7422U', 'LUZ MARIA SAUCEDO TORRES', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4925830207', '', '', '', 3, '', '192.168.33.25', '2022-12-26', '2025-12-31', '2026-01-01', '260', 1),
(423, '20250625HC4TG9423X', 'MA DE LOS ANGELES CASTRO CHAVEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921454728', '', '', '', 3, '', '192.168.33.70.', '2022-02-26', '2025-07-01', '2025-07-02', '260', 1),
(424, '20250625UA8JV3424L', 'MA DEL ROCIO ESQUIVEL CASTRO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4924920939', '', '', '', 3, '', '192.168.33.218', '2021-02-18', '2025-06-23', '2025-06-24', '260', 1),
(425, '20250625XG0NZ8425Q', 'MA HERMELINDA GARCIA TORRES', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921092499', '', '', '', 3, '', '192.168.33.72', '2020-05-18', '2025-06-23', '2025-06-24', '260', 1),
(426, '20250625HO8LC6426H', 'MA SOCORRO MURO RUIZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921800630', '', '', '', 3, '', '192.168.33.48', '2021-09-14', '2025-09-19', '2025-09-20', '260', 1),
(427, '20250625GA2ZN5427A', 'MARGARITA VILLALOBOS HERNANDEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922922754', '', '', '', 3, '', '192.168.33.37', '2023-02-03', '2025-06-08', '2025-06-09', '260', 1),
(428, '20250625WL7EH2428D', 'MARIA DE JESUS ALVARADO GUZMAN ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921712248', '', '', '', 3, '', '192.168.33.169', '2023-03-14', '2025-06-19', '2025-06-20', '260', 1),
(429, '20250625CT2YS1429E', 'MARIA DE LA LUZ ESQUIVEL VENEGAS', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.50.', '2025-06-25', '2025-06-30', '2025-06-01', '260', 1),
(430, '20250625IK1UF7430C', 'MARIA DE LOS ANGELES HERNANDEZ HERNANDEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922450626', '', '', '', 3, '', '', '2022-09-22', '2025-09-27', '2025-09-28', '260', 1),
(431, '20250625MR1EH8431J', 'MARIA GUADALUPE DELGADO CASTRO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.200.', '2021-01-12', '2025-05-17', '2025-05-18', '260', 2),
(432, '20250625ST2EQ3432T', 'MARIA GUADALUPE MARTINEZ JIMENEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4925938156', '', '', '', 3, '', '192.168.33.236', '2020-05-26', '2025-07-01', '2025-07-02', '260', 1),
(433, '20250625OA9SR8433U', 'MARIA HERRERA CALDERA', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4924929357', '', '', '', 3, '', '192.168.33.183', '2021-10-22', '2025-10-27', '2025-10-28', '260', 1),
(434, '20250625TY0UJ6434O', 'MARIA IMELDA RUIZ SAUCEDO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921192358', '', '', '', 3, '', '192.168.33.165', '2020-10-14', '2025-10-19', '2025-10-20', '260', 1),
(435, '20250625RC3LC7435M', 'MARIA SALETA DELGADO CASTRO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4929009458', '', '', '', 3, '', '192.168.33.206', '2023-10-11', '2025-10-19', '2025-10-20', '260', 1),
(436, '20250625VU3CR3436K', 'MARIBEL GARCIA REYES', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4928939867', '', '', '', 3, '', '', '2022-03-24', '2025-06-29', '2025-06-30', '260', 1),
(437, '20250625KV5AJ6437A', 'MARIELA MONTALVO CASTRO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922014277', '', '', '', 3, '', '192.168.33.56', '2020-12-12', '2025-12-17', '2025-12-18', '260', 1),
(438, '20250625FG2JU4438R', 'MARLEN DELGADO MARTINEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921975507', '', '', '', 3, '', '192.168.33.192', '2021-12-24', '2025-12-29', '2025-12-30', '260', 1),
(439, '20250625YA3GG9439O', 'MARTHA ARACELI HERNANDEZ ORTIZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921442864', '', '', '', 3, '', '192.168.33.243', '2021-06-25', '2025-06-30', '2025-06-01', '260', 1),
(440, '20250625QW9XS0440D', 'NOE CASTRO GARCIA', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.164', '2020-10-07', '2025-10-12', '2025-10-13', '260', 1),
(441, '20250625ZT7YK5441E', 'OLIVIA GARCIA ACOSTA', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921048069', '', '', '', 3, '', '192.168.33.103', '2021-01-11', '2025-06-16', '2025-06-17', '260', 1),
(442, '20250625GH8HB6442D', 'OMERO ESQUIVEL', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.207', '2021-01-25', '2025-06-30', '2025-06-01', '260', 1),
(443, '20250625HP3WY8443H', 'OSCAR SANCHEZ DELGADO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.19', '2020-11-03', '2025-11-08', '2025-11-09', '260', 1),
(444, '20250625SY0IQ3444P', 'OSVALDO JIMENEZ DE LA CRUZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921435100', '', '', '', 3, '', '192.168.33.217', '2022-09-23', '2025-09-28', '2025-09-29', '260', 1),
(445, '20250625OL1QV1445P', 'PEDRO DELGADO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922682597', '', '', '', 3, '', '192.168.33.242', '2021-01-24', '2025-06-29', '2025-06-30', '260', 1),
(446, '20250625FW7WV8446Z', 'PEDRO IVAN HERNANDEZ HERRERA', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.199', '2021-10-26', '2025-10-31', '2025-11-01', '260', 1),
(447, '20250625SC1CM9447C', 'PEDRO MONTALVO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921468214', '', '', '', 3, '', '192.168.33.62', '2020-04-02', '2025-06-07', '2025-06-08', '260', 1),
(448, '20250625OA6EC0448D', 'PRIMARIA FRANCISCO I ADERO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4581196203', '', '', '', 3, '', '192.168.33.163', '2022-11-09', '2025-05-14', '2025-05-15', '260', 2),
(449, '20250625VL2BI4449A', 'RAFAEL JIMENEZ DE LA CRUZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921447057', '', '', '', 3, '', '192.168.33.44', '2021-08-26', '2025-08-31', '2025-09-01', '260', 1),
(450, '20250625PM2MT1450U', 'RAFAEL MARTINEZ MARES', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922114873', '', '', '', 3, '', '192.168.33.61', '2020-01-08', '2025-06-13', '2025-06-14', '260', 1),
(451, '20250625PE3AK6451I', 'RAUL MONTALVO BERNAL', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921628824', '', '', '', 3, '', '192.168.33.80', '2022-06-23', '2025-06-28', '2025-06-29', '260', 1),
(452, '20250625TY0CB8452Z', 'REGINALDO RUIZ GUARDADO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921341326', '', '', '', 3, '', '192.168.33.239', '2021-06-05', '2025-06-10', '2025-06-11', '260', 1),
(453, '20250625QY9OV9453H', 'RITA TORRES REYES', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4961351395', '', '', '', 3, '', '192.168.33.253', '2021-07-29', '2025-08-03', '2025-08-04', '260', 1),
(454, '20250625XK8YF0454B', 'ROSA ADRIANA SAUCEDO DELGADO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921055524', '', '', '', 3, '', '192.168.33.212', '2023-09-15', '2025-09-07', '2025-09-08', '260', 1),
(455, '20250625UM9GL1455I', 'RUBICELI DE LA RIVA', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921705804', '', '', '', 3, '', '192.168.33.64', '2020-04-06', '2025-06-11', '2025-06-12', '260', 1),
(456, '20250625PV3HG8456Y', 'SANDRA INES PEREZ DE LA ROSA', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922946056', '', '', '', 3, '', '192.168.33.227', '2021-04-14', '2025-06-19', '2025-06-20', '260', 1);
INSERT INTO `clientes` (`id`, `folio`, `nombre`, `domicilio`, `calle`, `colonia`, `comunidad`, `municipio`, `estado`, `cp`, `telefono`, `referencias`, `identificacion`, `comprobante`, `servicio`, `antena`, `direccionip`, `fecha_contrato`, `fecha_limite`, `fecha_corte`, `cuota`, `estatus`) VALUES
(457, '20250625AH8VZ6457N', 'TALA DELGADO MARTINEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.220.', '2023-05-24', '2025-06-13', '2025-06-14', '260', 1),
(458, '20250625KO8CZ4458Q', 'VICTOR MORENO VILLALOBOS', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922518348', '', '', '', 3, '', '192.168.33.168', '2022-04-25', '2025-06-30', '2025-06-01', '260', 1),
(459, '20250625PZ7XP7459X', 'YOMIRA DEL CARMEN TORRES LOPEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921267487', '', '', '', 3, '', '192.168.33.241', '2025-06-25', '2025-06-30', '2025-06-01', '260', 1),
(460, '20250625RT8PS0460O', 'GABRIELA REYES PEREA', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922254527', '', '', '', 3, '', '192.168.33.81', '2023-01-04', '2025-06-09', '2025-06-10', '260', 1),
(461, '20250625OT3OF7461I', 'OLIVIA VALLE HERNANDEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4924928717', '', '', '', 3, '', '192.168.33.229', '2024-01-12', '2025-06-17', '2025-06-18', '260', 1),
(462, '20250625QC8GA1462M', 'MARIA FERNANDA JIMENEZ RODARTE', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '1921035781', '', '', '', 3, '', '192.168.33.232', '2024-01-26', '2025-05-01', '2025-05-02', '260', 2),
(463, '20250625BZ5JJ6463O', 'JOSE MIGUEL DE LA CRUZ GARCIA', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921592566', '', '', '', 3, '', '192.168.33.88', '2024-02-27', '2025-05-05', '2025-05-06', '260', 2),
(464, '20250625CY2VS6464P', 'IVETTE GARCIA VILLALOBOS', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4581081535', '', '', '', 3, '', '192.168.33.186', '2020-10-14', '2025-10-19', '2025-10-20', '260', 1),
(465, '20250625AX5TP8465S', 'JESUS CASTRO GARCIA', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921318453', '', '', '', 3, '', '192.168.33.208', '2024-04-25', '2025-06-30', '2025-06-01', '260', 1),
(466, '20250625JH6LH6466B', 'ANALENI CASTRO SANCHEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922254603', '', '', '', 3, '', '192.168.33.119', '2024-05-11', '2025-06-16', '2025-06-17', '260', 1),
(467, '20250625MH0VC9467X', 'ANACLETO MARTINEZ JIMENEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.58', '2024-06-06', '2025-06-11', '2025-06-12', '260', 1),
(468, '20250625FD0HA3468M', 'YOLANDA LAZZERONI', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '3315751828', '', '', '', 3, '', '192.168.33.132', '2024-07-03', '2025-07-08', '2025-07-09', '260', 1),
(469, '20250625VR6IN6469V', 'ESTHER GARCIA OROZCO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4928691744', '', '', '', 3, '', '192.168.33.4', '2024-08-29', '2025-09-03', '2025-09-04', '260', 1),
(470, '20250625OM6AX6470Q', 'JESUS DE LA CRUZ REYES', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '6302631802', '', '', '', 3, '', '192.168.33.43', '2024-09-07', '2025-09-12', '2025-09-13', '260', 1),
(471, '20250625FZ4FR3471K', 'VICENTA ACOSTA ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.3342', '2024-09-07', '2025-09-12', '2025-09-13', '260', 1),
(472, '20250625AP0EZ9472E', 'HERMELINDA CASTRO TORRES', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.188', '2024-10-12', '2025-10-17', '2025-10-18', '260', 1),
(473, '20250625LA9QD4473M', 'PASCUAL DE LA CRUZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921321413', '', '', '', 3, '', '192.168.33.197', '2024-10-25', '2025-10-30', '2025-10-31', '260', 1),
(474, '20250625HY5NY9474N', 'CCA SANTA INES', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '', '', '', '', 3, '', '192.168.33.94', '2024-11-27', '2025-12-02', '2025-12-03', '260', 1),
(475, '20250625DQ1FX7475I', 'VIRIDIANA MORALES CASTRO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921160518', '', '', '', 3, '', '192.168.33.105', '2025-02-26', '2025-07-01', '2025-07-02', '260', 1),
(476, '20250625SZ4GW5476E', 'MARIA DE LA LUZ MARTINEZ ESPINO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921264303', '', '', '', 3, '', '192.168.33.154', '2025-03-03', '2025-06-08', '2025-06-09', '260', 1),
(477, '20250625GF4KP2477Z', 'MA CLEOTILDE MU?OZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '49210780.43', '', '', '', 3, '', '192.168.33.153', '2025-03-03', '2025-06-08', '2025-06-09', '260', 1),
(478, '20250625HB6OI8478S', 'ELVIA CASTRO MARTINEZ', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4922899078', '', '', '', 3, '', '192.168.33.146', '2025-03-27', '2025-06-01', '2025-06-02', '260', 1),
(479, '20250625JC4FT5479T', 'NARY CRUZ DOMINGUEZ CASTRO', '', '', '', 'SANTA INES', 'GENARO CODINA', 'ZACATECAS', 98663, '4921712874', '', '', '', 3, '', '192.168.33.216', '2025-05-07', '2025-06-12', '2025-06-13', '260', 1),
(480, '20250625AS5AV2480Y', 'AMPARO DAVILA TORRES', '', '', '', 'SAN FERNANDO', 'GENARO CODINA', 'ZACATECAS', 98667, '4922429621', '', '', '', 1, '', '192.168.28.53', '2021-06-04', '2025-06-09', '2025-06-10', '270', 1),
(481, '20250625QF2DC3481P', 'ANGELICA ACOSTA MURO', '', '', '', 'SALTO PRIETO', 'GENARO CODINA', 'ZACATECAS', 98667, '4922242954', '', '', '', 1, '', '192.168.28.126', '2022-06-29', '2025-07-04', '2025-07-05', '270', 1),
(482, '20250625EO3SS6482W', 'ANTONIO HERRERA HINOJOSA', '', '', '', 'SALTO PRIETO', 'GENARO CODINA', 'ZACATECAS', 98667, '4921808699', '', '', '', 1, '', '192.168.28.138', '2023-09-22', '2025-10-01', '2025-10-02', '270', 1),
(483, '20250625RC2AM7483U', 'ANTONIO HERRERA JACOBO', '', '', '', 'SALTO PRIETO', 'GENARO CODINA', 'ZACATECAS', 98667, '4921716211', '', '', '', 1, '', '192.168.28.65', '2022-05-05', '2025-06-10', '2025-06-11', '270', 1),
(484, '20250625YM7ZH1484X', 'AURORA MANDUJANO JACOBO', '', '', '', 'SALTO PRIETO', 'GENARO CODINA', 'ZACATECAS', 98667, '4581366623', '', '', '', 1, '', '192.168.28.6', '2021-10-06', '2025-10-11', '2025-10-12', '270', 1),
(485, '20250625BM8HK8485D', 'ELSA MARGARITA CASTRO MORALES', '', '', '', 'SAN FERNANDO', 'GENARO CODINA', 'ZACATECAS', 98667, '4922455905', '', '', '', 1, '', '192.168.28.54', '2021-06-04', '2025-06-09', '2025-06-10', '270', 1),
(486, '20250625MF9DX6486G', 'ERICK RAMIREZ SANCHEZ', '', '', '', 'SAN FERNANDO', 'GENARO CODINA', 'ZACATECAS', 98667, '4921047250', '', '', '', 1, '', '192.168.28.62', '2023-06-09', '2025-06-12', '2025-06-13', '270', 1),
(487, '20250625HM4JH8487Z', 'FERNANDO HERRERA JACOBO', '', '', '', 'SALTO PRIETO', 'GENARO CODINA', 'ZACATECAS', 98667, '4922023977', '', '', '', 1, '', '192.168.28.139', '2024-05-16', '2025-06-21', '2025-06-22', '270', 1),
(488, '20250625KA3VL0488S', 'FRANCISCO HERRERA HINOJOSA', '', '', '', 'SALTO PRIETO', 'GENARO CODINA', 'ZACATECAS', 98667, '4922880634', '', '', '', 6, '', '192.168.28.11', '2021-06-03', '2025-06-08', '2025-06-09', '220', 1),
(489, '20250625ED9JS1489I', 'IRMA ACOSTA RUIZ', '', '', '', 'SAN FERNANDO', 'GENARO CODINA', 'ZACATECAS', 98667, '492-795-4849', '', '', '', 1, '', '192.168.28.55', '2021-06-04', '2025-06-09', '2025-06-10', '270', 1),
(490, '20250625PP6JV8490S', 'JOEL EZEQUIEL ORTIZ NU?EZ', '', '', '', 'SAN FERNANDO', 'GENARO CODINA', 'ZACATECAS', 98667, '492-927-1860', '', '', '', 1, '', '192.168.28.52', '2021-06-04', '2025-06-09', '2025-06-10', '270', 1),
(491, '20250625PS1RZ4491P', 'JUAN PABLO BENITEZ HERNANDEZ', '', '', '', 'SAN FERNANDO', 'GENARO CODINA', 'ZACATECAS', 98667, '492-243-3059', '', '', '', 1, '', '192.168.28.51', '2021-06-04', '2025-06-09', '2025-06-10', '270', 1),
(492, '20250625WJ7PA0492V', 'KENYA LIBERTAD REYES MEDELLIN', '', '', '', 'SAN FERNANDO', 'GENARO CODINA', 'ZACATECAS', 98667, '4929491238', '', '', '', 1, '', '192.168.28.136', '2022-11-03', '2025-11-08', '2025-11-09', '270', 1),
(493, '20250625PC1DQ7493W', 'LUIS HERNANDEZ HERNANDEZ', '', '', '', 'SAN FERNANDO', 'GENARO CODINA', 'ZACATECAS', 98667, '4922550597', '', '', '', 1, '', '192.168.28.58', '2023-06-05', '2025-06-14', '2025-06-15', '270', 1),
(494, '20250625EA9JM1494I', 'MANUEL DE JESUS HERNANDEZ HERNANDEZ', '', '', '', 'SAN FERNANDO', 'GENARO CODINA', 'ZACATECAS', 98667, '4921610778', '', '', '', 1, '', '192.168.28.14', '2023-01-03', '2025-06-21', '2025-06-22', '270', 1),
(495, '20250625OK1MF1495Y', 'MARGARITA HERNANDEZ MANDUJANO', '', '', '', 'SAN FERNANDO', 'GENARO CODINA', 'ZACATECAS', 98667, '4921303541', '', '', '', 1, '', '192.168.28.122', '2022-04-12', '2025-06-17', '2025-06-18', '270', 1),
(496, '20250625LF0MD5496C', 'MARIA DEL ROSARIO MARTELL MONTALVO', '', '', '', 'SAN FERNANDO', 'GENARO CODINA', 'ZACATECAS', 98667, '492-180-4711', '', '', '', 1, '', '192.168.28.12', '2021-06-03', '2025-06-08', '2025-06-09', '270', 1),
(497, '20250625QX8IN1497O', 'MARIA GABRIELA ACOSTA BENITES', '', '', '', 'SAN FERNANDO', 'GENARO CODINA', 'ZACATECAS', 98667, '492-137-077', '', '', '', 1, '', '192.168.28.56', '2021-06-04', '2025-06-09', '2025-06-10', '270', 1),
(498, '20250625SQ3KS9498N', 'MARIA TERESA ESQUIVEL HERNANDEZ', '', '', '', 'SALTO PRIETO', 'GENARO CODINA', 'ZACATECAS', 98667, '492-265-0502', '', '', '', 1, '', '192.168.28.61', '2021-10-06', '2025-10-11', '2025-10-12', '270', 1),
(499, '20250625MJ2XU5499Z', 'MARIANA GUERRERO HINOJOSA', '', '', '', 'SAN FERNANDO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.28.142', '2024-04-03', '2025-06-08', '2025-06-09', '270', 1),
(500, '20250625VO2MV4500Y', 'MIGUEL ANGEL HERNANDEZ CASTRO', '', '', '', 'SAN FERNANDO', 'GENARO CODINA', 'ZACATECAS', 98667, '492-593-5089', '', '', '', 1, '', '192.168.28.83', '2022-02-05', '2025-06-10', '2025-06-11', '270', 1),
(501, '20250625YR6KZ7501R', 'PATRICIA ACOSTA FRIAS', '', '', '', 'SALTO PRIETO', 'GENARO CODINA', 'ZACATECAS', 98667, '492-173-6246', '', '', '', 1, '', '192.168.28.59', '2021-06-04', '2025-06-09', '2025-06-10', '270', 1),
(502, '20250625IF1FS3502R', 'TERESA JACOBO RODRIGUEZ', '', '', '', 'SALTO PRIETO', 'GENARO CODINA', 'ZACATECAS', 98667, '4921193254', '', '', '', 1, '', '192.168.28.66', '2022-05-05', '2025-06-10', '2025-06-11', '270', 1),
(503, '20250625QK6LR0503J', 'ANA MERCEDES DEL MURO VILLAGRANA', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '4921075463', '', '', '', 5, '', '192.168.26.57', '2024-05-01', '2025-06-06', '2025-06-07', '300', 1),
(504, '20250625GR5DH8504G', 'JULIA MONTALVO VILLAGRANA', '', '', '', 'DELGADILLO', 'GENARO CODINA', 'ZACATECAS', 98670, '4922194376', '', '', '', 5, '', '192.168.26.94', '2025-05-01', '2025-06-06', '2025-06-07', '300', 1),
(505, '20250625HR4WM4505H', 'ANTONIO CARRILLO ESPINO', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '4929098222', '', '', '', 5, '', '192.168.26.56', '2024-05-01', '2025-06-06', '2025-06-07', '300', 1),
(506, '20250625EI2VP2506P', 'EDUARDO DEL MURO', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '4921204270', '', '', '', 5, '', '', '2024-04-30', '2025-06-04', '2025-06-05', '300', 1),
(507, '20250625BH3IA8507B', 'ELVIA VILLAGRANA CARRILLO', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 5, '', '192.168.26.51', '2025-06-25', '2025-06-30', '2025-06-01', '300', 1),
(508, '20250625IN0FF2508V', 'EPIFANIA HINOJOSA MORALES', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 5, '', '192.168.26.75', '2025-06-25', '2025-06-30', '2025-06-01', '300', 1),
(509, '20250625YZ1JA2509F', 'ESTHER ESCARE?O CARRILLO', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '4922237788', '', '', '', 5, '', '192.168.26.55', '2024-05-01', '2025-06-06', '2025-06-07', '300', 1),
(510, '20250625ZG1OJ2510B', 'FLORENCIA CARRILLO DEL MURO', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 5, '', '192.168.26.74', '2025-06-25', '2025-06-30', '2025-06-01', '300', 1),
(511, '20250625FQ9LK6511W', 'GONZALO CARRILLO SAUCEDO', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '4922561144', '', '', '', 5, '', '192.168.26.54', '2024-05-01', '2025-06-06', '2025-06-07', '300', 1),
(512, '20250625CM3ZN6512E', 'GUADALUPE DEL MURO', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 5, '', '', '2025-06-25', '2025-06-30', '2025-06-01', '300', 1),
(513, '20250625HI9CG1513V', 'JORGE ROSALES MONTALVO', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 5, '', '192.168.26.59', '2025-06-25', '2025-06-30', '2025-06-01', '300', 1),
(514, '20250625PB5YO9514M', 'JOSE ISRAEL DEL MURO', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '4921075508', '', '', '', 5, '', '', '2024-05-07', '2025-06-12', '2025-06-13', '300', 1),
(515, '20250625BB7AI3515G', 'JOSE PAZ CARRILLO ESCARE?O', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '4949432628', '', '', '', 5, '', '192.168.26.71', '2024-05-02', '2025-06-07', '2025-06-08', '300', 1),
(516, '20250625YV5NU5516Q', 'MARIA DE LOURDES DE LOERA CARROLLO', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '4922449804', '', '', '', 5, '', '192.168.26.72', '2024-05-02', '2025-06-07', '2025-06-08', '300', 1),
(517, '20250625JL5AS8517V', 'MA DEL ROSARIO VILLAGRANA', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 5, '', '192.168.26.63', '2025-06-25', '2025-06-30', '2025-06-01', '300', 1),
(518, '20250625KL0TK6518B', 'MAGDALENA HINOJOSA', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '4922170588', '', '', '', 5, '', '192.168.26.52', '2024-05-01', '2025-06-06', '2025-06-07', '300', 1),
(519, '20250625NS8HF4519V', 'MANUELA CARRILLO PI?O', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 5, '', '192.168.26.73', '2025-06-25', '2025-06-30', '2025-06-01', '300', 1),
(520, '20250625WS0UQ0520T', 'MARCOS ALEJANDRO VILLAGRANA MONTALVO', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '4924961103', '', '', '', 5, '', '192.168.26.76', '2024-05-07', '2025-06-12', '2025-06-13', '300', 1),
(521, '20250625ZC7ZQ9521H', 'ROSENDO VILLAGRANA TRONCOSO', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 5, '', '192.168.26.61', '2025-06-25', '2025-06-30', '2025-06-01', '300', 1),
(522, '20250625GT6WZ1522J', 'TRANQUILINO CARRILLO', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 5, '', '192.168.26.64', '2025-06-25', '2025-06-30', '2025-06-01', '300', 1),
(523, '20250625SD1BC9523C', 'VERONICA CASTRO DELGADO', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '4921190646', '', '', '', 5, '', '192.168.26.53', '2024-05-01', '2025-06-06', '2025-06-07', '300', 1),
(524, '20250625AL2UZ4524W', 'VICENTA DEL MURO MENDEZ', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 5, '', '192.168.26.58', '2025-06-25', '2025-06-30', '2025-06-01', '300', 1),
(525, '20250625WE3WL1525D', 'YESENIA VILLAGRANA', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 5, '', '192.168.26.60.', '2025-06-25', '2025-06-30', '2025-06-01', '300', 1),
(526, '20250625HQ5LC5526R', 'CLAUDIA RAMIREZ DE LOERA (TORRE no paga )', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '4921449710', '', '', '', 5, '', '192.168.26.70.', '2024-05-01', '2025-06-06', '2025-06-07', '300', 1),
(527, '20250625PA5QE0527F', 'ISMAEL RAMIREZ DEL MURO', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '4921447910', '', '', '', 5, '', '', '2024-09-11', '2025-09-16', '2025-09-17', '300', 1),
(528, '20250625KM9XK8528K', 'KAREN CARRILLO CARRILLO', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '4922432292', '', '', '', 5, '', '', '2024-09-18', '2025-09-23', '2025-09-24', '300', 1),
(529, '20250625VW3PG2529I', 'ESTER NU?EZ ROBLES', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '4922104103', '', '', '', 5, '', '192.168.26.9', '2024-09-11', '2025-09-16', '2025-09-17', '300', 1),
(530, '20250625FN3JR6530L', 'FIDEL CARRILLO DEL MURO', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 5, '', '192.168.26.65', '2024-10-01', '2025-10-06', '2025-10-07', '300', 1),
(531, '20250625QX8XV6531F', 'SONIA ESMERALDA HERNANDEZ MONTALVO', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '4922891426', '', '', '', 5, '', '192.168.26.95', '2024-12-09', '2025-12-14', '2025-12-15', '300', 1),
(532, '20250625IM3IU4532Q', 'MA GUADALUPE MENDEZ VILLAGRANA', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '4922289486', '', '', '', 5, '', '', '2025-02-04', '2025-06-09', '2025-06-10', '300', 1),
(533, '20250625BA2WW6533U', 'SANTIAGO VILLAGRANA TRANCOSO', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 5, '', '192.168.26.79', '2025-03-28', '2025-06-02', '2025-06-03', '300', 1),
(534, '20250625XH7TD3534V', 'MARTHA CARRILLO ESCARE?O', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 5, '', '192.168.26.78', '2025-03-28', '2025-06-02', '2025-06-03', '300', 1),
(535, '20250625RV3VT5535U', 'JULIETA ELIZABETH MARQUEZ VILLAGRANA', '', '', '', 'LA PURISIMA', 'GENARO CODINA', 'ZACATECAS', 98670, '4922903381', '', '', '', 5, '', '192.168.26.8', '2025-04-03', '2025-06-08', '2025-06-09', '300', 1),
(536, '20250625NW9JM0536Z', 'ADAN CASTRO DELGADO', '', '', '', 'LA PRESILLA', 'GENARO CODINA', 'ZACATECAS', 98667, '4921120235', '', '', '', 1, '', '192.168.28.31', '2022-06-01', '2025-06-06', '2025-06-07', '270', 1),
(537, '20250625GZ8HT4537M', 'ANGELA MORALES HERNANDEZ', '', '', '', 'LA PRESILLA', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.28.137', '2023-07-07', '2025-07-06', '2025-07-07', '270', 1),
(538, '20250625YV8BN6538L', 'DAVID ESQUIVEL CASTRO', '', '', '', 'LA PRESILLA', 'GENARO CODINA', 'ZACATECAS', 98667, '4921287466', '', '', '', 1, '', '192.168.28.248', '2022-06-02', '2025-06-07', '2025-06-08', '270', 1),
(539, '20250625XF6WX5539Z', 'ELVIRA CARRILLO ESCARE?O', '', '', '', 'LA PRESILLA', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.28.25', '2022-06-02', '2025-06-07', '2025-06-08', '270', 1),
(540, '20250625HI0EK8540A', 'GLORIA EMA ESQUIVEL LOPEZ', '', '', '', 'LA PRESILLA', 'GENARO CODINA', 'ZACATECAS', 98667, '4921376629', '', '', '', 1, '', '192.168.28.251', '2022-06-02', '2025-06-07', '2025-06-08', '270', 1),
(541, '20250625CI1DH6541Z', 'GUSTAVO ADOLFO ESQUIVEL LOPEZ', '', '', '', 'LA PRESILLA', 'GENARO CODINA', 'ZACATECAS', 98667, '4921790539', '', '', '', 1, '', '192.168.28.247', '2022-06-02', '2025-06-07', '2025-06-08', '270', 1),
(542, '20250625GC6XS5542D', 'JUAN CARLOS BENITEZ CARRILLO', '', '', '', 'LA PRESILLA', 'GENARO CODINA', 'ZACATECAS', 98667, '4921736399', '', '', '', 1, '', '192.168.28.249', '2022-06-02', '2025-06-07', '2025-06-08', '270', 1),
(543, '20250625CC6KT2543R', 'MARIA DE LA LUZ CASTORENA REYES', '', '', '', 'LA PRESILLA', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.28.127', '2022-07-12', '2025-07-17', '2025-07-18', '270', 1),
(544, '20250625YF4HV0544F', 'MARIA EMMA TORRES SILVA', '', '', '', 'LA PRESILLA', 'GENARO CODINA', 'ZACATECAS', 98667, '4922898488', '', '', '', 1, '', '192.168.28.244', '2022-11-23', '2025-11-28', '2025-11-29', '270', 1),
(545, '20250625MR3DN8545J', 'PASCUALA DIAZ SALAZAR', '', '', '', 'LA PRESILLA', 'GENARO CODINA', 'ZACATECAS', 98667, '4922685848', '', '', '', 1, '', '192.168.28.139', '2023-01-03', '2025-06-07', '2025-06-08', '270', 1),
(546, '20250625VD7VT2546R', 'PEDRO HERNANDEZ DELGADO', '', '', '', 'LA PRESILLA', 'GENARO CODINA', 'ZACATECAS', 98667, '4921721884', '', '', '', 1, '', '192.168.28.246', '2022-06-02', '2025-06-07', '2025-06-08', '270', 1),
(547, '20250625OV5JL8547B', 'PERLA MAYELA RENTERIA CASTRO', '', '', '', 'LA PRESILLA', 'GENARO CODINA', 'ZACATECAS', 98667, '4922518697', '', '', '', 1, '', '192.168.28.252', '2022-06-01', '2025-06-06', '2025-06-07', '270', 1),
(548, '20250625NP4RF0548F', 'SONIA PAMELA CASTRO HERNANDEZ', '', '', '', 'LA PRESILLA', 'GENARO CODINA', 'ZACATECAS', 98667, '4921120235', '', '', '', 1, '', '192.168.28.253', '2022-06-01', '2025-06-06', '2025-06-07', '270', 1),
(549, '20250625IH6JM6549B', 'CANDIDO CASTRO', '', '', '', 'LA PRESILLA', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '', '2025-06-25', '2025-06-30', '2025-06-01', '270', 1),
(550, '20250625WD6RU9550O', 'BERTHA RODRIGUEZ', '', '', '', 'LA PRESILLA', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '', '2025-06-25', '2025-06-30', '2025-06-01', '270', 1),
(551, '20250625OV3DN6551R', 'MARIA GUADALUPE HERNANDEZ DELGADO', '', '', '', 'LA PRESILLA', 'GENARO CODINA', 'ZACATECAS', 98667, '4921817583', '', '', '', 1, '', '192.168.28.68', '2025-03-17', '2025-06-22', '2025-06-23', '270', 1),
(552, '20250625IV2YE7552R', 'ALEJANDRA DELGADO LOPEZ', '', '', '', 'LA PRESILLA', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.28.69', '2025-04-09', '2025-06-14', '2025-06-15', '270', 1),
(553, '20250625VV6ZA3553T', 'ABRAHAM SANCHEZ ESQUIVEL', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4925832426', '', '', '', 2, '', '192.168.27.216', '2020-06-04', '2025-06-09', '2025-06-10', '470', 1),
(554, '20250625VV9NR6554H', 'AIDA JAQUELINE ARTEAGA GUILLEN', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.93', '2018-03-08', '2025-06-13', '2025-06-14', '270', 1),
(555, '20250625YE8DD6555Z', 'ALEJANDRO TORRES ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.86', '2018-01-24', '2025-06-29', '2025-06-30', '270', 1),
(556, '20250625TH7EM8556Z', 'AMELIA CASTRO ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.61', '2017-09-30', '2025-10-05', '2025-10-06', '270', 1),
(557, '20250625CC5GX8557F', 'ANA MARIA LOPEZ RUIZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.57', '2018-09-10', '2025-09-15', '2025-09-16', '270', 1),
(558, '20250625WU6NF4558Z', 'ANGELICA TORRES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.55', '2017-09-10', '2025-09-15', '2025-09-16', '270', 1),
(559, '20250625DZ2NU2559U', 'ARACELI SANCHEZ ESQUIVEL', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4921319996', '', '', '', 1, '', '192.168.27.124', '2020-09-18', '2025-09-23', '2025-09-24', '270', 1),
(560, '20250625GF2OJ0560E', 'ARACELY LOPEZ ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.88', '2018-01-26', '2025-07-01', '2025-07-02', '270', 1),
(561, '20250625MC5ZK6561G', 'AURORA CAMPOS', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.75', '2018-12-02', '2025-12-07', '2025-12-08', '270', 1),
(562, '20250625KI8UG3562G', 'BEATRIZ LOPEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.201', '2020-05-01', '2025-06-06', '2025-06-07', '270', 1),
(563, '20250625CH8KT7563L', 'BLANCA  NELY SALIDA A SAN FERNANDO', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.122', '2018-08-21', '2025-08-26', '2025-08-27', '270', 1),
(564, '20250625DX2RY4564W', 'BLANCA ESTELA RODRIGUEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.177', '2020-10-26', '2025-10-31', '2025-11-01', '270', 1),
(565, '20250625BV9VK6565Q', 'BRAULIO MANDUJANO', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.130', '2018-08-21', '2025-08-26', '2025-08-27', '270', 1),
(566, '20250625IR0XY1566C', 'BRAYAN ULICES  TORRES DE LA CRUZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.180', '2020-12-03', '2025-12-08', '2025-12-09', '270', 1),
(567, '20250625XT3YZ4567J', 'CARMELO TORRES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.186', '2021-09-30', '2025-10-05', '2025-10-06', '270', 1),
(568, '20250625IS0WB1568V', 'CENTRO DE SALUD PERALES CLINICA', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '492-110-3209', '', '', '', 1, '', '192.168.27.49', '2021-02-18', '2025-06-23', '2025-06-24', '270', 1),
(569, '20250625TX6NG9569G', 'COBAEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.65', '2017-10-23', '2025-10-28', '2025-10-29', '270', 1),
(570, '20250625MG6FK6570A', 'DANIELA AMPARO LOPEZ RAMIREZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4922455095', '', '', '', 1, '', '192.168.27.70', '2024-04-11', '2025-06-16', '2025-06-17', '270', 1),
(571, '20250625PP5AU1571H', 'DAVID TORRES ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.87', '2018-01-24', '2025-06-29', '2025-06-30', '270', 1),
(572, '20250625AA6KJ7572H', 'DEYRA LISETH ARTEAGA ESCALERA', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.209', '2020-05-19', '2025-06-24', '2025-06-25', '270', 1),
(573, '20250625KZ7CF6573A', 'DIANA SALINAS', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4921245555', '', '', '', 1, '', '192.168.27.127', '2023-04-05', '2025-06-10', '2025-06-11', '270', 1),
(574, '20250625XW4DC6574C', 'DULCE FATIMA TORRES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.117', '2018-07-17', '2025-07-22', '2025-07-23', '270', 1),
(575, '20250625JT4AE6575D', 'DULCE VIRIDIANA ARTEAGA', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.98', '2018-03-09', '2025-06-14', '2025-06-15', '270', 1),
(576, '20250625XV1DN4576H', 'EDUARDO ALEXIS SANCHEZ SANCHEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4922235795', '', '', '', 1, '', '192.168.27.141', '2023-08-04', '2025-08-28', '2025-08-29', '270', 1),
(577, '20250625BY4SY0577I', 'ELVIA SANCHEZ HERRERA', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4922158555', '', '', '', 1, '', '', '2020-06-24', '2025-06-29', '2025-06-30', '270', 1),
(578, '20250625DP8KX5578B', 'EMMA LIDIA ESQUIVEL TORRES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.237', '2020-09-04', '2025-09-09', '2025-09-10', '270', 1),
(579, '20250625TF9WJ4579O', 'EZEQUIEL TORRES REYES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '3312228447', '', '', '', 1, '', '192.168.27.166', '2022-09-08', '2025-09-13', '2025-09-14', '270', 1),
(580, '20250625OF4FQ6580Q', 'FATIMA GUADALUPE DE LARA GARCIA', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4922391169', '', '', '', 1, '', '192.168.27.175', '2022-10-10', '2025-10-15', '2025-10-16', '270', 1),
(581, '20250625KR7KS5581J', 'FATIMA TORRES  1', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.112', '2018-06-20', '2025-06-25', '2025-06-26', '270', 1),
(582, '20250625FO6GA4582D', 'FIDEL TORRES CAMPOS', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4921906729', '', '', '', 1, '', '192.168.27.38', '2024-02-01', '2025-06-06', '2025-06-07', '270', 1),
(583, '20250625YI5LZ8583Y', 'GANADERA PERALES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.207', '2020-05-14', '2025-06-19', '2025-06-20', '270', 1),
(584, '20250625RJ9QT3584H', 'GLORIA CAMPOS SANTANA', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.29', '2021-01-12', '2025-06-17', '2025-06-18', '270', 1),
(585, '20250625JF4JI8585E', 'GONZALO SANCHEZ ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.200', '2020-05-01', '2025-06-06', '2025-06-07', '270', 1),
(586, '20250625HZ4OX4586A', 'GUILLERMO ANTONIO RUIZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.82', '2025-06-25', '2025-06-30', '2025-06-01', '270', 1),
(587, '20250625TG3DN8587L', 'GUSTAVO RUIZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.132', '2018-09-20', '2025-09-25', '2025-09-26', '270', 1),
(588, '20250625ZX4EB2588I', 'HUGO LOPEZ RUIZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.95', '2018-03-08', '2025-06-13', '2025-06-14', '270', 1),
(589, '20250625DU1GG3589I', 'HUGO REYES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.56', '2018-09-10', '2025-09-15', '2025-09-16', '270', 1),
(590, '20250625BN1RK1590W', 'IRMA MANDUJANO RAMIREZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.115', '2018-06-21', '2025-06-26', '2025-06-27', '270', 1),
(591, '20250625GM4XI2591X', 'J CRUZ TORRES MANDUJANO', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4922173317', '', '', '', 1, '', '192.168.27.176', '2023-06-21', '2025-06-17', '2025-06-18', '270', 1),
(592, '20250625WX7VX5592L', 'J FELIX ARTEAGA ACOSTA', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.43', '2021-10-06', '2025-10-11', '2025-10-12', '270', 1),
(593, '20250625JW3WP3593A', 'JERONIMO TORRES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.210', '2020-05-20', '2025-06-25', '2025-06-26', '270', 1),
(594, '20250625GW5AC1594V', 'JESUS RENTERIA ACOSTA', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.242', '2020-09-18', '2025-09-23', '2025-09-24', '270', 1),
(595, '20250625EW6BT2595U', 'JESUS SALVADOR LOPEZ MENDEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4921801201', '', '', '', 1, '', '192.168.27.250', '2022-08-25', '2025-08-30', '2025-08-31', '270', 1),
(596, '20250625YK9IW4596G', 'JORGE SANCHEZ HERRERA', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.50', '2022-12-10', '2025-12-15', '2025-12-16', '270', 1),
(597, '20250625WK1YZ8597C', 'JOSE ANGEL NIETO SANCHEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.37', '2021-10-06', '2025-10-11', '2025-10-12', '270', 1),
(598, '20250625GF6MR8598X', 'JOSE CECILIO LOPEZ VENEGAS', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.97', '2018-03-08', '2025-06-13', '2025-06-14', '270', 1),
(599, '20250625VJ8PM5599J', 'JOSE EDUARDO DAVILA TORRES ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.194', '2020-04-20', '2025-06-25', '2025-06-26', '270', 1),
(600, '20250625UJ6UG7600P', 'JOSE ENRIQUE TORRES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '', '2020-07-24', '2025-07-29', '2025-07-30', '270', 1),
(601, '20250625KS9CP7601M', 'JOSE GERARDO REYES MU?OZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4922619085', '', '', '', 1, '', '192.168.27.179', '2022-10-27', '2025-11-01', '2025-11-02', '270', 1),
(602, '20250625GR8SW1602W', 'JOSE MANUEL SANCHEZ RAMIREZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.107', '2020-07-31', '2025-08-05', '2025-08-06', '270', 1),
(603, '20250625JC9JL1603P', 'JOSE RAMIRO TORRES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.140', '2019-02-02', '2025-06-07', '2025-06-08', '270', 1),
(604, '20250625AB7GO8604B', 'JOSEFINA GARCIA TORRES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.185', '2020-02-13', '2025-06-18', '2025-06-19', '270', 1),
(605, '20250625XE9QA6605Z', 'JOSUE EDUARDO SANCHEZ HERRERA', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.113', '2018-06-20', '2025-06-25', '2025-06-26', '270', 1),
(606, '20250625PX6EW3606R', 'JUAN CARLOS MANDUJANO MANDUJANO', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.46', '2021-10-06', '2025-10-11', '2025-10-12', '270', 1),
(607, '20250625HT2HS9607M', 'JUAN CARLOS TORRES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.155', '2019-08-01', '2025-08-06', '2025-08-07', '270', 1),
(608, '20250625OI4MV5608P', 'JUAN QUIROZ MAISTRO DE DON LINO', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '', '2020-07-24', '2025-07-29', '2025-07-30', '270', 1),
(609, '20250625QX6IH3609B', 'LAURA FAVIOLA HINOJOSA ESQUIVEL', '', '', '', 'SALTO PRIETO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.28.57', '2025-06-25', '2025-06-30', '2025-06-01', '270', 1),
(610, '20250625CW1GA4610H', 'LAURO RUIZ TORRES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4922176510', '', '', '', 1, '', '192.168.27.205', '2022-06-27', '2025-07-02', '2025-07-03', '270', 1),
(611, '20250625TA5NS1611G', 'LEONEL SALVADOR SANCHEZ HERNANDEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.72', '2017-11-07', '2025-11-12', '2025-11-13', '270', 1),
(612, '20250625OZ1MU9612R', 'LEYRE REYES CAMPOS', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.118', '2018-07-24', '2025-07-29', '2025-07-30', '270', 1),
(613, '20250625RJ4TN1613Y', 'LUCIO MENDEZ RUIZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4929460940', '', '', '', 1, '', '192.168.27.188', '2022-08-18', '2025-08-23', '2025-08-24', '270', 1),
(614, '20250625KK5GU8614L', 'LUIS ANTONIO LOPEZ RAMIREZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.94', '2018-03-08', '2025-06-13', '2025-06-14', '270', 1),
(615, '20250625DN9DU0615U', 'MA CRUZ SANCHEZ LOPEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4922513264', '', '', '', 1, '', '192.168.27.183', '2022-08-18', '2025-08-23', '2025-08-24', '270', 1),
(616, '20250625QB9XA5616Q', 'MA DEL REFUGIO LOPEZ CARDONA', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4929004224', '', '', '', 1, '', '192.168.27.246', '2020-09-30', '2025-10-05', '2025-10-06', '270', 1),
(617, '20250625HY0NF2617Z', 'MANUEL ALEJANDRO TORRES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.81', '2025-06-25', '2025-06-30', '2025-06-01', '270', 1),
(618, '20250625HR1EP3618F', 'MANUEL DIAZ HERNANDEZ ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, 'CAMBIO DE PE?AS', '', '', '', 1, '', '192.168.27.236', '2021-11-03', '2025-11-08', '2025-11-09', '270', 1),
(619, '20250625DV1KN8619A', 'MARBELLA GARCIA', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.137', '2018-12-02', '2025-12-07', '2025-12-08', '270', 1),
(620, '20250625MY1AH1620T', 'MARGARITA MORALES VILLANUEVA', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.48', '2021-03-26', '2025-07-01', '2025-07-02', '270', 1),
(621, '20250625UQ2EM3621I', 'MARIA CONCEPCION PI?ONES TORRES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4925836787', '', '', '', 1, '', '', '2020-09-29', '2025-10-04', '2025-10-05', '270', 1),
(622, '20250625QU3TN9622Z', 'MARIA DE LA LUZ LOPEZ MENDEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.189', '2021-09-30', '2025-10-05', '2025-10-06', '270', 1),
(623, '20250625GV9DS8623H', 'MARIA EUGENIA ELIAS RIVAS', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4924926584', '', '', '', 1, '', '192.168.27.223', '2023-09-07', '2025-10-05', '2025-10-06', '270', 1),
(624, '20250625LN2XB0624Y', 'MARIA FLORENCIA ESQUIVEL CASTRO', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4929006323', '', '', '', 1, '', '192.168.27.24', '2021-12-22', '2025-12-27', '2025-12-28', '270', 1),
(625, '20250625PI2YK4625U', 'MARIA MANDUJANO CASTRO', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4929004393', '', '', '', 1, '', '192.168.27.67', '2020-11-24', '2025-11-29', '2025-11-30', '270', 1),
(626, '20250625KI2PI5626T', 'MARIA MARYOLAIN REYES  ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.90', '2018-02-08', '2025-06-13', '2025-06-14', '270', 1),
(627, '20250625ZK7SO7627U', 'MARISOL ESCARE?O MENDEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4922032701', '', '', '', 1, '', '192.168.27.44', '2023-09-22', '2025-10-01', '2025-10-02', '270', 1),
(628, '20250625EM2VG7628O', 'MARISOL HERRERA JIMENEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.230', '2019-10-15', '2025-10-20', '2025-10-21', '270', 1),
(629, '20250625FC9CC0629M', 'MARTIN MARTELL', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.104', '2018-04-12', '2025-06-17', '2025-06-18', '270', 1),
(630, '20250625JD4XK9630C', 'MAXIMILIANO', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.202', '2020-05-01', '2025-06-06', '2025-06-07', '270', 1),
(631, '20250625GQ8FV9631U', 'MAYRA MANDUJANO', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4921976313', '', '', '', 1, '', '192.168.27.31', '2020-12-10', '2025-12-15', '2025-12-16', '270', 1),
(632, '20250625KB6GU6632X', 'MAYRA TORRES ESQUIVEL', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.161', '2021-06-30', '2025-07-05', '2025-07-06', '270', 1),
(633, '20250625MK4FU4633R', 'MIGUEL CASTRO TRONCOSO', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '7134018895', '', '', '', 1, '', '192.168.27.139', '2023-07-06', '2025-07-13', '2025-07-14', '270', 1),
(634, '20250625YM2FL3634F', 'MONICO HERNANDEZ CASTRO', '', '', '', 'SAN FERNANDO', 'GENARO CODINA', 'ZACATECAS', 98667, 'SAN FERNANDO', '', '', '', 1, '', '192.168.28.130.', '2025-06-25', '2025-06-30', '2025-06-01', '270', 1),
(635, '20250625II8AU9635E', 'NELI ANGELICA RINCON SANCHEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4922280023', '', '', '', 1, '', '192.168.27.239', '2020-09-15', '2025-09-20', '2025-09-21', '270', 1),
(636, '20250625HA0VE1636A', 'ORLANDO HINOJOZA AGUILAR', '', '', '', 'SALTO PRIETO', 'GENARO CODINA', 'ZACATECAS', 98667, 'SALTO PRIETO', '', '', '', 1, '', '192.168.28.81', '2025-06-25', '2025-06-30', '2025-06-01', '270', 1),
(637, '20250625SZ5SB0637M', 'OSCAR LOPEZ MENDEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.208', '2020-05-14', '2025-06-19', '2025-06-20', '270', 1),
(638, '20250625VV5HS6638X', 'PABLO TORRES TIENDA ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.123', '2018-08-21', '2025-08-26', '2025-08-27', '270', 1),
(639, '20250625LP1VY0639B', 'PASCUALA LOPEZ TORRES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.191', '2023-05-17', '2025-06-04', '2025-06-05', '270', 1),
(640, '20250625SP2HX0640M', 'PEDRO LOPEZ SANCHEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4924462987', '', '', '', 1, '', '192.168.27.231', '2020-08-06', '2025-08-11', '2025-08-12', '270', 1),
(641, '20250625WC1PQ3641N', 'PROFE MARIO', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.227', '2020-07-24', '2025-07-29', '2025-07-30', '270', 1),
(642, '20250625BQ0HY1642F', 'RAUL TORRES MANDUJANO', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4922157855', '', '', '', 1, '', '192.168.27.169', '2022-03-18', '2025-06-23', '2025-06-24', '270', 1),
(643, '20250625MC8MG2643R', 'REGINO ORLANDO HINOJOSA', '', '', '', 'SAN FERNANDO', 'GENARO CODINA', 'ZACATECAS', 98667, '4921968964', '', '', '', 1, '', '192.168.28.240.', '2023-10-21', '2025-10-30', '2025-10-31', '270', 1),
(644, '20250625WZ4CP1644K', 'SALVADOR VALDEZ QUIROZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4922803038', '', '', '', 1, '', '192.168.27.234', '2020-08-24', '2025-08-29', '2025-08-30', '270', 1),
(645, '20250625TT9CP2645G', 'SANJUANA ERENDIDA LOPEZ CAMPOS ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4921793644', '', '', '', 1, '', '192.168.27.198', '2022-10-31', '2025-11-05', '2025-11-06', '270', 1),
(646, '20250625QD8CC5646A', 'SANJUANA JAZMIN SANCHEZ CASTRO', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4922621053', '', '', '', 1, '', '192.168.27.127', '2022-11-04', '2025-11-09', '2025-11-10', '270', 1),
(647, '20250625KC2PU1647T', 'SAUL QUIROZ ESCOBAR', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4921009343', '', '', '', 1, '', '192.168.27.247', '2020-09-30', '2025-10-05', '2025-10-06', '270', 1),
(648, '20250625BD8QU9648Q', 'LOURDES RUIZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.63', '2017-10-14', '2025-10-19', '2025-10-20', '270', 1),
(649, '20250625SU8ZS8649L', 'SERGIO GALLARDO TORRES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.156', '2019-08-01', '2025-08-06', '2025-08-07', '270', 1),
(650, '20250625IQ0VO2650D', 'TAYDE MANDUJANO LOPEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4922181427', '', '', '', 1, '', '192.168.27.162', '2023-09-13', '2025-09-26', '2025-09-27', '270', 1),
(651, '20250625VU7NE7651U', 'TERESO REYES TORRES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '492.1959365', '', '', '', 1, '', '192.168.27.60', '2020-11-24', '2025-11-29', '2025-11-30', '270', 1),
(652, '20250625NB8MS5652K', 'VERONICA PEREZ FRIAS', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4922446385', '', '', '', 1, '', '192.168.27.173', '2022-09-29', '2025-10-04', '2025-10-05', '270', 1),
(653, '20250625YD4WQ0653J', 'VICTOR MANUEL', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.197', '2020-04-20', '2025-06-25', '2025-06-26', '270', 1),
(654, '20250625ME4YC8654H', 'WENDY MANDUJANO HERRERA', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.195', '2022-08-09', '2025-08-14', '2025-08-15', '270', 1),
(655, '20250625TZ1FD9655Q', 'YANETH SANCHEZ TORRES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.111', '2018-06-20', '2025-06-25', '2025-06-26', '270', 1),
(656, '20250625SV6UB6656J', 'YURIDIA RUIZ  DIOSELINE ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.80', '2025-06-25', '2025-06-30', '2025-07-01', '270', 1),
(657, '20250625RY8TV8657A', 'ZAMANTHA YARITZA SALINAS HERNANDEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '492-225', '', '', '', 1, '', '192.168.27.29', '2021-04-16', '2025-06-21', '2025-06-22', '270', 1),
(658, '20250625QF1FD2658S', 'NOE SANCHEZ HERRERA', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4921610233', '', '', '', 1, '', '192.168.27.100.', '2024-05-07', '2025-06-12', '2025-06-13', '270', 1),
(659, '20250625JU2YZ9659F', 'VALERIA SANCHEZ SANCHEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4581305379', '', '', '', 1, '', '192.168.27.96', '2024-05-04', '2025-06-09', '2025-06-10', '270', 1),
(660, '20250625TI3SH2660W', 'FLAVIO RODRIGUEZ SANCHEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4922177582', '', '', '', 1, '', '192.168.27.92', '2024-05-15', '2025-06-20', '2025-06-21', '270', 1),
(661, '20250625OZ8KR0661A', 'JESUS MANUEL DAVILA CASAS', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4929268007', '', '', '', 1, '', '192.168.27.160', '2024-05-29', '2025-06-03', '2025-06-04', '270', 1),
(662, '20250625UP8MX8662H', 'MARIA OCHOA VIZCANO', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4929462987', '', '', '', 1, '', '192.168.27.148', '2024-07-16', '2025-07-21', '2025-07-22', '270', 1),
(663, '20250625VV2FM9663Q', 'MARIA FERNANDA MONTALVO', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '5024893235', '', '', '', 1, '', '192.168.27.114', '2024-07-19', '2025-07-24', '2025-07-25', '270', 1),
(664, '20250625NG0IM8664V', 'SOFIA GUADALUPE TORRES G ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.213', '2024-09-17', '2025-09-22', '2025-09-23', '270', 1),
(665, '20250625HP6WJ1665N', 'JESUS AGUSTIN MANDUJANO LOPEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4921169626', '', '', '', 1, '', '192.168.27.129', '2025-02-05', '2025-06-10', '2025-06-11', '270', 1),
(666, '20250625ZS5WX1666P', 'CAROLINA HERRERA B', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4922023197', '', '', '', 1, '', '192.168.27.4', '2025-02-05', '2025-06-10', '2025-06-11', '270', 1),
(667, '20250625LK1FV8667Y', 'JESUS MONTALVO PI?ON', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4921279691', '', '', '', 1, '', '192.168.27.144', '2025-02-05', '2025-06-10', '2025-06-11', '270', 1),
(668, '20250625WZ2CM6668J', 'FELIPE MANDUJANO', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4921744486', '', '', '', 1, '', '192.168.27.119', '2025-02-05', '2025-06-10', '2025-06-11', '270', 1),
(669, '20250625TD3LJ8669V', 'MILAGROS RAMOS JACOBO', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4924508091', '', '', '', 1, '', '192.168.27.214', '2025-02-05', '2025-06-10', '2025-06-11', '270', 1),
(670, '20250625BY1WE8670K', 'FRANCISCO RUIZ TORRES', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4921479704', '', '', '', 1, '', '192.168.28.157', '2025-02-07', '2025-06-12', '2025-06-13', '270', 1),
(671, '20250625LA4CT3671L', 'LEANDRO GUERRERO HERRERA', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4924082633', '', '', '', 1, '', '192.168.28.155', '2025-02-07', '2025-06-12', '2025-06-13', '270', 1),
(672, '20250625OL7RY4672J', 'RODRIGO TORRES DIAZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4929005367', '', '', '', 1, '', '192.168.28.156', '2025-02-07', '2025-06-12', '2025-06-13', '270', 1),
(673, '20250625VK0PZ8673T', 'GRACIELA ACOSTA MARTELL', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4929059378', '', '', '', 1, '', '192.168.27.102', '2025-02-13', '2025-06-18', '2025-06-19', '270', 1),
(674, '20250625MR3MN7674R', 'JOSE TORRES MANDUJANO', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4921454762', '', '', '', 1, '', '192.168.27.03', '2025-02-19', '2025-06-24', '2025-06-25', '270', 1),
(675, '20250625VR1YU8675X', 'MA AUXILIO LOPEZ SANCHEZ', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '4921607256', '', '', '', 1, '', '192.168.27.27', '2025-02-19', '2025-06-24', '2025-06-25', '270', 1),
(676, '20250625QV7ED7676Z', 'JOSE LUIS LOPEZ ARTEAGA', '', '', '', 'LOS PERALES', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.4', '2025-03-12', '2025-06-17', '2025-06-18', '270', 1),
(677, '20250625UD2KN4677V', 'ALMA KARINA RODRIGUEZ REYES', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.217', '2020-06-04', '2025-06-09', '2025-06-10', '270', 1),
(678, '20250625KJ8FT6678I', 'ARON CASTRO CAMPOS', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '', '2020-07-24', '2025-07-29', '2025-07-30', '270', 1),
(679, '20250625OE2EG6679W', 'BENERICE CASTRO CHAVEZ', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.238', '2020-09-04', '2025-09-09', '2025-09-10', '270', 1),
(680, '20250625IZ8VF1680K', 'BERTHA RODRIGUEZ PEREA PRESILLA', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '', '2023-10-03', '2025-10-18', '2025-10-19', '270', 1),
(681, '20250625SX0CW3681F', 'CESAR CAMPOS CASTORENA', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.23', '2020-08-24', '2025-08-29', '2025-08-30', '270', 1),
(682, '20250625PJ9AR1682U', 'CLAUDIA LOPEZ C', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.154', '2019-06-26', '2025-07-01', '2025-07-02', '270', 1),
(683, '20250625CQ5QJ5683P', 'DANIEL RODRIGUEZ', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.51', '2017-09-05', '2025-09-10', '2025-09-11', '270', 1),
(684, '20250625VI2ON0684O', 'DAVID TORRES', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.52', '2017-09-05', '2025-09-10', '2025-09-11', '270', 1),
(685, '20250625VU3FY3685O', 'DORA ESQUIVEL', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.125', '2018-08-22', '2025-08-27', '2025-08-28', '270', 1),
(686, '20250625ZJ4DG0686O', 'DULCE MARIA CAMPOS CASTORENA', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '4922035293', '', '', '', 1, '', '192.168.27.34', '2022-02-28', '2025-06-02', '2025-06-03', '270', 1),
(687, '20250625RC1FW5687H', 'ENRIQUETA GONZALEZ B', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.146', '2019-04-18', '2025-06-23', '2025-06-24', '270', 1);
INSERT INTO `clientes` (`id`, `folio`, `nombre`, `domicilio`, `calle`, `colonia`, `comunidad`, `municipio`, `estado`, `cp`, `telefono`, `referencias`, `identificacion`, `comprobante`, `servicio`, `antena`, `direccionip`, `fecha_contrato`, `fecha_limite`, `fecha_corte`, `cuota`, `estatus`) VALUES
(688, '20250625FH3PC3688A', 'ERNESTINA GONZALEZ BENITEZ', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.15', '2017-10-14', '2025-10-19', '2025-10-20', '270', 1),
(689, '20250625CP4LJ4689N', 'FATIMA YAZMIN CAMPOS', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.126', '2018-08-23', '2025-08-28', '2025-08-29', '270', 1),
(690, '20250625QZ1GS7690O', 'GERMAN MORALES', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.54', '2017-09-05', '2025-09-10', '2025-09-11', '270', 1),
(691, '20250625LT2YG4691U', 'HECTOR HERRERA CAMPOS', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.142', '2019-02-28', '2025-06-02', '2025-06-03', '270', 1),
(692, '20250625SP8ST4692O', 'HIPOLITA HERNANDEZ', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.187', '2020-02-27', '2025-06-01', '2025-06-02', '270', 1),
(693, '20250625RF1LA8693O', 'JENNIFER ARTEAGA ESQUIVEL', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.229', '2023-09-07', '2025-10-03', '2025-10-04', '270', 1),
(694, '20250625WL0TT2694W', 'JORGE ARMANDO CAMPOS CASTORENA', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.106', '2018-06-08', '2025-06-13', '2025-06-14', '270', 1),
(695, '20250625WH6HG3695R', 'JOSE GUADALUPE LOPEZ ESQUIVEL', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.102', '2018-03-28', '2025-06-02', '2025-06-03', '270', 1),
(696, '20250625IT2QS3696M', 'JOSE GUADALUPE LOPEZ MU?OZ CHONA', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.226', '2020-07-24', '2025-07-29', '2025-07-30', '270', 1),
(697, '20250625IM3OF3697J', 'JUAN CAMPOS SANTANA', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '4921007077', '', '', '', 1, '', '192.168.27.105', '2022-04-27', '2025-06-01', '2025-06-02', '270', 1),
(698, '20250625YE7IZ0698Z', 'JUAN DE LA CRUZ GUERERO HERRERA', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '4922650459', '', '', '', 3, '', '192.168.27.180.', '2023-06-09', '2025-07-03', '2025-07-04', '0', 1),
(699, '20250625AV3JJ5699A', 'LAURO CAMPOS JARAMILLO', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '', '2025-06-25', '2025-06-30', '2025-07-01', '270', 1),
(700, '20250625YO5ZU9700H', 'LINO CAMPOS', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.76', '2018-12-02', '2025-12-07', '2025-12-08', '270', 1),
(701, '20250625BV3PI0701N', 'LUCIO ', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.59', '2017-09-16', '2025-09-21', '2025-09-22', '270', 1),
(702, '20250625XY1GY6702P', 'LUIS ROGRIGUEZ CERVANTES', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.143', '2019-02-28', '2025-06-02', '2025-06-03', '270', 1),
(703, '20250625XS5UH7703O', 'LUISA GONZALES BENITES', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.103', '2018-03-28', '2025-06-02', '2025-06-03', '270', 1),
(704, '20250625PO9DP2704B', 'LUZ DANIELA RODRIGUEZ CASTORENA', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.157', '2019-08-08', '2025-08-13', '2025-08-14', '270', 1),
(705, '20250625DJ0GP1705R', 'MARIA ELENA CAMPOS ROSALES', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.235', '2020-09-04', '2025-09-09', '2025-09-10', '270', 1),
(706, '20250625JC0ZI6706Z', 'PEDRO DIOSDADO SANTANA', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.28.173', '2022-12-21', '2025-12-26', '2025-12-27', '270', 1),
(707, '20250625TN3CM6707E', 'RANULFO MORALES CAMPOS', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.110', '2018-06-08', '2025-06-13', '2025-06-14', '270', 1),
(708, '20250625MX2VP3708N', 'RAUL CAMPOS', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.233', '2025-06-25', '2025-06-30', '2025-07-01', '270', 1),
(709, '20250625VQ5CH3709C', 'ROSA CRISTINA CAMPOS JARAMILLO', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.40.', '2021-03-30', '2025-06-04', '2025-06-05', '270', 1),
(710, '20250625RZ2AM2710V', 'VERONICA CAMPOS ', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.91', '2018-02-14', '2025-06-19', '2025-06-20', '270', 1),
(711, '20250625CT3JE0711W', 'YAMEL ', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.27.58', '2017-09-16', '2025-09-21', '2025-09-22', '270', 1),
(712, '20250625WI2GW1712L', 'ROBERTO CASTRO CARDONA', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '4922515694', '', '', '', 1, '', '192.168.27.153', '2024-10-08', '2025-10-13', '2025-10-14', '270', 1),
(713, '20250625CP2AE7713B', 'FELICITAS CAMPOS JACOBO', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '4929052712', '', '', '', 1, '', '192.168.27.71', '2024-10-29', '2025-11-03', '2025-11-04', '270', 1),
(714, '20250625OK2ZY1714R', 'PANFILO MORALES CALDERA', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '3342846010', '', '', '', 1, '', '192.168.27.202', '2024-11-20', '2025-11-25', '2025-11-26', '270', 1),
(715, '20250625IX4SW9715S', 'RIGOBERTO LOPEZ CASTORENA', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '4924500959', '', '', '', 1, '', '192.168.27.74', '2025-01-14', '2025-06-19', '2025-06-20', '270', 1),
(716, '20250625TW8BV1716M', 'JAQUELINE CASTRO CHAVEZ', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '4921617247', '', '', '', 1, '', '192.168.27.12', '2025-02-05', '2025-06-10', '2025-06-11', '270', 1),
(717, '20250625FH5SM6717P', 'MARTHA ELENA CAMPOS CASTRO', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '3343997088', '', '', '', 1, '', '192.168.28.158', '2025-02-07', '2025-06-12', '2025-06-13', '270', 1),
(718, '20250625WN9OL0718T', 'JESUS GUADALUPE ACOSTA CAMPOS', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '4921319341', '', '', '', 1, '', '192.168.28.159', '2025-02-04', '2025-06-09', '2025-06-10', '270', 1),
(719, '20250625KJ9IP1719V', 'ANTONIA HERNANDEZ CAMPOS', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '', '', '', '', 1, '', '192.168.28.40.', '2025-02-12', '2025-06-17', '2025-06-18', '270', 1),
(720, '20250625TH3BE0720G', 'JOAQUINA MORALES CAMPOS', '', '', '', 'EL REFUGIO', 'GENARO CODINA', 'ZACATECAS', 98667, '4929004828', '', '', '', 1, '', '192.168.28.64', '2025-02-12', '2025-06-17', '2025-06-18', '270', 1),
(721, '20250625JC1JR3721J', 'ADAN CASTORENA HUERTA ', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.212', '2020-05-27', '2025-06-01', '2025-06-02', '270', 1),
(722, '20250625RB9NU2722X', 'ALAN CAMPOS ESQUIVEL', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.163', '2021-07-13', '2025-07-18', '2025-07-19', '270', 1),
(723, '20250625YO8JB9723D', 'ANA LEYSI CASTORENA ACOSTA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '', '2022-02-18', '2025-06-23', '2025-06-24', '270', 1),
(724, '20250625DW7RD3724Y', 'ANTONIA RODRIGUEZ CERVANTES', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4921245360', '', '', '', 1, '', '192.168.27.203', '2020-05-13', '2025-06-18', '2025-06-19', '270', 1),
(725, '20250625FT8IM1725Y', 'ARTURO CASTORENA ', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.78', '2017-12-02', '2025-12-07', '2025-12-08', '270', 1),
(726, '20250625OP6XK9726R', 'BRENDA ESQUIVEL ', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.69', '2017-10-27', '2025-11-01', '2025-11-02', '270', 1),
(727, '20250625RX4WX2727J', 'CAROLINA ESQUIVEL CASTORENA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.178', '2018-08-23', '2025-08-28', '2025-08-29', '270', 1),
(728, '20250625FZ5PV5728Y', 'CESAR HINOJOSA RODRIGUEZ', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4921462147', '', '', '', 1, '', '192.168.27.215', '2020-06-04', '2025-06-09', '2025-06-10', '270', 1),
(729, '20250625RA4DB1729A', 'DELEGADO ALBERTO HERRERA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.136', '2018-11-21', '2025-11-26', '2025-11-27', '270', 1),
(730, '20250625TQ0OE1730K', 'EBELIN RODRIGUEZ', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.77', '2017-11-25', '2025-11-30', '2025-12-01', '270', 1),
(731, '20250625LA8BD2731V', 'ELISA MARIA RODRIGUEZ CASTORENA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.199', '2020-04-30', '2025-06-04', '2025-06-05', '270', 1),
(732, '20250625TF5YU9732H', 'ERIK CAMPOS HERRERA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.136', '2018-09-28', '2025-10-03', '2025-10-04', '270', 1),
(733, '20250625KE5ZW3733V', 'ERIKA LOPEZ', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '', '2018-08-23', '2025-08-28', '2025-08-29', '270', 1),
(734, '20250625EO3OO9734B', 'ERNESTO CASTORENA DE SANTIAGO', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4927950763', '', '', '', 1, '', '192.168.27.219', '2020-06-18', '2025-06-23', '2025-06-24', '270', 1),
(735, '20250625KP8EG0735N', 'ESCARLETT SAN JUANA HERNANDEZ CASTRO', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.68', '2017-10-25', '2025-10-30', '2025-10-31', '270', 1),
(736, '20250625KW6QB4736U', 'EZEQUIEL OVALLE', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4922513178', '', '', '', 1, '', '192.168.27.32', '2020-12-10', '2025-12-15', '2025-12-16', '270', 1),
(737, '20250625HM5GB6737S', 'FATIMA CASTORENA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '', '2025-06-25', '2025-06-30', '2025-07-01', '270', 1),
(738, '20250625EN8KC6738A', 'FERMIN CASTORENA FLORES', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.121', '2021-11-03', '2025-11-08', '2025-11-09', '270', 1),
(739, '20250625HM2VE2739Q', 'FIDEL RODRIGUEZ', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '492-217-7582', '', '', '', 1, '', '192.168.27.26', '2021-05-25', '2025-06-30', '2025-07-01', '270', 1),
(740, '20250625ID1EZ0740F', 'FILIBERTO ESQUIVEL CASTORENA VIBORAS', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4921377259', '', '', '', 1, '', '192.168.27.232', '2020-08-24', '2025-08-29', '2025-08-30', '270', 1),
(741, '20250625YX8BC2741I', 'FRANCISCA CAMPOS CASTORENA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.171', '2021-07-28', '2025-08-02', '2025-08-03', '270', 1),
(742, '20250625DD1AM2742T', 'GRISELDA HERRERA CASTORENA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.158', '2019-08-30', '2025-09-04', '2025-09-05', '270', 1),
(743, '20250625JQ3YC1743V', 'GUADALUPE SANCHEZ', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.170', '2022-01-11', '2025-06-16', '2025-06-17', '270', 1),
(744, '20250625OW0KO7744Y', 'HECTOR JOSE RIOS MORALES', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.99', '2018-03-09', '2025-06-14', '2025-06-15', '270', 1),
(745, '20250625LF6OO1745L', 'IRMA GARCIA RIOS', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.83', '2021-12-01', '2025-12-06', '2025-12-07', '270', 1),
(746, '20250625DA7DQ3746J', 'JOEL CASTORENA GARCIA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.171', '2017-11-07', '2025-11-12', '2025-11-13', '270', 1),
(747, '20250625FI6VG8747R', 'JOSE GUADALUPE RODRIGUEZ TORRES', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4929260749', '', '', '', 1, '', '192.168.27.222', '2020-06-25', '2025-06-30', '2025-07-01', '270', 1),
(748, '20250625NN8VC2748O', 'JOSE LUIS CASTORENA RODRIGUEZ', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '', '2025-06-25', '2025-06-30', '2025-07-01', '270', 1),
(749, '20250625JT4MA8749F', 'JOSE RAMON CASTORENA CAMPOS', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.85', '2018-01-04', '2025-06-09', '2025-06-10', '270', 1),
(750, '20250625TU4CT0750R', 'JUAN SANCHEZ TORRES ', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.135', '2018-10-30', '2025-11-04', '2025-11-05', '270', 1),
(751, '20250625UV9CB2751X', 'JUANA MAYELA NAVARRO', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.147', '2019-04-27', '2025-06-01', '2025-06-02', '270', 1),
(752, '20250625HH6RA9752Z', 'LETICIA TORRES BENITEZ', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.79', '2021-12-01', '2025-12-06', '2025-12-07', '270', 1),
(753, '20250625BJ5UG2753C', 'LILIANA ESQUIVEL JACOBO', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4991056591', '', '', '', 1, '', '', '2020-12-01', '2025-12-06', '2025-12-07', '270', 1),
(754, '20250625YV5ZQ0754I', 'LIZBETH  ALEJANDRA OVALLE 1', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.214', '2021-11-01', '2025-11-06', '2025-11-07', '270', 1),
(755, '20250625GC9IZ8755L', 'LUCIA HERRERA CASTORENA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4929267273', '', '', '', 1, '', '192.168.27.221', '2020-06-18', '2025-06-23', '2025-06-24', '270', 1),
(756, '20250625FW1NG9756T', 'PRIMARIA VIVORITAS', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4921191204', '', '', '', 1, '', '192.168.27.151', '2020-12-10', '2025-12-15', '2025-12-16', '270', 1),
(757, '20250625FS2GQ4757K', 'M. ORTENCIA RODRIGUEZ GUARDADO', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.138', '1900-01-02', '2025-06-07', '2025-06-08', '270', 1),
(758, '20250625OV2JP5758T', 'MA DEL CARMEN CASTORENA TORRES', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.204', '2018-05-28', '2025-06-02', '2025-06-03', '270', 1),
(759, '20250625WU8JM5759X', 'MA ELENA SANCHEZ TORRES', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.162', '2021-07-05', '2025-07-10', '2025-07-11', '270', 1),
(760, '20250625VW8KE5760F', 'MARIA CASTORENA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.145', '2019-04-09', '2025-06-14', '2025-06-15', '270', 1),
(761, '20250625DV7EB7761N', 'MARIA CRISTINA CAMPOS', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.184', '2020-01-16', '2025-06-21', '2025-06-22', '270', 1),
(762, '20250625JH2BZ2762S', 'MARIA DE LA CRUZ CASTORENA GALLEGOS', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.116', '2018-07-06', '2025-07-11', '2025-07-12', '270', 1),
(763, '20250625FS5AM4763G', 'MARIA GUADALUPE FLORES', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.159', '2019-10-15', '2025-10-20', '2025-10-21', '270', 1),
(764, '20250625SL5QP4764H', 'MARICRUZ CAMPOS CASTORENA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4921195637', '', '', '', 1, '', '192.168.27.28', '2020-12-12', '2025-12-17', '2025-12-18', '270', 1),
(765, '20250625FK7PG3765Q', 'MARICRUZ CASTORENA ROSALES ', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4929092223', '', '', '', 1, '', '192.168.27.218', '2020-06-10', '2025-06-15', '2025-06-16', '270', 1),
(766, '20250625XC6ZW6766H', 'MAURICIO MANDUJANO DELGADO', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '27.18', '', '', '', 1, '', '192.168.27.211', '2020-05-27', '2025-06-01', '2025-06-02', '270', 1),
(767, '20250625KW3FF5767C', 'OBDULIA RODRIGUEZ CASTORENA ', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4922007792', '', '', '', 1, '', '192.168.27.196', '2022-10-31', '2025-11-05', '2025-11-06', '270', 1),
(768, '20250625UO1TX6768T', 'OSCAR CASTORENA CAMPOS', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4921354210', '', '', '', 1, '', '', '2022-12-02', '2025-12-07', '2025-12-08', '270', 1),
(769, '20250625DD0FU8769X', 'OSCAR FLORES', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '8328393783', '', '', '', 2, '', '192.168.27.106', '2023-02-08', '2025-06-11', '2025-06-12', '470', 1),
(770, '20250625TH6JB3770F', 'PETRA CASTORENA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.62', '2023-02-21', '2025-06-20', '2025-06-21', '270', 1),
(771, '20250625IS6HR5771V', 'ROLANDO RODRIGUEZ', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.42', '2021-03-03', '2025-06-08', '2025-06-09', '270', 1),
(772, '20250625WL5GV3772F', 'RUBEN QUINTERO CASTORENA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4921723977', '', '', '', 1, '', '192.168.27.43', '2020-09-29', '2025-10-04', '2025-10-05', '270', 1),
(773, '20250625AN7CT7773V', 'SANTOS CASTORENA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4922934841', '', '', '', 1, '', '192.168.27.128', '2023-10-10', '2025-11-01', '2025-11-02', '270', 1),
(774, '20250625AP1OG1774D', 'VICTOR MANUEL ESQUIVEL', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4923146010', '', '', '', 1, '', '192.168.27.159', '2023-12-15', '2025-06-05', '2025-06-06', '270', 1),
(775, '20250625BY9TR7775X', 'YANETH CASTORENA ACOSTA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4922169194', '', '', '', 1, '', '192.168.27.230.', '2023-12-18', '2025-12-07', '2025-12-08', '270', 1),
(776, '20250625JO2FV8776N', 'YENIFER CAMPOS QUIROZ ', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4929005180', '', '', '', 1, '', '192.168.27.84', '2024-02-23', '2025-06-28', '2025-06-29', '270', 1),
(777, '20250625QX5HR7777I', 'YESICA YANET FLORES ESQUIVEL', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '83251620447', '', '', '', 1, '', '', '2024-05-31', '2025-06-05', '2025-06-06', '270', 1),
(778, '20250625KC3QN7778S', 'JUAN MANUEL RODRIGUEZ GALLEGOS', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4921922956', '', '', '', 1, '', '192.168.27.149', '2024-07-11', '2025-07-16', '2025-07-17', '270', 1),
(779, '20250625WJ4HY9779C', 'YOANA HERRERA JACOBO', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.192', '2024-07-25', '2025-07-30', '2025-07-31', '270', 1),
(780, '20250625DX6QZ8780S', 'MARIA MAGDALENA CASTORENA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4929974682', '', '', '', 1, '', '192.168.27.108', '2024-09-19', '2025-09-24', '2025-09-25', '270', 1),
(781, '20250625GH0ON5781N', 'EDUARDO CASTORENA HERRERA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '', '', '', '', 1, '', '192.168.27.84', '2025-02-05', '2025-06-10', '2025-06-11', '270', 1),
(782, '20250625IB4FE2782G', 'IDALIA GARCIA ', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '8323227423', '', '', '', 1, '', '192.168.27.182', '2025-03-18', '2025-06-23', '2025-06-24', '270', 1),
(783, '20250625VH4AA8783Y', 'MIGUEL BELMONTES GARCIA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4921752895', '', '', '', 1, '', '192.168.27.235', '2025-04-23', '2025-06-28', '2025-06-29', '270', 1),
(784, '20250625DC0BH3784N', 'MA EMMA GALLEGOS CASTORENA', '', '', '', 'VIVORITAS', 'GUADALUPE', 'ZACATECAS', 98653, '4921976044', '', '', '', 1, '', '192.168.27.229', '2025-04-24', '2025-06-29', '2025-06-30', '270', 1),
(785, '20250625AH3DC3785R', 'ADRIAN HERNANDEZ ACOSTA', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '4925441986', '', '', '', 1, '', '192.168.28.14', '2023-01-02', '2025-06-16', '2025-06-17', '270', 1),
(786, '20250625AE0MQ7786Y', 'ALICIA JACOBO ASCENCIO', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '4921085820', '', '', '', 1, '', '', '2020-10-08', '2025-10-13', '2025-10-14', '270', 1),
(787, '20250625ON2QV5787X', 'ALMA ROCIO DAVILA TORRES', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '', '2019-11-19', '2025-11-24', '2025-11-25', '270', 1),
(788, '20250625EL0RO3788N', 'AMPARO SANCHEZ HERRERA', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '192.168.28.67', '2025-02-05', '2025-06-10', '2025-06-11', '270', 1),
(789, '20250625OV8FM6789J', 'ANA ISABEL RAMIREZ CAMPOS', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '-', '', '', '', 1, '', '', '2019-07-29', '2025-08-03', '2025-08-04', '270', 1),
(790, '20250625XY5EQ3790G', 'ANA LUZ JACOBO CAMPOS', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '4921029683', '', '', '', 1, '', '', '2020-07-09', '2025-07-14', '2025-07-15', '270', 1),
(791, '20250625KO0EJ0791X', 'ARNULFO JACOBO CASTRO', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '', '2019-10-15', '2025-10-20', '2025-10-21', '270', 1),
(792, '20250625IX5WW9792D', 'BLANCA MARGARITA JACOBO ACOSTA', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '4921303271', '', '', '', 1, '', '', '2020-10-08', '2025-10-13', '2025-10-14', '270', 1),
(793, '20250625WC6NZ2793H', 'CLARA CAMPOS CASTRO', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '4928921059', '', '', '', 1, '', '192.168.28.97', '2020-05-13', '2025-06-18', '2025-06-19', '270', 1),
(794, '20250625SN1ZW7794C', 'DANIEL HERNANDEZ ACOSTA', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '4922254703', '', '', '', 1, '', '192.168.28.123', '2023-03-14', '2025-06-24', '2025-06-25', '270', 1),
(795, '20250625ND2JL4795D', 'ELEUTERIA ACOSTA RAMIREZ', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '192.168.28.99', '2020-01-08', '2025-06-13', '2025-06-14', '270', 1),
(796, '20250625RH2ZJ7796P', 'ELVIA RENTERIA MORALES', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '4921019478', '', '', '', 1, '', '', '2020-07-02', '2025-07-07', '2025-07-08', '270', 1),
(797, '20250625LW0ZP4797X', 'EMILIA HERNANDEZ E', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '4922248628', '', '', '', 1, '', '', '2021-04-08', '2025-06-13', '2025-06-14', '270', 1),
(798, '20250625TI3CW8798B', 'GLORIA HERNANDEZ ESCARE?O', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '4921829042', '', '', '', 1, '', '', '2020-11-03', '2025-11-08', '2025-11-09', '270', 1),
(799, '20250625CI1FN2799P', 'GUILLERMINA TEJEDA', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '', '2020-04-02', '2025-06-07', '2025-06-08', '270', 1),
(800, '20250625EC1ZL4800K', 'HECTOR IVAN JACOBO ARANDAS', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '', '2019-08-08', '2025-08-13', '2025-08-14', '270', 1),
(801, '20250625IZ3SP3801D', 'HECTOR MANUEL HERRERA', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '', '2020-03-18', '2025-06-23', '2025-06-24', '270', 1),
(802, '20250625PT2WM9802B', 'JENIFER CAMPOS (VIVORAS)', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '192.168.27.133', '2018-09-14', '2025-09-19', '2025-09-20', '270', 1),
(803, '20250625EH7JJ0803V', 'JESUS MANUEL JACOBO RENTERIA', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '4445301671', '', '', '', 1, '', '192.168.28.128', '2022-07-15', '2025-07-20', '2025-07-21', '270', 1),
(804, '20250625SE8SC9804B', 'JOSE OMAR LARA GARCIA ( $700 SECUNDARIA  )', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '4921137150', '', '', '', 1, '', '192.168.28.143', '2024-09-11', '2025-09-16', '2025-09-17', '270', 1),
(805, '20250625CX5AN5805I', 'JUAN FRANCISCO PEREA', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '', '2019-11-19', '2025-11-24', '2025-11-25', '270', 1),
(806, '20250625GD9BC4806C', 'JUAN MANUEL MARTINEZ HERNANDEZ (PRIAMRIA)', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '4581172451', '', '', '', 1, '', '192.168.28.141', '2024-02-12', '2025-06-17', '2025-06-18', '270', 1),
(807, '20250625RQ1RD5807D', 'JUANA ELIZABETH DELGADO MONTALVO', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '4929003622', '', '', '', 1, '', '192.168.28.129', '2023-04-03', '2025-06-13', '2025-06-14', '270', 1),
(808, '20250625FI3JR4808X', 'JUANA GONZALEZ BENITEZ-MIGUEL ANGEL PEREA', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '', '2019-08-16', '2025-08-21', '2025-08-22', '270', 1),
(809, '20250625RP6ZO7809B', 'JUANA JACOBO SANCHEZ', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '4928921687', '', '', '', 1, '', '', '2020-03-26', '2025-07-01', '2025-07-02', '270', 1),
(810, '20250625UT8DD1810E', 'MA DEL CARMEN CASTRO HERNANDEZ', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '', '2021-06-08', '2025-06-13', '2025-06-14', '270', 1),
(811, '20250625CN0VI0811X', 'MARCO ANTONIO JACOBO ASCENCIO', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '4922243932', '', '', '', 1, '', ' ', '2022-07-05', '2025-07-10', '2025-07-11', '270', 1),
(812, '20250625AB9MK4812S', 'MARIA DE LA LUZ CERDA JACOBO 400', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '4921242263', '', '', '', 1, '', '', '2020-05-13', '2025-06-18', '2025-06-19', '270', 1),
(813, '20250625JF2QW6813S', 'MARIA DEL CARMEN DE LA CRUZ', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '', '2020-04-30', '2025-06-04', '2025-06-05', '270', 1),
(814, '20250625IA6CV7814I', 'MARIA DEL REFUGIO', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '', '2020-04-14', '2025-06-19', '2025-06-20', '270', 1),
(815, '20250625KZ9AI2815R', 'MARIA JACOBO RODRIGUEZ', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '192.168.28.83', '2021-11-05', '2025-11-10', '2025-11-11', '270', 1),
(816, '20250625CY3WB0816S', 'OLGA DAVILA ROBLES', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '', '2021-06-08', '2025-06-13', '2025-06-14', '270', 1),
(817, '20250625GC7YH0817T', 'OLGA LIDIA BENITEZ', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '', '2020-04-20', '2025-06-25', '2025-06-26', '270', 1),
(818, '20250625JP1RA3818N', 'OSWALDO ABEL DO?A CRUZ', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '', '2019-10-17', '2025-10-22', '2025-10-23', '270', 1),
(819, '20250625VP8QR0819P', 'ROSA MARIA PEREA ARTEAGA', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '192.168.28.117', '2021-12-15', '2025-12-20', '2025-12-21', '270', 1),
(820, '20250625TR6RA3820J', 'SARA GONZALEZ BENITEZ', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '192.168.28.12', '2021-12-29', '2025-06-03', '2025-06-04', '270', 1),
(821, '20250625KH4HQ4821Z', 'STEFANY ALEJANDRA JACOBO PADILLA', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '', '2021-09-30', '2025-10-05', '2025-10-06', '270', 1),
(822, '20250625AZ6TR4822Y', 'VIOLETA HERNANDEZ DE AVILA', '', '', '', 'ENRIQUE ESTRADA', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '192.168.28.121', '2021-12-30', '2025-06-04', '2025-06-05', '270', 1),
(823, '20250625NM1LG8823L', 'ALEXIS DIAZ LOPEZ', '', '', '', 'SANTA CRUZ DE PIEDRAS CARGADAS', 'GENARO CODINA', 'ZACATECAS', 98670, '4927956005', '', '', '', 9, '', '192.168.28.32', '2022-03-31', '2025-06-05', '2025-06-06', '570', 1),
(824, '20250625HO6WN7824A', 'YESI', '', '', '', 'SANTA CRUZ DE PIEDRAS CARGADAS', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '192.168.28.151', '2023-09-21', '2025-09-25', '2025-09-26', '270', 1),
(825, '20250625NS5DF7825A', 'CECILIA ACOSTA JACOBO', '', '', '', 'SANTA CRUZ DE PIEDRAS CARGADAS', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '192.168.28.73', '2020-09-29', '2025-10-04', '2025-10-05', '270', 1),
(826, '20250625PK0XK7826W', 'GRACIELA ESQUIVEL RODRIGUEZ', '', '', '', 'SANTA CRUZ DE PIEDRAS CARGADAS', 'GENARO CODINA', 'ZACATECAS', 98670, '4922519867', '', '', '', 1, '', '192.168.28.132', '2023-06-29', '2025-06-20', '2025-06-21', '270', 1),
(827, '20250625OA2XC6827H', 'JUANA CARMONA', '', '', '', 'SANTA CRUZ DE PIEDRAS CARGADAS', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '192.168.27.16', '2019-05-02', '2025-06-07', '2025-06-08', '270', 1),
(828, '20250625ZL4FW3828P', 'LORENZA ROBLES APARICIO', '', '', '', 'SANTA CRUZ DE PIEDRAS CARGADAS', 'GENARO CODINA', 'ZACATECAS', 98670, '492-893-67-44', '', '', '', 1, '', '192.168.28.76', '2019-11-04', '2025-11-09', '2025-11-10', '270', 1),
(829, '20250625KE3JS8829B', 'MANUEL ANTONIO DIAZ SANCHEZ', '', '', '', 'SANTA CRUZ DE PIEDRAS CARGADAS', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '192.168.28.72', '2020-03-18', '2025-06-23', '2025-06-24', '270', 1),
(830, '20250625NM5CE6830H', 'PAULINA CARMONA', '', '', '', 'SANTA CRUZ DE PIEDRAS CARGADAS', 'GENARO CODINA', 'ZACATECAS', 98670, '', '', '', '', 1, '', '192.168.28.79', '2019-05-02', '2025-06-07', '2025-06-08', '270', 1),
(831, '20250625EP3KG5831K', 'YONI CASTRO LOPEZ', '', '', '', 'SANTA CRUZ DE PIEDRAS CARGADAS', 'GENARO CODINA', 'ZACATECAS', 98670, '492-201-5631', '', '', '', 1, '', '192.168.28.8', '2021-03-03', '2025-06-08', '2025-06-09', '270', 1),
(832, '20250625JG5TJ9832U', 'PAULA ROSALES ROBLES', '', '', '', 'SANTA CRUZ DE PIEDRAS CARGADAS', 'GENARO CODINA', 'ZACATECAS', 98670, '4922297524', '', '', '', 1, '', '192.168.28.145', '2024-11-20', '2025-11-25', '2025-11-26', '270', 1),
(833, '20250625CM6WN9833B', 'AZUCENA VILLANUEVA GUERRERO', '', '', '', 'BARRIO LLANITOS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921287217', '', '', '', 3, '', '192.168.29.237', '2018-08-01', '2025-08-06', '2025-08-07', '260', 1),
(834, '20250625DN9DY5834E', 'NANCY ANGELICA RODRIGUEZ GARCIA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921969705', '', '', '', 3, '', '192.168.2.228', '2021-02-12', '2025-06-17', '2025-06-18', '260', 1),
(835, '20250625RP8DQ2835C', 'CARMEN GUADALUPE ARTEAGA LOPEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921800757', '', '', '', 3, '', '', '2021-09-01', '2025-09-06', '2025-09-07', '260', 1),
(836, '20250625RY5BP0836B', 'ELIA MARTHA FRAGOZO JACOBO', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '458-989-32-10', '', '', '', 3, '', '192.168.34.55', '2019-10-01', '2025-10-06', '2025-10-07', '260', 1),
(837, '20250625XH9XQ5837X', 'ELVIA RODRIGUEZ PUENTES', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4922422797', '', '', '', 3, '', '192.168.32.75', '2020-09-01', '2025-09-06', '2025-09-07', '260', 1),
(838, '20250625AG6ZM9838Q', 'ERENDIDA MARITZA DELGADO MORALES', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581184326', '', '', '', 3, '', '192.168.34.113', '2023-07-01', '2025-07-08', '2025-07-09', '260', 1),
(839, '20250625WL1RF6839M', 'EVELIA MU?OZ ESQUIVEL', '', '', '', 'PALMARITO', 'GENARO CODINA', 'ZACATECAS', 98660, '492-997-2872', '', '', '', 3, '', '192.168.2.223', '2021-05-26', '2025-07-01', '2025-07-02', '260', 1),
(840, '20250625IE6JP0840H', 'FABIOLA OVALLE', '', '', '', 'BARRIO LOS LLANITOS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '192.168.29.81', '2020-04-01', '2025-06-06', '2025-06-07', '260', 1),
(841, '20250625MN0GL5841G', 'FLOR DE MARIA DELGADO PI?ON', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '4581072926', '', '', '', 3, '', '192.168.30.129', '2021-09-01', '2025-09-06', '2025-09-07', '260', 1),
(842, '20250625FN7IN7842X', 'HECTOR ESQUIVEL DELGADO', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '458-119-6203', '', '', '', 3, '', '192.168.32.180.', '2021-03-01', '2025-06-06', '2025-06-07', '260', 1),
(843, '20250625HV9ND4843Q', 'IRENE MARTINEZ LOPEZ CIBER', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4928692351', '', '', '', 3, '', '192.168.29.96', '2017-11-18', '2025-11-23', '2025-11-24', '260', 1),
(844, '20250625MX1CL5844Y', 'JOSE GERARDO CASTRO CU?ADO ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4581065734', '', '', '', 3, '', '192.168.29.145', '2020-05-23', '2025-06-28', '2025-06-29', '260', 1),
(845, '20250625RL4WB7845U', 'JOSE LEONEL HERNANDEZ MURO', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922039986', '', '', '', 3, '', '192.168.34.72', '2020-09-01', '2025-09-06', '2025-09-07', '260', 1),
(846, '20250625XJ9DB0846P', 'JOSE LUIS FRIAS DE LA CRUZ ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '192.168.30.173', '2024-04-01', '2025-06-06', '2025-06-07', '260', 1),
(847, '20250625UC8DR5847Y', 'JUAN MANUEL RAMOS BUGARIN', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921030707', '', '', '', 3, '', '192.168.34.97', '2022-02-01', '2025-06-06', '2025-06-07', '260', 1),
(848, '20250625KN5BU4848C', 'KARLA JUANITA MU?OZ ESQUIVEL ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922564373', '', '', '', 3, '', '192.168.2.158', '2022-10-24', '2025-01-29', '2025-01-30', '260', 2),
(849, '20250625XN0WF8849R', 'LAURO HERNANDEZ LOPEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581033349', '', '', '', 3, '', '192.168.32.251', '2020-09-01', '2025-09-06', '2025-09-07', '260', 1),
(850, '20250625FU0IS5850D', 'MA DEL REFUGIO RODRIGUEZ SAUEDO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '492-171-6518', '', '', '', 3, '', '192.168.30.65', '2024-02-13', '2025-01-18', '2025-01-19', '260', 2),
(851, '20250625BY7VI1851G', 'PASCUALA RODRIGUEZ NORATO', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921594432', '', '', '', 3, '', '192.168.34.117', '2024-04-20', '2025-06-25', '2025-06-26', '260', 1),
(852, '20250625YK9MC0852B', 'PADRE JOSE MARIO ORTEGA DE LIRA', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921215467', '', '', '', 4, '', '192.168.29.75', '2020-03-30', '2025-06-04', '2025-06-05', '410', 1),
(853, '20250625UR0ZQ6853S', 'LUIS DONALDO SANCHEZ ARTEAGA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581437416', '', '', '', 3, '', '192.168.32.145', '2021-08-25', '2025-08-30', '2025-08-31', '260', 1),
(854, '20250625HW4SU1854Y', 'MA GUADALUPE HERNANDEZ ARTEAGA', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922675922', '', '', '', 3, '', '192.168.29.72', '2022-09-23', '2025-06-28', '2025-06-29', '260', 1),
(855, '20250625YI7JE7855Y', 'MA OBDULIA ESQUIVEL SANTANA', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '492119191', '', '', '', 3, '', '192.168.34.87', '2021-01-25', '2025-06-30', '2025-07-01', '260', 1),
(856, '20250625AG7WV5856D', 'MARIA DEL ROSARIO DE LA CRUZ VILLANUEVA', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '192.168.29.158', '2018-08-01', '2025-08-06', '2025-08-07', '260', 1),
(857, '20250625SN5NX4857R', 'MARTINA MARIA GONZALEZ MEDINA', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4928696087', '', '', '', 3, '', '192.168.34.64', '2018-10-01', '2025-10-06', '2025-10-07', '260', 1),
(858, '20250625HZ9EU0858S', 'MIRIAM GARCIA DELGADO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921009805', '', '', '', 3, '', '192.168.29.37', '2021-02-01', '2025-06-06', '2025-06-07', '260', 1),
(859, '20250625RF0FM7859B', 'MISAEL HERNANDEZ HERNANDEZ', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '4922665092', '', '', '', 3, '', '192.168.29.185', '2020-07-01', '2025-07-06', '2025-07-07', '260', 1),
(860, '20250625EP7KV9860H', 'PERLA JAZMIN HERNANDEZ NORATO', '', '', '', 'BARRIO LOS LLANITOS', 'GENARO CODINA', 'ZACATECAS', 98660, '12086166911', '', '', '', 3, '', '192.168.29.227', '2019-11-01', '2025-11-06', '2025-11-07', '260', 1),
(861, '20250625JP7OL2861T', 'PETRA AGUILAR HERNANDEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921068341', '', '', '', 3, '', '192.168.2.242', '2020-10-01', '2025-10-06', '2025-10-07', '260', 1),
(862, '20250625HU8MS2862S', 'RAQUEL CASTRO LOPEZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581272016', '', '', '', 3, '', '192.168.29.69', '2025-04-01', '2025-06-06', '2025-06-07', '260', 1),
(863, '20250625KU9OH2863S', 'MIGUEL ANGEL PEREA ARTEAGA', '', '', '', 'BARRIO EL RINCONSITO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581188540', '', '', '', 3, '', '192.168.29.161', '2022-03-25', '2025-06-30', '2025-07-01', '260', 1),
(864, '20250625EQ9QP3864G', 'RANCHO SANTA FE', '', '', '', 'BARRANCAS DE MARENGO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581216899', '', '', '', 8, '', '192.168.2.211', '2023-01-09', '2025-06-06', '2025-06-07', '1000', 1),
(865, '20250625KV0MC6865G', 'SANDRA PATRICIA HERNANDEZ HERNADEZ', '', '', '', 'BARRIO EL RINCONSITO', 'GENARO CODINA', 'ZACATECAS', 98660, '458-116-1714', '', '', '', 3, '', '192.168.29.194', '2021-02-09', '2025-06-14', '2025-06-15', '260', 1),
(866, '20250625SB4DT4866Q', 'SARAI CASTRO GONZALEZ', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '192.168.30.58', '2018-10-29', '2025-11-03', '2025-11-04', '260', 1),
(867, '20250625UL6DS3867O', 'VERONICA RODRIGUEZ SAUCEDO', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921326762', '', '', '', 3, '', '192.168.32.31', '2023-08-10', '2025-08-06', '2025-08-07', '260', 1),
(868, '20250625NE2BX2868Z', 'VIOLETA ALEJANDRA LOPEZ CASTRO', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921459298', '', '', '', 3, '', '192.168.34.63', '2021-07-01', '2025-07-06', '2025-07-07', '260', 1),
(869, '20250625FD8VH6869O', 'YADIRA MU?OZ SALINAS', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '492-203-5819', '', '', '', 3, '', '192.168.32.218', '2021-02-01', '2025-06-06', '2025-06-07', '260', 1),
(870, '20250625DL9FO4870C', 'ALEJANDRO SANCHEZ ARTEAGA ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921768162', '', '', '', 3, '', '192.168.2.203', '2023-10-02', '2025-10-30', '2025-10-31', '260', 1),
(871, '20250625LX1IS6871J', 'ALBA ELIZABETH GARCIA MU?OZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922665540', '', '', '', 3, '', '192.168.29.199', '2021-10-02', '2025-10-07', '2025-10-08', '260', 1),
(872, '20250625VK3EK4872B', 'ALFREDO HERNANDEZ CASTRO ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4961106978', '', '', '', 3, '', '192.168.2.40', '2021-08-02', '2025-08-07', '2025-08-08', '260', 1),
(873, '20250625YI3PH7873A', 'CARLOS ESQUIVEL MORALES', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922896762', '', '', '', 3, '', '192.168.32.64', '2023-06-02', '2025-07-04', '2025-07-05', '260', 1),
(874, '20250625OA0LP6874E', 'DANIEL HERNANDEZ HINOJOSA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '192.168.32.245', '2020-10-02', '2025-10-07', '2025-10-08', '260', 1),
(875, '20250625ON2RV6875P', 'FATIMA LOPEZ HERNANDEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581068010', '', '', '', 3, '', '192.168.32.129', '2018-07-02', '2025-07-07', '2025-07-08', '260', 1),
(876, '20250625RN0WV3876U', 'GERARDO GARCIA SAUCEDO', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '192.168.29.153', '2018-06-02', '2025-06-07', '2025-06-08', '260', 1),
(877, '20250625KW4QH6877E', 'HECTOR ARMANDO CASTRO', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922461734', '', '', '', 3, '', '192.168.29.49', '2021-12-02', '2025-12-07', '2025-12-08', '260', 1),
(878, '20250625PI5NG9878X', 'IVAN HERNANDEZ', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '4921024791', '', '', '', 3, '', '192.168.30.130', '2019-09-02', '2025-09-07', '2025-09-08', '260', 1),
(879, '20250625LM5GT4879O', 'JUAN ESQUIVEL MARES', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581151563', '', '', '', 3, '', '192.168.32.90', '2016-09-16', '2025-09-21', '2025-09-22', '260', 1),
(880, '20250625YA4CK3880S', 'JUAN MU?OZ SALAZAR', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921602935', '', '', '', 3, '', '192.168.29.110', '2023-02-02', '2025-06-07', '2025-06-08', '260', 1),
(881, '20250625SD3ZP4881H', 'LILIANA ALEJANDRA HERNANDEZ ESQUIVEL', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921120329', '', '', '', 3, '', '192.168.34.59', '2020-09-02', '2025-09-07', '2025-09-08', '260', 1),
(882, '20250625OL7VE2882H', 'MA GUADALUPE REZA MU?OZ', '', '', '', 'COLONIA BUENOS AIRES', 'GENARO CODINA', 'ZACATECAS', 98660, '4581043734', '', '', '', 3, '', '192.168.32.33', '2022-08-02', '2025-08-07', '2025-08-08', '260', 1),
(883, '20250625PO2CL9883G', 'REVERIANO HERNANDEZ MORALES', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '4921013168', '', '', '', 3, '', '192.168.30.86', '2023-08-02', '2025-05-07', '2025-05-08', '260', 2),
(884, '20250625JQ9SE9884J', 'RITA DIOSDADO CAMPOS', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '4589893556', '', '', '', 3, '', '192.168.29.212', '2024-10-02', '2025-06-07', '2025-06-08', '260', 2),
(885, '20250625KV7QJ8885S', 'ROSALBA HERNANDEZ HINOJOSA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '192.168.32.212', '2019-09-02', '2025-09-07', '2025-09-08', '260', 1),
(886, '20250625RA1OL9886X', 'SANTIAGA MONSIVAIS MU?IZ', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921258001', '', '', '', 3, '', '192.168.34.96', '2022-08-02', '2025-08-07', '2025-08-08', '260', 1),
(887, '20250625XH0TC7887S', 'SAUL DIOSDADO DE LA CRUZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921328228', '', '', '', 3, '', '192.168.30.131', '2024-08-02', '2025-08-07', '2025-08-08', '260', 1),
(888, '20250625GD7BD6888E', 'YOLANDA RODRIGUEZ VALDEZ', '', '', '', 'LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4651167066', '', '', '', 3, '', '', '2020-09-02', '2025-09-07', '2025-09-08', '260', 1),
(889, '20250625SE9GB6889Q', 'ANA CRISTINA HERNANDEZ CASTRO', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921603955', '', '', '', 3, '', '192.168.32.119', '2020-06-03', '2025-06-08', '2025-06-09', '260', 1),
(890, '20250625GT1GM7890U', 'BLANCA MONICA ESQUIVEL VALDEZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922462596', '', '', '', 3, '', '192.168.34.121', '2024-06-03', '2025-06-08', '2025-06-09', '260', 1),
(891, '20250625XM1BC9891X', 'BRAYAN OCTAVIO ARTEAGA LARA', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4924920314', '', '', '', 3, '', '192.168.29.203', '2023-09-03', '2025-09-07', '2025-09-08', '260', 1),
(892, '20250625YX8OX1892K', 'BRISA MARIELA GARCIA SAUCEDO', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921010135', '', '', '', 3, '', '192.168.32.242', '2022-01-03', '2025-06-08', '2025-06-09', '260', 1),
(893, '20250625RY2IG9893J', 'CAROLINA ESQUIVEL DELGADO', '', '', '', 'COLONIA BUENOS AIRES', 'GENARO CODINA', 'ZACATECAS', 98660, '19802879642', '', '', '', 3, '', '192.168.32.81', '2018-01-03', '2025-06-08', '2025-06-09', '260', 1),
(894, '20250625FP5DY3894L', 'ERIKA PATRICIA GONZALEZ GARCIA', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922944938', '', '', '', 3, '', '192.168.29.141', '2024-01-03', '2025-06-08', '2025-06-09', '260', 1),
(895, '20250625XO4HO0895S', 'ESMERALDA REZA MARTINEZ', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '192.168.29.103', '2019-01-03', '2025-06-08', '2025-06-09', '260', 1),
(896, '20250625ZB3LZ1896T', 'JAIRO ALBERTO GONZALEZ LOPEZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581059777', '', '', '', 3, '', '192.168.29.28', '2020-06-03', '2025-06-08', '2025-06-09', '260', 1),
(897, '20250625KK7DN7897M', 'JAZMIN MARGARITA BENITEZ HERNANDEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922681851', '', '', '', 3, '', '192.168.32.43', '2022-02-03', '2025-06-08', '2025-06-09', '260', 1),
(898, '20250625YU6QP7898G', 'JOSE FERNANDO ALFEREZ', '', '', '', 'BARRIO LOS LLANITOS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '192.168.29.226', '2016-10-03', '2025-10-08', '2025-10-09', '260', 1),
(899, '20250625BL1XX6899F', 'JUAN MANUEL RODRIGUEZ RODRIGUEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4924925634', '', '', '', 3, '', '192.168.32.102', '2023-08-03', '2025-08-08', '2025-08-09', '260', 1),
(900, '20250625BS1KW6900A', 'JUANA ITZEL GARCIA SANTAMARIA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '449-459-07-90', '', '', '', 3, '', '192.168.32.191', '2019-06-03', '2025-06-08', '2025-06-09', '260', 1),
(901, '20250625CX8TG9901I', 'LIDIA MACIAS MORALES', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4651219311', '', '', '', 3, '', '192.168.32.183', '2019-04-03', '2025-06-08', '2025-06-09', '260', 1),
(902, '20250625TI2TG5902O', 'MA DE LOS ANGELES RODRIGUEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921405488', '', '', '', 3, '', '192.168.34.122', '2024-07-03', '2025-07-08', '2025-07-09', '260', 1),
(903, '20250625TN4XM7903D', 'NAICKY SELENE SANTANA MU?OZ', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922232763', '', '', '', 3, '', '192.168.34.88', '2020-06-03', '2025-06-08', '2025-06-09', '260', 1),
(904, '20250625WV3BV5904Y', 'NEREIDA SELENE SANCHEZ HERNANDEZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '192.168.32.194', '2024-10-03', '2025-10-08', '2025-10-09', '260', 1),
(905, '20250625GR0BG9905K', 'NOE ESQUIVEL', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4921457494', '', '', '', 3, '', '32.246', '2020-01-03', '2025-06-08', '2025-06-09', '260', 1),
(906, '20250625TX4BQ7906W', 'PATRICIA SAUCEDO HERNANDEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.168', '2018-10-28', '2025-11-02', '2025-11-03', '260', 1),
(907, '20250625SQ8NJ6907F', 'RODRIGO RODRIGUEZ LOPEZ', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4921296052', '', '', '', 3, '', '32.13', '2022-10-03', '2025-10-08', '2025-10-09', '260', 1),
(908, '20250625ZS5ZG7908W', 'ROSALIA MORALES VALDEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4581283547', '', '', '', 3, '', '30.88', '2022-01-03', '2025-06-08', '2025-06-09', '260', 1),
(909, '20250625FJ0BS2909J', 'SEGURIDAD PUBLICA', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '*', '', '', '', 3, '', '29.252', '2023-11-03', '2025-11-08', '2025-11-09', '260', 1),
(910, '20250625LJ4BS5910Q', 'VIOLETA FRIAS GUERRERO', '', '', '', 'BARRIO EL RINCONSITO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921290292', '', '', '', 3, '', '29.244', '2019-09-03', '2025-04-08', '2025-04-09', '260', 2),
(911, '20250625BI4ZP7911K', 'YOANA HERNANDEZ CASTRO', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '4581076960', '', '', '', 3, '', '29.79', '2020-04-03', '2025-06-08', '2025-06-09', '260', 1),
(912, '20250625UQ1BH9912C', 'YURIDIANA RODRIGUEZ ARTEAGA', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.218', '2018-01-03', '2025-06-08', '2025-06-09', '260', 1),
(913, '20250625BQ7AR0913S', 'ALEJANDRA ISABEL LOPEZ CHAVEZ', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.111', '2019-10-04', '2025-01-09', '2025-01-10', '260', 2),
(914, '20250625TO1KE3914F', 'ANDRES ESQUIVEL FRIAS', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4581071916', '', '', '', 3, '', '32.148', '2022-04-04', '2025-06-09', '2025-06-10', '260', 1),
(915, '20250625QV4AR4915P', 'ANGELICA ACOSTA MU?OZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922907169', '', '', '', 3, '', '2.253', '2020-08-04', '2025-08-09', '2025-08-10', '260', 1),
(916, '20250625AD7MR3916O', 'AZUCENA CASTRO DOMINGUEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921321634', '', '', '', 3, '', '30.68', '2017-04-12', '2025-06-17', '2025-06-18', '260', 1),
(917, '20250625YL9VP4917B', 'BRANDON FABIAN MORALES DE LA CRUZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921028687', '', '', '', 3, '', '29.6', '2024-04-04', '2025-06-09', '2025-06-10', '260', 1);
INSERT INTO `clientes` (`id`, `folio`, `nombre`, `domicilio`, `calle`, `colonia`, `comunidad`, `municipio`, `estado`, `cp`, `telefono`, `referencias`, `identificacion`, `comprobante`, `servicio`, `antena`, `direccionip`, `fecha_contrato`, `fecha_limite`, `fecha_corte`, `cuota`, `estatus`) VALUES
(918, '20250625IX7RV8918F', 'DANIEL ESQUIVEL MU?OZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4587044897', '', '', '', 3, '', '32.193', '2024-07-04', '2025-07-09', '2025-07-10', '260', 1),
(919, '20250625QT3DQ1919K', 'FABIOLA MANDUJANO ESQUIVEL', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '2.249', '2020-08-04', '2025-08-09', '2025-08-10', '260', 1),
(920, '20250625MM5BU3920R', 'GABRIELA HINOJOSA ROQUE', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922654022', '', '', '', 3, '', '2.16', '2022-11-04', '2025-11-09', '2025-11-10', '260', 1),
(921, '20250625WY8AX2921Z', 'JOSE MANUEL HERNANDEZ MU?OZ ', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '4581173499', '', '', '', 3, '', '30.137', '2024-05-04', '2025-06-09', '2025-06-10', '260', 1),
(922, '20250625HA5MZ2922H', 'MARIA GUADALUPE MARES TORRES', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581277638', '', '', '', 3, '', '32.5', '2022-01-04', '2025-06-09', '2025-06-10', '260', 1),
(923, '20250625FT5OG2923A', 'MARIA GUADALUPE RODRIGUEZ RODRIGUEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921229869', '', '', '', 3, '', '33.153', '2023-07-04', '2025-07-17', '2025-07-18', '260', 1),
(924, '20250625TV2MI7924Z', 'MARIA NATIVIDAD HERNANDEZ SALINAS', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581022435', '', '', '', 3, '', '32.38', '2022-05-04', '2025-06-09', '2025-06-10', '260', 1),
(925, '20250625PL8TW6925G', 'MAYRA ESQUIVEL JACOBO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921500211', '', '', '', 3, '', '32.57', '2020-06-04', '2025-06-09', '2025-06-10', '260', 1),
(926, '20250625ZL1SG0926P', 'ORALIA GUADALUPE CARDONA MU?OZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '492-989-4297', '', '', '', 3, '', '32.228', '2019-10-19', '2025-10-24', '2025-10-25', '260', 1),
(927, '20250625MM9HL4927Q', 'OLGA DOMINGUEZ GONZALEZ', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921321634', '', '', '', 3, '', '29.42', '2020-11-25', '2025-11-30', '2025-12-01', '260', 1),
(928, '20250625CZ9XR9928A', 'PASCUALA VALDEZ ', '', '', '', 'BARRIO EL RINCONSITO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.14', '2020-08-04', '2025-05-09', '2025-05-10', '260', 2),
(929, '20250625ZX2SN8929G', 'SARA LOPEZ ESQUIVEL', '', '', '', 'LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4581036231', '', '', '', 3, '', '32.214', '2019-09-04', '2025-09-09', '2025-09-10', '260', 1),
(930, '20250625WJ7FD2930Z', 'SERGIO MU?OZ ARTEAGA', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4589892092', '', '', '', 3, '', '30.124', '2023-04-04', '2025-06-09', '2025-06-10', '260', 1),
(931, '20250625ZD5KN6931C', 'SILVIA CASTRO HINOJOSA', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '492143-6138', '', '', '', 3, '', '30.52', '2020-05-04', '2025-06-09', '2025-06-10', '260', 1),
(932, '20250625VU3XV9932U', 'SILVIA DURAN VAZQUEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4493666880', '', '', '', 3, '', '30.71', '2025-02-04', '2025-06-09', '2025-06-10', '260', 1),
(933, '20250625NT2AL6933D', 'YOLANDA SANTAMARIA VALDEZ', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922954091', '', '', '', 3, '', '29.225', '2024-12-04', '2025-12-09', '2025-12-10', '260', 1),
(934, '20250625RT2OE2934Q', 'YOLIBETH ACOSTA MARTINEZ', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581232444', '', '', '', 3, '', '29.2', '2021-03-04', '2025-06-09', '2025-06-10', '260', 1),
(935, '20250625NR7VC7935U', 'ALMA ROSA HERNANDEZ SALINAS', '', '', '', 'COLONIA BUENOS AIRES', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.78', '2018-03-05', '2025-06-10', '2025-06-11', '260', 1),
(936, '20250625UO5DM6936J', 'ABELARDO GARCIA SAUCEDO', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4924109071', '', '', '', 3, '', '29.27', '2023-04-05', '2025-06-10', '2025-06-11', '260', 1),
(937, '20250625JI5FK4937R', 'MONICA LIZETH GARCIA MU?OZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581065429', '', '', '', 3, '', '29.36', '2021-09-25', '2025-09-30', '2025-10-01', '260', 1),
(938, '20250625ME6YV6938X', 'AVELINA CASTRO TORRES ', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922035436', '', '', '', 3, '', '29.119', '2023-04-05', '2025-06-10', '2025-06-11', '260', 1),
(939, '20250625XY1PC2939H', 'CARLA MARTINEZ JACOBO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921765666', '', '', '', 3, '', '32.152', '2023-09-05', '2025-09-09', '2025-09-10', '260', 1),
(940, '20250625AS0NR1940D', 'COBAEZ SALA DE MAESTROS ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.163', '2022-09-05', '2025-09-10', '2025-09-11', '260', 1),
(941, '20250625YR4NP8941G', 'CHRISTIAN FERNANDO GARCIA CASTRO', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4923187660', '', '', '', 3, '', '29.176', '2022-09-05', '2025-09-10', '2025-09-11', '260', 1),
(942, '20250625VD0AD9942Q', 'DIEGO RODRIGUEZ RODRIGUEZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921727239', '', '', '', 3, '', '32.88', '2018-02-05', '2025-06-10', '2025-06-11', '260', 1),
(943, '20250625JE4SD3943V', 'FABIOLA SAUCEDO CASTRO', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922646819', '', '', '', 3, '', '32.216', '2020-10-05', '2025-10-10', '2025-10-11', '260', 1),
(944, '20250625ZT6WH1944W', 'FATIMA ROQUE SAUCEDO ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921295623', '', '', '', 3, '', '29.53', '2024-03-05', '2025-06-10', '2025-06-11', '260', 1),
(945, '20250625NB0AB5945Y', 'HERMELINDA SAUCEDO CASTRO', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921734876', '', '', '', 3, '', '34.61', '2021-10-05', '2025-10-10', '2025-10-11', '260', 1),
(946, '20250625SX3DC3946C', 'HERNAN MORALES GARCIA', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.55', '2016-04-05', '2025-06-10', '2025-06-11', '260', 1),
(947, '20250625TC4QI9947B', 'IRIDIER BODEGA', '', '', '', '', 'GENARO CODINA', 'ZACATECAS', 98660, '-', '', '', '', 3, '', '', '2025-03-05', '2025-06-10', '2025-06-11', '260', 1),
(948, '20250625XR1HZ1948B', 'ENLACE PALMARO', '', '', '', '', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '', '2025-03-05', '2025-06-10', '2025-06-11', '260', 1),
(949, '20250625RI8FJ5949U', 'LILIA ESQUIVEL VALDEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.171', '2023-01-05', '2025-06-10', '2025-06-11', '260', 1),
(950, '20250625TC9ZM2950L', 'MANUEL MU?OZ PUENTE', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921067598', '', '', '', 3, '', '32.69', '2020-06-05', '2025-06-10', '2025-06-11', '260', 1),
(951, '20250625YU4AR2951N', 'J MANUEL SALINAS ROMAN', '', '', '', 'LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4581092084', '', '', '', 3, '', '32.225', '2023-12-05', '2025-12-10', '2025-12-11', '260', 1),
(952, '20250625VS3RW4952U', 'MARIA DE LOS ANGELES LOPEZ ESQUIVEL', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4589891746', '', '', '', 3, '', '32.24', '2020-08-05', '2025-08-10', '2025-08-11', '260', 1),
(953, '20250625UZ7SN2953T', 'MARIA ELENA SALAZAR GARCIA', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581230403', '', '', '', 3, '', '32.112', '2017-05-05', '2025-06-10', '2025-06-11', '260', 1),
(954, '20250625ID1KN0954S', 'MAURILIO CHAVEZ RENTA', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.121', '2016-04-05', '2025-06-10', '2025-06-11', '160', 1),
(955, '20250625KU1HF8955E', 'MIGUEL MARTINEZ ESQUIVEL', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.108', '2017-12-05', '2025-12-10', '2025-12-11', '260', 1),
(956, '20250625UV8MA4956C', 'NANCY JAZMIN SAUCEDO CASTRO', '', '', '', 'COLONIA BUENOS AIRES', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.98', '2016-10-05', '2025-10-10', '2025-10-11', '260', 1),
(957, '20250625QS2QU8957Y', 'RODOLFO ARTEAGA SAUCEDO', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581098486', '', '', '', 3, '', '29.152', '2020-06-05', '2025-06-10', '2025-06-11', '260', 1),
(958, '20250625ZJ2ZE6958D', 'RODRIGO CASTRO FLORES', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4928702508', '', '', '', 3, '', '32.16', '2019-01-05', '2025-06-10', '2025-06-11', '260', 1),
(959, '20250625YN3AC5959E', 'ROSENDO HERNANDEZ CHAVEZ', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.134', '2017-09-05', '2025-09-10', '2025-09-11', '260', 1),
(960, '20250625WY4QS9960Z', 'ANTONIO RAMOS GARCIA', '', '', '', 'BARRIO LLANITOS', 'GENARO CODINA', 'ZACATECAS', 98660, '4581099312', '', '', '', 3, '', '29.87', '2022-08-06', '2025-08-11', '2025-08-12', '260', 1),
(961, '20250625IB9CZ6961C', 'FRANCISCO DURAN VAZQUEZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581302289', '', '', '', 3, '', '29.91', '2022-10-04', '2025-10-09', '2025-10-10', '260', 1),
(962, '20250625IO8OY4962P', 'CELIA PUENTE AGUILAR', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.82', '2017-05-06', '2025-06-11', '2025-06-12', '260', 1),
(963, '20250625EX0HZ4963P', 'GERARDO DE JESUS HERNANDEZ ESQUIVEL', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4924938224', '', '', '', 3, '', '30.72', '2022-08-06', '2025-08-11', '2025-08-12', '260', 1),
(964, '20250625DU0JP1964P', 'GLORIA ISABEL ACOSTA MU?OZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581075298', '', '', '', 3, '', '2.222', '2021-07-06', '2025-07-11', '2025-07-12', '260', 1),
(965, '20250625SK2NK9965X', 'JERONIMA ACOSTA MU?OZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921045310', '', '', '', 3, '', '2.248', '2020-07-06', '2025-07-11', '2025-07-12', '260', 1),
(966, '20250625HI1YQ0966F', 'JOSEFINA RODRIGUEZ PUENTES ', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4921793286', '', '', '', 3, '', '32.235', '2023-11-06', '2025-11-10', '2025-11-11', '260', 1),
(967, '20250625NG9NR6967U', 'LUCERO EDITH VENEGAS', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '5580162744', '', '', '', 3, '', '29.84', '2020-04-06', '2025-06-11', '2025-06-12', '260', 1),
(968, '20250625HC4RT1968G', 'MANUEL JACOBO CASTRO', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.151', '2018-12-06', '2025-12-11', '2025-12-12', '260', 1),
(969, '20250625DF8PP2969E', 'VIVIANA SAUCEDO ALVARADO', '', '', '', 'BARRIO EL RINCONSITO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921596349', '', '', '', 3, '', '29.165', '2018-09-20', '2025-01-25', '2025-01-26', '260', 2),
(970, '20250625YH1BO9970W', 'RAMIRO FRIAS SANTAMARIA', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581295985', '', '', '', 3, '', '30.122', '2021-09-06', '2025-09-11', '2025-09-12', '260', 1),
(971, '20250625MG6GA8971J', 'SARAI PUENTE RODRIGUEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 4, '', '32.101', '2023-05-06', '2025-06-11', '2025-06-12', '460', 1),
(972, '20250625FQ5ZM0972G', 'SILVIA ESQUIVEL JACOBO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922241424', '', '', '', 3, '', '32.159', '2021-07-06', '2025-07-11', '2025-07-12', '260', 1),
(973, '20250625WA6UM2973B', 'SUSANA HERNANDEZ CASTRO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '34.1', '2019-02-06', '2025-06-11', '2025-06-12', '260', 1),
(974, '20250625HT7XS7974P', 'ADRIANA HERNANDEZ MU?OZ', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.62', '2017-10-05', '2025-10-10', '2025-10-11', '260', 1),
(975, '20250625CG7PJ3975N', 'ANA LAURA VALDEZ MU?OZ', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4491974037', '', '', '', 3, '', '32.72', '2024-03-07', '2025-06-12', '2025-06-13', '260', 1),
(976, '20250625CR6WQ7976I', 'AGUSTIN SALINAS SAUCEDO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.52', '2016-11-07', '2025-11-12', '2025-11-13', '260', 1),
(977, '20250625TZ2UJ0977U', 'ELIDE GUADALUPE GONZALEZ GARCIA', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921798442', '', '', '', 3, '', '30.96', '2023-07-07', '2025-07-11', '2025-07-12', '260', 1),
(978, '20250625LQ2UR3978E', 'ERIKA LORENA CASTRO RODRIGUEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921267592', '', '', '', 3, '', '32.108', '2019-01-07', '2025-06-12', '2025-06-13', '260', 1),
(979, '20250625OQ3ZX5979Y', 'HERMINIA MIRANDA ALMENDARIS', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4928697417', '', '', '', 3, '', '32.176', '2019-03-07', '2025-03-12', '2025-03-13', '260', 2),
(980, '20250625AG5PR4980E', 'HUMBERTO HERNANDEZ DELGADO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922450642', '', '', '', 3, '', '2.198', '2019-03-07', '2025-06-12', '2025-06-13', '260', 1),
(981, '20250625XV3EU9981V', 'JOSHUA GARCIA DELGADO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4922465930', '', '', '', 3, '', '29.5', '2023-12-07', '2025-12-10', '2025-12-11', '260', 1),
(982, '20250625ZQ0SX2982X', 'NANCY LILIANA MARES ESPINOZA', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922052598', '', '', '', 3, '', '32.105', '2023-09-07', '2025-09-12', '2025-09-13', '260', 1),
(983, '20250625ZF8TZ6983Z', 'LILIANA SALINAS ARTEAGA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581216436', '', '', '', 3, '', '34.65', '2017-02-07', '2025-06-12', '2025-06-13', '260', 1),
(984, '20250625FM2FG9984A', 'MARGARITA MONTALVO VILLALOBOS', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921325772', '', '', '', 3, '', '29.4', '2025-06-25', '2025-06-30', '2025-07-01', '260', 1),
(985, '20250625BH9PW5985G', 'MIREYA JAZMIN ARTEAGA ESCALERA', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581155460', '', '', '', 3, '', '34.85', '2020-05-07', '2025-06-12', '2025-06-13', '260', 1),
(986, '20250625SU0DH1986C', 'RODOLFO SAUCEDO CASTRO', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581363337', '', '', '', 3, '', '30.123', '2022-07-07', '2025-07-12', '2025-07-13', '260', 1),
(987, '20250625KD7ZS9987O', 'YOLANDA MARTELL MONTALVO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4929497769', '', '', '', 3, '', '2.48', '2024-09-07', '2025-09-12', '2025-09-13', '260', 1),
(988, '20250625SJ8AX1988A', 'YOLANDA MU?OZ CASTRO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.232', '2024-07-07', '2025-07-12', '2025-07-13', '260', 1),
(989, '20250625QV1TE1989D', 'SAUL MORENO MORALES', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921814279', '', '', '', 4, '', '29.157', '2018-07-07', '2025-07-12', '2025-07-13', '460', 1),
(990, '20250625LV0GT9990N', 'ALEJANDRA QUIROZ ROSALES', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921956827', '', '', '', 3, '', '2.22', '2022-06-06', '2025-06-11', '2025-06-12', '260', 1),
(991, '20250625FY0GC1991R', 'BEATRIZ ARELI ARTEAGA MORALES', '', '', '', '', 'GENARO CODINA', 'ZACATECAS', 98660, '4581035458', '', '', '', 3, '', '32.111', '2024-03-08', '2025-06-13', '2025-06-14', '260', 1),
(992, '20250625YW3WU4992I', 'CARLOS EDUARDO MORALES CALDERA', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921421336', '', '', '', 3, '', '29.47', '2020-12-08', '2025-12-13', '2025-12-14', '260', 1),
(993, '20250625IT2CZ7993Y', 'CELINA ESQUIVEL CASTRO', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '6825596734', '', '', '', 3, '', '32.116', '2022-08-08', '2025-08-13', '2025-08-14', '260', 1),
(994, '20250625JN0KP4994F', 'CLARA CASTRO DIOSDADO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4925445632', '', '', '', 3, '', '29.198', '2021-09-08', '2025-09-13', '2025-09-14', '260', 1),
(995, '20250625ZG0PI3995G', 'DALIA RUBI SALINAS ESQUIVEL', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922025246', '', '', '', 3, '', '29.138', '2022-04-08', '2025-06-13', '2025-06-14', '260', 2),
(996, '20250625FW4JM8996S', 'MARIA DE LOURDES MORALES', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '12195663768', '', '', '', 3, '', '34.74', '2022-01-08', '2025-06-13', '2025-06-14', '260', 1),
(997, '20250625ZA0LS8999I', 'GUARDIA NACIONAL', '', '', '', 'ENTRONQUE', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.15', '2024-01-18', '2025-06-23', '2025-06-24', '200', 1),
(998, '20250625NB8MM71000I', 'GUILLERMINA FRIAS', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.6', '2017-10-08', '2025-10-13', '2025-10-14', '260', 1),
(999, '20250625WR6OU91001Q', 'ISRAEL HERNANDEZ SAUCEDO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4581297473', '', '', '', 3, '', '30.94', '2023-02-08', '2025-06-13', '2025-06-14', '260', 1),
(1000, '20250625FF2KC21002L', 'JOSE GERARDO MU?OZ VALDEZ', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4581155048', '', '', '', 3, '', '32.239', '2021-01-08', '2025-06-13', '2025-06-14', '260', 1),
(1001, '20250625VF5HO61003R', 'JUAN MANUEL SAUCEDO MACIAS', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4922010929', '', '', '', 3, '', ' ', '2021-11-08', '2025-11-13', '2025-11-14', '260', 1),
(1002, '20250625FW8ZB51004X', 'JUAN PABLO SAUCEDO HERNANDEZ', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.213', '2022-07-08', '2025-07-13', '2025-07-14', '260', 1),
(1003, '20250625TU4QR11005A', 'MANUEL MACIAS HERNANDEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4581104270', '', '', '', 3, '', '29.124', '2017-03-08', '2025-06-13', '2025-06-14', '260', 1),
(1004, '20250625AL7GJ31006V', 'MARIA EDITH FRIAS CASTRO', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4925441573', '', '', '', 3, '', '30.119', '2023-05-08', '2025-06-13', '2025-06-14', '260', 1),
(1005, '20250625XM4ZL31007M', 'MARIA DEL CARMEN MORALES CASTRO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921623971', '', '', '', 3, '', '29.113', '2021-05-08', '2025-06-13', '2025-06-14', '260', 1),
(1006, '20250625VI4ME71008W', 'MARIA GUADALUPE GARCIA HERNANDEZ ESTETICA', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.125', '2017-03-08', '2025-06-13', '2025-06-14', '260', 1),
(1007, '20250625ZP6HZ61009O', 'RAMIRO FLORES SAN ISIDRO', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.73', '2017-11-08', '2025-11-13', '2025-11-14', '260', 1),
(1008, '20250625OO9MZ91010P', 'ROSA PADILLA', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921136641', '', '', '', 3, '', '29.135', '2017-03-08', '2025-06-13', '2025-06-14', '260', 1),
(1009, '20250625GN7QZ31011R', 'SALVADOR SANTANA REZA', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '469-583-3627', '', '', '', 3, '', '34.102', '2021-06-10', '2025-06-15', '2025-06-16', '260', 1),
(1010, '20250625FG7VJ91012T', 'SUSANA HERNANDEZ SAUCEDO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4581165670', '', '', '', 3, '', '30.81', '2020-12-08', '2025-12-13', '2025-12-14', '260', 1),
(1011, '20250625PT6UB41013L', 'ZULEMA JAZMIN TORRES ARENAS', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921037863', '', '', '', 3, '', '32.62', '2023-05-08', '2025-06-13', '2025-06-14', '260', 1),
(1012, '20250625RJ8JI51014C', 'GAMALIEL RAMIREZ PI?ON', '', '', '', 'BARRIO LOS LLANITOS', 'GENARO CODINA', 'ZACATECAS', 98660, '4922890374', '', '', '', 3, '', '29.222', '2023-01-09', '2025-06-13', '2025-06-14', '260', 1),
(1013, '20250625AE2WM01015R', 'ALONDRA JIMENEZ', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4581178118', '', '', '', 3, '', '32.56', '2025-01-09', '2025-02-14', '2025-02-15', '260', 2),
(1014, '20250625SY0EQ31016P', 'JORGE HERRERA RAMIREZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581094496', '', '', '', 3, '', '2.233', '2020-10-09', '2025-10-14', '2025-10-15', '260', 1),
(1015, '20250625GF8KT61017T', 'MA ALEJANDRA LOPEZ MURO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '45811024791', '', '', '', 3, '', '30.5', '2024-05-09', '2025-06-14', '2025-06-15', '260', 1),
(1016, '20250625KX1TZ91018P', 'MARTHA ALICIA HERNANDEZ HERNANDEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581044358', '', '', '', 3, '', '2.234', '2020-10-09', '2025-10-14', '2025-10-15', '260', 1),
(1017, '20250625ES1LH81019Y', 'REMIGIO FRIAS SANTAMARIA', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922387437', '', '', '', 3, '', '29.246', '2025-06-25', '2025-06-30', '2025-07-01', '260', 1),
(1018, '20250625XA7KK81020X', 'ROSA MARIA ESQUIVEL JACOBO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922945253', '', '', '', 3, '', '32.125', '2021-10-09', '2025-10-14', '2025-10-15', '260', 1),
(1019, '20250625HG9VI21021P', 'ROSA MARIA SOTO ESQUIVEL', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581020145', '', '', '', 3, '', '32.185', '2024-10-09', '2025-10-14', '2025-10-15', '260', 1),
(1020, '20250625FK0VX61022G', 'VICTOR HUGO ORTIZ TREJO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922238846', '', '', '', 3, '', '2.204', '2023-10-09', '2025-10-14', '2025-10-15', '260', 1),
(1021, '20250625MY7OA61023Q', 'ALONDRA CAMPOS CARDONA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922894315', '', '', '', 3, '', '34.101', '2022-11-10', '2025-11-15', '2025-11-16', '260', 1),
(1022, '20250625UW9GQ41024K', 'CRUZ GARCIA ZAMORA', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4922013222', '', '', '', 3, '', '30.69', '2018-01-10', '2025-06-15', '2025-06-16', '260', 1),
(1023, '20250625BZ8AX51025F', 'EVANGELINA SANTANA CASTRO', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922931724', '', '', '', 3, '', '34.89', '2020-12-22', '2025-12-27', '2025-12-28', '260', 1),
(1024, '20250625AY9IF21026P', 'FATIMA HERNANDEZ CAMPOS', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921768955', '', '', '', 3, '', '2.151', '2025-02-10', '2025-06-15', '2025-06-16', '260', 1),
(1025, '20250625UD9CI91027Y', 'FATIMA LIZBETH LOPEZ MURO', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.172', '2018-10-10', '2025-06-15', '2025-06-16', '260', 1),
(1026, '20250625WY5SE31028W', 'FLOR RAMIREZ CHAVEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4581197314', '', '', '', 3, '', '30.91', '2017-01-10', '2025-06-15', '2025-06-16', '260', 1),
(1027, '20250625JQ0CH61029W', 'GUILLERMINA HERNANDEZ HINOJOSA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922230840', '', '', '', 3, '', '32.109', '2020-11-10', '2025-11-15', '2025-11-16', '260', 1),
(1028, '20250625GN8QN41030Q', 'HORTENCIA ESQUIVEL HERNANDEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4922927946', '', '', '', 3, '', '30.8', '2022-08-10', '2025-08-15', '2025-08-16', '260', 1),
(1029, '20250625GU8IA01031Q', 'JOSE ANGEL JACOBO ACOSTA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '2.195', '2022-09-10', '2025-09-15', '2025-09-16', '260', 1),
(1030, '20250625XM8KR61032L', 'JOSE ANGEL MU?OZ DURAN', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.59', '2022-06-10', '2025-06-15', '2025-06-16', '260', 1),
(1031, '20250625MK3QI81033P', 'JOSE MANUEL HERNANDEZ SAUCEDO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.95', '2023-02-10', '2025-06-15', '2025-06-16', '260', 1),
(1032, '20250625ZK6VP41034H', 'LUIS GUILLERMO CARLO BASURTO LOPEZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581035228', '', '', '', 3, '', '29.35', '2022-08-10', '2025-08-15', '2025-08-16', '260', 1),
(1033, '20250625LT6GE51035U', 'MARIA ALONDRA MU?OZ SALINAS', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.79', '2016-08-10', '2025-08-15', '2025-08-16', '260', 1),
(1034, '20250625RQ8NF81036E', 'MARCOS RAMIREZ MACIAS', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921622134', '', '', '', 3, '', '2.15', '2025-02-10', '2025-06-15', '2025-06-16', '260', 1),
(1035, '20250625UY0SP41037P', 'MARIA ARCELIA GUERRERO HERNANDEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921031988', '', '', '', 3, '', '2.144', '2022-02-10', '2025-06-15', '2025-06-16', '260', 1),
(1036, '20250625CO5QV11038H', 'MAYRA VILLANUEVA HERNANDEZ', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581288483', '', '', '', 3, '', '29.83', '2025-02-10', '2025-06-15', '2025-06-16', '260', 1),
(1037, '20250625WK3BH81039L', 'NANCY CASTRO RAMOS', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '4924937180', '', '', '', 3, '', '', '2022-05-10', '2025-06-15', '2025-06-16', '260', 1),
(1038, '20250625FT0DX01040S', 'PERLA RUBI ESQUIVEL VALDEZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922893112', '', '', '', 3, '', '34.52', '2022-11-10', '2025-11-15', '2025-11-16', '260', 1),
(1039, '20250625JF4SN91041S', 'ROBERTO SANTANA MU?OZ', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581185872', '', '', '', 3, '', '34.75', '2017-11-11', '2025-11-16', '2025-11-17', '260', 1),
(1040, '20250625OU4MP01042I', 'ROSENDO GONZALEZ ROQUE', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581189358', '', '', '', 3, '', '32.248', '2020-11-10', '2025-11-15', '2025-11-16', '260', 1),
(1041, '20250625LZ5UT61043E', 'YULIANA ALELI LOPEZ ESQUIVEL', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.142', '2018-11-10', '2025-11-15', '2025-11-16', '260', 1),
(1042, '20250625HQ7GB41044J', 'ADRIANA VILLALOBOS HERNANDEZ', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4581164489', '', '', '', 3, '', '32.179', '2019-03-11', '2025-06-16', '2025-06-17', '260', 1),
(1043, '20250625CL8FM41045B', 'ALONDRA NAYELI HERNANDEZ NORATO', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 4, '', '29.93', '2018-04-11', '2025-06-16', '2025-06-17', '410', 2),
(1044, '20250625GP4YV71046M', 'ANA ROSA RODRIGUEZ SAUCEDO', '', '', '', 'LA AGUA ZARCA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581282699', '', '', '', 3, '', '29.18', '2022-07-11', '2025-06-16', '2025-06-17', '260', 2),
(1045, '20250625KB3OI41047Z', 'BRENDA PADILLA SANTANA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922037337', '', '', '', 3, '', '32.226', '2020-08-11', '2025-08-16', '2025-08-17', '260', 1),
(1046, '20250625CK0XY11048T', 'CANDIDO ARTEAGA LOPEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581181948', '', '', '', 3, '', '32.209', '2018-04-11', '2025-06-16', '2025-06-17', '260', 1),
(1047, '20250625YP9XR61049L', 'CENTRO DE SALUD GENARO CODINA', '', '', '', 'BARRIO LLANITOS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921288598', '', '', '', 9, '', '29.231', '2020-11-11', '2025-11-16', '2025-11-17', '301', 1),
(1048, '20250625AW6VC01050R', 'CLAUDIA MARES ESQUIVEL', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921814573', '', '', '', 3, '', '34.71', '2020-09-11', '2025-09-16', '2025-09-17', '260', 1),
(1049, '20250625QC3AF21051O', 'CLAUDIA YANETH LOPEZ LOPEZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581287423', '', '', '', 3, '', '34.57', '2019-04-11', '2025-06-16', '2025-06-17', '260', 1),
(1050, '20250625EY0KW01052M', 'DIANA LAURA GARCIA GONZALEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921464273', '', '', '', 3, '', '32.1', '2021-06-11', '2025-06-16', '2025-06-17', '260', 1),
(1051, '20250625NL1LC41053J', 'EZEQUIEL MARES ESPINOZA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581364658', '', '', '', 3, '', '32.238', '2020-08-11', '2025-08-16', '2025-08-17', '260', 1),
(1052, '20250625BA4ND11054E', 'FEDERICO VALDEZ REYES', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '4922339136', '', '', '', 3, '', '30.128', '2017-12-11', '2025-12-16', '2025-12-17', '260', 1),
(1053, '20250625AE8GA61055V', 'JESUS EDUARDO MARTINEZ ARENAS', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921282830', '', '', '', 3, '', '32.123', '2025-02-11', '2025-06-16', '2025-06-17', '260', 1),
(1054, '20250625TD9FT31056S', 'JUANA HERNANDEZ GARCIA', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922390343', '', '', '', 3, '', '32.126', '2023-04-11', '2025-06-16', '2025-06-17', '260', 1),
(1055, '20250625KM3FO41057B', 'MA GUADALUPE HERNANDEZ JACOBO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921790801', '', '', '', 3, '', '29.191', '2024-03-11', '2025-06-16', '2025-06-17', '260', 1),
(1056, '20250625DB5XF61058R', 'MARGARITA CHAVEZ HERRERA', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581198021', '', '', '', 3, '', '29.232', '2025-04-11', '2025-06-16', '2025-06-17', '260', 1),
(1057, '20250625HU5AM91059V', 'MARIA GUADALUPE HERNANDEZ DIOSDADO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '2.231', '2024-01-11', '2025-06-16', '2025-06-17', '260', 1),
(1058, '20250625FY1BR21060Q', 'MARTINA RAMIREZ PI?ON', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581174332', '', '', '', 3, '', '20176', '2024-10-11', '2025-10-16', '2025-10-17', '260', 1),
(1059, '20250625QG5GP11061Y', 'NANCY YANETH ARENAS RIOS', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '170', '2018-12-11', '2025-12-16', '2025-12-17', '260', 1),
(1060, '20250625OS4DG11062W', 'DELFINO JACOBO RODRIGUEZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922919961', '', '', '', 3, '', '32.114', '2025-02-11', '2025-06-16', '2025-06-17', '260', 1),
(1061, '20250625QI5PU41063J', 'RUFINA GARCIA CASTRO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581090726', '', '', '', 3, '', '2.155', '2022-08-11', '2025-08-16', '2025-08-17', '260', 1),
(1062, '20250625YH5AS21064H', 'SECUNDARIA DR SALVADOR ALLENDE', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921739229', '', '', '', 9, '', '', '2024-10-11', '2025-10-16', '2025-10-17', '800', 1),
(1063, '20250625GJ2DZ81065V', 'EPITACIA ACOSTA RUIZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922049529', '', '', '', 3, '', '32.61', '2017-11-11', '2025-11-16', '2025-11-17', '260', 1),
(1064, '20250625NI1PL01066Z', 'ULISES SANCHEZ NORATO', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.137', '2024-05-11', '2025-06-16', '2025-06-17', '260', 1),
(1065, '20250625CH1ZV51067R', 'ADELA HERRERA GARCIA', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '4921608835', '', '', '', 3, '', '30.97', '2023-10-12', '2025-06-16', '2025-06-17', '260', 2),
(1066, '20250625XH0IV61068D', 'ANA KAREN MURO REVELES', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4331282336', '', '', '', 3, '', '30.109', '2024-11-12', '2025-11-17', '2025-11-18', '260', 1),
(1067, '20250625GM9OJ01069R', 'BRENDA LETICIA CASTRO RENTERIA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581020349', '', '', '', 3, '', '32.77', '2018-03-12', '2025-06-17', '2025-06-18', '260', 1),
(1068, '20250625CL0RL01070X', 'CARMINA MARTINEZ ZAMORA', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '458-104-0241', '', '', '', 6, '', '', '2021-04-12', '2025-06-17', '2025-06-18', '220', 1),
(1069, '20250625DB4BF61071A', 'CIRILA CASTRO ESQUIVEL', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.15', '2020-05-12', '2025-06-17', '2025-06-18', '260', 1),
(1070, '20250625BS4KN21072N', 'FABRICA', '', '', '', 'ENTRONQUE', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 9, '', '32.45', '2019-07-12', '2025-07-17', '2025-07-18', '580', 1),
(1071, '20250625MM3UF11073K', 'FIDEL SANTAMARIA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.131', '2018-09-12', '2025-09-17', '2025-09-18', '260', 1),
(1072, '20250625XH1HU31074L', 'GUSTAVO ALEJANDRO SAUCEDO RODRIGUEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921455989', '', '', '', 3, '', '30.139', '2024-09-12', '2025-06-17', '2025-06-18', '260', 2),
(1073, '20250625YF4CC71075Q', 'IMELDA MU?OZ DURAN', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.87', '2018-03-12', '2025-06-17', '2025-06-18', '260', 1),
(1074, '20250625QP4BR51076G', 'JOAQUIN FRIAS SANTAMARIA', '', '', '', 'BARRIO LOS LLANITOS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '230', '2018-02-12', '2025-06-17', '2025-06-18', '260', 1),
(1075, '20250625JM7CK51077Q', 'JUAN MANUEL SANTANA MU?OZ', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '34.92', '2017-06-12', '2025-06-17', '2025-06-18', '260', 1),
(1076, '20250625YX5PM61078W', 'KAREN ADALI VILLAGRANA MACIAS', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4581158612', '', '', '', 3, '', '29.219', '2025-03-12', '2025-06-17', '2025-06-18', '260', 1),
(1077, '20250625UJ6VM01079Q', 'MARIA DE LA LUZ HERNANDEZ ZAMORA', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.202', '2021-04-12', '2025-06-17', '2025-06-18', '260', 1),
(1078, '20250625BH3SA81080B', 'MARIA GUADALUPE ACOSTA SAUCEDO', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581064108', '', '', '', 3, '', '32.12', '2020-10-12', '2025-10-17', '2025-10-18', '260', 1),
(1079, '20250625SX7TM51081R', 'LUIS MARIO SAUCEDO CHAVEZ', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921717362', '', '', '', 3, '', '29.195', '2023-10-12', '2025-10-17', '2025-10-18', '260', 1),
(1080, '20250625SI7OK91082N', 'SAUL GARCIA CHAVEZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581106534', '', '', '', 3, '', '29.126', '2020-05-12', '2025-06-17', '2025-06-18', '260', 1),
(1081, '20250625KA6ZK31083Z', 'AGAPITA CASTRO CHICA', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '2227357177', '', '', '', 3, '', '', '2018-05-15', '2025-06-20', '2025-06-21', '260', 1),
(1082, '20250625HL1EX81084S', 'ADRIAN CASTRO GONZALEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922275879', '', '', '', 3, '', '34.118', '2024-05-13', '2025-06-18', '2025-06-19', '260', 1),
(1083, '20250625UA1BW71085G', 'ERIKA PATRICIA HERNANDEZ NORATO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4922939317', '', '', '', 3, '', '29.25', '2021-01-13', '2025-06-18', '2025-06-19', '260', 1),
(1084, '20250625HG5QE41086D', 'ESMERALDA MARES CERVANTES', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '3121540652', '', '', '', 3, '', '2.25', '2020-11-13', '2025-11-18', '2025-11-19', '260', 1),
(1085, '20250625AX4LQ71087M', 'EVA MURO GUERRERO', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922920383', '', '', '', 3, '', '29.166', '2018-10-13', '2025-10-18', '2025-10-19', '260', 1),
(1086, '20250625GT8UX81088M', 'EVELIN MU?OZ', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.215', '2019-09-13', '2025-09-18', '2025-09-19', '260', 1),
(1087, '20250625XP6KK01089B', 'EVERARDO RODRIGUEZ LOPEZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '6565758935', '', '', '', 3, '', '29.24', '2021-01-13', '2025-06-18', '2025-06-19', '260', 1),
(1088, '20250625XO7BB81090R', 'FINANZAS RECAUDACION RENTAS', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.129', '2017-08-13', '2025-08-18', '2025-08-19', '260', 1),
(1089, '20250625EA5JP01091B', 'FLOR DE MARIA CASTRO DOMINGUEZ', '', '', '', 'COLONIA BUENOS AIRES', 'GENARO CODINA', 'ZACATECAS', 98660, '4921612245', '', '', '', 3, '', '32.84', '2018-04-13', '2025-06-18', '2025-06-19', '260', 1),
(1090, '20250625IA4IA91092L', 'JESUS ESQUIVEL SALINAS', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921218717', '', '', '', 3, '', '32.115', '2016-08-13', '2025-08-18', '2025-08-19', '260', 1),
(1091, '20250625PR7TX01093V', 'LEONARDO SANTANA RAMIREZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4922887315', '', '', '', 3, '', '30.75', '2020-11-13', '2025-06-18', '2025-06-19', '260', 2),
(1092, '20250625KT9BG51094B', 'LETICIA GUERRERO MACIAS', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921288427', '', '', '', 3, '', '34.54', '2021-11-13', '2025-11-18', '2025-11-19', '260', 1),
(1093, '20250625VY6EG41095B', 'MARIBEL HINOJOSA ROQUE', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4928926196', '', '', '', 3, '', '2.18', '2024-06-13', '2025-06-18', '2025-06-19', '260', 1),
(1094, '20250625WM3MQ61096L', 'OLGA LIDIA TORRES ARENAS', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922249110', '', '', '', 3, '', '32.165', '2021-07-13', '2025-07-18', '2025-07-19', '260', 1),
(1095, '20250625JL6FR51097L', 'OLIVERIO MU?OZ CHAVEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4922045724', '', '', '', 3, '', '29.169', '2018-11-13', '2025-11-18', '2025-11-19', '260', 1),
(1096, '20250625DS0AF01098T', 'ORALIA CERVANTES HERNANDEZ', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '492-112-51-93', '', '', '', 3, '', '30.63', '2019-11-13', '2025-11-18', '2025-11-19', '260', 1),
(1097, '20250625OK5US31099P', 'SERGIO ALEJANDRO DOMINGUEZ RAMOS', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921257965', '', '', '', 3, '', '29.29', '2022-08-27', '2025-09-01', '2025-09-02', '260', 1),
(1098, '20250625UP0DM51100V', 'ARACELI BRIONES HERNANDEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.132', '2018-09-14', '2025-09-19', '2025-09-20', '260', 1),
(1099, '20250625OM3IT71101T', 'CHRISTOPHER ESQUIVEL SANTANA', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921710299/4921752511', '', '', '', 3, '', '34.53', '2022-01-14', '2025-06-19', '2025-06-20', '260', 1),
(1100, '20250625SK7QT21102F', 'EMILIO ALEJANDRO CASTRO SAUCEDO', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.56', '2016-04-14', '2025-06-19', '2025-06-20', '260', 1),
(1101, '20250625ZV8GM51103Z', 'EVANGELINA GARCIA ARTEAGA 2 ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921021605', '', '', '', 3, '', '32.177', '2024-05-14', '2025-06-19', '2025-06-20', '260', 1),
(1102, '20250625XD2TT51104Z', 'FERNANDO REZA MARTINEZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922437454', '', '', '', 3, '', '34.58', '2019-03-14', '2025-06-19', '2025-06-20', '260', 1),
(1103, '20250625DD4KR51105T', 'GIOVANNI HERNANDEZ ESQUIVEL', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921294908', '', '', '', 3, '', '34.123', '2024-08-14', '2025-08-19', '2025-08-20', '260', 1),
(1104, '20250625DO6ES41106Y', 'LEONCIO MORALES MONTOYA (CASA)', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4927951594', '', '', '', 3, '', '30.141', '2024-09-14', '2025-09-19', '2025-09-20', '260', 1),
(1105, '20250625TM4ZB41107T', 'LUCIA GUADALUPE PEREA ESQUIVEL', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.118', '2016-04-14', '2025-06-19', '2025-06-20', '260', 1),
(1106, '20250625AL4NN31108W', 'MARIA DEL CARMEN SANTANA ESCOBAR', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, 'MAC NUEVA', '', '', '', 3, '', '34.83', '2018-11-14', '2025-11-19', '2025-11-20', '260', 1),
(1107, '20250625QD7AY41109A', 'MARIA SAUCEDO SOTO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.39', '2022-12-14', '2025-12-19', '2025-12-20', '260', 1),
(1108, '20250625XC4LC51110L', 'PATRICIA ANGELICA GUTIERREZ RAYGOZA', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922046390', '', '', '', 3, '', '29.213', '2023-10-14', '2025-10-19', '2025-10-20', '260', 1),
(1109, '20250625TS9MC21111R', 'RUBEN MARES ESQUIVEL LAUREL', '', '', '', 'COLONIA BUENOS AIRES', 'GENARO CODINA', 'ZACATECAS', 98660, '50', '', '', '', 3, '', '32.113', '2017-02-14', '2025-06-19', '2025-06-20', '260', 1),
(1110, '20250625PD8QD01112L', 'ABIGAIL BRIONES HERNANDEZ ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922101411', '', '', '', 3, '', '29.143', '2022-11-09', '2025-05-14', '2025-05-15', '260', 2),
(1111, '20250625DC3NN31113W', 'ADRIAN GARCIA MARES', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4922018037', '', '', '', 3, '', '29.111', '2016-11-15', '2025-11-20', '2025-11-21', '260', 1),
(1112, '20250625PV8UQ11114C', 'ADRIAN RODRIGUEZ CASTRO', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '4921016505', '', '', '', 3, '', '30.51', '2021-01-15', '2025-06-20', '2025-06-21', '260', 1),
(1113, '20250625EV5IR21115I', 'ANA LIDIA MU?OZ SALINAS', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581369814', '', '', '', 3, '', '32.28', '2022-07-15', '2025-07-20', '2025-07-21', '260', 1),
(1114, '20250625HD8GX51116H', 'ELIZABETH RODRIGUEZ SAUCEDO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4929422508', '', '', '', 3, '', '2.62', '2024-03-15', '2025-06-20', '2025-06-21', '260', 1),
(1115, '20250625KX1ER21117X', 'HILDA PATRICIA MARES ESQUIVEL', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4929491442', '', '', '', 3, '', '32.175', '2023-04-15', '2025-06-20', '2025-06-21', '260', 1),
(1116, '20250625QA8PA11118N', 'ISRAEL CASTRO ALFEREZ', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.56', '2017-12-15', '2025-12-20', '2025-12-21', '260', 1),
(1117, '20250625TC6AU61119J', 'JOSE EDUARDO HERNANDEZ RODRIGUEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922005981', '', '', '', 3, '', '32.224', '2020-02-15', '2025-06-20', '2025-06-21', '260', 1),
(1118, '20250625SM3MN01120B', 'MARIA LAURA ADAME GONZALEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.162', '2017-08-15', '2025-08-20', '2025-08-21', '260', 1),
(1119, '20250625XH1KW11121E', 'LUIS HERNANDEZ CASTRO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922031091', '', '', '', 3, '', '34.107', '2020-02-15', '2025-06-20', '2025-06-21', '260', 1),
(1120, '20250625LN9JV71122Z', 'MAURO GUERRERO HERNANDEZ', '', '', '', 'BARRIO EL RINCONSITO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922003356', '', '', '', 3, '', '29.13', '2020-05-15', '2025-06-20', '2025-06-21', '260', 1),
(1121, '20250625TM2VF51123L', 'OMAR HERNANDEZ ', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.92', '2017-07-15', '2025-07-20', '2025-07-21', '260', 1),
(1122, '20250625WA2RU91124C', 'SARAI LOPEZ CERVANTES', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921149967', '', '', '', 3, '', '29.128', '2020-05-15', '2025-06-20', '2025-06-21', '260', 1),
(1123, '20250625SR5CT41125B', 'YEDIRIA ALEJANDRA GARCIA HERNANDEZ', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '458-117-68-44', '', '', '', 3, '', '30.135', '2019-11-15', '2025-11-20', '2025-11-21', '260', 1),
(1124, '20250625GI0TJ41126F', 'YESENIA VALERIA LOPEZ VALDEZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921362266', '', '', '', 3, '', '32.96', '2018-02-15', '2025-06-20', '2025-06-21', '260', 1),
(1125, '20250625GD1RM61127E', 'ALMA ANGELICA HERNANDEZ HERNANDEZ', '', '', '', 'COLONIA BUENOS AIRES', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.8', '2018-03-16', '2025-06-21', '2025-06-22', '260', 1),
(1126, '20250625RL8PV21128I', 'ANA ELIZABETH GUERRERO MACIAS', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '34.66', '2017-05-16', '2025-06-21', '2025-06-22', '260', 1),
(1127, '20250625WS2GI61129T', 'ANGELICA ESQUIVEL HERNANDEZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922246872', '', '', '', 3, '', '32.68', '2020-06-16', '2025-06-21', '2025-06-22', '260', 1),
(1128, '20250625VG9FN51130P', 'BLANCA YANETH FRAGOZA GONZALEZ', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4581109209', '', '', '', 3, '', '32.206', '2019-08-16', '2025-08-21', '2025-08-22', '260', 1),
(1129, '20250625TT5SO11131Z', 'EFREN HERNANDEZ AGUILAR', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '4922432969', '', '', '', 3, '', '29.63', '2024-07-16', '2025-07-21', '2025-07-22', '260', 1),
(1130, '20250625VN8YC51132A', 'ELVIA SAUCEDO CASTRO', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922646820', '', '', '', 3, '', '34.69', '2020-06-16', '2025-06-21', '2025-06-22', '260', 1),
(1131, '20250625GC7HX91133U', 'ERIK ANTONIO ESQUIVEL', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4693554426', '', '', '', 3, '', '34.114', '2024-01-16', '2025-01-21', '2025-01-22', '260', 2),
(1132, '20250625EA6WX81134G', 'JOSE LEONARDO FRIAS CASTRO', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922444193', '', '', '', 3, '', '29.46', '2020-07-16', '2025-07-21', '2025-07-22', '260', 1),
(1133, '20250625RA8NF11135O', 'LISSET MORALES DE LA CRUZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922510851', '', '', '', 3, '', '29.147', '2024-01-16', '2025-06-21', '2025-06-22', '260', 1),
(1134, '20250625PS1HR21136J', 'MARIA JAQUELIN CALDERA CASTRO', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.65', '2018-03-16', '2025-06-21', '2025-06-22', '260', 1),
(1135, '20250625OF3XE91137A', 'OTONIEL CHAVEZ NORATO', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.133', '2016-09-16', '2025-06-21', '2025-06-22', '260', 2),
(1136, '20250625DQ9CG11138B', 'PERLA GUADALUPE RODRIGUEZ CASTRO', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581150908', '', '', '', 3, '', '32.67', '2020-06-16', '2025-06-21', '2025-06-22', '260', 1),
(1137, '20250625HW2AA41139Y', 'ANAYELI CASTRO CASTRO', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581039230', '', '', '', 3, '', '29.196', '2019-09-17', '2025-09-22', '2025-09-23', '260', 1),
(1138, '20250625GX4IO81140O', 'CARLOS ARMANDO FRIAS HERNANDEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.73', '2016-05-17', '2025-06-22', '2025-06-23', '260', 1),
(1139, '20250625BX7CO41141E', 'ERIKA PATRICIA MURO GUERRERO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.66', '2016-05-17', '2025-06-22', '2025-06-23', '260', 1),
(1140, '20250625TM4XT61142Q', 'FELIPE DE JESUS JACOBO RODRIGUEZ', '', '', '', 'LA AGUA ZARCA', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.137', '2022-05-17', '2025-06-22', '2025-06-23', '260', 1),
(1141, '20250625GA5KN81143R', 'FRANCISCO JAVIER SALINAS ARTEAGA', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.82', '2025-02-17', '2025-06-22', '2025-06-23', '260', 2),
(1142, '20250625IV9GJ91144Q', 'HUMBERTA GARCIA ROQUE', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '492-266-5592', '', '', '', 3, '', '29.43', '2021-02-17', '2025-06-22', '2025-06-23', '260', 1),
(1143, '20250625PE0NO21145L', 'JOSEFINA PADILLA HERNANDEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921701205', '', '', '', 3, '', '29.68', '2025-02-17', '2025-06-22', '2025-06-23', '260', 1),
(1144, '20250625QV0RA41146J', 'JULISSA GUTIERREZ GONZALEZ', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '4928694448', '', '', '', 3, '', '29.172', '2020-06-17', '2025-06-22', '2025-06-23', '260', 1),
(1145, '20250625YO3GR11147W', 'MARIA DE LA LUZ MORALES RODRIGUEZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921065692', '', '', '', 3, '', '29.211', '2020-01-17', '2025-06-22', '2025-06-23', '260', 1),
(1146, '20250625TQ4US11148M', 'MARISOL SAUCEDO CASTRO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921804146', '', '', '', 3, '', '29.155', '2020-06-17', '2025-06-22', '2025-06-23', '260', 1);
INSERT INTO `clientes` (`id`, `folio`, `nombre`, `domicilio`, `calle`, `colonia`, `comunidad`, `municipio`, `estado`, `cp`, `telefono`, `referencias`, `identificacion`, `comprobante`, `servicio`, `antena`, `direccionip`, `fecha_contrato`, `fecha_limite`, `fecha_corte`, `cuota`, `estatus`) VALUES
(1147, '20250625FQ6XF01149S', 'NALLELY MU?OZ RODRIGUEZ', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '34.94', '2021-12-17', '2025-12-22', '2025-12-23', '260', 1),
(1148, '20250625TB8WW71150E', 'RODOLFO HERNANDEZ CALDERA', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4928931082', '', '', '', 3, '', '29.241', '1982-03-17', '2025-06-22', '2025-06-23', '260', 1),
(1149, '20250625BC8DY11151Z', 'ANCELMO CASTRO HERNANDEZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581155316', '', '', '', 3, '', '34.108', '2018-07-18', '2025-07-23', '2025-07-24', '260', 1),
(1150, '20250625AX1DJ61152V', 'BRENDA OLIVA VENEGAS', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4925595073', '', '', '', 3, '', '34.84', '2020-11-18', '2025-11-23', '2025-11-24', '260', 1),
(1151, '20250625HB6YZ11153K', 'COBAEZ PREPA GENARO CODINA', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 4, '', '29.97', '2017-08-18', '2025-08-23', '2025-08-24', '460', 1),
(1152, '20250625BU3PF71154O', 'DULCE JAZMIN DOMINGUEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.175', '2019-01-12', '2025-06-17', '2025-06-18', '260', 1),
(1153, '20250625CZ1AD51155S', 'EMMANUEL CASTRO ESQUIVEL', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921465967', '', '', '', 3, '', '34.93', '2020-11-18', '2025-11-23', '2025-11-24', '260', 1),
(1154, '20250625CT5TE21156U', 'GREGORIO SANTANA MU?OZ', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581099770', '', '', '', 3, '', '34.91', '2021-08-18', '2025-08-23', '2025-08-24', '260', 1),
(1155, '20250625KA6WI01157N', 'GRISELDA ESQUIVEL MU?OZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581272895', '', '', '', 3, '', '32.173', '2019-02-18', '2025-05-23', '2025-05-24', '260', 2),
(1156, '20250625FD5DJ21158B', 'GUADALUPE LOPEZ SANTANA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921120592', '', '', '', 3, '', '32.188', '2024-09-18', '2025-09-23', '2025-09-24', '260', 1),
(1157, '20250625WF9DM91159O', 'IMELDA HERNANDEZ ESQUIVEL', '', '', '', 'BARRIO LLANITOS', 'GENARO CODINA', 'ZACATECAS', 98660, '4922896786', '', '', '', 3, '', '29.48', '2020-11-18', '2025-11-23', '2025-11-24', '260', 1),
(1158, '20250625HM4MI31160K', 'JOSE FRANCISCO ARTEAGA LOPEZ', '', '', '', 'COLONIA BUENOS AIRES', 'GENARO CODINA', 'ZACATECAS', 98660, '4589894157', '', '', '', 3, '', '32.217', '2020-05-18', '2025-06-23', '2025-06-24', '260', 1),
(1159, '20250625ID1WO41161J', 'MARIA FERNANDA MACIAS ARTEAGA', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4581154836', '', '', '', 3, '', '30.89', '2025-02-18', '2025-06-23', '2025-06-24', '260', 1),
(1160, '20250625VS3UQ31162Q', 'MARIA MADARY RAMIREZ CAMPOS', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921240188/4581070176/', '', '', '', 3, '', '32.223', '2020-08-18', '2025-08-23', '2025-08-24', '260', 1),
(1161, '20250625EI4QB51163M', 'PERLA SELENA CAMPOS CARDONA', '', '', '', 'BARRIO LLANITOS', 'GENARO CODINA', 'ZACATECAS', 98660, '4922678189', '', '', '', 3, '', '29.216', '2023-09-29', '2025-05-23', '2025-05-24', '260', 2),
(1162, '20250625CI3SA51164W', 'ROBERTO ESQUIVEL CASTRO ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921613074', '', '', '', 3, '', '29.64', '2017-09-18', '2025-09-23', '2025-09-24', '260', 1),
(1163, '20250625GR4XJ31165H', 'NORMA ALICIA FRIAS REYES', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.61', '2016-09-19', '2025-09-24', '2025-09-25', '260', 1),
(1164, '20250625MF1JH11166Z', 'ANA ROSA HERNANDEZ SALINAS', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922948765', '', '', '', 3, '', '2.237', '2020-08-19', '2025-08-24', '2025-08-25', '260', 1),
(1165, '20250625DW9ZE11167B', 'ANTONIA VILLAGRANA', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '492-128-1161', '', '', '', 3, '', '29.192', '2021-03-19', '2025-06-24', '2025-06-25', '260', 1),
(1166, '20250625DT0KW21168N', 'CESAR JERONIMO GARCIA MORALES', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921456597', '', '', '', 3, '', '30.82', '2021-11-19', '2025-11-24', '2025-11-25', '260', 1),
(1167, '20250625FE7VJ41169C', 'DIANA LIZBETH VELAZQUEZ RODRIGUEZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921037877', '', '', '', 3, '', '29.118', '2022-10-19', '2025-10-24', '2025-10-25', '260', 1),
(1168, '20250625QN4LT21170H', 'ELVIA VILLANUEVA', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921179137', '', '', '', 3, '', '29.62', '2016-08-19', '2025-08-24', '2025-08-25', '260', 1),
(1169, '20250625LK7NH31171C', 'ENRIQUE SANTAMARIA VALDEZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.142', '2016-10-19', '2025-10-24', '2025-10-25', '260', 1),
(1170, '20250625YX8SA21172K', 'EVANGELINA HERNANDEZ HINOJOSA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.53', '2016-10-19', '2025-10-24', '2025-10-25', '260', 1),
(1171, '20250625WW2MA31173N', 'GRISELDA DOMINGUEZ SAUCEDO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581193742', '', '', '', 3, '', '29.52', '2016-08-19', '2025-08-24', '2025-08-25', '260', 1),
(1172, '20250625MW5HH31174T', 'HILDA CASTRO ESQUIVEL', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '458-117-37-04', '', '', '', 3, '', '32.178', '2020-12-19', '2025-12-24', '2025-12-25', '260', 1),
(1173, '20250625FA9LH51175J', 'PASCUAL MU?OZ SALAZAR', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922006883', '', '', '', 3, '', '29.58', '2024-03-19', '2025-06-24', '2025-06-25', '260', 1),
(1174, '20250625CQ6EQ31176X', 'JUAN RODRIGUEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.159', '2018-07-19', '2025-07-24', '2025-07-25', '260', 1),
(1175, '20250625JY8II91177Q', 'JUANA MARIA SAUCEDO GONZALEZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.125', '2018-02-19', '2025-06-24', '2025-06-25', '260', 1),
(1176, '20250625KT4WM51178N', 'JUANITA MIREYA HERNANDEZ SALINAS', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4925596267', '', '', '', 3, '', '34.104', '2021-05-19', '2025-06-24', '2025-06-25', '260', 1),
(1177, '20250625QL6TX41179M', 'JULIO CESAR ESUQIVEL CASTRO', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4581093249', '', '', '', 3, '', '32.104', '2023-06-19', '2025-04-24', '2025-04-25', '260', 1),
(1178, '20250625UR1GE61180H', 'LETICIA MARES TORRES', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '34.67', '2017-01-19', '2025-06-24', '2025-06-25', '260', 1),
(1179, '20250625MZ7BL21181G', 'LETICIA MU?OZ HERNANDEZ', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922234418', '', '', '', 3, '', '34.82', '2018-09-19', '2025-09-24', '2025-09-25', '260', 1),
(1180, '20250625UZ0IA01182K', 'MARIA LUISA GUERRERO HERNANDEZ', '', '', '', 'COLONIA BUENOS AIRES', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.133', '2018-09-19', '2025-09-24', '2025-09-25', '260', 1),
(1181, '20250625CE5PU51183Y', 'NATALIA JAQUELINE ACOSTA LOPEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581052406', '', '', '', 3, '', '2.243', '2021-05-19', '2025-06-24', '2025-06-25', '260', 1),
(1182, '20250625AJ9RO81184M', 'NIDIA MURO HERRERA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922232396', '', '', '', 3, '', '32.17', '2021-05-19', '2025-06-24', '2025-06-25', '260', 1),
(1183, '20250625QP8OO71185S', 'OLGA LIDIA CASTRO GUERRERO', '', '', '', 'BARRIO LOS LLANITOS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921624934', '', '', '', 3, '', '29.224', '2016-10-19', '2025-10-24', '2025-10-25', '260', 1),
(1184, '20250625LU5LU81186J', 'SAMUEL SAUCEDO CASTRO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 9, '', '30.83', '2016-03-19', '2025-06-24', '2025-06-25', '400', 1),
(1185, '20250625ZB2XW91187L', 'SANJUANA GUADALUPE ESQUIVEL ZAMORA', '', '', '', 'BARRIO LOS LLANITOS', 'GENARO CODINA', 'ZACATECAS', 98660, '4922021099', '', '', '', 3, '', '29.243', '2019-09-19', '2025-06-24', '2025-06-25', '260', 2),
(1186, '20250625MG4EG91188K', 'SERGIO PADILLA HERNANDEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '6562685731', '', '', '', 3, '', '2.236', '2020-08-19', '2025-08-24', '2025-08-25', '260', 1),
(1187, '20250625SP3ZB11189L', 'SIJANY VILLANUEVA', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922440314', '', '', '', 3, '', '29.95', '2016-08-19', '2025-08-24', '2025-08-25', '260', 1),
(1188, '20250625RV6PH11190I', 'ALAN SANCHEZ CASTRO LAUREL', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.107', '2016-11-25', '2025-11-30', '2025-12-01', '260', 1),
(1189, '20250625NY5MY31191F', 'ALAN HUMBERTO MARTINEZ GAYTAN', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922003562', '', '', '', 3, '', '29.22', '2023-10-02', '2025-10-24', '2025-10-25', '260', 1),
(1190, '20250625AM2PW31192R', 'ANDRES ESQUIVEL CASTRO HIJO', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.144', '2018-05-20', '2025-03-25', '2025-03-26', '260', 2),
(1191, '20250625SQ5ZE21193Q', 'CIRILA CASTRO CHAVEZ', '', '', '', 'BARRIO EL RINCONSITO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.223', '2018-12-20', '2025-12-25', '2025-12-26', '260', 1),
(1192, '20250625TH9VF31194P', 'ERIKA PE?A', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.181', '2017-07-01', '2025-01-06', '2025-01-07', '260', 2),
(1193, '20250625NY2YO01195Z', 'FRANCISCO PADILLA HERNANDEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581095961', '', '', '', 3, '', '2.229', '2021-01-20', '2025-06-25', '2025-06-26', '260', 1),
(1194, '20250625XK2VQ31196T', 'JAIME SANTAMARIA ', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581060557', '', '', '', 3, '', '29.149', '2017-02-20', '2025-06-25', '2025-06-26', '260', 1),
(1195, '20250625PD8TL61197G', 'JESUS MANUEL GARCIA SAUCEDO', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '458-109-3609', '', '', '', 3, '', '30.115', '2021-03-20', '2025-06-25', '2025-06-26', '260', 1),
(1196, '20250625RR7QR11198Y', 'JORGE LUIS MARES RENTERIA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', 'torre', '2018-02-20', '2025-06-25', '2025-06-26', '200', 1),
(1197, '20250625BI9WY81199K', 'JOSE LUIS CERVANTES LOPEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581286268', '', '', '', 3, '', '32.166', '2024-09-20', '2025-09-25', '2025-09-26', '260', 1),
(1198, '20250625TP9EM21200M', 'JOSE LUIS SALINAS', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.245', '2018-12-20', '2025-12-25', '2025-12-26', '260', 1),
(1199, '20250625VU0OR31201R', 'JOSE MANUEL ARTEAGA HERNANDEZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.106', '2017-02-20', '2025-06-25', '2025-06-26', '260', 1),
(1200, '20250625ZO3XE01202S', 'JUANA MARIA ESQUIVEL RODRIGUEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922297092', '', '', '', 3, '', '32.85', '2016-08-20', '2025-08-25', '2025-08-26', '260', 1),
(1201, '20250625EY7UR91203U', 'KAREN VALDEZ MENDOZA', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.107', '2017-02-20', '2025-06-25', '2025-06-26', '260', 1),
(1202, '20250625NF2KY61204U', 'MA BEATRIZ JACOBO RODRIGUEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922908363', '', '', '', 3, '', '32.103', '2021-12-20', '2025-12-25', '2025-12-26', '260', 1),
(1203, '20250625DV6WK01205D', 'MARIA ADRIANA DURAN MONTES', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4928924157/ 4921348932', '', '', '', 3, '', '2.235', '2020-08-20', '2025-08-25', '2025-08-26', '260', 1),
(1204, '20250625GV5OE61206N', 'MARIA TRINIDAD HINOJOSA CASTRO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.195', '2018-04-20', '2025-06-25', '2025-06-26', '260', 1),
(1205, '20250625GI1QT21207Z', 'MARTHA ARTEAGA MONTALVO', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4492067456', '', '', '', 3, '', '29.184', '2019-06-20', '2025-06-25', '2025-06-26', '260', 1),
(1206, '20250625RI9KR11208H', 'MARTHA PATRICIA MU?OZ CASTRO', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4697409073', '', '', '', 3, '', '34.109', '2022-12-30', '2025-01-04', '2025-01-05', '260', 2),
(1207, '20250625BZ2KL91209L', 'IGNACIO JACOBO RODRIGUEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.86', '2016-08-20', '2025-08-25', '2025-08-26', '260', 1),
(1208, '20250625IW4DC11210E', 'NOE RODRIGUEZ RODRIGUEZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4924930414', '', '', '', 3, '', '32.196', '2023-11-20', '2025-11-25', '2025-11-26', '260', 1),
(1209, '20250625LO7JX11211Y', 'TORTILLERIA SAN JOSE', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922043199', '', '', '', 3, '', '30.9', '2025-02-20', '2025-06-25', '2025-06-26', '260', 1),
(1210, '20250625FA6TC81212I', 'YESENIA CASTRO LOPEZ', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.136', '2016-07-20', '2025-07-25', '2025-07-26', '260', 1),
(1211, '20250625PG2WA31213B', 'BALTAZAR ESQUIVEL MU?OZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581099520', '', '', '', 3, '', '32.14', '2022-09-21', '2025-09-26', '2025-09-27', '260', 1),
(1212, '20250625CY6FD41214D', 'CELIA SANTANA', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921281412', '', '', '', 3, '', '34.77', '2016-10-21', '2025-10-26', '2025-10-27', '260', 1),
(1213, '20250625NV4HK11215Y', 'GUILLERMINA DOMINGUEZ GONZALEZ', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '4921070674', '', '', '', 3, '', '29.74', '2022-03-21', '2025-06-26', '2025-06-27', '260', 1),
(1214, '20250625ZI6OO31216I', 'JORGE LUIS REZA MARTINEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4922674549', '', '', '', 3, '', '29.89', '2024-09-28', '2025-10-03', '2025-10-04', '260', 1),
(1215, '20250625OZ1CP61217V', 'CESAR DANIEL REVELES ACOSTA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921804683', '', '', '', 3, '', '2.251', '2021-06-21', '2025-06-26', '2025-06-27', '260', 1),
(1216, '20250625PX6KB81218A', 'JUAN GABRIEL PEREA CASTRO', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921436866', '', '', '', 3, '', '29.205', '2025-05-21', '2025-06-26', '2025-06-27', '260', 1),
(1217, '20250625VX2BP11219P', 'JUAN MANUEL GARCIA SANCHEZ', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921228106', '', '', '', 3, '', '29.178', '2019-02-21', '2025-06-26', '2025-06-27', '260', 1),
(1218, '20250625RV0HT91220N', 'JUANA ISABEL BRIONES HERNANDEZ ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921028482', '', '', '', 3, '', '29.177', '2019-02-21', '2025-06-26', '2025-06-27', '260', 1),
(1219, '20250625DK3AT31221R', 'JULIO CESAR ESCALERA DIOSDADO', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '4581277638', '', '', '', 3, '', '30.116', '2019-08-21', '2025-08-26', '2025-08-27', '260', 1),
(1220, '20250625YX7LO51222O', 'LETICIA CASTRO FLORES', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.54', '2016-09-21', '2025-09-26', '2025-09-27', '260', 1),
(1221, '20250625ID5PQ61223S', 'JOSE GERMAN HERNANDEZ GARCIA', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581188162', '', '', '', 3, '', '29.235', '2021-08-21', '2025-08-26', '2025-08-27', '260', 1),
(1222, '20250625YL3CF11224I', 'MANUEL JAVIER CASTRO ARTEAGA', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4581166640', '', '', '', 3, '', '30.98', '2025-02-21', '2025-06-26', '2025-06-27', '260', 1),
(1223, '20250625UA8VW71225U', 'MARIA ANTONIA GARCIA GONZALEZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922677115', '', '', '', 3, '', '34.112', '2023-02-21', '2025-06-26', '2025-06-27', '260', 1),
(1224, '20250625OY9JM31226D', 'MARIA AUXILIO ACOSTA MU?OZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922941282', '', '', '', 3, '', '2.232', '2020-09-21', '2025-09-26', '2025-09-27', '260', 1),
(1225, '20250625OE1JG31227T', 'MARIA EVANGELINA CASTRO LOPEZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581061911', '', '', '', 3, '', '30.12', '2021-07-21', '2025-07-26', '2025-07-27', '260', 1),
(1226, '20250625XF9YW71228G', 'MARIA SOLEDAD MU?OZ VALDEZ', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.174', '2019-02-21', '2025-06-26', '2025-06-27', '260', 1),
(1227, '20250625PL2VY01229L', 'NAYELI TORRES RODRIGUEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921079337', '', '', '', 3, '', '32.227', '2022-10-21', '2025-10-26', '2025-10-27', '260', 1),
(1228, '20250625YZ5SI41230F', 'PEDRO SANCHEZ CASTRO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4924933272', '', '', '', 3, '', '32.198', '2020-11-21', '2025-11-26', '2025-11-27', '260', 1),
(1229, '20250625GC0DB31231L', 'ROSALBA GARCIA SANTANA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.63', '2016-10-21', '2025-10-26', '2025-10-27', '260', 1),
(1230, '20250625HW7XA71232Z', 'SALVADOR FRIAS DE LA CRUZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '3324330410', '', '', '', 3, '', '32.158', '2020-10-21', '2025-10-26', '2025-10-27', '260', 1),
(1231, '20250625UO0WL41233F', 'YANETH REZA VARGAS', '', '', '', 'COLONIA BUENOS AIRES', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.163', '2019-01-12', '2025-05-17', '2025-05-18', '260', 2),
(1232, '20250625MR0IY01234H', 'ANA MAYRA TORRES ARENAS', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4581175332', '', '', '', 3, '', '32.229', '2021-10-22', '2025-10-27', '2025-10-28', '260', 1),
(1233, '20250625AW3UH61235L', 'ALEXIS BALDERAS', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921421119', '', '', '', 3, '', '32.167', '2024-08-22', '2025-08-27', '2025-08-28', '260', 1),
(1234, '20250625RT3NG31236C', 'ANGELICA ACOSTA HINOJOSA ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922109479 / 4923142800', '', '', '', 3, '', '32.23', '2019-10-22', '2025-10-27', '2025-10-28', '260', 1),
(1235, '20250625GG9JL51237Z', 'FATIMA DEL ROCIO HERNANDEZ', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '                     ', '', '', '', 6, '', '', '2018-06-22', '2025-06-27', '2025-06-28', '220', 1),
(1236, '20250625BY8UF31238R', 'FERMIN ZAMORA', '', '', '', 'BARRIO EL RINCONSITO', 'GENARO CODINA', 'ZACATECAS', 98660, '4699751974', '', '', '', 3, '', '29.181', '2024-07-22', '2025-07-27', '2025-07-28', '260', 1),
(1237, '20250625JP0QY31239F', 'GABRIELA PEREA ESQUIVEL', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922890553', '', '', '', 3, '', '29.197', '2025-03-22', '2025-06-27', '2025-06-28', '260', 1),
(1238, '20250625PY8HI71240H', 'JAIME RODRIGUEZ RODRIGUEZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922034115', '', '', '', 3, '', '32.14', '2020-09-22', '2025-09-27', '2025-09-28', '260', 1),
(1239, '20250625MA6QT21241R', 'JESUS ACOSTA BENITES', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '492-181-0741', '', '', '', 3, '', '32.204', '2021-04-22', '2025-06-27', '2025-06-28', '260', 1),
(1240, '20250625AA0BI71242Z', 'JUAN GERARDO SANCHEZ ROQUE', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922423558', '', '', '', 3, '', '29.136', '2020-05-22', '2025-06-27', '2025-06-28', '260', 1),
(1241, '20250625DN8VR71243M', 'LEONEL ESQUIVEL DELGADO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922934097', '', '', '', 3, '', '2.202', '2023-09-22', '2025-09-27', '2025-09-28', '260', 1),
(1242, '20250625JB4GY51244P', 'MARIA DE JESUS SAUCEDO ELIAS', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4582453166', '', '', '', 3, '', '29.204', '2019-10-22', '2025-10-27', '2025-10-28', '260', 1),
(1243, '20250625SL0TC41245T', 'MARIA ELENA GONZALEZ HERNANDEZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922688083', '', '', '', 3, '', '34.62', '2020-09-22', '2025-09-27', '2025-09-28', '260', 1),
(1244, '20250625MU3VB01246H', 'MARIO SANCHEZ MARES', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.92', '2017-07-22', '2025-07-27', '2025-07-28', '260', 1),
(1245, '20250625BR2TP71247S', 'NOELIA HERNANDEZ', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921791808', '', '', '', 3, '', '29.77', '2022-04-19', '2025-06-24', '2025-06-25', '260', 1),
(1246, '20250625TJ1NH41248X', 'ROCIO EDITH GARCIA JACOBO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.78', '2017-11-21', '2025-11-26', '2025-11-27', '260', 1),
(1247, '20250625FQ8TL61249Y', 'ROSA MARIA HERNANDEZ AGUILAR', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4581053520', '', '', '', 3, '', '29.209', '2023-09-22', '2025-09-27', '2025-09-28', '260', 1),
(1248, '20250625JO1DQ61250Y', 'ALMA PATRICIA CASTRO GARCIA', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4929009874', '', '', '', 3, '', '30.11', '2023-06-23', '2025-06-27', '2025-06-28', '260', 1),
(1249, '20250625XN6EI41251L', 'ANA MARIA MARES ESQUIVEL', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921600041', '', '', '', 3, '', '2.4', '2021-03-23', '2025-06-28', '2025-06-29', '260', 1),
(1250, '20250625JN6PR81252U', 'ANITA REVELES MARTELL', '', '', '', 'COLONIA BUENOS AIRES', 'GENARO CODINA', 'ZACATECAS', 98660, '4922395125', '', '', '', 3, '', '32.222', '2023-10-23', '2025-10-27', '2025-10-28', '260', 1),
(1251, '20250625TL9ZR01253J', 'BENITO ESQUIVEL DELGADO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '8304966421', '', '', '', 3, '', '2.177', '2024-10-23', '2025-10-28', '2025-10-29', '260', 1),
(1252, '20250625DX2ZA61254B', 'BRENDA YANELI HERNANDEZ JACOBO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922256821', '', '', '', 3, '', '32.234', '2021-08-23', '2025-08-28', '2025-08-29', '260', 1),
(1253, '20250625AT3JG81255G', 'DANIELA LOPEZ LOPEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, 'MAC NUEVA', '', '', '', 3, '', '32.51', '2016-12-23', '2025-12-28', '2025-12-29', '260', 1),
(1254, '20250625DA2ON11256W', 'EDUARDO DELGADO MORALES', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921430906', '', '', '', 3, '', '29.238', '2023-06-23', '2025-06-27', '2025-06-28', '260', 1),
(1255, '20250625AG7ZF61257F', 'ERANDI GARCIA GARCIA', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.114', '2018-06-23', '2025-06-28', '2025-06-29', '260', 1),
(1256, '20250625KB1SC01258A', 'ESMERALDA LOPEZ ESQUIVEL', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921051145', '', '', '', 3, '', '34.68', '2020-10-23', '2025-10-28', '2025-10-29', '260', 1),
(1257, '20250625IE8ZA81259L', 'EVELIN JAZMIN HERNANDEZ RAMOS', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4928702678', '', '', '', 3, '', '2.227', '2021-02-23', '2025-06-28', '2025-06-29', '260', 1),
(1258, '20250625KR3HK31260M', 'FABIOLA ACOSTA MARTINEZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4923281761', '', '', '', 3, '', '32.11', '2021-03-23', '2025-06-28', '2025-06-29', '260', 1),
(1259, '20250625LU3GD71261O', 'FATIMA DE LOURDES GARCIA MORALES', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581068951', '', '', '', 3, '', '34.105', '2019-07-23', '2025-07-28', '2025-07-29', '260', 1),
(1260, '20250625NI2DE81262Q', 'GUADALUPE HERNANDEZ GARCIA', '', '', '', 'PILAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4581040250', '', '', '', 3, '', '2.5', '2022-02-23', '2025-06-28', '2025-06-29', '260', 1),
(1261, '20250625LA2JT91263L', 'IRENE ESQUIVEL VALDEZ', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4929428291', '', '', '', 3, '', '32.189', '2024-12-23', '2025-01-28', '2025-01-29', '260', 2),
(1262, '20250625UK9DB21264A', 'IRMA CASTRO ESQUIVEL', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921597135', '', '', '', 3, '', '29.16', '2020-09-23', '2025-09-28', '2025-09-29', '260', 1),
(1263, '20250625GC2CL51265U', 'JOSEFA ESQUIVEL HERNANDEZ', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921759678', '', '', '', 3, '', '34.81', '2016-06-23', '2025-06-28', '2025-06-29', '260', 1),
(1264, '20250625TD3RJ81266X', 'JUANA MARIA MARES DELGADO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.91', '2016-11-23', '2025-11-28', '2025-11-29', '260', 1),
(1265, '20250625GT8NX41267E', 'MANUEL RODRIGUEZ CALDERA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.117', '2018-05-23', '2025-06-28', '2025-06-29', '260', 1),
(1266, '20250625IB2PN81268R', 'MARGARITA SANTANA CASTRO', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4581096189', '', '', '', 3, '', '106', '2020-01-23', '2025-06-28', '2025-06-29', '260', 1),
(1267, '20250625YD3BI51269Q', 'MARIA AUXILIO TORRES HERRERA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4651015676', '', '', '', 3, '', '32.184', '2024-12-23', '2025-12-28', '2025-12-29', '260', 1),
(1268, '20250625QU7VF81270E', 'MARIA DE JESUS MU?OZ SALAZAR', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4581045413', '', '', '', 3, '', '34.73', '2022-11-23', '2025-11-28', '2025-11-29', '260', 1),
(1269, '20250625FO3IM71271Y', 'MARIANA DIOSDADO DE LA CRUZ', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '4581230932', '', '', '', 3, '', '30.132', '2020-01-23', '2025-06-28', '2025-06-29', '260', 1),
(1270, '20250625JQ4VC51272E', 'MARIO SAUCEDO REZA', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '458-120-6312', '', '', '', 3, '', '32.233', '2021-02-23', '2025-06-28', '2025-06-29', '260', 1),
(1271, '20250625DX2SK91273O', 'YESENIA ACOSTA MARTINEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '492-205-7378', '', '', '', 3, '', '32.168', '2021-03-23', '2025-06-28', '2025-06-29', '260', 1),
(1272, '20250625PS3YB51274C', 'YESICA GARCIA FLORES', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921434328', '', '', '', 3, '', '2.24', '2021-08-23', '2025-08-28', '2025-08-29', '260', 1),
(1273, '20250625JX2FV41275Q', 'ADOLFO MORALES CABRAL', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581069805', '', '', '', 3, '', '29.78', '2022-06-24', '2025-06-29', '2025-06-30', '260', 1),
(1274, '20250625XE0KH91276A', 'ALEJANDRA SANCHEZ MARES', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922517138', '', '', '', 3, '', '32.231', '2022-10-24', '2025-10-29', '2025-10-30', '260', 1),
(1275, '20250625TC3BC11277I', 'ALEJANDRO GARCIA', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581158446', '', '', '', 3, '', '29.188', '2019-08-24', '2025-08-29', '2025-08-30', '260', 1),
(1276, '20250625GM0HZ01278A', 'BIENES COMUNALES SALON EJIDAL', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581234965', '', '', '', 3, '', '34.11', '2021-07-15', '2025-07-20', '2025-07-21', '260', 1),
(1277, '20250625NT8HZ11279V', 'CAROLINA ROQUE VALDEZ ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '492-175-1852', '', '', '', 3, '', '2.252', '2021-02-24', '2025-06-29', '2025-06-30', '260', 1),
(1278, '20250625PG5YQ61280N', 'DANIEL ESQUIVEL HERNANDEZ', '', '', '', 'COLONIA BUENOS AIRES', 'GENARO CODINA', 'ZACATECAS', 98660, '4921431212', '', '', '', 3, '', '32.141', '2021-12-24', '2025-12-29', '2025-12-30', '260', 1),
(1279, '20250625HA8XJ21281U', 'ERICK HERNANDEZ SAUCEDO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921421119', '', '', '', 3, '', '29.132', '2022-11-24', '2025-11-29', '2025-11-30', '260', 1),
(1280, '20250625NV3VC41282H', 'ESCUELA PRIMARIA JOSEFA ORTIZ DE DOMINGUEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921452972', '', '', '', 3, '', '29.164', '2022-02-24', '2025-06-29', '2025-06-30', '260', 1),
(1281, '20250625TG5DH71283K', 'FABIOLA ESQUIVEL RENTERIA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581287031', '', '', '', 3, '', '32.124', '2020-10-24', '2025-10-29', '2025-10-30', '260', 1),
(1282, '20250625FW8RC71284J', 'FERNANDO DURAN VAZQUEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921368650', '', '', '', 3, '', '29.123', '2021-09-18', '2025-09-23', '2025-09-24', '260', 1),
(1283, '20250625EI6TC91285E', 'GUILLERMO DE LA CRUZ ADAME', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '458-106-6617', '', '', '', 3, '', '2.247', '2021-02-24', '2025-06-29', '2025-06-30', '260', 1),
(1284, '20250625BB0GY41286N', 'HILDA RODRIGUEZ ARTEAGA', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '50', '', '', '', 3, '', '30.55', '2018-03-24', '2025-06-29', '2025-06-30', '260', 1),
(1285, '20250625NA1RA71287X', 'IRENE GARCIA ARTEAGA', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4922005816', '', '', '', 3, '', '30.74', '2018-10-24', '2025-10-29', '2025-10-30', '260', 1),
(1286, '20250625TI3CZ81288N', 'JAIME SANTANA MU?OZ', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '458-1064591', '', '', '', 3, '', '34.79', '2017-05-24', '2025-06-29', '2025-06-30', '260', 1),
(1287, '20250625XP3MP51289Z', 'JONATHAN MANUEL DOMINGUEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4589891180', '', '', '', 3, '', '32.219', '2019-09-24', '2025-09-29', '2025-09-30', '260', 1),
(1288, '20250625JS0PA01290N', 'JOSE LUIS CASTRO DIOSDADO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.7', '2017-09-12', '2025-09-17', '2025-09-18', '260', 1),
(1289, '20250625AP1BJ41291M', 'JUANA MONTES HERNANDEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581156443', '', '', '', 3, '', '32.152', '2025-02-24', '2025-06-29', '2025-06-30', '260', 1),
(1290, '20250625EC1NY71292B', 'JUANA SANTAMARIA ACOSTA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581028682', '', '', '', 3, '', '2.246', '2020-04-24', '2025-06-29', '2025-06-30', '260', 1),
(1291, '20250625NF1HL51293V', 'LUIS GUSTAVO REZA ESQUIVEL', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581201183', '', '', '', 3, '', '2.188', '2022-09-24', '2025-09-29', '2025-09-30', '260', 1),
(1292, '20250625AT6XC71294W', 'MA IRENE HERNANDEZ DIOSDADO', '', '', '', 'BARRIO DE LOS LLANITOS', 'GENARO CODINA', 'ZACATECAS', 98660, '4581102596', '', '', '', 3, '', '29.44', '2020-11-24', '2025-11-29', '2025-11-30', '260', 1),
(1293, '20250625NT1XW71295Q', 'MARIA GORETTI JACOBO RODRIGUEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921228595', '', '', '', 3, '', '2.201', '2020-09-24', '2025-09-29', '2025-09-30', '260', 1),
(1294, '20250625RF6PT71296F', 'MARIA JUANA RAMIREZ GUERRERO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921469400', '', '', '', 3, '', '2.138', '2024-01-24', '2025-06-29', '2025-06-30', '260', 1),
(1295, '20250625SY3NQ61297T', 'RODOLFO MU?OZ VALDEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.93', '2017-05-24', '2025-06-29', '2025-06-30', '260', 1),
(1296, '20250625UL2JG31298Y', 'ROSA MARIA ALVARADO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4581178640', '', '', '', 3, '', '29.134', '2017-05-24', '2025-06-29', '2025-06-30', '260', 1),
(1297, '20250625NO1TZ81299D', 'ROSY SANTANA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.95', '2017-05-24', '2025-06-29', '2025-06-30', '260', 1),
(1298, '20250625HS2NS81300F', 'RUBEN RODRIGUEZ SOTO', '', '', '', 'COLONIA BUENOS AIRES', 'GENARO CODINA', 'ZACATECAS', 98660, '4581053833', '', '', '', 3, '', '32.15', '2021-05-24', '2025-06-29', '2025-06-30', '260', 1),
(1299, '20250625EI0HW91301X', 'ALEJANDRA MARES SAUCEDO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581100537', '', '', '', 3, '', '32.118', '2018-05-25', '2025-06-30', '2025-07-01', '260', 1),
(1300, '20250625MW6YU21302G', 'ANA LAURA HINOJOSA ROQUE', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4924201828', '', '', '', 3, '', '2.181', '2024-09-25', '2025-09-30', '2025-10-01', '260', 1),
(1301, '20250625VF8GV41303M', 'ANTONIO ARTEAGA', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.67', '2016-04-25', '2025-06-30', '2025-07-01', '260', 1),
(1302, '20250625GH5TP11304H', 'AZUCENA JACOBO CASTRO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581239300', '', '', '', 3, '', '2.45', '2024-07-25', '2025-07-30', '2025-07-31', '260', 1),
(1303, '20250625DH4KD31305C', 'BRENDA ALICIA MURO CASTRO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922905231', '', '', '', 3, '', '32.199', '2020-08-25', '2025-08-30', '2025-08-31', '260', 1),
(1304, '20250625YB8IT21306D', 'CELIA MU?OZ CHAVEZ', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.133', '2018-03-25', '2025-06-30', '2025-07-01', '260', 1),
(1305, '20250625NY2TL11307T', 'EFRAIN FRIAS SANTAMARIA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4463096535', '', '', '', 3, '', '2.176', '2024-11-25', '2025-04-30', '2025-05-01', '260', 2),
(1306, '20250625PV9TS71308L', 'FIDEL DELGADO MORALES', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.64', '2016-11-25', '2025-11-30', '2025-12-01', '260', 1),
(1307, '20250625JV9BW61309B', 'GABRIEL HERNANDEZ HERNANDEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922686208', '', '', '', 3, '', '32.207', '2020-05-25', '2025-06-30', '2025-07-01', '260', 1),
(1308, '20250625JG3XZ01310C', 'GLORIA GUADALUPE CERVANTES JACOBO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921626140', '', '', '', 3, '', '2.23', '2021-10-25', '2025-10-30', '2025-10-31', '260', 1),
(1309, '20250625QI6NO81311V', 'JORGE LUIS CERVANTES JACOBO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922027113', '', '', '', 3, '', '2.218', '2024-01-25', '2025-06-30', '2025-07-01', '260', 1),
(1310, '20250625CK1GA71312A', 'JOSE CARLOS HERNANDEZ HERNANDEZ', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921325177', '', '', '', 3, '', '29.233', '2021-05-25', '2025-06-30', '2025-07-01', '260', 1),
(1311, '20250625ZG5EU51313C', 'JOCELYN MARES SANTANA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581095276', '', '', '', 3, '', '32.241', '2020-08-11', '2025-04-16', '2025-04-17', '260', 2),
(1312, '20250625ZE5OE11314U', 'JUANA MARIA RODRIGUEZ RODRIGUEZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921112453', '', '', '', 3, '', '34.51', '2022-05-25', '2025-06-30', '2025-07-01', '260', 1),
(1313, '20250625WX1UV11315U', 'JUANITA MIREYA SALINAS SAUCEDO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.157', '2016-10-25', '2025-10-30', '2025-10-31', '260', 1),
(1314, '20250625QF4ZJ71316S', 'LAURA EDITH CASTRO LOPEZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.19', '2019-05-27', '2025-06-01', '2025-06-02', '260', 1),
(1315, '20250625IC2DZ31317Q', 'LAURA ELENA ESQUIVEL TORRES', '', '', '', 'BARRIO LOS LLANITOS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.201', '2021-03-25', '2025-06-30', '2025-07-01', '260', 1),
(1316, '20250625QQ7FU31318D', 'LEONCIO MORALES MONTOYA (TALLER)', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4927951594', '', '', '', 3, '', '30.93', '2023-01-25', '2025-06-30', '2025-07-01', '260', 1),
(1317, '20250625PG9PD51319S', 'LUIS MANUEL RODRIGUEZ RENTERIA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922258325', '', '', '', 3, '', '29.76', '2021-10-25', '2025-10-30', '2025-10-31', '260', 1),
(1318, '20250625JR8YE01320J', 'MARIA DE JESUS MONTES DURAN', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921716518', '', '', '', 3, '', '32.13', '2021-03-25', '2025-06-30', '2025-07-01', '260', 1),
(1319, '20250625FS5VO71321O', 'MARIA DE JESUS RENTERIA MARTINEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4929426004', '', '', '', 3, '', '32.44', '2023-10-25', '2025-10-30', '2025-10-31', '260', 1),
(1320, '20250625AX5OG01322V', 'MARIANA MORALES CASTRO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.77', '2018-05-25', '2025-06-30', '2025-07-01', '260', 1),
(1321, '20250625QW1HA41323C', 'MINERVA MARISOL ESQUIVEL GARCIA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '2.199', '2022-01-25', '2025-06-30', '2025-07-01', '260', 1),
(1322, '20250625DU3WG71324B', 'MARTHA CASTRO CHAVEZ', '', '', '', 'BARRIO LOS LLANITOS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921776302', '', '', '', 3, '', '29.193', '2023-04-25', '2025-06-30', '2025-07-01', '260', 1),
(1323, '20250625IM8YW01325E', 'MARTHA ELENA JACOBO RODRIGUEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581188540', '', '', '', 3, '', '2.189', '2018-07-25', '2025-07-30', '2025-07-31', '260', 1),
(1324, '20250625ZD0KI11326R', 'ROSALINDA HERNANDEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '8304333400', '', '', '', 3, '', '30.79', '2021-06-25', '2025-04-30', '2025-05-01', '260', 2),
(1325, '20250625PG9SG61327C', 'SILVIA YANETH MARTINEZ LOPEZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4589899780', '', '', '', 3, '', '29.139', '2020-08-25', '2025-08-30', '2025-08-31', '260', 1),
(1326, '20250625CS6AE21328Y', 'YESENIA MARTINEZ MEDINA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '492-909-8107', '', '', '', 3, '', '2.241', '2021-02-25', '2025-06-30', '2025-07-01', '260', 1),
(1327, '20250625EY2RY41329N', 'YULIANA HERNANDEZ JACOBO', '', '', '', 'BARRIO LOS LLANITOS', 'GENARO CODINA', 'ZACATECAS', 98660, '4922027850', '', '', '', 3, '', '29.148', '2020-05-25', '2025-06-30', '2025-07-01', '260', 1),
(1328, '20250625UA7WQ01330F', 'ALMA DELIA ARENAS RIOS ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4491895487', '', '', '', 3, '', '29.186', '2019-07-26', '2025-07-31', '2025-08-01', '260', 1),
(1329, '20250625XY3TH21331L', 'BIENESTAR  ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.22', '2022-04-26', '0000-00-00', '2025-06-01', '260', 1),
(1330, '20250625BG0XZ01332F', 'BLANCA ELIDA MARTINEZ SAUCEDO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581035583', '', '', '', 3, '', '32.205', '2020-05-26', '2025-07-01', '2025-07-02', '260', 1),
(1331, '20250625GK3HP21333Z', 'BONIFACIO CASTRO ESQUIVEL', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '8172477851', '', '', '', 3, '', '29.156', '2023-12-26', '2025-03-30', '2025-03-31', '260', 2),
(1332, '20250625BY0IK31334U', 'JUAN DE DIOS GARCIA LOPEZ', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.127', '2016-08-26', '2025-08-31', '2025-09-01', '260', 1),
(1333, '20250625JS9YW31335X', 'ERIK FABIAN DELGADO MACIAS', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921828571', '', '', '', 3, '', '29.117', '2018-01-26', '2025-07-01', '2025-07-02', '260', 1),
(1334, '20250625PB4IT51336B', 'FRANCISCO JAVIER CASTRO DOMINGUEZ', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922158689', '', '', '', 3, '', '29.173', '2018-12-26', '2025-12-31', '2026-01-01', '260', 1),
(1335, '20250625MR4OE91337X', 'IVONNE CARRILLO CARDONA', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.22', '2019-07-26', '2025-07-31', '2025-08-01', '260', 1),
(1336, '20250625PT3RZ31338F', 'JOHANA EDITH RODRIGUEZ RODRIGUEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921752580', '', '', '', 3, '', '30.99', '2025-02-26', '2025-07-01', '2025-07-02', '260', 1),
(1337, '20250625NY9PQ71339N', 'JONATHAN YAHAIRO CHAVEZ SANTANA (TABCEL)', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581219289', '', '', '', 3, '', '29.187', '2024-01-26', '2025-07-01', '2025-07-02', '260', 1),
(1338, '20250625OF9JJ91340G', 'JUAN MANUEL GARCIA HERNANDEZ', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921433640', '', '', '', 3, '', '34.9', '2019-07-26', '2025-07-31', '2025-08-01', '260', 1),
(1339, '20250625GZ7EU61341N', 'JUAN MANUEL HERNANDEZ LOPEZ', '', '', '', 'BARRIO LOS LLANITOS', 'GENARO CODINA', 'ZACATECAS', 98660, '4426791045', '', '', '', 3, '', '29.236', '2018-08-29', '2025-09-03', '2025-09-04', '260', 1),
(1340, '20250625YA8DS81342Z', 'JULIA HERNANDEZ HERNANDEZ', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.54', '2020-01-26', '2025-07-01', '2025-07-02', '260', 1),
(1341, '20250625MG8OK51343L', 'LEONEL MORALES DE LA CRUZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922021099', '', '', '', 3, '', '34.115', '2023-09-26', '2025-10-01', '2025-10-02', '260', 1),
(1342, '20250625IR2HF41344V', 'LETICIA RODRIGUEZ SAUCEDO', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '492-195-72-45', '', '', '', 3, '', '32.236', '2019-11-26', '2025-12-01', '2025-12-02', '260', 1),
(1343, '20250625XN6AR91345L', 'MARIA ELIZABETH GARCIA MURO', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581163690', '', '', '', 3, '', '34.106', '2019-07-26', '2025-07-31', '2025-08-01', '260', 1),
(1344, '20250625UX4GN31346L', 'MARVELIA HERNANDEZ HERNANDEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921122880', '', '', '', 3, '', '2.245', '2020-11-26', '2025-12-01', '2025-12-02', '260', 1),
(1345, '20250625AN1EU11347D', 'NANCY CASTELLANOS HERRERA', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921290233', '', '', '', 3, '', '29.247', '2024-04-26', '0000-00-00', '2025-06-01', '260', 1),
(1346, '20250625TY6FT81348K', 'PEDRO CAMPOS ROMAN', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '4581071476', '', '', '', 3, '', '30.84', '2022-01-26', '2025-07-01', '2025-07-02', '260', 1),
(1347, '20250625TQ7UX31349R', 'RAUL HERNANDEZ JACOBO', '', '', '', 'BARRIO EL RINCONSITO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922675330', '', '', '', 3, '', '29.242', '2019-08-26', '2025-08-31', '2025-09-01', '260', 1),
(1348, '20250625XG3JD71350G', 'RODOLFO ESQUIVEL CASTRO', '', '', '', 'COLONIA BUENOS AIRES', 'GENARO CODINA', 'ZACATECAS', 98660, '4581065530', '', '', '', 3, '', '32.94', '2017-10-29', '2025-11-03', '2025-11-04', '260', 1),
(1349, '20250625AA1LM21351O', 'ROMEO RODRIGUEZ MORALES', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.112', '2016-10-27', '2025-11-01', '2025-11-02', '260', 1),
(1350, '20250625ML4KP71352T', 'RAYMUNDO CERVANTES HERNANDEZ', '', '', '', 'BARRIO DE LOS LLANITOS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.228', '2024-06-26', '2025-07-01', '2025-07-02', '260', 1),
(1351, '20250625ZK5XQ01353I', 'ARNULFO LOPEZ (GANADERA)', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922381485', '', '', '', 3, '', '34.119', '2024-05-27', '2025-06-01', '2025-06-02', '260', 1),
(1352, '20250625FC0TK31354M', 'DANIEL REZA GONZALEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581174885', '', '', '', 3, '', '32.83', '2016-10-27', '2025-11-01', '2025-11-02', '260', 1),
(1353, '20250625MV6UB01355U', 'EVANGELINA GARCIA ARTEAGA 1', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921071605', '', '', '', 3, '', '32.203', '2019-07-27', '2025-08-01', '2025-08-02', '260', 1),
(1354, '20250625VS8JF51356K', 'FATIMA DEL ROSARIO PADILLA HINOJOSA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921063329', '', '', '', 3, '', '2.122', '2020-03-27', '2025-06-01', '2025-06-02', '260', 2),
(1355, '20250625HS8XT81357H', 'FELIPE MANDUJANO HERRERA', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921288485', '', '', '', 3, '', '30.137', '2024-03-27', '2025-06-01', '2025-06-02', '260', 1),
(1356, '20250625WF4XB41358D', 'JESSICA DEL CARMEN CASTRO MORALES', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '6563386193', '', '', '', 3, '', '30.73', '2021-08-27', '2025-09-01', '2025-09-02', '260', 1),
(1357, '20250625QF5YP51359V', 'JOHAN FABIAN RODRIGUEZ GARCIA', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921591812', '', '', '', 3, '', '29.221', '2025-03-27', '2025-06-01', '2025-06-02', '260', 1),
(1358, '20250625KA2EB41360C', 'JUAN ENRIQUE MARIN JUAREZ', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '5586124917', '', '', '', 3, '', '29.207', '2021-07-27', '2025-08-01', '2025-08-02', '260', 1),
(1359, '20250625KY2SH11361V', 'LIDUVINA GARCIA SAUCEDO', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581188162', '', '', '', 3, '', '29.234', '2021-07-27', '2025-08-01', '2025-08-02', '260', 1),
(1360, '20250625LF4PT51362A', 'MA DE LOS ANGELES ESQUIVEL RODRIGUEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921801571', '', '', '', 3, '', '32.65', '2020-10-27', '2025-11-01', '2025-11-02', '260', 1),
(1361, '20250625FW6OJ01363C', 'MARIA DE LOS ANGELES ACOSTA FRIAS', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581172241', '', '', '', 3, '', '210', '2020-10-27', '2025-11-01', '2025-11-02', '260', 1),
(1362, '20250625DD9PV91364Q', 'MARIA DEL REFUGIO HERNANDEZ HERRERA', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4929976672', '', '', '', 3, '', '29.131', '2018-01-27', '2025-06-01', '2025-06-02', '260', 1),
(1363, '20250625KA8EC21365D', 'MARIA GUADALUPE SANTANA GARCIA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '8175663426', '', '', '', 3, '', '32.197', '2023-07-27', '2025-01-01', '2025-01-02', '260', 2),
(1364, '20250625CD3AA61366V', 'MARICELA GUERRERO MACIAS', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922272426', '', '', '', 3, '', '34.7', '2020-10-27', '2025-11-01', '2025-11-02', '260', 1),
(1365, '20250625NK0NT21367Z', 'MAXIMA HERNANDEZ', '', '', '', 'BARRIO EL RINCONSITO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581230561', '', '', '', 3, '', '29.179', '2019-03-27', '2025-06-01', '2025-06-02', '260', 1),
(1366, '20250625TP1DD71368C', 'NORMA CALDERA ARENAS', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.252', '2020-01-27', '2025-06-01', '2025-06-02', '260', 1),
(1367, '20250625CR7LO01369I', 'OCTAVIO HERRERA JACOBO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922161033', '', '', '', 3, '', '32.211', '2021-09-27', '2025-10-02', '2025-10-03', '260', 1),
(1368, '20250625EY3MC81370W', 'PATRICIA FRIAS DE LA CRUZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '34.56', '2016-10-03', '2025-10-08', '2025-10-09', '260', 1),
(1369, '20250625NT2IS11371I', 'RODRIGO HERNANDEZ ACOSTA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922916934', '', '', '', 3, '', '2.81', '2024-12-27', '2025-06-01', '2025-06-02', '260', 1),
(1370, '20250625GT7TR71372J', 'SANJUANA JAQUELINE ROQUE SAUCEDO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4581291074', '', '', '', 3, '', '29.86', '2020-04-27', '2025-06-01', '2025-06-02', '260', 1),
(1371, '20250625KI1JI21373P', 'YESICA DULCE MARIA CASTRO SANCHEZ', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4921188147', '', '', '', 3, '', '32.122', '2020-04-27', '2025-06-01', '2025-06-02', '260', 1),
(1372, '20250625SN8PD01374F', 'ADRIANA GONZALEZ RODRIGUEZ', '', '', '', 'COLONIA BUENOS AIRES', 'GENARO CODINA', 'ZACATECAS', 98660, '4925443610', '', '', '', 3, '', '32.162', '2023-12-28', '2025-06-02', '2025-06-03', '260', 1),
(1373, '20250625FM4ZV61375W', 'ALFONSA CASTRO MU?OZ', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4922039380', '', '', '', 3, '', '29.101', '2017-11-28', '2025-12-03', '2025-12-04', '260', 1),
(1374, '20250625RU9HY31376G', 'JOSE ALFONSO GARCIA', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.92', '2022-09-28', '2025-05-03', '2025-05-04', '260', 2);
INSERT INTO `clientes` (`id`, `folio`, `nombre`, `domicilio`, `calle`, `colonia`, `comunidad`, `municipio`, `estado`, `cp`, `telefono`, `referencias`, `identificacion`, `comprobante`, `servicio`, `antena`, `direccionip`, `fecha_contrato`, `fecha_limite`, `fecha_corte`, `cuota`, `estatus`) VALUES
(1375, '20250625JG7TX71377F', 'AMPARO ARTEAGA HERNANDEZ  ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.66', '2019-03-28', '2025-06-02', '2025-06-03', '260', 1),
(1376, '20250625VT2FS71378J', 'DANIEL HERNANDEZ HERNADEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581283394', '', '', '', 3, '', '32.153', '2020-12-28', '2025-06-02', '2025-06-03', '260', 1),
(1377, '20250625GB3TQ21379B', 'ELVIA MU?OZ MORALES', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '492-2669926', '', '', '', 3, '', '32.147', '2021-04-28', '2025-06-02', '2025-06-03', '260', 1),
(1378, '20250625CP6QQ61380G', 'GLORIA DIOSDADO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '13469326875', '', '', '', 3, '', '29.206', '2019-10-28', '2025-11-02', '2025-11-03', '260', 1),
(1379, '20250625OZ9BW51381Q', 'JOSE GASPAR DIOSDADO DE LA CRUZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '492-238-9361', '', '', '', 3, '', '29.208', '2021-04-28', '2025-06-02', '2025-06-03', '260', 1),
(1380, '20250625KP3CX01382M', 'JUAN ADRIAN MARTINEZ CASTRO', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581272192', '', '', '', 3, '', '29.251', '2023-10-28', '2025-11-02', '2025-11-03', '260', 1),
(1381, '20250625BD9AD61383S', 'MARIA DE LOS ANGELES HERNANDEZ HERNANDEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922447788', '', '', '', 3, '', '2.172', '2023-03-28', '2025-06-02', '2025-06-03', '260', 1),
(1382, '20250625CC0ZU01384A', 'MONICA GARCIA MONTOYA ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921803808', '', '', '', 3, '', '30.105', '2024-05-28', '2025-06-02', '2025-06-03', '260', 1),
(1383, '20250625XE3NT51385Z', 'SAIRA MARIA HERNADEZ HERNANDEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581304522', '', '', '', 3, '', '32.249', '2020-12-28', '2025-06-02', '2025-06-03', '260', 1),
(1384, '20250625UK9JO21386F', 'YESICA LOPEZ RAMOS', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922888420', '', '', '', 3, '', '32.121', '2022-07-28', '2025-08-02', '2025-08-03', '260', 1),
(1385, '20250625RB5DS81387R', 'ANA LAURA JACOBO REYES', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581237123', '', '', '', 3, '', '32.22', '2022-08-29', '2025-09-03', '2025-09-04', '260', 1),
(1386, '20250625AH4YC21388K', 'BANEIRI YADIRA HERRERA SOTO', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922933898', '', '', '', 3, '', '29.215', '2020-12-29', '2025-06-03', '2025-06-04', '260', 1),
(1387, '20250625DU8IH91389M', 'DANIEL FRIAS DELGADO', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581038759', '', '', '', 3, '', '32.169', '2024-11-29', '2025-12-04', '2025-12-05', '260', 1),
(1388, '20250625NH5QJ81390X', 'JUAN ANTONIO JACOBO ROQUE', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4922644636', '', '', '', 3, '', '32.29', '2022-07-29', '2025-08-03', '2025-08-04', '260', 1),
(1389, '20250625HT4IQ51391I', 'JOSE ARTEAGA PADILLA', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4929267295', '', '', '', 3, '', '29.105', '2021-11-29', '2025-12-04', '2025-12-05', '260', 1),
(1390, '20250625XR7IW61392K', 'JUAN CARLOS MARES TORRES', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4651079791', '', '', '', 3, '', '32.154', '2020-12-29', '2025-06-03', '2025-06-04', '260', 1),
(1391, '20250625FY0RJ31393E', 'HILDA HERNANDEZ DELGADO', '', '', '', 'COLONIA BUENOS AIRES', 'GENARO CODINA', 'ZACATECAS', 98660, '4922450301', '', '', '', 3, '', '32.55', '2024-02-29', '2025-06-03', '2025-06-04', '260', 1),
(1392, '20250625JS0VU81394Q', 'MA VIRGINIA ZAMORA LOPEZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581061181', '', '', '', 3, '', '29.51', '2022-03-29', '2025-06-03', '2025-06-04', '260', 1),
(1393, '20250625PK8PG21395W', 'ROBERTO HERNANDEZ FRIAS', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.66', '2023-11-29', '2025-12-04', '2025-12-05', '260', 1),
(1394, '20250625BG4CS61396F', 'ROSALINA ESQUIVEL MU?OZ', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4927958995', '', '', '', 3, '', '29.189', '2024-01-29', '2025-06-03', '2025-06-04', '260', 1),
(1395, '20250625JS2MX71397R', 'VERONICA MACIAS HERNANDEZ', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581033039', '', '', '', 3, '', '29.249', '2025-03-29', '2025-06-03', '2025-06-04', '260', 1),
(1396, '20250625YM6KG61398T', 'YUNUEN HERRERA ELIAS', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581202197', '', '', '', 3, '', '29.182', '2021-03-29', '2025-06-03', '2025-06-04', '260', 1),
(1397, '20250625KS3NK81399K', 'ARACELI GARCIA DIOSDADO', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581197223', '', '', '', 3, '', '29.104', '2018-07-30', '2025-05-04', '2025-05-05', '260', 2),
(1398, '20250625AJ0RV41400Z', 'ALICIA HERNANDEZ CALDERA', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '6825978999', '', '', '', 3, '', '34.12', '2021-07-21', '2025-07-26', '2025-07-27', '260', 1),
(1399, '20250625SE2SP11401Q', 'BERNARDINO GARCIA HERNANDEZ', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.126', '2019-09-30', '2025-10-05', '2025-10-06', '260', 1),
(1400, '20250625ON7FX41402G', 'CRISTINA HERNANDEZ LOPEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921325088', '', '', '', 3, '', '34.99', '2019-01-30', '2025-06-04', '2025-06-05', '260', 1),
(1401, '20250625TX3QD31403U', 'DELIA HERNANDEZ ARTEAGA', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.116', '2017-03-30', '2025-06-04', '2025-06-05', '260', 1),
(1402, '20250625QV0HS91404G', 'DIANA LAURA HERNANDEZ FRIAS', '', '', '', 'BARRIO EL RINCONSITO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581365003', '', '', '', 3, '', '240', '2017-01-30', '2025-06-04', '2025-06-05', '260', 1),
(1403, '20250625SF9VW91405C', 'EDGAR ARTEAGA CASTRO', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4584483094', '', '', '', 3, '', '30.113', '2021-06-30', '2025-07-05', '2025-07-06', '260', 1),
(1404, '20250625HK4SW91406U', 'ELVIRA SANTANA ', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '34.78', '2016-07-30', '2025-05-04', '2025-05-05', '260', 2),
(1405, '20250625PA1PC01407D', 'GUILLERMINA CERVANTES', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.53', '2018-01-30', '2025-06-04', '2025-06-05', '260', 1),
(1406, '20250625OA3NS61408H', 'JESUS RODRIGUEZ RODRIGUEZ', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.89', '2018-01-30', '2025-06-04', '2025-06-05', '260', 1),
(1407, '20250625JT7OY21409T', 'JOSE REYES HERNANDEZ HERNANDEZ', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4928702678', '', '', '', 3, '', '2.187', '2022-09-30', '2025-10-05', '2025-10-06', '260', 1),
(1408, '20250625UX1HL21410S', 'ALMA YADIRA MONTES ESQUIVEL', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581156443', '', '', '', 3, '', '32.155', '2022-09-30', '2025-10-05', '2025-10-06', '260', 1),
(1409, '20250625QG9WX21411S', 'LAURA DE LA CRUZ HERNANDEZ ', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4921716518', '', '', '', 3, '', '29.102', '2017-01-30', '2025-06-04', '2025-06-05', '260', 1),
(1410, '20250625WK8GR41412K', 'MARIA DEL CARMEN GARCIA', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '146', '2020-05-30', '2025-06-04', '2025-06-05', '260', 1),
(1411, '20250625SA5ID01413I', 'ROSA LUZ HERNANDEZ HERNANDEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4922254037', '', '', '', 3, '', '29.171', '2021-04-30', '2025-01-04', '2025-01-05', '260', 2),
(1412, '20250625WZ7CD91414A', 'SANDRA MU?OZ RODRIGUEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4493473944', '', '', '', 3, '', '29.151', '2021-06-30', '2025-07-05', '2025-07-06', '260', 1),
(1413, '20250625QR5VU31415K', 'YOLANDA SAUCEDO MACIAS', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '32.4', '2023-06-30', '2025-07-05', '2025-07-06', '260', 1),
(1414, '20250625NP8GM71416I', 'CAROLINA VILLANUEVA DELGADO', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4589483131', '', '', '', 3, '', '29.94', '2016-10-31', '2025-11-05', '2025-11-06', '260', 1),
(1415, '20250625NY4IW21417Q', 'CRISTIAN GARCIA RODRIGUEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.114', '2017-05-31', '2025-06-05', '2025-06-06', '260', 1),
(1416, '20250625QN7NF31418Y', 'PARTIDO ACCION NACIONAL', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.112', '2017-05-24', '2025-06-29', '2025-06-30', '260', 1),
(1417, '20250625DL7FB41419R', 'DELMA PATRICIA CASTRO CASTRO ', '', '', '', 'LA CAPILLA', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '34.8', '2016-10-31', '2025-11-05', '2025-11-06', '260', 1),
(1418, '20250625IP8YD71420K', 'ELIZABETH SANTANA MU?OZ', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.38', '2022-06-16', '2025-06-21', '2025-06-22', '260', 1),
(1419, '20250625PC9AV61421C', 'MARIA ELENA GARCIA MACIAS', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921294908', '', '', '', 3, '', '29.174', '2019-12-31', '2025-06-05', '2025-06-06', '260', 1),
(1420, '20250625HX3DR01422D', 'LEXADAN MEDICA S A DE C V  ', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4922044106', '', '', '', 9, '', '30.117', '2023-03-31', '2025-06-05', '2025-06-06', '534', 1),
(1421, '20250625ND2QZ71423D', 'LUIS MANUEL ACOSTA SAUCEDO', '', '', '', '', 'GENARO CODINA', 'ZACATECAS', 98660, '4921130959', '', '', '', 3, '', '29.88', '2022-05-31', '2025-06-05', '2025-06-06', '260', 1),
(1422, '20250625LQ0SF61424D', 'MA FELICITAS SALAZAR JACOBO', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4581045707', '', '', '', 3, '', '29.115', '2016-11-25', '2025-11-30', '2025-12-01', '260', 1),
(1423, '20250625IP8BZ81425Z', 'MA HEIDY SAUCEDO ESQUIVEL', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4921044336', '', '', '', 3, '', '29.9', '2025-01-31', '2025-06-05', '2025-06-06', '260', 1),
(1424, '20250625BC7AQ71426Q', 'MARIA AZUCENA ESQUIVEL DURAN', '', '', '', 'BARRIO LOS LLANITOS', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.229', '2017-05-31', '2025-06-05', '2025-06-06', '260', 1),
(1425, '20250625PQ5BI61427V', 'MARICELA LOPEZ SANTANA', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581152563', '', '', '', 4, '', '29.248', '2023-10-31', '2025-10-21', '2025-10-22', '460', 1),
(1426, '20250625DY4PM51428B', 'OMAR LOPEZ DURAN', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581066702', '', '', '', 3, '', '29.109', '2016-12-23', '2025-12-28', '2025-12-29', '260', 1),
(1427, '20250625HF6EA01429Z', 'ORALIA GARCIA ARTEAGA', '', '', '', 'BARRIO OJO DE AGUA', 'GENARO CODINA', 'ZACATECAS', 98660, '45811571.07', '', '', '', 3, '', '29.183', '2025-01-31', '2025-06-05', '2025-06-06', '260', 1),
(1428, '20250625VG7AZ51430J', 'RAUDEL GARCIA SAUCEDO', '', '', '', 'BARRIO RIO CHICO', 'GENARO CODINA', 'ZACATECAS', 98660, '4581030650', '', '', '', 3, '', '29.214', '2020-01-31', '2025-06-05', '2025-06-06', '260', 1),
(1429, '20250625KD2CD41431P', 'REYNA MARIA CASTRO ALFEREZ', '', '', '', 'BARRIO DE HERNANDEZ', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '30.59', '2017-07-31', '2025-08-05', '2025-08-06', '260', 1),
(1430, '20250625KE9SE51432H', 'SANDRA LOPEZ ACOSTA', '', '', '', 'SAN ISIDRO', 'GENARO CODINA', 'ZACATECAS', 98660, '4921795300', '', '', '', 3, '', '32.97', '2017-07-31', '2025-08-05', '2025-08-06', '260', 1),
(1431, '20250625IZ4KF51433J', 'SARA HERNANDEZ HERNADEZ', '', '', '', 'EL LAUREL', 'GENARO CODINA', 'ZACATECAS', 98660, '4581180526', '', '', '', 3, '', '32.16', '2022-08-31', '2025-09-05', '2025-09-06', '260', 1),
(1432, '20250625LF0MW91434A', 'LORENA GARCIA MARES', '', '', '', 'COLONIA SIERRA FRIA', 'GENARO CODINA', 'ZACATECAS', 98660, '4581026197', '', '', '', 3, '', '34.6', '2019-01-12', '2025-06-17', '2025-06-18', '0', 1),
(1433, '20250625XV3QW01435E', 'NEDER ARTEAGA', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.71', '2020-05-12', '2025-06-17', '2025-06-18', '120', 1),
(1434, '20250625NI4IX81436Y', 'LEOPOLDO DOMINGUEZ', '', '', '', 'PLAZA DE CASTRO / CENTRO', 'GENARO CODINA', 'ZACATECAS', 98660, '', '', '', '', 3, '', '29.67', '2016-08-26', '2025-05-31', '2025-06-01', '260', 2),
(1435, '20250625AS1ER31437Z', 'MANUEL GARCIA HERNANDEZ', '', '', '', 'BARRIO DE ARTEAGAS', 'GENARO CODINA', 'ZACATECAS', 98660, '4589483104', '', '', '', 3, '', '192.168.29.45', '2025-05-02', '2025-06-07', '2025-06-08', '260', 1),
(1436, '', '', '', '', '', '', '', '', 0, '', '', '', '', 0, '', '', '0000-00-00', '0000-00-00', '0000-00-00', '260', 0),
(1437, '', '', '', '', '', '', '', '', 0, '', '', '', '', 0, '', '', '0000-00-00', '0000-00-00', '0000-00-00', '260', 0);

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
  `folio_corte` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `tecnico` int(11) DEFAULT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cortes`
--

INSERT INTO `cortes` (`id`, `folio_cliente`, `username`, `folio_corte`, `fecha`, `tecnico`, `estatus`) VALUES
(4, '20250625PQ1WD31Y', 'aebarba', 'C2025-0004', '2025-05-15', 1, 1),
(6, '20250625PB6UR73C', 'aebarba', 'C2025-0006', '2025-05-14', 3, 1),
(7, '20250625JX1UD14C', 'aebarba', 'C2025-0007', '2025-06-19', 4, 1),
(8, '20250625OP0IH17N', 'aebarba', 'C2025-0008', '2025-06-26', 4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corte_caja`
--

CREATE TABLE `corte_caja` (
  `id` int(11) NOT NULL,
  `usr` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `estatus` int(11) NOT NULL COMMENT '1 => cerrado, 0 o null => abierto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `corte_caja`
--

INSERT INTO `corte_caja` (`id`, `usr`, `fecha`, `estatus`) VALUES
(4, 1, '2025-07-12 17:24:00', 0),
(5, 1, '2025-07-14 12:21:23', 0),
(6, 2, '2025-07-14 12:22:01', 1),
(7, 3, '2025-07-14 12:22:27', 1);

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
  `fecha_asignacion` date DEFAULT NULL,
  `estatus` int(11) NOT NULL,
  `fecha_reporte` datetime NOT NULL,
  `fecha_resolucion` datetime DEFAULT NULL,
  `comentario_tecnico` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `incidencias`
--

INSERT INTO `incidencias` (`id`, `folio_incidencia`, `descripcion`, `folio_cliente`, `username`, `tecnico`, `fecha_asignacion`, `estatus`, `fecha_reporte`, `fecha_resolucion`, `comentario_tecnico`) VALUES
(13, 'RI2025-0001', 'Falla en su casa', '20250625KD2CD41431P', 'aebarba', 1, NULL, 1, '2025-07-14 00:00:00', NULL, NULL),
(14, 'RI2025-0014', 'No tiene internet', '20250625HF6EA01429Z', 'aebarba', 4, NULL, 1, '2025-07-14 00:00:00', NULL, NULL);

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
-- Estructura de tabla para la tabla `log_users`
--

CREATE TABLE `log_users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `accion` int(11) NOT NULL,
  `hora` datetime NOT NULL,
  `folio_cliente` varchar(35) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `log_users`
--

INSERT INTO `log_users` (`id`, `username`, `accion`, `hora`, `folio_cliente`) VALUES
(1, 'jesusrlv', 22, '2025-06-03 12:17:32', 'NA'),
(2, 'aebarba', 22, '2025-06-03 12:18:04', 'NA'),
(3, 'jesusrlv', 22, '2025-06-03 12:19:25', 'NA'),
(4, 'aebarba', 19, '2025-06-03 12:21:01', 'NA'),
(5, 'aebarba', 22, '2025-06-03 12:27:20', 'NA'),
(6, 'jesusrlv', 22, '2025-06-03 12:45:12', 'NA'),
(7, 'aebarba', 21, '2025-06-03 12:45:25', 'NA'),
(8, 'aebarba', 30, '2025-06-03 17:04:14', 'NA'),
(9, 'aebarba', 26, '2025-06-03 17:16:31', 'NA'),
(10, 'aebarba', 38, '2025-06-03 17:16:53', 'NA'),
(11, 'aebarba', 33, '2025-06-03 22:56:40', 'NA'),
(12, 'aebarba', 33, '2025-06-03 23:00:25', 'NA'),
(13, 'aebarba', 27, '2025-06-03 23:25:07', 'NA'),
(14, 'aebarba', 43, '2025-06-03 23:25:22', 'NA'),
(15, 'aebarba', 21, '2025-06-04 15:13:07', 'NA'),
(16, 'aebarba', 5, '2025-06-04 17:50:36', 'NA'),
(17, 'aebarba', 6, '2025-06-04 17:50:36', 'NA'),
(18, 'aebarba', 4, '2025-06-04 19:50:48', 'NA'),
(19, 'aebarba', 4, '2025-06-04 20:06:21', 'NA'),
(20, 'aebarba', 4, '2025-06-04 20:13:28', 'NA'),
(21, 'aebarba', 5, '2025-06-06 16:13:36', 'NA'),
(22, 'aebarba', 6, '2025-06-06 16:13:36', 'NA'),
(23, 'aebarba', 5, '2025-06-06 17:35:49', 'NA'),
(24, 'aebarba', 6, '2025-06-06 17:35:49', 'NA'),
(25, 'aebarba', 5, '2025-06-06 17:36:41', 'NA'),
(26, 'aebarba', 5, '2025-06-06 17:49:00', 'NA'),
(27, 'aebarba', 6, '2025-06-06 17:49:00', 'NA'),
(28, 'aebarba', 5, '2025-06-06 17:50:19', 'NA'),
(29, 'aebarba', 6, '2025-06-06 17:50:19', 'NA'),
(30, 'aebarba', 5, '2025-06-06 17:52:40', 'NA'),
(31, 'aebarba', 6, '2025-06-06 17:52:40', 'NA'),
(32, 'aebarba', 6, '2025-06-06 17:56:30', 'NA'),
(33, 'aebarba', 6, '2025-06-06 17:56:30', 'NA'),
(34, 'aebarba', 6, '2025-06-06 17:56:30', 'NA'),
(35, 'aebarba', 5, '2025-06-06 17:56:30', 'NA'),
(36, 'aebarba', 6, '2025-06-06 17:56:30', 'NA'),
(37, 'aebarba', 5, '2025-06-06 17:58:19', 'NA'),
(38, 'aebarba', 6, '2025-06-06 18:00:19', 'NA'),
(39, 'aebarba', 6, '2025-06-06 18:00:19', 'NA'),
(40, 'aebarba', 5, '2025-06-06 18:00:19', 'NA'),
(41, 'aebarba', 6, '2025-06-06 18:00:19', 'NA'),
(42, 'aebarba', 6, '2025-06-06 18:02:41', 'NA'),
(43, 'aebarba', 6, '2025-06-06 18:02:41', 'NA'),
(44, 'aebarba', 6, '2025-06-06 18:02:41', 'NA'),
(45, 'aebarba', 6, '2025-06-06 18:02:41', 'NA'),
(46, 'aebarba', 6, '2025-06-06 18:02:41', 'NA'),
(47, 'aebarba', 5, '2025-06-06 18:02:41', 'NA'),
(48, 'aebarba', 6, '2025-06-06 18:02:41', 'NA'),
(49, 'aebarba', 6, '2025-06-06 18:02:41', 'NA'),
(50, 'aebarba', 5, '2025-06-17 14:01:39', 'NA'),
(51, 'aebarba', 6, '2025-06-17 14:01:39', 'NA'),
(52, 'aebarba', 6, '2025-06-17 14:01:39', 'NA'),
(53, 'aebarba', 6, '2025-06-17 14:01:39', 'NA'),
(54, 'aebarba', 6, '2025-06-17 14:01:39', 'NA'),
(55, 'aebarba', 6, '2025-06-17 14:01:39', 'NA'),
(56, 'aebarba', 5, '2025-06-17 14:02:33', 'NA'),
(57, 'aebarba', 6, '2025-06-17 14:02:33', 'NA'),
(58, 'aebarba', 6, '2025-06-17 14:02:33', 'NA'),
(59, 'aebarba', 5, '2025-06-17 14:08:09', 'NA'),
(60, 'aebarba', 6, '2025-06-17 14:08:09', 'NA'),
(61, 'aebarba', 6, '2025-06-17 14:08:09', 'NA'),
(62, 'aebarba', 5, '2025-06-17 14:12:01', 'NA'),
(63, 'aebarba', 6, '2025-06-17 14:12:01', 'NA'),
(64, 'aebarba', 6, '2025-06-17 14:12:01', 'NA'),
(65, 'aebarba', 6, '2025-06-17 14:12:01', 'NA'),
(66, 'aebarba', 6, '2025-06-17 14:12:01', 'NA'),
(67, 'aebarba', 5, '2025-06-17 14:13:52', 'NA'),
(68, 'aebarba', 6, '2025-06-17 14:13:52', 'NA'),
(69, 'aebarba', 6, '2025-06-17 14:13:52', 'NA'),
(70, 'aebarba', 6, '2025-06-17 14:13:52', 'NA'),
(71, 'aebarba', 6, '2025-06-17 14:13:52', 'NA'),
(72, 'aebarba', 22, '2025-06-17 14:22:57', 'NA'),
(73, 'color', 21, '2025-06-17 14:23:08', 'NA'),
(74, 'color', 22, '2025-06-17 14:23:51', 'NA'),
(75, 'aebarba', 21, '2025-06-17 14:23:59', 'NA'),
(76, 'aebarba', 21, '2025-06-18 11:26:21', 'NA'),
(77, 'aebarba', 8, '2025-06-18 11:26:39', 'NA'),
(78, 'aebarba', 19, '2025-06-18 11:27:02', 'NA'),
(79, 'aebarba', 5, '2025-06-18 11:30:36', 'NA'),
(80, 'aebarba', 6, '2025-06-18 11:30:36', 'NA'),
(81, 'aebarba', 6, '2025-06-18 11:30:36', 'NA'),
(82, 'aebarba', 6, '2025-06-18 11:30:36', 'NA'),
(83, 'aebarba', 6, '2025-06-18 11:30:36', 'NA'),
(84, 'aebarba', 6, '2025-06-18 11:30:36', 'NA'),
(85, 'aebarba', 6, '2025-06-18 11:30:36', 'NA'),
(86, 'aebarba', 6, '2025-06-18 11:30:36', 'NA'),
(87, 'aebarba', 6, '2025-06-18 11:30:36', 'NA'),
(88, 'aebarba', 6, '2025-06-18 11:30:36', 'NA'),
(89, 'aebarba', 6, '2025-06-18 11:30:36', 'NA'),
(90, 'aebarba', 6, '2025-06-18 11:30:36', 'NA'),
(91, 'aebarba', 6, '2025-06-18 11:30:36', 'NA'),
(92, 'aebarba', 6, '2025-06-18 11:30:36', 'NA'),
(93, 'aebarba', 6, '2025-06-18 11:30:36', 'NA'),
(94, 'aebarba', 6, '2025-06-18 11:30:36', 'NA'),
(95, 'aebarba', 6, '2025-06-18 11:30:36', 'NA'),
(96, 'aebarba', 6, '2025-06-18 11:30:36', 'NA'),
(97, 'aebarba', 8, '2025-06-18 11:31:48', 'NA'),
(98, 'aebarba', 6, '2025-06-18 11:55:19', 'NA'),
(99, 'aebarba', 5, '2025-06-18 11:55:19', 'NA'),
(100, 'aebarba', 6, '2025-06-18 11:55:19', 'NA'),
(101, 'aebarba', 21, '2025-06-18 14:18:08', 'NA'),
(102, 'aebarba', 21, '2025-06-18 15:03:20', 'NA'),
(103, 'aebarba', 21, '2025-06-19 14:59:37', 'NA'),
(104, 'aebarba', 21, '2025-06-20 11:51:47', 'NA'),
(105, 'aebarba', 6, '2025-06-20 11:52:09', 'NA'),
(106, 'aebarba', 5, '2025-06-20 11:52:09', 'NA'),
(107, 'aebarba', 6, '2025-06-20 11:52:09', 'NA'),
(108, 'aebarba', 5, '2025-06-20 12:09:25', 'NA'),
(109, 'aebarba', 6, '2025-06-20 12:09:25', 'NA'),
(110, 'aebarba', 6, '2025-06-20 12:09:25', 'NA'),
(111, 'aebarba', 5, '2025-06-20 12:14:29', 'NA'),
(112, 'aebarba', 6, '2025-06-20 12:14:29', 'NA'),
(113, 'aebarba', 21, '2025-06-20 12:26:51', 'NA'),
(114, 'aebarba', 21, '2025-06-23 15:40:16', 'NA'),
(115, 'aebarba', 21, '2025-06-25 11:36:17', 'NA'),
(116, 'aebarba', 5, '2025-06-25 11:45:27', 'NA'),
(117, 'aebarba', 6, '2025-06-25 11:45:27', 'NA'),
(118, 'aebarba', 5, '2025-06-25 11:52:43', 'NA'),
(119, 'aebarba', 6, '2025-06-25 11:52:43', 'NA'),
(120, 'aebarba', 5, '2025-06-25 11:53:58', 'NA'),
(121, 'aebarba', 6, '2025-06-25 11:53:58', 'NA'),
(122, 'aebarba', 5, '2025-06-25 11:55:01', 'NA'),
(123, 'aebarba', 6, '2025-06-25 11:55:01', 'NA'),
(124, 'aebarba', 21, '2025-06-26 12:22:36', 'NA'),
(125, 'aebarba', 21, '2025-06-30 10:17:24', 'NA'),
(126, 'aebarba', 6, '2025-07-01 12:00:23', 'NA'),
(127, 'aebarba', 5, '2025-07-01 12:00:23', 'NA'),
(128, 'aebarba', 6, '2025-07-01 12:00:23', 'NA'),
(129, 'aebarba', 21, '2025-07-01 22:37:55', 'NA'),
(130, 'aebarba', 21, '2025-07-02 11:36:04', 'NA'),
(131, 'aebarba', 5, '2025-07-02 11:40:31', 'NA'),
(132, 'aebarba', 6, '2025-07-02 11:40:31', 'NA'),
(133, 'aebarba', 6, '2025-07-02 11:40:31', 'NA'),
(134, 'aebarba', 21, '2025-07-03 09:28:48', 'NA'),
(135, 'aebarba', 21, '2025-07-03 22:04:43', 'NA'),
(136, 'aebarba', 5, '2025-07-03 22:07:03', 'NA'),
(137, 'aebarba', 6, '2025-07-03 22:07:03', 'NA'),
(138, 'aebarba', 6, '2025-07-03 22:07:03', 'NA'),
(139, 'aebarba', 5, '2025-07-03 23:09:02', 'NA'),
(140, 'aebarba', 6, '2025-07-03 23:09:02', 'NA'),
(141, 'aebarba', 5, '2025-07-03 23:12:51', 'NA'),
(142, 'aebarba', 6, '2025-07-03 23:12:51', 'NA'),
(143, 'aebarba', 6, '2025-07-03 23:12:51', 'NA'),
(144, 'aebarba', 5, '2025-07-03 23:17:08', 'NA'),
(145, 'aebarba', 6, '2025-07-03 23:17:08', 'NA'),
(146, 'aebarba', 5, '2025-07-03 23:18:03', 'NA'),
(147, 'aebarba', 6, '2025-07-03 23:18:04', 'NA'),
(148, 'aebarba', 5, '2025-07-03 23:19:33', 'NA'),
(149, 'aebarba', 6, '2025-07-03 23:19:33', 'NA'),
(150, 'aebarba', 5, '2025-07-03 23:22:03', 'NA'),
(151, 'aebarba', 6, '2025-07-03 23:22:03', 'NA'),
(152, 'aebarba', 6, '2025-07-03 23:22:03', 'NA'),
(153, 'aebarba', 5, '2025-07-03 23:22:39', 'NA'),
(154, 'aebarba', 6, '2025-07-03 23:22:39', 'NA'),
(155, 'aebarba', 5, '2025-07-03 23:24:11', 'NA'),
(156, 'aebarba', 6, '2025-07-03 23:24:11', 'NA'),
(157, 'aebarba', 6, '2025-07-03 23:24:12', 'NA'),
(158, 'aebarba', 5, '2025-07-11 17:01:56', 'NA'),
(159, 'aebarba', 6, '2025-07-11 17:01:56', 'NA'),
(160, 'aebarba', 21, '2025-07-12 00:46:10', 'NA'),
(161, 'aebarba', 21, '2025-07-12 09:48:30', 'NA'),
(162, 'aebarba', 21, '2025-07-12 17:04:14', 'NA'),
(163, 'aebarba', 44, '2025-07-12 18:17:19', 'NA'),
(164, 'aebarba', 45, '2025-07-12 18:47:20', 'NA'),
(165, 'aebarba', 21, '2025-07-13 22:47:06', 'NA'),
(166, 'aebarba', 21, '2025-07-14 10:27:45', 'NA'),
(167, 'aebarba', 35, '2025-07-14 11:04:05', 'NA'),
(168, 'aebarba', 19, '2025-07-14 11:24:20', 'NA'),
(169, 'aebarba', 19, '2025-07-14 11:25:02', 'NA'),
(170, 'aebarba', 4, '2025-07-14 12:21:23', 'NA'),
(171, 'aebarba', 22, '2025-07-14 12:21:27', 'NA'),
(172, '', 22, '2025-07-14 12:21:33', 'NA'),
(173, 'color', 21, '2025-07-14 12:21:51', 'NA'),
(174, 'color', 4, '2025-07-14 12:22:01', 'NA'),
(175, 'color', 22, '2025-07-14 12:22:13', 'NA'),
(176, 'nuevo', 21, '2025-07-14 12:22:18', 'NA'),
(177, 'nuevo', 4, '2025-07-14 12:22:27', 'NA'),
(178, 'nuevo', 22, '2025-07-14 12:22:32', 'NA'),
(179, 'aebarba', 21, '2025-07-14 12:22:40', 'NA'),
(180, 'aebarba', 6, '2025-07-14 12:24:47', 'NA'),
(181, 'aebarba', 5, '2025-07-14 12:24:47', 'NA'),
(182, 'aebarba', 6, '2025-07-14 12:24:47', 'NA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `otros_gastos`
--

CREATE TABLE `otros_gastos` (
  `id` int(11) NOT NULL,
  `concepto` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `id_ext` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_sistema` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `otros_gastos`
--

INSERT INTO `otros_gastos` (`id`, `concepto`, `cantidad`, `fecha`, `id_ext`, `fecha_sistema`) VALUES
(1, '1', '1.00', '2025-06-23', 'aebarba', '2025-06-30 11:23:04'),
(2, '11', '1.00', '2025-06-23', 'aebarba', '2025-06-30 11:23:34'),
(3, 'qwwwq', '11.00', '2025-06-23', 'aebarba', '2025-06-30 11:24:24'),
(4, 'wqasdasd', '1223.00', '2025-06-23', 'aebarba', '2025-06-30 11:26:25'),
(5, '1111', '12345.00', '2025-06-23', 'aebarba', '2025-06-30 11:31:58'),
(6, '111', '111.00', '2025-06-23', 'aebarba', '2025-06-30 11:32:57'),
(7, '111', '111.00', '2025-06-23', 'aebarba', '2025-06-30 11:33:11'),
(8, '11111', '1111.00', '2025-06-23', 'aebarba', '2025-06-30 11:33:26'),
(9, 'Comida encargo por la tarde', '12.00', '2025-07-01', 'aebarba', '2025-06-30 11:33:45'),
(10, 'Comida', '100.00', '2025-07-01', 'aebarba', '2025-07-01 14:07:06'),
(11, 'gigkj', '56.00', '2025-07-01', 'aebarba', '2025-07-01 23:00:46'),
(12, 'ohuig', '154.00', '2025-07-01', 'aebarba', '2025-07-01 23:00:57'),
(13, 'gda', '88.00', '2025-07-03', 'aebarba', '2025-07-01 23:06:18'),
(14, 'gdsag', '466.00', '2025-07-01', 'aebarba', '2025-07-01 23:13:36'),
(15, 'pruega hide', '855.00', '2025-07-01', 'aebarba', '2025-07-01 23:42:16'),
(16, 'pizza', '150.00', '2025-07-02', 'aebarba', '2025-07-02 11:39:42'),
(17, 'cafe', '25.00', '2025-07-02', 'aebarba', '2025-07-02 11:39:59'),
(18, 'Pago de comida', '300.00', '2025-07-14', 'aebarba', '2025-07-14 12:25:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `num_pago` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_pago` date NOT NULL,
  `folio_contrato` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `concepto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `periodo` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `annio` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_pago` int(11) NOT NULL,
  `descuento` decimal(5,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `num_pago`, `fecha_pago`, `folio_contrato`, `concepto`, `periodo`, `annio`, `tipo_pago`, `descuento`, `total`) VALUES
(1, 'CW2025-0001', '2025-07-01', '20250625SY3NQ61297T', 'Pago oportuno', '2025-07', '2025', 1, '0.00', '260.00'),
(2, 'CW2025-0001-FAt-1', '2025-07-01', '20250625SY3NQ61297T', 'Adeudo', '2025-06', '2025', 1, '0.00', '260.00'),
(3, 'CW2025-0001-FAt-1', '2025-07-01', '20250625SY3NQ61297T', 'Recargo', '2025-06', '2025', 1, '0.00', '15.00'),
(4, 'CW2025-0003', '2025-07-02', '20250625BB0MD622G', 'Pago oportuno', '2025-07', '2025', 1, '0.00', '260.00'),
(5, 'CW2025-0003-FAt-1', '2025-07-02', '20250625BB0MD622G', 'Adeudo', '2025-06', '2025', 1, '0.00', '260.00'),
(6, 'CW2025-0003-FAt-1', '2025-07-02', '20250625BB0MD622G', 'Recargo', '2025-06', '2025', 1, '0.00', '15.00'),
(7, 'CW2025-0005', '2025-07-03', '20250625FY9GS974G', 'Pago oportuno', '2025-07', '2025', 1, '0.00', '270.00'),
(8, 'CW2025-0005-FAt-1', '2025-07-03', '20250625FY9GS974G', 'Adeudo', '2025-06', '2025', 1, '0.00', '270.00'),
(9, 'CW2025-0005-FAt-1', '2025-07-03', '20250625FY9GS974G', 'Recargo', '2025-06', '2025', 1, '0.00', '15.00'),
(10, 'CW2025-0007', '2025-07-03', '20250625RV8II241Z', 'Pago oportuno', '2025-07', '2025', 1, '0.00', '270.00'),
(11, 'CW2025-0008', '2025-07-03', '20250625MR3DN8545J', 'Pago oportuno', '2025-07', '2025', 1, '0.00', '270.00'),
(12, 'CW2025-0008-FAt-1', '2025-07-03', '20250625MR3DN8545J', 'Adeudo', '2025-06', '2025', 1, '0.00', '270.00'),
(13, 'CW2025-0008-FAt-1', '2025-07-03', '20250625MR3DN8545J', 'Recargo', '2025-06', '2025', 1, '0.00', '15.00'),
(14, 'CW2025-0010', '2025-07-03', '20250625AQ7VL2125X', 'Pago oportuno', '2025-07', '2025', 1, '0.00', '470.00'),
(15, 'CW2025-0011', '2025-07-03', '20250625WF7JU3155D', 'Pago oportuno', '2025-07', '2025', 1, '0.00', '270.00'),
(16, 'CW2025-0012', '2025-07-03', '20250625IZ5YU9130K', 'Pago oportuno', '2025-07', '2025', 1, '0.00', '270.00'),
(17, 'CW2025-0013', '2025-07-03', '20250625PQ1WD31Y', 'Pago oportuno', '2025-07', '2025', 1, '0.00', '260.00'),
(18, 'CW2025-0013-FAt-1', '2025-07-03', '20250625PQ1WD31Y', 'Adeudo', '2025-06', '2025', 1, '0.00', '260.00'),
(19, 'CW2025-0013-FAt-1', '2025-07-03', '20250625PQ1WD31Y', 'Recargo', '2025-06', '2025', 1, '0.00', '15.00'),
(20, 'CW2025-0015', '2025-07-03', '20250625AN2TU02F', 'Pago oportuno', '2025-07', '2025', 1, '0.00', '260.00'),
(21, 'CW2025-0016', '2025-07-03', '20250625QO5MZ7310G', 'Pago oportuno', '2025-07', '2025', 1, '0.00', '260.00'),
(22, 'CW2025-0016-FAt-1', '2025-07-03', '20250625QO5MZ7310G', 'Adeudo', '2025-06', '2025', 1, '0.00', '260.00'),
(23, 'CW2025-0016-FAt-1', '2025-07-03', '20250625QO5MZ7310G', 'Recargo', '2025-06', '2025', 1, '0.00', '15.00'),
(26, 'CW2025-0018', '2025-07-11', '20250625SU0DH1986C', 'Pago oportuno', '2025-07', '2025', 1, '0.00', '260.00'),
(27, 'CW2025-0018', '2025-07-11', '20250625SU0DH1986C', 'Costo instalación', '2025-07', '2025', 1, '0.00', '1060.00'),
(28, 'CW2025-0019', '2025-07-14', '20250625OX4TR55E', 'Pago oportuno', '2025-07', '2025', 1, '0.00', '260.00'),
(29, 'CW2025-0019-FAt-1', '2025-07-14', '20250625OX4TR55E', 'Adeudo', '2025-06', '2025', 1, '0.00', '260.00'),
(30, 'CW2025-0019-FAt-1', '2025-07-14', '20250625OX4TR55E', 'Recargo', '2025-06', '2025', 1, '0.00', '15.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_generales`
--

CREATE TABLE `pagos_generales` (
  `id` int(11) NOT NULL,
  `folio_contrato` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `tarjeta` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `folio_pago` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_pago` date NOT NULL,
  `tipo_pago` int(11) NOT NULL,
  `periodo` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_ext` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pagos_generales`
--

INSERT INTO `pagos_generales` (`id`, `folio_contrato`, `total`, `tarjeta`, `folio_pago`, `fecha_pago`, `tipo_pago`, `periodo`, `id_ext`) VALUES
(1, '20250625SY3NQ61297T', '260.00', '', 'CW2025-0001-FAt-1', '2025-07-01', 1, '2025-06', 'aebarba'),
(2, '20250625SY3NQ61297T', '535.00', '', 'CW2025-0001', '2025-07-01', 1, '2025-07', 'aebarba'),
(3, '20250625BB0MD622G', '260.00', '', 'CW2025-0003-FAt-1', '2025-07-02', 1, '2025-06', 'aebarba'),
(4, '20250625BB0MD622G', '535.00', '', 'CW2025-0003', '2025-07-02', 1, '2025-07', 'aebarba'),
(5, '20250625FY9GS974G', '270.00', '', 'CW2025-0005-FAt-1', '2025-07-03', 1, '2025-06', 'aebarba'),
(6, '20250625FY9GS974G', '555.00', '', 'CW2025-0005', '2025-07-03', 1, '2025-07', 'aebarba'),
(7, '20250625RV8II241Z', '270.00', '', 'CW2025-0007', '2025-07-03', 1, '2025-07', 'aebarba'),
(8, '20250625MR3DN8545J', '270.00', '', 'CW2025-0008-FAt-1', '2025-07-03', 1, '2025-06', 'aebarba'),
(9, '20250625MR3DN8545J', '555.00', '', 'CW2025-0008', '2025-07-03', 1, '2025-07', 'aebarba'),
(10, '20250625AQ7VL2125X', '470.00', '', 'CW2025-0010', '2025-07-03', 1, '2025-07', 'aebarba'),
(11, '20250625WF7JU3155D', '270.00', '', 'CW2025-0011', '2025-07-03', 1, '2025-07', 'aebarba'),
(12, '20250625IZ5YU9130K', '270.00', '', 'CW2025-0012', '2025-07-03', 1, '2025-07', 'aebarba'),
(13, '20250625PQ1WD31Y', '260.00', '', 'CW2025-0013-FAt-1', '2025-07-03', 1, '2025-06', 'aebarba'),
(14, '20250625PQ1WD31Y', '535.00', '', 'CW2025-0013', '2025-07-03', 1, '2025-07', 'aebarba'),
(15, '20250625AN2TU02F', '260.00', '', 'CW2025-0015', '2025-07-03', 1, '2025-07', 'aebarba'),
(16, '20250625QO5MZ7310G', '260.00', '', 'CW2025-0016-FAt-1', '2025-07-03', 1, '2025-06', 'aebarba'),
(17, '20250625QO5MZ7310G', '535.00', '', 'CW2025-0016', '2025-07-03', 1, '2025-07', 'aebarba'),
(18, '20250625SU0DH1986C', '1320.00', '', 'CW2025-0018', '2025-07-11', 1, '2025-07', 'aebarba'),
(19, '20250625OX4TR55E', '260.00', '', 'CW2025-0019-FAt-1', '2025-07-14', 1, '2025-06', 'aebarba'),
(20, '20250625OX4TR55E', '535.00', '', 'CW2025-0019', '2025-07-14', 1, '2025-07', 'aebarba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `id` int(11) NOT NULL,
  `promo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `tipo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descuento` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `id_catalogo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `promociones`
--

INSERT INTO `promociones` (`id`, `promo`, `fecha_inicio`, `fecha_fin`, `tipo`, `descuento`, `estatus`, `id_catalogo`) VALUES
(4, 'Promoción de prueba', '2025-04-11', '2025-04-11', 'Mensualidad', 70, 1, 1),
(5, 'prueba', '2025-06-06', '2025-06-18', 'Mensualidad', 100, 1, NULL),
(6, 'prueba 2', '2025-07-17', '2025-07-31', 'Recargos', 200, 1, NULL),
(7, 'Prueba promo44', '2025-05-28', '2025-05-30', 'Mensualidad', 100, 1, NULL),
(8, 'Prueba de nuevo', '2025-05-29', '2025-06-06', 'Instalación', 200, 1, NULL);

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
(2, 'a', 1, '2025-03-21', '2025-04-07', ''),
(3, 'Fernando González', 1, '2025-05-28', NULL, ''),
(4, 'Mario González', 1, '2025-05-28', NULL, ''),
(5, 'Alejandro Reyes', 0, '2025-05-28', '2025-05-28', '');

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
(1, 'aebarba', '123456789', 'Ana Elisa Barba', 1, 1, '2025-03-11', '0000-00-00 00:00:00', ''),
(2, 'color', 'color', 'user color', 2, 1, '2025-04-07', '0000-00-00 00:00:00', '#64c1da'),
(3, 'nuevo', '12345', 'Luis', 3, 1, '2025-05-28', '0000-00-00 00:00:00', '#008080');

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
-- Indices de la tabla `catalogo_logs`
--
ALTER TABLE `catalogo_logs`
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
-- Indices de la tabla `corte_caja`
--
ALTER TABLE `corte_caja`
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
-- Indices de la tabla `log_users`
--
ALTER TABLE `log_users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `otros_gastos`
--
ALTER TABLE `otros_gastos`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `catalogo_adelanto`
--
ALTER TABLE `catalogo_adelanto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `catalogo_comunidades`
--
ALTER TABLE `catalogo_comunidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `catalogo_estado`
--
ALTER TABLE `catalogo_estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `catalogo_instalacion`
--
ALTER TABLE `catalogo_instalacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `catalogo_logs`
--
ALTER TABLE `catalogo_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `catalogo_municipio`
--
ALTER TABLE `catalogo_municipio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `catalogo_paquetes`
--
ALTER TABLE `catalogo_paquetes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1438;

--
-- AUTO_INCREMENT de la tabla `conceptos`
--
ALTER TABLE `conceptos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cortes`
--
ALTER TABLE `cortes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `corte_caja`
--
ALTER TABLE `corte_caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `incidencias`
--
ALTER TABLE `incidencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `logs_login`
--
ALTER TABLE `logs_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `log_users`
--
ALTER TABLE `log_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT de la tabla `otros_gastos`
--
ALTER TABLE `otros_gastos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `pagos_generales`
--
ALTER TABLE `pagos_generales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `promociones`
--
ALTER TABLE `promociones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tecnicos`
--
ALTER TABLE `tecnicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
