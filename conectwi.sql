-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 07-06-2025 a las 01:03:16
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
  `costo` decimal(5,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `catalogo_instalacion`
--

INSERT INTO `catalogo_instalacion` (`id`, `tipo_instalacion`, `costo`) VALUES
(1, 'Instalación sencilla', '1.000');

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
(43, 'Eliminar Comunidad');

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
  `costo` decimal(5,2) NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `catalogo_paquetes`
--

INSERT INTO `catalogo_paquetes` (`id`, `paquetes`, `velocidad`, `costo`, `estatus`) VALUES
(1, 'Básico', 7, '350.00', 1),
(2, 'Intermedio', 12, '550.00', 1),
(3, 'Avanzado', 18, '850.00', 1),
(7, 'Paquete Muevas', 25, '400.00', 1),
(8, 'Paquete de prueba jesusrlv', 1, '1.00', 1);

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
(4, '202502242354403E354EA3', 'Ana Elisa B', 'Tulipanes 12 A', NULL, NULL, '2', '2', '1', 98608, '4915000', 'Casa', 'INE', 'luz', 2, 'Hwauei', '127.0.0.1', '2024-01-03', '2025-05-13', '2025-05-08', '12.12', 1),
(5, '20250410155630FE88FECB', 'Contrato con antena', '2', NULL, NULL, '1', '1', '1', 98000, '99999', 'Casa', 'INE', 'agua', 1, '1', '', '2025-04-10', '2025-05-16', '2025-05-11', '350.00', 1),
(6, '2025041015593805441E2E', 'Contrato con antena 2', '3', NULL, NULL, '1', '', '1', 98000, '99999', 'Casa', 'INE', 'agua', 2, '1', '', '2025-04-10', '2025-05-18', '2025-05-13', '550.00', 1),
(7, '20250410160422DC243E3A', 'Contrato con antena 3', '4', NULL, NULL, '1', '1', '1', 98000, '99999', 'Casa', 'INE', 'agua', 3, '1', '', '2025-04-10', '2025-05-14', '2025-05-09', '850.00', 1),
(8, '20250410160533EF9C5D6A', 'Contrato con antena 4', '4', NULL, NULL, '2', '1', '1', 98000, '99999', 'Casa', 'INE', 'agua', 1, '1', '10.125.80.12', '2025-06-05', '2025-05-15', '2025-05-10', '350.00', 1);

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
(4, '202502242354403E354EAA', 'aebarba', 'CORTE-2025-0004', '2025-05-15', NULL, 1),
(5, '202502242354403E354EAA', 'aebarba', 'CORTE-2025-0005', '2025-05-16', NULL, 1),
(6, '202502242354403E354EAA', 'aebarba', 'C2025-0006', '2025-05-14', NULL, 1);

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
(3, 1, '2025-06-04 20:13:28', 1);

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
(1, 'RI2025-0001', 'Prueba de edición de reportes de fallas', '202502242354403E354EA3', 'annaeliza', 1, '2025-05-23', 2, '2025-05-10 00:00:00', '2025-05-29 00:00:00', ''),
(2, 'RI2025-0002', 'error', '20250410155630FE88FECB', 'annaeliza', 2, '2025-05-15', 2, '2025-05-10 00:00:00', '2025-05-28 00:00:00', 'Sin comentario'),
(3, 'RI2025-0003', 'zzz', '20250410160422DC243E3A', 'aebarba', 1, NULL, 1, '2025-06-02 00:00:00', NULL, NULL),
(4, 'RI2025-0004', 'x', '20250410160533EF9C5D6A', 'aebarba', 1, NULL, 1, '2025-06-03 00:00:00', NULL, NULL),
(5, 'RI2025-0005', 'x', '202502242354403E354EA3', 'aebarba', 1, NULL, 1, '2025-06-03 00:00:00', NULL, NULL),
(6, 'RI2025-0006', 'xz', '202502242354403E354EA3', 'aebarba', 1, NULL, 1, '2025-06-03 00:00:00', NULL, NULL),
(7, 'RI2025-0007', 'xz', '202502242354403E354EA3', 'aebarba', 1, NULL, 1, '2025-06-03 00:00:00', NULL, NULL),
(8, 'RI2025-0008', 'xz', '202502242354403E354EA3', 'aebarba', 1, NULL, 1, '2025-06-03 00:00:00', NULL, NULL),
(9, 'RI2025-0009', 'xz', '202502242354403E354EA3', 'aebarba', 1, NULL, 1, '2025-06-03 00:00:00', NULL, NULL),
(10, 'RI2025-0010', 's', '202502242354403E354EA3', 'aebarba', 1, NULL, 1, '2025-06-03 00:00:00', NULL, NULL),
(11, 'RI2025-0011', 's', '202502242354403E354EA3', 'aebarba', 1, NULL, 1, '2025-06-03 00:00:00', NULL, NULL);

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
(49, 'aebarba', 6, '2025-06-06 18:02:41', 'NA');

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
  `total` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `num_pago`, `fecha_pago`, `folio_contrato`, `concepto`, `periodo`, `annio`, `tipo_pago`, `descuento`, `total`) VALUES
