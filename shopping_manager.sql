/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost:3306
 Source Schema         : shopping_manager

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 03/06/2024 20:49:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `useraddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, 10, 'rr', 'vv', '123456745');
INSERT INTO `address` VALUES (3, 11, 'Annie', 'CDUT', '13548192788');
INSERT INTO `address` VALUES (4, 16, 'Annie', 'CDUT', '13548192788');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (2, 'a', '123', 'admin', 'http://localhost:9090/files/1710745626446-a1.png', 'ADMIN', NULL, NULL);
INSERT INTO `admin` VALUES (6, 's', '123', 's', NULL, 'ADMIN', NULL, NULL);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NULL DEFAULT NULL,
  `product_id` int(10) NULL DEFAULT NULL,
  `seller_id` int(10) NULL DEFAULT NULL,
  `num` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (3, 10, 18, 7, 1);
INSERT INTO `cart` VALUES (10, 11, 15, 11, 1);
INSERT INTO `cart` VALUES (12, 2, 11, 8, 1);
INSERT INTO `cart` VALUES (16, 10, 20, 6, 1);
INSERT INTO `cart` VALUES (18, 10, 21, 10, 2);
INSERT INTO `cart` VALUES (22, 10, 11, 8, 1);
INSERT INTO `cart` VALUES (24, 10, 16, 6, 1);
INSERT INTO `cart` VALUES (25, 10, 17, 6, 1);
INSERT INTO `cart` VALUES (26, 11, 12, 8, 1);
INSERT INTO `cart` VALUES (27, 10, 15, 11, 1);
INSERT INTO `cart` VALUES (28, 15, 9, 8, 2);
INSERT INTO `cart` VALUES (29, 16, 15, 11, 1);
INSERT INTO `cart` VALUES (30, 16, 23, 8, 1);
INSERT INTO `cart` VALUES (34, 2, 21, 10, 2);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Book', 'You can buy some books in here', 'http://localhost:9090/files/1710160088823-Book.png');
INSERT INTO `category` VALUES (2, 'Shoe', 'You can buy some shoes in here', 'http://localhost:9090/files/1710160104472-Shoe.png');
INSERT INTO `category` VALUES (3, 'Bag', 'You can buy some bag in here', 'http://localhost:9090/files/1710160120683-Bag.png');
INSERT INTO `category` VALUES (4, 'Fruits', 'You can buy some fruits in here', 'http://localhost:9090/files/1711465203037-Fruits.png');
INSERT INTO `category` VALUES (5, 'Men Clothes', 'You can buy some men clothes in here', 'http://localhost:9090/files/1710160278336-Men\'s Clothing.png');
INSERT INTO `category` VALUES (6, 'Women Clothes', 'You can buy some women clothes in here', 'http://localhost:9090/files/1710759810474-Women\'s Clothing.png');
INSERT INTO `category` VALUES (7, 'Health Care', 'You can buy some product of health care in here', 'http://localhost:9090/files/1710759871847-Medicine.png');
INSERT INTO `category` VALUES (8, 'Sport', 'You can buy some products of sport in here', 'http://localhost:9090/files/1711464449442-Sport.png');
INSERT INTO `category` VALUES (9, 'Food', 'You can buy some food in here', 'http://localhost:9090/files/1711464471527-Food.png');
INSERT INTO `category` VALUES (10, 'Cleaning Tool', 'You can buy some cleaning tools in here', 'http://localhost:9090/files/1711464847550-Cleaning Tool.png');
INSERT INTO `category` VALUES (11, 'Stationery', 'You can buy some stationeries in here', 'http://localhost:9090/files/1711464863549-Stationery.png');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NULL DEFAULT NULL,
  `product_id` int(10) NULL DEFAULT NULL,
  `seller_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (1, 10, 8, 5);
