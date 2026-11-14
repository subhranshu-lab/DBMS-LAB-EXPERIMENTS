CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100),
    publication_year INT,
    total_copies INT,
    available_copies INT
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(100),
    phone VARCHAR(15),
    CONSTRAINT chk_phone CHECK (phone REGEXP '^[0-9]+$')
);

CREATE TABLE IssueReturn (
    transaction_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    issue_date DATE,
    return_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

INSERT INTO Books VALUES
(1,'Java Basics','James Gosling',2020,5,5),
(2,'Python Programming','Guido van Rossum',2021,6,6),
(3,'DBMS','Korth',2019,4,4),
(4,'C Programming','Dennis Ritchie',2018,3,3),
(5,'Operating System','Galvin',2022,5,5);

INSERT INTO Members VALUES
(101,'Rahul','Bhubaneswar','9876543210'),
(102,'Amit','Berhampur','9876543211'),
(103,'Priya','Rayagada','9876543212'),
(104,'Ravi','Gunupur','9876543213'),
(105,'Sneha','Ganjam','9876543214');

INSERT INTO IssueReturn VALUES
(1,1,101,'2026-10-01',NULL,'Issued'),
(2,2,102,'2026-10-02',NULL,'Issued'),
(3,3,103,'2026-10-03','2026-10-05','Returned'),
(4,4,104,'2026-10-04',NULL,'Issued'),
(5,5,105,'2026-10-05','2026-10-07','Returned');

SELECT * FROM Books;
SELECT * FROM Members;

SELECT Books.title, Members.name
FROM Books
JOIN IssueReturn ON Books.book_id = IssueReturn.book_id
JOIN Members ON Members.member_id = IssueReturn.member_id;

SELECT Books.title, Members.name, IssueReturn.issue_date
FROM Books
JOIN IssueReturn ON Books.book_id = IssueReturn.book_id
JOIN Members ON Members.member_id = IssueReturn.member_id;

UPDATE Books
SET available_copies = available_copies - 1
WHERE book_id = 1;

UPDATE IssueReturn
SET status = 'Returned', return_date = '2026-10-08'
WHERE transaction_id = 1;

UPDATE Books
SET total_copies = total_copies + 1,
    available_copies = available_copies + 1
WHERE book_id = 1;

ALTER TABLE Books ADD COLUMN ISBN VARCHAR(20);
ALTER TABLE Members DROP COLUMN address;

RENAME TABLE IssueReturn TO `Transaction`;

ALTER TABLE Books MODIFY title VARCHAR(100) NOT NULL;

ALTER TABLE Members
ADD CONSTRAINT chk_phone_digits
CHECK (phone REGEXP '^[0-9]+$');

SELECT Members.name, Books.title
FROM Members
INNER JOIN `Transaction`
ON Members.member_id = `Transaction`.member_id
INNER JOIN Books
ON Books.book_id = `Transaction`.book_id;

SELECT Members.name, Books.title
FROM Members
LEFT JOIN `Transaction`
ON Members.member_id = `Transaction`.member_id
LEFT JOIN Books
ON Books.book_id = `Transaction`.book_id;

SELECT SUM(total_copies) AS TotalBooks FROM Books;

SELECT MAX(publication_year) AS MaxYear,
       MIN(publication_year) AS MinYear
FROM Books;

SELECT COUNT(*) AS IssuedBooks
FROM `Transaction`
WHERE status = 'Issued';

CREATE VIEW IssuedBooksView AS
SELECT Books.title, Members.name, `Transaction`.issue_date
FROM Books
JOIN `Transaction`
ON Books.book_id = `Transaction`.book_id
JOIN Members
ON Members.member_id = `Transaction`.member_id
WHERE `Transaction`.status = 'Issued';

SELECT * FROM IssuedBooksView;

DELIMITER //

CREATE PROCEDURE GetIssuedBooks()
BEGIN
    SELECT Books.title, Members.name, `Transaction`.issue_date
    FROM Books
    JOIN `Transaction`
    ON Books.book_id = `Transaction`.book_id
    JOIN Members
    ON Members.member_id = `Transaction`.member_id
    WHERE `Transaction`.status = 'Issued';
END //

DELIMITER ;

CALL GetIssuedBooks();