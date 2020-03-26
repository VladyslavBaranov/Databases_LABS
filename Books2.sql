-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 26, 2020 at 04:33 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Books2`
--

-- --------------------------------------------------------

--
-- Table structure for table `BOOKS`
--

CREATE TABLE `BOOKS` (
  `N` int(11) NOT NULL,
  `Код` int(11) NOT NULL,
  `Новинка` tinyint(1) NOT NULL,
  `Название` varchar(100) NOT NULL,
  `Цена` float NOT NULL,
  `Издание` varchar(40) NOT NULL,
  `Страницы` int(11) NOT NULL,
  `Формат` varchar(15) NOT NULL DEFAULT '70х100/16',
  `Дата` date NOT NULL,
  `Тираж` int(11) NOT NULL DEFAULT 5000,
  `Тема` varchar(40) NOT NULL DEFAULT 'Использование Компьютера в целом',
  `Категория` varchar(20) NOT NULL DEFAULT 'Учебники'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `BOOKS`
--

INSERT INTO `BOOKS` (`N`, `Код`, `Новинка`, `Название`, `Цена`, `Издание`, `Страницы`, `Формат`, `Дата`, `Тираж`, `Тема`, `Категория`) VALUES
(2, 5110, 0, 'Аппаратные средства мультимедиа', 15.51, 'Петербург', 400, '70х100/16', '2000-07-24', 5000, 'Использование ПК в целом', 'учебники'),
(8, 4985, 0, 'Освой самостоятельно ремонт ПК за 24 часа', 18.9, 'Уильямс', 288, '70х100/16', '2000-07-07', 5000, 'Использование ПК в целом', 'учебники'),
(9, 5141, 0, 'Структуры данный и алгоритмы', 37.8, 'DiaSoft', 384, '70х100/16', '2000-09-29', 5000, 'Использование ПК в целом', 'учебники'),
(20, 5127, 1, 'Автоматизация инженерно графических работ', 11.58, 'Питер', 256, '70х100/16', '2000-12-12', 5000, 'Использование ПК в целом', 'учебники'),
(31, 5110, 0, 'Аппаратные средства мультимедиа', 15.51, 'Петербург', 400, '70х100/16', '2000-07-24', 5000, 'Использование ПК в целом', 'Средства ПК'),
(50, 3851, 1, 'Защита иформации и безопасность компьютерных систем ', 26, 'DiaSoft', 480, '84х108/16', '1999-04-02', 5000, 'Использование ПК в целом', 'Защита ПК'),
(175, 5217, 0, 'Новые версии программ Windows 2000 Professional', 16.57, 'Триумф', 320, '70х100/16', '2000-08-25', 5000, 'Операционные системы', 'Windows 2000'),
(191, 860, 0, 'Операционная система UNIX', 3.5, 'Петербург', 395, '84х100/16', '1997-05-05', 5000, 'Операционные системы', 'UNIX'),
(203, 44, 0, 'Ответы на актуальные вопросы об OS/2 Warp', 5, 'DiaSoft', 352, '60х84/16', '1996-03-20', 5000, 'Операционные системы', 'Другие оп системы'),
(209, 5462, 0, 'С++ Лекции и упражнения', 29, 'DiaSoft', 656, '84х108/16', '2000-12-12', 5000, 'Программирование', 'CC++'),
(210, 4982, 0, 'C. Лекции и упражнения Эффективное использования C++', 29, 'DiaSoft', 432, '84х108/16', '2000-07-12', 5000, 'Программирование', 'CC++'),
(220, 4687, 0, 'Эффективное использование С++', 17.6, 'ДМК', 240, '70х100/16', '2000-12-07', 5000, 'Программирование', 'CC++');

-- --------------------------------------------------------

--
-- Table structure for table `BOOKS_2`
--

CREATE TABLE `BOOKS_2` (
  `N` int(11) NOT NULL,
  `Код` int(11) NOT NULL,
  `Новинка` tinyint(1) NOT NULL,
  `Название` varchar(100) NOT NULL,
  `Цена` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `BOOKS_2`
--

INSERT INTO `BOOKS_2` (`N`, `Код`, `Новинка`, `Название`, `Цена`) VALUES
(2, 5110, 0, 'Аппаратные средства мультимедиа', 15.51),
(8, 4985, 0, 'Освой самостоятельно ремонт ПК за 24 часа', 18.9),
(9, 5141, 0, 'Структуры данный и алгоритмы', 37.8),
(20, 5127, 1, 'Автоматизация инженерно графических работ', 11.58),
(31, 5110, 0, 'Аппаратные средства мультимедиа', 15.51),
(50, 3851, 1, 'Защита иформации и безопасность компьютерных систем ', 26),
(175, 5217, 0, 'Новые версии программ Windows 2000 Professional', 16.57),
(191, 860, 0, 'Операционная система UNIX', 3.5),
(203, 44, 0, 'Ответы на актуальные вопросы об OS/2 Warp', 5),
(209, 5462, 0, 'С++ Лекции и упражнения', 29),
(210, 4982, 0, 'C. Лекции и упражнения Эффективное использования C++', 29),
(220, 4687, 0, 'Эффективное использование С++', 17.6);

-- --------------------------------------------------------

--
-- Table structure for table `BOOKS_CPT`
--

CREATE TABLE `BOOKS_CPT` (
  `N` int(11) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `pub_id` int(11) DEFAULT NULL,
  `theme_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `BOOKS_CPT`
