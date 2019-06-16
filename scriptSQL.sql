DROP DATABASE IF EXISTS project_cars;
CREATE DATABASE project_cars;

CREATE TABLE project_cars.t_booking (
  booking_id int(11) NOT NULL,
  booking_date date NOT NULL,
  booking_time time NOT NULL,
  car_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  PRIMARY KEY (booking_id)
) ENGINE = InnoDB;

CREATE TABLE project_cars.t_cars (
  car_id int(11) NOT NULL AUTO_INCREMENT,
  car_brand varchar(20) NOT NULL,
  car_model varchar(20) NOT NULL,
  car_version varchar(45) NOT NULL,
  car_body varchar(15) NOT NULL,
  car_energy varchar(10) NOT NULL,
  car_year int(4) NOT NULL,
  car_mileage int(7) NOT NULL,
  car_color varchar(20) NOT NULL,
  car_doors int(2) NOT NULL,
  car_places int(2) NOT NULL,
  car_circulationdate date NOT NULL,
  car_gearbox varchar(15) NOT NULL,
  car_horsepower int(4) NOT NULL,
  car_price int(7) NOT NULL,
  PRIMARY KEY (car_id)
) ENGINE=InnoDB;

CREATE TABLE project_cars.t_cars_equipments (
  car_id int(11) NOT NULL,
  equipment_id int(11) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE project_cars.t_equipments (
  equipment_id int(11) NOT NULL AUTO_INCREMENT,
  equipment_text varchar(45) NOT NULL,
  equipment_type enum('ext','int','sec') NOT NULL,
  PRIMARY KEY (equipment_id)
) ENGINE=InnoDB; 

CREATE TABLE project_cars.t_images (
  image_id int(11) NOT NULL,
  image_link varchar(255) NOT NULL,
  car_id int(11) NOT NULL,
  PRIMARY KEY (image_id)
) ENGINE=InnoDB;

CREATE TABLE project_cars.t_newsletters (
  newsletter_id int(11) NOT NULL,
  newsletter_link varchar(255) NOT NULL,
  PRIMARY KEY (newsletter_id)
) ENGINE=InnoDB;

CREATE TABLE project_cars.t_subscribers (
  subscriber_id int(11) NOT NULL,
  subscriber_email varchar(45) NOT NULL,
  newsletter_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  PRIMARY KEY (subscriber_id)
) ENGINE=InnoDB;

CREATE TABLE project_cars.t_users (
  user_id int(11) NOT NULL,
  user_email varchar(45) NOT NULL,
  user_pass varchar(255) NOT NULL,
  user_firstname varchar(45) NOT NULL,
  user_lastname varchar(45) NOT NULL,
  user_phone varchar(45) DEFAULT NULL,
  user_status int(2) NOT NULL,
  PRIMARY KEY (user_id)
) ENGINE=InnoDB; 

ALTER TABLE project_cars.t_booking
ADD CONSTRAINT fk_bo_1 FOREIGN KEY (car_id) REFERENCES t_cars (car_id),
ADD CONSTRAINT fk_bo_2 FOREIGN KEY (user_id) REFERENCES t_users (user_id);

ALTER TABLE project_cars.t_cars_equipments
ADD CONSTRAINT fk_ca_eq_1 FOREIGN KEY (car_id) REFERENCES t_cars (car_id),
ADD CONSTRAINT fk_ca_eq_2 FOREIGN KEY (equipment_id) REFERENCES t_equipments (equipment_id);

ALTER TABLE project_cars.t_images
ADD CONSTRAINT fk_im_1 FOREIGN KEY (car_id) REFERENCES t_cars (car_id);

ALTER TABLE project_cars.t_subscribers
ADD CONSTRAINT fk_su_1 FOREIGN KEY (newsletter_id) REFERENCES t_newsletters (newsletter_id),
ADD CONSTRAINT fk_su_2 FOREIGN KEY (user_id) REFERENCES t_users (user_id);