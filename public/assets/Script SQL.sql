CREATE DATABASE  IF NOT EXISTS project_cars;
USE project_cars;

DROP TABLE IF EXISTS t_booking;
CREATE TABLE t_booking (
  booking_id int(11) NOT NULL AUTO_INCREMENT,
  booking_date date NOT NULL,
  booking_time time NOT NULL,
  car_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  PRIMARY KEY (booking_id),
  KEY fk_bo_1 (car_id),
  KEY fk_bo_2 ( user_id),
  CONSTRAINT fk_bo_1 FOREIGN KEY (car_id) REFERENCES t_cars (car_id),
  CONSTRAINT fk_bo_2 FOREIGN KEY (user_id) REFERENCES t_users (user_id)
) 

DROP TABLE IF EXISTS t_cars;
CREATE TABLE t_cars (
  car_id int(11) NOT NULL AUTO_INCREMENT,
  car_brand varchar(20) NOT NULL,
  car_model varchar(20) NOT NULL,
  car_version varchar(45) NOT NULL,
  car_energy varchar(10) NOT NULL,
  car_price int(7) NOT NULL,
  car_year int(4) NOT NULL,
  car_mileage int(7) NOT NULL,
  car_gearbox varchar(15) NOT NULL,
  car_horsepower int(4) NOT NULL,
  car_body varchar(15) NOT NULL,
  car_doors int(2) NOT NULL,
  car_places int(2) NOT NULL,
  car_circulationdate date NOT NULL,
  car_image varchar(45) NOT NULL,
  car_color varchar(20) NOT NULL,
  car_date timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (car_id)
) 

