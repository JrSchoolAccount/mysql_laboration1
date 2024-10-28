--
-- Drop the existing database if it exists
-- Create a new database
--
DROP DATABASE IF EXISTS bookstore;
CREATE DATABASE bookstore;
USE bookstore;

CREATE TABLE author
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name  VARCHAR(100) NOT NULL,
    birth_date DATE
);

CREATE TABLE language
(
    id        INT AUTO_INCREMENT PRIMARY KEY,
    lang_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE book
(
    isbn             CHAR(13) PRIMARY KEY,
    title            VARCHAR(255)   NOT NULL,
    language_id      INT,
    price            DECIMAL(10, 2) NOT NULL,
    publication_date DATE,
    FOREIGN KEY (language_id) REFERENCES language (id)
);

CREATE TABLE bookstore
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(255) NOT NULL,
    city       VARCHAR(100) NOT NULL
);