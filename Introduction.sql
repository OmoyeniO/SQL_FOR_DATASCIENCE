DROP DATABASE PEOPLE;
DROP DATABASE FRIENDS;
SET NAMES 'utf8mb4';
DROP DATABASE FRIENDS;
drop table Ages;

CREATE DATABASE FRIENDS default character set 'utf8mb4';
CREATE TABLE Ages ( 
  name VARCHAR(128), 
  age INT
);
DELETE FROM Ages;
INSERT INTO Ages (name, age) VALUES ('Nikola', 14);
INSERT INTO Ages (name, age) VALUES ('Ida', 36);
INSERT INTO Ages (name, age) VALUES ('Nikhil', 31);
INSERT INTO Ages (name, age) VALUES ('Thrinei', 39);
INSERT INTO Ages (name, age) VALUES ('Bailey', 37);
INSERT INTO Ages (name, age) VALUES ('Aliyaan', 40);
SELECT sha1(CONCAT(name,age)) AS X FROM Ages ORDER BY X;
DROP TABLE ARTIST;
DROP TABLE ALBUM;
DROP TABLE GENRE;
DROP TABLE TRACK;

USE MUSIC;

CREATE DATABASE MUSIC DEFAULT CHARACTER SET 'utf8mb4';
CREATE TABLE ARTIST(
artist_ID INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255),
PRIMARY KEY(artist_ID)
);

CREATE TABLE ALBUM(
album_ID INT NOT NULL AUTO_INCREMENT,
title VARCHAR(255),
artist_ID INT,
PRIMARY KEY (album_ID),
INDEX(title),

CONSTRAINT FOREIGN KEY(artist_ID)
REFERENCES ARTIST (artist_ID)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE GENRE(
genre_ID INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255),
PRIMARY KEY(genre_ID),
INDEX (name)
);

