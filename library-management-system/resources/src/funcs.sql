-- USE test;
CREATE FUNCTION isAvailable
(
	@book_id int
)
RETURNS VARCHAR(3)
AS
BEGIN
	DECLARE @available VARCHAR(3) = '';

	SELECT @available = 
	(
		CASE
			WHEN
				b.quantity > COUNT(r.book_id) 
			then 'yes'
			else 'no'
		END
	)
	FROM Book b
	INNER JOIN Rental r ON b.book_id = r.book_id
	WHERE b.book_id = @book_id
	GROUP BY b.quantity

	RETURN @available
END
GO
