--Виконати нормалізацію універсального відношення, розбивши його на кілька таблиць. 

--1 create main table
CREATE TABLE BOOKS_2 SELECT BOOKS.N, BOOKS.`Код`, BOOKS.`Новинка`, BOOKS.`Название`, BOOKS.`Цена` FROM BOOKS
ALTER TABLE BOOKS_2 ADD PRIMARY KEY (N)

--2.1 create category table
CREATE TABLE Categories (
c_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
Category varchar(20)
)
INSERT INTO Categories(Category) SELECT DISTINCT BOOKS.`Категория` FROM BOOKS
--Repeat 2.1 to create Publishers, Themes Tables

--3 create table books_cpt(this table will hold book number and corresponding catgory id..._
CREATE TABLE BOOKS_CPT (
N int NOT NULL PRIMARY KEY
cat_id int,
pub_id int,
theme_id int
)

ALTER TABLE BOOKS_CPT ADD FOREIGN KEY(N) REFERENCES BOOKS_2(N) ON DELETE CASCADE --applying CASCADE allows automated deletion

UPDATE TABLE BOOKS_CPT 
SET cat_id = (SELECT Categories.c_id FROM Categories WHERE Categories.Category = BOOKS.`Категория`)
--repeat for pub_id, theme_id

--4 create table BOOKS_Physic_data
CREATE TABLE BOOKS_Physic_data SELECT BOOKS.N, BOOKS.`Страницы`, BOOKS.`Формат`, BOOKS.`Дата`, BOOKS.`Тираж` FROM BOOKS
ALTER TABLE BOOKS_Physic_data ADD PRIMARY KEY(N)
ALTER TABLE BOOKS_Physic_data ADD FOREIGN KEY(N) REFERENCES BOOKS_2(N) ON DELETE CASCADE 

