-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2025 a las 02:42:40
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `consulprueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id_admin` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre_completo` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id_admin`, `id_usuario`, `nombre_completo`, `correo`) VALUES
(1, 1, 'jorge martinez', 'jorge99@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_odontologo` int(11) NOT NULL,
  `fecha_cita` datetime NOT NULL,
  `motivo` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_cita`, `id_paciente`, `id_odontologo`, `fecha_cita`, `motivo`) VALUES
(5, 121344, 1, '2025-06-25 14:00:00', 'Infeccion en las encias '),
(28, 121322, 1, '2025-06-19 10:44:00', 'Caries en dos muelas '),
(31, 123589, 2, '2025-06-30 10:00:00', 'limpieza para mis muelas'),
(32, 112354, 3, '2025-07-04 15:00:00', 'dolor en la rodilla ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `odontologos`
--

CREATE TABLE `odontologos` (
  `id_odontologo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre_completo` varchar(100) DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `odontologos`
--

INSERT INTO `odontologos` (`id_odontologo`, `id_usuario`, `nombre_completo`, `especialidad`, `correo`) VALUES
(1, 4, 'jose perez', 'dentista estetico', 'joserr@gmail.com'),
(2, 6, 'pablo torre', 'dentista de limpieza', 'pablo44@gmail.com'),
(3, 7, 'camilo perez', 'dentista estetico', 'camilo44@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_paciente` int(11) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `tiene_OS` varchar(3) DEFAULT NULL,
  `tipo_sangre` varchar(6) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `cedula_responsable` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_paciente`, `nombre`, `apellido`, `edad`, `telefono`, `fecha_nac`, `tiene_OS`, `tipo_sangre`, `email`, `cedula_responsable`) VALUES
(14587, 'carlos', 'mendez', 20, '324518', '2005-06-06', 'SI', 'B+', 'carlos34@gmail.com', NULL),
(112354, 'ailin', 'escalante', 19, '315089', '2006-01-01', 'SI', 'O+', 'ailin0417@gmail.com', NULL),
(121322, 'maria', 'ospina', 14, '222333', '2011-02-09', 'SI', 'A+', 'jaimeos77@gmail.com', 152224),
(121344, 'oscar', 'martinez', 30, '3124522', '1995-03-09', 'SI', 'B-', 'carlosm33@gmail.com', NULL),
(123589, 'marcos', 'paredes', 32, '312548', '1993-02-17', 'NO', 'B+', 'paredesmar44@gmail.com', NULL),
(125622, 'carlos', 'sanchez', 25, '324556', '2000-03-09', 'SI', 'A+', 'carlosk554@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsables`
--

CREATE TABLE `responsables` (
  `cedula_responsable` int(11) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `tipo_relacion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `responsables`
--

INSERT INTO `responsables` (`cedula_responsable`, `nombre`, `apellido`, `edad`, `telefono`, `fecha_nac`, `email`, `tipo_relacion`) VALUES
(152224, 'jaime', 'ospina', 30, '3124555', '1995-05-08', 'jaimeos66@gmail.com', 'Padre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secretarios`
--

CREATE TABLE `secretarios` (
  `id_secretario` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre_completo` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `secretarios`
--

INSERT INTO `secretarios` (`id_secretario`, `id_usuario`, `nombre_completo`, `telefono`, `correo`) VALUES
(1, 5, 'camila lopez', '31425678', 'camila00@gmail.com'),
(2, 8, 'sofia marquez', '3154215', 'sofi88@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_user` int(11) NOT NULL,
  `nombre_user` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `rol` enum('admin','secretario','odontologo','paciente') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_user`, `nombre_user`, `password`, `rol`) VALUES
(1, 'admin', '123456', 'admin'),
(4, 'secre2', '258369', 'odontologo'),
(5, 'secretario333', 'abc123', 'secretario'),
(6, 'odontoB', '235689', 'odontologo'),
(7, 'odontoC', 'zxc123', 'odontologo'),
(8, 'secretario444', 'qwe123', 'secretario'),
(10, 'nuevo', 'nuevo', 'paciente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `citas_ibfk_1` (`id_paciente`),
  ADD KEY `citas_ibfk_2` (`id_odontologo`);

--
-- Indices de la tabla `odontologos`
--
ALTER TABLE `odontologos`
  ADD PRIMARY KEY (`id_odontologo`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_paciente`),
  ADD UNIQUE KEY `cedula_responsable` (`cedula_responsable`);

--
-- Indices de la tabla `responsables`
--
ALTER TABLE `responsables`
  ADD PRIMARY KEY (`cedula_responsable`);

--
-- Indices de la tabla `secretarios`
--
ALTER TABLE `secretarios`
  ADD PRIMARY KEY (`id_secretario`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `odontologos`
--
ALTER TABLE `odontologos`
  MODIFY `id_odontologo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `secretarios`
--
ALTER TABLE `secretarios`
  MODIFY `id_secretario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD CONSTRAINT `administradores_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_user`) ON DELETE CASCADE;

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_odontologo`) REFERENCES `odontologos` (`id_odontologo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `odontologos`
--
ALTER TABLE `odontologos`
  ADD CONSTRAINT `odontologos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_user`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `FK_pacientes_responsables` FOREIGN KEY (`cedula_responsable`) REFERENCES `responsables` (`cedula_responsable`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `secretarios`
--
ALTER TABLE `secretarios`
  ADD CONSTRAINT `secretarios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_user`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
