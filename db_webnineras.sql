-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-05-2018 a las 03:50:08
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_webnineras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alergias`
--

CREATE TABLE `alergias` (
  `idAlergias` int(11) NOT NULL,
  `rutNino` varchar(12) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `Remedio` varchar(45) DEFAULT 'no declarado',
  `HorariodeAdministracion` varchar(45) DEFAULT 'no necesario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE `bancos` (
  `idBanco` int(11) NOT NULL,
  `NombreBanco` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `idcarrera` int(11) NOT NULL,
  `nombreCarrera` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `idCiudad` int(11) NOT NULL,
  `nombreCiudad` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competencias`
--

CREATE TABLE `competencias` (
  `idCompetencia` int(11) NOT NULL,
  `nombreCompetencia` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentasnineras`
--

CREATE TABLE `cuentasnineras` (
  `idcuenta` int(11) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `cuentaActivada` tinyint(4) NOT NULL DEFAULT '0',
  `rutNinera` varchar(12) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentaspadres`
--

CREATE TABLE `cuentaspadres` (
  `idcuentaPadre` int(11) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `Activada` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfemedades`
--

CREATE TABLE `enfemedades` (
  `idEnfemedades` int(11) NOT NULL,
  `rutNino` varchar(12) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `Remedio` varchar(50) DEFAULT 'no declarado',
  `HorarioAdministracion` varchar(45) DEFAULT 'No necesario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familias`
--

CREATE TABLE `familias` (
  `idfamilia` int(11) NOT NULL,
  `rutTutor1` varchar(12) NOT NULL,
  `rutTutor2` varchar(12) DEFAULT NULL,
  `NombreFamilia` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menbresias`
--

CREATE TABLE `menbresias` (
  `idMenbresia` int(11) NOT NULL,
  `rutPadre` varchar(12) NOT NULL,
  `tipoMembresia` varchar(45) NOT NULL,
  `fInicio` date NOT NULL,
  `fFIn` date NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `necesidadesespeciales`
--

CREATE TABLE `necesidadesespeciales` (
  `idnecesidadesEspeciales` int(11) NOT NULL,
  `rutNino` varchar(12) NOT NULL,
  `Descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nineras`
--

CREATE TABLE `nineras` (
  `rutNinera` varchar(12) NOT NULL,
  `nombreNinera` varchar(45) NOT NULL,
  `apelliddosNinera` varchar(100) NOT NULL,
  `fNacimientoNinera` date NOT NULL,
  `direccionNinera` varchar(45) NOT NULL,
  `idCiudad` int(11) NOT NULL,
  `telefonoNinera` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `CuentaBancariaNinera` varchar(45) NOT NULL,
  `idBanco` int(11) NOT NULL,
  `idTipoCuentaBancaria` int(11) NOT NULL,
  `idCarrera` int(11) NOT NULL,
  `idUniversidad` int(11) NOT NULL,
  `idSede` int(11) NOT NULL,
  `cursandoCarrera` tinyint(4) NOT NULL,
  `valorHora` double NOT NULL,
  `calificacionTutores` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ninos`
--

CREATE TABLE `ninos` (
  `rutNino` varchar(12) NOT NULL,
  `nombreNino` varchar(45) NOT NULL,
  `ApellidosNino` varchar(45) NOT NULL,
  `fNacimiento` date NOT NULL,
  `IdFamilia` int(11) NOT NULL,
  `alergias` tinyint(4) NOT NULL DEFAULT '0',
  `enfermedades` tinyint(4) NOT NULL DEFAULT '0',
  `necesidadesEspeciales` tinyint(4) NOT NULL DEFAULT '0',
  `aseoIndependiente` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagoscliente-empresa`
--

CREATE TABLE `pagoscliente-empresa` (
  `idpagoCliente-Empresa` int(11) NOT NULL,
  `rutPadre` varchar(12) NOT NULL,
  `idTrabajo` int(11) NOT NULL,
  `monto` double NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(5) NOT NULL,
  `numTransaccion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil-competencias`
--

CREATE TABLE `perfil-competencias` (
  `idperfil-competencias` int(11) NOT NULL,
  `idPerfilNinera` int(11) NOT NULL,
  `idCompetencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfilesfamilia`
--

CREATE TABLE `perfilesfamilia` (
  `idperfilFamilia` int(11) NOT NULL,
  `idFamilia` int(11) NOT NULL,
  `Descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfilesninos`
--

CREATE TABLE `perfilesninos` (
  `idPerfilNino` int(11) NOT NULL,
  `RutNino` varchar(12) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Gustos` varchar(100) NOT NULL,
  `colorPerfil` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfilespadres`
--

CREATE TABLE `perfilespadres` (
  `idPerfilPadre` int(11) NOT NULL,
  `rutPadre` varchar(12) NOT NULL,
  `FotoPerfil` varchar(45) DEFAULT NULL,
  `descripcionPerfil` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfilnineras`
--

CREATE TABLE `perfilnineras` (
  `idperfilNinera` int(11) NOT NULL,
  `nineras_rutNinera` varchar(12) NOT NULL,
  `fotoPerfil` varchar(45) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `colorperfil` char(6) NOT NULL COMMENT 'es el color con el que se vera el perfil, esto es configurable por parte de la niñera'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `idSede` int(11) NOT NULL,
  `idUniversidad` int(11) NOT NULL,
  `idCiudad` int(11) NOT NULL,
  `DireccionSede` varchar(45) NOT NULL,
  `N contacto` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocuentasbancarias`
--

CREATE TABLE `tipocuentasbancarias` (
  `idTipoCuentaBancaria` int(11) NOT NULL,
  `nombreTipoCuentaBancaria` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajos`
--

CREATE TABLE `trabajos` (
  `idtrabajos` int(11) NOT NULL,
  `fInicio` date NOT NULL,
  `hInicio` varchar(5) NOT NULL,
  `fFin` date NOT NULL,
  `hFin` varchar(5) NOT NULL,
  `rutNinera` varchar(12) NOT NULL,
  `rutPadre` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor`
--

CREATE TABLE `tutor` (
  `rutPadre` varchar(12) NOT NULL,
  `nombrePadre` varchar(45) NOT NULL,
  `apellidosPatTutor` varchar(100) NOT NULL,
  `fNacimiento` date NOT NULL,
  `direccionPadre` varchar(45) NOT NULL,
  `idCiudad` int(11) NOT NULL,
  `telefonoPadre` varchar(12) NOT NULL,
  `emailPadre` varchar(100) NOT NULL,
  `idCuentaPadre` int(11) NOT NULL,
  `sexo` tinyint(4) NOT NULL,
  `apellidoMatTutor` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `universidades`
--

CREATE TABLE `universidades` (
  `idUniversidad` int(11) NOT NULL,
  `nombreUniversidad` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alergias`
--
ALTER TABLE `alergias`
  ADD PRIMARY KEY (`idAlergias`),
  ADD KEY `rutNino_idx` (`rutNino`);

--
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`idBanco`),
  ADD UNIQUE KEY `NombreBanco_UNIQUE` (`NombreBanco`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`idcarrera`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`idCiudad`);

--
-- Indices de la tabla `competencias`
--
ALTER TABLE `competencias`
  ADD PRIMARY KEY (`idCompetencia`),
  ADD UNIQUE KEY `nombreCompetencia_UNIQUE` (`nombreCompetencia`);

--
-- Indices de la tabla `cuentasnineras`
--
ALTER TABLE `cuentasnineras`
  ADD PRIMARY KEY (`idcuenta`),
  ADD KEY `cuentaRut` (`rutNinera`);

--
-- Indices de la tabla `cuentaspadres`
--
ALTER TABLE `cuentaspadres`
  ADD PRIMARY KEY (`idcuentaPadre`);

--
-- Indices de la tabla `enfemedades`
--
ALTER TABLE `enfemedades`
  ADD PRIMARY KEY (`idEnfemedades`),
  ADD KEY `rutNino_idx` (`rutNino`);

--
-- Indices de la tabla `familias`
--
ALTER TABLE `familias`
  ADD PRIMARY KEY (`idfamilia`),
  ADD KEY `rutTutor1_idx` (`rutTutor1`),
  ADD KEY `rutTutor2_idx` (`rutTutor2`);

--
-- Indices de la tabla `menbresias`
--
ALTER TABLE `menbresias`
  ADD PRIMARY KEY (`idMenbresia`),
  ADD KEY `rutPadre_idx` (`rutPadre`);

--
-- Indices de la tabla `necesidadesespeciales`
--
ALTER TABLE `necesidadesespeciales`
  ADD PRIMARY KEY (`idnecesidadesEspeciales`),
  ADD KEY `rutNino_idx` (`rutNino`);

--
-- Indices de la tabla `nineras`
--
ALTER TABLE `nineras`
  ADD PRIMARY KEY (`rutNinera`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `CuentaBancariaNinera_UNIQUE` (`CuentaBancariaNinera`),
  ADD KEY `idCiudad_idx` (`idCiudad`),
  ADD KEY `idBanco_idx` (`idBanco`),
  ADD KEY `idTipoCuentaBanco_idx` (`idTipoCuentaBancaria`),
  ADD KEY `idCarrera_idx` (`idCarrera`),
  ADD KEY `idUniversidad_idx` (`idUniversidad`),
  ADD KEY `idSede_idx` (`idSede`);

--
-- Indices de la tabla `ninos`
--
ALTER TABLE `ninos`
  ADD PRIMARY KEY (`rutNino`),
  ADD KEY `idFamilia_idx` (`IdFamilia`);

--
-- Indices de la tabla `pagoscliente-empresa`
--
ALTER TABLE `pagoscliente-empresa`
  ADD PRIMARY KEY (`idpagoCliente-Empresa`),
  ADD UNIQUE KEY `idTrabajo_UNIQUE` (`idTrabajo`),
  ADD UNIQUE KEY `numTransaccion_UNIQUE` (`numTransaccion`),
  ADD KEY `rutPadre_idx` (`rutPadre`);

--
-- Indices de la tabla `perfil-competencias`
--
ALTER TABLE `perfil-competencias`
  ADD PRIMARY KEY (`idperfil-competencias`),
  ADD KEY `idPerfil_idx` (`idPerfilNinera`),
  ADD KEY `idCompetencia_idx` (`idCompetencia`);

--
-- Indices de la tabla `perfilesfamilia`
--
ALTER TABLE `perfilesfamilia`
  ADD PRIMARY KEY (`idperfilFamilia`),
  ADD UNIQUE KEY `idFamilia_UNIQUE` (`idFamilia`);

--
-- Indices de la tabla `perfilesninos`
--
ALTER TABLE `perfilesninos`
  ADD PRIMARY KEY (`idPerfilNino`),
  ADD UNIQUE KEY `RutNino_UNIQUE` (`RutNino`);

--
-- Indices de la tabla `perfilespadres`
--
ALTER TABLE `perfilespadres`
  ADD PRIMARY KEY (`idPerfilPadre`),
  ADD UNIQUE KEY `rutPadre_UNIQUE` (`rutPadre`),
  ADD UNIQUE KEY `FotoPerfil_UNIQUE` (`FotoPerfil`);

--
-- Indices de la tabla `perfilnineras`
--
ALTER TABLE `perfilnineras`
  ADD PRIMARY KEY (`idperfilNinera`),
  ADD UNIQUE KEY `fotoPerfil_UNIQUE` (`fotoPerfil`),
  ADD UNIQUE KEY `nineras_rutNinera_UNIQUE` (`nineras_rutNinera`),
  ADD KEY `fk_perfilNineras_nineras1_idx` (`nineras_rutNinera`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`idSede`),
  ADD UNIQUE KEY `DireccionSede_UNIQUE` (`DireccionSede`),
  ADD KEY `idUniversidad_idx` (`idUniversidad`),
  ADD KEY `idCiudad_idx` (`idCiudad`);

--
-- Indices de la tabla `tipocuentasbancarias`
--
ALTER TABLE `tipocuentasbancarias`
  ADD PRIMARY KEY (`idTipoCuentaBancaria`),
  ADD UNIQUE KEY `nombreTipoCuentaBancaria_UNIQUE` (`nombreTipoCuentaBancaria`);

--
-- Indices de la tabla `trabajos`
--
ALTER TABLE `trabajos`
  ADD PRIMARY KEY (`idtrabajos`),
  ADD KEY `idPadre_idx` (`rutPadre`),
  ADD KEY `rutNinere_idx` (`rutNinera`);

--
-- Indices de la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`rutPadre`),
  ADD UNIQUE KEY `emailPadre_UNIQUE` (`emailPadre`),
  ADD UNIQUE KEY `idCuentaPadre_UNIQUE` (`idCuentaPadre`),
  ADD KEY `idCuidad_idx` (`idCiudad`);

--
-- Indices de la tabla `universidades`
--
ALTER TABLE `universidades`
  ADD PRIMARY KEY (`idUniversidad`),
  ADD UNIQUE KEY `nombreUniversidad_UNIQUE` (`nombreUniversidad`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alergias`
--
ALTER TABLE `alergias`
  MODIFY `idAlergias` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `idBanco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `idcarrera` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `idCiudad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `competencias`
--
ALTER TABLE `competencias`
  MODIFY `idCompetencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuentasnineras`
--
ALTER TABLE `cuentasnineras`
  MODIFY `idcuenta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuentaspadres`
--
ALTER TABLE `cuentaspadres`
  MODIFY `idcuentaPadre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `enfemedades`
--
ALTER TABLE `enfemedades`
  MODIFY `idEnfemedades` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `familias`
--
ALTER TABLE `familias`
  MODIFY `idfamilia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menbresias`
--
ALTER TABLE `menbresias`
  MODIFY `idMenbresia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `necesidadesespeciales`
--
ALTER TABLE `necesidadesespeciales`
  MODIFY `idnecesidadesEspeciales` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagoscliente-empresa`
--
ALTER TABLE `pagoscliente-empresa`
  MODIFY `idpagoCliente-Empresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfil-competencias`
--
ALTER TABLE `perfil-competencias`
  MODIFY `idperfil-competencias` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfilesfamilia`
--
ALTER TABLE `perfilesfamilia`
  MODIFY `idperfilFamilia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfilesninos`
--
ALTER TABLE `perfilesninos`
  MODIFY `idPerfilNino` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfilespadres`
--
ALTER TABLE `perfilespadres`
  MODIFY `idPerfilPadre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfilnineras`
--
ALTER TABLE `perfilnineras`
  MODIFY `idperfilNinera` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `idSede` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipocuentasbancarias`
--
ALTER TABLE `tipocuentasbancarias`
  MODIFY `idTipoCuentaBancaria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trabajos`
--
ALTER TABLE `trabajos`
  MODIFY `idtrabajos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `universidades`
--
ALTER TABLE `universidades`
  MODIFY `idUniversidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alergias`
--
ALTER TABLE `alergias`
  ADD CONSTRAINT `ArutNino` FOREIGN KEY (`rutNino`) REFERENCES `ninos` (`rutNino`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cuentasnineras`
--
ALTER TABLE `cuentasnineras`
  ADD CONSTRAINT `cuentaRut` FOREIGN KEY (`rutNinera`) REFERENCES `nineras` (`rutNinera`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `enfemedades`
--
ALTER TABLE `enfemedades`
  ADD CONSTRAINT `ErutNino` FOREIGN KEY (`rutNino`) REFERENCES `ninos` (`rutNino`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `familias`
--
ALTER TABLE `familias`
  ADD CONSTRAINT `rutTutor1` FOREIGN KEY (`rutTutor1`) REFERENCES `tutor` (`rutPadre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `rutTutor2` FOREIGN KEY (`rutTutor2`) REFERENCES `tutor` (`rutPadre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `menbresias`
--
ALTER TABLE `menbresias`
  ADD CONSTRAINT `rutPadre` FOREIGN KEY (`rutPadre`) REFERENCES `tutor` (`rutPadre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `necesidadesespeciales`
--
ALTER TABLE `necesidadesespeciales`
  ADD CONSTRAINT `NrutNino` FOREIGN KEY (`rutNino`) REFERENCES `ninos` (`rutNino`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `nineras`
--
ALTER TABLE `nineras`
  ADD CONSTRAINT `NidBanco` FOREIGN KEY (`idBanco`) REFERENCES `bancos` (`idBanco`),
  ADD CONSTRAINT `NidCarrera` FOREIGN KEY (`idCarrera`) REFERENCES `carreras` (`idcarrera`),
  ADD CONSTRAINT `NidCiudad` FOREIGN KEY (`idCiudad`) REFERENCES `ciudades` (`idCiudad`),
  ADD CONSTRAINT `NidSede` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idSede`),
  ADD CONSTRAINT `NidTipoCuentaBanco` FOREIGN KEY (`idTipoCuentaBancaria`) REFERENCES `tipocuentasbancarias` (`idTipoCuentaBancaria`),
  ADD CONSTRAINT `NidUniversidad` FOREIGN KEY (`idUniversidad`) REFERENCES `universidades` (`idUniversidad`);

--
-- Filtros para la tabla `ninos`
--
ALTER TABLE `ninos`
  ADD CONSTRAINT `QidFamilia` FOREIGN KEY (`IdFamilia`) REFERENCES `familias` (`idfamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pagoscliente-empresa`
--
ALTER TABLE `pagoscliente-empresa`
  ADD CONSTRAINT `Tidtrabajo` FOREIGN KEY (`idTrabajo`) REFERENCES `trabajos` (`idtrabajos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `TrutPadre` FOREIGN KEY (`rutPadre`) REFERENCES `tutor` (`rutPadre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `perfil-competencias`
--
ALTER TABLE `perfil-competencias`
  ADD CONSTRAINT `idCompetencia` FOREIGN KEY (`idCompetencia`) REFERENCES `competencias` (`idCompetencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idPerfil` FOREIGN KEY (`idPerfilNinera`) REFERENCES `perfilnineras` (`idperfilNinera`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `perfilesfamilia`
--
ALTER TABLE `perfilesfamilia`
  ADD CONSTRAINT `idFamilia` FOREIGN KEY (`idFamilia`) REFERENCES `familias` (`idfamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `perfilesninos`
--
ALTER TABLE `perfilesninos`
  ADD CONSTRAINT `rutNino` FOREIGN KEY (`RutNino`) REFERENCES `ninos` (`rutNino`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `perfilespadres`
--
ALTER TABLE `perfilespadres`
  ADD CONSTRAINT `PrutPadre` FOREIGN KEY (`rutPadre`) REFERENCES `tutor` (`rutPadre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `perfilnineras`
--
ALTER TABLE `perfilnineras`
  ADD CONSTRAINT `fk_perfilNineras_nineras1` FOREIGN KEY (`nineras_rutNinera`) REFERENCES `nineras` (`rutNinera`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD CONSTRAINT `idCiudad` FOREIGN KEY (`idCiudad`) REFERENCES `ciudades` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idUniversidad` FOREIGN KEY (`idUniversidad`) REFERENCES `universidades` (`idUniversidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `trabajos`
--
ALTER TABLE `trabajos`
  ADD CONSTRAINT `idPadre` FOREIGN KEY (`rutPadre`) REFERENCES `tutor` (`rutPadre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `rutNinere` FOREIGN KEY (`rutNinera`) REFERENCES `nineras` (`rutNinera`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD CONSTRAINT `idCuenta` FOREIGN KEY (`idCuentaPadre`) REFERENCES `cuentaspadres` (`idcuentaPadre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idCuidad` FOREIGN KEY (`idCiudad`) REFERENCES `ciudades` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
