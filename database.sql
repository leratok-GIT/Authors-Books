-- Creating tables
CREATE TABLE Author(
    AuthorID int IDENTITY(20,1) PRIMARY KEY,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50),
    Nationality VARCHAR(55) NOT NULL CHECK (Nationality IN ('Nigerian', 'South Africa', 'USA', 'Japanese', 'British'))
);

CREATE TABLE Books(
    BooksID int IDENTITY(1,1) PRIMARY KEY,
    BookTitle varchar(45),
    Author varchar(45),
    Descri_ption Varchar(205),
    AuthorID int,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);

-- inserting data in the table
INSERT INTO Author(FirstName, LastName, Nationality) VALUES
('Haruki', 'Murakami', 'Japanese'),
('Gabriel García', 'Márquez', 'Nigerian'),
('George', 'Orwell', 'South Africa'),
('Chimamanda Ngozi', 'Adichie', 'British'),
('J.K.', 'Rowling', 'Nigerian'),
('Khaled', 'Hosseini', 'USA');

INSERT INTO Books (BookTitle, Author, Descri_ption, AuthorID)
VALUES 
('Norwegian Wood', 'Haruki Murakami', 'A nostalgic story of loss and burgeoning sexuality set in 1960s Tokyo, following the life of Toru Watanabe as he navigates love and heartbreak.', 20),
('One Hundred Years of Solitude', 'Gabriel García Márquez','A landmark novel in magical realism, it chronicles the multi-generational story of the Buendía family in the fictional town of Macondo.', 21),
('Half of a Yellow Sun', 'Chimamanda Ngozi Adichie', 'This novel provides a powerful depiction of the Nigerian Civil War through the experiences of various characters, exploring themes of love, loss, and the impact of conflict.', 22),
('Harry Potter and the Philosopher’s Stone', 'J.K. Rowling', 'The first book in the Harry Potter series, introducing readers to the young wizard Harry Potter and his adventures at Hogwarts School of Witchcraft and Wizardry.', 24),
('Things Fall Apart', 'J.K. Rowling', 'A classic novel that explores the life of Okonkwo, a leader and local wrestling champion in a fictional Nigerian village, and the impact of British colonialism and Christian missionaries on his community.', 24),
('1984','George Orwell', 'A dystopian novel set in a totalitarian society under constant surveillance, exploring themes of government control, propaganda, and individualism.', 22),
('The Kite Runner', 'Khaled Hosseini', 'A moving story of friendship and redemption set against the backdrop of a changing Afghanistan, focusing on the relationship between Amir and Hassan.', 22),
('The Handmaid’s Tale', 'Gabriel García Márquez', 'A dystopian novel set in a theocratic society where women are subjugated, exploring themes of power, control, and resistance.', 21),
('The Alchemist', 'George Orwell', 'philosophical novel about a young shepherd named Santiago who embarks on a journey to find a hidden treasure, learning about the importance of following one’s dreams.', 23),
('The House of the Spirits', 'George Orwell', 'A family saga that blends magical realism with historical events in Chile, following the lives of the Trueba family over several generations.', 23)

-- showing the tables
SELECT * 
FROM Author

SELECT * 
FROM Books

--how many books intotal
SELECT count(*) AS Total_Books
FROM Books

--which author has the most books 
SELECT TOP 1
    a.AuthorID, 
    a.FirstName, 
    a.LastName, 
    COUNT(b.BooksID) AS BookCount
FROM 
    Author a
JOIN 
    Books b ON a.AuthorID = b.AuthorID
GROUP BY 
    a.AuthorID, a.FirstName, a.LastName
ORDER BY 
    BookCount DESC;
    
--how many books there are according to nationality 
SELECT 
    a.nationality,
    COUNT(b.BooksID) AS numberOfBooks
FROM
  Author a
JOIN
  Books b ON b.AuthorID = a.AuthorID
GROUP BY
  a.nationality;



    