INSERT INTO t_cars VALUES (1,'Audi','A3','30 TDI 116 SPORT','diesel',31250,2018,20300,'manuelle',116,'compacte',3,5,'2018-01-12','images/audi_a3_blue','bleu','2019-07-15 10:28:09'),(2,'Audi','A5','45 TFSI 245 S Quattro','essence',54270,2019,6500,'automatique',245,'berline',4,5,'2019-02-11','images/audi_a5_black','noir','2019-07-15 10:28:09'),(3,'Audi','A5','40 TDI 190 S TRONIC AVUS','diesel',59630,2019,8900,'automatique',190,'coupe',3,5,'2019-01-01','images/audi_a5_lightgrey','gris clair','2019-07-15 10:31:21'),(4,'Audi ','A6','2.0 TDI 177 S Line','diesel',48210,2018,33000,'manuelle',177,'berline',5,5,'2018-03-04','images/audi_a6_grey','gris','2019-07-15 10:35:38'),(5,'Audi','Q2','30 TDI 116 SPORT','diesel',25900,2018,4500,'manuelle',116,'suv',3,5,'2018-04-30','images/audi_q2_grey','gris','2019-07-15 10:39:26'),(6,'Audi','Q3','1.5 35 TFSI 150','essence',33830,2018,23490,'manuelle',150,'suv',5,5,'2018-06-23','images/audi_q3_black','noir','2019-07-15 10:45:09'),(7,'Audi','Q7','50 TDI 286Ch Quattro Tiptronic S Line','diesel',75990,2019,1000,'automatique',286,'suv',5,7,'2019-05-10','images/audi_q7_black','noir','2019-07-15 10:45:09'),(8,'BMW','Serie 1','1.5 118I Lounge','essence',22000,2017,45000,'manuelle',120,'compacte',3,5,'2017-10-23','images/bmw_1_white','blanc','2019-07-15 10:47:35'),(9,'BMW','Serie 2','216I Première','essence',19800,2018,56900,'maneulle',180,'monospace',4,5,'2018-01-09','images/bmw_2_brown','marron','2019-07-15 10:55:14'),(10,'BMW','Serie 3','320D 190Ch Lounge','diesel',40300,2019,2300,'automatique',150,'berline',4,5,'2019-03-23','images/bmw_3_blue','bleu','2019-07-15 10:55:14'),(11,'BMW','Serie 4','420D xDrive 190Ch Lounge BVA8','diesel',43900,2019,9580,'automatique',190,'berline',5,5,'2019-03-21','images/bmw_4_blue','bleu','2019-07-15 10:57:34'),(12,'BMW','Serie 5','520I 184Ch Luxury BVA8','essence',51350,2019,9430,'automatique',184,'berline',4,5,'2019-01-19','images/bmw_5_black','noir','2019-07-15 11:00:23'),(13,'BMW','X3','sDrive18d 143 Exclusive OpenEdition BVA8','diesel',41850,2019,12000,'automatique',143,'suv',5,5,'2019-02-15','images/bmw_x3_black','noir','2019-07-15 12:28:13'),(14,'Mercedes','Classe A','180 AMG Line','essence',31400,2018,34000,'manuelle',180,'compacte',3,5,'2018-12-18','images/mercedes_a_lightgrey','gris clair','2019-07-15 12:31:13'),(15,'Mercedes','Classe C','250 D FASCINATION 4MATIC 9G-TRONIC','diesel',52900,2018,43000,'manuelle',204,'berline',4,5,'2018-10-14','images/mercedes_c_blue','bleu','2019-07-15 12:34:08'),(19,'Mercedes','Classe CLA','1.8 200 CDI Edition 1','diesel',37560,2018,34059,'manuelle',200,'coupe',3,5,'2018-10-13','images/mercedes_cla_brown','marron','2019-07-15 13:07:17'),(20,'Mercedes','Classe E','E 300 e 211ch 9G-Tronic Avantgarde Line','essence',53290,2018,25400,'automatique',211,'berline',4,5,'2018-10-12','images/mercedes_e_white','blanc','2019-07-15 13:07:17'),(21,'Mercedes','Classe GLA','250 Fascination 4Matic BVA7','diesel',41300,2018,34250,'automatique',250,'suv',5,7,'2018-10-11','images/mercedes_gla_black','noir','2019-07-15 13:07:17'),(22,'Porsche','Boxster','718 S','essence',58900,2018,21850,'manuelle',400,'coupe',2,2,'2018-10-10','images/porsche_boxster_black','noir','2019-07-15 13:07:17'),(23,'Porsche','Carrera','911 S','essence',98900,2018,34560,'automatique',400,'coupe',2,2,'2018-10-19','images/porsche_carrera_lightgrey','gris clair','2019-07-15 13:07:17'),(24,'Porsche','Cayenne','S','essence',57800,2018,56780,'automatique',400,'suv',5,7,'2018-10-18','images/porsche_cayenne_white','blanc','2019-07-15 13:07:17'),(25,'Porsche','Cayman','718 S','essence',51900,2018,56780,'manuelle',400,'cabriolet',2,2,'2018-10-17','images/porsche_cayman_black','noir','2019-07-15 13:07:17'),(26,'Porsche','Macan','S','essence',52300,2018,3256,'automatique',400,'suv',5,5,'2018-10-16','images/porsche_macan_white','blanc','2019-07-15 13:07:17'),(27,'Porsche','Panamera','GTS Sport Turismo','essence',99500,2018,4678,'automatique',400,'berline',5,5,'2018-10-15','images/porsche_panamera_blue','bleu','2019-07-15 13:07:17'),(28,'Volkswagen','Amarok','3.0 V6 TDI 258 4MOTION CARAT AUTO','diesel',38680,2018,35477,'manuelle',258,'pick-up',2,4,'2018-11-14','images/vw_amarok_brown','marron','2019-07-15 13:07:17'),(29,'Volkswagen','Golf','1.5 TSI EVO 150 DSG7 Carat','essence',30000,2018,23567,'manuelle',150,'compacte',3,5,'2018-12-14','images/vw_golf_black','noir','2019-07-15 13:07:17'),(30,'Volkswagen','Passat','2.0 TDI 150 DSG7 Carat BMT','diesel',41000,2018,34226,'automatique',150,'berline',4,5,'2018-12-11','images/vw_passat_black','noir','2019-07-15 13:07:17'),(31,'Volkswagen','Polo','1.0 TSI 95','essence',12000,2018,6432,'manuelle',95,'citadine',3,5,'2018-12-15','images/vw_polo_lightgrey','gris clair','2019-07-15 13:07:17'),(32,'Volkswagen','Tiguan','2.0 TDI 150 BVM6 Confortline Business','diesel',35000,2018,43266,'manuelle',150,'monospace',5,5,'2018-12-12','images/vw_tiguan_lightgrey','gris clair','2019-07-15 13:07:17'),(33,'Volkswagen','Touareg','3.0 V6 TDI 231 4WD CARAT AUTO','diesel',51000,2018,65432,'automatique',231,'suv',5,7,'2018-11-14','images/vw_touareg_grey','gris','2019-07-15 13:07:17');

