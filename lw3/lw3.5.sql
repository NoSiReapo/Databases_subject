DROP database IF EXISTS barbershop;

CREATE DATABASE  IF NOT EXISTS barbershop 
    CHARACTER SET utf8 
    COLLATE utf8_unicode_ci
;

USE barbershop;

CREATE TABLE IF NOT EXISTS barbershop (
    id_barbershop INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    number INT NULL,
    address VARCHAR(255) NULL,
    area INT NULL
) AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS barber (
    id_barber INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age TINYINT NOT NULL,
    seniority TINYINT NOT NULL,
    wages BIGINT NOT NULL,
    id_barbershop INT NOT NULL,
    FOREIGN KEY (id_barbershop) REFERENCES barbershop (id_barbershop)
);

CREATE TABLE IF NOT EXISTS customer (
    id_customer INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    mobile_number VARCHAR(13) NOT NULL,
    age TINYINT NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS service (
    id_service INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    description VARCHAR(255) NOT NULL,
    duration TINYINT NOT NULL
)  ;

CREATE TABLE IF NOT EXISTS performed_service (
    id_performed_service INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    number INT NOT NULL,
    price INT NOT NULL,
    quality INT NOT NULL,
    id_service INT NOT NULL,
    id_barber INT NOT NULL,
    id_customer INT NOT NULL,
    FOREIGN KEY (id_service) REFERENCES service (id_service),
    FOREIGN KEY (id_barber) REFERENCES barber (id_barber),
    FOREIGN KEY (id_customer) REFERENCES customer (id_customer)
    
);