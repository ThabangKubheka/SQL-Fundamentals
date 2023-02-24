CREATE PROCEDURE checkout_books
@book_id INT,
@member_id INT

AS 
BEGIN 
DECLARE 
@available INT,
@loan_date DATE,
@return_date DATE



SELECT
	@return_date = return_date	
FROM
    Rental
WHERE
    member_id = @member_id;

SELECT
    @available = available
FROM
    Book
WHERE
    book_id = @book_id;

	SET
	@loan_date =GETDATE()

		

IF (@available > 0) AND (@return_date IS NOT NULL)

BEGIN
INSERT INTO
    Rental (book_id, member_id, loan_date, due_date)
VALUES
    (
        @book_id,
        @member_id,
        @loan_date,
        DATEADD(DAY,15,@loan_date)
    );
	
UPDATE
    Book
SET
    available = @available  - 1
WHERE
    book_id = @book_id;

PRINT
    'You checkout is successful.'

END

ELSE
BEGIN
PRINT
    'The book you are trying to checkout is not currently available.'
END

END


--book_id,member_id
EXEC checkout_books 2,7

select * from Rental;
select * from Book;
select * from Member;


SELECT
	 return_date	
FROM
    Rental
WHERE
    return_date IS NOT NULL;