--

INSERT INTO `BOOKS_CPT` (`N`, `cat_id`, `pub_id`, `theme_id`) VALUES
(2, 1, 1, 1),
(8, 1, 2, 1),
(9, 1, 3, 1),
(20, 1, 4, 1),
(31, 2, 1, 1),
(50, 3, 3, 1),
(175, 4, 5, 2),
(191, 5, 1, 2),
(203, 6, 3, 2),
(209, 7, 3, 3),
(210, 7, 3, 3),
(220, 7, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `BOOKS_Physic_data`
--

CREATE TABLE `BOOKS_Physic_data` (
  `N` int(11) NOT NULL,
  `Страницы` int(11) NOT NULL,
  `Формат` varchar(15) NOT NULL DEFAULT '70х100/16',
  `Дата` date NOT NULL,
  `Тираж` int(11) NOT NULL DEFAULT 5000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `BOOKS_Physic_data`
--

INSERT INTO `BOOKS_Physic_data` (`N`, `Страницы`, `Формат`, `Дата`, `Тираж`) VALUES
(2, 400, '70х100/16', '2000-07-24', 5000),
(8, 288, '70х100/16', '2000-07-07', 5000),
(9, 384, '70х100/16', '2000-09-29', 5000),
(20, 256, '70х100/16', '2000-12-12', 5000),
(31, 400, '70х100/16', '2000-07-24', 5000),
(50, 480, '84х108/16', '1999-04-02', 5000),
(175, 352, '70х100/16', '2000-08-25', 5000),
(191, 395, '84х100/16', '1997-05-05', 5000),
(203, 352, '60х84/16', '1996-03-20', 5000),
(209, 656, '84х108/16', '2000-12-12', 5000),
(210, 432, '84х108/16', '2000-07-12', 5000),
(220, 240, '70х100/16', '2000-12-07', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `c_id` int(11) NOT NULL,
  `Category` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`c_id`, `Category`) VALUES
(1, 'учебники'),
(2, 'Средства ПК'),
(3, 'Защита ПК'),
(4, 'Windows 2000'),
(5, 'UNIX'),
(6, 'Другие оп системы'),
(7, 'CC++');

-- --------------------------------------------------------

--
-- Table structure for table `MyNewTable`
--

CREATE TABLE `MyNewTable` (
  `id` int(11) NOT NULL,
  `val` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `MyNewTable`
--

INSERT INTO `MyNewTable` (`id`, `val`) VALUES
(1, 123),
(2, 231),
(3, 432);

--
-- Triggers `MyNewTable`
--
DELIMITER $$
CREATE TRIGGER `trig` BEFORE INSERT ON `MyNewTable` FOR EACH ROW BEGIN
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Publishers`
--

CREATE TABLE `Publishers` (
  `p_id` int(11) NOT NULL,
  `Publisher` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Publishers`
--

INSERT INTO `Publishers` (`p_id`, `Publisher`) VALUES
(1, 'Петербург'),
(2, 'Уильямс'),
(3, 'DiaSoft'),
(4, 'Питер'),
(5, 'Триумф'),
(6, 'ДМК');

-- --------------------------------------------------------

--
-- Table structure for table `Themes`
--

CREATE TABLE `Themes` (
  `t_id` int(11) NOT NULL,
  `Theme` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Themes`
--

INSERT INTO `Themes` (`t_id`, `Theme`) VALUES
(1, 'Использование ПК в целом'),
(2, 'Операционные системы'),
(3, 'Программирование');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BOOKS`
--
ALTER TABLE `BOOKS`
  ADD PRIMARY KEY (`N`),
  ADD UNIQUE KEY `N` (`N`,`Код`);

--
-- Indexes for table `BOOKS_2`
--
ALTER TABLE `BOOKS_2`
  ADD PRIMARY KEY (`N`);

--
-- Indexes for table `BOOKS_CPT`
--
ALTER TABLE `BOOKS_CPT`
  ADD PRIMARY KEY (`N`);

--
-- Indexes for table `BOOKS_Physic_data`
--
ALTER TABLE `BOOKS_Physic_data`
  ADD PRIMARY KEY (`N`);

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `MyNewTable`
--
ALTER TABLE `MyNewTable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Publishers`
--
ALTER TABLE `Publishers`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `Themes`
--
ALTER TABLE `Themes`
  ADD PRIMARY KEY (`t_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Publishers`
--
ALTER TABLE `Publishers`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Themes`
--
ALTER TABLE `Themes`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BOOKS_CPT`
--
ALTER TABLE `BOOKS_CPT`
  ADD CONSTRAINT `BOOKS_CPT_ibfk_1` FOREIGN KEY (`N`) REFERENCES `BOOKS_2` (`N`) ON DELETE CASCADE;

--
-- Constraints for table `BOOKS_Physic_data`
--
ALTER TABLE `BOOKS_Physic_data`
  ADD CONSTRAINT `BOOKS_Physic_data_ibfk_1` FOREIGN KEY (`N`) REFERENCES `BOOKS_2` (`N`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
