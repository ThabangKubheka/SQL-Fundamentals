--Thabang Kubheka__
use dev;

INSERT INTO Member (firstname, lastname,email_address,cellphone_number,status)
VALUES ('Claudia','Cole','cole@gmail.com','0765541167','true'),      
('Thami','Bhengu', 'ngcolosi@gmail.com','0620276778','true'),       
('Brad','Davis','davis@gmail.com','0722495064','true'),       
('Daniel','Mckee','mckee@gmail.com','0743781780','true'),     
('Sarah','Moyo','moyo@gmail.com','0836759087','true'),       
('Taylor','Hamilton','hamilton@gmail.com','0786759078','true'),   
('Emily','Jackson','jackson@gmail.com','0825825269','true'),     
('Michele','Walker','walker@gmail.com','0621233614','true'),     
('Kristin','Thomas','thomas@gmail.com','0671125590','true'),     
('Dale','Williams','williams@gmail.com','0728822546','true'); 

INSERT INTO Publisher
VALUES ('MusicRoom'),  
('Pearson'),    
('NOLO'),  
('Amazon Publishing'),  
('Kids Discover'),      
('Museum of Mordern Art'),  
('Ashmolean Museum'),     
('Taschen Books'),      
('Thomson Reuter'),    
('Chronicle Books');

INSERT INTO Author( firstname,lastname)
VALUES ('Dean', 'KoontZ'),   
('Dudu','Dube'), 
('Robert', 'Greene'),    
('Ian','Beck'), 
('Louise', 'Cooper'),  
('Nakanjani','Sibiya'),
('Anne','Rice'), 
('David','Almond'),
('Sboniso','Mbatha'),  
('Stephen','King');          

INSERT INTO Genre(name,description )
VALUES ('Thriller','exciting plot, typically involving crime or espionage'),    
('Horror','concerned with arousing feelings of fear'),      
('Adventure','exciting or daring experience'),    
('Comedy',' intended to make an audience laugh'), 
('Romance','mystery associated with love'),    
('Mystery','puzzling crime, especially a murder'),      
('Science Fiction',' based on imagined future science and technology'),      
('Western','about cowboys in western North America'),     
('Historical Fiction','related to the past events, but is fictional'),     
('Fantasy','imagining impossible or improbable things'); 




INSERT INTO Book (title,genre_id,publisher_id,publication_date ,isbn ,quantity )
VALUES ('48 Laws of Power',3,7,'1998-02-25',55734,20),   
('The Legend Of The Seeker',4,2,'1998-02-25',52234,20),
('Heaven Eyes', 1,5,'2000-09-12',88907,20),    
('Insizi Yezinsizi',10,3,'1986-12-18',73255,20),    
('The Vampire Lestat',8,4,'1985-09-25',99087,20),  
('The Heart of Dust',6,10,'2019-07-17',34523,20),   
('Hlomu: The Wife',5,1,'2005-08-19',67689,20),    
('Bengithi Lizokuna',2,8,'1999-04-9',76763,20),   
('Pastworld',7,9,'2000-05-29',55678,20),     
('The Outsider',9,6,'2004-07-05',11232,20); 


CREATE TRIGGER update_available_books 
ON Rental 
AFTER INSERT 
AS 
BEGIN 
    UPDATE Book 
    SET available = available - 1 
    FROM Book INNER JOIN inserted 
    ON Book.book_id = inserted.book_id;
END


INSERT INTO Rental(book_id,member_id,loan_date,due_date )
VALUES (5,9,'2023-02-21',DATEADD(day, 14, '2023-02-21')),      
(4,10,'2021-04-17',DATEADD(day, 14, '2021-04-17')),     
(2,8,'2019-06-21',DATEADD(day, 14, '2019-06-21')),
(7,1,'2023-01-25',DATEADD(day, 14, '2023-01-25')),     
(3,7,'2022-01-09',DATEADD(day, 14, '2022-01-09')),      
(8,2,'2023-02-18',DATEADD(day, 14, '2023-02-18')),      
(1,6,'2022-12-22',DATEADD(day, 14, '2022-12-22')),    
(9,3,'2020-09-19',DATEADD(day, 14, '2020-09-19')),    
(10,5,'2021-03-06',DATEADD(day, 14, '2021-03-06')),   
(6,4,'2021-06-28',DATEADD(day, 14, '2021-06-28'));





INSERT INTO Credit(author_id ,book_id )
VALUES (10,4),   
(1,5),      
(9,7),   
(2,6),    
(8,8),    
(7,2),   
(3,9),     
(6,3),      
(5,10),     
(4,1);

