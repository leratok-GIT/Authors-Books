# Authors-Books Database Project
Creating a database of books and authors, managing a library involves handling a substantial amount of information. This project involves creating and managing a database of authors and their books using SQL. The database includes tables for authors and books, with relevant relationships and constraints.

## Table of Contents

- [Overview](#overview)
- [Schema](#schema)
- [Sample Data](#sample-data)
- [Queries](#queries)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Overview

The database consists of two main tables:
- `Author`: Stores information about authors.
- `Books`: Stores information about books, with a foreign key linking each book to an author.

The project includes sample data insertion and useful queries to interact with the data.

## Schema

### Author Table

```sql
CREATE TABLE Author(
    AuthorID int IDENTITY(20,1) PRIMARY KEY,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50),
    Nationality VARCHAR(55) NOT NULL CHECK (Nationality IN ('Nigerian', 'South African', 'USA', 'Japanese', 'British'))
);
```

### Books Table
```sql
CREATE TABLE Books(
    BooksID int IDENTITY(1,1) PRIMARY KEY,
    BookTitle varchar(45),
    Descri_ption Varchar(205),
    AuthorID int,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);
```
## Sample Data
### insert Author
```sql
INSERT INTO Author (FirstName, LastName, Nationality) VALUES
('Haruki', 'Murakami', 'Japanese'),
('Gabriel García', 'Márquez', 'Nigerian'),
('George', 'Orwell', 'South African'),
('Chimamanda Ngozi', 'Adichie', 'British'),
('J.K.', 'Rowling', 'Nigerian'),
('Khaled', 'Hosseini', 'USA');
```
### Insert Books
```sql
INSERT INTO Books (BookTitle, Descri_ption, AuthorID) VALUES 
('Norwegian Wood', 'A nostalgic story of loss and burgeoning sexuality set in 1960s Tokyo, following the life of Toru Watanabe as he navigates love and heartbreak.', 20),
('One Hundred Years of Solitude', 'A landmark novel in magical realism, it chronicles the multi-generational story of the Buendía family in the fictional town of Macondo.', 21),
('Half of a Yellow Sun', 'This novel provides a powerful depiction of the Nigerian Civil War through the experiences of various characters, exploring themes of love, loss, and the impact of conflict.', 22),
('Harry Potter and the Philosopher’s Stone', 'The first book in the Harry Potter series, introducing readers to the young wizard Harry Potter and his adventures at Hogwarts School of Witchcraft and Wizardry.', 24),
('Things Fall Apart', 'A classic novel that explores the life of Okonkwo, a leader and local wrestling champion in a fictional Nigerian village, and the impact of British colonialism and Christian missionaries on his community.', 24),
('1984', 'A dystopian novel set in a totalitarian society under constant surveillance, exploring themes of government control, propaganda, and individualism.', 22),
('The Kite Runner', 'A moving story of friendship and redemption set against the backdrop of a changing Afghanistan, focusing on the relationship between Amir and Hassan.', 22),
('The Handmaid’s Tale', 'A dystopian novel set in a theocratic society where women are subjugated, exploring themes of power, control, and resistance.', 21),
('The Alchemist', 'A philosophical novel about a young shepherd named Santiago who embarks on a journey to find a hidden treasure, learning about the importance of following one’s dreams.', 23),
('The House of the Spirits', 'A family saga that blends magical realism with historical events in Chile, following the lives of the Trueba family over several generations.', 23);
```
## Queries
### Author with the most books
```sql
SELECT 
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
    BookCount DESC
LIMIT 1;
```
### Number of Books by Nationality
```sql
SELECT 
    a.Nationality, 
    COUNT(b.BooksID) AS BookCount
FROM 
    Author a
JOIN 
    Books b ON a.AuthorID = b.AuthorID
GROUP BY 
    a.Nationality
ORDER BY 
    BookCount ASC;
```
## Usage
1. Copy the schema creation statements and execute them in your SQL environment.
2. Insert the sample data into the Author and Books tables.
3. Run the provided queries to interact with the data.
You can use an online SQL compiler like OneCompiler to execute these SQL commands.

## Online Database
if you want to see the database go to the link below for the online compiler:<br>
 click here - https://onecompiler.com/sqlserver/42neyrjfe

## Contributing
If you would like to contribute to this project, please fork the repository and create a feature branch. Pull requests are welcome.

1. Fork the repository.
2. Create a feature branch (git checkout -b feature/AmazingFeature).
3. Commit your changes (git commit -m 'Add some AmazingFeature').
4. Push to the branch (git push origin feature/AmazingFeature).
5. Open a pull request.
   
## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Contact
Lerato Kgwedi - kgwdilerato@outlook.com







