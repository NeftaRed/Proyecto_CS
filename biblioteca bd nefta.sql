-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema BibliotecaBD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BibliotecaBD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BibliotecaBD` DEFAULT CHARACTER SET utf8 ;
USE `BibliotecaBD` ;

-- -----------------------------------------------------
-- Table `BibliotecaBD`.`colonia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`colonia` (
  `id_colonia` INT NOT NULL AUTO_INCREMENT,
  `nombrecolonia` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_colonia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`estado` (
  `id_estado` INT NOT NULL AUTO_INCREMENT,
  `nombreestado` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`localidad` (
  `id_localidad` INT NOT NULL AUTO_INCREMENT,
  `nombrelocalidad` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_localidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`Usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `huella` BLOB NOT NULL,
  `imagen_perfil` BLOB NULL,
  `Prim_nombre` VARCHAR(50) NOT NULL,
  `url_direccion` VARCHAR(200) NULL,
  `Seg_nombre` VARCHAR(50) NOT NULL,
  `apellido_pat` VARCHAR(50) NOT NULL,
  `apellido_mat` VARCHAR(50) NOT NULL,
  `num_calle` VARCHAR(8) NULL,
  `num_casa` VARCHAR(8) NULL,
  `calle_superior` VARCHAR(8) NULL,
  `calle_inferior` VARCHAR(8) NULL,
  `genero` VARCHAR(10) NOT NULL,
  `fk_id_colonia` INT NOT NULL,
  `fk_id_estado` INT NOT NULL,
  `fk_id_localidad` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  CONSTRAINT `fk_id_colonia`
    FOREIGN KEY (`fk_id_colonia`)
    REFERENCES `BibliotecaBD`.`colonia` (`id_colonia`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_id_estado`
    FOREIGN KEY (`fk_id_estado`)
    REFERENCES `BibliotecaBD`.`estado` (`id_estado`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_id_localidad`
    FOREIGN KEY (`fk_id_localidad`)
    REFERENCES `BibliotecaBD`.`localidad` (`id_localidad`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = ujis;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`telefono_casa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`telefono_casa` (
  `telefono_casa` INT NOT NULL,
  `fk_id_usuario_casa` INT NOT NULL,
  PRIMARY KEY (`telefono_casa`),
  CONSTRAINT `fk_id_usuario_casa`
    FOREIGN KEY (`fk_id_usuario_casa`)
    REFERENCES `BibliotecaBD`.`Usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`telefono_celular`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`telefono_celular` (
  `telefono_celular` INT NOT NULL,
  `fk_id_usuario_cel` INT NOT NULL,
  PRIMARY KEY (`telefono_celular`),
  CONSTRAINT `fk_id_usuario_cel`
    FOREIGN KEY (`fk_id_usuario_cel`)
    REFERENCES `BibliotecaBD`.`Usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`Bibliotecario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`Bibliotecario` (
  `rfc_bibliotecario` INT NOT NULL,
  `contrasenia` VARCHAR(45) NOT NULL,
  `id_login` VARCHAR(45) NOT NULL,
  `fk_id_usuario_bibliotecario` INT NOT NULL,
  PRIMARY KEY (`rfc_bibliotecario`),
  CONSTRAINT `fk_id_usuario_bibliotecario`
    FOREIGN KEY (`fk_id_usuario_bibliotecario`)
    REFERENCES `BibliotecaBD`.`Usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`carrera` (
  `id_carrera` INT NOT NULL AUTO_INCREMENT,
  `nombrecarrera` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_carrera`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`Alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`Alumno` (
  `matricula` BIGINT(12) NOT NULL,
  `semetre` VARCHAR(15) NOT NULL,
  `fk_id_usuario_alumno` INT NOT NULL,
  `fk_id_carrera` INT NOT NULL,
  PRIMARY KEY (`matricula`),
  CONSTRAINT `fk_id_usuario_alumno`
    FOREIGN KEY (`fk_id_usuario_alumno`)
    REFERENCES `BibliotecaBD`.`Usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_id_carrera`
    FOREIGN KEY (`fk_id_carrera`)
    REFERENCES `BibliotecaBD`.`carrera` (`id_carrera`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`Docente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`Docente` (
  `rfc` VARCHAR(45) NOT NULL,
  `fk_id_usuario_docente` INT NOT NULL,
  PRIMARY KEY (`rfc`),
  CONSTRAINT `fk_id_usuario_docente`
    FOREIGN KEY (`fk_id_usuario_docente`)
    REFERENCES `BibliotecaBD`.`Usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`Registro_entrada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`Registro_entrada` (
  `id_registro_entrada` INT NOT NULL,
  `hora_entrada` TIME NOT NULL,
  `fecha_entrada` DATE NOT NULL,
  `fk_matricula_registro` BIGINT(12) NOT NULL,
  PRIMARY KEY (`id_registro_entrada`),
  CONSTRAINT `fk_matricula_registro`
    FOREIGN KEY (`fk_matricula_registro`)
    REFERENCES `BibliotecaBD`.`Alumno` (`matricula`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`Prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`Prestamos` (
  `id_prestamos` INT NOT NULL,
  `fecha_entrega` DATETIME NOT NULL,
  `hora_actual` TIME NULL,
  `fecha_actual` DATE NOT NULL,
  `notificacion` BOOLEAN NOT NULL,
  `fk_rfc_bibliotecario_prestamo` INT NOT NULL,
  `fk_id_usuario_prestamo` INT NOT NULL,
  PRIMARY KEY (`id_prestamos`),
  CONSTRAINT `fk_rfc_bibliotecario_prestamo`
    FOREIGN KEY (`fk_rfc_bibliotecario_prestamo`)
    REFERENCES `BibliotecaBD`.`Bibliotecario` (`rfc_bibliotecario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_id_usuario_prestamo`
    FOREIGN KEY (`fk_id_usuario_prestamo`)
    REFERENCES `BibliotecaBD`.`Usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`Deuda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`Deuda` (
  `id_deuda` INT NOT NULL,
  `fecha` DATETIME NOT NULL,
  `Dias_transcurrido` VARCHAR(45) NOT NULL,
  `total` VARCHAR(45) NULL,
  `estado` BOOLEAN NULL,
  PRIMARY KEY (`id_deuda`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`Devolucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`Devolucion` (
  `id_devolucion` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `fk_rfc_bibliotecario_devolucion` INT NOT NULL,
  `fk_id_prestamos` INT NOT NULL,
  `fk_id_deuda` INT NOT NULL,
  PRIMARY KEY (`id_devolucion`),
  CONSTRAINT `fk_rfc_bibliotecario_devolucion`
    FOREIGN KEY (`fk_rfc_bibliotecario_devolucion`)
    REFERENCES `BibliotecaBD`.`Bibliotecario` (`rfc_bibliotecario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_id_prestamos`
    FOREIGN KEY (`fk_id_prestamos`)
    REFERENCES `BibliotecaBD`.`Prestamos` (`id_prestamos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_id_deuda`
    FOREIGN KEY (`fk_id_deuda`)
    REFERENCES `BibliotecaBD`.`Deuda` (`id_deuda`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`clasificacion_dewey`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`clasificacion_dewey` (
  `id_clasificacion_dewey` INT NOT NULL,
  `clasificacion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_clasificacion_dewey`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`Material_bibliografico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`Material_bibliografico` (
  `codigo_de_barra` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `autor` VARCHAR(45) NOT NULL,
  `num_paginas` INT NOT NULL,
  `fecha_de_publicacion` DATE NOT NULL,
  `num_estante` INT NULL,
  `num_seccion` INT NULL,
  `fk_id_clasificacion_dewey` INT NOT NULL,
  PRIMARY KEY (`codigo_de_barra`),
  CONSTRAINT `fk_id_clasificacion_dewey`
    FOREIGN KEY (`fk_id_clasificacion_dewey`)
    REFERENCES `BibliotecaBD`.`clasificacion_dewey` (`id_clasificacion_dewey`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`Detalle_devolucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`Detalle_devolucion` (
  `id_detalle_devolucion` INT NOT NULL,
  `fk_id_devolucion` INT NOT NULL,
  `fk_codigo_de_barra_devolucion` INT NOT NULL,
  PRIMARY KEY (`id_detalle_devolucion`),
  CONSTRAINT `fk_id_devolucion`
    FOREIGN KEY (`fk_id_devolucion`)
    REFERENCES `BibliotecaBD`.`Devolucion` (`id_devolucion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codigo_de_barra_devolucion`
    FOREIGN KEY (`fk_codigo_de_barra_devolucion`)
    REFERENCES `BibliotecaBD`.`Material_bibliografico` (`codigo_de_barra`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`Libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`Libro` (
  `id_libro` INT NOT NULL,
  `Edicion` VARCHAR(45) NOT NULL,
  `Editorial` VARCHAR(45) NOT NULL,
  `num_tomo` VARCHAR(45) NULL,
  `fk_codigo_de_barra_libro` INT NOT NULL,
  PRIMARY KEY (`id_libro`),
  CONSTRAINT `fk_codigo_de_barra_libro`
    FOREIGN KEY (`fk_codigo_de_barra_libro`)
    REFERENCES `BibliotecaBD`.`Material_bibliografico` (`codigo_de_barra`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`Tesis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`Tesis` (
  `id_tesis` INT NOT NULL,
  `carrera` VARCHAR(45) NOT NULL,
  `fk_codigo_de_barra_tesis` INT NOT NULL,
  PRIMARY KEY (`id_tesis`),
  CONSTRAINT `fk_codigo_de_barra_tesis`
    FOREIGN KEY (`fk_codigo_de_barra_tesis`)
    REFERENCES `BibliotecaBD`.`Material_bibliografico` (`codigo_de_barra`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`Revista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`Revista` (
  `id_revista` INT NOT NULL,
  `idioma` VARCHAR(45) NULL,
  `edicion` VARCHAR(45) NULL,
  `editorial` VARCHAR(45) NOT NULL,
  `fk_codigo_de_barra_revista` INT NOT NULL,
  PRIMARY KEY (`id_revista`),
  CONSTRAINT `fk_codigo_de_barra_revista`
    FOREIGN KEY (`fk_codigo_de_barra_revista`)
    REFERENCES `BibliotecaBD`.`Material_bibliografico` (`codigo_de_barra`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`Detalle_prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`Detalle_prestamo` (
  `id_detalle_prestamo` INT NOT NULL,
  `fk_id_prestamos_detalle` INT NOT NULL,
  `fk_codigo_de_barra_prestamo` INT NOT NULL,
  PRIMARY KEY (`id_detalle_prestamo`),
  CONSTRAINT `fk_id_prestamos_detalle`
    FOREIGN KEY (`fk_id_prestamos_detalle`)
    REFERENCES `BibliotecaBD`.`Prestamos` (`id_prestamos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_codigo_de_barra_prestamo`
    FOREIGN KEY (`fk_codigo_de_barra_prestamo`)
    REFERENCES `BibliotecaBD`.`Material_bibliografico` (`codigo_de_barra`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`turno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`turno` (
  `id_turno` INT NOT NULL AUTO_INCREMENT,
  `nombretuno` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_turno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BibliotecaBD`.`turno_Bibliotecario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`turno_Bibliotecario` (
  `id_turno_bibliotecario` INT NOT NULL AUTO_INCREMENT,
  `fk_id_turno` INT NOT NULL,
  `fk_rfc_bibliotecario_turno` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  PRIMARY KEY (`id_turno_bibliotecario`),
  CONSTRAINT `fk_id_turno`
    FOREIGN KEY (`fk_id_turno`)
    REFERENCES `BibliotecaBD`.`turno` (`id_turno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rfc_bibliotecario_turno`
    FOREIGN KEY (`fk_rfc_bibliotecario_turno`)
    REFERENCES `BibliotecaBD`.`Bibliotecario` (`rfc_bibliotecario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `BibliotecaBD`.`email` (
  `idemail` VARCHAR(100) NOT NULL,
  `fk_id_usuario_email` INT NOT NULL,
  PRIMARY KEY (`idemail`),
  CONSTRAINT `fk_id_usuario_email`
    FOREIGN KEY (`fk_id_usuario_email`)
    REFERENCES `BibliotecaBD`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
