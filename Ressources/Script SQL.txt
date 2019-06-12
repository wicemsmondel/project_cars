CREATE DATABASE `project_cars` ;

CREATE TABLE `project_cars`.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `firstname_user` VARCHAR(45) NOT NULL,
  `lastname_user` VARCHAR(45) NOT NULL,
  `email_user` VARCHAR(45) NOT NULL,
  `password_user` VARCHAR(45) NOT NULL,
  `phone_user` VARCHAR(45) NOT NULL,
  `status_user` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_user`));


CREATE TABLE `project_cars`.`car` (
  `id_car` INT NOT NULL AUTO_INCREMENT,
  `brand_car` VARCHAR(45) NOT NULL,
  `model_car` VARCHAR(45) NOT NULL,
  `version_car` VARCHAR(45) NOT NULL,
  `body_car` VARCHAR(45) NOT NULL,
  `energy_car` VARCHAR(45) NOT NULL,
  `year_car` INT NOT NULL,
  `mileage` INT NOT NULL,
  `color_car` VARCHAR(45) NOT NULL,
  `doors_car` INT NOT NULL,
  `places_car` INT NOT NULL,
  `datecirculation_car` DATE NOT NULL,
  `gearbox_car` VARCHAR(45) NOT NULL,
  `horsepower_car` INT NOT NULL,
  `price_car` INT NOT NULL,
  PRIMARY KEY (`id_car`));

