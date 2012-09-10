-- phpMyAdmin SQL Dump
-- version 3.3.2deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 12 2010 г., 18:04
-- Версия сервера: 5.1.41
-- Версия PHP: 5.3.2-1ubuntu4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `sellcast2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `display_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_id_2` (`store_id`,`name`),
  KEY `store_id` (`store_id`),
  KEY `display_order` (`display_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=306 ;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `store_id`, `name`, `display_order`) VALUES
(185, 13, 'New Category (1)', 1),
(186, 13, 'New Category (2)', 2),
(187, 13, 'New Category (3)', 3),
(190, 13, 'New Category', 4),
(191, 13, 'New Category222', 5),
(192, 13, 'New Category 545', 6),
(193, 13, 'New Category 345', 7),
(212, 14, 'New Category', 6),
(213, 14, 'New Category (2)', 1),
(214, 14, 'New Category (3)', 3),
(216, 14, 'New Category (2)4', 2),
(217, 14, 'New Category3', 4),
(218, 14, 'New Category (3)5', 5),
(233, 17, 'Jewelry', 1),
(234, 17, 'Shoes', 2),
(235, 17, 'Womens Clothing', 3),
(236, 17, 'Mens Clothing', 4),
(237, 17, 'Accessories', 5),
(238, 31, 'Jewelry', 1),
(239, 31, 'Shoes', 2),
(240, 31, 'Womens Clothing', 3),
(241, 31, 'Mens Clothing', 4),
(242, 31, 'Accessories', 5),
(243, 33, 'Accessories', 1),
(244, 33, 'Shoes', 2),
(245, 33, 'Womens Clothing', 3),
(246, 33, 'Mens Clothing', 4),
(247, 33, 'Jewelry', 5),
(258, 36, 'Accessories', 1),
(259, 36, 'Shoes', 2),
(260, 36, 'Womens Clothing', 3),
(261, 36, 'Mens Clothing', 4),
(262, 36, 'Jewelry', 5),
(263, 37, 'Accessories', 1),
(264, 37, 'Shoes', 2),
(265, 37, 'Womens Clothing', 3),
(266, 37, 'Mens Clothing', 4),
(267, 37, 'Jewelry', 5),
(268, 38, 'Accessories', 1),
(269, 38, 'Shoes', 2),
(270, 38, 'Womens Clothing', 3),
(271, 38, 'Mens Clothing', 4),
(272, 38, 'Jewelry', 5),
(273, 39, 'tesdt', 1),
(274, 9, 'girl', 1),
(275, 9, 'nice', 2),
(276, 9, 'bad', 3),
(277, 9, 'boy', 4),
(278, 31, 'New Category', 6),
(279, 47, 'Accessories', 1),
(280, 47, 'Shoes', 2),
(281, 47, 'Womens Clothing', 3),
(282, 47, 'Mens Clothing', 4),
(283, 47, 'Jewelry', 5),
(284, 48, 'Accessories', 1),
(285, 48, 'Shoes', 2),
(286, 48, 'Womens Clothing', 3),
(287, 48, 'Mens Clothing', 4),
(288, 48, 'Jewelry', 5),
(289, 49, 'girl', 1),
(290, 49, 'Category 1', 3),
(291, 49, 'Category 2', 4),
(292, 49, 'Category 3', 5),
(293, 49, 'Category 4', 6),
(294, 49, 'boy', 2),
(295, 52, 'girl', 1),
(296, 53, 'Accessories', 1),
(297, 53, 'Shoes', 2),
(298, 53, 'Womens Clothing', 3),
(299, 53, 'Mens Clothing', 4),
(300, 53, 'Jewelry', 5),
(301, 54, 'Accessories', 1),
(302, 54, 'Shoes', 2),
(303, 54, 'Womens Clothing', 3),
(304, 54, 'Mens Clothing', 4),
(305, 54, 'Jewelry', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `category_product`
--

DROP TABLE IF EXISTS `category_product`;
CREATE TABLE IF NOT EXISTS `category_product` (
  `category_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`category_id`,`product_id`),
  KEY `category_id` (`category_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category_product`
--

INSERT INTO `category_product` (`category_id`, `product_id`) VALUES
(185, 36),
(185, 37),
(185, 40),
(186, 39),
(186, 41),
(186, 45),
(187, 38),
(187, 44),
(190, 58),
(213, 59),
(214, 59),
(216, 59),
(238, 151),
(238, 172),
(238, 175),
(238, 178),
(239, 145),
(239, 149),
(239, 172),
(240, 149),
(240, 172),
(240, 175),
(241, 175),
(242, 149),
(242, 175),
(258, 157),
(258, 177),
(259, 156),
(259, 171),
(260, 155),
(260, 156),
(260, 158),
(260, 171),
(260, 177),
(261, 157),
(261, 158),
(262, 156),
(262, 158),
(263, 161),
(263, 164),
(264, 161),
(264, 163),
(265, 161),
(265, 162),
(265, 163),
(265, 164),
(266, 162),
(266, 163),
(267, 162),
(267, 164),
(271, 168),
(273, 170),
(274, 166),
(274, 167),
(275, 50),
(275, 166),
(276, 50),
(276, 165),
(276, 166),
(277, 50),
(289, 180),
(289, 186),
(289, 192),
(290, 180),
(290, 185),
(290, 186),
(290, 191),
(291, 181),
(291, 183),
(291, 184),
(291, 186),
(291, 190),
(291, 193),
(291, 195),
(291, 196),
(292, 182),
(292, 187),
(292, 188),
(292, 194),
(293, 182),
(293, 184),
(294, 185),
(294, 191),
(295, 197),
(295, 201),
(299, 203),
(303, 204);

-- --------------------------------------------------------

--
-- Структура таблицы `common_category`
--

DROP TABLE IF EXISTS `common_category`;
CREATE TABLE IF NOT EXISTS `common_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `partner_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`parent_id`,`partner_id`),
  KEY `parent_id` (`parent_id`),
  KEY `partner_id` (`partner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Дамп данных таблицы `common_category`
--

INSERT INTO `common_category` (`id`, `name`, `parent_id`, `partner_id`) VALUES
(1, 'Accessories', NULL, 1),
(24, 'Accessories', 4, 1),
(8, 'Belts', 1, 1),
(11, 'Boots', 2, 1),
(31, 'Bracelets', 5, 1),
(16, 'Coats & Jackets', 3, 1),
(25, 'Coats & Jackets', 4, 1),
(26, 'Denim', 4, 1),
(17, 'Dresses', 3, 1),
(32, 'Earrings', 5, 1),
(12, 'Flats', 2, 1),
(9, 'Hats', 1, 1),
(13, 'Heels & Wedges', 2, 1),
(18, 'Jeans', 3, 1),
(5, 'Jewelry', NULL, 1),
(19, 'Lingerie & Sleepwear', 3, 1),
(4, 'Men', NULL, 1),
(33, 'Necklaces', 5, 1),
(20, 'Pants & Leggings', 3, 1),
(34, 'Pendants', 5, 1),
(35, 'Rings', 5, 1),
(14, 'Sandals', 2, 1),
(6, 'Scarves & Gloves', 1, 1),
(28, 'Shirts', 4, 1),
(2, 'Shoes', NULL, 1),
(29, 'Shoes', 4, 1),
(21, 'Skirts & Shorts', 3, 1),
(15, 'Sneakers', 2, 1),
(7, 'Sunglasses', 1, 1),
(22, 'Sweaters & Hoodies', 3, 1),
(27, 'Sweaters & Hoodies', 4, 1),
(30, 'T-Shirts & Polos', 4, 1),
(10, 'Tights & Socks', 1, 1),
(23, 'Tops & Shirts', 3, 1),
(3, 'Women', NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `common_category_product`
--

DROP TABLE IF EXISTS `common_category_product`;
CREATE TABLE IF NOT EXISTS `common_category_product` (
  `common_category_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `common_category_id_2` (`common_category_id`,`product_id`),
  KEY `common_category_id` (`common_category_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `common_category_product`
--

INSERT INTO `common_category_product` (`common_category_id`, `product_id`) VALUES
(1, 204),
(1, 207),
(1, 216),
(1, 219),
(1, 222),
(1, 225),
(2, 204),
(2, 207),
(2, 216),
(2, 217),
(2, 219),
(2, 221),
(2, 222),
(2, 223),
(2, 224),
(3, 204),
(3, 207),
(3, 216),
(3, 218),
(3, 219),
(3, 220),
(3, 222),
(3, 224),
(3, 227),
(4, 204),
(4, 207),
(4, 220),
(4, 222),
(5, 204),
(5, 206),
(5, 207),
(5, 216),
(5, 226),
(6, 207),
(8, 204),
(8, 216),
(8, 219),
(8, 222),
(9, 225),
(10, 207),
(11, 217),
(11, 221),
(11, 223),
(12, 204),
(12, 224),
(13, 207),
(13, 216),
(13, 222),
(14, 219),
(15, 207),
(16, 227),
(17, 207),
(18, 207),
(18, 220),
(19, 204),
(19, 207),
(19, 218),
(19, 222),
(20, 207),
(20, 216),
(20, 224),
(21, 207),
(21, 219),
(26, 207),
(26, 220),
(29, 204),
(29, 207),
(29, 222),
(31, 206),
(31, 216),
(31, 226),
(32, 207),
(32, 216),
(33, 216),
(34, 216),
(35, 204),
(35, 207),
(35, 216);

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `iso2` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=240 ;

--
-- Дамп данных таблицы `countries`
--

INSERT INTO `countries` (`id`, `iso2`, `name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'AS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua and Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei Darussalam'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CG', 'Congo'),
(50, 'CD', 'Congo, the Democratic Republic of the'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'CI', 'Cote D''Ivoire'),
(54, 'HR', 'Croatia'),
(55, 'CU', 'Cuba'),
(56, 'CY', 'Cyprus'),
(57, 'CZ', 'Czech Republic'),
(58, 'DK', 'Denmark'),
(59, 'DJ', 'Djibouti'),
(60, 'DM', 'Dominica'),
(61, 'DO', 'Dominican Republic'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'GF', 'French Guiana'),
(75, 'PF', 'French Polynesia'),
(76, 'TF', 'French Southern Territories'),
(77, 'GA', 'Gabon'),
(78, 'GM', 'Gambia'),
(79, 'GE', 'Georgia'),
(80, 'DE', 'Germany'),
(81, 'GH', 'Ghana'),
(82, 'GI', 'Gibraltar'),
(83, 'GR', 'Greece'),
(84, 'GL', 'Greenland'),
(85, 'GD', 'Grenada'),
(86, 'GP', 'Guadeloupe'),
(87, 'GU', 'Guam'),
(88, 'GT', 'Guatemala'),
(89, 'GN', 'Guinea'),
(90, 'GW', 'Guinea-Bissau'),
(91, 'GY', 'Guyana'),
(92, 'HT', 'Haiti'),
(93, 'HM', 'Heard Island and Mcdonald Islands'),
(94, 'VA', 'Holy See (Vatican City State)'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'ID', 'Indonesia'),
(101, 'IR', 'Iran, Islamic Republic of'),
(102, 'IQ', 'Iraq'),
(103, 'IE', 'Ireland'),
(104, 'IL', 'Israel'),
(105, 'IT', 'Italy'),
(106, 'JM', 'Jamaica'),
(107, 'JP', 'Japan'),
(108, 'JO', 'Jordan'),
(109, 'KZ', 'Kazakhstan'),
(110, 'KE', 'Kenya'),
(111, 'KI', 'Kiribati'),
(112, 'KP', 'Korea, Democratic People''s Republic of'),
(113, 'KR', 'Korea, Republic of'),
(114, 'KW', 'Kuwait'),
(115, 'KG', 'Kyrgyzstan'),
(116, 'LA', 'Lao People''s Democratic Republic'),
(117, 'LV', 'Latvia'),
(118, 'LB', 'Lebanon'),
(119, 'LS', 'Lesotho'),
(120, 'LR', 'Liberia'),
(121, 'LY', 'Libyan Arab Jamahiriya'),
(122, 'LI', 'Liechtenstein'),
(123, 'LT', 'Lithuania'),
(124, 'LU', 'Luxembourg'),
(125, 'MO', 'Macao'),
(126, 'MK', 'Macedonia, the Former Yugoslav Republic of'),
(127, 'MG', 'Madagascar'),
(128, 'MW', 'Malawi'),
(129, 'MY', 'Malaysia'),
(130, 'MV', 'Maldives'),
(131, 'ML', 'Mali'),
(132, 'MT', 'Malta'),
(133, 'MH', 'Marshall Islands'),
(134, 'MQ', 'Martinique'),
(135, 'MR', 'Mauritania'),
(136, 'MU', 'Mauritius'),
(137, 'YT', 'Mayotte'),
(138, 'MX', 'Mexico'),
(139, 'FM', 'Micronesia, Federated States of'),
(140, 'MD', 'Moldova, Republic of'),
(141, 'MC', 'Monaco'),
(142, 'MN', 'Mongolia'),
(143, 'MS', 'Montserrat'),
(144, 'MA', 'Morocco'),
(145, 'MZ', 'Mozambique'),
(146, 'MM', 'Myanmar'),
(147, 'NA', 'Namibia'),
(148, 'NR', 'Nauru'),
(149, 'NP', 'Nepal'),
(150, 'NL', 'Netherlands'),
(151, 'AN', 'Netherlands Antilles'),
(152, 'NC', 'New Caledonia'),
(153, 'NZ', 'New Zealand'),
(154, 'NI', 'Nicaragua'),
(155, 'NE', 'Niger'),
(156, 'NG', 'Nigeria'),
(157, 'NU', 'Niue'),
(158, 'NF', 'Norfolk Island'),
(159, 'MP', 'Northern Mariana Islands'),
(160, 'NO', 'Norway'),
(161, 'OM', 'Oman'),
(162, 'PK', 'Pakistan'),
(163, 'PW', 'Palau'),
(164, 'PS', 'Palestinian Territory, Occupied'),
(165, 'PA', 'Panama'),
(166, 'PG', 'Papua New Guinea'),
(167, 'PY', 'Paraguay'),
(168, 'PE', 'Peru'),
(169, 'PH', 'Philippines'),
(170, 'PN', 'Pitcairn'),
(171, 'PL', 'Poland'),
(172, 'PT', 'Portugal'),
(173, 'PR', 'Puerto Rico'),
(174, 'QA', 'Qatar'),
(175, 'RE', 'Reunion'),
(176, 'RO', 'Romania'),
(177, 'RU', 'Russian Federation'),
(178, 'RW', 'Rwanda'),
(179, 'SH', 'Saint Helena'),
(180, 'KN', 'Saint Kitts and Nevis'),
(181, 'LC', 'Saint Lucia'),
(182, 'PM', 'Saint Pierre and Miquelon'),
(183, 'VC', 'Saint Vincent and the Grenadines'),
(184, 'WS', 'Samoa'),
(185, 'SM', 'San Marino'),
(186, 'ST', 'Sao Tome and Principe'),
(187, 'SA', 'Saudi Arabia'),
(188, 'SN', 'Senegal'),
(189, 'CS', 'Serbia and Montenegro'),
(190, 'SC', 'Seychelles'),
(191, 'SL', 'Sierra Leone'),
(192, 'SG', 'Singapore'),
(193, 'SK', 'Slovakia'),
(194, 'SI', 'Slovenia'),
(195, 'SB', 'Solomon Islands'),
(196, 'SO', 'Somalia'),
(197, 'ZA', 'South Africa'),
(198, 'GS', 'South Georgia and the South Sandwich Islands'),
(199, 'ES', 'Spain'),
(200, 'LK', 'Sri Lanka'),
(201, 'SD', 'Sudan'),
(202, 'SR', 'Suriname'),
(203, 'SJ', 'Svalbard and Jan Mayen'),
(204, 'SZ', 'Swaziland'),
(205, 'SE', 'Sweden'),
(206, 'CH', 'Switzerland'),
(207, 'SY', 'Syrian Arab Republic'),
(208, 'TW', 'Taiwan, Province of China'),
(209, 'TJ', 'Tajikistan'),
(210, 'TZ', 'Tanzania, United Republic of'),
(211, 'TH', 'Thailand'),
(212, 'TL', 'Timor-Leste'),
(213, 'TG', 'Togo'),
(214, 'TK', 'Tokelau'),
(215, 'TO', 'Tonga'),
(216, 'TT', 'Trinidad and Tobago'),
(217, 'TN', 'Tunisia'),
(218, 'TR', 'Turkey'),
(219, 'TM', 'Turkmenistan'),
(220, 'TC', 'Turks and Caicos Islands'),
(221, 'TV', 'Tuvalu'),
(222, 'UG', 'Uganda'),
(223, 'UA', 'Ukraine'),
(224, 'AE', 'United Arab Emirates'),
(225, 'GB', 'United Kingdom'),
(226, 'US', 'United States'),
(227, 'UM', 'United States Minor Outlying Islands'),
(228, 'UY', 'Uruguay'),
(229, 'UZ', 'Uzbekistan'),
(230, 'VU', 'Vanuatu'),
(231, 'VE', 'Venezuela'),
(232, 'VN', 'Viet Nam'),
(233, 'VG', 'Virgin Islands, British'),
(234, 'VI', 'Virgin Islands, U.s.'),
(235, 'WF', 'Wallis and Futuna'),
(236, 'EH', 'Western Sahara'),
(237, 'YE', 'Yemen'),
(238, 'ZM', 'Zambia'),
(239, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Структура таблицы `designer`
--

DROP TABLE IF EXISTS `designer`;
CREATE TABLE IF NOT EXISTS `designer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` enum('local','global') NOT NULL DEFAULT 'global',
  `partner_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_2` (`name`,`type`,`partner_id`),
  KEY `partner_id` (`partner_id`),
  KEY `type` (`type`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=72 ;

--
-- Дамп данных таблицы `designer`
--

INSERT INTO `designer` (`id`, `name`, `type`, `partner_id`) VALUES
(1, '213 Industry', 'global', 1),
(2, 'Ames Bros.', 'global', 1),
(3, 'Aspara', 'global', 1),
(4, 'Beau bois', 'global', 1),
(5, 'Bennett Malibu', 'global', 1),
(6, 'Bilingual', 'global', 1),
(55, 'Bilingual Nemo', 'global', 1),
(56, 'Bilingual new', 'global', 1),
(7, 'Billy blues', 'global', 1),
(8, 'Black Halo', 'global', 1),
(9, 'Christian Weber of NYC', 'global', 1),
(68, 'designo', 'local', 1),
(53, 'Dolche', 'global', 1),
(10, 'Dos Fannies', 'global', 1),
(11, 'Dos Fannies Vintage Jewelry', 'global', 1),
(12, 'Envi', 'global', 1),
(13, 'Eva Franco', 'global', 1),
(14, 'Fifteen Twenty', 'global', 1),
(15, 'five crown t-shirts', 'global', 1),
(16, 'For love and liberty', 'global', 1),
(17, 'Free People', 'global', 1),
(18, 'French Connection', 'global', 1),
(19, 'Gibson', 'global', 1),
(20, 'Ginger Lamb European Fabrics', 'global', 1),
(21, 'hippie ink', 'global', 1),
(22, 'hussy jr.', 'global', 1),
(23, 'jet Lag', 'global', 1),
(24, 'jodi''s picks', 'global', 1),
(25, 'Josette', 'global', 1),
(26, 'Karla G.', 'global', 1),
(27, 'Kensie', 'global', 1),
(28, 'kinetix', 'global', 1),
(29, 'LA Made', 'global', 1),
(30, 'LINQ', 'global', 1),
(31, 'Maj Collections', 'global', 1),
(32, 'Michelle Jonas', 'global', 1),
(33, 'Mixie', 'global', 1),
(34, 'modern amusement', 'global', 1),
(35, 'Monarchy', 'global', 1),
(36, 'Nicole Miller', 'global', 1),
(37, 'Nu Collective', 'global', 1),
(66, 'Oksana', 'global', 1),
(38, 'Onna Ehrich/SwayShowroom', 'global', 1),
(39, 'Parasuco Jeans', 'global', 1),
(40, 'Penguin', 'global', 1),
(41, 'People''s Liberation denim', 'global', 1),
(71, 'Pirat', 'local', 1),
(42, 'Robert Graham Mens', 'global', 1),
(67, 'rytrg', 'global', 1),
(43, 'Signorelli', 'global', 1),
(44, 'SIMDOG INC', 'global', 1),
(45, 'Spoken''s Label', 'global', 1),
(46, 'Takel', 'global', 1),
(54, 'Test', 'global', 1),
(65, 'Testok', 'global', 1),
(69, 'Test_Ok', 'local', 1),
(47, 'Tricky Threads', 'global', 1),
(64, 'Valdemar', 'local', 1),
(48, 'Vanitas', 'global', 1),
(49, 'Vintage Betty', 'global', 1),
(63, 'Voffka', 'local', 1),
(61, 'Vova', 'local', 1),
(50, 'Wet Cement', 'global', 1),
(51, 'william rast', 'global', 1),
(52, 'Yoana Baraschi', 'global', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `file`
--

DROP TABLE IF EXISTS `file`;
CREATE TABLE IF NOT EXISTS `file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(126) NOT NULL,
  `ext` varchar(4) NOT NULL,
  `type` enum('image','video','song','product') NOT NULL DEFAULT 'image',
  PRIMARY KEY (`id`),
  KEY `prod_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=394 ;

--
-- Дамп данных таблицы `file`
--

INSERT INTO `file` (`id`, `product_id`, `name`, `ext`, `type`) VALUES
(54, 26, 'c430c27c8e5739006f862c038213374a_full.jpg', 'jpg', 'image'),
(55, 27, '1a963db36c528ae3fde641122bc7a215_full.jpg', 'jpg', 'image'),
(56, 28, '2_International_Financial_Centre.jpg', 'jpg', 'image'),
(57, 29, '6f27e803c581d0acdd8279804158d373_full.jpg', 'jpg', 'image'),
(58, 30, '7fff614873449c152019fb70e184c78c_full.jpg', 'jpg', 'image'),
(59, 31, '8c6136078a48ccb7a15bd8c7a0b60215_full.jpg', 'jpg', 'image'),
(60, 32, '080e27d511ca959539a390d765018d87_full.jpg', 'jpg', 'image'),
(61, 33, '817a36a036fd1e608cd5fbc6da46ea52_full.jpg', 'jpg', 'image'),
(62, 34, '5887bf804e1e755b415807859572fa00_full.jpg', 'jpg', 'image'),
(63, 35, '22823ad99514ac0721205acc7e74bc7b_full.jpg', 'jpg', 'image'),
(64, 36, '37745eb17a12471227b4a15e42ddb28b_full.jpg', 'jpg', 'image'),
(65, 37, '440149.jpeg', 'jpeg', 'image'),
(66, 38, '7015196d4edd30f1d4f7384cb4bdbc14_full.jpg', 'jpg', 'image'),
(67, 39, '53588082167e2a6f78c297e0000e80c8.jpg', 'jpg', 'image'),
(68, 40, '34601725257307b0440027872a8ebd19_full.jpg', 'jpg', 'image'),
(69, 41, 'a0fb4213329977923d3009571493e6d3_full.jpg', 'jpg', 'image'),
(70, 42, 'bc99b272451de172d59542c369670f41_full.jpg', 'jpg', 'image'),
(71, 43, 'c78092eed3674fafe29b8dccd81f689a_full.jpg', 'jpg', 'image'),
(72, 44, 'd191df2b83805785d96d76fb20cf997b_full.jpg', 'jpg', 'image'),
(83, 50, '440149.jpeg', 'jpeg', 'image'),
(100, 50, '2_International_Financial_Centre.jpg', 'jpg', 'image'),
(101, 50, '1a963db36c528ae3fde641122bc7a215_full.jpg', 'jpg', 'image'),
(102, 50, '5887bf804e1e755b415807859572fa00_full.jpg', 'jpg', 'image'),
(110, 45, '1a963db36c528ae3fde641122bc7a215_full.jpg', 'jpg', 'image'),
(111, 45, '6f27e803c581d0acdd8279804158d373_full.jpg', 'jpg', 'image'),
(112, 45, '37745eb17a12471227b4a15e42ddb28b_full.jpg', 'jpg', 'image'),
(114, 58, '7015196d4edd30f1d4f7384cb4bdbc14_full.jpg', 'jpg', 'image'),
(115, 58, '2_International_Financial_Centre.jpg', 'jpg', 'image'),
(116, 58, '421.gif', 'gif', 'image'),
(117, 58, '10074970_1.jpg', 'jpg', 'image'),
(118, 58, '53588082167e2a6f78c297e0000e80c8.jpg', 'jpg', 'image'),
(119, 58, '22823ad99514ac0721205acc7e74bc7b_full.jpg', 'jpg', 'image'),
(120, 58, 'eb35c96e436a8a4cc02f0c6d81239be9_full.jpg', 'jpg', 'image'),
(121, 58, 'ff52ed9d9d900b0a6852adf2653933a5_full.jpg', 'jpg', 'image'),
(122, 58, '817a36a036fd1e608cd5fbc6da46ea52_full.jpg', 'jpg', 'image'),
(123, 59, 'diesel-jeep-engine.jpg', 'jpg', 'image'),
(124, 59, 'acura_int_engine.jpeg', 'jpeg', 'image'),
(125, 59, '0606_ht_06_s+EK4+spoon_breakes.jpg', 'jpg', 'image'),
(126, 59, '0705_impp_03z+2007_tokyo_auto_salon+bmw_engine.jpg', 'jpg', 'image'),
(127, 59, 'bmw_engine_award.jpg', 'jpg', 'image'),
(128, 59, 'car-suspension-17.jpg', 'jpg', 'image'),
(129, 59, 'mercedesbenz_cclass_c350sportsedan_2008_other_engine_640x480.jpg', 'jpg', 'image'),
(130, 59, 'suspension_front.jpg', 'jpg', 'image'),
(131, 59, 'engine_cutaway.jpg', 'jpg', 'image'),
(215, 141, 'diesel-jeep-engine.jpg', 'jpg', 'image'),
(216, 142, 'diesel-jeep-engine.jpg', 'jpg', 'image'),
(218, 144, '0705_impp_03z+2007_tokyo_auto_salon+bmw_engine.jpg', 'jpg', 'image'),
(219, 145, '16.jpg', 'jpg', 'image'),
(220, 146, '17.jpg', 'jpg', 'image'),
(221, 147, '18.jpg', 'jpg', 'image'),
(223, 149, '20.jpg', 'jpg', 'image'),
(225, 151, '6f27e803c581d0acdd8279804158d373_full.jpg', 'jpg', 'image'),
(226, 152, '2_International_Financial_Centre.jpg', 'jpg', 'image'),
(227, 153, 'car-suspension-17.jpg', 'jpg', 'image'),
(228, 57, 'e272cfef8300136c20c1662754f1c8f4.jpg', 'jpg', 'image'),
(229, 45, '375.gif', 'gif', 'image'),
(230, 154, 'mercedesbenz_cclass_c350sportsedan_2008_other_engine_640x480.jpg', 'jpg', 'image'),
(232, 155, '56303394.IMG_5392.jpg', 'jpg', 'image'),
(233, 156, 'car-suspension-17.jpg', 'jpg', 'image'),
(234, 157, 'pico.jpg', 'jpg', 'image'),
(236, 159, '0705_impp_03z+2007_tokyo_auto_salon+bmw_engine.jpg', 'jpg', 'image'),
(237, 160, 'car-suspension-17.jpg', 'jpg', 'image'),
(238, 161, 'car-suspension-17.jpg', 'jpg', 'image'),
(240, 163, 'mercedesbenz_cclass_c350sportsedan_2008_other_engine_640x480.jpg', 'jpg', 'image'),
(241, 164, 'acura_int_engine.jpeg', 'jpeg', 'image'),
(242, 162, 'engine_cutaway.jpg', 'jpg', 'image'),
(243, 156, '2_International_Financial_Centre.jpg', 'jpg', 'image'),
(244, 156, '440149.jpeg', 'jpeg', 'image'),
(245, 156, '22823ad99514ac0721205acc7e74bc7b_full.jpg', 'jpg', 'image'),
(246, 156, '080e27d511ca959539a390d765018d87_full.jpg', 'jpg', 'image'),
(247, 156, '2.jpg', 'jpg', 'image'),
(248, 156, '421.gif', 'gif', 'image'),
(249, 156, '37745eb17a12471227b4a15e42ddb28b_full.jpg', 'jpg', 'image'),
(250, 156, 'bc99b272451de172d59542c369670f41_full.jpg', 'jpg', 'image'),
(251, 155, 'e272cfef8300136c20c1662754f1c8f4.jpg', 'jpg', 'image'),
(252, 155, '53588082167e2a6f78c297e0000e80c8.jpg', 'jpg', 'image'),
(253, 165, '118848.jpg', 'jpg', 'image'),
(254, 166, 'a_28ebba6a.jpg', 'jpg', 'image'),
(255, 167, '080e27d511ca959539a390d765018d87_full.jpg', 'jpg', 'image'),
(256, 158, 'testQuadrat.jpg', 'jpg', 'image'),
(257, 159, '1a963db36c528ae3fde641122bc7a215_full.jpg', 'jpg', 'image'),
(259, 158, 'pico.jpg', 'jpg', 'image'),
(260, 157, 'd191df2b83805785d96d76fb20cf997b_full.jpg', 'jpg', 'image'),
(261, 169, '1a963db36c528ae3fde641122bc7a215_full.jpg', 'jpg', 'image'),
(262, 170, '2.jpg', 'jpg', 'image'),
(263, 157, 'testQuadrat.jpg', 'jpg', 'image'),
(264, 171, 'a0fb4213329977923d3009571493e6d3_full.jpg', 'jpg', 'image'),
(265, 172, '(Ð˜Ð·Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ðµ Â«JPEGÂ», 395x381 Ð¿Ð¸ÐºÑÐµÐ»Ð¾Ð²).jpeg', 'jpeg', 'image'),
(266, 173, '118848.jpg', 'jpg', 'image'),
(267, 174, '116945.jpg', 'jpg', 'image'),
(268, 175, '4.jpg', 'jpg', 'image'),
(269, 176, '2.jpg', 'jpg', 'image'),
(275, 151, '2.jpg', 'jpg', 'image'),
(276, 151, '2.jpg', 'jpg', 'image'),
(277, 177, '1a963db36c528ae3fde641122bc7a215_full.jpg', 'jpg', 'image'),
(278, 178, '1a963db36c528ae3fde641122bc7a215_full.jpg', 'jpg', 'image'),
(279, 166, 'a_f80b0bb2.jpg', 'jpg', 'image'),
(284, 166, 'bb6ec2712ac36badd9040abe7b8b78954c-1235664628.sql.zip', 'zip', 'product'),
(285, 179, '4.jpg', 'jpg', 'image'),
(286, 179, 'a2.rar', 'rar', 'product'),
(287, 168, 'may 21, 2009 046.jpg', 'jpg', 'image'),
(288, 166, 'a_1b37a6ef.jpg', 'jpg', 'image'),
(289, 180, 'a_1b37a6ef.jpg', 'jpg', 'image'),
(290, 180, 'a_a35236f0.jpg', 'jpg', 'image'),
(291, 180, 'a_28ebba6a.jpg', 'jpg', 'image'),
(292, 180, 'a_f80b0bb2.jpg', 'jpg', 'image'),
(293, 181, '87788.gif', 'gif', 'image'),
(294, 182, '1a963db36c528ae3fde641122bc7a215_full.jpg', 'jpg', 'image'),
(295, 183, '2.jpg', 'jpg', 'image'),
(296, 183, 'a2.rar', 'rar', 'product'),
(297, 184, '2_International_Financial_Centre.jpg', 'jpg', 'image'),
(298, 185, '05_ares_s6e10.jpg', 'jpg', 'image'),
(300, 187, '080e27d511ca959539a390d765018d87_full.jpg', 'jpg', 'image'),
(301, 186, '5887bf804e1e755b415807859572fa00_full.jpg', 'jpg', 'image'),
(302, 188, '8c6136078a48ccb7a15bd8c7a0b60215_full.jpg', 'jpg', 'image'),
(303, 189, '7fff614873449c152019fb70e184c78c_full.jpg', 'jpg', 'image'),
(304, 190, '22823ad99514ac0721205acc7e74bc7b_full.jpg', 'jpg', 'image'),
(305, 191, '13100877.jpeg', 'jpeg', 'image'),
(306, 192, '56303394.IMG_5392.jpg', 'jpg', 'image'),
(307, 193, 'a0fb4213329977923d3009571493e6d3_full.jpg', 'jpg', 'image'),
(308, 194, 'c430c27c8e5739006f862c038213374a_full.jpg', 'jpg', 'image'),
(309, 195, '7015196d4edd30f1d4f7384cb4bdbc14_full.jpg', 'jpg', 'image'),
(310, 196, 'c78092eed3674fafe29b8dccd81f689a_full.jpg', 'jpg', 'image'),
(311, 196, 'eb35c96e436a8a4cc02f0c6d81239be9_full.jpg', 'jpg', 'image'),
(312, 196, 'prv_496.jpg', 'jpg', 'image'),
(313, 196, 'pico.jpg', 'jpg', 'image'),
(319, 198, '1a963db36c528ae3fde641122bc7a215_full.jpg', 'jpg', 'image'),
(320, 199, '2_International_Financial_Centre.jpg', 'jpg', 'image'),
(321, 200, '7fff614873449c152019fb70e184c78c_full.jpg', 'jpg', 'image'),
(326, 201, '2.jpg', 'jpg', 'image'),
(327, 201, '2.jpg', 'jpg', 'image'),
(328, 197, 'a_1b37a6ef.jpg', 'jpg', 'image'),
(329, 197, 'a_28ebba6a.jpg', 'jpg', 'image'),
(330, 197, 'a_a35236f0.jpg', 'jpg', 'image'),
(331, 197, 'a_e04cb721.jpg', 'jpg', 'image'),
(332, 197, 'a_f80b0bb2.jpg', 'jpg', 'image'),
(333, 197, 'a_f3dc3000.jpg', 'jpg', 'image'),
(334, 201, 'eca6c938ecd3438c7f073730ef0cc7fc_full.jpg', 'jpg', 'image'),
(335, 201, '1a963db36c528ae3fde641122bc7a215_full.jpg', 'jpg', 'image'),
(336, 201, '2.jpg', 'jpg', 'image'),
(337, 201, '8c6136078a48ccb7a15bd8c7a0b60215_full.jpg', 'jpg', 'image'),
(338, 201, '2_International_Financial_Centre.jpg', 'jpg', 'image'),
(339, 201, '22823ad99514ac0721205acc7e74bc7b_full.jpg', 'jpg', 'image'),
(341, 201, '5887bf804e1e755b415807859572fa00_full.jpg', 'jpg', 'image'),
(343, 202, '1a963db36c528ae3fde641122bc7a215_full.jpg', 'jpg', 'image'),
(344, 197, 'a_e984ab7f.jpg', 'jpg', 'image'),
(345, 203, '1a963db36c528ae3fde641122bc7a215_full.jpg', 'jpg', 'image'),
(346, 203, '2.jpg', 'jpg', 'image'),
(347, 203, '2_International_Financial_Centre.jpg', 'jpg', 'image'),
(348, 203, '6f27e803c581d0acdd8279804158d373_full.jpg', 'jpg', 'image'),
(349, 203, '5887bf804e1e755b415807859572fa00_full.jpg', 'jpg', 'image'),
(350, 203, '7fff614873449c152019fb70e184c78c_full.jpg', 'jpg', 'image'),
(351, 203, '817a36a036fd1e608cd5fbc6da46ea52_full.jpg', 'jpg', 'image'),
(352, 203, '37745eb17a12471227b4a15e42ddb28b_full.jpg', 'jpg', 'image'),
(353, 203, '13100877.jpeg', 'jpeg', 'image'),
(354, 204, '421.gif', 'gif', 'image'),
(355, 204, '1a963db36c528ae3fde641122bc7a215_full.jpg', 'jpg', 'image'),
(356, 204, '2.jpg', 'jpg', 'image'),
(357, 204, '2_International_Financial_Centre.jpg', 'jpg', 'image'),
(358, 204, '05_ares_s6e10.jpg', 'jpg', 'image'),
(359, 204, '6f27e803c581d0acdd8279804158d373_full.jpg', 'jpg', 'image'),
(360, 204, '8c6136078a48ccb7a15bd8c7a0b60215_full.jpg', 'jpg', 'image'),
(361, 204, '22823ad99514ac0721205acc7e74bc7b_full.jpg', 'jpg', 'image'),
(362, 204, '7fff614873449c152019fb70e184c78c_full.jpg', 'jpg', 'image'),
(363, 205, '2.jpg', 'jpg', 'image'),
(364, 206, '2.jpg', 'jpg', 'image'),
(365, 206, '1a963db36c528ae3fde641122bc7a215_full.jpg', 'jpg', 'image'),
(367, 207, '1a963db36c528ae3fde641122bc7a215_full.jpg', 'jpg', 'image'),
(373, 216, '2.jpg', 'jpg', 'image'),
(374, 166, 'a_e984ab7f.jpg', 'jpg', 'image'),
(375, 166, 'a_f3dc3000.jpg', 'jpg', 'image'),
(376, 166, 'a_b57e8a55.jpg', 'jpg', 'image'),
(377, 166, 'a_2776fc8f.jpg', 'jpg', 'image'),
(378, 166, 'a_7d2450dd.jpg', 'jpg', 'image'),
(379, 166, 'a_e04cb721.jpg', 'jpg', 'image'),
(380, 166, 'a_a35236f0.jpg', 'jpg', 'image'),
(381, 217, '2.jpg', 'jpg', 'image'),
(382, 218, '2.jpg', 'jpg', 'image'),
(383, 219, '2_International_Financial_Centre.jpg', 'jpg', 'image'),
(384, 220, '421.gif', 'gif', 'image'),
(385, 221, '8c6136078a48ccb7a15bd8c7a0b60215_full.jpg', 'jpg', 'image'),
(386, 222, 'da4ee0d719c9ec962484e59afc30a449_full.jpg', 'jpg', 'image'),
(387, 223, 'fc2996d01570d36bea8aabc5814ed556110482bf85861506e4af41f484778bfd.jpg', 'jpg', 'image'),
(388, 224, '05_ares_s6e10.jpg', 'jpg', 'image'),
(389, 225, 'Ð¿Ð¾Ð´Ð°Ñ€Ð¾Ðº.jpg', 'jpg', 'image'),
(390, 226, 'ÑÐ½ÐµÐ³Ð¾Ð²Ð¸Ðº.jpg', 'jpg', 'image'),
(391, 227, 'ÑÐ½ÐµÐ³.jpg', 'jpg', 'image'),
(392, 216, '1a963db36c528ae3fde641122bc7a215_full.jpg', 'jpg', 'image'),
(393, 207, '2.jpg', 'jpg', 'image');

-- --------------------------------------------------------

--
-- Структура таблицы `label`
--

DROP TABLE IF EXISTS `label`;
CREATE TABLE IF NOT EXISTS `label` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`store_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Дамп данных таблицы `label`
--

INSERT INTO `label` (`id`, `name`, `store_id`) VALUES
(12, 'Baba Tsilya', 54),
(8, 'Couchi', 37),
(6, 'D&G', 37),
(5, 'la la la ', 36),
(7, 'Prado', 37),
(10, 'test', 31),
(2, 'test', 36),
(11, 'Test Label', 53),
(4, 'testttr', 36),
(9, 'tst', 38),
(3, 'V-Label', 36);

-- --------------------------------------------------------

--
-- Структура таблицы `option`
--

DROP TABLE IF EXISTS `option`;
CREATE TABLE IF NOT EXISTS `option` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT '',
  `quantity` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `prod_id` (`product_id`),
  KEY `value` (`value`),
  KEY `name` (`name`),
  KEY `name_2` (`name`,`value`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=768 ;

--
-- Дамп данных таблицы `option`
--

INSERT INTO `option` (`id`, `product_id`, `name`, `value`, `quantity`) VALUES
(272, 26, 'Size', '', 10),
(273, 26, 'ÑÑ‡Ð¼', '', 0),
(274, 26, 'dsfgdf', '', 0),
(275, 27, 'Size', '', 0),
(276, 28, 'Size', '', 0),
(277, 29, 'Size', '', 0),
(278, 30, 'Size', '', 0),
(279, 31, 'Size', '', 0),
(280, 32, 'Size', '', 0),
(281, 33, 'Size', '', 0),
(282, 34, 'Size', '', 0),
(283, 35, 'Size', '', 0),
(284, 36, 'Size', '', 0),
(285, 37, 'Size', '', 0),
(286, 38, 'Size', '', 0),
(287, 39, 'Size', '', 0),
(288, 40, 'Size', '', 0),
(289, 41, 'Size', '', 0),
(440, 50, 'Size', '', 0),
(557, 42, 'Size', '', 0),
(561, 45, 'Size', '', 0),
(562, 44, 'Size', '', 0),
(564, 43, 'Size', '', 0),
(571, 57, 'Size', '', 0),
(572, 58, 'Size', '', 0),
(573, 59, 'ssss', '', 0),
(654, 141, 'Size', '', 0),
(655, 142, 'Size', '', 0),
(657, 144, 'Size', '', 0),
(658, 144, 'color', '', 0),
(659, 145, 'Size', '', 0),
(660, 146, 'Size', '', 0),
(661, 147, 'Size', '', 0),
(663, 149, 'Size', '', 0),
(665, 151, 'Size', '', 0),
(666, 152, 'Size', '', 0),
(667, 153, 'Size', '', 0),
(668, 154, 'Size', '', 0),
(669, 155, 'Size', '', 0),
(670, 156, 'Size', '', 0),
(671, 157, 'Size', '', 0),
(672, 158, 'Size', '', 0),
(673, 159, 'Size', '', 0),
(674, 160, 'Size', '', 0),
(675, 161, 'Size', '', 0),
(676, 162, 'Size', '', 0),
(677, 163, 'Size', '', 0),
(678, 164, 'Size', '', 0),
(679, 165, 'Size', '', 0),
(680, 166, 'Size', '', 0),
(681, 167, 'Size', '', 0),
(682, 168, 'Size', '', 0),
(683, 169, 'Size', '', 0),
(684, 170, 'Size', '', 0),
(685, 171, 'Size', '', 0),
(686, 172, 'Size', '', 0),
(687, 173, 'Size', '', 0),
(688, 174, 'Size', '', 0),
(689, 175, 'Size', '', 0),
(690, 176, 'Size', '', 0),
(691, 177, 'Size', '', 0),
(693, 177, 'test', '', 0),
(694, 178, 'Size', '', 0),
(695, 178, 'Color', '', 0),
(696, 179, 'Size', '', 0),
(698, 180, 'Size', '', 0),
(699, 181, 'Size', '', 0),
(700, 182, 'Size', '', 0),
(701, 183, 'Size', '', 0),
(702, 184, 'Size', '', 0),
(703, 185, 'Size', '', 0),
(704, 186, 'Size', '', 0),
(705, 187, 'Size', '', 0),
(706, 188, 'Size', '', 0),
(707, 189, 'Size', '', 0),
(708, 190, 'Size', '', 0),
(709, 191, 'Size', '', 0),
(710, 192, 'Size', '', 0),
(711, 193, 'Size', '', 0),
(712, 194, 'Size', '', 0),
(713, 195, 'Size', '', 0),
(714, 196, 'Size', '', 0),
(715, 197, 'Size', '', 0),
(716, 198, 'Size', '', 0),
(717, 199, 'Size', '', 0),
(718, 200, 'Size', '', 0),
(719, 201, 'Size', '', 0),
(720, 202, 'Size', '', 0),
(721, 203, 'Size', '', 0),
(722, 203, 'Color', '', 0),
(723, 204, 'Size', '', 0),
(724, 204, 'Color', '', 0),
(725, 205, 'Size', '', 0),
(726, 205, 'Color', '', 0),
(727, 206, 'Size', '', 0),
(728, 206, 'Color', '', 0),
(731, 207, 'Size', '', 0),
(732, 207, 'Color', '', 0),
(749, 216, 'Size', '', 0),
(750, 216, 'Color', '', 0),
(751, 217, 'Size', '', 0),
(752, 217, 'Color', '', 0),
(753, 218, 'Size', '', 0),
(754, 218, 'test', '', 0),
(755, 219, 'Size', '', 0),
(756, 220, 'Size', '', 0),
(757, 221, 'Size', '', 0),
(758, 222, 'Size', '', 0),
(759, 223, 'Size', '', 0),
(760, 224, 'Size', '', 0),
(761, 224, 'Color', '', 0),
(762, 225, 'Size', '', 0),
(763, 225, 'Color', '', 0),
(764, 226, 'Size', '', 0),
(765, 226, 'Color', '', 0),
(766, 227, 'Size', '', 0),
(767, 227, 'Color', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL,
  `status` enum('pending','processing','delivered','canceled') NOT NULL DEFAULT 'pending',
  `products_price` float(10,2) unsigned NOT NULL,
  `shipping_price` float(10,2) unsigned NOT NULL,
  `income_price` float(10,2) unsigned NOT NULL,
  `factor_income` float(10,2) unsigned NOT NULL,
  `shipping_info` text NOT NULL COMMENT 'serialize array',
  `transaction_id` varchar(17) NOT NULL COMMENT 'PayPal Transaction ID',
  `last_modified` datetime NOT NULL,
  `date_purchased` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `status` (`status`),
  KEY `products_price` (`products_price`),
  KEY `shipping_price` (`shipping_price`),
  KEY `income_price` (`income_price`),
  KEY `factor_income` (`factor_income`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `store_id`, `status`, `products_price`, `shipping_price`, `income_price`, `factor_income`, `shipping_info`, `transaction_id`, `last_modified`, `date_purchased`) VALUES
(1, 13, 'pending', 86.00, 78.72, 0.00, 0.00, 'a:4:{s:6:"custom";a:8:{s:9:"full_name";s:16:"Vladimir Sokolov";s:13:"address_line1";s:13:"Address Line1";s:13:"address_line2";s:0:"";s:4:"city";s:7:"Cordova";s:5:"state";s:2:"CA";s:6:"postal";s:5:"38016";s:7:"country";s:2:"US";s:5:"phone";s:10:"3212245654";}s:2:"no";a:3:{s:9:"full_name";s:6:"Tester";s:5:"email";s:14:"vova@gmail.com";s:5:"phone";s:10:"3212245654";}s:5:"fedex";a:2:{s:11:"ServiceType";s:12:"FEDEX_GROUND";s:11:"Destination";a:7:{s:9:"full_name";s:16:"Vladimir Sokolov";s:11:"StreetLines";a:2:{i:0;s:13:"Address Line1";i:1;s:0:"";}s:4:"City";s:7:"Herndon";s:19:"StateOrProvinceCode";s:2:"VA";s:10:"PostalCode";s:5:"20171";s:11:"CountryCode";s:2:"US";s:5:"phone";s:10:"3212245654";}}s:3:"ups";a:10:{s:10:"13_product";s:3:"3DS";s:9:"full_name";s:16:"Vladimir Sokolov";s:13:"address_line1";s:13:"Address Line1";s:13:"address_line2";s:0:"";s:11:"20_destCity";s:7:"Herndon";s:5:"state";s:2:"VA";s:13:"19_destPostal";s:5:"20171";s:14:"22_destCountry";s:2:"US";s:5:"phone";s:10:"3212245654";s:14:"49_residential";s:2:"01";}}', '61V65648SH567732F', '2008-08-07 14:43:19', '2008-08-07 14:43:19'),
(2, 13, 'pending', 86.00, 78.72, 0.00, 0.00, 'a:4:{s:6:"custom";a:8:{s:9:"full_name";s:16:"Vladimir Sokolov";s:13:"address_line1";s:13:"Address Line1";s:13:"address_line2";s:0:"";s:4:"city";s:7:"Cordova";s:5:"state";s:2:"CA";s:6:"postal";s:5:"38016";s:7:"country";s:2:"US";s:5:"phone";s:10:"3212245654";}s:2:"no";a:3:{s:9:"full_name";s:6:"Tester";s:5:"email";s:14:"vova@gmail.com";s:5:"phone";s:10:"3212245654";}s:5:"fedex";a:2:{s:11:"ServiceType";s:12:"FEDEX_GROUND";s:11:"Destination";a:7:{s:9:"full_name";s:16:"Vladimir Sokolov";s:11:"StreetLines";a:2:{i:0;s:13:"Address Line1";i:1;s:0:"";}s:4:"City";s:7:"Herndon";s:19:"StateOrProvinceCode";s:2:"VA";s:10:"PostalCode";s:5:"20171";s:11:"CountryCode";s:2:"US";s:5:"phone";s:10:"3212245654";}}s:3:"ups";a:10:{s:10:"13_product";s:3:"3DS";s:9:"full_name";s:16:"Vladimir Sokolov";s:13:"address_line1";s:13:"Address Line1";s:13:"address_line2";s:0:"";s:11:"20_destCity";s:7:"Herndon";s:5:"state";s:2:"VA";s:13:"19_destPostal";s:5:"20171";s:14:"22_destCountry";s:2:"US";s:5:"phone";s:10:"3212245654";s:14:"49_residential";s:2:"01";}}', '6SJ87784U5149314W', '2008-08-07 14:44:04', '2008-08-07 14:44:04'),
(3, 13, 'pending', 86.00, 78.72, 0.00, 0.00, 'a:4:{s:6:"custom";a:8:{s:9:"full_name";s:16:"Vladimir Sokolov";s:13:"address_line1";s:13:"Address Line1";s:13:"address_line2";s:0:"";s:4:"city";s:7:"Cordova";s:5:"state";s:2:"CA";s:6:"postal";s:5:"38016";s:7:"country";s:2:"US";s:5:"phone";s:10:"3212245654";}s:2:"no";a:3:{s:9:"full_name";s:6:"Tester";s:5:"email";s:14:"vova@gmail.com";s:5:"phone";s:10:"3212245654";}s:5:"fedex";a:2:{s:11:"ServiceType";s:12:"FEDEX_GROUND";s:11:"Destination";a:7:{s:9:"full_name";s:16:"Vladimir Sokolov";s:11:"StreetLines";a:2:{i:0;s:13:"Address Line1";i:1;s:0:"";}s:4:"City";s:7:"Herndon";s:19:"StateOrProvinceCode";s:2:"VA";s:10:"PostalCode";s:5:"20171";s:11:"CountryCode";s:2:"US";s:5:"phone";s:10:"3212245654";}}s:3:"ups";a:10:{s:10:"13_product";s:3:"3DS";s:9:"full_name";s:16:"Vladimir Sokolov";s:13:"address_line1";s:13:"Address Line1";s:13:"address_line2";s:0:"";s:11:"20_destCity";s:7:"Herndon";s:5:"state";s:2:"VA";s:13:"19_destPostal";s:5:"20171";s:14:"22_destCountry";s:2:"US";s:5:"phone";s:10:"3212245654";s:14:"49_residential";s:2:"01";}}', '98036467BA077594A', '2008-08-07 14:53:53', '2008-08-07 14:53:53'),
(4, 13, 'pending', 86.00, 78.72, 0.00, 0.00, 'a:4:{s:6:"custom";a:8:{s:9:"full_name";s:16:"Vladimir Sokolov";s:13:"address_line1";s:13:"Address Line1";s:13:"address_line2";s:0:"";s:4:"city";s:7:"Cordova";s:5:"state";s:2:"CA";s:6:"postal";s:5:"38016";s:7:"country";s:2:"US";s:5:"phone";s:10:"3212245654";}s:2:"no";a:3:{s:9:"full_name";s:6:"Tester";s:5:"email";s:14:"vova@gmail.com";s:5:"phone";s:10:"3212245654";}s:5:"fedex";a:2:{s:11:"ServiceType";s:12:"FEDEX_GROUND";s:11:"Destination";a:7:{s:9:"full_name";s:16:"Vladimir Sokolov";s:11:"StreetLines";a:2:{i:0;s:13:"Address Line1";i:1;s:0:"";}s:4:"City";s:7:"Herndon";s:19:"StateOrProvinceCode";s:2:"VA";s:10:"PostalCode";s:5:"20171";s:11:"CountryCode";s:2:"US";s:5:"phone";s:10:"3212245654";}}s:3:"ups";a:10:{s:10:"13_product";s:3:"3DS";s:9:"full_name";s:16:"Vladimir Sokolov";s:13:"address_line1";s:13:"Address Line1";s:13:"address_line2";s:0:"";s:11:"20_destCity";s:7:"Herndon";s:5:"state";s:2:"VA";s:13:"19_destPostal";s:5:"20171";s:14:"22_destCountry";s:2:"US";s:5:"phone";s:10:"3212245654";s:14:"49_residential";s:2:"01";}}', '5PU41024L1715184G', '2008-08-07 14:56:08', '2008-08-07 14:56:08'),
(5, 13, 'pending', 86.00, 78.72, 0.00, 0.00, 'a:4:{s:6:"custom";a:8:{s:9:"full_name";s:16:"Vladimir Sokolov";s:13:"address_line1";s:13:"Address Line1";s:13:"address_line2";s:0:"";s:4:"city";s:7:"Cordova";s:5:"state";s:2:"CA";s:6:"postal";s:5:"38016";s:7:"country";s:2:"US";s:5:"phone";s:10:"3212245654";}s:2:"no";a:3:{s:9:"full_name";s:6:"Tester";s:5:"email";s:14:"vova@gmail.com";s:5:"phone";s:10:"3212245654";}s:5:"fedex";a:2:{s:11:"ServiceType";s:12:"FEDEX_GROUND";s:11:"Destination";a:7:{s:9:"full_name";s:16:"Vladimir Sokolov";s:11:"StreetLines";a:2:{i:0;s:13:"Address Line1";i:1;s:0:"";}s:4:"City";s:7:"Herndon";s:19:"StateOrProvinceCode";s:2:"VA";s:10:"PostalCode";s:5:"20171";s:11:"CountryCode";s:2:"US";s:5:"phone";s:10:"3212245654";}}s:3:"ups";a:10:{s:10:"13_product";s:3:"3DS";s:9:"full_name";s:16:"Vladimir Sokolov";s:13:"address_line1";s:13:"Address Line1";s:13:"address_line2";s:0:"";s:11:"20_destCity";s:7:"Herndon";s:5:"state";s:2:"VA";s:13:"19_destPostal";s:5:"20171";s:14:"22_destCountry";s:2:"US";s:5:"phone";s:10:"3212245654";s:14:"49_residential";s:2:"01";}}', '9TK50429MJ045884C', '2008-08-07 15:03:30', '2008-08-07 15:03:30'),
(6, 13, 'pending', 20.00, 5.01, 0.00, 0.00, 'a:1:{s:6:"custom";a:8:{s:9:"full_name";s:16:"Vladimir Sokolov";s:13:"address_line1";s:13:"Address Line1";s:13:"address_line2";s:0:"";s:4:"city";s:7:"Cordova";s:5:"state";s:2:"CA";s:6:"postal";s:5:"38016";s:7:"country";s:2:"US";s:5:"phone";s:10:"3212245654";}}', '8JU55757R87702051', '2008-08-07 15:06:22', '2008-08-07 15:06:22'),
(7, 13, 'pending', 39.00, 12.34, 0.00, 0.00, 'a:2:{s:6:"custom";a:8:{s:9:"full_name";s:16:"Vladimir Sokolov";s:13:"address_line1";s:13:"Address Line1";s:13:"address_line2";s:0:"";s:4:"city";s:7:"Cordova";s:5:"state";s:2:"CA";s:6:"postal";s:5:"38016";s:7:"country";s:2:"US";s:5:"phone";s:10:"3212245654";}s:5:"fedex";a:2:{s:11:"ServiceType";s:12:"FEDEX_GROUND";s:11:"Destination";a:7:{s:9:"full_name";s:15:"Herndon Herndon";s:11:"StreetLines";a:2:{i:0;s:7:"Herndon";i:1;s:0:"";}s:4:"City";s:7:"Herndon";s:19:"StateOrProvinceCode";s:2:"VA";s:10:"PostalCode";s:5:"20171";s:11:"CountryCode";s:2:"US";s:5:"phone";s:4:"3577";}}}', '68R95392E2471125C', '2008-08-08 10:05:45', '2008-08-08 10:05:45'),
(8, 13, 'pending', 57.00, 10.02, 0.00, 0.00, 'a:2:{s:2:"no";a:3:{s:9:"full_name";s:12:"Vova Sokolov";s:5:"email";s:18:"vovov@assdfsd.dfgd";s:5:"phone";s:6:"322232";}s:6:"custom";a:8:{s:9:"full_name";s:4:"Vova";s:13:"address_line1";s:6:"Test 1";s:13:"address_line2";s:0:"";s:4:"city";s:8:"Nikolaev";s:5:"state";s:8:"Nikolaev";s:6:"postal";s:5:"54020";s:7:"country";s:2:"UA";s:5:"phone";s:8:"32222385";}}', '4U189106UM0554623', '2008-08-08 10:18:55', '2008-08-08 10:18:55'),
(9, 13, 'pending', 40.00, 10.02, 0.00, 0.00, 'a:1:{s:6:"custom";a:8:{s:9:"full_name";s:4:"Vova";s:13:"address_line1";s:6:"Test 1";s:13:"address_line2";s:0:"";s:4:"city";s:8:"Nikolaev";s:5:"state";s:8:"Nikolaev";s:6:"postal";s:5:"54020";s:7:"country";s:2:"UA";s:5:"phone";s:8:"32222385";}}', '3CM02281U88269344', '2008-08-08 14:46:58', '2008-08-08 14:46:58'),
(10, 13, 'pending', 20.00, 5.01, 0.00, 0.00, 'a:1:{s:6:"custom";a:8:{s:9:"full_name";s:4:"Vova";s:13:"address_line1";s:6:"Test 1";s:13:"address_line2";s:0:"";s:4:"city";s:8:"Nikolaev";s:5:"state";s:8:"Nikolaev";s:6:"postal";s:5:"54020";s:7:"country";s:2:"UA";s:5:"phone";s:8:"32222385";}}', '4WP614621E5671632', '2008-08-08 15:06:12', '2008-08-08 15:06:12'),
(11, 13, 'pending', 20.00, 5.01, 0.00, 0.00, 'a:1:{s:6:"custom";a:8:{s:9:"full_name";s:4:"Vova";s:13:"address_line1";s:6:"Test 1";s:13:"address_line2";s:0:"";s:4:"city";s:8:"Nikolaev";s:5:"state";s:8:"Nikolaev";s:6:"postal";s:5:"54020";s:7:"country";s:2:"UA";s:5:"phone";s:8:"32222385";}}', '48718368MX847392S', '2008-08-08 15:07:05', '2008-08-08 15:07:05'),
(12, 13, 'pending', 59.00, 17.35, 0.00, 0.00, 'a:2:{s:6:"custom";a:8:{s:9:"full_name";s:4:"Vova";s:13:"address_line1";s:6:"Test 1";s:13:"address_line2";s:0:"";s:4:"city";s:8:"Nikolaev";s:5:"state";s:8:"Nikolaev";s:6:"postal";s:5:"54020";s:7:"country";s:2:"UA";s:5:"phone";s:8:"32222385";}s:5:"fedex";a:2:{s:11:"ServiceType";s:12:"FEDEX_GROUND";s:11:"Destination";a:7:{s:9:"full_name";s:12:"Vova Sokolov";s:11:"StreetLines";a:2:{i:0;s:7:"Sokolov";i:1;s:0:"";}s:4:"City";s:7:"Herndon";s:19:"StateOrProvinceCode";s:2:"VA";s:10:"PostalCode";s:5:"20171";s:11:"CountryCode";s:2:"US";s:5:"phone";s:9:"322332423";}}}', '3E978218CH2260704', '2008-08-08 17:43:49', '2008-08-08 17:43:49'),
(13, 13, 'pending', 57.00, 283.78, 78.72, 0.00, 'a:3:{s:6:"custom";a:8:{s:9:"full_name";s:4:"Vova";s:13:"address_line1";s:6:"Test 1";s:13:"address_line2";s:0:"";s:4:"city";s:8:"Nikolaev";s:5:"state";s:8:"Nikolaev";s:6:"postal";s:5:"54020";s:7:"country";s:2:"UA";s:5:"phone";s:8:"32222385";}s:5:"fedex";a:2:{s:11:"ServiceType";s:12:"FEDEX_GROUND";s:11:"Destination";a:7:{s:9:"full_name";s:12:"Vova Sokolov";s:11:"StreetLines";a:2:{i:0;s:7:"Sokolov";i:1;s:0:"";}s:4:"City";s:7:"Herndon";s:19:"StateOrProvinceCode";s:2:"VA";s:10:"PostalCode";s:5:"20171";s:11:"CountryCode";s:2:"US";s:5:"phone";s:9:"322332423";}}s:3:"ups";a:10:{s:10:"13_product";s:3:"3DS";s:9:"full_name";s:12:"Vova Sokolov";s:13:"address_line1";s:7:"Sokolov";s:13:"address_line2";s:0:"";s:11:"20_destCity";s:7:"Herndon";s:5:"state";s:2:"VA";s:13:"19_destPostal";s:5:"20171";s:14:"22_destCountry";s:2:"US";s:5:"phone";s:9:"322332423";s:14:"49_residential";s:2:"02";}}', '0K005249NU520903V', '2008-08-28 17:47:20', '2008-08-28 17:47:20'),
(14, 13, 'pending', 20.00, 99.57, 5.01, 0.00, 'a:1:{s:6:"custom";a:8:{s:9:"full_name";s:4:"Vova";s:13:"address_line1";s:6:"Test 1";s:13:"address_line2";s:0:"";s:4:"city";s:8:"Nikolaev";s:5:"state";s:8:"Nikolaev";s:6:"postal";s:5:"54020";s:7:"country";s:2:"UA";s:5:"phone";s:8:"32222385";}}', '7EA54477AK852611S', '2008-08-28 17:52:02', '2008-08-28 17:52:02'),
(15, 13, 'pending', 20.00, 5.01, 1.00, 0.00, 'a:1:{s:6:"custom";a:8:{s:9:"full_name";s:4:"Vova";s:13:"address_line1";s:6:"Test 1";s:13:"address_line2";s:0:"";s:4:"city";s:8:"Nikolaev";s:5:"state";s:8:"Nikolaev";s:6:"postal";s:5:"54020";s:7:"country";s:2:"UA";s:5:"phone";s:8:"32222385";}}', '9JG02612ND229923T', '2008-08-28 17:55:33', '2008-08-28 17:55:33'),
(16, 13, 'pending', 17.00, 0.00, 0.55, 0.00, 'a:1:{s:2:"no";a:3:{s:9:"full_name";s:6:"dasfgd";s:5:"email";s:13:"sdgfd@sdfs.df";s:5:"phone";s:7:"2467545";}}', '', '2008-08-29 11:22:48', '2008-08-29 11:22:48'),
(17, 13, 'pending', 74.00, 38.21, 70.02, 0.00, 'a:10:{s:12:"service_type";s:1:"3";s:9:"full_name";s:12:"Vova Sokolov";s:13:"address_line1";s:11:"Lyagina, 37";s:13:"address_line2";s:0:"";s:4:"city";s:7:"Herndon";s:5:"state";s:2:"VA";s:6:"postal";s:5:"20171";s:7:"country";s:2:"US";s:5:"email";s:13:"vova@mail.com";s:5:"phone";s:8:"32222334";}', '98P27679GD887203T', '2008-09-08 16:05:14', '2008-09-08 16:05:14'),
(18, 13, 'pending', 17.00, 0.00, 15.87, 0.00, 'a:3:{s:9:"full_name";s:12:"Vova Sokolov";s:5:"email";s:18:"vladimir@skaya.net";s:5:"phone";s:6:"222322";}', '1Y370226VU954372W', '2008-09-24 12:04:23', '2008-09-24 12:04:23'),
(19, 13, 'pending', 60.00, 22.77, 56.76, 0.00, 'a:8:{s:9:"full_name";s:12:"Vova Sokolov";s:13:"address_line1";s:4:"fgdf";s:13:"address_line2";s:5:"sdfsd";s:4:"city";s:5:"sdfsd";s:5:"state";s:2:"VD";s:6:"postal";s:5:"23466";s:7:"country";s:2:"US";s:5:"phone";s:6:"222322";}', '90M78048FS621791Y', '2008-09-25 17:28:50', '2008-09-25 17:28:50'),
(20, 13, 'pending', 39.00, 5.01, 0.00, 1.76, 'a:9:{s:9:"full_name";s:6:"sdfasd";s:13:"address_line1";s:3:"sfs";s:13:"address_line2";s:7:"sadfasd";s:4:"city";s:7:"Herndon";s:5:"state";s:2:"VA";s:6:"postal";s:5:"20171";s:7:"country";s:2:"US";s:5:"email";s:15:"dsfsd@dsfsd.net";s:5:"phone";s:9:"155456452";}', '9RU0665789350933T', '2008-10-03 10:50:16', '2008-10-03 10:50:16'),
(21, 13, 'pending', 39.00, 5.01, 39.86, 1.78, 'a:9:{s:9:"full_name";s:6:"sdfasd";s:13:"address_line1";s:26:"Destination Address Line 1";s:13:"address_line2";s:0:"";s:4:"city";s:7:"Herndon";s:5:"state";s:2:"VA";s:6:"postal";s:5:"20171";s:7:"country";s:2:"US";s:5:"email";s:15:"dsfsd@dsfsd.net";s:5:"phone";s:9:"155456452";}', '3J281216SK8246742', '2008-10-03 12:12:32', '2008-10-03 12:12:32'),
(22, 13, 'pending', 116.00, 10.00, 114.67, 5.09, 'a:9:{s:9:"full_name";s:12:"Vova Sokolov";s:13:"address_line1";s:4:"afsd";s:13:"address_line2";s:7:"sdfsfds";s:4:"city";s:6:"Hrerdf";s:5:"state";s:3:"sdf";s:6:"postal";s:5:"52145";s:7:"country";s:2:"US";s:5:"email";s:16:"sdfgsdf@sdfs.sdf";s:5:"phone";s:9:"155456452";}', '4TS06366WV8666428', '2008-10-13 15:49:28', '2008-10-13 15:49:28'),
(23, 13, 'pending', 10.00, 100.00, 100.07, 4.44, 'a:8:{s:9:"full_name";s:12:"Vova Sokolov";s:13:"address_line1";s:4:"afsd";s:13:"address_line2";s:7:"sdfsfds";s:4:"city";s:6:"Hrerdf";s:5:"state";s:3:"sdf";s:6:"postal";s:5:"52145";s:7:"country";s:2:"US";s:5:"phone";s:9:"155456452";}', '0A1656145U253794X', '2008-10-13 17:28:22', '2008-10-13 17:28:22'),
(24, 13, 'pending', 10.00, 300.00, 282.54, 12.52, 'a:8:{s:9:"full_name";s:14:"safsdg dfgsdgd";s:13:"address_line1";s:5:"fgsdf";s:13:"address_line2";s:5:"fgsdf";s:4:"city";s:5:"fgsdf";s:5:"state";s:5:"fgsdf";s:6:"postal";s:5:"12345";s:7:"country";s:2:"US";s:5:"phone";s:6:"123456";}', '22L13725K7521340M', '2008-10-20 12:48:45', '2008-10-20 12:48:45'),
(25, 13, 'pending', 10.00, 300.00, 282.54, 12.52, 'a:8:{s:9:"full_name";s:14:"safsdg dfgsdgd";s:13:"address_line1";s:5:"fgsdf";s:13:"address_line2";s:5:"fgsdf";s:4:"city";s:5:"fgsdf";s:5:"state";s:5:"fgsdf";s:6:"postal";s:5:"12345";s:7:"country";s:2:"US";s:5:"phone";s:6:"123456";}', '3NC22403GN000200R', '2008-10-20 13:07:54', '2008-10-20 13:07:54'),
(26, 13, 'pending', 10.00, 300.00, 282.54, 12.52, 'a:8:{s:9:"full_name";s:5:"ergre";s:13:"address_line1";s:5:"errgr";s:13:"address_line2";s:5:"gergr";s:4:"city";s:6:"ertrty";s:5:"state";s:2:"va";s:6:"postal";s:5:"23543";s:7:"country";s:2:"US";s:5:"phone";s:10:"2357657867";}', '4CA61395DU915712T', '2008-10-20 15:41:51', '2008-10-20 15:41:51'),
(27, 13, 'pending', 10.00, 300.00, 282.54, 12.52, 'a:8:{s:9:"full_name";s:5:"ergre";s:13:"address_line1";s:5:"errgr";s:13:"address_line2";s:5:"gergr";s:4:"city";s:6:"ertrty";s:5:"state";s:2:"va";s:6:"postal";s:5:"23543";s:7:"country";s:2:"US";s:5:"phone";s:10:"2357657867";}', '90T30637LU541192A', '2008-10-20 16:12:08', '2008-10-20 16:12:08'),
(28, 13, 'pending', 10.00, 300.00, 282.54, 12.52, 'a:8:{s:9:"full_name";s:5:"ergre";s:13:"address_line1";s:5:"errgr";s:13:"address_line2";s:5:"gergr";s:4:"city";s:6:"ertrty";s:5:"state";s:2:"va";s:6:"postal";s:5:"23543";s:7:"country";s:2:"US";s:5:"phone";s:10:"2357657867";}', '4F4666444L033690U', '2008-10-20 16:21:54', '2008-10-20 16:21:54'),
(30, 13, 'pending', 40.00, 18.52, 53.10, 2.36, 'a:8:{s:9:"full_name";s:5:"ergre";s:13:"address_line1";s:5:"errgr";s:13:"address_line2";s:5:"gergr";s:4:"city";s:6:"ertrty";s:5:"state";s:2:"va";s:6:"postal";s:5:"23543";s:7:"country";s:2:"US";s:5:"phone";s:10:"2357657867";}', '2DN46021WK8088440', '2008-10-21 10:12:56', '2008-10-21 10:12:56'),
(31, 13, 'pending', 3000.00, 730.00, 3402.88, 150.59, 'a:8:{s:9:"full_name";s:5:"ergre";s:13:"address_line1";s:5:"errgr";s:13:"address_line2";s:5:"gergr";s:4:"city";s:6:"ertrty";s:5:"state";s:2:"va";s:6:"postal";s:5:"23543";s:7:"country";s:2:"US";s:5:"phone";s:10:"2357657867";}', '6B625982GR6027104', '2008-10-21 12:21:57', '2008-10-21 12:21:57'),
(32, 13, 'pending', 300.00, 10.00, 282.54, 12.52, 'a:8:{s:9:"full_name";s:5:"ergre";s:13:"address_line1";s:5:"errgr";s:13:"address_line2";s:5:"gergr";s:4:"city";s:6:"ertrty";s:5:"state";s:2:"va";s:6:"postal";s:5:"23543";s:7:"country";s:2:"US";s:5:"phone";s:10:"2357657867";}', '0F579861GX0873312', '2008-10-21 16:48:27', '2008-10-21 16:48:27'),
(33, 13, 'pending', 300.00, 10.00, 282.54, 12.52, 'a:8:{s:9:"full_name";s:5:"ergre";s:13:"address_line1";s:5:"errgr";s:13:"address_line2";s:5:"gergr";s:4:"city";s:6:"ertrty";s:5:"state";s:2:"va";s:6:"postal";s:5:"23543";s:7:"country";s:2:"US";s:5:"phone";s:10:"2357657867";}', '01U510679H857554L', '2008-10-21 16:51:08', '2008-10-21 16:51:08'),
(34, 13, 'pending', 300.00, 10.00, 282.54, 12.52, 'a:8:{s:9:"full_name";s:5:"ergre";s:13:"address_line1";s:5:"errgr";s:13:"address_line2";s:5:"gergr";s:4:"city";s:6:"ertrty";s:5:"state";s:2:"va";s:6:"postal";s:5:"23543";s:7:"country";s:2:"US";s:5:"phone";s:10:"2357657867";}', '74T14567J6226125K', '2008-10-21 17:16:30', '2008-10-21 17:16:30'),
(35, 13, 'pending', 345.00, 0.00, 314.48, 13.93, 'a:3:{s:9:"full_name";s:5:"ergre";s:5:"email";s:16:"sdsdf@sdfsdf.dsf";s:5:"phone";s:10:"2357657867";}', '7D5673442E0234839', '2008-10-21 17:23:43', '2008-10-21 17:23:43'),
(36, 13, 'pending', 345.00, 0.00, 314.48, 13.93, 'a:3:{s:9:"full_name";s:5:"ergre";s:5:"email";s:16:"sdsdf@sdfsdf.dsf";s:5:"phone";s:10:"2357657867";}', '8R278198A3185325S', '2008-10-21 17:53:21', '2008-10-21 17:53:21'),
(37, 13, 'pending', 300.00, 10.00, 282.54, 12.52, 'a:8:{s:9:"full_name";s:5:"ergre";s:13:"address_line1";s:5:"asdfs";s:13:"address_line2";s:5:"sdfsd";s:4:"city";s:6:"sdfasd";s:5:"state";s:6:"sdfasd";s:6:"postal";s:4:"sdfs";s:7:"country";s:2:"US";s:5:"phone";s:10:"2357657867";}', '7UR90711GC653174L', '2008-10-21 18:04:48', '2008-10-21 18:04:48'),
(38, 13, 'pending', 300.00, 10.00, 282.54, 12.52, 'a:8:{s:9:"full_name";s:5:"ergre";s:13:"address_line1";s:5:"asdfs";s:13:"address_line2";s:5:"sdfsd";s:4:"city";s:6:"sdfasd";s:5:"state";s:6:"sdfasd";s:6:"postal";s:4:"sdfs";s:7:"country";s:2:"US";s:5:"phone";s:10:"2357657867";}', '94K20143U0787871P', '2008-10-21 18:11:30', '2008-10-21 18:11:30'),
(39, 13, 'pending', 300.00, 10.00, 282.54, 12.52, 'a:8:{s:9:"full_name";s:5:"ergre";s:13:"address_line1";s:5:"asdfs";s:13:"address_line2";s:5:"sdfsd";s:4:"city";s:6:"sdfasd";s:5:"state";s:6:"sdfasd";s:6:"postal";s:4:"sdfs";s:7:"country";s:2:"US";s:5:"phone";s:10:"2357657867";}', '42610396VS052483J', '2008-10-22 09:49:08', '2008-10-22 09:49:08'),
(40, 13, 'pending', 300.00, 10.00, 282.54, 12.52, 'a:8:{s:9:"full_name";s:5:"ergre";s:13:"address_line1";s:5:"asdfs";s:13:"address_line2";s:5:"sdfsd";s:4:"city";s:6:"sdfasd";s:5:"state";s:6:"sdfasd";s:6:"postal";s:4:"sdfs";s:7:"country";s:2:"US";s:5:"phone";s:10:"2357657867";}', '5W2787082D289882E', '2008-10-22 10:17:18', '2008-10-22 10:17:18'),
(41, 13, 'pending', 645.00, 10.00, 597.31, 26.44, 'a:9:{s:9:"full_name";s:6:"Vova S";s:13:"address_line1";s:5:"asdfs";s:13:"address_line2";s:5:"sdfsd";s:4:"city";s:6:"sdfasd";s:5:"state";s:6:"sdfasd";s:6:"postal";s:4:"sdfs";s:7:"country";s:2:"US";s:5:"email";s:16:"vova@sokolov.com";s:5:"phone";s:10:"2357657867";}', '1KS69263U3780743H', '2008-10-22 11:43:43', '2008-10-22 11:43:43'),
(42, 13, 'pending', 645.00, 10.00, 597.31, 26.44, 'a:9:{s:9:"full_name";s:6:"Vova S";s:13:"address_line1";s:11:"123 Fake St";s:13:"address_line2";s:0:"";s:4:"city";s:8:"San Jose";s:5:"state";s:2:"CA";s:6:"postal";s:5:"95131";s:7:"country";s:2:"US";s:5:"email";s:16:"vova@sokolov.com";s:5:"phone";s:10:"2357657867";}', '46458108KX150790E', '2008-10-22 11:57:30', '2008-10-22 11:57:30'),
(43, 13, 'pending', 20.00, 5.01, 22.52, 1.01, 'a:8:{s:9:"full_name";s:6:"Vova S";s:13:"address_line1";s:11:"123 Fake St";s:13:"address_line2";s:0:"";s:4:"city";s:8:"San Jose";s:5:"state";s:2:"CA";s:6:"postal";s:5:"95131";s:7:"country";s:2:"US";s:5:"phone";s:10:"2357657867";}', '9JM365156G742890L', '2008-10-22 12:01:40', '2008-10-22 12:01:40'),
(44, 13, 'delivered', 75.00, 5.01, 72.71, 3.23, 'a:8:{s:9:"full_name";s:6:"Vova S";s:13:"address_line1";s:11:"123 Fake St";s:13:"address_line2";s:0:"";s:4:"city";s:8:"San Jose";s:5:"state";s:2:"CA";s:6:"postal";s:5:"95131";s:7:"country";s:2:"US";s:5:"phone";s:10:"2357657867";}', '00V36850KX062015D', '2008-10-23 09:50:56', '2008-10-23 09:50:56'),
(45, 13, 'pending', 50.00, 5.01, 49.90, 2.22, 'a:8:{s:9:"full_name";s:6:"Vova S";s:13:"address_line1";s:11:"123 Fake St";s:13:"address_line2";s:0:"";s:4:"city";s:8:"San Jose";s:5:"state";s:2:"CA";s:6:"postal";s:5:"95131";s:7:"country";s:2:"US";s:5:"phone";s:10:"2357657867";}', '6BW30132XR386040L', '2008-10-23 09:55:46', '2008-10-23 09:55:46'),
(46, 13, 'processing', 48.00, 5.01, 48.07, 2.14, 'a:9:{s:9:"full_name";s:6:"Vova S";s:13:"address_line1";s:11:"123 Fake St";s:13:"address_line2";s:0:"";s:4:"city";s:8:"San Jose";s:5:"state";s:2:"CA";s:6:"postal";s:5:"95131";s:7:"country";s:2:"US";s:5:"phone";s:10:"2357657867";s:7:"shipped";a:3:{s:7:"company";s:3:"ups";s:6:"number";s:9:"235342534";s:3:"url";s:0:"";}}', '81543663S1924143E', '2008-12-26 14:23:23', '2008-10-23 10:01:50'),
(47, 13, 'pending', 0.00, 0.00, 0.00, 0.00, 'a:8:{s:9:"full_name";s:6:"Vova S";s:13:"address_line1";s:11:"123 Fake St";s:13:"address_line2";s:0:"";s:4:"city";s:8:"San Jose";s:5:"state";s:2:"CA";s:6:"postal";s:5:"95131";s:7:"country";s:2:"US";s:5:"phone";s:10:"2357657867";}', '0', '2008-10-23 11:41:59', '2008-10-23 11:41:59'),
(48, 13, 'processing', 48.00, 5.01, 48.07, 2.14, 'a:9:{s:9:"full_name";s:6:"Vova S";s:13:"address_line1";s:11:"123 Fake St";s:13:"address_line2";s:0:"";s:4:"city";s:8:"San Jose";s:5:"state";s:2:"CA";s:6:"postal";s:5:"95131";s:7:"country";s:2:"US";s:5:"phone";s:10:"2357657867";s:7:"shipped";a:3:{s:7:"company";s:3:"dhl";s:6:"number";s:7:"3452576";s:3:"url";s:0:"";}}', '5EY12259KU342515B', '2008-10-23 12:17:50', '2008-10-23 12:17:50'),
(49, 13, 'delivered', 300.00, 10.00, 287.31, 12.40, 'a:8:{s:9:"full_name";s:6:"Vova S";s:13:"address_line1";s:11:"123 Fake St";s:13:"address_line2";s:0:"";s:4:"city";s:8:"San Jose";s:5:"state";s:2:"CA";s:6:"postal";s:5:"95131";s:7:"country";s:2:"US";s:5:"phone";s:10:"2357657867";}', '5F27370998863230L', '2008-10-23 12:30:35', '2008-10-23 12:30:35'),
(50, 17, 'pending', 1.00, 0.00, 0.62, 0.04, 'a:3:{s:9:"full_name";s:8:"sdgfsdgd";s:5:"email";s:15:"dsfgsd@sxfs.dgf";s:5:"phone";s:10:"2356645654";}', '6TL93181S0026993N', '2008-10-30 16:27:33', '2008-10-30 16:27:33'),
(51, 17, 'pending', 2.00, 0.00, 1.53, 0.08, 'a:3:{s:9:"full_name";s:8:"sdgfsdgd";s:5:"email";s:15:"dsfgsd@sxfs.dgf";s:5:"phone";s:10:"2356645654";}', '4YV88890SX088782L', '2008-10-30 16:29:19', '2008-10-30 16:29:19'),
(52, 17, 'pending', 3.00, 0.00, 2.44, 0.12, 'a:3:{s:9:"full_name";s:8:"sdgfsdgd";s:5:"email";s:15:"dsfgsd@sxfs.dgf";s:5:"phone";s:10:"2356645654";}', '75372333U7249893F', '2008-10-31 10:13:56', '2008-10-31 10:13:56'),
(53, 17, 'pending', 31.00, 10.00, 37.11, 1.66, 'a:9:{s:9:"full_name";s:8:"sdgfsdgd";s:13:"address_line1";s:6:"sdfgsd";s:13:"address_line2";s:10:"Ð²Ð°Ð¿Ð°Ð²";s:4:"city";s:11:"Ð²Ð°Ð¿Ð²Ð°1";s:5:"state";s:2:"HI";s:6:"postal";s:5:"23566";s:7:"country";s:2:"US";s:5:"email";s:15:"dsfgsd@sxfs.dgf";s:5:"phone";s:10:"2356645654";}', '78S33039UT694264L', '2008-11-11 15:31:14', '2008-11-11 15:31:14'),
(54, 17, 'pending', 30.00, 10.00, 36.20, 1.61, 'a:8:{s:9:"full_name";s:4:"vova";s:13:"address_line1";s:4:"vova";s:13:"address_line2";s:4:"vova";s:4:"city";s:4:"vova";s:5:"state";s:2:"HI";s:6:"postal";s:5:"23566";s:7:"country";s:2:"US";s:5:"phone";s:10:"2356645654";}', '54H92118MX813383N', '2008-11-11 15:40:37', '2008-11-11 15:40:37'),
(55, 17, 'pending', 30.00, 10.00, 36.20, 1.61, 'a:8:{s:9:"full_name";s:4:"vova";s:13:"address_line1";s:4:"vova";s:13:"address_line2";s:4:"vova";s:4:"city";s:4:"vova";s:5:"state";s:2:"HI";s:6:"postal";s:5:"23566";s:7:"country";s:2:"US";s:5:"phone";s:10:"2356645654";}', '99F106429J0864112', '2008-11-11 15:43:17', '2008-11-11 15:43:17'),
(56, 17, 'pending', 30.00, 10.00, 36.20, 1.61, 'a:10:{s:10:"first_name";s:8:"Vladimir";s:9:"last_name";s:7:"Sokolov";s:5:"email";s:15:"tester@mail.com";s:13:"address_line1";s:4:"vova";s:13:"address_line2";s:4:"vova";s:4:"city";s:4:"vova";s:5:"state";s:2:"HI";s:6:"postal";s:5:"23566";s:7:"country";s:2:"US";s:5:"phone";s:10:"2356645654";}', '6GU55661B6814214S', '2008-11-12 14:51:16', '2008-11-12 14:51:16'),
(57, 13, 'delivered', 668.50, 10.00, 630.38, 27.14, 'a:10:{s:10:"first_name";s:4:"Vova";s:9:"last_name";s:6:"Soklov";s:5:"email";s:18:"sokoolov@gmail.com";s:13:"address_line1";s:11:"Main St. 91";s:13:"address_line2";s:0:"";s:4:"city";s:8:"Nikolaev";s:5:"state";s:2:"CA";s:6:"postal";s:7:"2353454";s:7:"country";s:2:"US";s:5:"phone";s:9:"123456489";}', '4FA88195W2793443F', '2008-12-25 10:25:28', '2008-12-25 10:25:28'),
(58, 37, 'pending', 69.00, 0.00, 62.94, 2.76, 'a:12:{s:10:"first_name";s:5:"First";s:9:"last_name";s:7:"etrdgsd";s:5:"email";s:13:"fsdhd1@ds.dfg";s:13:"address_line1";s:10:"sdfhsdhd 2";s:13:"address_line2";a:0:{}s:4:"city";s:5:"SDGdf";s:5:"state";s:2:"AS";s:6:"postal";s:5:"34647";s:7:"country";s:2:"US";s:5:"phone";s:8:"34675686";s:1:"x";s:2:"15";s:1:"y";s:1:"7";}', '3RS90493WR2823156', '2009-01-21 18:19:49', '2009-01-21 18:19:49'),
(59, 37, 'pending', 24.00, 0.00, 21.60, 0.97, 'a:12:{s:10:"first_name";s:4:"Vova";s:9:"last_name";s:7:"Sokolov";s:5:"email";s:16:"sokoov@sdgsd.sdg";s:13:"address_line1";s:11:"sdgsdfh 234";s:13:"address_line2";a:0:{}s:4:"city";s:6:"rgdffg";s:5:"state";s:2:"AL";s:6:"postal";s:5:"23545";s:7:"country";s:2:"US";s:5:"phone";s:8:"23456546";s:1:"x";s:2:"36";s:1:"y";s:1:"1";}', '7X342550MG200713Y', '2009-01-22 12:39:21', '2009-01-22 12:39:21'),
(60, 36, 'processing', 113.00, 0.00, 103.90, 4.52, 'a:12:{s:10:"first_name";s:4:"Vova";s:9:"last_name";s:7:"Sokolov";s:5:"email";s:16:"sokoov@sdgsd.sdg";s:13:"address_line1";s:11:"sdgsdfh 234";s:13:"address_line2";a:0:{}s:4:"city";s:6:"rgdffg";s:5:"state";s:2:"AL";s:6:"postal";s:5:"23545";s:7:"country";s:2:"US";s:5:"phone";s:8:"23456546";s:1:"x";s:2:"36";s:1:"y";s:1:"1";}', '7X342550MG200713Y', '2009-06-10 12:00:45', '2009-01-22 12:39:24'),
(61, 37, 'pending', 35.00, 0.00, 31.64, 1.41, 'a:12:{s:10:"first_name";s:4:"Vova";s:9:"last_name";s:7:"Sokolov";s:5:"email";s:16:"sokoov@sdgsd.sdg";s:13:"address_line1";s:11:"sdgsdfh 234";s:13:"address_line2";a:0:{}s:4:"city";s:6:"rgdffg";s:5:"state";s:2:"AL";s:6:"postal";s:5:"23545";s:7:"country";s:2:"US";s:5:"phone";s:8:"23456546";s:1:"x";s:2:"30";s:1:"y";s:2:"15";}', '65V791652E365662F', '2009-01-22 15:30:06', '2009-01-22 15:30:06'),
(62, 36, 'processing', 79.00, 0.00, 72.25, 3.16, 'a:12:{s:10:"first_name";s:4:"Vova";s:9:"last_name";s:7:"Sokolov";s:5:"email";s:16:"sokoov@sdgsd.sdg";s:13:"address_line1";s:11:"sdgsdfh 234";s:13:"address_line2";a:0:{}s:4:"city";s:6:"rgdffg";s:5:"state";s:2:"AL";s:6:"postal";s:5:"23545";s:7:"country";s:2:"US";s:5:"phone";s:8:"23456546";s:1:"x";s:2:"30";s:1:"y";s:2:"15";}', '65V791652E365662F', '2009-04-29 16:37:03', '2009-01-22 15:30:09'),
(63, 17, 'pending', 100.00, 17.25, 107.86, 4.69, 'a:10:{s:10:"first_name";s:4:"Vova";s:9:"last_name";s:7:"Sokolov";s:5:"email";s:16:"sokoov@sdgsd.sdg";s:13:"address_line1";s:11:"sdgsdfh 234";s:13:"address_line2";s:5:"Array";s:4:"city";s:6:"rgdffg";s:5:"state";s:2:"AL";s:6:"postal";s:5:"23545";s:7:"country";s:2:"US";s:5:"phone";s:8:"23456546";}', '5BL90151W85205547', '2009-02-06 10:02:11', '2009-02-06 10:02:11'),
(64, 36, 'processing', 300.00, 150.00, 417.65, 18.00, 'a:11:{s:10:"first_name";s:7:"fsdgfdf";s:9:"last_name";s:6:"fdgsdf";s:5:"email";s:13:"TEST@EDFSD.DF";s:13:"address_line1";s:8:"Ð²Ð°Ñ‹Ð¿";s:13:"address_line2";s:10:"Ð²Ð°Ð¿Ñ‹Ð²";s:4:"city";s:8:"Ð¿Ð²Ð°Ñ‹";s:5:"state";s:2:"AL";s:6:"postal";s:16:"Ð²Ð°Ð¿Ñ‹Ð²Ð°Ð¿Ð²";s:7:"country";s:2:"US";s:5:"phone";s:10:"Ð²Ð°Ð¿Ñ‹Ð²";s:7:"shipped";a:3:{s:7:"company";s:5:"fedex";s:6:"number";s:13:"3216549870001";s:3:"url";s:28:"http://www.accountmarket.ru/";}}', '', '2009-04-29 16:37:34', '2009-03-20 16:59:25'),
(65, 36, 'pending', 0.00, 0.00, 0.00, 0.00, 'a:10:{s:10:"first_name";s:7:"fsdgfdf";s:9:"last_name";s:6:"fdgsdf";s:5:"email";s:13:"TEST@EDFSD.DF";s:13:"address_line1";s:8:"Ð²Ð°Ñ‹Ð¿";s:13:"address_line2";s:10:"Ð²Ð°Ð¿Ñ‹Ð²";s:4:"city";s:8:"Ð¿Ð²Ð°Ñ‹";s:5:"state";s:2:"AL";s:6:"postal";s:16:"Ð²Ð°Ð¿Ñ‹Ð²Ð°Ð¿Ð²";s:7:"country";s:2:"US";s:5:"phone";s:10:"Ð²Ð°Ð¿Ñ‹Ð²";}', '', '2009-03-20 16:59:37', '2009-03-20 16:59:37'),
(66, 36, 'pending', 0.00, 0.00, 0.00, 0.00, 'a:10:{s:10:"first_name";s:7:"fsdgfdf";s:9:"last_name";s:6:"fdgsdf";s:5:"email";s:13:"TEST@EDFSD.DF";s:13:"address_line1";s:8:"Ð²Ð°Ñ‹Ð¿";s:13:"address_line2";s:10:"Ð²Ð°Ð¿Ñ‹Ð²";s:4:"city";s:8:"Ð¿Ð²Ð°Ñ‹";s:5:"state";s:2:"AL";s:6:"postal";s:16:"Ð²Ð°Ð¿Ñ‹Ð²Ð°Ð¿Ð²";s:7:"country";s:2:"US";s:5:"phone";s:10:"Ð²Ð°Ð¿Ñ‹Ð²";}', '', '2009-03-20 17:00:02', '2009-03-20 17:00:02'),
(67, 36, 'pending', 0.00, 0.00, 0.00, 0.00, 'a:10:{s:10:"first_name";s:7:"fsdgfdf";s:9:"last_name";s:6:"fdgsdf";s:5:"email";s:13:"TEST@EDFSD.DF";s:13:"address_line1";s:8:"Ð²Ð°Ñ‹Ð¿";s:13:"address_line2";s:10:"Ð²Ð°Ð¿Ñ‹Ð²";s:4:"city";s:8:"Ð¿Ð²Ð°Ñ‹";s:5:"state";s:2:"AL";s:6:"postal";s:16:"Ð²Ð°Ð¿Ñ‹Ð²Ð°Ð¿Ð²";s:7:"country";s:2:"US";s:5:"phone";s:10:"Ð²Ð°Ð¿Ñ‹Ð²";}', '', '2009-03-20 17:00:26', '2009-03-20 17:00:26'),
(68, 36, 'processing', 45.00, 0.00, 40.76, 1.82, 'a:11:{s:10:"first_name";s:5:"aasfs";s:9:"last_name";s:5:"SDFSD";s:5:"email";s:15:"sdfsd@sdfsd.sdf";s:13:"address_line1";s:4:"sdfs";s:13:"address_line2";a:0:{}s:4:"city";s:5:"sdfsd";s:5:"state";s:2:"AS";s:6:"postal";s:5:"23534";s:7:"country";s:2:"US";s:5:"phone";a:0:{}s:11:"terms_agree";s:1:"1";}', '26T284794W878315Y', '2009-04-16 12:26:08', '2009-03-24 13:46:40'),
(69, 37, 'canceled', 34.00, 0.00, 30.73, 1.37, 'a:11:{s:10:"first_name";s:5:"aasfs";s:9:"last_name";s:5:"SDFSD";s:5:"email";s:15:"sdfsd@sdfsd.sdf";s:13:"address_line1";s:4:"sdfs";s:13:"address_line2";a:0:{}s:4:"city";s:5:"sdfsd";s:5:"state";s:2:"AS";s:6:"postal";s:5:"23534";s:7:"country";s:2:"US";s:5:"phone";a:0:{}s:11:"terms_agree";s:1:"1";}', '26T284794W878315Y', '2009-03-24 13:46:44', '2009-03-24 13:46:44'),
(70, 9, 'canceled', 50.00, 0.00, 45.33, 2.02, 'a:5:{s:10:"first_name";s:5:"aasfs";s:9:"last_name";s:5:"SDFSD";s:5:"email";s:15:"sdfsd@sdfsd.sdf";s:5:"phone";s:5:"Array";s:8:"refunded";s:32:"No action from Seller in 14 days";}', '4VW49190644467808', '2009-05-05 09:34:37', '2009-04-16 15:58:35'),
(71, 36, 'canceled', 669.00, 53.00, 670.88, 28.88, 'a:11:{s:10:"first_name";s:5:"aasfs";s:9:"last_name";s:5:"SDFSD";s:5:"email";s:15:"sdfsd@sdfsd.sdf";s:13:"address_line1";s:4:"sdfs";s:13:"address_line2";s:5:"Array";s:4:"city";s:5:"sdfsd";s:5:"state";s:2:"AS";s:6:"postal";s:5:"23534";s:7:"country";s:2:"US";s:5:"phone";s:5:"Array";s:8:"refunded";s:4:"test";}', '8JB89488AF145602S', '2009-04-29 12:53:30', '2009-04-16 16:23:08'),
(72, 9, 'pending', 50.00, 0.00, 45.33, 2.02, 'a:4:{s:10:"first_name";s:5:"aasfs";s:9:"last_name";s:5:"SDFSD";s:5:"email";s:15:"sdfsd@sdfsd.sdf";s:5:"phone";s:5:"Array";}', '0CM07775R4855903M', '2009-04-22 18:51:15', '2009-04-22 18:51:15'),
(73, 36, 'canceled', 100.00, 20.00, 110.42, 4.80, 'a:11:{s:10:"first_name";s:5:"fsdgs";s:9:"last_name";s:6:"sgdsfg";s:5:"email";s:17:"sdfsdfgd@sfsd.dgh";s:13:"address_line1";s:5:"sdfsd";s:13:"address_line2";s:5:"sdfsd";s:4:"city";s:8:"sdfsdgfd";s:5:"state";s:2:"LA";s:6:"postal";s:5:"23546";s:7:"country";s:2:"US";s:5:"phone";s:7:"2355756";s:8:"refunded";s:21:"test to refund 120 ue";}', '8AK91080Y2820543P', '2009-04-30 11:27:15', '2009-04-30 11:04:26'),
(74, 36, 'processing', 102.00, 4.00, 97.39, 4.24, 'a:11:{s:10:"first_name";s:5:"fsdgs";s:9:"last_name";s:6:"sgdsfg";s:5:"email";s:17:"sdfsdfgd@sfsd.dgh";s:13:"address_line1";s:5:"sdfsd";s:13:"address_line2";s:5:"sdfsd";s:4:"city";s:8:"sdfsdgfd";s:5:"state";s:2:"LA";s:6:"postal";s:5:"23546";s:7:"country";s:2:"US";s:5:"phone";s:7:"2355756";s:7:"shipped";a:4:{s:7:"company";s:5:"fedex";s:6:"number";s:5:"12345";s:3:"url";s:26:"https://www.orabote.org.ua";s:4:"note";s:311:"v sxvj zdsjk hasdjkf hasdfsd fsadf sdfkjhs fsdkfalskdf asldfkjd Ð²Ñ‹Ñ€Ñ„Ð°Ð»Ð¾ Ñ€Ð°Ð»Ñ„Ñ‹Ð´ Ð²Ð»Ð°Ð¾Ñ„Ñ‹Ð²Ñ€Ð´Ð°Ð»Ð¾ sdhfl ewuih fsakfhsxdjfh wekfsdjcndkasfh askdfh ksdjf halskcjh sdkjfh sakdcj nsdf skdjcn sdklajfh sdlafkjsdh Ð»Ð¾ÑÑ€Ð²Ñ‹Ð´Ð°Ð»Ð¾Ñ‹Ñ„Ð²Ñ€ fasdjkfh lsakdfh asldkfj haslkdfhs lkfsjdh alksfdh skdfj";}}', '7FP1080291002913D', '2009-05-15 16:14:53', '2009-04-30 11:34:09'),
(75, 36, 'canceled', 34.00, 2.00, 32.55, 1.45, 'a:11:{s:10:"first_name";s:5:"fsdgs";s:9:"last_name";s:6:"sgdsfg";s:5:"email";s:17:"sdfsdfgd@sfsd.dgh";s:13:"address_line1";s:5:"sdfsd";s:13:"address_line2";s:5:"sdfsd";s:4:"city";s:8:"sdfsdgfd";s:5:"state";s:2:"LA";s:6:"postal";s:5:"23546";s:7:"country";s:2:"US";s:5:"phone";s:7:"2355756";s:8:"refunded";s:9:"last test";}', '5HV2628591693361A', '2009-04-30 16:41:31', '2009-04-30 12:00:36'),
(76, 36, 'processing', 34.00, 0.00, 30.73, 1.37, 'a:4:{s:10:"first_name";s:8:"ssfgdgdf";s:9:"last_name";s:9:"fhfghdfgf";s:5:"email";s:21:"dfgdfgdf@dfsdfgfd.dfg";s:5:"phone";s:8:"43645756";}', '7TF87233P1362390F', '2009-06-10 11:57:37', '2009-06-03 15:15:42'),
(77, 36, 'processing', 34.00, 15.00, 44.41, 1.98, 'a:11:{s:10:"first_name";s:8:"ssfgdgdf";s:9:"last_name";s:9:"fhfghdfgf";s:5:"email";s:21:"dfgdfgdf@dfsdfgfd.dfg";s:13:"address_line1";s:9:"dsgdfsgdf";s:13:"address_line2";s:0:"";s:4:"city";s:10:"Ð²Ð°Ð¿Ð²Ð°";s:5:"state";s:2:"MA";s:6:"postal";s:6:"436454";s:7:"country";s:2:"US";s:5:"phone";s:8:"43645756";s:7:"shipped";a:4:{s:7:"company";s:5:"fedex";s:6:"number";s:0:"";s:3:"url";s:0:"";s:4:"note";s:0:"";}}', '8TV0189760728353P', '2009-06-03 15:28:23', '2009-06-03 15:18:58'),
(78, 9, 'processing', 100.00, 0.00, 91.80, 4.00, 'a:2:{s:5:"email";s:13:"test@vova.com";s:7:"shipped";a:1:{s:4:"note";s:0:"";}}', '4PU45246RW399923E', '2009-08-04 17:07:07', '2009-08-04 16:42:00'),
(79, 9, 'processing', 50.00, 0.00, 45.33, 2.02, 'a:2:{s:5:"email";s:13:"test@vova.com";s:7:"shipped";a:1:{s:4:"note";s:0:"";}}', '1JH09905496395251', '2009-08-04 17:22:54', '2009-08-04 17:08:27'),
(80, 9, 'processing', 50.00, 0.00, 45.33, 2.02, 'a:2:{s:5:"email";s:13:"test@vova.com";s:7:"shipped";a:1:{s:4:"note";s:4:"test";}}', '4ST15912G7268331K', '2009-08-04 17:41:29', '2009-08-04 17:19:34'),
(81, 9, 'processing', 50.00, 0.00, 45.33, 2.02, 'a:2:{s:5:"email";s:13:"test@vova.com";s:7:"shipped";a:1:{s:4:"note";s:30:"Digital products - no shipping";}}', '2WK76101900425148', '2009-08-04 17:29:08', '2009-08-04 17:29:06'),
(82, 9, 'processing', 50.00, 0.00, 45.33, 2.02, 'a:2:{s:5:"email";s:13:"test@vova.com";s:7:"shipped";a:1:{s:4:"note";s:30:"Digital products - no shipping";}}', '1DS64683PT509434L', '2009-08-05 15:35:53', '2009-08-05 15:35:51'),
(83, 9, 'processing', 50.00, 0.00, 45.33, 2.02, 'a:2:{s:5:"email";s:13:"test@vova.com";s:7:"shipped";a:1:{s:4:"note";s:30:"Digital products - no shipping";}}', '4WG12150JU345403X', '2009-08-05 15:40:09', '2009-08-05 15:40:07'),
(84, 9, 'processing', 50.00, 0.00, 45.33, 2.02, 'a:2:{s:5:"email";s:13:"test@vova.com";s:7:"shipped";a:1:{s:4:"note";s:30:"Digital products - no shipping";}}', '5JV61164U6044103P', '2009-08-05 15:42:18', '2009-08-05 15:42:16'),
(85, 9, 'processing', 50.00, 0.00, 45.33, 2.02, 'a:2:{s:5:"email";s:13:"test@vova.com";s:7:"shipped";a:1:{s:4:"note";s:30:"Digital products - no shipping";}}', '7K139916C6089101H', '2009-08-05 17:36:47', '2009-08-05 17:36:45'),
(86, 9, 'processing', 50.00, 0.00, 45.33, 2.02, 'a:2:{s:5:"email";s:13:"test@vova.com";s:7:"shipped";a:1:{s:4:"note";s:30:"Digital products - no shipping";}}', '9PH007691F370043M', '2009-08-05 17:41:41', '2009-08-05 17:41:39'),
(87, 9, 'processing', 50.00, 0.00, 45.33, 2.02, 'a:2:{s:5:"email";s:13:"test@vova.com";s:7:"shipped";a:1:{s:4:"note";s:30:"Digital products - no shipping";}}', '0S020857EP512142B', '2009-08-05 18:03:24', '2009-08-05 18:03:22'),
(88, 36, 'pending', 45.00, 20.00, 59.22, 2.60, 'a:11:{s:10:"first_name";s:8:"sdgasdgf";s:9:"last_name";s:10:"dsfgsdfgdf";s:5:"email";s:14:"sdffsd@dfsd.df";s:13:"address_line1";s:11:"dsfgsdfgdsf";s:13:"address_line2";s:4:"ssss";s:4:"city";s:7:"dsfgsdf";s:5:"state";s:2:"CO";s:6:"postal";s:8:"23534534";s:7:"country";s:2:"US";s:5:"phone";s:13:"3464575675656";s:11:"terms_agree";s:1:"1";}', '67R07917H1499390L', '2009-08-10 11:02:05', '2009-08-10 11:02:05'),
(89, 36, 'pending', 79.00, 21.00, 91.80, 4.00, 'a:11:{s:10:"first_name";s:8:"sdgasdgf";s:9:"last_name";s:10:"dsfgsdfgdf";s:5:"email";s:14:"sdffsd@dfsd.df";s:13:"address_line1";s:11:"dsfgsdfgdsf";s:13:"address_line2";s:4:"ssss";s:4:"city";s:7:"dsfgsdf";s:5:"state";s:2:"CO";s:6:"postal";s:8:"23534534";s:7:"country";s:2:"US";s:5:"phone";s:13:"3464575675656";s:11:"terms_agree";s:1:"1";}', '2ND7046019320853J', '2009-08-10 12:20:57', '2009-08-10 12:20:57'),
(90, 36, 'pending', 45.00, 20.00, 59.22, 2.60, 'a:11:{s:10:"first_name";s:8:"sdgasdgf";s:9:"last_name";s:10:"dsfgsdfgdf";s:5:"email";s:14:"sdffsd@dfsd.df";s:13:"address_line1";s:11:"dsfgsdfgdsf";s:13:"address_line2";s:4:"ssss";s:4:"city";s:7:"dsfgsdf";s:5:"state";s:2:"CO";s:6:"postal";s:8:"23534534";s:7:"country";s:2:"US";s:5:"phone";s:13:"3464575675656";s:11:"terms_agree";s:1:"1";}', '8PY905838C648292X', '2009-08-10 12:57:45', '2009-08-10 12:57:45'),
(91, 36, 'pending', 45.00, 20.00, 59.22, 2.60, 'a:11:{s:10:"first_name";s:8:"sdgasdgf";s:9:"last_name";s:10:"dsfgsdfgdf";s:5:"email";s:14:"sdffsd@dfsd.df";s:13:"address_line1";s:11:"dsfgsdfgdsf";s:13:"address_line2";s:4:"ssss";s:4:"city";s:7:"dsfgsdf";s:5:"state";s:2:"CO";s:6:"postal";s:8:"23534534";s:7:"country";s:2:"US";s:5:"phone";s:13:"3464575675656";s:11:"terms_agree";s:1:"1";}', '3V655202MB931980B', '2009-08-10 16:05:34', '2009-08-10 16:05:34'),
(92, 36, 'pending', 45.00, 20.00, 59.22, 2.60, 'a:11:{s:10:"first_name";s:8:"sdgasdgf";s:9:"last_name";s:10:"dsfgsdfgdf";s:5:"email";s:14:"sdffsd@dfsd.df";s:13:"address_line1";s:11:"dsfgsdfgdsf";s:13:"address_line2";s:4:"ssss";s:4:"city";s:7:"dsfgsdf";s:5:"state";s:2:"CO";s:6:"postal";s:8:"23534534";s:7:"country";s:2:"US";s:5:"phone";s:13:"3464575675656";s:11:"terms_agree";s:1:"1";}', '7R143454ES755751J', '2009-08-10 16:07:52', '2009-08-10 16:07:52'),
(93, 36, 'pending', 45.00, 20.00, 59.22, 2.60, 'a:11:{s:10:"first_name";s:8:"sdgasdgf";s:9:"last_name";s:10:"dsfgsdfgdf";s:5:"email";s:14:"sdffsd@dfsd.df";s:13:"address_line1";s:11:"dsfgsdfgdsf";s:13:"address_line2";s:4:"ssss";s:4:"city";s:7:"dsfgsdf";s:5:"state";s:2:"CO";s:6:"postal";s:8:"23534534";s:7:"country";s:2:"US";s:5:"phone";s:13:"3464575675656";s:11:"terms_agree";s:1:"1";}', '8W092892BK098672N', '2009-08-10 16:32:01', '2009-08-10 16:32:01'),
(94, 36, 'pending', 45.00, 20.00, 59.22, 2.60, 'a:11:{s:10:"first_name";s:8:"sdgasdgf";s:9:"last_name";s:10:"dsfgsdfgdf";s:5:"email";s:14:"sdffsd@dfsd.df";s:13:"address_line1";s:11:"dsfgsdfgdsf";s:13:"address_line2";s:4:"ssss";s:4:"city";s:7:"dsfgsdf";s:5:"state";s:2:"CO";s:6:"postal";s:8:"23534534";s:7:"country";s:2:"US";s:5:"phone";s:13:"3464575675656";s:11:"terms_agree";s:1:"1";}', '92V867735K370704R', '2009-08-10 16:35:36', '2009-08-10 16:35:36'),
(95, 37, 'pending', 12.00, 0.00, 10.65, 0.48, 'a:11:{s:10:"first_name";s:8:"sdgasdgf";s:9:"last_name";s:10:"dsfgsdfgdf";s:5:"email";s:14:"sdffsd@dfsd.df";s:13:"address_line1";s:11:"dsfgsdfgdsf";s:13:"address_line2";s:4:"ssss";s:4:"city";s:7:"dsfgsdf";s:5:"state";s:2:"CO";s:6:"postal";s:8:"23534534";s:7:"country";s:2:"US";s:5:"phone";s:13:"3464575675656";s:11:"terms_agree";s:1:"1";}', '92V867735K370704R', '2009-08-10 16:35:38', '2009-08-10 16:35:38'),
(96, 54, 'canceled', 1.00, 0.00, 0.62, 0.04, 'a:5:{s:10:"first_name";s:8:"Vladomir";s:9:"last_name";s:7:"Sokolov";s:5:"email";s:22:"vova.sokolov@gmail.com";s:5:"phone";s:13:"+380687026836";s:8:"refunded";s:12:"Test payment";}', '3FE92879AP4701305', '2010-02-03 16:58:12', '2010-02-03 16:46:39');

-- --------------------------------------------------------

--
-- Структура таблицы `order_product`
--

DROP TABLE IF EXISTS `order_product`;
CREATE TABLE IF NOT EXISTS `order_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_desc` text NOT NULL,
  `product_price` float(10,2) unsigned NOT NULL,
  `quantity` smallint(5) unsigned NOT NULL,
  `product_info` text NOT NULL COMMENT 'serialize array',
  `shipping_price` float(10,2) unsigned NOT NULL,
  `shipping_info` text NOT NULL COMMENT 'serialize array',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- Дамп данных таблицы `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `product_name`, `product_desc`, `product_price`, `quantity`, `product_info`, `shipping_price`, `shipping_info`) VALUES
(1, 4, 45, 'test20', '', 20.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 5.01, 'a:1:{s:6:"custom";a:1:{s:5:"value";s:4:"5.01";}}'),
(2, 4, 40, 'test15', '', 15.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";b:0;}'),
(3, 4, 39, 'test14', '', 14.00, 1, 'a:1:{s:4:"Size";s:5:"Large";}', 0.00, 'a:1:{s:2:"no";b:0;}'),
(4, 4, 44, 'test19', '', 19.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 7.33, 'a:1:{s:5:"fedex";a:4:{s:6:"Origin";a:2:{s:11:"CountryCode";s:2:"US";s:10:"PostalCode";s:5:"38115";}s:11:"DropoffType";s:14:"REGULAR_PICKUP";s:13:"PackagingType";s:14:"YOUR_PACKAGING";s:8:"Packages";a:1:{i:0;a:1:{s:6:"Weight";a:2:{s:5:"Value";s:2:"10";s:5:"Units";s:2:"LB";}}}}}'),
(5, 4, 43, 'test18', '', 18.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 66.38, 'a:1:{s:3:"ups";a:5:{s:14:"14_origCountry";s:2:"US";s:13:"15_origPostal";s:5:"73301";s:9:"23_weight";s:2:"20";s:13:"47_rate_chart";s:15:"One Time Pickup";s:12:"48_container";s:3:"21S";}}'),
(6, 5, 45, 'test20', '', 20.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 5.01, 'a:1:{s:6:"custom";a:1:{s:5:"value";s:4:"5.01";}}'),
(7, 5, 40, 'test15', '', 15.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";b:0;}'),
(8, 5, 39, 'test14', '', 14.00, 1, 'a:1:{s:4:"Size";s:5:"Large";}', 0.00, 'a:1:{s:2:"no";b:0;}'),
(9, 5, 44, 'test19', '', 19.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 7.33, 'a:1:{s:5:"fedex";a:4:{s:6:"Origin";a:2:{s:11:"CountryCode";s:2:"US";s:10:"PostalCode";s:5:"38115";}s:11:"DropoffType";s:14:"REGULAR_PICKUP";s:13:"PackagingType";s:14:"YOUR_PACKAGING";s:8:"Packages";a:1:{i:0;a:1:{s:6:"Weight";a:2:{s:5:"Value";s:2:"10";s:5:"Units";s:2:"LB";}}}}}'),
(10, 5, 43, 'test18', '', 18.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 66.38, 'a:1:{s:3:"ups";a:5:{s:14:"14_origCountry";s:2:"US";s:13:"15_origPostal";s:5:"73301";s:9:"23_weight";s:2:"20";s:13:"47_rate_chart";s:15:"One Time Pickup";s:12:"48_container";s:3:"21S";}}'),
(11, 6, 45, 'test20', '', 20.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 5.01, 'a:1:{s:6:"custom";a:1:{s:5:"value";s:4:"5.01";}}'),
(12, 7, 45, 'test20', '', 20.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 5.01, 'a:1:{s:6:"custom";a:1:{s:5:"value";s:4:"5.01";}}'),
(13, 7, 44, 'test19', '', 19.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 7.33, 'a:1:{s:5:"fedex";a:4:{s:6:"Origin";a:2:{s:11:"CountryCode";s:2:"US";s:10:"PostalCode";s:5:"38115";}s:11:"DropoffType";s:14:"REGULAR_PICKUP";s:13:"PackagingType";s:14:"YOUR_PACKAGING";s:8:"Packages";a:1:{i:0;a:1:{s:6:"Weight";a:2:{s:5:"Value";s:2:"10";s:5:"Units";s:2:"LB";}}}}}'),
(14, 8, 42, 'test17', '', 17.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:1:{s:2:"no";b:0;}'),
(15, 8, 45, 'test20', '', 20.00, 2, 'a:1:{s:4:"Size";s:6:"Medium";}', 5.01, 'a:1:{s:6:"custom";a:1:{s:5:"value";s:4:"5.01";}}'),
(16, 9, 45, 'test20', '', 20.00, 2, 'a:1:{s:4:"Size";s:6:"Medium";}', 5.01, 'a:1:{s:6:"custom";a:1:{s:5:"value";s:4:"5.01";}}'),
(17, 10, 45, 'test20', '', 20.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 5.01, 'a:1:{s:6:"custom";a:1:{s:5:"value";s:4:"5.01";}}'),
(18, 11, 45, 'test20', '', 20.00, 1, 'a:1:{s:4:"Size";s:5:"Large";}', 5.01, 'a:1:{s:6:"custom";a:1:{s:5:"value";s:4:"5.01";}}'),
(19, 12, 45, 'test20', '', 20.00, 2, 'a:1:{s:4:"Size";s:5:"Large";}', 5.01, 'a:1:{s:6:"custom";a:1:{s:5:"value";s:4:"5.01";}}'),
(20, 12, 44, 'test19', '', 19.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 7.33, 'a:1:{s:5:"fedex";a:4:{s:6:"Origin";a:2:{s:11:"CountryCode";s:2:"US";s:10:"PostalCode";s:5:"38115";}s:11:"DropoffType";s:14:"REGULAR_PICKUP";s:13:"PackagingType";s:14:"YOUR_PACKAGING";s:8:"Packages";a:1:{i:0;a:1:{s:6:"Weight";a:2:{s:5:"Value";s:2:"10";s:5:"Units";s:2:"LB";}}}}}'),
(21, 13, 45, 'test20', '', 20.00, 1, 'a:1:{s:4:"Size";s:5:"Large";}', 5.01, 'a:1:{s:6:"custom";a:1:{s:5:"value";s:4:"5.01";}}'),
(22, 13, 44, 'test19', '', 19.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 7.33, 'a:1:{s:5:"fedex";a:4:{s:6:"Origin";a:2:{s:11:"CountryCode";s:2:"US";s:10:"PostalCode";s:5:"38115";}s:11:"DropoffType";s:14:"REGULAR_PICKUP";s:13:"PackagingType";s:14:"YOUR_PACKAGING";s:8:"Packages";a:1:{i:0;a:1:{s:6:"Weight";a:2:{s:5:"Value";s:2:"10";s:5:"Units";s:2:"LB";}}}}}'),
(23, 13, 43, 'test18', '', 18.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 66.38, 'a:1:{s:3:"ups";a:5:{s:14:"14_origCountry";s:2:"US";s:13:"15_origPostal";s:5:"73301";s:9:"23_weight";s:2:"20";s:13:"47_rate_chart";s:15:"One Time Pickup";s:12:"48_container";s:3:"21S";}}'),
(24, 14, 45, 'test20', '', 20.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 5.01, 'a:1:{s:6:"custom";a:1:{s:5:"value";s:4:"5.01";}}'),
(25, 15, 45, 'test20', '', 20.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 5.01, 'a:1:{s:6:"custom";a:1:{s:5:"value";s:4:"5.01";}}'),
(26, 16, 42, 'test17', '', 17.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";N;}'),
(27, 17, 45, 'test20', '', 20.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 5.01, 'a:1:{s:6:"custom";a:1:{s:5:"value";s:4:"5.01";}}'),
(28, 17, 44, 'test19', '', 19.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 7.33, 'a:1:{s:5:"fedex";a:4:{s:6:"Origin";a:2:{s:11:"CountryCode";s:2:"US";s:10:"PostalCode";s:5:"38115";}s:11:"DropoffType";s:14:"REGULAR_PICKUP";s:13:"PackagingType";s:14:"YOUR_PACKAGING";s:8:"Packages";a:1:{i:0;a:1:{s:6:"Weight";a:2:{s:5:"Value";s:2:"10";s:5:"Units";s:2:"LB";}}}}}'),
(29, 17, 42, 'test17', '', 17.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";N;}'),
(30, 17, 43, 'test18', '', 18.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 25.87, 'a:1:{s:3:"ups";a:5:{s:14:"14_origCountry";s:2:"US";s:13:"15_origPostal";s:5:"73301";s:9:"23_weight";s:2:"20";s:13:"47_rate_chart";s:15:"One Time Pickup";s:12:"48_container";s:3:"21S";}}'),
(31, 18, 42, 'test17', '', 17.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";N;}'),
(32, 19, 45, 'test20', '', 20.00, 2, 'a:1:{s:4:"Size";s:6:"Medium";}', 9.26, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:4:"5.01";s:9:"add_value";s:4:"4.25";}}'),
(33, 19, 45, 'test20', '', 20.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 4.25, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:4:"5.01";s:9:"add_value";s:4:"4.25";}}'),
(34, 20, 45, 'test20', '', 20.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 5.01, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:4:"5.01";s:9:"add_value";s:4:"4.25";}}'),
(35, 20, 44, 'test19', '', 19.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";N;}'),
(36, 21, 45, 'test20', '', 20.00, 1, 'a:1:{s:4:"Size";s:5:"Large";}', 5.01, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:4:"5.01";s:9:"add_value";s:4:"4.25";}}'),
(37, 21, 44, 'test19', '', 19.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";N;}'),
(38, 22, 41, 'test16', '', 16.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";b:0;}'),
(39, 22, 58, 'testnew', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there''s no need for hoods, gases, or flames\r\n* Small footprint â€“ 17" (L) x 18" (W) x 18" (H)\r\n* Low reagent costs â€“ only pre-packaged reagents needed\r\n* Reimbursable as a quantitative blood lead\r\n\r\nReagent features:\r\n\r\n* MetexchangeÂ® kits include chemical pre-treatment reagents, calibrators, controls, and performance-verification mixtures.\r\n* Unique Metexchange pre-treatment reagent eliminates the necessity of performing acid digestion\r\n* Reagents come pre-measured in easy-to-use snap-cap vials.\r\n* All reagents are manufactured and available from one trusted source â€“ ESA.', 100.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 10.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"7";}}'),
(40, 23, 58, 'testnew', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there''s no need for hoods, gases, or flames\r\n* Small footprint â€“ 17" (L) x 18" (W) x 18" (H)\r\n* Low reagent costs â€“ only pre-packaged reagents needed\r\n* Reimbursable as a quantitative blood lead\r\n\r\nReagent features:\r\n\r\n* MetexchangeÂ® kits include chemical pre-treatment reagents, calibrators, controls, and performance-verification mixtures.\r\n* Unique Metexchange pre-treatment reagent eliminates the necessity of performing acid digestion\r\n* Reagents come pre-measured in easy-to-use snap-cap vials.\r\n* All reagents are manufactured and available from one trusted source â€“ ESA.', 10.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 100.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:3:"100";s:9:"add_value";s:1:"7";}}'),
(41, 24, 58, 'testnew', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there''s no need for hoods, gases, or flames\r\n* Small footprint â€“ 17" (L) x 18" (W) x 18" (H)\r\n* Low reagent costs â€“ only pre-packaged reagents needed\r\n* Reimbursable as a quantitative blood lead\r\n\r\nReagent features:\r\n\r\n* MetexchangeÂ® kits include chemical pre-treatment reagents, calibrators, controls, and performance-verification mixtures.\r\n* Unique Metexchange pre-treatment reagent eliminates the necessity of performing acid digestion\r\n* Reagents come pre-measured in easy-to-use snap-cap vials.\r\n* All reagents are manufactured and available from one trusted source â€“ ESA.', 10.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 300.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:3:"300";s:9:"add_value";s:1:"7";}}'),
(42, 25, 58, 'testnew', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there''s no need for hoods, gases, or flames\r\n* Small footprint â€“ 17" (L) x 18" (W) x 18" (H)\r\n* Low reagent costs â€“ only pre-packaged reagents needed\r\n* Reimbursable as a quantitative blood lead\r\n\r\nReagent features:\r\n\r\n* MetexchangeÂ® kits include chemical pre-treatment reagents, calibrators, controls, and performance-verification mixtures.\r\n* Unique Metexchange pre-treatment reagent eliminates the necessity of performing acid digestion\r\n* Reagents come pre-measured in easy-to-use snap-cap vials.\r\n* All reagents are manufactured and available from one trusted source â€“ ESA.', 10.00, 1, 'a:1:{s:4:"Size";s:5:"Large";}', 300.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:3:"300";s:9:"add_value";s:1:"7";}}'),
(43, 26, 58, 'testnew', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there''s no need for hoods, gases, or flames\r\n* Small footprint â€“ 17" (L) x 18" (W) x 18" (H)\r\n* Low reagent costs â€“ only pre-packaged reagents needed\r\n* Reimbursable as a quantitative blood lead\r\n\r\nReagent features:\r\n\r\n* MetexchangeÂ® kits include chemical pre-treatment reagents, calibrators, controls, and performance-verification mixtures.\r\n* Unique Metexchange pre-treatment reagent eliminates the necessity of performing acid digestion\r\n* Reagents come pre-measured in easy-to-use snap-cap vials.\r\n* All reagents are manufactured and available from one trusted source â€“ ESA.', 10.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 300.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:3:"300";s:9:"add_value";s:1:"7";}}'),
(44, 27, 58, 'testnew', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there''s no need for hoods, gases, or flames\r\n* Small footprint â€“ 17" (L) x 18" (W) x 18" (H)\r\n* Low reagent costs â€“ only pre-packaged reagents needed\r\n* Reimbursable as a quantitative blood lead\r\n\r\nReagent features:\r\n\r\n* MetexchangeÂ® kits include chemical pre-treatment reagents, calibrators, controls, and performance-verification mixtures.\r\n* Unique Metexchange pre-treatment reagent eliminates the necessity of performing acid digestion\r\n* Reagents come pre-measured in easy-to-use snap-cap vials.\r\n* All reagents are manufactured and available from one trusted source â€“ ESA.', 10.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 300.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:3:"300";s:9:"add_value";s:1:"7";}}'),
(45, 28, 58, 'testnew', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there''s no need for hoods, gases, or flames\r\n* Small footprint â€“ 17" (L) x 18" (W) x 18" (H)\r\n* Low reagent costs â€“ only pre-packaged reagents needed\r\n* Reimbursable as a quantitative blood lead\r\n\r\nReagent features:\r\n\r\n* MetexchangeÂ® kits include chemical pre-treatment reagents, calibrators, controls, and performance-verification mixtures.\r\n* Unique Metexchange pre-treatment reagent eliminates the necessity of performing acid digestion\r\n* Reagents come pre-measured in easy-to-use snap-cap vials.\r\n* All reagents are manufactured and available from one trusted source â€“ ESA.', 10.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 300.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:3:"300";s:9:"add_value";s:1:"7";}}'),
(49, 30, 45, 'test20', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model', 20.00, 2, 'a:1:{s:4:"Size";s:5:"Large";}', 9.26, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:4:"5.01";s:9:"add_value";s:4:"4.25";}}'),
(50, 31, 58, 'testnew', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there''s no need for hoods, gases, or flames\r\n* Small footprint â€“ 17" (L) x 18" (W) x 18" (H)\r\n* Low reagent costs â€“ only pre-packaged reagents needed\r\n* Reimbursable as a quantitative blood lead\r\n\r\nReagent features:\r\n\r\n* MetexchangeÂ® kits include chemical pre-treatment reagents, calibrators, controls, and performance-verification mixtures.\r\n* Unique Metexchange pre-treatment reagent eliminates the necessity of performing acid digestion\r\n* Reagents come pre-measured in easy-to-use snap-cap vials.\r\n* All reagents are manufactured and available from one trusted source â€“ ESA.', 300.00, 10, 'a:1:{s:4:"Size";s:5:"Small";}', 73.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"7";}}'),
(51, 32, 58, 'testnew', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there''s no need for hoods, gases, or flames\r\n* Small footprint â€“ 17" (L) x 18" (W) x 18" (H)\r\n* Low reagent costs â€“ only pre-packaged reagents needed\r\n* Reimbursable as a quantitative blood lead\r\n\r\nReagent features:\r\n\r\n* MetexchangeÂ® kits include chemical pre-treatment reagents, calibrators, controls, and performance-verification mixtures.\r\n* Unique Metexchange pre-treatment reagent eliminates the necessity of performing acid digestion\r\n* Reagents come pre-measured in easy-to-use snap-cap vials.\r\n* All reagents are manufactured and available from one trusted source â€“ ESA.', 300.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 10.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"7";}}'),
(52, 33, 58, 'testnew', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there''s no need for hoods, gases, or flames\r\n* Small footprint â€“ 17" (L) x 18" (W) x 18" (H)\r\n* Low reagent costs â€“ only pre-packaged reagents needed\r\n* Reimbursable as a quantitative blood lead\r\n\r\nReagent features:\r\n\r\n* MetexchangeÂ® kits include chemical pre-treatment reagents, calibrators, controls, and performance-verification mixtures.\r\n* Unique Metexchange pre-treatment reagent eliminates the necessity of performing acid digestion\r\n* Reagents come pre-measured in easy-to-use snap-cap vials.\r\n* All reagents are manufactured and available from one trusted source â€“ ESA.', 300.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 10.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"7";}}'),
(53, 34, 58, 'testnew', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there''s no need for hoods, gases, or flames\r\n* Small footprint â€“ 17" (L) x 18" (W) x 18" (H)\r\n* Low reagent costs â€“ only pre-packaged reagents needed\r\n* Reimbursable as a quantitative blood lead\r\n\r\nReagent features:\r\n\r\n* MetexchangeÂ® kits include chemical pre-treatment reagents, calibrators, controls, and performance-verification mixtures.\r\n* Unique Metexchange pre-treatment reagent eliminates the necessity of performing acid digestion\r\n* Reagents come pre-measured in easy-to-use snap-cap vials.\r\n* All reagents are manufactured and available from one trusted source â€“ ESA.', 300.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 10.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"7";}}'),
(54, 35, 57, 'Ð²Ð°Ð¿Ñ‹Ð²Ð°', 'sdfgdf sdfghg Ð²Ñ€Ð°Ð¿ sdgfsd gsdfg sdfg mdfg Ð²Ð°Ð¿Ð» Ñ‹sdlfg sdlgk dflÐ» Ñ‹Ð¶Ð°Ð´Ð²Ð¿ Ñ‹Ð²dflÐ¿Ð» Ñ‹Ð²Ð´Ð°Ð¿Ñ‹dflÐ²Ð°Ð´Ð´Ð°Ð² Ð»Ð¿Ð¾Ð²Ð°Ð´Ð»Ð¿ sdfklgj dÐ²Ð°Ð¿Ð»Ð²Ñ‹Ð°Ð¶Ð¿Ð»Ð´ Ð²Ð°Ð¶Ð´Ð¿ kds''fgkdfgsd;flg', 345.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";N;}'),
(55, 36, 57, 'Ð²Ð°Ð¿Ñ‹Ð²Ð°', 'sdfgdf sdfghg Ð²Ñ€Ð°Ð¿ sdgfsd gsdfg sdfg mdfg Ð²Ð°Ð¿Ð» Ñ‹sdlfg sdlgk dflÐ» Ñ‹Ð¶Ð°Ð´Ð²Ð¿ Ñ‹Ð²dflÐ¿Ð» Ñ‹Ð²Ð´Ð°Ð¿Ñ‹dflÐ²Ð°Ð´Ð´Ð°Ð² Ð»Ð¿Ð¾Ð²Ð°Ð´Ð»Ð¿ sdfklgj dÐ²Ð°Ð¿Ð»Ð²Ñ‹Ð°Ð¶Ð¿Ð»Ð´ Ð²Ð°Ð¶Ð´Ð¿ kds''fgkdfgsd;flg', 345.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:1:{s:2:"no";N;}'),
(56, 37, 58, 'testnew', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there''s no need for hoods, gases, or flames\r\n* Small footprint â€“ 17" (L) x 18" (W) x 18" (H)\r\n* Low reagent costs â€“ only pre-packaged reagents needed\r\n* Reimbursable as a quantitative blood lead\r\n\r\nReagent features:\r\n\r\n* MetexchangeÂ® kits include chemical pre-treatment reagents, calibrators, controls, and performance-verification mixtures.\r\n* Unique Metexchange pre-treatment reagent eliminates the necessity of performing acid digestion\r\n* Reagents come pre-measured in easy-to-use snap-cap vials.\r\n* All reagents are manufactured and available from one trusted source â€“ ESA.', 300.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 10.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"7";}}'),
(57, 38, 58, 'testnew', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there''s no need for hoods, gases, or flames\r\n* Small footprint â€“ 17" (L) x 18" (W) x 18" (H)\r\n* Low reagent costs â€“ only pre-packaged reagents needed\r\n* Reimbursable as a quantitative blood lead\r\n\r\nReagent features:\r\n\r\n* MetexchangeÂ® kits include chemical pre-treatment reagents, calibrators, controls, and performance-verification mixtures.\r\n* Unique Metexchange pre-treatment reagent eliminates the necessity of performing acid digestion\r\n* Reagents come pre-measured in easy-to-use snap-cap vials.\r\n* All reagents are manufactured and available from one trusted source â€“ ESA.', 300.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 10.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"7";}}'),
(58, 39, 58, 'testnew', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there''s no need for hoods, gases, or flames\r\n* Small footprint â€“ 17" (L) x 18" (W) x 18" (H)\r\n* Low reagent costs â€“ only pre-packaged reagents needed\r\n* Reimbursable as a quantitative blood lead\r\n\r\nReagent features:\r\n\r\n* MetexchangeÂ® kits include chemical pre-treatment reagents, calibrators, controls, and performance-verification mixtures.\r\n* Unique Metexchange pre-treatment reagent eliminates the necessity of performing acid digestion\r\n* Reagents come pre-measured in easy-to-use snap-cap vials.\r\n* All reagents are manufactured and available from one trusted source â€“ ESA.', 300.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 10.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"7";}}'),
(59, 40, 58, 'testnew', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there''s no need for hoods, gases, or flames\r\n* Small footprint â€“ 17" (L) x 18" (W) x 18" (H)\r\n* Low reagent costs â€“ only pre-packaged reagents needed\r\n* Reimbursable as a quantitative blood lead\r\n\r\nReagent features:\r\n\r\n* MetexchangeÂ® kits include chemical pre-treatment reagents, calibrators, controls, and performance-verification mixtures.\r\n* Unique Metexchange pre-treatment reagent eliminates the necessity of performing acid digestion\r\n* Reagents come pre-measured in easy-to-use snap-cap vials.\r\n* All reagents are manufactured and available from one trusted source â€“ ESA.', 300.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 10.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"7";}}'),
(60, 41, 58, 'testnew', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there''s no need for hoods, gases, or flames\r\n* Small footprint â€“ 17" (L) x 18" (W) x 18" (H)\r\n* Low reagent costs â€“ only pre-packaged reagents needed\r\n* Reimbursable as a quantitative blood lead\r\n\r\nReagent features:\r\n\r\n* MetexchangeÂ® kits include chemical pre-treatment reagents, calibrators, controls, and performance-verification mixtures.\r\n* Unique Metexchange pre-treatment reagent eliminates the necessity of performing acid digestion\r\n* Reagents come pre-measured in easy-to-use snap-cap vials.\r\n* All reagents are manufactured and available from one trusted source â€“ ESA.', 300.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 10.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"7";}}'),
(61, 41, 57, 'Ð²Ð°Ð¿Ñ‹Ð²Ð°', 'sdfgdf sdfghg Ð²Ñ€Ð°Ð¿ sdgfsd gsdfg sdfg mdfg Ð²Ð°Ð¿Ð» Ñ‹sdlfg sdlgk dflÐ» Ñ‹Ð¶Ð°Ð´Ð²Ð¿ Ñ‹Ð²dflÐ¿Ð» Ñ‹Ð²Ð´Ð°Ð¿Ñ‹dflÐ²Ð°Ð´Ð´Ð°Ð² Ð»Ð¿Ð¾Ð²Ð°Ð´Ð»Ð¿ sdfklgj dÐ²Ð°Ð¿Ð»Ð²Ñ‹Ð°Ð¶Ð¿Ð»Ð´ Ð²Ð°Ð¶Ð´Ð¿ kds''fgkdfgsd;flg', 345.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:1:{s:2:"no";N;}'),
(62, 42, 58, 'testnew', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there''s no need for hoods, gases, or flames\r\n* Small footprint â€“ 17" (L) x 18" (W) x 18" (H)\r\n* Low reagent costs â€“ only pre-packaged reagents needed\r\n* Reimbursable as a quantitative blood lead\r\n\r\nReagent features:\r\n\r\n* MetexchangeÂ® kits include chemical pre-treatment reagents, calibrators, controls, and performance-verification mixtures.\r\n* Unique Metexchange pre-treatment reagent eliminates the necessity of performing acid digestion\r\n* Reagents come pre-measured in easy-to-use snap-cap vials.\r\n* All reagents are manufactured and available from one trusted source â€“ ESA.', 300.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 10.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"7";}}'),
(63, 42, 57, 'Ð²Ð°Ð¿Ñ‹Ð²Ð°', 'sdfgdf sdfghg Ð²Ñ€Ð°Ð¿ sdgfsd gsdfg sdfg mdfg Ð²Ð°Ð¿Ð» Ñ‹sdlfg sdlgk dflÐ» Ñ‹Ð¶Ð°Ð´Ð²Ð¿ Ñ‹Ð²dflÐ¿Ð» Ñ‹Ð²Ð´Ð°Ð¿Ñ‹dflÐ²Ð°Ð´Ð´Ð°Ð² Ð»Ð¿Ð¾Ð²Ð°Ð´Ð»Ð¿ sdfklgj dÐ²Ð°Ð¿Ð»Ð²Ñ‹Ð°Ð¶Ð¿Ð»Ð´ Ð²Ð°Ð¶Ð´Ð¿ kds''fgkdfgsd;flg', 345.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:1:{s:2:"no";N;}'),
(64, 43, 45, 'test20', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model', 20.00, 1, 'a:1:{s:4:"Size";s:5:"Large";}', 5.01, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:4:"5.01";s:9:"add_value";s:4:"4.25";}}'),
(65, 44, 45, 'test20', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model', 75.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 5.01, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:4:"5.01";s:9:"add_value";s:4:"4.25";}}'),
(66, 45, 45, 'test20', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model', 50.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 5.01, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:4:"5.01";s:9:"add_value";s:4:"4.25";}}'),
(67, 46, 45, 'test20', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model', 48.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 5.01, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:4:"5.01";s:9:"add_value";s:4:"4.25";}}'),
(68, 48, 45, 'test20', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model', 48.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 5.01, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:4:"5.01";s:9:"add_value";s:4:"4.25";}}');
INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `product_name`, `product_desc`, `product_price`, `quantity`, `product_info`, `shipping_price`, `shipping_info`) VALUES
(69, 49, 58, 'testnew', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\''s no need for hoods, gases, or flames\r\n* Small footprint â€“ 17\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" (L) x 18\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" (W) x 18\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" (H)\r\n* Low reagent costs â€“ only pre-packaged reagents needed\r\n* Reimbursable as a quantitative blood lead\r\n\r\nReagent features:\r\n\r\n* MetexchangeÂ® kits include chemical pre-treatment reagents, calibrators, controls, and performance-verification mixtures.\r\n* Unique Metexchange pre-treatment reagent eliminates the necessity of performing acid digestion\r\n* Reagents come pre-measured in easy-to-use snap-cap vials.\r\n* All reagents are manufactured and available from one trusted source â€“ ESA.', 300.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 10.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"7";}}'),
(70, 50, 60, 'test', '', 1.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";N;}'),
(71, 51, 60, 'test', '', 1.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:1:{s:2:"no";N;}'),
(72, 51, 60, 'test', '', 1.00, 1, 'a:1:{s:4:"Size";s:5:"Large";}', 0.00, 'a:1:{s:2:"no";N;}'),
(73, 52, 60, 'test', '', 1.00, 3, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";N;}'),
(74, 53, 60, 'test', '', 1.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";N;}'),
(75, 53, 61, 'tezr 2', '', 30.00, 1, 'a:1:{s:4:"Size";s:3:"xxl";}', 10.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"7";}}'),
(76, 54, 61, 'tezr 2', '', 30.00, 1, 'a:1:{s:4:"Size";s:3:"xxl";}', 10.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"7";}}'),
(77, 55, 61, 'tezr 2', '', 30.00, 1, 'a:1:{s:4:"Size";s:3:"xxl";}', 10.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"7";}}'),
(78, 56, 61, 'tezr 2', '', 30.00, 1, 'a:1:{s:4:"Size";s:3:"xxl";}', 10.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"7";}}'),
(79, 57, 58, 'testnew', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there', 668.50, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 10.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:4:"9000";}}'),
(80, 58, 164, 'Test 4', '', 12.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";N;}'),
(81, 58, 162, 'Test 2', '', 23.00, 1, 'a:1:{s:4:"Size";s:5:"Large";}', 0.00, 'a:1:{s:2:"no";N;}'),
(82, 58, 163, 'Test 3', '', 34.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:1:{s:2:"no";N;}'),
(83, 59, 164, 'Test 4', '', 12.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:1:{s:2:"no";N;}'),
(84, 59, 161, 'Test 1', '', 12.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";N;}'),
(85, 60, 156, 'tttt', '', 34.00, 3, 'a:1:{s:4:"Size";s:5:"Small";}', 1.00, 'a:1:{s:2:"no";N;}'),
(86, 60, 158, 'wefsdfg', '', 34.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";N;}'),
(87, 60, 159, 'dsfghfjhh', '', 45.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";N;}'),
(88, 61, 162, 'Test 2', '', 23.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";N;}'),
(89, 61, 161, 'Test 1', '', 12.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:1:{s:2:"no";N;}'),
(90, 62, 158, 'wefsdfg', '', 34.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:1:{s:2:"no";N;}'),
(91, 62, 159, 'dsfghfjhh', '', 45.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:1:{s:2:"no";N;}'),
(92, 63, 144, 'some name1', '', 50.00, 1, 'a:2:{s:4:"Size";s:5:"Small";s:5:"color";s:6:"Silver";}', 10.25, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:5:"10.25";s:9:"add_value";s:1:"7";}}'),
(93, 63, 142, 'some name1', '', 50.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 7.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:5:"10.25";s:9:"add_value";s:1:"7";}}'),
(94, 64, 155, 'Product 1', 'sdga sg sdflgj sljsgf gÐ¿Ð¾Ð²Ð¿ sjghsdk fjg sdfg sdfjg sdlfkgsdflgeri vnlsucn eacnwieafhsadf wefjwef sdklf ÑƒÑ†ÑˆÑ‰Ð°Ð¾Ñ‹Ð²ÑŽÐ°Ñ„ nfweoifsdfn weifsd afneowifj sdafm Ð¶ÑƒÐ°Ñ‹Ð²ÑˆÑŒÐ° eifnasifsdkfweijfs mfisd sddg ', 100.00, 3, 'a:1:{s:4:"Size";s:5:"Small";}', 50.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"20";s:9:"add_value";s:2:"15";}}'),
(95, 68, 159, 'dsfghfjhh', '', 45.00, 1, 'a:1:{s:4:"Size";s:5:"Large";}', 0.00, 'a:1:{s:2:"no";N;}'),
(96, 69, 163, 'Test 3', '', 34.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";N;}'),
(97, 70, 166, '123456789012345678901123456789012345678912345678901234567890112345678901234567891234567890123456789011234567890123456789123456789012345678901123456789012345678912345678901234567890112345678901234567891234567890123456789011234567890123456789', '', 50.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";N;}'),
(98, 71, 158, 'wefsdfg', '', 34.00, 1, 'a:1:{s:4:"Size";s:5:"Large";}', 0.00, 'a:1:{s:2:"no";N;}'),
(99, 71, 157, 'test3', '', 245.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 20.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"20";s:9:"add_value";s:2:"18";}}'),
(100, 71, 159, 'dsfghfjhh', '', 45.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 0.00, 'a:1:{s:2:"no";N;}'),
(101, 71, 157, 'test3', '', 245.00, 1, 'a:1:{s:4:"Size";s:5:"Large";}', 18.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"20";s:9:"add_value";s:2:"18";}}'),
(102, 71, 155, 'Product 1', 'sdga sg sdflgj sljsgf gÐ¿Ð¾Ð²Ð¿ sjghsdk fjg sdfg sdfjg sdlfkgsdflgeri vnlsucn eacnwieafhsadf wefjwef sdklf ÑƒÑ†ÑˆÑ‰Ð°Ð¾Ñ‹Ð²ÑŽÐ°Ñ„ nfweoifsdfn weifsd afneowifj sdafm Ð¶ÑƒÐ°Ñ‹Ð²ÑˆÑŒÐ° eifnasifsdkfweijfs mfisd sddg ', 100.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 15.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"20";s:9:"add_value";s:2:"15";}}'),
(103, 72, 166, '123456789012345678901123456789012345678912345678901234567890112345678901234567891234567890123456789011234567890123456789123456789012345678901123456789012345678912345678901234567890112345678901234567891234567890123456789011234567890123456789', '', 50.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:1:{s:2:"no";N;}'),
(104, 73, 155, 'Product 1', 'sdga sg sdflgj sljsgf gÐ¿Ð¾Ð²Ð¿ sjghsdk fjg sdfg sdfjg sdlfkgsdflgeri vnlsucn eacnwieafhsadf wefjwef sdklf ÑƒÑ†ÑˆÑ‰Ð°Ð¾Ñ‹Ð²ÑŽÐ°Ñ„ nfweoifsdfn weifsd afneowifj sdafm Ð¶ÑƒÐ°Ñ‹Ð²ÑˆÑŒÐ° eifnasifsdkfweijfs mfisd sddg ', 100.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 20.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"20";s:9:"add_value";s:2:"15";}}'),
(105, 74, 156, 'tttt', '', 34.00, 3, 'a:1:{s:4:"Size";s:5:"Small";}', 4.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:1:"2";s:9:"add_value";s:1:"1";}}'),
(106, 75, 156, 'tttt', '', 34.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 2.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:1:"2";s:9:"add_value";s:1:"1";}}'),
(107, 76, 171, 'sdfgdgf', 'dgfdfsgd', 34.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:1:{s:2:"no";N;}'),
(108, 77, 171, 'sdfgdgf', 'dgfdfsgd', 34.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 15.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"15";s:9:"add_value";s:1:"5";}}'),
(109, 78, 166, 'ale-na', '', 50.00, 2, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:1:{s:2:"no";N;}'),
(110, 79, 166, 'ale-na', '', 50.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:1:{s:2:"no";N;}'),
(111, 80, 166, 'ale-na', '', 50.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:1:{s:2:"no";N;}'),
(112, 81, 166, 'ale-na', '', 50.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:1:{s:2:"no";N;}'),
(113, 82, 166, 'ale-na', '', 50.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:2:{s:2:"no";N;s:4:"link";a:2:{s:3:"key";s:32:"1378b037b27ee4e32395af3a0e416fd9";s:7:"expires";i:1249562151;}}'),
(114, 83, 166, 'ale-na', '', 50.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:2:{s:2:"no";N;s:4:"link";a:2:{s:3:"key";s:32:"c6645beaa03145a5d91f92721ea8692e";s:7:"expires";i:1249562407;}}'),
(115, 84, 166, 'ale-na', '', 50.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:2:{s:2:"no";N;s:4:"link";a:2:{s:3:"key";s:32:"2aef63a96ad46dd6635ddfd27f9bb3c5";s:7:"expires";i:1249562536;}}'),
(116, 85, 166, 'ale-na', '', 50.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:1:{s:2:"no";N;}'),
(117, 86, 166, 'ale-na', '', 50.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:1:{s:2:"no";N;}'),
(118, 87, 166, 'ale-na', '', 50.00, 1, 'a:1:{s:4:"Size";s:6:"Medium";}', 0.00, 'a:2:{s:2:"no";N;s:4:"link";a:3:{s:3:"key";s:32:"80cd2247d68a3e6333d8d9841e07949c";s:7:"expires";i:1249571002;s:4:"path";s:74:"C:/WebServer/xampp/htdocs/sellcast-2/data/stores/0/9/products/sold/118.zip";}}'),
(119, 88, 155, 'Product 1', 'sdga sg sdflgj sljsgf gÐ¿Ð¾Ð²Ð¿ sjghsdk fjg sdfg sdfjg sdlfkgsdflgeri vnlsucn eacnwieafhsadf wefjwef sdklf ÑƒÑ†ÑˆÑ‰Ð°Ð¾Ñ‹Ð²ÑŽÐ°Ñ„ nfweoifsdfn weifsd afneowifj sdafm Ð¶ÑƒÐ°Ñ‹Ð²ÑˆÑŒÐ° eifnasifsdkfweijfs mfisd sddg ', 45.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 20.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"20";s:9:"add_value";s:2:"15";}}'),
(120, 89, 156, 'Product 2', '', 34.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 1.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:1:"2";s:9:"add_value";s:1:"1";}}'),
(121, 89, 155, 'Product 1', 'sdga sg sdflgj sljsgf gÐ¿Ð¾Ð²Ð¿ sjghsdk fjg sdfg sdfjg sdlfkgsdflgeri vnlsucn eacnwieafhsadf wefjwef sdklf ÑƒÑ†ÑˆÑ‰Ð°Ð¾Ñ‹Ð²ÑŽÐ°Ñ„ nfweoifsdfn weifsd afneowifj sdafm Ð¶ÑƒÐ°Ñ‹Ð²ÑˆÑŒÐ° eifnasifsdkfweijfs mfisd sddg ', 45.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 20.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"20";s:9:"add_value";s:2:"15";}}'),
(122, 90, 155, 'Product 1', 'sdga sg sdflgj sljsgf gÐ¿Ð¾Ð²Ð¿ sjghsdk fjg sdfg sdfjg sdlfkgsdflgeri vnlsucn eacnwieafhsadf wefjwef sdklf ÑƒÑ†ÑˆÑ‰Ð°Ð¾Ñ‹Ð²ÑŽÐ°Ñ„ nfweoifsdfn weifsd afneowifj sdafm Ð¶ÑƒÐ°Ñ‹Ð²ÑˆÑŒÐ° eifnasifsdkfweijfs mfisd sddg ', 45.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 20.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"20";s:9:"add_value";s:2:"15";}}'),
(123, 91, 155, 'Product 1', 'sdga sg sdflgj sljsgf gÐ¿Ð¾Ð²Ð¿ sjghsdk fjg sdfg sdfjg sdlfkgsdflgeri vnlsucn eacnwieafhsadf wefjwef sdklf ÑƒÑ†ÑˆÑ‰Ð°Ð¾Ñ‹Ð²ÑŽÐ°Ñ„ nfweoifsdfn weifsd afneowifj sdafm Ð¶ÑƒÐ°Ñ‹Ð²ÑˆÑŒÐ° eifnasifsdkfweijfs mfisd sddg ', 45.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 20.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"20";s:9:"add_value";s:2:"15";}}'),
(124, 92, 155, 'Product 1', 'sdga sg sdflgj sljsgf gÐ¿Ð¾Ð²Ð¿ sjghsdk fjg sdfg sdfjg sdlfkgsdflgeri vnlsucn eacnwieafhsadf wefjwef sdklf ÑƒÑ†ÑˆÑ‰Ð°Ð¾Ñ‹Ð²ÑŽÐ°Ñ„ nfweoifsdfn weifsd afneowifj sdafm Ð¶ÑƒÐ°Ñ‹Ð²ÑˆÑŒÐ° eifnasifsdkfweijfs mfisd sddg ', 45.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 20.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"20";s:9:"add_value";s:2:"15";}}'),
(125, 93, 155, 'Product 1', 'sdga sg sdflgj sljsgf gÐ¿Ð¾Ð²Ð¿ sjghsdk fjg sdfg sdfjg sdlfkgsdflgeri vnlsucn eacnwieafhsadf wefjwef sdklf ÑƒÑ†ÑˆÑ‰Ð°Ð¾Ñ‹Ð²ÑŽÐ°Ñ„ nfweoifsdfn weifsd afneowifj sdafm Ð¶ÑƒÐ°Ñ‹Ð²ÑˆÑŒÐ° eifnasifsdkfweijfs mfisd sddg ', 45.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 20.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"20";s:9:"add_value";s:2:"15";}}'),
(126, 94, 155, 'Product 1', 'sdga sg sdflgj sljsgf gÐ¿Ð¾Ð²Ð¿ sjghsdk fjg sdfg sdfjg sdlfkgsdflgeri vnlsucn eacnwieafhsadf wefjwef sdklf ÑƒÑ†ÑˆÑ‰Ð°Ð¾Ñ‹Ð²ÑŽÐ°Ñ„ nfweoifsdfn weifsd afneowifj sdafm Ð¶ÑƒÐ°Ñ‹Ð²ÑˆÑŒÐ° eifnasifsdkfweijfs mfisd sddg ', 45.00, 1, 'a:1:{s:4:"Size";s:5:"Small";}', 20.00, 'a:1:{s:6:"custom";a:2:{s:5:"value";s:2:"20";s:9:"add_value";s:2:"15";}}'),
(127, 95, 161, 'Test 1', '', 12.00, 1, 'a:1:{s:4:"Size";s:5:"Large";}', 0.00, 'a:1:{s:2:"no";N;}'),
(128, 96, 204, 'Platechko', 'Aenean condimentum blandit blandit. Aenean nisi quam, facilisis vitae ullamcorper eget, lacinia eget ligula. Proin ullamcorper mattis aliquam. Integer sagittis tempus mi, nec rhoncus erat facilisis ut. Sed nec nisi molestie est iaculis molestie. Curabitur hendrerit tellus in diam molestie ac tristique orci lacinia. Integer nec luctus urna. Cras ultricies dui vitae mi congue id dignissim dolor dignissim. Vivamus elit sapien, egestas eget accumsan et, hendrerit ut turpis. Nullam eleifend vestibulum magna, eu hendrerit sapien sollicitudin nec. Phasellus id felis odio, non gravida nibh. ', 1.00, 1, 'a:2:{s:4:"Size";s:5:"Small";s:5:"Color";s:3:"Red";}', 0.00, 'a:1:{s:2:"no";N;}');

-- --------------------------------------------------------

--
-- Структура таблицы `partner`
--

DROP TABLE IF EXISTS `partner`;
CREATE TABLE IF NOT EXISTS `partner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `partner`
--

INSERT INTO `partner` (`id`, `name`) VALUES
(1, 'azboutiques.com');

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `add_date` datetime NOT NULL,
  `store_id` int(11) unsigned NOT NULL,
  `amount` float(10,2) unsigned NOT NULL,
  `state` enum('waiting','done','canceled') NOT NULL DEFAULT 'waiting',
  `type` enum('paypal','check') DEFAULT NULL,
  `info` text COMMENT 'serialize array',
  PRIMARY KEY (`id`),
  KEY `add_date` (`add_date`),
  KEY `state` (`state`),
  KEY `store_id` (`store_id`),
  KEY `amount` (`amount`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=95 ;

--
-- Дамп данных таблицы `payment`
--

INSERT INTO `payment` (`id`, `add_date`, `store_id`, `amount`, `state`, `type`, `info`) VALUES
(1, '2008-10-21 16:48:29', 13, 282.54, 'waiting', 'paypal', 'a:1:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";}'),
(2, '2008-10-21 16:51:09', 13, 282.54, 'waiting', 'paypal', 'a:2:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:5:"error";s:41:"Restricted account: Account is restricted";}'),
(3, '2008-10-21 17:16:31', 13, 282.54, 'waiting', 'paypal', 'a:2:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:5:"error";s:41:"Restricted account: Account is restricted";}'),
(4, '2008-10-21 17:23:45', 13, 314.48, 'waiting', 'paypal', 'a:2:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:5:"error";s:41:"Restricted account: Account is restricted";}'),
(5, '2008-10-21 17:53:24', 13, 314.48, 'waiting', 'paypal', 'a:2:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:5:"error";s:41:"Restricted account: Account is restricted";}'),
(6, '2008-10-21 18:04:49', 13, 282.54, 'waiting', 'paypal', 'a:3:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"order_id";i:37;s:5:"error";s:41:"Restricted account: Account is restricted";}'),
(7, '2008-10-21 18:11:32', 13, 282.54, 'waiting', 'paypal', 'a:3:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"order_id";i:38;s:5:"error";s:41:"Restricted account: Account is restricted";}'),
(8, '2008-10-22 09:49:10', 13, 282.54, 'waiting', 'paypal', 'a:3:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"order_id";i:39;s:5:"error";s:41:"Restricted account: Account is restricted";}'),
(9, '2008-10-22 09:59:54', 13, 10.00, 'waiting', 'paypal', 'a:2:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"order_id";N;}'),
(10, '2008-10-22 10:05:39', 13, 10.00, 'waiting', 'paypal', 'a:2:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"order_id";N;}'),
(11, '2008-10-22 10:14:05', 13, 10.00, 'waiting', 'paypal', 'a:2:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"order_id";N;}'),
(12, '2008-10-22 10:17:19', 13, 282.54, 'waiting', 'paypal', 'a:3:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"order_id";i:40;s:5:"error";s:41:"Restricted account: Account is restricted";}'),
(13, '2008-10-22 11:43:46', 13, 597.31, 'waiting', 'paypal', 'a:3:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"order_id";i:41;s:5:"error";s:41:"Restricted account: Account is restricted";}'),
(14, '2008-10-22 11:57:32', 13, 597.31, 'done', 'paypal', 'a:2:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"order_id";i:42;}'),
(15, '2008-10-22 12:01:41', 13, 22.52, 'done', 'paypal', 'a:2:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"order_id";i:43;}'),
(16, '2008-10-23 09:50:57', 13, 72.71, 'done', 'paypal', 'a:2:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"order_id";i:44;}'),
(17, '2008-10-23 09:55:48', 13, 49.90, 'done', 'paypal', 'a:2:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"order_id";i:45;}'),
(18, '2008-10-23 10:01:51', 13, 48.07, 'done', 'paypal', 'a:2:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"order_id";i:46;}'),
(19, '2008-10-23 12:17:52', 13, 48.07, 'done', 'paypal', 'a:2:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"order_id";i:48;}'),
(20, '2008-10-23 12:30:36', 36, 287.31, 'done', 'paypal', 'a:2:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"order_id";i:49;}'),
(21, '2008-11-11 15:31:17', 17, 37.11, 'done', 'paypal', 'a:2:{s:5:"email";s:13:"vova@mail.com";s:8:"order_id";i:53;}'),
(22, '2008-11-11 15:40:37', 17, 36.20, 'done', 'paypal', 'a:2:{s:5:"email";s:13:"vova@mail.com";s:8:"order_id";i:54;}'),
(23, '2008-11-11 15:43:17', 17, 36.20, 'done', 'paypal', 'a:2:{s:5:"email";s:31:"sokolo_1224665605_per@mksat.net";s:8:"order_id";i:55;}'),
(24, '2008-11-12 14:51:19', 17, 36.20, 'done', 'paypal', 'a:2:{s:5:"email";s:31:"sokolo_1224665605_per@mksat.net";s:8:"order_id";i:56;}'),
(26, '2009-02-06 10:02:13', 17, 107.86, 'done', 'paypal', 'a:3:{s:5:"email";s:31:"sokolo_1224665605_per@mksat.net";s:8:"act-code";s:32:"d76c26b4c3a482c244c5015505928466";s:8:"order_id";i:63;}'),
(63, '2009-02-06 16:53:52', 37, 4.59, 'done', 'paypal', 'a:1:{s:5:"email";s:31:"sokolo_1224665605_per@mksat.net";}'),
(64, '2009-03-20 16:59:26', 36, 417.65, 'waiting', 'paypal', 'a:3:{s:5:"email";s:18:"vladimir@skaya.net";s:8:"act-code";s:32:"78390213db1f4c5f5b6e5ed4ea0a74ca";s:8:"order_id";i:64;}'),
(65, '2009-03-20 16:59:38', 36, 0.00, 'waiting', 'paypal', 'a:3:{s:5:"email";s:18:"vladimir@skaya.net";s:8:"act-code";s:32:"78390213db1f4c5f5b6e5ed4ea0a74ca";s:8:"order_id";i:65;}'),
(66, '2009-03-20 17:00:03', 36, 0.00, 'waiting', 'paypal', 'a:3:{s:5:"email";s:18:"vladimir@skaya.net";s:8:"act-code";s:32:"78390213db1f4c5f5b6e5ed4ea0a74ca";s:8:"order_id";i:66;}'),
(67, '2009-03-20 17:00:27', 36, 0.00, 'done', 'paypal', 'a:3:{s:5:"email";s:18:"vladimir@skaya.net";s:8:"act-code";s:32:"78390213db1f4c5f5b6e5ed4ea0a74ca";s:8:"order_id";i:67;}'),
(68, '2009-03-24 13:46:41', 36, 40.76, 'done', 'paypal', 'a:3:{s:5:"email";s:18:"vladimir@skaya.net";s:8:"act-code";s:32:"78390213db1f4c5f5b6e5ed4ea0a74ca";s:8:"order_id";i:68;}'),
(69, '2009-03-24 13:46:45', 37, 30.73, 'done', 'paypal', 'a:3:{s:5:"email";s:18:"vladimir@skaya.net";s:8:"act-code";s:32:"fe3672d2a9795c7e8043a30116f5ecd6";s:8:"order_id";i:69;}'),
(70, '2009-04-16 16:23:09', 36, 670.88, 'done', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224577401_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:71;}'),
(71, '2009-04-22 18:49:20', 9, 45.33, 'done', 'paypal', 'a:1:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";}'),
(72, '2009-04-22 18:51:16', 9, 45.33, 'done', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:72;}'),
(74, '2009-04-30 11:45:56', 36, 97.39, 'waiting', 'paypal', 'a:5:{s:5:"email";s:31:"sokolo_1224577401_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:74;s:5:"error";s:62:"Masspay server unavailable: The mass pay server is unavailable";}'),
(75, '2009-04-30 11:51:44', 36, 97.39, 'waiting', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224577401_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:74;}'),
(76, '2009-04-30 11:53:13', 36, 97.39, 'waiting', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224577401_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:74;}'),
(77, '2009-04-30 11:56:28', 36, 97.39, 'waiting', 'paypal', 'a:5:{s:5:"email";s:31:"sokolo_1224577401_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:74;s:5:"error";s:81:"Insufficient funds: The account does not have sufficient funds to do this masspay";}'),
(78, '2009-04-30 11:57:48', 36, 97.39, 'canceled', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224577401_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:74;}'),
(79, '2009-04-30 12:00:37', 36, 32.55, 'done', 'paypal', 'a:5:{s:5:"email";s:31:"sokolo_1224577401_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:75;s:5:"error";s:81:"Insufficient funds: The account does not have sufficient funds to do this masspay";}'),
(80, '2009-05-15 16:14:54', 36, 97.39, 'done', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224577401_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:74;}'),
(81, '2009-06-03 15:28:23', 36, 44.41, 'done', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224577401_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:77;}'),
(82, '2009-08-04 16:42:03', 9, 91.80, 'waiting', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:78;}'),
(83, '2009-08-04 17:07:07', 9, 91.80, 'done', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:78;}'),
(84, '2009-08-04 17:08:29', 9, 45.33, 'done', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:79;}'),
(85, '2009-08-04 17:19:36', 9, 45.33, 'done', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:80;}'),
(86, '2009-08-04 17:22:55', 9, 45.33, 'done', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:79;}'),
(87, '2009-08-04 17:29:08', 9, 45.33, 'done', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:81;}'),
(88, '2009-08-04 17:41:30', 9, 45.33, 'done', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:80;}'),
(89, '2009-08-05 15:35:53', 9, 45.33, 'done', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:82;}'),
(90, '2009-08-05 15:40:09', 9, 45.33, 'done', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:83;}'),
(91, '2009-08-05 15:42:18', 9, 45.33, 'done', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:84;}'),
(92, '2009-08-05 17:36:47', 9, 45.33, 'done', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:85;}'),
(93, '2009-08-05 17:41:41', 9, 45.33, 'done', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:86;}'),
(94, '2009-08-05 18:03:24', 9, 45.33, 'done', 'paypal', 'a:4:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;s:8:"order_id";i:87;}');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `descr` text,
  `display_order` int(11) NOT NULL DEFAULT '0',
  `thumb_id` int(11) unsigned DEFAULT '0',
  `thumb_ext` varchar(4) DEFAULT NULL,
  `status` enum('active','hidden','sold_out','coming_soon') NOT NULL DEFAULT 'active',
  `quantity` int(4) unsigned DEFAULT NULL,
  `price` float(10,2) NOT NULL DEFAULT '0.00',
  `sale` float unsigned NOT NULL DEFAULT '0',
  `use_tag` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `shipping_type` enum('no','ups','fedex','custom') NOT NULL DEFAULT 'no',
  `shipping_values` text COMMENT 'serialize array',
  `type` set('wear+carry','space+place','print+paper','download+play') NOT NULL,
  `add_dt` datetime NOT NULL,
  `buy_count` int(11) unsigned NOT NULL DEFAULT '0',
  `label_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `type` (`type`),
  KEY `buy_count` (`buy_count`),
  KEY `display_order` (`display_order`),
  KEY `status` (`status`),
  KEY `add_dt` (`add_dt`),
  KEY `label_id` (`label_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=234 ;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `store_id`, `name`, `descr`, `display_order`, `thumb_id`, `thumb_ext`, `status`, `quantity`, `price`, `sale`, `use_tag`, `shipping_type`, `shipping_values`, `type`, `add_dt`, `buy_count`, `label_id`) VALUES
(26, 13, 'test1', '', 17, 54, 'jpg', 'active', NULL, 1.00, 0, 1, 'no', '0.00', '', '2008-05-20 09:45:43', 0, NULL),
(27, 13, 'test2', '', 18, 55, 'jpg', 'active', NULL, 2.00, 0, 1, 'no', '0.00', '', '2008-05-20 17:47:37', 0, NULL),
(28, 13, 'test3', '', 19, 56, 'jpg', 'active', NULL, 3.00, 0, 1, 'no', '0.00', '', '2008-05-20 17:48:15', 0, NULL),
(29, 13, 'test4', '', 20, 57, 'jpg', 'active', NULL, 4.00, 0, 1, 'no', '0.00', '', '2008-05-20 17:49:13', 0, NULL),
(30, 13, 'test5', '', 21, 58, 'jpg', 'active', NULL, 5.00, 0, 1, 'no', '0.00', '', '2008-05-20 17:50:16', 0, NULL),
(31, 13, 'test6', '', 22, 59, 'jpg', 'active', NULL, 6.00, 0, 1, 'no', '0.00', '', '2008-05-20 17:51:29', 0, NULL),
(32, 13, 'test7', '', 23, 60, 'jpg', 'active', NULL, 7.00, 0, 1, 'no', '0.00', '', '2008-05-20 17:52:30', 0, NULL),
(33, 13, 'test8', '', 24, 61, 'jpg', 'active', NULL, 8.00, 0, 1, 'no', '0.00', '', '2008-05-20 17:53:16', 0, NULL),
(34, 13, 'test9', '', 25, 62, 'jpg', 'active', NULL, 9.00, 0, 1, 'no', '0.00', '', '2008-05-20 17:54:38', 0, NULL),
(35, 13, 'test10', '', 26, 63, 'jpg', 'active', NULL, 10.00, 0, 1, 'no', '0.00', '', '2008-05-20 17:57:54', 0, NULL),
(36, 13, 'test11', '', 27, 64, 'jpg', 'active', NULL, 11.00, 0, 1, 'no', '0.00', '', '2008-05-20 18:07:18', 0, NULL),
(37, 13, 'test12', '', 28, 65, 'jpeg', 'active', NULL, 12.00, 0, 1, 'no', '0.00', '', '2008-05-21 09:34:10', 0, NULL),
(38, 13, 'test13', '', 29, 66, 'jpg', 'active', NULL, 13.00, 0, 1, 'no', '0.00', '', '2008-05-21 09:34:32', 0, NULL),
(39, 13, 'test14', '', 30, 67, 'jpg', 'active', NULL, 14.00, 0, 1, 'no', '0.00', '', '2008-05-21 09:35:06', 0, NULL),
(40, 13, 'test15', '', 31, 68, 'jpg', 'active', NULL, 15.00, 0, 1, 'no', '0.00', '', '2008-05-21 09:35:26', 0, NULL),
(41, 13, 'test16', '', 32, 69, 'jpg', 'active', NULL, 16.00, 0, 1, 'no', '0.00', '', '2008-05-21 10:04:54', 1, NULL),
(42, 13, 'test17', '', 33, 70, 'jpg', 'active', NULL, 17.00, 0, 1, 'no', 'N;', '', '2008-05-21 10:05:28', 3, NULL),
(43, 13, 'test18', '', 34, 71, 'jpg', 'active', NULL, 18.00, 0, 1, 'ups', 'a:5:{s:14:"14_origCountry";s:2:"US";s:13:"15_origPostal";s:5:"73301";s:9:"23_weight";s:2:"20";s:13:"47_rate_chart";s:15:"One Time Pickup";s:12:"48_container";s:3:"21S";}', '', '2008-05-21 10:05:52', 2, NULL),
(44, 13, 'test19', '', 35, 72, 'jpg', 'active', NULL, 19.00, 0, 1, 'no', 'N;', '', '2008-05-21 10:06:23', 4, NULL),
(45, 13, 'test20', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model', 36, 229, 'gif', 'sold_out', NULL, 48.00, 0, 1, 'custom', 'a:2:{s:5:"value";s:4:"5.01";s:9:"add_value";s:4:"4.25";}', '', '2008-05-21 10:06:48', 14, NULL),
(50, 9, 'wert', '', 40, 100, 'jpg', 'active', NULL, 34.00, 0, 1, 'no', 'N;', '', '2008-06-06 13:14:13', 0, NULL),
(57, 13, 'test', 'sdfgdf sdfghg Ð²Ñ€Ð°Ð¿ sdgfsd gsdfg sdfg mdfg Ð²Ð°Ð¿Ð» Ñ‹sdlfg sdlgk dflÐ» Ñ‹Ð¶Ð°Ð´Ð²Ð¿ Ñ‹Ð²dflÐ¿Ð» Ñ‹Ð²Ð´Ð°Ð¿Ñ‹dflÐ²Ð°Ð´Ð´Ð°Ð² Ð»Ð¿Ð¾Ð²Ð°Ð´Ð»Ð¿ sdfklgj dÐ²Ð°Ð¿Ð»Ð²Ñ‹Ð°Ð¶Ð¿Ð»Ð´ Ð²Ð°Ð¶Ð´Ð¿ kds''fgkdfgsd;flg', 41, 228, 'jpg', '', NULL, 345.00, 0, 1, 'no', 'N;', '', '2008-09-19 16:40:51', 4, NULL),
(58, 13, 'tes3', 'The solution for the clinical laboratory or hospital lab. Low capital investment, easy installation, and simple to run, the Model 3010B â€œblood-lead analysis without complexityâ€\r\n\r\nLead analysis in your laboratory reduces turn-around time, cuts costs, and generates revenue while providing a needed service for your community. Using proven Anodic Stripping Voltammetry (ASV) and nearly 40 years of experience, ESA makes blood-lead analysis rapid and routine, without the high costs associated with other analytical methods. The Model 3010B system, incorporating unique instrumentation and pre-packaged reagents, consists of two components. The sensor unit includes a test electrode, a stirring assembly, and two electrodes that carry current and regulate potential. This process is the heart of the ASV system. The other unit controls the analysis cycle, sorts the electronic signals, and calculates the results.\r\n\r\nModel 3010B lead analyzer features:\r\n\r\n* Easy to use â€“ highly skilled operators not required\r\n* Rapid analysis â€“ only 90 seconds per sample\r\n* Proven accuracy â€“ results have shown close correlation to the widely accepted graphite-furnace Atomic Absorption (GFAAS) methodologies, further supported by numerous proficiency surveys.\r\n* No special laboratory setup â€“ unlike AA and ICP/MS, there', 42, 115, 'jpg', 'sold_out', NULL, 668.50, 0, 1, 'custom', 'a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:4:"9000";}', 'space+place', '2008-10-03 14:23:39', 22, NULL),
(59, 14, 'rtrt', '', 43, 124, 'jpeg', 'active', NULL, 34.00, 0, 1, 'custom', 'a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"8";}', 'wear+carry,space+place', '2008-10-28 17:37:02', 0, NULL),
(141, 17, 'some name1', '', 72, 215, 'jpg', 'active', NULL, 50.00, 0, 1, 'custom', 'a:2:{s:5:"value";s:5:"10.25";s:9:"add_value";s:1:"7";}', '', '2008-12-03 17:09:32', 0, NULL),
(142, 17, 'some name1', '', 73, 216, 'jpg', 'active', NULL, 50.00, 0, 1, 'custom', 'a:2:{s:5:"value";s:5:"10.25";s:9:"add_value";s:1:"7";}', '', '2008-12-03 17:11:07', 1, NULL),
(144, 17, 'some name1', '', 75, 218, 'jpg', 'active', NULL, 50.00, 0, 1, 'custom', 'a:2:{s:5:"value";s:5:"10.25";s:9:"add_value";s:1:"7";}', '', '2008-12-03 17:13:37', 1, NULL),
(145, 31, 'Shoose', 'cool staff', 76, 219, 'jpg', 'active', NULL, 1.00, 0, 1, 'no', 'N;', 'wear+carry', '2008-12-09 12:29:09', 0, NULL),
(146, 31, 'Nice dress', 'Very cool staff', 77, 220, 'jpg', 'active', NULL, 1.00, 0, 1, 'no', 'N;', 'wear+carry', '2008-12-09 12:33:38', 0, NULL),
(147, 31, 'Bag', 'the collest bag', 78, 221, 'jpg', 'active', NULL, 1.00, 0, 1, 'no', 'N;', 'wear+carry', '2008-12-09 12:37:07', 0, NULL),
(149, 31, 'test', 'desc', 79, 223, 'jpg', 'active', NULL, 1.00, 0, 1, 'no', 'N;', 'wear+carry', '2008-12-09 12:54:58', 0, NULL),
(151, 31, 'Ð¿Ð°Ð»Ð¿Ð¾Ñ€Ð»Ñ€', 'sdfgd', 81, 275, 'jpg', 'active', NULL, 10.00, 0, 1, 'no', 'N;', '', '2008-12-17 18:16:58', 0, NULL),
(152, 31, 'test2', '', 82, 226, 'jpg', 'active', NULL, 12.00, 0, 1, 'no', 'N;', '', '2008-12-18 11:43:30', 0, NULL),
(153, 31, 'hgjh1', '', 83, 227, 'jpg', 'active', NULL, 10.00, 0, 1, 'no', 'N;', '', '2008-12-18 12:02:09', 0, NULL),
(154, 33, 'test', '', 84, 230, 'jpg', 'active', NULL, 10.00, 0, 1, 'no', 'N;', 'wear+carry', '2009-01-06 11:50:44', 0, NULL),
(155, 36, 'Product 1', 'sdga sg sdflgj sljsgf gÐ¿Ð¾Ð²Ð¿ sjghsdk fjg sdfg sdfjg sdlfkgsdflgeri vnlsucn eacnwieafhsadf wefjwef sdklf ÑƒÑ†ÑˆÑ‰Ð°Ð¾Ñ‹Ð²ÑŽÐ°Ñ„ nfweoifsdfn weifsd afneowifj sdafm Ð¶ÑƒÐ°Ñ‹Ð²ÑˆÑŒÐ° eifnasifsdkfweijfs mfisd sddg ', 85, 232, 'jpg', 'active', NULL, 45.00, 25, 0, 'custom', 'a:2:{s:5:"value";s:2:"20";s:9:"add_value";s:2:"15";}', 'wear+carry', '2009-01-06 12:01:11', 12, 4),
(156, 36, 'Product 2', '', 86, 233, 'jpg', 'active', NULL, 34.00, 0, 1, 'custom', 'a:2:{s:5:"value";s:1:"2";s:9:"add_value";s:1:"1";}', 'wear+carry', '2009-01-12 16:01:41', 6, 3),
(157, 36, 'test3', '', 87, 263, 'jpg', '', NULL, 50.00, 16.6667, 1, 'custom', 'a:2:{s:5:"value";s:2:"20";s:9:"add_value";s:2:"18";}', 'wear+carry', '2009-01-15 15:18:43', 2, 2),
(158, 36, 'wefsdfg', '', 88, 256, 'jpg', 'sold_out', NULL, 34.00, 10.0053, 1, 'no', 'N;', 'wear+carry', '2009-01-15 15:36:09', 3, 3),
(159, 36, 'dsfghfjhh', '', 89, 257, 'jpg', 'sold_out', NULL, 45.00, 29.2453, 1, 'no', 'N;', 'wear+carry', '2009-01-15 15:37:38', 4, 5),
(160, 13, '345234', '', 90, 237, 'jpg', 'active', NULL, 345.00, 0, 1, 'no', 'N;', '', '2009-01-15 17:59:07', 0, NULL),
(161, 37, 'Test 1', '', 91, 238, 'jpg', 'sold_out', NULL, 12.00, 0, 1, 'no', 'N;', 'wear+carry', '2009-01-16 09:55:46', 3, 6),
(162, 37, 'Test 2', '', 92, 242, 'jpg', 'active', NULL, 23.00, 0, 1, 'no', 'N;', 'wear+carry', '2009-01-16 09:56:17', 2, 8),
(163, 37, 'Test 3', '', 93, 240, 'jpg', 'active', NULL, 34.00, 0, 1, 'no', 'N;', 'wear+carry', '2009-01-16 09:57:19', 2, 7),
(164, 37, 'Test 4', '', 94, 241, 'jpeg', 'active', NULL, 12.00, 0, 1, 'no', 'N;', 'wear+carry', '2009-01-16 10:01:53', 2, 7),
(165, 9, 'Len', '', 95, 253, 'jpg', 'sold_out', NULL, 1.00, 101, 1, 'no', 'N;', '', '2009-04-06 11:19:58', 0, NULL),
(166, 9, 'ale-na', '', 96, 376, 'jpg', 'active', NULL, 50.00, 101, 1, 'no', 'N;', 'wear+carry,download+play', '2009-04-06 11:49:07', 13, NULL),
(167, 9, 'z600', '', 97, 255, 'jpg', 'active', NULL, 66.00, 0, 1, 'custom', 'a:2:{s:5:"value";s:4:"2.25";s:9:"add_value";s:1:"2";}', 'wear+carry', '2009-04-06 17:47:34', 0, NULL),
(168, 38, 'test333', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sit amet ipsum ligula. Pellentesque non dolor semper ipsum porttitor mollis quis sed massa. Fusce sapien velit, condimentum ac consectetur ut, pretium sit amet eros. Maecenas et nibh leo. Phasellus hendrerit bibendum eros, non elementum orci mollis eget. Nullam vel tellus purus. Vivamus sit amet urna enim. Duis vulputate semper risus, sed lacinia purus adipiscing sed. Suspendisse potenti. Duis porta, dolor et aliquet tincidunt, neque turpis vehicula ante, ac tempus diam orci nec nibh. Ut a metus nec nisi iaculis congue a in nunc. Curabitur quis tincidunt erat. ', 98, 287, 'jpg', 'active', NULL, 233.00, 101, 1, 'custom', 'a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"5";}', 'wear+carry', '2009-05-13 12:59:12', 0, 9),
(169, 39, 'tese', '', 99, 261, 'jpg', 'active', NULL, 23.00, 8, 1, 'no', 'N;', '', '2009-05-20 16:54:44', 0, NULL),
(170, 39, 'tetrtr', '', 100, 262, 'jpg', 'active', NULL, 20.00, 20, 1, 'no', 'N;', '', '2009-05-20 17:03:51', 0, NULL),
(171, 36, 'sdfgdgf', 'dgfdfsgd', 101, 264, 'jpg', 'active', NULL, 34.00, 15, 1, 'custom', 'a:2:{s:5:"value";s:2:"15";s:9:"add_value";s:1:"5";}', 'wear+carry', '2009-05-27 18:12:38', 2, 4),
(172, 31, 'fghfh', '', 102, 265, 'jpeg', 'active', NULL, 1.00, 0, 1, 'no', 'N;', '', '2009-07-06 14:20:38', 0, NULL),
(173, 31, 'dfgdfgd', '', 103, 266, 'jpg', 'active', NULL, 3.00, 0, 1, 'no', 'N;', '', '2009-07-06 14:21:00', 0, NULL),
(174, 31, 'sdddfd', '', 104, 267, 'jpg', 'active', NULL, 1.00, 0, 1, 'no', 'N;', '', '2009-07-06 14:22:00', 0, NULL),
(175, 31, 'sds12', '', 105, 268, 'jpg', 'active', NULL, 1.00, 0, 1, 'no', 'N;', '', '2009-07-06 14:22:28', 0, NULL),
(176, 31, 'dfff', '', 106, 269, 'jpg', 'active', NULL, 1.00, 0, 1, 'no', 'N;', '', '2009-07-07 11:20:38', 0, NULL),
(177, 36, 'test1', '', 107, 277, 'jpg', 'active', NULL, 12.00, 0, 1, 'custom', 'a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:2:"15";}', 'wear+carry', '2009-07-10 10:19:07', 0, 4),
(178, 31, 'zxfczddv', '', 108, 278, 'jpg', 'active', NULL, 12.00, 0, 1, 'no', 'N;', 'wear+carry', '2009-07-13 10:43:58', 0, 10),
(179, 9, 'qwerty', '', 109, 285, 'jpg', 'active', NULL, 10.00, 0, 1, 'no', 'N;', 'download+play', '2009-08-06 17:46:35', 0, NULL),
(180, 49, 'Ale-na', '', 110, 290, 'jpg', 'active', NULL, 12.00, 0, 1, 'no', 'N;', 'wear+carry', '2009-10-07 12:44:42', 0, NULL),
(181, 49, 'Product 1', '', 111, 293, 'gif', 'active', NULL, 23.00, 0, 1, 'no', 'N;', '', '2009-10-09 15:41:27', 0, NULL),
(182, 49, 'Product 2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec tortor eget augue fermentum pretium sed quis metus. Fusce aliquet dolor vitae erat accumsan at sagittis eros fringilla. Etiam in tortor urna, molestie sodales ante. Nullam nec purus purus. Vivamus tortor mauris, cursus quis lobortis vitae, ornare ut mauris. Donec auctor magna quis libero commodo fermentum aliquam nisl pulvinar. Duis nec purus lacus. Fusce viverra arcu quis libero fringilla congue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam erat volutpat. Etiam luctus, nulla quis vehicula porttitor, dui massa volutpat nibh, ac pharetra metus velit eget velit. Cras lobortis enim vel nunc pharetra rhoncus. Cras sed ligula at justo lacinia egestas. Curabitur at dui vitae ipsum mollis vestibulum eu sit amet quam. Ut auctor orci vel eros adipiscing non ultricies lorem porta.', 112, 294, 'jpg', 'active', NULL, 1.00, 0, 1, 'no', 'N;', 'wear+carry,print+paper', '2009-10-09 15:44:41', 0, NULL),
(183, 49, 'Product 3', '', 113, 295, 'jpg', 'active', NULL, 3.00, 0, 1, 'no', 'N;', 'download+play', '2009-10-09 15:45:37', 0, NULL),
(184, 49, 'Product 4', '', 114, 297, 'jpg', 'active', NULL, 4.00, 0, 1, 'no', 'N;', 'wear+carry', '2009-10-09 17:08:11', 0, NULL),
(185, 49, 'Product 5', 'Ð½Ð¸ÐºÐ¾Ð»Ð°ÐµÐ²', 115, 298, 'jpg', 'active', NULL, 4.00, 0, 1, 'no', 'N;', 'space+place', '2009-10-09 17:36:03', 0, NULL),
(186, 49, 'Product 6', 'Vestibulum dictum fringilla libero in tincidunt. Proin commodo ullamcorper arcu, et tempus dolor tincidunt vitae. Cras in purus odio, et tempus est. Cras purus orci, viverra sed ultrices sit amet, molestie sit amet mi. Aliquam placerat, nulla quis rutrum tincidunt, eros odio tempor urna, id laoreet libero sem eget elit. Sed rutrum justo id leo lacinia varius. Integer eu scelerisque augue. Donec sit amet turpis quam. Pellentesque porttitor, risus id dictum mollis, dolor velit vulputate enim, at sagittis risus nisi in neque. Integer erat nunc, pretium in bibendum suscipit, facilisis nec neque. Donec neque ante, pharetra at rhoncus a, scelerisque eu purus. ', 116, 301, 'jpg', 'active', NULL, 22.00, 0, 1, 'no', 'N;', 'wear+carry', '2009-10-09 17:39:20', 0, NULL),
(187, 49, 'Product 7', 'car', 117, 300, 'jpg', 'active', NULL, 23.00, 0, 1, 'no', 'N;', '', '2009-10-09 17:43:42', 0, NULL),
(188, 49, 'Product 8', '', 118, 302, 'jpg', 'active', NULL, 4.00, 0, 1, 'no', 'N;', 'space+place', '2009-10-09 17:56:38', 0, NULL),
(189, 49, 'Product 9', '', 119, 303, 'jpg', 'active', NULL, 14.00, 0, 1, 'no', 'N;', 'space+place', '2009-10-09 17:57:36', 0, NULL),
(190, 49, 'Product 10', '', 120, 304, 'jpg', 'active', NULL, 23.00, 0, 1, 'no', 'N;', 'wear+carry', '2009-10-09 18:00:36', 0, NULL),
(191, 49, 'Product 11', 'ddf', 121, 305, 'jpeg', 'active', NULL, 1.00, 0, 1, 'no', 'N;', 'print+paper', '2009-10-09 18:01:13', 0, NULL),
(192, 49, 'Product 12', '', 122, 306, 'jpg', 'active', NULL, 6.00, 0, 1, 'no', 'N;', 'wear+carry', '2009-10-09 18:01:45', 0, NULL),
(193, 49, 'Product 13', 'car', 123, 307, 'jpg', 'active', NULL, 22.00, 0, 1, 'no', 'N;', 'wear+carry', '2009-10-12 11:09:01', 0, NULL),
(194, 49, 'Product 14', 'box', 124, 308, 'jpg', 'active', NULL, 20.00, 0, 1, 'custom', 'a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"8";}', 'wear+carry', '2009-10-12 11:10:00', 0, NULL),
(195, 49, 'Product 15', 'aero', 125, 309, 'jpg', 'active', NULL, 2.00, 0, 1, 'no', 'N;', 'space+place', '2009-10-12 11:10:44', 0, NULL),
(196, 49, 'Product 16', 'Curabitur feugiat laoreet aliquam. Nulla mauris nisl, rutrum in pharetra eget, fringilla nec tellus. Vestibulum enim massa, pellentesque eu scelerisque in, ullamcorper venenatis lacus. Etiam sollicitudin rutrum lobortis. Mauris vitae diam ut eros hendrerit tempor et eget velit. Quisque interdum magna turpis. Donec aliquam, massa in commodo dignissim, ipsum risus ultricies massa, nec hendrerit eros diam ac mauris. Nullam nulla leo, convallis nec mattis sit amet, sollicitudin sed mi. Maecenas quis dictum mauris. Nulla imperdiet, sem non fermentum placerat, lorem massa vulputate elit, sit amet euismod lacus lacus eu ipsum. ', 126, 310, 'jpg', 'active', NULL, 34.00, 101, 1, 'no', 'N;', 'wear+carry', '2009-10-12 11:13:29', 0, NULL),
(197, 52, 'Ale-na', 'sdgdfg', 127, 333, 'jpg', 'active', NULL, 10.00, 0, 1, 'custom', 'N;', 'wear+carry', '2009-10-21 12:45:16', 0, NULL),
(198, 52, 'erw', 'sdgsdf', 128, 319, 'jpg', 'active', NULL, 23.00, 0, 1, 'no', 'N;', '', '2009-10-21 16:27:46', 0, NULL),
(199, 52, 'retujhsrgf', '', 129, 320, 'jpg', 'active', NULL, 23.00, 101, 1, 'custom', 'N;', '', '2009-10-21 16:28:11', 0, NULL),
(200, 52, 'dgjdghjgh', '', 130, 321, 'jpg', 'active', NULL, 34.00, 0, 1, 'no', 'N;', '', '2009-10-21 16:36:20', 0, NULL),
(201, 52, 'car', 'Ð¿Ð°Ñ€Ð°Ð¿', 131, 327, 'jpg', 'active', NULL, 34.00, 0, 1, 'custom', 'a:2:{s:5:"along";a:5:{s:7:"express";s:2:"45";s:4:"none";s:1:"4";s:6:"ground";s:1:"3";s:8:"priority";s:1:"4";s:13:"international";s:1:"5";}s:5:"multi";a:5:{s:7:"express";s:1:"4";s:4:"none";s:1:"5";s:6:"ground";s:1:"4";s:8:"priority";s:1:"3";s:13:"international";s:1:"4";}}', '', '2009-10-21 16:37:01', 0, NULL),
(202, 52, '4353', 'dsfgdf', 132, 343, 'jpg', 'active', NULL, 23.00, 0, 1, 'custom', 'a:1:{s:4:"none";a:2:{s:5:"along";s:1:"3";s:5:"multi";s:1:"2";}}', '', '2009-12-11 11:24:05', 0, NULL),
(203, 53, 'Test Product', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget pretium nibh. Donec tristique, nunc id pretium placerat, diam risus vestibulum neque, nec sodales nisi erat vel ligula. Etiam lobortis sem vitae turpis porttitor sed malesuada orci dapibus. Integer egestas mauris vitae diam vestibulum volutpat tempus est ornare. Sed aliquet fermentum nisl, sed sodales arcu laoreet a. Proin vitae lorem in lectus ultricies tempus et quis libero.', 133, 349, 'jpg', 'active', NULL, 10.00, 0, 1, 'custom', 'N;', 'wear+carry', '2009-12-18 17:48:16', 0, 11),
(204, 54, 'Platechko', 'Aenean condimentum blandit blandit. Aenean nisi quam, facilisis vitae ullamcorper eget, lacinia eget ligula. Proin ullamcorper mattis aliquam. Integer sagittis tempus mi, nec rhoncus erat facilisis ut. Sed nec nisi molestie est iaculis molestie. Curabitur hendrerit tellus in diam molestie ac tristique orci lacinia. Integer nec luctus urna. Cras ultricies dui vitae mi congue id dignissim dolor dignissim. Vivamus elit sapien, egestas eget accumsan et, hendrerit ut turpis. Nullam eleifend vestibulum magna, eu hendrerit sapien sollicitudin nec. Phasellus id felis odio, non gravida nibh. ', 134, 360, 'jpg', 'coming_soon', NULL, 12.00, 20, 1, 'no', 'N;', 'wear+carry', '2010-01-06 11:29:59', 1, 12),
(205, 54, 'Test2', 'desc sdga sdfgsdf g Ñ€Ñ‹Ð²Ð»Ð°Ð´Ð¿Ð°Ð²Ð»Ð¾Ð¿Ñ‹ Ð°Ð¿Ð»Ñ‹Ð²Ð°Ð¿Ð´Ð»Ñ‹Ð¾ÑƒÐ·Ð¼Ñ‚Ñ‹Ð²Ñ„Ð´', 135, 363, 'jpg', 'active', NULL, 100.00, 50, 1, 'custom', 'a:2:{s:5:"value";s:0:"";s:9:"add_value";s:0:"";}', 'wear+carry', '2010-01-26 11:48:21', 0, NULL),
(206, 54, 'My first test', '', 136, 365, 'jpg', 'active', NULL, 34.00, 0, 1, 'custom', 'a:2:{s:5:"value";s:0:"";s:9:"add_value";s:0:"";}', 'wear+carry', '2010-01-26 15:39:10', 0, NULL),
(207, 54, 'My Second test2', 'sddgf2', 137, 393, 'jpg', 'sold_out', NULL, 50.00, 0, 1, 'custom', 'a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:2:"85";}', 'wear+carry', '2010-01-26 17:48:30', 0, NULL),
(216, 54, 'Member''s Area', 'sdfds', 138, 392, 'jpg', 'coming_soon', NULL, 23.00, 14.8148, 1, 'no', 'N;', 'wear+carry', '2010-02-03 16:09:41', 0, NULL),
(217, 54, 'My Test', 'Ð²Ð°Ð¿', 139, 381, 'jpg', 'active', NULL, 1.00, 0, 1, 'no', 'N;', 'wear+carry', '2010-02-04 17:15:59', 0, NULL),
(218, 54, 'test7', 'sss', 140, 382, 'jpg', 'active', NULL, 1.00, 0, 1, 'no', 'N;', 'wear+carry', '2010-02-04 17:34:36', 0, NULL),
(219, 56, 'My Voffka Test', '', 141, 383, 'jpg', 'active', NULL, 10.00, 20, 1, 'no', 'N;', 'wear+carry', '2010-02-11 16:00:32', 0, NULL),
(220, 56, 'Next Voffka', '', 142, 384, 'gif', 'active', NULL, 23.00, 0, 1, 'no', 'N;', 'wear+carry', '2010-02-11 16:02:48', 0, NULL),
(221, 56, 'Test me', '', 143, 385, 'jpg', 'active', NULL, 12.00, 20, 1, 'no', 'N;', 'wear+carry', '2010-02-11 18:27:16', 0, NULL),
(222, 57, 'Test me DISIGNER', 'fddf', 144, 386, 'jpg', 'active', NULL, 12.00, 0, 1, 'no', 'N;', 'wear+carry', '2010-02-16 12:43:59', 0, NULL),
(223, 57, 'Nest', 'fdgdfgdf', 145, 387, 'jpg', 'active', NULL, 5.00, 0, 1, 'no', 'N;', 'wear+carry', '2010-02-16 12:44:54', 0, NULL),
(224, 57, 'Test3', '', 146, 388, 'jpg', 'active', NULL, 5.00, 50, 1, 'no', 'N;', 'wear+carry', '2010-02-17 11:59:27', 0, NULL),
(225, 58, 'Hat', 'test', 147, 389, 'jpg', 'active', NULL, 50.00, 10.0072, 1, 'no', 'N;', 'wear+carry', '2010-02-18 18:17:20', 0, NULL),
(226, 58, 'Test', '', 148, 390, 'jpg', 'active', NULL, 77.00, 20, 1, 'no', 'N;', 'wear+carry', '2010-02-18 18:21:15', 0, NULL),
(227, 58, 'Test2', 'dsdsd', 149, 391, 'jpg', 'active', NULL, 100.00, 15.0021, 1, 'custom', 'a:2:{s:5:"value";s:2:"10";s:9:"add_value";s:1:"5";}', 'wear+carry', '2010-02-18 18:26:08', 0, NULL),
(233, 58, 'vs1 test product', 'df hf', 0, 0, NULL, '', NULL, 0.00, 0, 1, 'no', NULL, '', '0000-00-00 00:00:00', 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `product_designer`
--

DROP TABLE IF EXISTS `product_designer`;
CREATE TABLE IF NOT EXISTS `product_designer` (
  `product_id` int(10) unsigned NOT NULL,
  `designer_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `product_id_2` (`product_id`,`designer_id`),
  KEY `product_id` (`product_id`),
  KEY `designer_id` (`designer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_designer`
--

INSERT INTO `product_designer` (`product_id`, `designer_id`) VALUES
(204, 61),
(205, 64),
(206, 5),
(207, 15),
(216, 52),
(217, 49),
(218, 53),
(219, 49),
(220, 47),
(221, 63),
(222, 64),
(223, 64),
(224, 64),
(225, 65),
(226, 66),
(227, 67);

-- --------------------------------------------------------

--
-- Структура таблицы `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `ext` varchar(5) NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `product_images`
--


-- --------------------------------------------------------

--
-- Структура таблицы `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` char(32) NOT NULL DEFAULT '',
  `modified` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `session`
--

INSERT INTO `session` (`id`, `modified`, `lifetime`, `data`) VALUES
('88e75d3078e306c815a5cc939eea6ab4', 1273673776, 1440, ''),
('235bd97ec8d5b183ff1a17109ee969df', 1273675787, 1440, 'Zend_Auth|a:1:{s:7:"storage";O:11:"Model_Store":4:{s:13:"\0*\0_modelName";s:5:"store";s:14:"\0*\0_mapperType";s:2:"db";s:8:"\0*\0_data";a:29:{s:6:"domain";s:4:"vova";s:2:"id";i:9;s:12:"company_name";s:19:"Mega Market Sokolov";s:10:"owner_name";s:16:"Vladimir Sokolov";s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:3:"url";N;s:8:"timezone";i:39;s:16:"is_daylight_time";i:0;s:15:"timezone_offset";d:2;s:5:"descr";s:0:"";s:8:"logo_ext";s:3:"jpg";s:12:"community_id";i:0;s:4:"type";s:24:"wear+carry,download+play";s:8:"reg_date";s:19:"0000-00-00 00:00:00";s:15:"is_order_inform";i:1;s:11:"order_email";N;s:10:"iframe_url";N;s:19:"purchase_percentage";d:0;s:12:"purchase_fee";d:0;s:11:"payout_type";s:6:"paypal";s:11:"payout_info";s:118:"a:1:{s:6:"paypal";a:3:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;}}";s:6:"policy";N;s:5:"state";s:6:"active";s:10:"vote_count";i:0;s:8:"vote_sum";i:0;s:11:"login_count";i:17;s:13:"lastLoginDate";i:1273674848;s:10:"partner_id";N;s:4:"role";s:5:"store";}s:11:"\0*\0_mappers";a:1:{s:8:"store_db";O:21:"Model_Mapper_Db_Store":3:{s:16:"\0*\0_fieldMapping";a:2:{s:8:"password";s:6:"passwd";s:13:"lastLoginDate";s:15:"last_login_date";}s:19:"\0*\0_mapperTableName";s:6:"stores";s:23:"\0*\0_reverseFieldMapping";a:2:{s:6:"passwd";s:8:"password";s:15:"last_login_date";s:13:"lastLoginDate";}}}}}'),
('2253880744071683d5dfac8a0a39e986', 1273676640, 1440, ''),
('f8b992b28bf573b40a7f6dc82568912d', 1273671792, 1440, ''),
('2a31e8d2ac4a87334b420055ccf715b5', 1273671465, 1440, ''),
('dd0dba0fd4e7a055ed36d2e356da469c', 1273672772, 1440, 'Zend_Auth|a:1:{s:7:"storage";O:11:"Model_Store":4:{s:13:"\0*\0_modelName";s:5:"store";s:14:"\0*\0_mapperType";s:2:"db";s:8:"\0*\0_data";a:29:{s:6:"domain";s:4:"vova";s:2:"id";i:9;s:12:"company_name";s:19:"Mega Market Sokolov";s:10:"owner_name";s:16:"Vladimir Sokolov";s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:3:"url";N;s:8:"timezone";i:39;s:16:"is_daylight_time";i:0;s:15:"timezone_offset";d:2;s:5:"descr";s:0:"";s:8:"logo_ext";s:3:"jpg";s:12:"community_id";i:0;s:4:"type";s:24:"wear+carry,download+play";s:8:"reg_date";s:19:"0000-00-00 00:00:00";s:15:"is_order_inform";i:1;s:11:"order_email";N;s:10:"iframe_url";N;s:19:"purchase_percentage";d:0;s:12:"purchase_fee";d:0;s:11:"payout_type";s:6:"paypal";s:11:"payout_info";s:118:"a:1:{s:6:"paypal";a:3:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;}}";s:6:"policy";N;s:5:"state";s:6:"active";s:10:"vote_count";i:0;s:8:"vote_sum";i:0;s:11:"login_count";i:17;s:13:"lastLoginDate";i:1273671484;s:10:"partner_id";N;s:4:"role";s:5:"store";}s:11:"\0*\0_mappers";a:1:{s:8:"store_db";O:21:"Model_Mapper_Db_Store":3:{s:16:"\0*\0_fieldMapping";a:2:{s:8:"password";s:6:"passwd";s:13:"lastLoginDate";s:15:"last_login_date";}s:19:"\0*\0_mapperTableName";s:6:"stores";s:23:"\0*\0_reverseFieldMapping";a:2:{s:6:"passwd";s:8:"password";s:15:"last_login_date";s:13:"lastLoginDate";}}}}}'),
('dcbebe25414660282114f24937c4f8a3', 1273673070, 1440, ''),
('460017a3e076f8f00ccc4c6ccac5cd54', 1273675198, 1440, ''),
('52230ffebb62cf35290edc5d1b2eb064', 1273670190, 1440, ''),
('704fc3c8804a205fd565b6f0decf9856', 1273668816, 1440, 'Zend_Auth|a:1:{s:7:"storage";O:11:"Model_Store":4:{s:13:"\0*\0_modelName";s:5:"store";s:14:"\0*\0_mapperType";s:2:"db";s:8:"\0*\0_data";a:29:{s:6:"domain";s:4:"vova";s:2:"id";i:9;s:12:"company_name";s:19:"Mega Market Sokolov";s:10:"owner_name";s:16:"Vladimir Sokolov";s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:3:"url";N;s:8:"timezone";i:39;s:16:"is_daylight_time";i:0;s:15:"timezone_offset";d:2;s:5:"descr";s:0:"";s:8:"logo_ext";s:3:"jpg";s:12:"community_id";i:0;s:4:"type";s:24:"wear+carry,download+play";s:8:"reg_date";s:19:"0000-00-00 00:00:00";s:15:"is_order_inform";i:1;s:11:"order_email";N;s:10:"iframe_url";N;s:19:"purchase_percentage";d:0;s:12:"purchase_fee";d:0;s:11:"payout_type";s:6:"paypal";s:11:"payout_info";s:118:"a:1:{s:6:"paypal";a:3:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;}}";s:6:"policy";N;s:5:"state";s:6:"active";s:10:"vote_count";i:0;s:8:"vote_sum";i:0;s:11:"login_count";i:17;s:13:"lastLoginDate";i:1273668811;s:10:"partner_id";N;s:4:"role";s:5:"store";}s:11:"\0*\0_mappers";a:1:{s:8:"store_db";O:21:"Model_Mapper_Db_Store":3:{s:16:"\0*\0_fieldMapping";a:2:{s:8:"password";s:6:"passwd";s:13:"lastLoginDate";s:15:"last_login_date";}s:19:"\0*\0_mapperTableName";s:6:"stores";s:23:"\0*\0_reverseFieldMapping";a:2:{s:6:"passwd";s:8:"password";s:15:"last_login_date";s:13:"lastLoginDate";}}}}}'),
('dc3af32a75bdd8d66f1e3a585af3f8a7', 1273668666, 1440, 'Zend_Auth|a:1:{s:7:"storage";O:11:"Model_Store":4:{s:13:"\0*\0_modelName";s:5:"store";s:14:"\0*\0_mapperType";s:2:"db";s:8:"\0*\0_data";a:29:{s:6:"domain";s:4:"vova";s:2:"id";i:9;s:12:"company_name";s:19:"Mega Market Sokolov";s:10:"owner_name";s:16:"Vladimir Sokolov";s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:3:"url";N;s:8:"timezone";i:39;s:16:"is_daylight_time";i:0;s:15:"timezone_offset";d:2;s:5:"descr";s:0:"";s:8:"logo_ext";s:3:"jpg";s:12:"community_id";i:0;s:4:"type";s:24:"wear+carry,download+play";s:8:"reg_date";s:19:"0000-00-00 00:00:00";s:15:"is_order_inform";i:1;s:11:"order_email";N;s:10:"iframe_url";N;s:19:"purchase_percentage";d:0;s:12:"purchase_fee";d:0;s:11:"payout_type";s:6:"paypal";s:11:"payout_info";s:118:"a:1:{s:6:"paypal";a:3:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;}}";s:6:"policy";N;s:5:"state";s:6:"active";s:10:"vote_count";i:0;s:8:"vote_sum";i:0;s:11:"login_count";i:17;s:13:"lastLoginDate";i:1273667333;s:10:"partner_id";N;s:4:"role";s:5:"store";}s:11:"\0*\0_mappers";a:1:{s:8:"store_db";O:21:"Model_Mapper_Db_Store":3:{s:16:"\0*\0_fieldMapping";a:2:{s:8:"password";s:6:"passwd";s:13:"lastLoginDate";s:15:"last_login_date";}s:19:"\0*\0_mapperTableName";s:6:"stores";s:23:"\0*\0_reverseFieldMapping";a:2:{s:6:"passwd";s:8:"password";s:15:"last_login_date";s:13:"lastLoginDate";}}}}}'),
('ea1bf1f21ea0fd5e2d1f638a423af57d', 1273668084, 1440, '');

-- --------------------------------------------------------

--
-- Структура таблицы `store`
--

DROP TABLE IF EXISTS `store`;
CREATE TABLE IF NOT EXISTS `store` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(64) NOT NULL,
  `passwd` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `company_name` varchar(255) NOT NULL DEFAULT '',
  `owner_name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) DEFAULT NULL,
  `timezone` tinyint(1) unsigned DEFAULT NULL,
  `is_daylight_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timezone_offset` float DEFAULT NULL,
  `descr` text,
  `logo_ext` varchar(4) DEFAULT NULL,
  `community_id` int(11) unsigned NOT NULL DEFAULT '0',
  `type` set('wear+carry','space+place','print+paper','download+play') NOT NULL,
  `reg_date` datetime NOT NULL,
  `is_order_inform` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `order_email` varchar(255) DEFAULT NULL,
  `iframe_url` varchar(255) DEFAULT NULL,
  `purchase_percentage` float(4,2) unsigned NOT NULL DEFAULT '0.00',
  `purchase_fee` float(5,2) unsigned NOT NULL DEFAULT '0.00',
  `payout_type` enum('paypal','check') DEFAULT NULL,
  `payout_info` text COMMENT 'serialize array',
  `policy` text,
  `state` enum('active','deactive') NOT NULL DEFAULT 'active',
  `vote_count` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `vote_sum` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `login_count` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login_date` datetime DEFAULT NULL,
  `partner_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`),
  KEY `type` (`type`),
  KEY `state` (`state`),
  KEY `reg_date` (`reg_date`),
  KEY `partner_id` (`partner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=76 ;

--
-- Дамп данных таблицы `store`
--

INSERT INTO `store` (`id`, `domain`, `passwd`, `company_name`, `owner_name`, `email`, `url`, `timezone`, `is_daylight_time`, `timezone_offset`, `descr`, `logo_ext`, `community_id`, `type`, `reg_date`, `is_order_inform`, `order_email`, `iframe_url`, `purchase_percentage`, `purchase_fee`, `payout_type`, `payout_info`, `policy`, `state`, `vote_count`, `vote_sum`, `login_count`, `last_login_date`, `partner_id`) VALUES
(3, 'aaaaae', '123123', 'fffffe', 'ddddd', 'xzcvzxc@dfs.df', NULL, 0, 1, -11, NULL, NULL, 0, '', '0000-00-00 00:00:00', 1, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '0000-00-00 00:00:00', NULL),
(9, 'vova', '123456', 'Mega Market Sokolov', 'Vladimir Sokolov', 'sokolo_1224505453_per@mksat.net', NULL, 39, 0, 2, '', 'jpg', 0, 'wear+carry,download+play', '0000-00-00 00:00:00', 1, NULL, NULL, 0.00, 0.00, 'paypal', 'a:1:{s:6:"paypal";a:3:{s:5:"email";s:31:"sokolo_1224505453_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;}}', NULL, 'active', 0, 0, 17, '2010-05-12 17:34:08', NULL),
(12, 'levak', 'levak', 'levak', 'levak', 'levak@ddd.dd', NULL, 34, 0, 2, NULL, NULL, 0, '', '0000-00-00 00:00:00', 1, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '0000-00-00 00:00:00', NULL),
(13, 'ares', '123456', 'ares', 'ares', 'ares@ares.com', NULL, 43, 0, 3, 'Ð’Ð¾Ð²Ð° ! sdagffsd dh sfgs Ð¿Ñ‹Ð»Ð¾Ð²Ð°Ð¿ Ð¿Ð¾ sdfgjdl sfkgjldf gjsdf;glj s\r\ndg df\r\ng ;Ð¶Ñ‹Ð°Ð¾Ð¿ Ñ‹sdlkgj; Ð²Ñ‹Ð´Ð°Ð¿Ð»Ð¾ Ð²Ñ‹Ð¶Ð´Ð°Ð»Ð¿ Ð¶Ñ‹Ð·Ðº9Ð¿Ð¾Ð°Ð²Ð´Ð¿ Ð¾Ð²Ð´Ð°Ð»Ð¿Ð¶Ñ‹Ð°Ð² Ð´Ð°Ð»Ð¿Ð¾Ð¶Ñ‹Ð²Ð°Ð´Ð¿Ð» Ð°Ð²Ð»Ð»Ð¾Ð¿ srogj;o rg sdgdf;lgk Ð²Ð°Ð´Ð¿Ð» Ð°Ð´Ð²Ñ‹ Ðºrogk\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\''go Ð²Ð°Ð´Ð¿ ÐºÑƒÐ· Ð¿Ð²Ñ‰Ð° Ð»Ð¿Ñ‹ÑƒÐºÐ»Ð¿Ð¶Ð²Ñ‹ÑÐ¿Ñ‰Ð¶ÐºÑƒ1', 'jpg', 96, '', '2008-05-19 16:34:26', 1, NULL, NULL, 0.00, 0.00, 'check', 'a:2:{s:6:"paypal";a:1:{s:5:"email";s:31:"sokolo_1224577401_per@mksat.net";}s:5:"check";a:8:{s:9:"full_name";s:9:"sdfghsgfg";s:13:"address_line1";s:9:"sdfghsgfg";s:13:"address_line2";s:0:"";s:4:"city";s:9:"sdfghsgfg";s:5:"state";s:9:"sdfghsgfg";s:6:"postal";s:6:"235464";s:7:"country";s:2:"US";s:5:"phone";s:10:"3546757875";}}', NULL, 'active', 0, 0, 1, '2009-10-16 17:11:11', NULL),
(14, 'aresgod', '123456', 'aresgod', 'aresgod', 'aresgod@test.er', NULL, 43, 0, 3, NULL, NULL, 97, 'wear+carry,space+place', '2008-09-26 12:17:49', 1, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2008-09-26 12:17:49', NULL),
(15, 'teast2', '123456', 'teast2', 'test tttt', 'teast2@zf.fgdf', NULL, 43, 0, 3, NULL, NULL, 98, '', '2008-10-16 15:03:52', 1, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2008-10-16 15:03:52', NULL),
(16, 'mytest', '123456', 'mytest', 'My test', 'vladimir@skaya.net', NULL, 43, 0, 3, NULL, NULL, 99, '', '2008-10-16 17:19:35', 1, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2008-10-16 17:19:35', NULL),
(17, 'sokolov', '123456', 'Home', 'Sokolov', 'sokolo_1224665605_per@mksat.net', NULL, 39, 1, 2, '', 'jpg', 100, '', '2008-10-29 11:26:25', 1, NULL, NULL, 0.00, 0.00, 'paypal', 'a:1:{s:6:"paypal";a:3:{s:5:"email";s:31:"sokolo_1224665605_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;}}', NULL, 'active', 0, 0, 0, '2008-10-29 11:26:25', NULL),
(18, 'sokolov1', '123456', '', '', '', NULL, NULL, 0, NULL, NULL, NULL, 102, '', '2008-11-04 15:54:41', 1, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2008-11-04 15:54:41', NULL),
(19, 'sokolov2', '123456', '', '', '', NULL, NULL, 0, NULL, NULL, NULL, 105, '', '2008-11-04 16:06:51', 1, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2008-11-04 16:06:51', NULL),
(20, 'sokolov4', '123456', '', '', '', NULL, NULL, 0, NULL, NULL, NULL, 106, '', '2008-11-04 16:48:27', 1, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2008-11-04 16:48:27', NULL),
(21, 'sokolov5', '123456', '', '', '', NULL, NULL, 0, NULL, NULL, NULL, 111, '', '2008-11-04 17:06:00', 1, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2008-11-04 17:06:00', NULL),
(22, 'sokolov6', '123456', 'Vovan Ltd', 'Vladimir', 'sookolov@mail.com', NULL, 39, 1, 2, 'Description test', NULL, 113, '', '2008-11-05 10:41:52', 0, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2008-11-05 10:41:52', NULL),
(23, 'sokolov8', '123456', '', '', '', NULL, NULL, 0, NULL, NULL, NULL, 116, '', '2008-11-18 15:48:50', 1, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2008-11-18 15:48:50', NULL),
(24, 'sokolov10', '123456', 'comp', 'own', 'Vova@maol.com', NULL, NULL, 0, NULL, NULL, NULL, 117, '', '2008-11-20 13:04:14', 1, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2008-11-20 13:04:14', NULL),
(25, 'sokolov11', '123456', 'comp', 'own', 'Vova@maol.com', NULL, NULL, 0, NULL, 'my descr', NULL, 118, '', '2008-11-20 14:18:59', 1, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2008-11-20 14:18:59', NULL),
(26, 'azb', '123456', 'azb', 'Vova', 'vladimir@skaya.net', NULL, NULL, 0, NULL, '', NULL, 119, '', '2008-11-27 14:19:16', 1, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2008-11-27 14:19:16', NULL),
(27, 'azboutiques', '123456', 'azboutiques', 'Vova', 'vladimir@skaya.net', NULL, NULL, 0, NULL, '', NULL, 120, '', '2008-11-27 14:20:00', 1, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2008-11-27 14:20:00', NULL),
(28, 'azbout', '123456', 'azbout', 'Vova', 'vladimir@skaya.net', NULL, NULL, 0, NULL, '', NULL, 121, '', '2008-11-27 14:23:54', 1, NULL, NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2008-11-27 14:23:54', NULL),
(30, 'sokoloff', '123456', 'comp', 'own', 'Vova@maol.com', NULL, NULL, 0, NULL, 'my descr', NULL, 138, '', '2008-12-05 11:48:34', 0, 'orders@azboutiques.com', NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2008-12-05 11:48:34', 1),
(31, 'tester', '123456', 'Tester', 'Tester', 'tester@skaya.net', NULL, NULL, 0, NULL, 'Test store', 'jpg', 139, 'wear+carry', '2008-12-09 12:29:07', 1, 'orders@azboutiques.com', NULL, 0.00, 0.00, NULL, NULL, NULL, 'deactive', 0, 0, 3, '2009-07-13 10:02:07', 1),
(32, 'store', '123456', 'teest', 'Store', 'vova@twst.com', NULL, 34, 0, 2, '', NULL, 140, '', '2008-12-15 17:36:05', 0, '', NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2008-12-15 17:36:05', NULL),
(33, 'terester', '123456', 'Terester', 'Terester', 'terester@mail.com', NULL, NULL, 0, NULL, '', NULL, 141, 'wear+carry', '2008-12-18 17:21:26', 1, 'orders@azboutiques.com', NULL, 0.00, 0.00, NULL, NULL, NULL, 'deactive', 0, 0, 0, '2008-12-18 17:21:26', 1),
(36, 'vova-test', '123456', 'Vova Test', 'Vovatest', 'sokolo_1224577401_per@mksat.net', NULL, 39, 1, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sollicitudin, quam ac vestibulum feugiat, quam mi egestas nulla, id rhoncus ante tortor eget ligula. Aliquam lectus. Nam convallis tortor at ante. Maecenas pharetra, arcu quis hendrerit consectetur, elit felis porttitor tortor, eu ornare metus lorem ut lectus. In mollis malesuada neque. Nullam quis augue quis erat tempus sodales. Proin ac metus. Aliquam porttitor neque non sapien. Nunc venenatis libero sed lorem. Pellentesque eros. Aliquam hendrerit leo vel nisi. Curabitur sed lorem.\r\n\r\nVivamus in elit. Ut est nisi, tempor at, venenatis sit amet, commodo nec, felis. Integer nec enim varius dui porta accumsan. Vivamus aliquam leo sed est. Phasellus eu lacus. Praesent facilisis nunc ut urna tempor venenatis. Quisque ut nulla vel odio mattis lobortis. Maecenas ut turpis ultrices leo mattis ullamcorper. Pellentesque aliquet augue eu nulla. Suspendisse sollicitudin. Integer eleifend risus nec eros. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi malesuada dapibus augue.\r\n\r\nVivamus varius condimentum dolor. Nulla in neque. Phasellus pharetra, odio nec aliquam hendrerit, ipsum erat dignissim nulla, sit amet faucibus pede est et turpis. Etiam ut elit. Sed ante lectus, viverra nec, vestibulum ac, auctor at, ante. Praesent ornare ligula non magna. Phasellus vel odio. Phasellus volutpat fringilla elit. Aenean sollicitudin ipsum nec nibh. Aliquam ante lorem, convallis vitae, molestie aliquet, pellentesque vel, nisl. Phasellus id magna vel enim luctus dictum. Morbi id justo sit amet eros consectetur viverra. Morbi non turpis. Morbi felis diam, laoreet et, pretium id, ornare nec, enim. Donec blandit pede quis eros.\r\n\r\nAliquam sed magna eu elit tristique consequat. Duis posuere. Proin porttitor. Fusce odio. Duis luctus pharetra nibh. Vivamus iaculis arcu et augue. Cras eget elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam a est vitae ante lacinia suscipit.\r\n\r\nMauris non velit. Phasellus hendrerit. Vivamus semper dignissim quam. Etiam non sapien. Maecenas dictum. Etiam vitae odio. Nullam ut lorem. Pellentesque laoreet rutrum ipsum. Suspendisse ut eros nec quam adipiscing varius. Donec dui elit, elementum nec, vulputate fringilla, semper quis, nibh.', 'gif', 144, 'wear+carry', '2009-01-06 11:59:01', 1, 'orders@azboutiques.com', NULL, 0.00, 0.00, 'paypal', 'a:1:{s:6:"paypal";a:3:{s:5:"email";s:31:"sokolo_1224577401_per@mksat.net";s:8:"act-code";s:0:"";s:9:"confirmed";b:1;}}', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sollicitudin, quam ac vestibulum feugiat, quam mi egestas nulla, id rhoncus ante tortor eget ligula. Aliquam lectus. Nam convallis tortor at ante. Maecenas pharetra, arcu quis hendrerit consectetur, elit felis porttitor tortor, eu ornare metus lorem ut lectus. In mollis malesuada neque. Nullam quis augue quis erat tempus sodales. Proin ac metus. Aliquam porttitor neque non sapien. Nunc venenatis libero sed lorem. Pellentesque eros. Aliquam hendrerit leo vel nisi. Curabitur sed lorem.\r\n\r\nVivamus in elit. Ut est nisi, tempor at, venenatis sit amet, commodo nec, felis. Integer nec enim varius dui porta accumsan. Vivamus aliquam leo sed est. Phasellus eu lacus. Praesent facilisis nunc ut urna tempor venenatis. Quisque ut nulla vel odio mattis lobortis. Maecenas ut turpis ultrices leo mattis ullamcorper. Pellentesque aliquet augue eu nulla. Suspendisse sollicitudin. Integer eleifend risus nec eros. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi malesuada dapibus augue.\r\n\r\nVivamus varius condimentum dolor. Nulla in neque. Phasellus pharetra, odio nec aliquam hendrerit, ipsum erat dignissim nulla, sit amet faucibus pede est et turpis. Etiam ut elit. Sed ante lectus, viverra nec, vestibulum ac, auctor at, ante. Praesent ornare ligula non magna. Phasellus vel odio. Phasellus volutpat fringilla elit. Aenean sollicitudin ipsum nec nibh. Aliquam ante lorem, convallis vitae, molestie aliquet, pellentesque vel, nisl. Phasellus id magna vel enim luctus dictum. Morbi id justo sit amet eros consectetur viverra. Morbi non turpis. Morbi felis diam, laoreet et, pretium id, ornare nec, enim. Donec blandit pede quis eros.\r\n\r\nAliquam sed magna eu elit tristique consequat. Duis posuere. Proin porttitor. Fusce odio. Duis luctus pharetra nibh. Vivamus iaculis arcu et augue. Cras eget elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam a est vitae ante lacinia suscipit.\r\n\r\nMauris non velit. Phasellus hendrerit. Vivamus semper dignissim quam. Etiam non sapien. Maecenas dictum. Etiam vitae odio. Nullam ut lorem. Pellentesque laoreet rutrum ipsum. Suspendisse ut eros nec quam adipiscing varius. Donec dui elit, elementum nec, vulputate fringilla, semper quis, nibh.', 'active', 0, 0, 3, '2010-01-19 11:38:12', 1),
(37, 'test-vova', '123456', 'Test Vova', 'Testvova', 'vladimir@sfgd.net', NULL, NULL, 0, NULL, '', NULL, 145, 'wear+carry', '2009-01-15 17:44:22', 1, 'orders@azboutiques.com', NULL, 0.00, 0.00, 'paypal', 'a:1:{s:6:"paypal";a:2:{s:5:"email";s:18:"vladimir@skaya.net";s:8:"act-code";s:32:"fe3672d2a9795c7e8043a30116f5ecd6";}}', 'Quisque sed tellus. Sed in urna. Aliquam velit nisi, dictum at, tempus id, aliquet eu, nisi. Suspendisse eu felis. Sed in metus dictum nisl imperdiet rutrum. Aenean in magna. Morbi et justo. Sed vestibulum lacus a tellus. Donec porta dignissim mi. Aliquam odio erat, auctor id, adipiscing non, pretium in, sapien. Etiam bibendum. Aenean eu velit nec ipsum mollis blandit. Phasellus bibendum tincidunt lectus. Donec egestas justo at leo. Fusce tempus.\r\n\r\nInteger dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce pharetra, justo id aliquam scelerisque, metus eros ullamcorper ligula, in pretium mi diam non massa. In gravida ipsum non dolor. Quisque augue nisi, pellentesque eu, sagittis et, egestas quis, lectus. Duis feugiat libero in risus. Aliquam eu leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus porttitor orci in odio. Donec pulvinar odio sed metus. Curabitur a velit quis nunc auctor ultrices. Donec felis est, condimentum quis, porta vitae, bibendum semper, felis. Pellentesque tellus turpis, pellentesque quis, lobortis volutpat, tincidunt non, enim. Aenean lobortis sollicitudin ante. Sed vulputate velit quis arcu. Cras accumsan, lectus et mollis bibendum, mauris diam suscipit dolor, mattis elementum velit ante ac risus.\r\n\r\nQuisque urna elit, mollis adipiscing, auctor facilisis, tempus eu, orci. Curabitur consequat venenatis dolor. Donec quis felis semper purus consequat molestie. Suspendisse dictum. Integer viverra, odio vitae porttitor sollicitudin, velit nulla fermentum dui, ac commodo sem sapien id dui. Aenean lacinia. Aliquam urna justo, pretium nec, tristique luctus, tincidunt sollicitudin, risus. Suspendisse mattis tincidunt dui. Nulla dui erat, egestas vitae, hendrerit vitae, dictum quis, orci. Morbi ac felis eget arcu mattis consectetur. Nulla facilisi.\r\n\r\nDuis gravida. Phasellus neque nibh, sodales nec, ullamcorper eget, luctus sed, libero. Suspendisse tellus. Suspendisse commodo, est vitae rhoncus posuere, quam ligula accumsan mauris, suscipit molestie metus tellus in justo. Nulla urna dui, consequat ac, tincidunt vel, imperdiet hendrerit, nibh. Mauris id est mattis mauris aliquam volutpat. Integer purus. Donec varius eleifend enim. Phasellus elit sapien, laoreet fringilla, eleifend non, luctus eget, mi. Nunc vel orci. Donec fringilla dapibus nisi. Nunc vitae mauris. Mauris cursus. Praesent nec dui. Suspendisse lectus libero, tempor eu, posuere eu, sagittis sed, nunc. Aliquam placerat venenatis tellus. Aliquam vitae diam vel turpis semper sodales. In nec elit vel arcu rutrum aliquet. Aenean mauris.\r\n\r\nDonec enim. Quisque convallis, sem vitae convallis ultrices, neque nibh placerat orci, eu porta ligula libero sed nisi. Praesent vitae nisl ut magna dapibus venenatis. Vivamus tempor eros ac ligula. Pellentesque enim. Fusce turpis neque, eleifend ac, porta eu, molestie a, augue. Integer est diam, venenatis nec, pulvinar sit amet, consequat vel, tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce quis urna. Ut vel odio.', 'active', 0, 0, 0, '2009-01-15 17:44:22', 1),
(38, 'test123', '123456', 'Test', 'Test', 'vladimir1@skaya.net', NULL, NULL, 0, NULL, '', 'jpg', 155, 'wear+carry', '2009-05-13 12:58:18', 1, 'orders@azboutiques.com', NULL, 0.00, 0.00, NULL, NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'active', 0, 0, 1, '2009-08-17 11:06:47', 1),
(39, 'azbou', '123456', 'Azbou', 'azbou', 'azbou@email.com', NULL, 43, 0, 3, '', NULL, 156, 'wear+carry', '2009-05-20 16:51:12', 0, '', NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 1, '2009-07-03 16:01:01', NULL),
(40, 'afsd', '123123', 'sdafsdfs ', 'test', 'asda@dfsd.dsf', NULL, 43, 0, 3, '', NULL, 157, '', '2009-06-11 17:35:15', 0, '', NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2009-06-11 17:35:15', NULL),
(41, 'asdfsd33464', '123123', 'sdafsdfs ', 'test', 'asda@dfsd.dsf', NULL, 43, 0, 3, '', NULL, 157, '', '2009-06-11 17:38:53', 0, '', NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2009-06-11 17:38:53', NULL),
(42, 'sdghdghfg', '123456', 'Home', 'asdfsd', 'asdgfsd@dzfs.dsf', NULL, 43, 0, 3, '', NULL, 157, '', '2009-06-11 17:40:56', 0, '', NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2009-06-11 17:40:56', NULL),
(43, 'sdagasgs', '123456', 'sdfsd', 'azbou', 'sdfgsdf@sdfs.sdf', NULL, 43, 0, 3, '', NULL, 157, '', '2009-06-11 17:41:46', 0, '', NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2009-06-11 17:41:46', NULL),
(44, 'fdhdfhf', '123456', 'dfghdfhg', 'Vladimir Sokolov', 'asda@dfsd.dsfsd', NULL, 43, 0, 3, '', NULL, 157, '', '2009-06-11 17:44:30', 0, '', NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2009-06-11 17:44:30', NULL),
(45, 'sdfsdfsdf', '123123', 'dsfsdfsd', 'sdfsdfsd', 'asda@dfsd.dsfsd', NULL, 43, 0, 3, '', NULL, 157, '', '2009-06-11 17:48:02', 0, '', NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 0, '2009-06-11 17:48:02', NULL),
(47, 'tteeesst', '123456', 'tteeesst', 'Teeeest', 'asda@dfsd.dsfsd', NULL, NULL, 0, NULL, '', NULL, 160, '', '2009-08-10 17:04:46', 1, 'sergey@skaya.net', NULL, 0.00, 0.00, NULL, NULL, '', 'deactive', 0, 0, 5, '2009-08-10 17:07:39', NULL),
(48, 'terwsr', '123456', 'terwsr', 'Trest', 'trewse@sfhf.sgf', NULL, NULL, 0, NULL, '', NULL, 161, '', '2009-08-10 17:08:24', 1, 'orders@azboutiques.com', NULL, 0.00, 0.00, NULL, NULL, '', 'deactive', 0, 0, 1, '2009-08-10 17:08:25', 1),
(49, 'newd', '123456', 'newd', 'newd', 'vladimir@skaya.net', NULL, 43, 0, 3, '', NULL, 162, 'wear+carry,space+place,print+paper,download+play', '2009-10-06 15:26:45', 0, '', NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 4, '2009-10-19 16:10:30', NULL),
(51, 'design', '123456', 'design', 'design', 'design@test.com', NULL, 43, 0, 3, '', NULL, 162, '', '2009-10-16 10:45:32', 0, '', NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 1, '2009-10-16 10:45:32', NULL),
(52, 'test', '123456', 'test', 'test', 'test@inbox.ru', NULL, 43, 0, 3, '', NULL, 163, 'wear+carry', '2009-10-21 11:46:11', 0, '', NULL, 0.00, 0.00, NULL, NULL, NULL, 'active', 0, 0, 4, '2010-01-04 17:42:36', NULL),
(53, 'vovatest', '123456', 'Test', 'Vova', 'tester@test.com', NULL, NULL, 0, NULL, '', NULL, 164, 'wear+carry', '2009-12-18 17:34:51', 1, 'orders@azboutiques.com', NULL, 0.00, 0.00, NULL, NULL, '', 'active', 0, 0, 2, '2009-12-18 17:54:49', 1),
(54, 'marusya', '123456', 'Marusya', 'Marusya', 'marusya@mail.com', NULL, NULL, 0, NULL, 'Vestibulum convallis neque eu est pharetra sit amet tristique urna porttitor. Suspendisse potenti. Aenean tempus hendrerit magna eu aliquet. Aliquam ut orci orci. Suspendisse dignissim mauris at ante lacinia adipiscing. Morbi arcu dolor, aliquet sit amet pretium vel, rutrum bibendum augue.', 'jpg', 165, 'wear+carry', '2010-01-06 11:27:08', 1, 'orders@azboutiques.com', NULL, 0.00, 0.00, NULL, NULL, 'Sed volutpat odio eu libero malesuada lacinia. In hac habitasse platea dictumst. Pellentesque eu nulla magna. Donec feugiat, nibh vitae tempus ullamcorper, metus tellus mattis dui, et bibendum urna ligula sed tortor. Pellentesque neque enim, sodales quis ornare in, ultricies a leo. Proin auctor consequat leo nec aliquet. Curabitur quam erat, hendrerit eget lacinia ut, aliquet eu risus. Aliquam tempor magna at nibh facilisis id auctor diam cursus. Vestibulum erat metus, egestas eu imperdiet non, volutpat auctor nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut pretium pretium nisl eu sodales. Praesent mi neque, mattis nec ornare eget, molestie a quam. Aliquam pretium tincidunt risus, nec consequat metus iaculis pharetra. Cras gravida mi at nisi euismod gravida. Maecenas at magna nisl, in lobortis odio. \r\n\r\nMaecenas nec mauris ipsum. Nam faucibus nunc non quam imperdiet sed accumsan arcu sagittis. Quisque volutpat sollicitudin ligula, quis bibendum urna fringilla ut. Cras quis libero magna, vel sagittis metus. Morbi vel orci sed arcu feugiat fermentum sed varius nulla. Vivamus sollicitudin venenatis arcu, at consectetur sem suscipit non. Aenean non vestibulum lacus. Vivamus ac velit ligula, nec fringilla elit. Integer consequat mi id tortor pretium id bibendum neque sodales. Ut lacus augue, tincidunt in volutpat ut, scelerisque quis neque. Phasellus ac libero a libero molestie ultricies. Quisque semper dui eu orci vehicula suscipit. In vel lectus id turpis rhoncus elementum in vel nulla.', 'active', 0, 0, 19, '2010-02-19 16:09:58', 1),
(56, 'voffka', '123456', 'Voffka', 'Voffka', 'vladimir@skaya.net', NULL, NULL, 0, NULL, '', NULL, 167, 'wear+carry', '2010-02-11 15:58:42', 1, 'orders@azboutiques.com', NULL, 0.00, 0.00, NULL, NULL, '', 'deactive', 0, 0, 4, '2010-02-11 18:27:45', 1),
(57, 'valdemar', '123456', 'Valdemar', 'Valdemar', 'asd3a@dfsd.dsf', NULL, NULL, 0, NULL, 'DSFVxdfsdfsd fdsf sd dsf dsg sgsdf kfghsdk sdgjk shaldkfj hsdagklah dl,skcjsldkjsdkgjsklfkdjsf sdkjfh skdjf skjdfksdjf hksjdf skdjfhjkdf ssdf sdf', 'gif', 168, 'wear+carry', '2010-02-16 12:34:55', 1, 'orders@azboutiques.com', NULL, 0.00, 0.00, NULL, NULL, 'Ffdfsddsf sdf sdjf sdksdf sdf sdkjf sdfl. Dcx  f/S ddsfs df sdf sdfk jsdf ksdjf sdkfj sdfjiuefskdj fskdjfas fsdf ksjhkjsdf sdjkdsjf sdjk sdfkj sdjkfjkk.', 'active', 0, 0, 2, '2010-02-17 11:58:50', 1),
(58, 'testok', '', 'TestOk', 'Oksana', 'oksana@skaya.net', 'oksana.com', 0, 0, 0, 'description text', 'jpg', 0, 'wear+carry', '2010-02-18 17:56:42', 1, 'orders@azboutiques.com', NULL, 0.00, 0.00, NULL, 'a:1:{s:6:"paypal";a:3:{s:5:"email";s:16:"oksana@skaya.net";s:8:"act-code";s:0:"";s:9:"confirmed";s:5:"flase";}}', 'Store Policy info', 'active', 0, 0, 19, '2010-02-18 18:24:52', 1),
(59, 'testo2', 'pass123', 'testo2', 'Testo', 'testo2@skaya.net', NULL, NULL, 0, NULL, 'Rag & Bone Founded in 2002, rag & bone had one very clear vision in mind: to make clothes that they and their friends would love to wear everyday. With no formal f ...', NULL, 0, '', '2010-02-18 21:05:39', 1, 'orders@azboutiques.com', NULL, 0.00, 0.00, NULL, NULL, '', 'deactive', 0, 0, 13, '2010-02-18 21:08:21', 1),
(60, 'test-ok', 'oksana7', 'Test_Ok', 'Test', 'newlifeoksan@rambler.ru', NULL, NULL, 0, NULL, 'hdflgjdk', NULL, 0, '', '2010-02-19 17:41:14', 1, 'orders@azboutiques.com', NULL, 0.00, 0.00, NULL, NULL, 'dfdfdgdgfgfgfg', 'deactive', 0, 0, 14, '2010-02-19 17:41:30', 1),
(75, 'vasso1', '', 'Vasko', '', 'vasily1@skaya.net', '', NULL, 0, NULL, NULL, NULL, 0, '', '0000-00-00 00:00:00', 1, NULL, NULL, 0.00, 0.00, NULL, 'a:1:{s:6:"paypal";a:3:{s:5:"email";s:16:"vasily@skaya.net";s:8:"act-code";s:0:"";s:9:"confirmed";s:5:"flase";}}', NULL, 'active', 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `store_design`
--

DROP TABLE IF EXISTS `store_design`;
CREATE TABLE IF NOT EXISTS `store_design` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '(new)',
  `update_dt` datetime NOT NULL,
  `state` enum('current','not used') NOT NULL DEFAULT 'current',
  PRIMARY KEY (`id`),
  UNIQUE KEY `store` (`store_id`,`name`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

--
-- Дамп данных таблицы `store_design`
--

INSERT INTO `store_design` (`id`, `store_id`, `name`, `update_dt`, `state`) VALUES
(4, 12, 'Default design', '2008-03-04 11:23:54', 'current'),
(5, 9, 'First step', '2008-03-04 16:14:52', 'not used'),
(11, 9, 'test', '2008-05-23 09:59:47', 'current'),
(25, 14, 'Default design', '2008-09-26 12:17:49', 'current'),
(33, 13, 'sdgfg', '2008-10-10 17:10:29', 'current'),
(34, 15, 'Default design', '2008-10-16 15:03:52', 'current'),
(35, 16, 'Default design', '2008-10-16 17:19:35', 'current'),
(36, 17, 'Default design', '2008-10-29 11:26:25', 'current'),
(37, 18, 'Default design', '2008-11-04 15:54:42', 'current'),
(38, 19, 'Default design', '2008-11-04 16:06:51', 'current'),
(39, 20, 'Default design', '2008-11-04 16:48:27', 'current'),
(40, 21, 'Default design', '2008-11-04 17:06:00', 'current'),
(41, 22, 'Default design', '2008-11-05 10:41:53', 'current'),
(42, 23, 'Default design', '2008-11-18 15:48:50', 'current'),
(43, 24, 'Default design', '2008-11-20 13:04:15', 'current'),
(44, 25, 'Default design', '2008-11-20 14:18:59', 'current'),
(45, 26, 'Default design', '2008-11-27 14:19:17', 'current'),
(46, 27, 'Default design', '2008-11-27 14:20:00', 'current'),
(47, 28, 'Default design', '2008-11-27 14:23:54', 'current'),
(49, 30, 'Default design', '2008-12-05 11:48:35', 'current'),
(50, 31, 'Default design', '2008-12-09 12:29:07', 'current'),
(51, 32, 'Default design', '2008-12-15 17:36:05', 'current'),
(52, 33, 'Default design', '2008-12-18 17:21:26', 'current'),
(55, 36, 'Default design', '2009-01-06 11:59:01', 'current'),
(56, 37, 'Default design', '2009-01-15 17:44:22', 'current'),
(57, 38, 'Default design', '2009-05-13 12:58:18', 'current'),
(58, 39, 'Default design', '2009-05-20 16:51:12', 'current'),
(59, 40, 'Default design', '2009-06-11 17:35:15', 'current'),
(60, 41, 'Default design', '2009-06-11 17:38:53', 'current'),
(61, 42, 'Default design', '2009-06-11 17:40:56', 'current'),
(62, 43, 'Default design', '2009-06-11 17:41:46', 'current'),
(63, 44, 'Default design', '2009-06-11 17:44:30', 'current'),
(64, 45, 'Default design', '2009-06-11 17:48:02', 'current'),
(66, 47, 'Default design', '2009-08-10 17:04:46', 'current'),
(67, 48, 'Default design', '2009-08-10 17:08:24', 'current'),
(68, 49, 'Default design', '2009-10-06 15:26:45', 'current'),
(69, 51, 'Default design', '2009-10-16 10:45:32', 'current'),
(70, 52, 'Default design', '2009-10-21 11:46:11', 'current'),
(71, 53, 'Default design', '2009-12-18 17:34:51', 'current'),
(72, 54, 'Default design', '2010-01-06 11:27:08', 'current'),
(74, 56, 'Default design', '2010-02-11 15:58:42', 'current'),
(75, 57, 'Default design', '2010-02-16 12:34:55', 'current'),
(76, 58, 'Default design', '2010-02-18 17:56:42', 'current'),
(77, 59, 'Default design', '2010-02-18 21:05:39', 'current'),
(78, 60, 'Default design', '2010-02-19 17:41:14', 'current');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `category_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `common_category`
--
ALTER TABLE `common_category`
  ADD CONSTRAINT `common_category_ibfk_2` FOREIGN KEY (`partner_id`) REFERENCES `partner` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `common_category_ibfk_3` FOREIGN KEY (`parent_id`) REFERENCES `common_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `common_category_product`
--
ALTER TABLE `common_category_product`
  ADD CONSTRAINT `common_category_product_ibfk_1` FOREIGN KEY (`common_category_id`) REFERENCES `common_category` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `common_category_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `designer`
--
ALTER TABLE `designer`
  ADD CONSTRAINT `designer_ibfk_1` FOREIGN KEY (`partner_id`) REFERENCES `partner` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `file`
--
ALTER TABLE `file`
  ADD CONSTRAINT `file_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `label`
--
ALTER TABLE `label`
  ADD CONSTRAINT `label_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `option`
--
ALTER TABLE `option`
  ADD CONSTRAINT `option_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_fk` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product_designer`
--
ALTER TABLE `product_designer`
  ADD CONSTRAINT `product_designer_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_designer_ibfk_2` FOREIGN KEY (`designer_id`) REFERENCES `designer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `store_ibfk_1` FOREIGN KEY (`partner_id`) REFERENCES `partner` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `store_design`
--
ALTER TABLE `store_design`
  ADD CONSTRAINT `store_design_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