(2, 'CW2025-002', '2025-04-09', '202502242354403E354EA3', 'Mensualidad', '1', '2004', 1, '0.00', '350.00'),
(3, 'CW2025-002', '2025-04-09', '202502242354403E354EA3', 'Mensualidad', '5', '2004', 1, '0.00', '350.00'),
(4, 'CW2025-002', '2025-04-09', '202502242354403E354EA3', 'Mensualidad', '2', '2004', 1, '0.00', '350.00'),
(5, 'CW2025-002', '2025-04-09', '202502242354403E354EA3', 'Mensualidad', '4', '2004', 1, '0.00', '350.00'),
(6, 'CW2025-002', '2025-04-09', '202502242354403E354EA3', 'Mensualidad', '7', '2004', 1, '0.00', '350.00'),
(7, 'CW2025-002', '2025-04-09', '202502242354403E354EA3', 'Mensualidad', '9', '2004', 1, '0.00', '350.00'),
(8, 'CW2025-002', '2025-04-09', '202502242354403E354EA3', 'Mensualidad', '3', '2004', 1, '0.00', '350.00'),
(9, 'CW2025-002', '2025-04-09', '202502242354403E354EA3', 'Mensualidad', '6', '2004', 1, '0.00', '350.00'),
(10, 'CW2025-002', '2025-04-11', '202502242354403E354EA3', 'Mensualidad', '2', '2005', 1, '0.00', '350.00'),
(11, 'CW2025-002', '2025-04-11', '202502242354403E354EA3', 'Mensualidad', '8', '2004', 1, '0.00', '350.00'),
(12, 'CW2025-002', '2025-04-11', '202502242354403E354EA3', 'Mensualidad', '11', '2004', 1, '0.00', '350.00'),
(13, 'CW2025-002', '2025-04-11', '202502242354403E354EAA', 'Mensualidad', '4', '2005', 1, '0.00', '350.00'),
(14, 'CW2025-03', '2025-04-24', '202502242354403E354EA3', 'Recargo', 'Enero 2024', '2025', 1, '0.00', '420.00'),
(15, 'CW2025-03', '2025-04-24', '202502242354403E354EA3', 'Recargo', 'Enero 2024', '2025', 1, '0.00', '420.00'),
(16, 'CW2025-03', '2025-04-24', '202502242354403E354EA3', 'Recargo', 'Febrero 2024', '2025', 1, '0.00', '420.00'),
(17, 'CW2025-03', '2025-04-25', '202502242354403E354EA3', 'Recargo', 'Enero 2024', '2025', 1, '0.00', '420.00'),
(18, 'CW2025-03', '2025-04-25', '20250410155630FE88FECB', 'Paquete', 'Periodo prueba', '2025', 1, '0.00', '350.00'),
(19, 'CW2025-03', '2025-04-25', '20250410155630FE88FECB', 'Instalación', 'Instalación', '2025', 1, '0.00', '1.00'),
(20, 'CW2025-03', '2025-04-25', '2025041015593805441E2E', 'Paquete', 'Periodo prueba', '2025', 1, '0.00', '850.00'),
(21, 'CW2025-03', '2025-04-25', '2025041015593805441E2E', 'Instalación', 'Instalación', '2025', 1, '0.00', '1.00'),
(22, 'CW2025-0004', '2025-04-25', '202502242354403E354EA1', 'Reconexión', 'Reconexión', '2025', 1, '0.00', '0.00'),
(23, 'CW2025-0004', '2025-04-25', '202502242354403E354EA1', 'Recargo', 'Marzo 2025', '2025', 1, '0.00', '420.00'),
(24, 'CW2025-0005', '2025-05-02', '202502242354403E354EA3', 'Recargo', 'Junio 2024', '2025', 1, '0.00', '420.00'),
(25, 'CW2025-0006', '2025-06-04', '202502242354403E354EA3', 'Paquete', 'Periodo prueba', '2025', 1, '0.00', '350.00'),
(26, 'CW2025-0006', '2025-06-04', '202502242354403E354EA3', 'Descuento', 'Descuento', '2025', 1, '0.00', '-200.00'),
(27, 'CW2025-0007', '2025-06-06', '202502242354403E354EA3', 'Pago oportuno', '2025-06', '2025', 1, '0.00', '12.12'),
(28, 'CW2025-0007', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-06', '2025', 1, '0.00', '450.00'),
(29, 'CW2025-0007', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-06', '2025', 1, '0.00', '450.00'),
(30, 'CW2025-0008', '2025-06-06', '202502242354403E354EA3', 'Pago oportuno', '2025-06', '2025', 1, '0.00', '12.12'),
(31, 'CW2025-0008', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-09', '2025', 1, '0.00', '450.00'),
(32, 'CW2025-0008', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-10', '2025', 1, '0.00', '450.00'),
(33, 'CW2025-0009', '2025-06-06', '202502242354403E354EA3', 'Pago oportuno', '2025-06', '2025', 1, '0.00', '12.12'),
(34, 'CW2025-0009', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-08', '2025', 1, '0.00', '450.00'),
(35, 'CW2025-0009', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-09', '2025', 1, '0.00', '450.00'),
(36, 'CW2025-0009', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-10', '2025', 1, '0.00', '450.00'),
(37, 'CW2025-0009', '2025-06-06', '202502242354403E354EA3', 'Pago oportuno', '2025-06', '2025', 1, '0.00', '12.12'),
(38, 'CW2025-0009', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-08', '2025', 1, '0.00', '450.00'),
(39, 'CW2025-0009', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-09', '2025', 1, '0.00', '450.00'),
(40, 'CW2025-0010', '2025-06-06', '202502242354403E354EA3', 'Pago oportuno', '2025-06', '2025', 1, '0.00', '12.12'),
(41, 'CW2025-0010', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-08', '2025', 1, '0.00', '450.00'),
(42, 'CW2025-0010', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-09', '2025', 1, '0.00', '450.00'),
(43, 'CW2025-0010', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-10', '2025', 1, '0.00', '450.00'),
(44, 'CW2025-0011', '2025-06-06', '202502242354403E354EA3', 'Pago oportuno', '2025-06', '2025', 1, '0.00', '12.12'),
(45, 'CW2025-0011', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-10', '2025', 1, '0.00', '450.00'),
(46, 'CW2025-0011', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-11', '2025', 1, '0.00', '450.00'),
(47, 'CW2025-0011', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-12', '2025', 1, '0.00', '450.00'),
(48, 'CW2025-0012', '2025-06-06', '202502242354403E354EA3', 'Pago oportuno', '2025-06', '2025', 1, '0.00', '12.12'),
(49, 'CW2025-0012', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-09', '2025', 1, '0.00', '450.00'),
(50, 'CW2025-0012', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-10', '2025', 1, '0.00', '450.00'),
(51, 'CW2025-0012', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-11', '2025', 1, '0.00', '450.00'),
(52, 'CW2025-0016', '2025-06-06', '202502242354403E354EA3', 'Pago oportuno', '2025-06', '2025', 1, '0.00', '12.12'),
(53, 'CW2025-0016', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-09', '2025', 1, '0.00', '450.00'),
(54, 'CW2025-0016', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-10', '2025', 1, '0.00', '450.00'),
(55, 'CW2025-0016', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-11', '2025', 1, '0.00', '450.00'),
(56, 'CW2025-0016', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-12', '2025', 1, '0.00', '450.00'),
(57, 'CW2025-0016', '2025-06-06', '202502242354403E354EA3', 'Pago oportuno', '2025-06', '2025', 1, '0.00', '12.12'),
(58, 'CW2025-0016', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-11', '2025', 1, '0.00', '450.00'),
(59, 'CW2025-0016', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-12', '2025', 1, '0.00', '450.00'),
(60, 'CW2025-0019', '2025-06-06', '202502242354403E354EA3', 'Pago oportuno', '2025-06', '2025', 1, '0.00', '12.12'),
(61, 'CW2025-0019', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-07', '2025', 1, '0.00', '450.00'),
(62, 'CW2025-0019', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-08', '2025', 1, '0.00', '450.00'),
(63, 'CW2025-0019', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-09', '2025', 1, '0.00', '450.00'),
(64, 'CW2025-0019', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-10', '2025', 1, '0.00', '450.00'),
(65, 'CW2025-0019', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-11', '2025', 1, '0.00', '450.00'),
(66, 'CW2025-0019', '2025-06-06', '202502242354403E354EA3', 'Pago anticipado', '2025-12', '2025', 1, '0.00', '450.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_generales`
--

CREATE TABLE `pagos_generales` (
  `id` int(11) NOT NULL,
  `folio_contrato` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `tarjeta` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `folio_pago` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_pago` date NOT NULL,
  `tipo_pago` int(11) NOT NULL,
  `periodo` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pagos_generales`
--

INSERT INTO `pagos_generales` (`id`, `folio_contrato`, `total`, `tarjeta`, `folio_pago`, `fecha_pago`, `tipo_pago`, `periodo`) VALUES
(1, '202502242354403E354EA3', '420.00', '', 'CW2025-01', '2025-06-25', 1, '0000-00-00'),
(2, '20250410155630FE88FECB', '351.00', '', 'CW2025-02', '2025-06-24', 1, '0000-00-00'),
(3, '2025041015593805441E2E', '851.00', '', 'CW2025-03', '2025-06-25', 1, '0000-00-00'),
(4, '202502242354403E354EA1', '420.00', '', 'CW2025-0004', '2025-06-27', 1, '0000-00-00'),
(5, '202502242354403E354EA3', '420.00', '', 'CW2025-0005', '2025-05-02', 1, '0000-00-00'),
(6, '202502242354403E354EA3', '150.00', '', 'CW2025-0006', '2025-04-04', 1, '0000-00-00'),
(7, '202502242354403E354EA3', '912.12', '', 'CW2025-0007', '2025-06-06', 1, '2025-06-06'),
(8, '202502242354403E354EA3', '912.12', '', 'CW2025-0008', '2025-06-06', 1, NULL),
(9, '202502242354403E354EA3', '912.12', '', 'CW2025-0009', '2025-06-06', 1, NULL),
(10, '202502242354403E354EA3', '1362.12', '', 'CW2025-0010', '2025-06-06', 1, NULL),
(11, '202502242354403E354EA3', '1362.12', '', 'CW2025-0011', '2025-06-06', 1, NULL),
(12, '202502242354403E354EA3', '450.00', '', 'CW2025-0012', '2025-06-06', 1, NULL),
(13, '202502242354403E354EA3', '450.00', '', 'CW2025-0012', '2025-06-06', 1, NULL),
(14, '202502242354403E354EA3', '450.00', '', 'CW2025-0012', '2025-06-06', 1, NULL),
(15, '202502242354403E354EA3', '1362.12', '', 'CW2025-0012', '2025-06-06', 1, NULL),
(16, '202502242354403E354EA3', '450.00', '', 'CW2025-0016', '2025-06-06', 1, '2025-12'),
(17, '202502242354403E354EA3', '450.00', '', 'CW2025-0016', '2025-06-06', 1, '2025-11'),
(18, '202502242354403E354EA3', '912.12', '', 'CW2025-0016', '2025-06-06', 1, '0000-00'),
(19, '202502242354403E354EA3', '450.00', '', 'CW2025-0019', '2025-06-06', 4, '2025-07'),
(20, '202502242354403E354EA3', '450.00', '', 'CW2025-0019', '2025-06-06', 4, '2025-10'),
(21, '202502242354403E354EA3', '450.00', '', 'CW2025-0019', '2025-06-06', 4, '2025-08'),
(22, '202502242354403E354EA3', '450.00', '', 'CW2025-0019', '2025-06-06', 4, '2025-09'),
(23, '202502242354403E354EA3', '450.00', '', 'CW2025-0019', '2025-06-06', 4, '2025-11'),
(24, '202502242354403E354EA3', '450.00', '', 'CW2025-0019', '2025-06-06', 4, '2025-12'),
(25, '202502242354403E354EA3', '2712.12', '', 'CW2025-0019', '2025-06-06', 1, '0000-00');

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
(7, 'Prueba promo4', '2025-05-28', '2025-05-30', 'Mensualidad', 100, 1, NULL),
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
(1, 'aebarba', '123456789', 'Ana Elisa Barba', 2, 1, '2025-03-11', '0000-00-00 00:00:00', ''),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `catalogo_logs`
--
ALTER TABLE `catalogo_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `catalogo_municipio`
--
ALTER TABLE `catalogo_municipio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `catalogo_paquetes`
--
ALTER TABLE `catalogo_paquetes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `corte_caja`
--
ALTER TABLE `corte_caja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `incidencias`
--
ALTER TABLE `incidencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `logs_login`
--
ALTER TABLE `logs_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `log_users`
--
ALTER TABLE `log_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `pagos_generales`
--
ALTER TABLE `pagos_generales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
