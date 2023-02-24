--Thabang Kubheka--

CREATE DATABASE dev;

use dev;


CREATE TABLE Author(
author_id int UNIQUE IDENTITY(1,1) NOT NULL,
firstname varchar(50) NOT NULL,
lastname varchar(50) NOT NULL,
);


CREATE TABLE Publisher(
publisher_id int UNIQUE IDENTITY (1,1) NOT NULL,
name varchar(50) NOT NULL
);

CREATE TABLE Book(
book_id int UNIQUE IDENTITY (1,1) NOT NULL,
title varchar(50) NOT NULL,
genre_id int NOT NULL,
publisher_id int NOT NULL,
publication_date date NOT NULL,
isbn int NOT NULL,
quantity int NOT NULL,
available int DEFAULT 20,
);

CREATE TABLE Member(
member_id int UNIQUE IDENTITY(1,1) NOT NULL,
firstname varchar(50) NOT NULL,
lastname varchar(50) NOT NULL,
email_address varchar(64) NOT NULL,
cellphone_number char(10) NOT NULL,
status bit NOT NULL
);


CREATE TABLE Genre (
genre_id int UNIQUE IDENTITY (1,1) NOT NULL,
name varchar(50) NOT NULL,
description varchar(150)
);


CREATE TABLE Credit(
author_id int NOT NULL,
book_id int NOT NULL,
);

CREATE TABLE Rental(
rental_id int UNIQUE IDENTITY (1,1) NOT NULL,
book_id int NOT NULL,
member_id int NOT NULL, 
loan_date date NOT NULL,
due_date date NOT Null,
return_date date
);


-- Rental --
ALTER TABLE Rental
ADD CONSTRAINT fk_book_id_rental FOREIGN KEY (book_id) REFERENCES Book (book_id);
ALTER TABLE Rental
ADD CONSTRAINT fk_member_id_rental FOREIGN KEY (member_id) REFERENCES Member(member_id);
--

-- Book --
ALTER TABLE Book
ADD CONSTRAINT fk_publisher_id_book FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id);

ALTER TABLE Book
ADD CONSTRAINT fk_genre_id_book FOREIGN KEY (genre_id) REFERENCES Genre(genre_id);
--


-- Credits --
ALTER TABLE Credit
ADD CONSTRAINT fk_author_id_credit FOREIGN KEY (author_id) REFERENCES Author(author_id);

ALTER TABLE Credit
ADD CONSTRAINT fk_book_id_credit FOREIGN KEY (book_id) REFERENCES Book(book_id);



