# Host: localhost  (Version 5.5.5-10.1.30-MariaDB)
# Date: 2018-06-25 21:04:23
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "bancos"
#

DROP TABLE IF EXISTS `bancos`;
CREATE TABLE `bancos` (
  `idBanco` int(11) NOT NULL AUTO_INCREMENT,
  `NombreBanco` varchar(45) NOT NULL,
  PRIMARY KEY (`idBanco`),
  UNIQUE KEY `NombreBanco_UNIQUE` (`NombreBanco`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "bancos"
#

INSERT INTO `bancos` VALUES (1,'Banco Estado');

#
# Structure for table "carreras"
#

DROP TABLE IF EXISTS `carreras`;
CREATE TABLE `carreras` (
  `idcarrera` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCarrera` varchar(45) NOT NULL,
  PRIMARY KEY (`idcarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "carreras"
#

INSERT INTO `carreras` VALUES (1,'Ing. Informatica');

#
# Structure for table "ciudades"
#

DROP TABLE IF EXISTS `ciudades`;
CREATE TABLE `ciudades` (
  `idCiudad` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCiudad` varchar(45) NOT NULL,
  PRIMARY KEY (`idCiudad`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "ciudades"
#

INSERT INTO `ciudades` VALUES (1,'Temuco');

#
# Structure for table "competencias"
#

DROP TABLE IF EXISTS `competencias`;
CREATE TABLE `competencias` (
  `idCompetencia` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCompetencia` varchar(45) NOT NULL,
  PRIMARY KEY (`idCompetencia`),
  UNIQUE KEY `nombreCompetencia_UNIQUE` (`nombreCompetencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "competencias"
#


#
# Structure for table "tipocuentasbancarias"
#

DROP TABLE IF EXISTS `tipocuentasbancarias`;
CREATE TABLE `tipocuentasbancarias` (
  `idTipoCuentaBancaria` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoCuentaBancaria` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoCuentaBancaria`),
  UNIQUE KEY `nombreTipoCuentaBancaria_UNIQUE` (`nombreTipoCuentaBancaria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "tipocuentasbancarias"
#

INSERT INTO `tipocuentasbancarias` VALUES (1,'Cuenta Rut');

#
# Structure for table "cuentaspadres"
#

DROP TABLE IF EXISTS `cuentaspadres`;
CREATE TABLE `cuentaspadres` (
  `idcuentaPadre` int(11) NOT NULL AUTO_INCREMENT,
  `contrasena` varchar(45) NOT NULL,
  `Activada` tinyint(4) NOT NULL DEFAULT '0',
  `rut` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`idcuentaPadre`),
  KEY `cuentaRutP` (`rut`),
  CONSTRAINT `cuentaRutP` FOREIGN KEY (`rut`) REFERENCES `tutor` (`rutPadre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "cuentaspadres"
#


#
# Structure for table "tutor"
#

DROP TABLE IF EXISTS `tutor`;
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
  `apellidoMatTutor` varchar(45) NOT NULL,
  PRIMARY KEY (`rutPadre`),
  UNIQUE KEY `emailPadre_UNIQUE` (`emailPadre`),
  UNIQUE KEY `idCuentaPadre_UNIQUE` (`idCuentaPadre`),
  KEY `idCuidad_idx` (`idCiudad`),
  CONSTRAINT `idCuenta` FOREIGN KEY (`idCuentaPadre`) REFERENCES `cuentaspadres` (`idcuentaPadre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idCuidad` FOREIGN KEY (`idCiudad`) REFERENCES `ciudades` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "tutor"
#


#
# Structure for table "familias"
#

DROP TABLE IF EXISTS `familias`;
CREATE TABLE `familias` (
  `idfamilia` int(11) NOT NULL AUTO_INCREMENT,
  `rutTutor1` varchar(12) NOT NULL,
  `rutTutor2` varchar(12) DEFAULT NULL,
  `NombreFamilia` varchar(45) NOT NULL,
  PRIMARY KEY (`idfamilia`),
  KEY `rutTutor1_idx` (`rutTutor1`),
  KEY `rutTutor2_idx` (`rutTutor2`),
  CONSTRAINT `rutTutor1` FOREIGN KEY (`rutTutor1`) REFERENCES `tutor` (`rutPadre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rutTutor2` FOREIGN KEY (`rutTutor2`) REFERENCES `tutor` (`rutPadre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "familias"
#


#
# Structure for table "ninos"
#

DROP TABLE IF EXISTS `ninos`;
CREATE TABLE `ninos` (
  `rutNino` varchar(12) NOT NULL,
  `nombreNino` varchar(45) NOT NULL,
  `ApellidosNino` varchar(45) NOT NULL,
  `fNacimiento` date NOT NULL,
  `IdFamilia` int(11) NOT NULL,
  `alergias` tinyint(4) NOT NULL DEFAULT '0',
  `enfermedades` tinyint(4) NOT NULL DEFAULT '0',
  `necesidadesEspeciales` tinyint(4) NOT NULL DEFAULT '0',
  `aseoIndependiente` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rutNino`),
  KEY `idFamilia_idx` (`IdFamilia`),
  CONSTRAINT `QidFamilia` FOREIGN KEY (`IdFamilia`) REFERENCES `familias` (`idfamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "ninos"
#


#
# Structure for table "necesidadesespeciales"
#

DROP TABLE IF EXISTS `necesidadesespeciales`;
CREATE TABLE `necesidadesespeciales` (
  `idnecesidadesEspeciales` int(11) NOT NULL AUTO_INCREMENT,
  `rutNino` varchar(12) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idnecesidadesEspeciales`),
  KEY `rutNino_idx` (`rutNino`),
  CONSTRAINT `NrutNino` FOREIGN KEY (`rutNino`) REFERENCES `ninos` (`rutNino`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "necesidadesespeciales"
#


#
# Structure for table "enfemedades"
#

DROP TABLE IF EXISTS `enfemedades`;
CREATE TABLE `enfemedades` (
  `idEnfemedades` int(11) NOT NULL AUTO_INCREMENT,
  `rutNino` varchar(12) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `Remedio` varchar(50) DEFAULT 'no declarado',
  `HorarioAdministracion` varchar(45) DEFAULT 'No necesario',
  PRIMARY KEY (`idEnfemedades`),
  KEY `rutNino_idx` (`rutNino`),
  CONSTRAINT `ErutNino` FOREIGN KEY (`rutNino`) REFERENCES `ninos` (`rutNino`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "enfemedades"
#


#
# Structure for table "alergias"
#

DROP TABLE IF EXISTS `alergias`;
CREATE TABLE `alergias` (
  `idAlergias` int(11) NOT NULL AUTO_INCREMENT,
  `rutNino` varchar(12) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `Remedio` varchar(45) DEFAULT 'no declarado',
  `HorariodeAdministracion` varchar(45) DEFAULT 'no necesario',
  PRIMARY KEY (`idAlergias`),
  KEY `rutNino_idx` (`rutNino`),
  CONSTRAINT `ArutNino` FOREIGN KEY (`rutNino`) REFERENCES `ninos` (`rutNino`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "alergias"
#


#
# Structure for table "perfilesninos"
#

DROP TABLE IF EXISTS `perfilesninos`;
CREATE TABLE `perfilesninos` (
  `idPerfilNino` int(11) NOT NULL AUTO_INCREMENT,
  `RutNino` varchar(12) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Gustos` varchar(100) NOT NULL,
  `colorPerfil` varchar(6) NOT NULL,
  PRIMARY KEY (`idPerfilNino`),
  UNIQUE KEY `RutNino_UNIQUE` (`RutNino`),
  CONSTRAINT `rutNino` FOREIGN KEY (`RutNino`) REFERENCES `ninos` (`rutNino`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "perfilesninos"
#


#
# Structure for table "perfilesfamilia"
#

DROP TABLE IF EXISTS `perfilesfamilia`;
CREATE TABLE `perfilesfamilia` (
  `idperfilFamilia` int(11) NOT NULL AUTO_INCREMENT,
  `idFamilia` int(11) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`idperfilFamilia`),
  UNIQUE KEY `idFamilia_UNIQUE` (`idFamilia`),
  CONSTRAINT `idFamilia` FOREIGN KEY (`idFamilia`) REFERENCES `familias` (`idfamilia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "perfilesfamilia"
#


#
# Structure for table "menbresias"
#

DROP TABLE IF EXISTS `menbresias`;
CREATE TABLE `menbresias` (
  `idMenbresia` int(11) NOT NULL AUTO_INCREMENT,
  `rutPadre` varchar(12) NOT NULL,
  `tipoMembresia` varchar(45) NOT NULL,
  `fInicio` date NOT NULL,
  `fFIn` date NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idMenbresia`),
  KEY `rutPadre_idx` (`rutPadre`),
  CONSTRAINT `rutPadre` FOREIGN KEY (`rutPadre`) REFERENCES `tutor` (`rutPadre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "menbresias"
#


#
# Structure for table "perfilespadres"
#

DROP TABLE IF EXISTS `perfilespadres`;
CREATE TABLE `perfilespadres` (
  `idPerfilPadre` int(11) NOT NULL AUTO_INCREMENT,
  `rutPadre` varchar(12) NOT NULL,
  `FotoPerfil` varchar(45) DEFAULT NULL,
  `descripcionPerfil` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idPerfilPadre`),
  UNIQUE KEY `rutPadre_UNIQUE` (`rutPadre`),
  UNIQUE KEY `FotoPerfil_UNIQUE` (`FotoPerfil`),
  CONSTRAINT `PrutPadre` FOREIGN KEY (`rutPadre`) REFERENCES `tutor` (`rutPadre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "perfilespadres"
#


#
# Structure for table "trabajos"
#

DROP TABLE IF EXISTS `trabajos`;
CREATE TABLE `trabajos` (
  `idtrabajos` int(11) NOT NULL AUTO_INCREMENT,
  `fInicio` date NOT NULL,
  `hInicio` varchar(5) NOT NULL,
  `fFin` date NOT NULL,
  `hFin` varchar(5) NOT NULL,
  `rutNinera` varchar(12) NOT NULL,
  `rutPadre` varchar(12) NOT NULL,
  PRIMARY KEY (`idtrabajos`),
  KEY `idPadre_idx` (`rutPadre`),
  KEY `rutNinere_idx` (`rutNinera`),
  CONSTRAINT `idPadre` FOREIGN KEY (`rutPadre`) REFERENCES `tutor` (`rutPadre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rutNinere` FOREIGN KEY (`rutNinera`) REFERENCES `nineras` (`rutNinera`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "trabajos"
#


#
# Structure for table "pagoscliente-empresa"
#

DROP TABLE IF EXISTS `pagoscliente-empresa`;
CREATE TABLE `pagoscliente-empresa` (
  `idpagoCliente-Empresa` int(11) NOT NULL AUTO_INCREMENT,
  `rutPadre` varchar(12) NOT NULL,
  `idTrabajo` int(11) NOT NULL,
  `monto` double NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(5) NOT NULL,
  `numTransaccion` varchar(45) NOT NULL,
  PRIMARY KEY (`idpagoCliente-Empresa`),
  UNIQUE KEY `idTrabajo_UNIQUE` (`idTrabajo`),
  UNIQUE KEY `numTransaccion_UNIQUE` (`numTransaccion`),
  KEY `rutPadre_idx` (`rutPadre`),
  CONSTRAINT `Tidtrabajo` FOREIGN KEY (`idTrabajo`) REFERENCES `trabajos` (`idtrabajos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TrutPadre` FOREIGN KEY (`rutPadre`) REFERENCES `tutor` (`rutPadre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "pagoscliente-empresa"
#


#
# Structure for table "universidades"
#

DROP TABLE IF EXISTS `universidades`;
CREATE TABLE `universidades` (
  `idUniversidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombreUniversidad` varchar(45) NOT NULL,
  PRIMARY KEY (`idUniversidad`),
  UNIQUE KEY `nombreUniversidad_UNIQUE` (`nombreUniversidad`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "universidades"
#

INSERT INTO `universidades` VALUES (1,'Inacap');

#
# Structure for table "sedes"
#

DROP TABLE IF EXISTS `sedes`;
CREATE TABLE `sedes` (
  `idSede` int(11) NOT NULL AUTO_INCREMENT,
  `idUniversidad` int(11) NOT NULL,
  `idCiudad` int(11) NOT NULL,
  `DireccionSede` varchar(45) NOT NULL,
  `N contacto` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`idSede`),
  UNIQUE KEY `DireccionSede_UNIQUE` (`DireccionSede`),
  KEY `idUniversidad_idx` (`idUniversidad`),
  KEY `idCiudad_idx` (`idCiudad`),
  CONSTRAINT `idCiudad` FOREIGN KEY (`idCiudad`) REFERENCES `ciudades` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUniversidad` FOREIGN KEY (`idUniversidad`) REFERENCES `universidades` (`idUniversidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "sedes"
#

INSERT INTO `sedes` VALUES (1,1,1,'Luis Duran 0789',NULL);

#
# Structure for table "nineras"
#

DROP TABLE IF EXISTS `nineras`;
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
  `calificacionTutores` decimal(10,0) NOT NULL,
  PRIMARY KEY (`rutNinera`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `CuentaBancariaNinera_UNIQUE` (`CuentaBancariaNinera`),
  KEY `idCiudad_idx` (`idCiudad`),
  KEY `idBanco_idx` (`idBanco`),
  KEY `idTipoCuentaBanco_idx` (`idTipoCuentaBancaria`),
  KEY `idCarrera_idx` (`idCarrera`),
  KEY `idUniversidad_idx` (`idUniversidad`),
  KEY `idSede_idx` (`idSede`),
  CONSTRAINT `NidBanco` FOREIGN KEY (`idBanco`) REFERENCES `bancos` (`idBanco`),
  CONSTRAINT `NidCarrera` FOREIGN KEY (`idCarrera`) REFERENCES `carreras` (`idcarrera`),
  CONSTRAINT `NidCiudad` FOREIGN KEY (`idCiudad`) REFERENCES `ciudades` (`idCiudad`),
  CONSTRAINT `NidSede` FOREIGN KEY (`idSede`) REFERENCES `sedes` (`idSede`),
  CONSTRAINT `NidTipoCuentaBanco` FOREIGN KEY (`idTipoCuentaBancaria`) REFERENCES `tipocuentasbancarias` (`idTipoCuentaBancaria`),
  CONSTRAINT `NidUniversidad` FOREIGN KEY (`idUniversidad`) REFERENCES `universidades` (`idUniversidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "nineras"
#

INSERT INTO `nineras` VALUES ('14234567-8','Francisca','Tapia Ortiz','1994-03-10','Calle falsa 123',1,'1','fto@gmail.com','14234567',1,1,1,1,1,1,7000,5);

#
# Structure for table "cuentasnineras"
#

DROP TABLE IF EXISTS `cuentasnineras`;
CREATE TABLE `cuentasnineras` (
  `idcuenta` int(11) NOT NULL AUTO_INCREMENT,
  `contrasena` varchar(45) NOT NULL,
  `cuentaActivada` tinyint(4) NOT NULL DEFAULT '0',
  `rut` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`idcuenta`),
  KEY `cuentaRut` (`rut`),
  CONSTRAINT `cuentaRut` FOREIGN KEY (`rut`) REFERENCES `nineras` (`rutNinera`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "cuentasnineras"
#

INSERT INTO `cuentasnineras` VALUES (3,'1234567890',1,'14234567-8');

#
# Structure for table "perfilnineras"
#

DROP TABLE IF EXISTS `perfilnineras`;
CREATE TABLE `perfilnineras` (
  `idperfilNinera` int(11) NOT NULL AUTO_INCREMENT,
  `nineras_rutNinera` varchar(12) NOT NULL,
  `fotoPerfil` varchar(45) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `colorperfil` char(6) NOT NULL COMMENT 'es el color con el que se vera el perfil, esto es configurable por parte de la niñera',
  PRIMARY KEY (`idperfilNinera`),
  UNIQUE KEY `fotoPerfil_UNIQUE` (`fotoPerfil`),
  UNIQUE KEY `nineras_rutNinera_UNIQUE` (`nineras_rutNinera`),
  KEY `fk_perfilNineras_nineras1_idx` (`nineras_rutNinera`),
  CONSTRAINT `fk_perfilNineras_nineras1` FOREIGN KEY (`nineras_rutNinera`) REFERENCES `nineras` (`rutNinera`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "perfilnineras"
#


#
# Structure for table "perfil-competencias"
#

DROP TABLE IF EXISTS `perfil-competencias`;
CREATE TABLE `perfil-competencias` (
  `idperfil-competencias` int(11) NOT NULL AUTO_INCREMENT,
  `idPerfilNinera` int(11) NOT NULL,
  `idCompetencia` int(11) NOT NULL,
  PRIMARY KEY (`idperfil-competencias`),
  KEY `idPerfil_idx` (`idPerfilNinera`),
  KEY `idCompetencia_idx` (`idCompetencia`),
  CONSTRAINT `idCompetencia` FOREIGN KEY (`idCompetencia`) REFERENCES `competencias` (`idCompetencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idPerfil` FOREIGN KEY (`idPerfilNinera`) REFERENCES `perfilnineras` (`idperfilNinera`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "perfil-competencias"
#

