-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-02-2023 a las 17:28:46
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nave`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nave`
--

DROP TABLE IF EXISTS `nave`;
CREATE TABLE `nave` (
  `id` int(10) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `pais` varchar(255) NOT NULL,
  `año_lanzado` int(20) NOT NULL,
  `año_retirado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `nave`
--

INSERT INTO `nave` (`id`, `nombre`, `tipo`, `pais`, `año_lanzado`, `año_retirado`) VALUES
(1, 'Saturno V', 'VEHÍCULOS LANZADERA', 'EE.UU', 1967, '1973'),
(2, 'Energia ', 'VEHÍCULOS LANZADERA', 'Rusia/Ucrania', 1987, '1988'),
(3, 'Larga mancha 2f', 'VEHÍCULOS LANZADERA', 'China', 1996, 'Actual'),
(4, 'Luna IX', 'NAVES ESPACIALES NO TRIPULADAS', 'Rusia', 1966, 'Actual'),
(5, 'Pionero X', 'NAVES ESPACIALES NO TRIPULADAS', 'EE.UU NASA ', 1972, 'Actual'),
(6, 'Soho ', 'NAVES ESPACIALES NO TRIPULADAS', 'Europa', 1995, 'Actual'),
(7, 'Mercury ', 'NAVES ESPACIALES TRIPULADAS', 'EE.UU ', 1959, '1963'),
(8, 'Vostok', 'NAVES ESPACIALES TRIPULADAS', 'Rusia', 1964, '1965'),
(9, 'EEI', 'NAVES ESPACIALES TRIPULADAS', 'Internacional', 1998, 'Actual');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `nave`
--
ALTER TABLE `nave`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `nave`
--
ALTER TABLE `nave`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