CREATE TABLE TRACK(
track_ID INT NOT NULL AUTO_INCREMENT,
title VARCHAR (255),
len INT,
rating INT,
count INT,
album_ID INT,
genre_ID INT,
PRIMARY KEY(track_ID),
INDEX (title),

CONSTRAINT FOREIGN KEY (album_ID) 
REFERENCES ALBUM (album_ID)
ON DELETE CASCADE ON UPDATE CASCADE,

CONSTRAINT FOREIGN KEY (genre_ID) 
REFERENCES GENRE (genre_ID)
ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO ARTIST (name) VALUES ('Davido');
INSERT INTO ARTIST (name) VALUES ('Wizkid');
INSERT INTO ARTIST (name) VALUES ('Tiwa Savage');

SELECT * FROM ARTIST;

INSERT INTO GENRE (name) VALUES ('Afro beats');
INSERT INTO GENRE (name) VALUES ('Afro Pop');
INSERT INTO GENRE (name) VALUES ('Pop');

SELECT * FROM GENRE;


INSERT INTO ALBUM (title, artist_ID) VALUES ('A Good Time', 1);
INSERT INTO ALBUM (title, artist_ID) VALUES ('Ojuelegba', 2);
INSERT INTO ALBUM (title, artist_ID) VALUES ('24', 3);
INSERT INTO ALBUM (title, artist_ID) VALUES ('A Better Time', 1);
INSERT INTO ALBUM (title, artist_ID) VALUES ('49-99', 3);

SELECT * FROM ALBUM;


INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('Intro', 194, 4, 0, 1, 1);
INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('IF', 215, 5, 0, 1, 3);
INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('Risky', 258, 5, 0, 1, 2); 
INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('Fall', 240, 5, 0, 1, 1);
INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('Kind Love', 211, 5, 0, 2, 1);
INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('Ki lo fe', 156, 4, 0, 2, 3);
INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('Omalicha', 201, 5, 0, 2, 1);
INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('Bombay', 191, 4, 0, 2, 1);
INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('Koroba', 199, 5, 0, 3, 2);
INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('Ole', 205, 5, 0, 3, 2);
INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('Temptation', 169, 5, 0, 3, 3);
INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('FWMM', 212, 5, 0, 3, 1);
INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('FEM', 193, 5, 0, 4, 2);
INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('Jowo', 180, 5, 0, 4, 1);
INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('Heaven', 216, 5, 0, 4, 1);
INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('Special', 197, 4, 0, 4, 3);
INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('Wanted', 164, 5, 0, 5, 2);
INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('Ileke', 174, 5, 0, 5, 2);
INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('Folarin', 184, 5, 0, 5, 2);
INSERT INTO TRACK (title, len, rating, count, album_ID, genre_ID) VALUES('Olorun mi', 196, 5, 0, 5, 2);


SELECT * FROM TRACK;

SELECT TRACK.title, ARTIST.name, ALBUM.title, GENRE.name FROM TRACK JOIN GENRE JOIN ARTIST JOIN ALBUM ON TRACK.genre_ID = GENRE.genre_ID and TRACK.album_ID= ALBUM.album_ID and ARTIST.artist_ID= ALBUM.artist_ID 
ORDER BY ALBUM.title;

#CREATE TABLE FULL_TRACK AS 
#SELECT TRACK.title, ARTIST.name, ALBUM.title, GENRE.name FROM TRACK JOIN GENRE JOIN ARTIST JOIN ALBUM ON TRACK.genre_ID = GENRE.genre_ID and TRACK.album_ID= ALBUM.album_ID and ARTIST.artist_ID= ALBUM.artist_ID ;


SELECT DISTINCT GENRE.name, ARTIST.name FROM TRACK JOIN GENRE JOIN ARTIST JOIN ALBUM ON TRACK.genre_ID = GENRE.genre_ID and TRACK.album_ID = ALBUM.album_ID and ALBUM.artist_ID = ARTIST.artist_ID 
WHERE artist.name = 'Davido';

CREATE DATABASE SAMPLE DEFAULT CHARACTER SET 'UTF8MB4';
CREATE TABLE ACCOUNT(
account_ID INT NOT NULL auto_increment,
email VARCHAR(128) UNIQUE,
name VARCHAR(128),
PRIMARY KEY (account_ID)
);

CREATE TABLE COURSE(
course_ID INT NOT NULL AUTO_INCREMENT,
title VARCHAR(128) UNIQUE,
PRIMARY KEY (course_ID)
);

CREATE TABLE MEMBER(
account_ID INT,
course_ID INT,
role INT,

CONSTRAINT FOREIGN KEY (account_ID) REFERENCES ACCOUNT (account_ID) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FOREIGN KEY (course_ID) REFERENCES COURSE (course_ID) ON DELETE CASCADE ON UPDATE CASCADE,

PRIMARY KEY (account_ID,course_ID)
);

INSERT INTO ACCOUNT (name, email) VALUES('Olaomopo Bandele','olaomopo@icloud.com');
INSERT INTO ACCOUNT (name, email) VALUES('Monsurat Solape','monsu@icloud.com');
INSERT INTO ACCOUNT (name, email) VALUES('Emem Steve','emem@icloud.com');
INSERT INTO ACCOUNT (name, email) VALUES('Halima Sadiyat','halima@icloud.com');
INSERT INTO ACCOUNT (name, email) VALUES('Princess Kossy','kossy@icloud.com');

SELECT * FROM ACCOUNT;

INSERT INTO COURSE (title) VALUES('Math');
INSERT INTO COURSE (title) VALUES('English');
INSERT INTO COURSE (title) VALUES('Physics');
INSERT INTO COURSE (title) VALUES('Biology');

SELECT * FROM COURSE;

INSERT INTO MEMBER (account_ID, course_ID, role) VALUES(1,1,1);
INSERT INTO MEMBER (account_ID, course_ID, role) VALUES(5,1,0);
INSERT INTO MEMBER (account_ID, course_ID, role) VALUES(3,1,0);

INSERT INTO MEMBER (account_ID, course_ID, role) VALUES(3,2,1);
INSERT INTO MEMBER (account_ID, course_ID, role) VALUES(1,2,1);
INSERT INTO MEMBER (account_ID, course_ID, role) VALUES(2,2,0);
INSERT INTO MEMBER (account_ID, course_ID, role) VALUES(5,2,0);
INSERT INTO MEMBER (account_ID, course_ID, role) VALUES(4,2,0);

INSERT INTO MEMBER (account_ID, course_ID, role) VALUES(2,4,0);
INSERT INTO MEMBER (account_ID, course_ID, role) VALUES(5,4,1);
INSERT INTO MEMBER (account_ID, course_ID, role) VALUES(1,4,0);
INSERT INTO MEMBER (account_ID, course_ID, role) VALUES(3,4,0);

INSERT INTO MEMBER (account_ID, course_ID, role) VALUES(5,3,0);
INSERT INTO MEMBER (account_ID, course_ID, role) VALUES(3,3,1);

SELECT * FROM MEMBER;

SELECT account.name, course.title, member.role FROM MEMBER JOIN ACCOUNT JOIN COURSE ON ACCOUNT.account_ID = MEMBER.account_ID AND MEMBER.course_ID = COURSE.course_ID  ORDER BY ACCOUNT.name, COURSE.title, MEMBER.role DESC;

CREATE DATABASE ROSTER DEFAULT CHARACTER SET 'UTF8MB4';
USE ROSTER;
CREATE TABLE `User` (
    user_id     INTEGER NOT NULL AUTO_INCREMENT,
    name        VARCHAR(128) UNIQUE,
    PRIMARY KEY(user_id)
    );
    
    CREATE TABLE Course (
    course_id     INTEGER NOT NULL AUTO_INCREMENT,
    title         VARCHAR(128) UNIQUE,
    PRIMARY KEY(course_id)
    );
    
    CREATE TABLE Member (
    user_id       INTEGER,
    course_id     INTEGER,
    role          INTEGER,

    CONSTRAINT FOREIGN KEY (user_id) REFERENCES `User` (user_id)
      ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (course_id) REFERENCES Course (course_id)
       ON DELETE CASCADE ON UPDATE CASCADE,

    PRIMARY KEY (user_id, course_id)
    );
    
    INSERT INTO `User` (name) VALUES ('Daragh');
    INSERT INTO `User` (name) VALUES ('Becca');
    INSERT INTO `User` (name) VALUES ('Rhoridh');
    INSERT INTO `User` (name) VALUES ('Toni');
    INSERT INTO `User` (name) VALUES ('Zuzanna');
    INSERT INTO `User` (name) VALUES ('Faria');
    INSERT INTO `User` (name) VALUES ('Catherine');
    INSERT INTO `User` (name) VALUES ('Lenyn');
    INSERT INTO `User` (name) VALUES ('Vicki');
    INSERT INTO `User` (name) VALUES ('Zeid');
    INSERT INTO `User` (name) VALUES ('Aamanee');
    INSERT INTO `User` (name) VALUES ('Caisey');
    INSERT INTO `User` (name) VALUES ('Linden');
    INSERT INTO `User` (name) VALUES ('Raigen');
    INSERT INTO `User` (name) VALUES ('VJay');
    
    SELECT * FROM `User`;
    
    INSERT INTO Course(title) VALUES ('si106');
    INSERT INTO Course(title) VALUES ('si110');
    INSERT INTO Course(title) VALUES ('si206');
    
    SELECT * FROM Course;
    
    INSERT INTO Member (user_id, course_id, role ) VALUES (1,1,1);
    INSERT INTO Member (user_id, course_id, role ) VALUES (2,1,0);
    INSERT INTO Member (user_id, course_id, role ) VALUES (3,1,0);
    INSERT INTO Member (user_id, course_id, role ) VALUES (4,1,0);
    INSERT INTO Member (user_id, course_id, role ) VALUES (5,1,0);
    
    INSERT INTO Member (user_id, course_id, role ) VALUES (6,2,1);
    INSERT INTO Member (user_id, course_id, role ) VALUES (7,2,0);
    INSERT INTO Member (user_id, course_id, role ) VALUES (8,2,0);
    INSERT INTO Member (user_id, course_id, role ) VALUES (9,2,0);
    INSERT INTO Member (user_id, course_id, role ) VALUES (10,2,0);
    
    INSERT INTO Member (user_id, course_id, role ) VALUES (11,3,1);
    INSERT INTO Member (user_id, course_id, role ) VALUES (12,3,0);
    INSERT INTO Member (user_id, course_id, role ) VALUES (13,3,0);
    INSERT INTO Member (user_id, course_id, role ) VALUES (14,3,0);
    INSERT INTO Member (user_id, course_id, role ) VALUES (15,3,0);
    
    SELECT `User`.name,Course.title, Member.role FROM Member JOIN `User` JOIN Course ON `User`.user_id= Member.user_id AND Course.course_id= Member.course_id ORDER BY Course.title, Member.role DESC, `User`.name


