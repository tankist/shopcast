-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 12 2010 г., 20:10
-- Версия сервера: 5.1.41
-- Версия PHP: 5.3.2-1ubuntu4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- База данных: `sellcast2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `store_design`
--

DROP TABLE IF EXISTS `store_design`;
CREATE TABLE IF NOT EXISTS `store_design` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '(new)',
  `products_per_page` int(3) NOT NULL,
  `products_order` enum('recent_products','popular_products','price') NOT NULL DEFAULT 'price',
  `embed_width` int(10) unsigned NOT NULL DEFAULT '400',
  `embed_height` int(10) unsigned NOT NULL DEFAULT '64',
  `layout_type` enum('leftColumn','noColumns','rightColumn') NOT NULL DEFAULT 'leftColumn',
  `update_dt` datetime NOT NULL,
  `state` enum('current','not used') NOT NULL DEFAULT 'current',
  PRIMARY KEY (`id`),
  UNIQUE KEY `store` (`store_id`,`name`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

--
-- Дамп данных таблицы `store_design`
--

INSERT INTO `store_design` (`id`, `store_id`, `name`, `products_per_page`, `products_order`, `embed_width`, `embed_height`, `layout_type`, `update_dt`, `state`) VALUES
(4, 12, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-03-04 11:23:54', 'current'),
(5, 9, 'First step', 0, 'price', 400, 64, 'leftColumn', '2008-03-04 16:14:52', 'not used'),
(11, 9, 'test', 0, 'price', 400, 64, 'leftColumn', '2008-05-23 09:59:47', 'current'),
(25, 14, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-09-26 12:17:49', 'current'),
(33, 13, 'sdgfg', 0, 'price', 400, 64, 'leftColumn', '2008-10-10 17:10:29', 'current'),
(34, 15, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-10-16 15:03:52', 'current'),
(35, 16, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-10-16 17:19:35', 'current'),
(36, 17, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-10-29 11:26:25', 'current'),
(37, 18, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-11-04 15:54:42', 'current'),
(38, 19, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-11-04 16:06:51', 'current'),
(39, 20, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-11-04 16:48:27', 'current'),
(40, 21, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-11-04 17:06:00', 'current'),
(41, 22, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-11-05 10:41:53', 'current'),
(42, 23, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-11-18 15:48:50', 'current'),
(43, 24, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-11-20 13:04:15', 'current'),
(44, 25, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-11-20 14:18:59', 'current'),
(45, 26, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-11-27 14:19:17', 'current'),
(46, 27, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-11-27 14:20:00', 'current'),
(47, 28, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-11-27 14:23:54', 'current'),
(49, 30, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-12-05 11:48:35', 'current'),
(50, 31, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-12-09 12:29:07', 'current'),
(51, 32, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-12-15 17:36:05', 'current'),
(52, 33, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2008-12-18 17:21:26', 'current'),
(55, 36, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2009-01-06 11:59:01', 'current'),
(56, 37, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2009-01-15 17:44:22', 'current'),
(57, 38, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2009-05-13 12:58:18', 'current'),
(58, 39, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2009-05-20 16:51:12', 'current'),
(59, 40, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2009-06-11 17:35:15', 'current'),
(60, 41, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2009-06-11 17:38:53', 'current'),
(61, 42, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2009-06-11 17:40:56', 'current'),
(62, 43, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2009-06-11 17:41:46', 'current'),
(63, 44, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2009-06-11 17:44:30', 'current'),
(64, 45, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2009-06-11 17:48:02', 'current'),
(66, 47, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2009-08-10 17:04:46', 'current'),
(67, 48, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2009-08-10 17:08:24', 'current'),
(68, 49, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2009-10-06 15:26:45', 'current'),
(69, 51, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2009-10-16 10:45:32', 'current'),
(70, 52, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2009-10-21 11:46:11', 'current'),
(71, 53, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2009-12-18 17:34:51', 'current'),
(72, 54, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2010-01-06 11:27:08', 'current'),
(74, 56, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2010-02-11 15:58:42', 'current'),
(75, 57, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2010-02-16 12:34:55', 'current'),
(76, 58, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2010-02-18 17:56:42', 'current'),
(77, 59, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2010-02-18 21:05:39', 'current'),
(78, 60, 'Default design', 0, 'price', 400, 64, 'leftColumn', '2010-02-19 17:41:14', 'current');

-- --------------------------------------------------------

--
-- Структура таблицы `store_structure`
--

DROP TABLE IF EXISTS `store_structure`;
CREATE TABLE IF NOT EXISTS `store_structure` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL,
  `section_id` varchar(32) NOT NULL,
  `section_title` varchar(100) NOT NULL,
  `is_visible` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `store_structure`
--


--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `store_design`
--
ALTER TABLE `store_design`
  ADD CONSTRAINT `store_design_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
