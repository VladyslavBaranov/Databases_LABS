--1 Вивести статистику: загальна кількість всіх книг, їх вартість, їх середню вартість, мінімальну і максимальну ціну
SELECT COUNT(*) AS NumberOfBooks, AVG(Price) AS AveragePrice, MIN(Price), MAX(Price) FROM BOOKS

--2 Вивести загальна кількість всіх книг без урахування книг з непроставленою ціною
SELECT COUNT(*) FROM BOOKS WHERE `Цена` IS NULL

--3 Вивести статистику (див. 1) для книг новинка / не новинка
SELECT `Новинка`, COUNT(`Новинка`) AS Items FROM BOOKS GROUP BY `Новинка`

--4 Вивести статистику (див. 1) для книг за кожним роком видання
SELECT YEAR(`Дата`), COUNT(`Дата`) AS Published, AVG(`Цена`), MIN(`Цена`), MAX(`Цена`) FROM BOOKS GROUP BY YEAR(`Дата`)

--5 Змінити п.4, виключивши з статистики книги з ціною від 10 до 20
SELECT YEAR(`Дата`), COUNT(`Дата`) AS Published, AVG(`Цена`), MIN(`Цена`), MAX(`Цена`) FROM BOOKS WHERE `Цена` NOT BETWEEN 10 AND 20 GROUP BY YEAR(`Дата`)

--6 Змінити п.4. Відсортувати статистику за спаданням кількості.
SELECT YEAR(`Дата`), COUNT(`Дата`) AS Published FROM BOOKS GROUP BY YEAR(`Дата`) ORDER BY Published DESC

--7 Вивести загальну кількість кодів книг і  кодів книг, що не повторюються
SELECT DISTINCT COUNT(`Код`) AS UniqueCodesCount, COUNT(`Код`) AS AllCodes FROM BOOKS

--8 Вивести статистику: загальна кількість і вартість книг по першій букві її назви
SELECT COUNT(*), LEFT(`Название`, 1) AS FirstLetter, AVG(`Цена`) FROM BOOKS GROUP BY FirstLetter

--9 Змінити п. 8, виключивши з статистики назви починаються з англ. букви і з цифри.
SELECT COUNT(*), LEFT(`Название`, 1) AS FirstLetter, AVG(`Цена`) FROM BOOKS
 WHERE (`Название` NOT REGEXP '^([A-Z]|[0-9]).*$') GROUP BY FirstLetter
 
 --10 Змінити п. 9 так щоб до складу статистики потрапили дані з роками великими 2000.
SELECT COUNT(*), LEFT(`Название`, 1) AS FirstLetter, AVG(`Цена`) FROM BOOKS 
WHERE (`Название` NOT REGEXP '^([A-Z]|[0-9]).*$' AND YEAR(`Дата`) >= 2000)
 GROUP BY FirstLetter
 
 --11 Змінити п. 10. Відсортувати статистику за спаданням перших букв назви.
 SELECT COUNT(*), LEFT(`Название`, 1) AS FirstLetter, AVG(`Цена`) FROM BOOKS 
 WHERE (`Название` NOT REGEXP '^([A-Z]|[0-9]).*$' AND YEAR(`Дата`) >= 2000)
  GROUP BY FirstLetter ORDER BY FirstLetter DESC
  
 --12 Вивести статистику (див. 1) по кожному місяцю кожного року.
  SELECT YEAR(`Дата`) AS Y, MONTH(`Дата`) AS M, COUNT(MONTH(`Дата`)) AS Published, AVG(`Цена`), MIN(`Цена`), MAX(`Цена`) FROM BOOKS GROUP BY M, Y
  
 --13 Змінити п. 12 так щоб до складу статистики не були дані з незаповненими датами.
  SELECT YEAR(`Дата`) AS Y, MONTH(`Дата`) AS M, COUNT(MONTH(`Дата`)) AS Published, AVG(`Цена`), MIN(`Цена`), MAX(`Цена`) FROM BOOKS WHERE `Дата` IS NOT NULL GROUP BY M, Y
  
  --14 Змінити п. 12. Фільтр за спаданням року і зростанням місяця.
  SELECT YEAR(`Дата`) AS Y, MONTH(`Дата`) AS M, COUNT(MONTH(`Дата`)) AS Published, AVG(`Цена`), MIN(`Цена`), MAX(`Цена`)
  FROM BOOKS WHERE `Дата` IS NOT NULL GROUP BY M, Y Order BY Y DESC, M ASC
  
--15 Вивести статистику для книг новинка / не новинка: загальна ціна, загальна ціна в грн. / Євро / руб. Колонкам запиту дати назви за змістом.
  SELECT `Новинка`, COUNT(*) AS Items, AVG(`Цена`) AS USD, AVG(`Цена`) * 24.5 AS UAH, AVG(`Цена`) / 1.09 AS EUR, AVG(`Цена`) * 63.4 
  FROM BOOKS GROUP BY `Новинка`
  
--16 Змінити п. 15 так щоб виводилася округлена до цілого числа (дол. / Грн. / Євро / руб.) Ціна.
  SELECT `Новинка`, COUNT(*) AS Items, ROUND(AVG(`Цена`)) AS USD,
   ROUND(AVG(`Цена`) * 24.5) AS UAH,
    ROUND(AVG(`Цена`) / 1.09) AS EUR,
     ROUND(AVG(`Цена`) * 63.4) AS RUB FROM BOOKS GROUP BY `Новинка`
     
--17  Вивести статистику (див. 1) по видавництвах.
SELECT COUNT(*), `Издание`, AVG(`Цена`), MAX(`Цена`), MIN(`Цена`) FROM BOOKS GROUP BY `Издание`

--18 Вивести список видавництв, у яких огруглено до цілого ціна однієї сторінки більше 10 копійок.
SELECT `Название` FROM BOOKS WHERE ROUND((`Цена` / `Страницы`) * 24.6) > 0.1
