CREATE PROCEDURE return_book
@book_id INT,
@member_id INT

AS 
BEGIN 
DECLARE 
@available INT,
@return_date DATE,
@due_date DATE


SELECT
    @available =available
FROM
    Book
WHERE
    book_id = @book_id;

SELECT
    @return_date= return_date,@due_date=due_date
FROM
    Rental
WHERE
    book_id = @book_id;
	

IF EXISTS (SELECT * FROM Rental WHERE book_id=@book_id AND member_id=@member_id AND @return_date IS Null)		
BEGIN
	
UPDATE
    Rental
SET
    return_date = GETDATE()
WHERE
    book_id = @book_id
	AND
	member_id =@member_id
	AND @return_date IS Null;

UPDATE
    Book
SET
    available = @available  + 1
WHERE
    book_id = @book_id;

PRINT
    'Thank you for bringing back the book.'

END

ELSE
BEGIN
PRINT
    'The book you are trying to return is not currently on loan to you.Please speak to the librarian.'
END

END


SELECT * FROM Rental;
SELECT * FROM Book;

--book_id,member_id---
EXEC return_book 2,8;

