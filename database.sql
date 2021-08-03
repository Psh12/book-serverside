Create table Users(
    user_id uuid PRIMARY KEY DEFAULT
    uuid_generate_v4(),
    user_name VARCHAR(255) NOT NULL,
    user_email VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL
);

Create table Genres(
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL
);

Create table Books(
    book_number isbn13 PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    link VARCHAR(255) NOT NULL,
    synopsis VARCHAR(500) NOT NULL,
);

Create table user_book(
    ub_id uuid DEFAULT uuid_generate_v4() NOT NULL,
    book_number isbn13,
    user_id uuid,
    PRIMARY KEY(book_number, user_id),
    FOREIGN KEY (book_number) REFERENCES books(book_number),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

Create table Author(
    author_id uuid DEFAULT uuid_generate_v4(),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255)
    PRIMARY KEY(author_id),
);

INSERT INTO users(user_name, user_email, user_password) VALUES ('Henry', 'Henry1@gmail.com','Thegoat');

/* Book table insert Queries*/
INSERT INTO books(book_number, title, link, synopsis, demographic) VALUES ('978-1535534666','A Study in Scarlet','https://coverart.oclc.org/ImageWebSvc/oclc/+-+380259254_140.jpg?SearchOrder=+-+OT,OS,TN,GO,FA',
'A Study in Scarlet" is the first published story of one of the most famous literary detectives of all time, Sherlock Holmes. Here Dr. Watson, who has just returned from a war in Afghanistan, meets Sherlock Holmes for the first time when they become flat-mates at the famous 221 B Baker Street', 'Mystery');


/* user_book Insert Queries*/
INSERT INTO user_book(book_number, user_id) VALUES ('978-0-545-21578-7', '679c30bf-57fb-412f-8676-bde171185e77');
INSERT INTO user_book(book_number, user_id) VALUES ('978-0-547-92822-7', '679c30bf-57fb-412f-8676-bde171185e77');

/* Query to retrieve the books data for specific users based on user_id */
select books.book_number, books.title, books.link, books.synopsis from books inner join (select book_number from user_books where user_id = '679c30bf-57fb-412f-8676-bde171185e77') n1 on books.book_number = n1.book_number;