INSERT INTO `collect` VALUES (3, 10, 14, 9);
INSERT INTO `collect` VALUES (5, 11, 15, 11);
INSERT INTO `collect` VALUES (6, 10, 16, 6);
INSERT INTO `collect` VALUES (7, 10, 25, 8);
INSERT INTO `collect` VALUES (8, 10, 21, 10);
INSERT INTO `collect` VALUES (9, 11, 21, 10);
INSERT INTO `collect` VALUES (10, 11, 19, 6);
INSERT INTO `collect` VALUES (11, 11, 22, 10);
INSERT INTO `collect` VALUES (12, 10, 15, 11);
INSERT INTO `collect` VALUES (13, 10, 17, 6);
INSERT INTO `collect` VALUES (14, 2, 18, 7);
INSERT INTO `collect` VALUES (15, 2, 11, 8);
INSERT INTO `collect` VALUES (16, 11, 20, 6);
INSERT INTO `collect` VALUES (17, 11, 12, 8);
INSERT INTO `collect` VALUES (18, 15, 9, 8);
INSERT INTO `collect` VALUES (20, 16, 11, 8);
INSERT INTO `collect` VALUES (21, 16, 8, 5);
INSERT INTO `collect` VALUES (22, 16, 19, 6);
INSERT INTO `collect` VALUES (23, 16, 21, 10);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NULL DEFAULT NULL,
  `product_id` int(10) NULL DEFAULT NULL,
  `seller_id` int(10) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 10, 8, 5, 'nice', '2024-03-18 16:28:24');
INSERT INTO `comment` VALUES (2, 10, 15, 11, 'good', '2024-03-26 21:22:47');
INSERT INTO `comment` VALUES (3, 11, 26, 8, 'nice good!! \nmy friend loves it ', '2024-03-27 14:08:05');
INSERT INTO `comment` VALUES (4, 11, 25, 8, 'good colour\n', '2024-03-27 14:09:08');
INSERT INTO `comment` VALUES (5, 16, 8, 5, 'I like this book!!', '2024-06-03 20:39:47');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_id` int(10) NULL DEFAULT NULL,
  `seller_id` int(10) NULL DEFAULT NULL,
  `num` int(10) NULL DEFAULT NULL,
  `user_id` int(10) NULL DEFAULT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `address_id` int(10) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (2, '20240318223910', 15, 11, 1, 10, 71.97, 1, 'Commented');
INSERT INTO `orders` VALUES (3, '20240319213008', 17, 6, 1, 10, 741.18, 1, 'Complete');
INSERT INTO `orders` VALUES (5, '20240326210607', 19, 6, 1, 10, 134.29, 1, 'Waiting');
INSERT INTO `orders` VALUES (6, '20240327132414', 26, 8, 1, 10, 497.39, 1, 'Complete');
INSERT INTO `orders` VALUES (7, '20240327132414', 25, 8, 1, 10, 935.88, 1, 'Complete');
INSERT INTO `orders` VALUES (8, '20240327132557', 25, 8, 1, 11, 935.88, 3, 'Commented');
INSERT INTO `orders` VALUES (9, '20240327132557', 26, 8, 1, 11, 497.39, 3, 'Commented');
INSERT INTO `orders` VALUES (10, '20240327140714', 22, 10, 1, 11, 9.08, 3, 'Complete');
INSERT INTO `orders` VALUES (11, '20240327140718', 21, 10, 1, 11, 27.41, 3, 'Complete');
INSERT INTO `orders` VALUES (12, '20240603194703', 10, 8, 2, 10, 224.06, 1, 'Waiting');
INSERT INTO `orders` VALUES (13, '20240603194925', 22, 10, 4, 10, 36.32, 1, 'Completed');
INSERT INTO `orders` VALUES (14, '20240603195200', 23, 8, 6, 10, 3152.34, 1, 'Waiting');
INSERT INTO `orders` VALUES (15, '20240603195719', 22, 10, 1, 10, 9.08, 1, 'Waiting');
INSERT INTO `orders` VALUES (16, '20240603200143', 8, 5, 1, 16, 32.00, 4, 'Commented');
INSERT INTO `orders` VALUES (17, '20240603200338', 11, 8, 2, 16, 863.58, 4, 'Completed');
INSERT INTO `orders` VALUES (18, '20240603204409', 21, 10, 2, 16, 54.82, 4, 'Completed');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `count` int(10) NULL DEFAULT 0,
  `category_id` int(10) NULL DEFAULT NULL,
  `seller_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (8, 'Totto-Chan: The Little Girl at the Window', 'http://localhost:9090/files/1710689698821-book1.png', '<p>dddd</p>', 32.00, 1, 1, 5);
