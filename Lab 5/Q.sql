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

INSERT INTO STUDENT VALUES('23095', 'Ak', 'CS',TO_DATE('2005-09-23','YYYY-MM-DD'));
INSERT INTO STUDENT VALUES('23096', 'Bhavya', 'CC', TO_DATE('2001-02-20','YYYY-MM-DD'));
INSERT INTO STUDENT VALUES('23097', 'Lukke', 'ME',TO_DATE('2002-03-25','YYYY-MM-DD'));
INSERT INTO STUDENT VALUES('23098', 'suraj', 'CE',TO_DATE('2000-04-30','YYYY-MM-DD'));
INSERT INTO STUDENT VALUES('23099', 'palindrome', 'CS',TO_DATE('2001-05-05','YYYY-MM-DD'));
