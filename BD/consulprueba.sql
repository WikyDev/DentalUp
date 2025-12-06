-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-12-2025 a las 07:20:45
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

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
  `cedula_admin` bigint(20) NOT NULL,
  `nombre_completo` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`cedula_admin`, `nombre_completo`, `correo`, `id_user`) VALUES
(11002255, 'Juan  Jose Torres', 'juant@email.com', 32),
(2000000001, 'jorge martinez', 'jorge99@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(11) NOT NULL,
  `cedula_paciente` bigint(20) NOT NULL,
  `cedula_odontologo` bigint(20) NOT NULL,
  `fecha_cita` datetime NOT NULL,
  `motivo` text DEFAULT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'PENDIENTE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_cita`, `cedula_paciente`, `cedula_odontologo`, `fecha_cita`, `motivo`, `estado`) VALUES
(43, 13131313, 2147483647, '2025-11-20 10:00:00', 'limpieza', 'ATENDIDA'),
(44, 13131313, 300000006, '2025-12-10 08:00:00', 'dolorcito', 'ATENDIDA'),
(47, 13131313, 2147483647, '2025-12-20 15:00:00', 'no se ', 'PENDIENTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historias_clinicas`
--

CREATE TABLE `historias_clinicas` (
  `id_historia` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `motivoConsulta` varchar(255) DEFAULT NULL,
  `diagnostico` text DEFAULT NULL,
  `tratamiento` text DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `cedula_paciente` bigint(20) NOT NULL,
  `cedula_odontologo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historias_clinicas`
--

INSERT INTO `historias_clinicas` (`id_historia`, `fecha`, `motivoConsulta`, `diagnostico`, `tratamiento`, `observaciones`, `cedula_paciente`, `cedula_odontologo`) VALUES
(7, '2025-11-20', 'ortodoncia', 'cepillarse', 'cepillo de bambu', 'dientes amarillos', 13131313, 2147483647),
(8, '2025-12-10', 'dolorcito', 'dada', 'adaad', 'addada', 13131313, 300000006);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `odontologos`
--

CREATE TABLE `odontologos` (
  `cedula_odontologo` bigint(20) NOT NULL,
  `nombre_completo` varchar(100) DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `odontologos`
--

INSERT INTO `odontologos` (`cedula_odontologo`, `nombre_completo`, `especialidad`, `correo`, `id_user`) VALUES
(300000006, 'Laura Gómez', 'Ortodoncista Senior', 'lauriG44@gmail.com', 4),
(300000007, 'Miguel Ospina', 'Implantólogo', 'ospinamiguel@gmail.com', 5),
(2147483647, 'Pablo Torres', 'Periodoncista', 'pablito@gmail.com', 2),
(11129568714, 'Maria Camila Perez', 'Endodoncista', 'Camila99@email.com', 31);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `cedula_paciente` bigint(20) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `tiene_OS` varchar(3) DEFAULT NULL,
  `tipo_sangre` varchar(6) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `cedula_responsable` bigint(20) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`cedula_paciente`, `nombre`, `apellido`, `edad`, `telefono`, `fecha_nac`, `tiene_OS`, `tipo_sangre`, `email`, `cedula_responsable`, `id_user`) VALUES
(13131313, 'dasa', 'fsda', 23, '31245621', '2025-11-13', NULL, 'A+', 'dadoM@email.com', NULL, 16),
(1114445552, 'Anthony', 'Brand', 21, '3145745492', '2004-05-30', NULL, 'A+', 'bandramos@gamil.com', NULL, 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles_odontologos`
--

CREATE TABLE `perfiles_odontologos` (
  `id_perfil` int(11) NOT NULL,
  `cedula_odontologo` bigint(20) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfiles_odontologos`
--

INSERT INTO `perfiles_odontologos` (`id_perfil`, `cedula_odontologo`, `descripcion`, `foto`) VALUES
(5, 11129568714, 'excelente', 'poster pulpas uva1.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsables`
--

CREATE TABLE `responsables` (
  `cedula_responsable` bigint(20) NOT NULL,
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
  `cedula_secretario` bigint(20) NOT NULL,
  `nombre_completo` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `secretarios`
--

INSERT INTO `secretarios` (`cedula_secretario`, `nombre_completo`, `telefono`, `correo`, `id_user`) VALUES
(112234455, 'Sandra maria paredes', '31542154', 'sandrae@email.com', 33),
(400000005, 'camila lopez', '31425678', 'camila00@gmail.com', 3);

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
(2, 'pabloT', '258369', 'odontologo'),
(3, 'secretario333', 'abc123', 'secretario'),
(4, 'Lauri', '235689', 'odontologo'),
(5, 'miguelito10', 'zxc123', 'odontologo'),
(16, 'dado', '5555', 'paciente'),
(29, 'AnthonyBr', 'Arrozconfrijoles', 'paciente'),
(31, 'cami33', 'peluche33', 'odontologo'),
(32, 'juan56', 'futbolmivida', 'admin'),
(33, 'sandrapds', 'fortnite', 'secretario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`cedula_admin`),
  ADD KEY `fk_admin_usuario` (`id_user`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `cedula_paciente` (`cedula_paciente`,`cedula_odontologo`),
  ADD KEY `fk_cita_odontologo` (`cedula_odontologo`);

--
-- Indices de la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  ADD PRIMARY KEY (`id_historia`),
  ADD KEY `cedula_paciente` (`cedula_paciente`,`cedula_odontologo`),
  ADD KEY `fk_historia_odontologo` (`cedula_odontologo`);

--
-- Indices de la tabla `odontologos`
--
ALTER TABLE `odontologos`
  ADD PRIMARY KEY (`cedula_odontologo`),
  ADD KEY `fk_odontologo_usuario` (`id_user`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`cedula_paciente`),
  ADD UNIQUE KEY `cedula_responsable` (`cedula_responsable`),
  ADD KEY `fk_paciente_usuario` (`id_user`);

--
-- Indices de la tabla `perfiles_odontologos`
--
ALTER TABLE `perfiles_odontologos`
  ADD PRIMARY KEY (`id_perfil`),
  ADD KEY `perfiles_odontologos_ibfk_1` (`cedula_odontologo`);

--
-- Indices de la tabla `responsables`
--
ALTER TABLE `responsables`
  ADD PRIMARY KEY (`cedula_responsable`);

--
-- Indices de la tabla `secretarios`
--
ALTER TABLE `secretarios`
  ADD PRIMARY KEY (`cedula_secretario`),
  ADD KEY `fk_secretario_usuario` (`id_user`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  MODIFY `id_historia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `perfiles_odontologos`
--
ALTER TABLE `perfiles_odontologos`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD CONSTRAINT `fk_admin_usuario` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `fk_cita_odontologo` FOREIGN KEY (`cedula_odontologo`) REFERENCES `odontologos` (`cedula_odontologo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cita_paciente` FOREIGN KEY (`cedula_paciente`) REFERENCES `pacientes` (`cedula_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  ADD CONSTRAINT `fk_historia_odontologo` FOREIGN KEY (`cedula_odontologo`) REFERENCES `odontologos` (`cedula_odontologo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_historia_paciente` FOREIGN KEY (`cedula_paciente`) REFERENCES `pacientes` (`cedula_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `odontologos`
--
ALTER TABLE `odontologos`
  ADD CONSTRAINT `fk_odontologo_usuario` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `FK_pacientes_responsables` FOREIGN KEY (`cedula_responsable`) REFERENCES `responsables` (`cedula_responsable`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_paciente_usuario` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `perfiles_odontologos`
--
ALTER TABLE `perfiles_odontologos`
  ADD CONSTRAINT `perfiles_odontologos_ibfk_1` FOREIGN KEY (`cedula_odontologo`) REFERENCES `odontologos` (`cedula_odontologo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `secretarios`
--
ALTER TABLE `secretarios`
  ADD CONSTRAINT `fk_secretario_usuario` FOREIGN KEY (`id_user`) REFERENCES `usuarios` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
