CREATE TABLE STUDENT (
    regno VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    major VARCHAR(20) NOT NULL,
    bdate DATE
);

CREATE TABLE COURSE (
    course# INT PRIMARY KEY,
    cname VARCHAR(30) NOT NULL,
    dept VARCHAR(30) NOT NULL
);

CREATE TABLE TEXT (
    book_isbn INT PRIMARY KEY,
    booktitle VARCHAR(50) NOT NULL,
    publisher VARCHAR(50) NOT NULL,
    author VARCHAR(50) NOT NULL
);

CREATE TABLE ENROLL (
    regno VARCHAR(20),
    course# INT,
    sem INT,
    book_isbn INT,
    PRIMARY KEY (regno, course#, sem),
    FOREIGN KEY (regno) REFERENCES STUDENT(regno),
    FOREIGN KEY (course#) REFERENCES COURSE(course#),
    FOREIGN KEY (book_isbn) REFERENCES TEXT(book_isbn)
);

CREATE TABLE BOOK_ADOPTION (
    course# INT,
    sem INT,
    book_isbn INT,
    PRIMARY KEY (course#, sem, book_isbn),
    FOREIGN KEY (course#) REFERENCES COURSE(course#),
    FOREIGN KEY (book_isbn) REFERENCES TEXT(book_isbn)
);

