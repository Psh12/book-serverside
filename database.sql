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

Create table Authors(
    author_id uuid DEFAULT uuid_generate_v4() NOT NULL,
    author_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(author_id)
);

Create table Book_Authors(
    ba_id uuid DEFAULT uuid_generate_v4() NOT NULL,
    author_id uuid,
    book_number isbn13,
    PRIMARY KEY (author_id, book_number),
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (book_number) REFERENCES books(book_number)
);

INSERT INTO users(user_name, user_email, user_password) VALUES ('Henry', 'Henry1@gmail.com','Thegoat');

/* Book table insert Queries*/
INSERT INTO books(book_number, title, link, synopsis,genre, demographic) VALUES ('978-0-192-81591-0','Oliver Twist','https://images-na.ssl-images-amazon.com/images/I/41CMO-Uh7mS._SX322_BO1,204,203,200_.jpg',
E'His mother is dead\, so little Oliver Twist is brought up in the workhouse. Beaten and starved, he runs away to London, where he joins Fagin\'s gang of thieves. By chance he also finds good new friends--but can they protect him from people who rob and murder without mercy?','Historical Fiction','Adult');


/* user_book Insert Queries*/
INSERT INTO user_book(book_number, user_id) VALUES ('978-0-545-21578-7', '679c30bf-57fb-412f-8676-bde171185e77');
INSERT INTO user_book(book_number, user_id) VALUES ('978-0-547-92822-7', '679c30bf-57fb-412f-8676-bde171185e77');

/* Query to retrieve the books data for specific users based on user_id */
select books.book_number, books.title, books.link, books.synopsis from books inner join (select book_number from user_books where user_id = '679c30bf-57fb-412f-8676-bde171185e77') n1 on books.book_number = n1.book_number;