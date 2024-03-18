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

 Date: 18/03/2024 22:40:28
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, 10, 'rr', 'vv', '123456745');

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
INSERT INTO `admin` VALUES (2, 'a', '123', 'a', 'http://localhost:9090/files/1710745626446-a1.png', 'ADMIN', NULL, NULL);
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (3, 10, 18, 7, 1);
INSERT INTO `cart` VALUES (4, 10, 14, 9, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Book', NULL, 'http://localhost:9090/files/1710160088823-Book.png');
INSERT INTO `category` VALUES (2, 'Shoe', NULL, 'http://localhost:9090/files/1710160104472-Shoe.png');
INSERT INTO `category` VALUES (3, 'Bag', NULL, 'http://localhost:9090/files/1710160120683-Bag.png');
INSERT INTO `category` VALUES (4, 'Phone', NULL, 'http://localhost:9090/files/1710160224848-Phone.png');
INSERT INTO `category` VALUES (5, 'Men Clothes', NULL, 'http://localhost:9090/files/1710160278336-Men\'s Clothing.png');
INSERT INTO `category` VALUES (6, 'Women Clothes', NULL, 'http://localhost:9090/files/1710759810474-Women\'s Clothing.png');
INSERT INTO `category` VALUES (7, 'Health Care', NULL, 'http://localhost:9090/files/1710759871847-Medicine.png');
INSERT INTO `category` VALUES (8, 'Sport', NULL, 'http://localhost:9090/files/1710770564766-sport.png');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (1, 10, 8, 5);
INSERT INTO `collect` VALUES (2, 10, 18, 7);
INSERT INTO `collect` VALUES (3, 10, 14, 9);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 10, 8, 5, 'nice', '2024-03-18 16:28:24');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '20240318162658', 8, 5, 2, 10, 64.00, 1, 'Commented');
INSERT INTO `orders` VALUES (2, '20240318223910', 15, 11, 1, 10, 71.97, 1, 'Waiting');

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
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (8, 'Totto-Chan: The Little Girl at the Window', 'http://localhost:9090/files/1710689698821-book1.png', '<p>dddd</p>', 32.00, 0, 1, 5);
INSERT INTO `product` VALUES (9, 'Advantage Shoes', 'http://localhost:9090/files/1710762405753-shoe1.png', '<p><img src=\"http://localhost:9090/files/1710762318315-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><br/><br/><img src=\"http://localhost:9090/files/1710762338100-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><br/></p><p><img src=\"http://localhost:9090/files/1710762360884-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 302.26, 0, 2, 8);
INSERT INTO `product` VALUES (10, 'Boots Chunky Platform Combat Army Goth Punk Ankle Boots Shoes Doc Martens1460 ', 'http://localhost:9090/files/1710762607778-shoe2.png', '<p><img src=\"http://localhost:9090/files/1710762688893-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><br/></p><p><img src=\"http://localhost:9090/files/1710762708737-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 112.03, 0, 2, 8);
INSERT INTO `product` VALUES (11, 'Crocs Classic Clog Lightning McQueen ', 'http://localhost:9090/files/1710763228830-shoe3.png', '<p>Get ready to race with these limited edition Crocs Classic Clogs featuring Lightning McQueen! Slip on these red clogs with a comfortable fit for any occasion - whether you\'re traveling, working, or just hanging out. The rubber outsole and plastic upper material ensure durability while the Crocs Cars product line adds a fun touch to your wardrobe. This customized clog is perfect for any Cars or Classic theme lover, with a size 6 for men and size 8 for women.<br/></p>', 431.79, 0, 2, 8);
INSERT INTO `product` VALUES (12, 'Men Clarks Originals Wallabee Green Camouflage Moccasin Shoes', 'http://localhost:9090/files/1710763968697-shoe4.png', '<p>A soft camouflage print complements our natural sustainable FSC®-certified crepe sole, creating the Wallabee Camo. Digitally printed, the dye fully infuses fine Italian green suede from Sciarada tannery for a striking watercolour effect.<br/></p><p><br/></p><p><img src=\"http://localhost:9090/files/1710763937116-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710763956323-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 539.67, 0, 2, 8);
INSERT INTO `product` VALUES (13, 'Apple iPhone 15 128GB', 'http://localhost:9090/files/1710764186314-phone1.png', '<p><br/><img src=\"http://localhost:9090/files/1710764236859-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><img src=\"http://localhost:9090/files/1710764254308-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><img src=\"http://localhost:9090/files/1710764340273-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 4677.41, 0, 4, 9);
INSERT INTO `product` VALUES (14, 'New Samsung Galaxy Note10 - 256GB', 'http://localhost:9090/files/1710765326124-phone2.png', '<p><img src=\"http://localhost:9090/files/1710765367002-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710765389065-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710765412534-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 2291.93, 0, 4, 9);
INSERT INTO `product` VALUES (15, 'Nike Sling Shoulder Travel Bag Mini', 'http://localhost:9090/files/1710765565881-bag1.png', '<p><img src=\"http://localhost:9090/files/1710765759603-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710765771122-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><img src=\"http://localhost:9090/files/1710765822172-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 71.97, 0, 3, 11);
INSERT INTO `product` VALUES (16, 'Free People Womens Joplin Faux Fur Warm Teddy Coat Outerwear BHFO 3310', 'http://localhost:9090/files/1710768781825-wc1.png', '<p><img src=\"http://localhost:9090/files/1710768821602-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710768839665-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710768870185-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710768934436-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 287.79, 0, 6, 6);
INSERT INTO `product` VALUES (17, 'Free People Pippa Packable Puffer Jacket Size L', 'http://localhost:9090/files/1710769004731-wc2.png', '<p><img src=\"http://localhost:9090/files/1710769030203-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710769043326-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710769059699-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><img src=\"http://localhost:9090/files/1710769125869-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 741.18, 0, 6, 6);
INSERT INTO `product` VALUES (18, 'Wilson Evolution 29.5 Inch Indoor Game Basketball', 'http://localhost:9090/files/1710770325374-sp1.png', '<p><img src=\"http://localhost:9090/files/1710770364414-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710770376019-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710770388151-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710770410544-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 438.92, 0, 8, 7);
INSERT INTO `product` VALUES (19, 'solar eclipse shirt Twice', 'http://localhost:9090/files/1710771482512-mc1.png', '<p><img src=\"http://localhost:9090/files/1710771536420-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 134.29, 0, 5, 6);
INSERT INTO `product` VALUES (20, 'Levis® 501 Mens Denim Jeans Original Fit bottoms Straight Leg Pants Jean NEW', 'http://localhost:9090/files/1710771588398-mc2.png', '<p><img src=\"http://localhost:9090/files/1710771635606-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710771650994-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710771686025-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 357.46, 0, 5, 6);
INSERT INTO `product` VALUES (21, 'Pill Box 28 Slot 7 Days Weekly Tablet Pill Medicine Box Holder Storage Organizer', 'http://localhost:9090/files/1710771984372-hc1.png', '<p><img src=\"http://localhost:9090/files/1710771878178-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710771895667-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><img src=\"http://localhost:9090/files/1710771911459-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><img src=\"http://localhost:9090/files/1710771947666-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 27.41, 0, 7, 10);
INSERT INTO `product` VALUES (22, 'Medicine Amber Plastic Bottles 100ml for Tablets. Liquids | Child-resistant', 'http://localhost:9090/files/1710772026853-hc2.png', '<p><img src=\"http://localhost:9090/files/1710772071915-image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 9.08, 0, 7, 10);

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES (5, 's1', '123', 'nice book', 'http://localhost:9090/files/1710745638991-a3.png', 'SELLER', NULL, NULL, NULL, 'Pass');
INSERT INTO `seller` VALUES (6, 's2', '123', 'nice clothes', 'http://localhost:9090/files/1710745647284-a4.png', 'SELLER', NULL, NULL, NULL, 'Pass');
INSERT INTO `seller` VALUES (7, 's3', '123', 'nice sport', 'http://localhost:9090/files/1710760013284-a6.png', 'SELLER', NULL, NULL, NULL, 'Pass');
INSERT INTO `seller` VALUES (8, 's4', '123', 'nice shoes', NULL, 'SELLER', '13548192790', '1770864645@160.com', 'some nice shoes', 'Pass');
INSERT INTO `seller` VALUES (9, 's5', '123', 'nice phone', NULL, 'SELLER', NULL, NULL, NULL, 'Pass');
INSERT INTO `seller` VALUES (10, 's6', '123', 'nice medicine', NULL, 'SELLER', NULL, NULL, NULL, 'Pass');
INSERT INTO `seller` VALUES (11, 's7', '123', 'nice bag', NULL, 'SELLER', NULL, NULL, NULL, 'Pass');

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (10, 'u1', '123', 'xx', 'http://localhost:9090/files/1710689666274-a2.png', 'USER', NULL, NULL);
INSERT INTO `user` VALUES (11, 'u2', '123', 'Annie', 'http://localhost:9090/files/1710759984848-a5.png', 'USER', '13548192790', '177086555@qq.com');

SET FOREIGN_KEY_CHECKS = 1;
