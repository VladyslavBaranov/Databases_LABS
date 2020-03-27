--1 Вивести значення наступних колонок: назва книги, ціна, назва видавництва, формат.
CREATE PROCEDURE getTitlePricePublisherFormat()
BEGIN
SELECT Title, Price, Publisher, Format FROM BOOKS;
END

EXEC getNameTitlePublisherFormat();

--2 Вивести значення наступних колонок: тема, категорія, назва книги, назва видавництва. Фільтр по темам і категоріям.
CREATE PROCEDURE getThemeCategoryTitlePublisherGroupedByCategory()
BEGIN
SELECT Theme, Category, Title, Publisher FROM BOOKS GROUP BY Category
END

EXEC getThemeCategoryTitlePublisherGroupedByCategory();

--3 Вивести книги видавництва 'BHV', видані після 2000 р
CREATE PROCEDURE getBooks
(IN Publisher varchar(30), IN afterYear int)
BEGIN
SELECT * FROM BOOKS WHERE BOOKS.Publisher = Publisher AND YEAR(dated) > afterYear;
END

EXEC getBooks('BHV', 2000);

--4 Вивести загальну кількість сторінок по кожній назві категорії. Фільтр за спаданням / зростанням кількості сторінок.
CREATE PROCEDURE getSummedPagesGroupedByCategory
(IN ascending tinyint)
BEGIN
IF ascending = 0 THEN
	SELECT SUM(Pages) FROM BOOKS GROUP BY Category ORDER BY Category DESC;  
ELSE
    SELECT SUM(Pages) FROM BOOKS GROUP BY Category ORDER BY Category ASC;
END IF;
END

EXEC getSummedPagesGroupedByCategory(1);

--5  Вивести середню вартість книг по темі 'Використання ПК' і категорії 'Linux'.
CREATE PROCEDURE getAvgPrice
(IN theme varchar(50), IN category varchar(50))
BEGIN
SELECT AVG(Price) FROM BOOKS WHERE BOOKS.theme = theme AND BOOKS.category = category;
END

--6 Вивести всі дані універсального відносини.
CREATE PROCEDURE getAllData
BEGIN
SELECT * FROM BOOKS;
END

--9 Вивести всі книги категорії 'C ++'.
CREATE PROCEDURE getBooksOfCategory
(IN cat varchar(50))
BEGIN
SELECT * FROM BOOKS WHERE Category = cat;
END

--10 Вивести список видавництв, у яких розмір книг перевищує 400 сторінок.
CREATE PROCEDURE getPublishersWhoseBooksCapacityMoreThan
(IN pages int)
BEGIN
SELECT Publisher AS Pub FROM BOOKS WHERE (SELECT MIN(Pages) FROM BOOKS WHERE Publisher = Pub) > pages;
END

--11 Вивести список категорій за якими більше 3-х книг.
CREATE PROCEDURE getCategoriesWhichHaveBooksAtLeast
(IN num int)
BEGIN
SELECT Category AS cat FROM BOOKS WHERE (SELECT COUNT(*) FROM BOOKS WHERE Category = cat) > num;
SELECT 
END

--12 Вивести список книг видавництва 'BHV', якщо в списку є хоча б одна книга цього видавництва.
CREATE PROCEDURE getBooksOfCategoryIfCategoryExists
(IN cat varchar(50))
BEGIN
DECLARE number INT DEFAULT 0;
SET  number = (SELECT COUNT(*) FROM BOOKS WHERE Category = cat);
IF number >= 1 THEN
SELECT * BOOKS WHERE Category = cat;
END IF;
END

--14 Вивести відсортоване загальний список назв тем і категорій.
CREATE PROCEDURE getCategoriesAndThemes
(IN ascending tinyint)
BEGIN
IF ascending THEN
    SELECT DISTINCT `Тема` AS Item FROM BOOKS UNION SELECT DISTINCT `Категория` FROM BOOKS ORDER BY Item asc
ELSE
    SELECT DISTINCT `Тема` AS Item FROM BOOKS UNION SELECT DISTINCT `Категория` FROM BOOKS ORDER BY Item desc
END IF;
SELECT Category FROM BOOKS UNION SELECT Theme FROM BOOKS ORDER BY
SELECT 
END

--15 Вивести відсортоване в зворотному порядку загальний список неповторяющихся перших слів назв книг і категорій.
CREATE PROCEDURE getFirstWordsOfTitleUnionWithCategoriesOrderBy
(IN ascending tinyint)
IF ascending THEN
	SELECT DISTINCT SUBSTRING_INDEX(BOOKS.Название, ' ', 1) AS Item FROM BOOKS
	 UNION SELECT DISTINCT `Категория` FROM BOOKS ORDER BY Item ASC
ELSE 
	SELECT DISTINCT SUBSTRING_INDEX(BOOKS.Название, ' ', 1) AS Item FROM BOOKS
	 UNION SELECT DISTINCT `Категория` FROM BOOKS ORDER BY Item DESC
END IF;
END