DROP TABLE IF EXISTS t_cars_equipments;
CREATE TABLE t_cars_equipments (
  car_id int(11) NOT NULL,
  equipment_id int(11) NOT NULL,
  KEY fk_ca_eq_1 (car_id),
  KEY fk_ca_eq_2 (equipment_id),
  CONSTRAINT fk_ca_eq_1 FOREIGN KEY (car_id) REFERENCES t_cars (car_id),
  CONSTRAINT fk_ca_eq_2 FOREIGN KEY (equipment_id) REFERENCES t_equipments (equipment_id)
) 

DROP TABLE IF EXISTS t_equipments;
CREATE TABLE t_equipments (
  equipment_id int(11) NOT NULL AUTO_INCREMENT,
  equipment_text varchar(45) NOT NULL,
  equipment_type enum('ext','int','sec') NOT NULL,
  PRIMARY KEY (equipment_id)
) 

DROP TABLE IF EXISTS t_images;
CREATE TABLE t_images (
  image_id int(11) NOT NULL AUTO_INCREMENT,
  image_link varchar(255) NOT NULL,
  car_id int(11) NOT NULL,
  PRIMARY KEY (image_id),
  KEY fk_im_1 (car_id),
  CONSTRAINT fk_im_1 FOREIGN KEY (car_id) REFERENCES t_cars (car_id)
) 

DROP TABLE IF EXISTS t_newsletters;
CREATE TABLE t_newsletters (
  newsletter_id int(11) NOT NULL,
  newsletter_link varchar(255) NOT NULL,
  PRIMARY KEY (newsletter_id)
) 

DROP TABLE IF EXISTS t_subscribers;
CREATE TABLE t_subscribers (
  subscriber_id int(11) NOT NULL AUTO_INCREMENT,
  subscriber_email varchar(45) NOT NULL,
  newsletter_id int(11) NOT NULL,
  user_id int(11) NOT NULL,
  PRIMARY KEY (subscriber_id),
  KEY fk_su_1 (newsletter_id),
  KEY fk_su_2 (user_id),
  CONSTRAINT fk_su_1 FOREIGN KEY (newsletter_id) REFERENCES t_newsletters (newsletter_id),
  CONSTRAINT fk_su_2 FOREIGN KEY (user_id) REFERENCES t_users (user_id)
) 

DROP TABLE IF EXISTS t_users;
CREATE TABLE t_users (
  user_id int(11) NOT NULL AUTO_INCREMENT,
  user_email varchar(45) NOT NULL,
  user_password varchar(255) NOT NULL,
  user_firstname varchar(45) NOT NULL,
  user_lastname varchar(45) NOT NULL,
  user_phone varchar(45) DEFAULT NULL,
  user_status int(2) DEFAULT '1',
  PRIMARY KEY (user_id)
) 

INSERT INTO t_users VALUES (41,'test','test','test','test',NULL,1),(47,'hello@world.com','helloWorld','Hello','world',NULL,1),(50,'a@a.a','$2b$10$0U.SvbGIdNTxq/NpmVRMUeSUYoNtMgv4xu4sloYaeJP04BJyFWBSq','Wicem','SMONDEL',NULL,1),(51,'admin@admin.fr','$2b$10$GOYZ4Jgi3gROsBKYhYRh8uEVwD3AJ/2x3ZLkIBvLtOFXV9U2QWs0u','admin','admin',NULL,2);
