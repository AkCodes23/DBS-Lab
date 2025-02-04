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

INSERT INTO COURSE VALUES(101, 'Data Structures', 'CS');
INSERT INTO COURSE VALUES(102, 'Digital Circuits', 'CC');
INSERT INTO COURSE VALUES(103, 'Thermodynamics', 'ME');
INSERT INTO COURSE VALUES(104, 'Structural Analysis', 'CE');
INSERT INTO COURSE VALUES(105, 'Operating Systems', 'CS');

INSERT INTO TEXT VALUES(1001, 'Data Structures Using C', 'Pearson', 'RCCma Thareja');
INSERT INTO TEXT VALUES(1002, 'Digital Design', 'McGraw Hill', 'M. Morris Mano');
INSERT INTO TEXT VALUES(1003, 'Thermodynamics', 'Wiley', 'Yunus A. Cengel');
INSERT INTO TEXT VALUES(1004, 'Structural Analysis', 'McGraw Hill', 'R.C. Hibbeler');
INSERT INTO TEXT VALUES(1005, 'Operating System Concepts', 'Wiley', 'Abraham Silberschatz');

INSERT INTO BOOK_ADOPTION VALUES(101, 1, 1001);
INSERT INTO BOOK_ADOPTION VALUES(101, 1, 1005);
INSERT INTO BOOK_ADOPTION VALUES(102, 1, 1002);
INSERT INTO BOOK_ADOPTION VALUES(103, 1, 1003);
INSERT INTO BOOK_ADOPTION VALUES(104, 1, 1004);

INSERT INTO ENROLL VALUES('23095', 101, 1, 1001);
INSERT INTO ENROLL VALUES('23096', 102, 1, 1002);
INSERT INTO ENROLL VALUES('23097', 103, 1, 1003);
INSERT INTO ENROLL VALUES('23098', 104, 1, 1004);
INSERT INTO ENROLL VALUES('23099', 105, 1, 1005);

--A)
SELECT course# 
FROM BOOK_ADOPTION 
GROUP BY course# 
HAVING COUNT(book_isbn) > 1;

--B)
SELECT c.dept
FROM COURSE c
WHERE NOT EXISTS (
  SELECT *
  FROM BOOK_ADOPTION ba
  JOIN TEXT t ON ba.book_isbn = t.book_isbn
  WHERE c.course# = ba.course#
  AND t.publisher = 'Pearson');

--C)
SELECT e.regno
FROM ENROLL e, COURSE c
WHERE e.course# = c.course#
GROUP BY e.regno
HAVING COUNT(DISTINCT c.dept) > 1;

--D)
SELECT s.name
FROM STUDENT s
WHERE s.regno NOT IN (
  SELECT e.regno
  FROM ENROLL e
);

--E)
E)
SELECT c.dept
FROM COURSE c
WHERE NOT EXISTS (
  SELECT 1
  FROM BOOK_ADOPTION ba, TEXT t
  WHERE c.course# = ba.course#
    AND ba.book_isbn = t.book_isbn
    AND t.publisher <> 'Pearson');

--F)
SELECT t.booktitle
FROM TEXT t
WHERE EXISTS (
  SELECT *
  FROM BOOK_ADOPTION ba
  WHERE t.book_isbn = ba.book_isbn
)
AND EXISTS (
  SELECT *
  FROM ENROLL e
  WHERE t.book_isbn = e.book_isbn
);

--G)
SELECT ba.course#
FROM BOOK_ADOPTION ba
JOIN TEXT t ON ba.book_isbn = t.book_isbn
WHERE t.publisher = 'Pearson'
GROUP BY ba.course#
HAVING COUNT(t.book_isbn) >= 2;

--H)
SELECT e.regno
FROM ENROLL e
GROUP BY e.regno
HAVING COUNT(e.book_isbn) = (
  SELECT MAX(book_count)
  FROM (
    SELECT COUNT(book_isbn) AS book_count
    FROM ENROLL
    GROUP BY regno
  )
);
