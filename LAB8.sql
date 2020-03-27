--1 Кількість тем може бути в діапазоні від 5 до 10.
CREATE TRIGGER checkThemeIsBetween5_10
BEFORE INSERT ON BOOKS FOR EACH ROW
BEGIN 

DECLARE themesCount INT;
SELECT DISTINCT COUNT(`Theme`) FROM BOOKS INTO themesCount;
IF themesCount < 5 THEN
    --action
ELSE IF themesCount > 10 THEN
	UPDATE BOOKS
	SET `Theme` = NULL;
END IFl

END

--2 Новинкою може бути тільки книга видана в поточному році.
CREATE TRIGGER checkNewOnlyIfCurrentYear
BEFORE INSERT ON BOOKS FOR EACH ROW
BEGIN
IF `isNew` AND YEAR(`Dated`) <> YEAR(CURDATE()) THEN
	UPDATE BOOKS
	SET `isNew` = 0;
END IF;
END

--3 Книга з кількістю сторінок до 100 не може коштувати більше 10 $, до 200 - 20 $, до 3 00 - 3 0 $.
CREATE TRIGGER checkPrice
BEFORE INSERT ON BOOKS FOR EACH ROW
BEGIN
	
IF `Pages` IN (1, 100) AND `Price` > 10 THEN 
	UPDATE BOOKS
	SET `Price` = 10;
ELSE IF `Pages` IN (101, 200) AND `Price` > 20 THEN 
	UPDATE BOOKS
	SET `Price` = 20;
ELSE IF `Pages` IN (201, 300) AND `Price` > 30 THEN 
	UPDATE BOOKS
	SET `Price` = 30;
END IF;	
	
END

--4 Книги з однаковим кодом повинні мати однакові дані.
CREATE TRIGGER checkEdition
BEFORE INSERT ON BOOKS FOR EACH ROW
BEGIN
	
IF `Code` IN (SELECT BOOKS.Code FROM BOOKS) THEN
SELECT `N`, BOOKS.Code, ... INTO BOOKS WHERE `Code` = BOOKS.Code;
END IF;	
	
END

--5 Книги з однаковим кодом повинні мати однакові дані.
CREATE TRIGGER checkEdition
BEFORE INSERT ON BOOKS FOR EACH ROW
BEGIN
	
IF `Code` IN (SELECT `Code` FROM BOOKS) THEN
	UPDATE BOOKS SET `Title` = NULL,
	 `Pages` = NULL,
	 `Dated` = NULL
END IF;	
	
END

--6 При спробі видалення книги видається інформація про кількість рядків, що видаляються. Якщо користувач не "dbo", то видалення забороняється.
CREATE TRIGGER assertUserWhenDeleation
BEFORE DELETE ON BOOKS FOR EACH ROW
BEGIN

IF CURRENT_USER() <> 'dbo' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You do not have permission to delete rows';
END IF;

END

--7 Користувач "dbo" не має права змінювати ціну книги.
CREATE TRIGGER dboRights
BEFORE DELETE ON BOOKS FOR EACH ROW
BEGIN
IF CURRENT_USER() = 'dbo' THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You do not have permission to modify book price';
END IF;
END

--8 Видавництва ДМК і Еком підручники не видають.
CREATE TRIGGER DMKandEkomCannotBeDeleted
BEFORE DELETE ON BOOKS FOR EACH ROW
BEGIN

IF `Publisher` IN ('DMK', 'Ekom') THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'DMK and Ekom do not publish books';
END IF;    
END

--9 Видавництво не може випустити більше 10 новинок протягом одного місяця поточного року.
CREATE TRIGGER assert10PublishedWithinMonth
BEFORE INSERT ON BOOKS FOR EACH ROW
BEGIN

DECLARE numberOfPublishedBooksInMonth int;
SELECT COUNT(*) FROM BOOKS WHERE BOOKS.Publisher = `Publisher` AND YEAR(`Dated`) = YEAR(BOOKS.Dated) AND MONTH(`Dated`) = MONTH(BOOKS.Dated) INTO numberOfPublishedBooksInMonth;

IF numberOfPublishedBooksInMonth > 10 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This publisher has released 10 books in this month';
END IF;    
END

--10 видавництво BHV не випускає книги формату 60х88 / 16.
CREATE TRIGGER BHVFormatConstraint
BEFORE INSERT ON BOOKS FOR EACH ROW
BEGIN

IF `Publisher` = 'BHV' AND `Format` = '60х88/16' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'BHV does not publish books in 60x88/16';
END IF;    
END