INSERT INTO `product` VALUES (9, 'Advantage Shoes', 'http://localhost:9090/files/1710762405753-shoe1.png', '<p><img src=\"http://localhost:9090/files/1710762318315-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><br/><br/><img src=\"http://localhost:9090/files/1710762338100-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><br/></p><p><img src=\"http://localhost:9090/files/1710762360884-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 302.26, 0, 2, 8);
INSERT INTO `product` VALUES (10, 'Boots Chunky Platform Combat Army Goth Punk Ankle Boots Shoes Doc Martens1460 ', 'http://localhost:9090/files/1710762607778-shoe2.png', '<p><img src=\"http://localhost:9090/files/1710762688893-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><br/></p><p><img src=\"http://localhost:9090/files/1710762708737-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 112.03, 2, 2, 8);
INSERT INTO `product` VALUES (11, 'Crocs Classic Clog Lightning McQueen ', 'http://localhost:9090/files/1710763228830-shoe3.png', '<p>Get ready to race with these limited edition Crocs Classic Clogs featuring Lightning McQueen! Slip on these red clogs with a comfortable fit for any occasion - whether you\'re traveling, working, or just hanging out. The rubber outsole and plastic upper material ensure durability while the Crocs Cars product line adds a fun touch to your wardrobe. This customized clog is perfect for any Cars or Classic theme lover, with a size 6 for men and size 8 for women.<br/></p>', 431.79, 2, 2, 8);
INSERT INTO `product` VALUES (12, 'Men Clarks Originals Wallabee Green Camouflage Moccasin Shoes', 'http://localhost:9090/files/1710763968697-shoe4.png', '<p>A soft camouflage print complements our natural sustainable FSC®-certified crepe sole, creating the Wallabee Camo. Digitally printed, the dye fully infuses fine Italian green suede from Sciarada tannery for a striking watercolour effect.<br/></p><p><br/></p><p><img src=\"http://localhost:9090/files/1710763937116-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710763956323-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 539.67, 0, 2, 8);
INSERT INTO `product` VALUES (13, 'Banana', 'http://localhost:9090/files/1716298982493-banana.png', '<p><br/><br/></p>', 12.00, 0, 4, 9);
INSERT INTO `product` VALUES (14, 'kiwi', 'http://localhost:9090/files/1716298874410-kiwi.png', '', 20.00, 0, 4, 9);
INSERT INTO `product` VALUES (15, 'Nike Sling Shoulder Travel Bag Mini', 'http://localhost:9090/files/1710765565881-bag1.png', '<p><img src=\"http://localhost:9090/files/1710765759603-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710765771122-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><img src=\"http://localhost:9090/files/1710765822172-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 71.97, 1, 3, 11);
INSERT INTO `product` VALUES (16, 'Free People Womens Joplin Faux Fur Warm Teddy Coat Outerwear BHFO 3310', 'http://localhost:9090/files/1710768781825-wc1.png', '<p><img src=\"http://localhost:9090/files/1710768821602-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710768839665-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710768870185-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710768934436-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 287.79, 0, 6, 6);
INSERT INTO `product` VALUES (17, 'Free People Pippa Packable Puffer Jacket Size L', 'http://localhost:9090/files/1710769004731-wc2.png', '<p><img src=\"http://localhost:9090/files/1710769030203-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710769043326-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710769059699-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><img src=\"http://localhost:9090/files/1710769125869-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 741.18, 1, 6, 6);
INSERT INTO `product` VALUES (18, 'Wilson Evolution 29.5 Inch Indoor Game Basketball', 'http://localhost:9090/files/1710770325374-sp1.png', '<p><img src=\"http://localhost:9090/files/1710770364414-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710770376019-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710770388151-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710770410544-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 438.92, 0, 8, 7);
INSERT INTO `product` VALUES (19, 'solar eclipse shirt Twice', 'http://localhost:9090/files/1710771482512-mc1.png', '<p><img src=\"http://localhost:9090/files/1710771536420-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 134.29, 1, 5, 6);
INSERT INTO `product` VALUES (20, 'Levis® 501 Mens Denim Jeans Original Fit bottoms Straight Leg Pants Jean NEW', 'http://localhost:9090/files/1710771588398-mc2.png', '<p><img src=\"http://localhost:9090/files/1710771635606-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710771650994-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710771686025-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 357.46, 0, 5, 6);
INSERT INTO `product` VALUES (21, 'Pill Box 28 Slot 7 Days Weekly Tablet Pill Medicine Box Holder Storage Organizer', 'http://localhost:9090/files/1710771984372-hc1.png', '<p><img src=\"http://localhost:9090/files/1710771878178-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710771895667-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710771911459-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><img src=\"http://localhost:9090/files/1710771947666-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 27.41, 3, 7, 10);
INSERT INTO `product` VALUES (22, 'Medicine Amber Plastic Bottles 100ml for Tablets. Liquids | Child-resistant', 'http://localhost:9090/files/1710772026853-hc2.png', '<p><img src=\"http://localhost:9090/files/1710772071915-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 9.08, 6, 7, 10);
INSERT INTO `product` VALUES (23, 'NEW Birkenstock Unisex Arizona BS 0051791 Regular Fit Black Birko-Flor Sandals', 'http://localhost:9090/files/1710854098540-shoe5.png', '<p><img src=\"http://localhost:9090/files/1710854120917-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710854137375-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><img src=\"http://localhost:9090/files/1710854221175-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 525.39, 6, 2, 8);
INSERT INTO `product` VALUES (24, 'Reebok Walk Ultra 7 DMX MAX Men\'s Shoes', 'http://localhost:9090/files/1711516544945-shoe6.png', '<p><img src=\"http://localhost:9090/files/1711516458322-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1711516474565-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><img src=\"http://localhost:9090/files/1711516534826-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 468.55, 0, 2, 8);
INSERT INTO `product` VALUES (25, 'New Balance 9060 Lifestyle Mens Style : U9060gca', 'http://localhost:9090/files/1711516639327-shoe7.png', '<p><img src=\"http://localhost:9090/files/1711516686332-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1711516696896-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1711516712151-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 935.88, 2, 2, 8);
INSERT INTO `product` VALUES (26, '2024 New Women\'s Shoes Round Toe High Heels Pumps Ladies Party Heel Red Lining', 'http://localhost:9090/files/1711516903412-shoe8.png', '<p><img src=\"http://localhost:9090/files/1711516828869-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1711516841741-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><img src=\"http://localhost:9090/files/1711516892388-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 497.39, 2, 2, 8);

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES (5, 's1', '123', 'nice book', 'http://localhost:9090/files/1710745638991-a3.png', 'SELLER', NULL, NULL, NULL, 'Pass');
INSERT INTO `seller` VALUES (6, 's2', '123', 'nice clothes', 'http://localhost:9090/files/1710745647284-a4.png', 'SELLER', NULL, NULL, NULL, 'Pass');
INSERT INTO `seller` VALUES (7, 's3', '123', 'nice sport', 'http://localhost:9090/files/1710760013284-a6.png', 'SELLER', NULL, NULL, NULL, 'Pass');
INSERT INTO `seller` VALUES (8, 's4', '123', 'nice shoes', NULL, 'SELLER', '13548192790', '1770864645@160.com', 'some nice shoes', 'Pass');
INSERT INTO `seller` VALUES (9, 's5', '123', 'nice fruits', NULL, 'SELLER', NULL, NULL, NULL, 'Pass');
INSERT INTO `seller` VALUES (10, 's6', '123', 'nice medicine', NULL, 'SELLER', NULL, NULL, NULL, 'Pass');
INSERT INTO `seller` VALUES (11, 's7', '123', 'nice bag', NULL, 'SELLER', NULL, NULL, NULL, 'Pass');
INSERT INTO `seller` VALUES (12, 's8', '123', 'nice food', NULL, 'SELLER', NULL, NULL, NULL, 'Pass');
INSERT INTO `seller` VALUES (13, 's9', '123', 'nice cleaning tool', NULL, 'SELLER', NULL, NULL, NULL, 'Pass');
INSERT INTO `seller` VALUES (14, 's10', '123', 'nice stationery', NULL, 'SELLER', NULL, NULL, NULL, 'Pass');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (10, 'u1', '123', 'Rainy', 'http://localhost:9090/files/1710689666274-a2.png', 'USER', NULL, NULL);
INSERT INTO `user` VALUES (11, 'u2', '123', 'Annie', 'http://localhost:9090/files/1710759984848-a5.png', 'USER', '13548192790', '177086555@qq.com');
INSERT INTO `user` VALUES (12, 'u3', '123', 'Enya', NULL, 'USER', NULL, NULL);
INSERT INTO `user` VALUES (13, 'u4', '123', 'Catherine', NULL, 'USER', NULL, NULL);
INSERT INTO `user` VALUES (14, 'nn', '123', 'nn', NULL, 'USER', NULL, NULL);
INSERT INTO `user` VALUES (15, '2020', '1234', '2020', NULL, 'USER', NULL, NULL);
INSERT INTO `user` VALUES (16, '2024', '1234', '2024', NULL, 'USER', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
