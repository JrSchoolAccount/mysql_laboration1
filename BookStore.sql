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

CREATE TABLE inventory
(
    store_id INT,
    isbn     CHAR(13),
    amount   INT DEFAULT 0,
    PRIMARY KEY (store_id, isbn),
    FOREIGN KEY (store_id) REFERENCES bookstore (id),
    FOREIGN KEY (isbn) REFERENCES book (isbn)
);

INSERT INTO author (first_name, last_name, birth_date)
VALUES ('John', 'Wick', '1964-09-12'),
       ('Jane', 'Fonda', '1980-12-21');

INSERT INTO language (lang_name)
VALUES ('English'),
       ('Swedish'),
       ('Danish');

INSERT INTO book (isbn, title, language_id, price, publication_date)
VALUES ('9780134685991', 'Effective Java', 1, 45.00, '2018-01-11'),
       ('9780201633610', 'Design Patterns', 1, 50.00, '1994-02-21'),
       ('9780195111203', 'The Catcher in the Rye', 2, 30.00, '1951-07-16');

INSERT INTO bookstore (store_name, city)
VALUES ('Book World', 'Stockholm'),
       ('Reading Corner', 'Gothenburg');

INSERT INTO inventory (store_id, isbn, amount)
VALUES (1, '9780134685991', 10),
       (1, '9780201633610', 5),
       (2, '9780195111203', 3);