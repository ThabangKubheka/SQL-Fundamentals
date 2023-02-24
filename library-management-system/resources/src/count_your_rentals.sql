--Thabang Kubheka--
--USE GRAD;

CREATE PROCEDURE count_your_rentals(@member_id INT)
AS
BEGIN
DECLARE 
@num INT

SET

@num = (SELECT Count(Book.book_id)
FROM Member
INNER JOIN Rental ON Member.member_id = Rental.member_id
INNER JOIN Book ON Rental.book_id = Book.book_id
WHERE Member.member_id= @member_id)

PRINT 'You have: '+ CAST(@num AS VARCHAR) +' rentals'

END

SELECT * FROM Member;

EXEC count_your_rentals 10;


