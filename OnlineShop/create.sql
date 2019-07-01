CREATE SCHEMA IF NOT EXISTS `onlineshopdb` DEFAULT CHARACTER SET utf8 ;
USE `onlineshopdb` ;

CREATE TABLE IF NOT EXISTS `onlineshopdb`.`Admin` (
  `userID` INT NOT NULL AUTO_INCREMENT,
  `adminName` VARCHAR(70) NOT NULL,
  `email` VARCHAR(70) NOT NULL,
  `password` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`userID`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `onlineshopdb`.`OrderDetails` (
  `orderID` INT NOT NULL AUTO_INCREMENT,
  `productID` INT NOT NULL,
  `productName` VARCHAR(32) NOT NULL,
  `unitCost` DECIMAL NOT NULL,
  `quantity` INT NOT NULL,
  `total` DECIMAL NOT NULL,
  PRIMARY KEY (`orderID`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `onlineshopdb`.`ShippingInfo` (
  `shippingID` INT NOT NULL AUTO_INCREMENT,
  `shippingInfo` VARCHAR(32) NOT NULL,
  `shippingCost` DECIMAL NOT NULL,
  `shippingRegion` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`shippingID`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `onlineshopdb`.`OrderItem` (
  `orderID` INT NOT NULL AUTO_INCREMENT,
  `userID` INT NOT NULL,
  `shippingID` INT NOT NULL,
  `dateCreated` DATE NOT NULL,
  `dateShipped` DATE NOT NULL,
  `customerName` VARCHAR(32) NOT NULL,
  `OrderDetails_orderID` INT NOT NULL,
  `ShippingInfo_shippingID` INT NOT NULL,
  PRIMARY KEY (`orderID`),
  INDEX `fk_OrderItem_OrderDetails1_idx` (`OrderDetails_orderID` ASC) ,
  INDEX `fk_OrderItem_ShippingInfo1_idx` (`ShippingInfo_shippingID` ASC) ,
  CONSTRAINT `fk_OrderItem_OrderDetails1`
    FOREIGN KEY (`OrderDetails_orderID`)
    REFERENCES `onlineshopdb`.`OrderDetails` (`orderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderItem_ShippingInfo1`
    FOREIGN KEY (`ShippingInfo_shippingID`)
    REFERENCES `onlineshopdb`.`ShippingInfo` (`shippingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `onlineshopdb`.`ShoppingCart` (
  `cartID` INT NOT NULL AUTO_INCREMENT,
  `productID` INT NOT NULL,
  `quantity` INT NOT NULL,
  `dateAdded` DATE NOT NULL,
  PRIMARY KEY (`cartID`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `onlineshopdb`.`Customer` (
  `userID` INT NOT NULL AUTO_INCREMENT,
  `customerName` VARCHAR(32) NOT NULL,
  `email` VARCHAR(32) NOT NULL,
  `password` VARCHAR(16) NOT NULL,
  `address` VARCHAR(70) NOT NULL,
  `accountBalance` DECIMAL NULL,
  `OrderItem_orderID` INT NOT NULL,
  `ShoppingCart_cartID` INT NOT NULL,
  PRIMARY KEY (`userID`),
  INDEX `fk_Customer_OrderItem1_idx` (`OrderItem_orderID` ASC) ,
  INDEX `fk_Customer_ShoppingCart1_idx` (`ShoppingCart_cartID` ASC) ,
  CONSTRAINT `fk_Customer_OrderItem1`
    FOREIGN KEY (`OrderCustomer_orderID`)
    REFERENCES `onlineshopdb`.`OrderCustomer` (`orderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_ShoppingCart1`
    FOREIGN KEY (`ShoppingCart_cartID`)
    REFERENCES `onlineshopdb`.`ShoppingCart` (`cartID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
