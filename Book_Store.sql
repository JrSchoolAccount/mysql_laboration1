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

CREATE TABLE language (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          lang_name VARCHAR(50) UNIQUE NOT NULL
);