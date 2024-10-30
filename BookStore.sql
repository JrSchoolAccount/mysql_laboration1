--
-- Drop database if it exists
-- Create a new database
-- with tables, sample data and users
--
DROP DATABASE IF EXISTS bookstore;
CREATE DATABASE bookstore;
USE bookstore;

CREATE TABLE author
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
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
    title            VARCHAR(100)   NOT NULL,
    language_id      INT,
    price            DECIMAL(10, 2) NOT NULL,
    publication_date DATE,
    author_id INT,
    FOREIGN KEY (language_id) REFERENCES language (id),
    FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE bookstore
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(50) NOT NULL,
    city       VARCHAR(50) NOT NULL
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
       ('Jane', 'Fonda', '1937-12-21');

INSERT INTO language (lang_name)
VALUES ('English'),
       ('Swedish'),
       ('Danish');

INSERT INTO book (isbn, title, language_id, price, publication_date, author_id)
VALUES ('9780134685991', 'Effective Java', 1, 45.00, '2018-01-11', 1),
       ('9780201633610', 'Design Patterns', 1, 50.00, '1994-02-21', 1),
       ('9780195111203', 'The Catcher in the Rye', 2, 30.00, '1951-07-16', 2);

INSERT INTO bookstore (store_name, city)
VALUES ('Book World', 'Stockholm'),
       ('Reading Corner', 'Gothenburg');

INSERT INTO inventory (store_id, isbn, amount)
VALUES (1, '9780134685991', 10),
       (1, '9780201633610', 5),
       (2, '9780195111203', 3);

CREATE VIEW total_author_book_value AS
SELECT CONCAT(a.first_name, ' ', a.last_name)       AS name,
       TIMESTAMPDIFF(YEAR, a.birth_date, CURDATE()) AS age,
       COUNT(DISTINCT b.isbn)                       AS book_title_count,
       CONCAT(SUM(b.price * i.amount), ' kr')       AS inventory_value
FROM author a
         JOIN
     book b ON a.id = b.author_id
         JOIN
     inventory i ON b.isbn = i.isbn
GROUP BY a.id;

CREATE USER 'dev'@'localhost' IDENTIFIED BY 'devPassword';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER
    ON bookstore.*
    TO 'dev'@'localhost';
REVOKE CREATE USER, DROP, GRANT OPTION ON *.* FROM 'dev'@'localhost';

CREATE USER 'web'@'localhost' IDENTIFIED BY 'webPassword';
GRANT SELECT, INSERT, UPDATE, DELETE
    ON bookstore.*
    TO 'web'@'localhost';
REVOKE CREATE, DROP, CREATE USER, GRANT OPTION ON *.* FROM 'web'@'localhost';