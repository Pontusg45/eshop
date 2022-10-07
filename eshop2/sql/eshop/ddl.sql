-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema eshop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema eshop
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `eshop`;
CREATE SCHEMA IF NOT EXISTS `eshop` DEFAULT CHARACTER SET utf8 ;
USE `eshop` ;

-- -----------------------------------------------------
-- Table `eshop`.`kund`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eshop`.`kund` (
  `namn` VARCHAR(20) NOT NULL,
  `adress` VARCHAR(45) NOT NULL,
  `kund_id` INT(4) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `telefonnummer` INT(10) NOT NULL,
  INDEX `namn_idx` (`namn` ASC) VISIBLE,
  INDEX `adress_idx` (`adress` ASC) VISIBLE,
  INDEX `telefonnummer_idx` (`telefonnummer` ASC) VISIBLE);

-- -----------------------------------------------------
-- Table `eshop`.`produkt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eshop`.`produkt` (
  `antal` INT(3) NOT NULL,
  `kategori` VARCHAR(20) NOT NULL,
  `produkt_id` INT(4) NOT NULL AUTO_INCREMENT,
  `beskrivning` VARCHAR(255) NOT NULL,
  `pris` INT(4) NOT NULL,
  `namn` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`produkt_id`),
  UNIQUE INDEX `produkt_id_UNIQUE` (`produkt_id` ASC) VISIBLE,
  INDEX `antal_idx` (`antal` ASC) VISIBLE,
  INDEX `pris_idx` (`pris` ASC) VISIBLE,
  INDEX `namn_idx` (`namn` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `eshop`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eshop`.`order` (
  `namn` VARCHAR(20) NOT NULL,
  `id` INT(4) NOT NULL,
  `kund_id` INT(4) NOT NULL,
  `antal` INT(3),
  `telefonnummer` INT(10) NOT NULL,
  `produkt_id` INT(4),
  `adress` VARCHAR(45) NOT NULL,
      `created` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated` TIMESTAMP DEFAULT NULL
                ON UPDATE CURRENT_TIMESTAMP,
    `sent` TIMESTAMP DEFAULT NULL,
    `ordered` TIMESTAMP DEFAULT NULL,
    `deleted` TIMESTAMP DEFAULT NULL,
  INDEX `kund_id_idx` (`kund_id` ASC) VISIBLE,
  INDEX `produkt_id_idx` (`produkt_id` ASC) VISIBLE,
  INDEX `antal_idx` (`antal` ASC) VISIBLE,
  INDEX `id_idx` (`id` ASC) VISIBLE,
  CONSTRAINT `namn2`
    FOREIGN KEY (`namn`)
    REFERENCES `eshop`.`kund` (`namn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
		CONSTRAINT `kund_id3`
    FOREIGN KEY (`kund_id`)
    REFERENCES `eshop`.`kund` (`kund_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
		CONSTRAINT `adress2`
    FOREIGN KEY (`adress`)
    REFERENCES `eshop`.`kund` (`adress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
		CONSTRAINT `produkt_id3`
    FOREIGN KEY (`produkt_id`)
    REFERENCES `eshop`.`lager` (`produkt_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `telefonnummer1`
    FOREIGN KEY (`telefonnummer`)
    REFERENCES `eshop`.`kund` (`telefonnummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `eshop`.`faktura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eshop`.`faktura` (
  `namn` VARCHAR(20) NOT NULL,
  `kund_id` INT(4) NOT NULL,
  `antal` INT(3) NOT NULL,
  `produkt_id` INT(4) NOT NULL,
  `order_id` INT(4) NOT NULL,
  `adress` VARCHAR(45) NOT NULL,
  `pris` INT(4) NOT NULL,
  `total_summa` INT(4) NOT NULL,
  INDEX `kund_id_idx` (`kund_id` ASC) VISIBLE,
  CONSTRAINT `namn1`
    FOREIGN KEY (`namn`)
    REFERENCES `eshop`.`kund` (`namn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
      CONSTRAINT `antal2`
    FOREIGN KEY (`antal`)
    REFERENCES `eshop`.`order` (`antal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
		CONSTRAINT `kund_id0`
    FOREIGN KEY (`kund_id`)
    REFERENCES `eshop`.`kund` (`kund_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
		CONSTRAINT `adress1`
    FOREIGN KEY (`adress`)
    REFERENCES `eshop`.`kund` (`adress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
		CONSTRAINT `pris0`
    FOREIGN KEY (`pris`)
    REFERENCES `eshop`.`produkt` (`pris`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
		CONSTRAINT `produkt_id2`
    FOREIGN KEY (`produkt_id`)
    REFERENCES `eshop`.`lager` (`produkt_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `order_id0`
    FOREIGN KEY (`order_id`)
    REFERENCES `eshop`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `eshop`.`plocklista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eshop`.`plocklista` (
  `namn` VARCHAR(20) NOT NULL,
  `kund_id` INT(4) NOT NULL,
  `antal` INT(3) NOT NULL,
  `telefonnummer` INT(10) NOT NULL,
  `produkt_id` INT(4) NOT NULL,
  `adress` VARCHAR(45) NOT NULL,
  `hylla` INT(4) NOT NULL,
  `order_id` INT(4) NOT NULL,
  INDEX `order_id_idx` (`order_id` ASC) VISIBLE,
		CONSTRAINT `namn0`
    FOREIGN KEY (`namn`)
    REFERENCES `eshop`.`kund` (`namn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
      CONSTRAINT `antal0`
    FOREIGN KEY (`antal`)
    REFERENCES `eshop`.`order` (`antal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
		CONSTRAINT `kund_id1`
    FOREIGN KEY (`kund_id`)
    REFERENCES `eshop`.`kund` (`kund_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
      CONSTRAINT `telefonnummer0`
    FOREIGN KEY (`telefonnummer`)
    REFERENCES `eshop`.`kund` (`telefonnummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
		CONSTRAINT `adress0`
    FOREIGN KEY (`adress`)
    REFERENCES `eshop`.`kund` (`adress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
		CONSTRAINT `hylla0`
    FOREIGN KEY (`hylla`)
    REFERENCES `eshop`.`lager` (`hylla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
		CONSTRAINT `produkt_id0`
    FOREIGN KEY (`produkt_id`)
    REFERENCES `eshop`.`lager` (`produkt_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `order_id1`
    FOREIGN KEY (`order_id`)
    REFERENCES `eshop`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `eshop`.`lager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eshop`.`lager` (
  `antal` INT(3),
  `produkt_id` INT(4) NOT NULL,
  `hylla` INT(4) NOT NULL,
  `namn` VARCHAR(20),
  INDEX `produkt_id_idx` (`produkt_id` ASC) VISIBLE,
  INDEX `hylla_idx` (`hylla` ASC) VISIBLE,
      CONSTRAINT `produkt_id1`
    FOREIGN KEY (`produkt_id`)
    REFERENCES `eshop`.`produkt` (`produkt_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `namn3`
    FOREIGN KEY (`namn`)
    REFERENCES `eshop`.`produkt` (`namn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `eshop`.`logg`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `eshop`.`logg` (
  `timestamp` TIMESTAMP DEFAULT current_timestamp,
  `händelse` VARCHAR(45) NOT NULL,
  `id` INT(4) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

--
-- Stored Procedures
--
DROP PROCEDURE IF EXISTS show_category;
DROP PROCEDURE IF EXISTS show_products;
DROP PROCEDURE IF EXISTS logg;
DROP PROCEDURE IF EXISTS add_product;
DROP PROCEDURE IF EXISTS delete_product;
DROP PROCEDURE IF EXISTS show_selfves;
DROP PROCEDURE IF EXISTS show_inventory;
DROP PROCEDURE IF EXISTS update_product;
DROP PROCEDURE IF EXISTS create_product;
DROP PROCEDURE IF EXISTS show_specific_product;
DROP PROCEDURE IF EXISTS remove_product;
DROP PROCEDURE IF EXISTS show_costumers;
DROP PROCEDURE IF EXISTS create_order;
DROP PROCEDURE IF EXISTS show_orders;
DROP PROCEDURE IF EXISTS add_to_order;
DROP PROCEDURE IF EXISTS create_picklist;
DROP PROCEDURE IF EXISTS ship_order;
DROP PROCEDURE IF EXISTS show_full_orders;

--
-- Functions
--
DROP FUNCTION IF EXISTS order_status;

--
-- Triggers
--
DROP TRIGGER IF EXISTS add_product;
DROP TRIGGER IF EXISTS updated_product;
DROP TRIGGER IF EXISTS delete_product;

DELIMITER ;;

CREATE PROCEDURE show_category()
BEGIN
  SELECT kategori
  FROM produkt;
END
;;

CREATE PROCEDURE show_products()
BEGIN
  SELECT *
  FROM produkt;
END
;;

CREATE PROCEDURE logg(
IN a_rows INT(3)
)
BEGIN
   SELECT * FROM logg ORDER BY timestamp DESC LIMIT a_rows;
END
;;

CREATE PROCEDURE add_product(
IN a_product_id INT(3),
IN a_shelf INT(3),
IN a_quantity INT(3)
)
BEGIN
	DECLARE name VARCHAR(20);
    SELECT namn INTO name FROM produkt WHERE produkt_id = a_product_id;
	INSERT INTO lager
    (antal, produkt_id, hylla, namn)
VALUES
    (a_quantity,a_product_id,a_shelf, name)
;
END
;;

CREATE PROCEDURE delete_product(
IN a_product_id INT(3),
IN a_shelf INT(3),
IN a_quantity INT(3)
)
BEGIN
	UPDATE lager
    SET 
    antal = antal - a_quantity
    WHERE
    hylla = a_shelf AND produkt_id = a_product_id
;
END
;;

CREATE PROCEDURE show_selfves()
BEGIN
	SELECT hylla
    FROM lager
;
END
;;

CREATE PROCEDURE show_inventory(
a_search_str VARCHAR(20),
a_search_like VARCHAR(20)
)
BEGIN
	IF a_search_str != "" THEN
	SELECT * FROM lager WHERE produkt_id = a_search_str OR hylla = a_search_str OR namn LIKE a_search_like;
	ELSE 
    SELECT * FROM lager;
	END IF;
END
;;

CREATE PROCEDURE update_product(
IN a_name VARCHAR(20),
IN a_beskrivning VARCHAR(255),
IN a_pris INT(4),
IN a_produkt_id INT(3)
)
BEGIN
	UPDATE produkt
    SET namn = a_name,
    beskrivning = a_beskrivning,
    pris = a_pris
    WHERE produkt_id LIKE a_produkt_id;
END
;;

CREATE PROCEDURE create_product(
    a_name VARCHAR(20),
    a_category VARCHAR(20),
    a_price INT(4),
    a_desc CHAR(255),
    a_quantity INT(4)
)
BEGIN
	INSERT INTO produkt
    (namn, kategori, pris, beskrivning, antal)
VALUES
    (a_name, a_category, a_price, a_desc, a_quantity)
;
END
;;

CREATE PROCEDURE remove_product(
    a_id INT(4)
)
BEGIN
	DELETE FROM produkt 
    WHERE produkt_id = a_id
;
END
;;



CREATE PROCEDURE show_specific_product(
a_id INT(4)
)
BEGIN
  SELECT *
  FROM produkt
  WHERE produkt_id = a_id;
END
;;

CREATE PROCEDURE show_costumers()
BEGIN
    SELECT * FROM kund;
END
;;

CREATE PROCEDURE show_orders()
BEGIN
    SELECT id, MAX(namn) AS Namn, MAX(telefonnummer) AS Telefonnummer, MAX(adress) AS Adress, SUM(antal) AS Antal, order_status(MAX(created), MAX(updated), MAX(sent), MAX(ordered), MAX(deleted)) AS `Status` FROM `order` GROUP BY id;
END
;;


CREATE PROCEDURE show_full_orders(
IN a_id INT(4)
)
BEGIN
	IF a_id != 0 THEN
		SELECT * FROM `order` WHERE kund_id = a_id OR id = a_id;
	ELSE 
		SELECT id, MAX(namn) AS Namn, 
		MAX(telefonnummer) AS Telefonnummer, 
		MAX(adress) AS Adress, 
		SUM(antal) AS Antal,
		order_status(MAX(created), MAX(updated), MAX(sent), MAX(ordered), MAX(deleted)) AS `Status` 
		FROM `order` 
		GROUP BY id;
	END IF;
END
;;

CREATE PROCEDURE create_order(
IN a_kund_id INT(4))
BEGIN
	IF (SELECT COUNT(*) FROM `order`) != 0 THEN
		INSERT INTO `order` (namn, adress,kund_id, telefonnummer, id) 
		SELECT namn, adress, kund_id, telefonnummer,(SELECT id+1  from `order` o ORDER BY id DESC LIMIT 1 )
		FROM kund WHERE kund_id = a_kund_id;
	ELSE
		INSERT INTO `order` (namn, adress,kund_id, telefonnummer, id) 
		SELECT namn, adress, kund_id, telefonnummer,0 
		FROM kund WHERE kund_id = a_kund_id;
	END IF;
END
;;

CREATE PROCEDURE add_to_order(
IN a_id INT(4),
IN a_produkt_id INT(4),
IN a_antal INT(4))
BEGIN

INSERT INTO `order` (namn, adress,kund_id, telefonnummer, id, produkt_id, antal ) 
SELECT namn, adress, kund_id, telefonnummer, a_id AS id, a_produkt_id AS produkt_id, a_antal AS antal
FROM `order` WHERE id = a_id LIMIT 1;
UPDATE `lager`
SET
    `antal` =  antal - a_antal
WHERE
    `produkt_id` = a_produkt_id
;
UPDATE `order`
SET
    `updated` = CURRENT_TIMESTAMP
WHERE
    `id` = a_id
;
END
;;

CREATE PROCEDURE create_picklist(
IN a_order_id INT(4)
)
BEGIN
INSERT INTO `plocklista` (namn, adress, kund_id, telefonnummer, order_id, produkt_id, antal, hylla) 
SELECT namn, 
	adress, 
    kund_id, 
    telefonnummer, 
    id, produkt_id AS produkt, 
    antal, 
    (SELECT hylla FROM lager WHERE produkt_id = produkt LIMIT 1) 
FROM `order` WHERE id = a_order_id AND produkt_id IS NOT NULL ORDER BY produkt_id DESC;
SELECT namn, 
adress, 
kund_id, 
telefonnummer, 
order_id, 
produkt_id AS produkt, 
antal,
(SELECT SUM(antal) FROM lager WHERE produkt_id = produkt GROUP BY produkt_id) AS lager_status,
hylla 
FROM plocklista;
END
;;

CREATE PROCEDURE ship_order(
IN a_order_id INT(4)
)
BEGIN
UPDATE `order`
SET
    `sent` = CURRENT_TIMESTAMP
WHERE
    `id` = a_order_id
;
END
;;

CREATE FUNCTION order_status(
    a_created TIMESTAMP,
    a_updated TIMESTAMP,
    a_sent TIMESTAMP,
    a_deleted TIMESTAMP,
    a_ordered TIMESTAMP
)
RETURNS CHAR(10)
DETERMINISTIC
BEGIN
    IF a_sent IS NOT NULL THEN
        RETURN 'sent';
    ELSEIF a_deleted IS NOT NULL THEN
		RETURN 'deleted';
    ElSEIF a_ordered IS NOT NULL THEN
        RETURN 'ordered';
    ELSEIF a_updated IS NOT NULL THEN
        RETURN 'updated';
    ELSEIF a_created IS NOT NULL THEN
        RETURN 'created';
    END IF;
		RETURN 'unknown';
END
;;


CREATE TRIGGER add_product
AFTER INSERT
ON produkt FOR EACH ROW
BEGIN  
    INSERT INTO logg (händelse)
    VALUES (CONCAT("Produkten med produktid: ", NEW.produkt_id, " tillagd."));
END
;;

CREATE TRIGGER updated_product
AFTER UPDATE
ON produkt FOR EACH ROW
BEGIN  
    INSERT INTO logg (händelse)
    VALUES (CONCAT("Produkten med produktid: ", NEW.produkt_id, " updaterades."));
END
;;

CREATE TRIGGER delete_product
AFTER DELETE
ON produkt FOR EACH ROW
BEGIN  

    INSERT INTO logg (händelse)
    VALUES (CONCAT("Produkten med produktid: ", OLD.produkt_id, " raderades."));
END
;;

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
