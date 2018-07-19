SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`categoria` (
  `idcategoria` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`idcategoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`producto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`producto` (
  `idproducto` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `marca` VARCHAR(45) NULL DEFAULT NULL ,
  `precio` DOUBLE NULL DEFAULT NULL ,
  `stock` INT NULL DEFAULT NULL ,
  `idcategoria` INT NOT NULL ,
  PRIMARY KEY (`idproducto`) ,
  INDEX `fk_producto_categoria1` (`idcategoria` ASC) ,
  CONSTRAINT `fk_producto_categoria1`
    FOREIGN KEY (`idcategoria` )
    REFERENCES `mydb`.`categoria` (`idcategoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL DEFAULT NULL ,
  `apellido` VARCHAR(45) NULL DEFAULT NULL ,
  `edad` INT NULL DEFAULT NULL ,
  `fechaNacimiento` DATE NULL DEFAULT NULL ,
  PRIMARY KEY (`idcliente`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `login` VARCHAR(45) NULL ,
  `clave` VARCHAR(45) NULL ,
  `correo` VARCHAR(45) NULL ,
  PRIMARY KEY (`idusuario`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`boleta`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`boleta` (
  `idboleta` INT NOT NULL AUTO_INCREMENT ,
  `fecha` DATE NULL DEFAULT NULL ,
  `idcliente` INT NOT NULL ,
  `idusuario` INT NOT NULL ,
  PRIMARY KEY (`idboleta`) ,
  INDEX `fk_boleta_cliente` (`idcliente` ASC) ,
  INDEX `fk_boleta_usuario1` (`idusuario` ASC) ,
  CONSTRAINT `fk_boleta_cliente`
    FOREIGN KEY (`idcliente` )
    REFERENCES `mydb`.`cliente` (`idcliente` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boleta_usuario1`
    FOREIGN KEY (`idusuario` )
    REFERENCES `mydb`.`usuario` (`idusuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`producto_has_boleta`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`producto_has_boleta` (
  `idproducto` INT NOT NULL ,
  `idboleta` INT NOT NULL ,
  `precio` DOUBLE NULL DEFAULT NULL ,
  `cantidad` INT NULL DEFAULT NULL ,
  PRIMARY KEY (`idproducto`, `idboleta`) ,
  INDEX `fk_producto_has_boleta_producto1` (`idproducto` ASC) ,
  INDEX `fk_producto_has_boleta_boleta1` (`idboleta` ASC) ,
  CONSTRAINT `fk_producto_has_boleta_producto1`
    FOREIGN KEY (`idproducto` )
    REFERENCES `mydb`.`producto` (`idproducto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_has_boleta_boleta1`
    FOREIGN KEY (`idboleta` )
    REFERENCES `mydb`.`boleta` (`idboleta` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`rol`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`rol` (
  `idrol` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NULL ,
  PRIMARY KEY (`idrol`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`opcion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`opcion` (
  `idopcion` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NULL ,
  `estado` VARCHAR(45) NULL ,
  PRIMARY KEY (`idopcion`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`permiso`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`permiso` (
  `idusuario` INT NOT NULL ,
  `idrol` INT NOT NULL ,
  PRIMARY KEY (`idusuario`, `idrol`) ,
  INDEX `fk_usuario_has_rol_rol1` (`idrol` ASC) ,
  INDEX `fk_usuario_has_rol_usuario1` (`idusuario` ASC) ,
  CONSTRAINT `fk_usuario_has_rol_usuario1`
    FOREIGN KEY (`idusuario` )
    REFERENCES `mydb`.`usuario` (`idusuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_rol_rol1`
    FOREIGN KEY (`idrol` )
    REFERENCES `mydb`.`rol` (`idrol` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`acceso`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`acceso` (
  `idrol` INT NOT NULL ,
  `idopcion` INT NOT NULL ,
  PRIMARY KEY (`idrol`, `idopcion`) ,
  INDEX `fk_rol_has_opcion_opcion1` (`idopcion` ASC) ,
  INDEX `fk_rol_has_opcion_rol1` (`idrol` ASC) ,
  CONSTRAINT `fk_rol_has_opcion_rol1`
    FOREIGN KEY (`idrol` )
    REFERENCES `mydb`.`rol` (`idrol` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rol_has_opcion_opcion1`
    FOREIGN KEY (`idopcion` )
    REFERENCES `mydb`.`opcion` (`idopcion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


insert into categoria values(null, "Comestibles");
insert into categoria values(null, "Bebibles");
insert into categoria values(null, "Licores");
insert into categoria values(null, "Albarrores");

insert into opcion values(null, "Producto","ACTIVO");
insert into opcion values(null, "Categoria","ACTIVO");
insert into opcion values(null, "Cliente","ACTIVO");
insert into opcion values(null, "Ventas","ACTIVO");
insert into opcion values(null, "Ventas por cliente","ACTIVO");
insert into opcion values(null, "Ventas por producto","ACTIVO");
insert into opcion values(null, "Boleta","ACTIVO");

insert into rol values(null, "Administrador");
insert into rol values(null, "Cajero");

insert into usuario values(null, "Elba Flores","elba","elba", "elba@gmail.com");
insert into usuario values(null, "Jorge Jacinto","jorge","jorge", "jorge@gmail.com");
insert into usuario values(null, "Leo Jacinto","leo","leo", "leo@gmail.com");

insert into permiso values(1,1);
insert into permiso values(2,1);
insert into permiso values(3,2);

insert into acceso values(1,1);
insert into acceso values(1,2);
insert into acceso values(1,3);
insert into acceso values(1,4);
insert into acceso values(1,5);
insert into acceso values(1,6);
insert into acceso values(1,7);
insert into acceso values(2,1);
insert into acceso values(2,2);

insert into producto values(null, "Papa","Metro",1.5, 111, 1);
insert into producto values(null, "Camote","Metro",1.0, 43, 1);
insert into producto values(null, "Leche","Metro",2.5, 433, 2);
insert into producto values(null, "Mandarina","Metro",2.5, 343, 1);
insert into producto values(null, "Gasesosa","Metro",1.5, 22, 2);


insert into cliente values(null, "Luis","Perales",22, "1979-10-10");
insert into cliente values(null, "Pedro","Garcia",22, "1979-10-10");
insert into cliente values(null, "Sonia","Quispe",22, "1979-10-10");
insert into cliente values(null, "Jorge","Arco",22, "1979-10-10");
insert into cliente values(null, "Rosa","Cardenas",22, "1979-10-10");


USE `mydb`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.6.23-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno` (
  `idalumno` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `idcarrera` int(11) NOT NULL,
  PRIMARY KEY (`idalumno`),
  KEY `fk_alumno_carrera_idx` (`idcarrera`),
  CONSTRAINT `fk_alumno_carrera` FOREIGN KEY (`idcarrera`) REFERENCES `carrera` (`idcarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,'Luis','Arcos',1),(2,'Sonia','Morales',2),(3,'Wendy','Camarena',1),(4,'Leo','Camarena',1),(5,'Luciana','Arcos',3);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `idcarrera` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Informática'),(2,'Redes'),(3,'Diseño'),(4,'Contabilidad');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-03 15:55:05
