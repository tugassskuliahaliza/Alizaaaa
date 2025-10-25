/*
 Navicat Premium Data Transfer

 Source Server         : WILYAZA
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : WILYAZA

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 13/12/2024 18:55:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  PRIMARY KEY (`cart_id`) USING BTREE,
  INDEX `product_id`(`product_id` ASC) USING BTREE,
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 2, 1);
INSERT INTO `cart` VALUES (2, 5, 1);
INSERT INTO `cart` VALUES (3, 4, 1);

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kategori
-- ----------------------------
INSERT INTO `kategori` VALUES (0, '');
INSERT INTO `kategori` VALUES (1, 'bread');
INSERT INTO `kategori` VALUES (2, 'patry');
INSERT INTO `kategori` VALUES (3, 'cakes');

-- ----------------------------
-- Table structure for produk
-- ----------------------------
DROP TABLE IF EXISTS `produk`;
CREATE TABLE `produk`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `kategori_id` int NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga` double NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ketersediaan_stok` enum('habis','tersedia') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'tersedia',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nama`(`nama` ASC) USING BTREE,
  INDEX `kategori_produk`(`kategori_id` ASC) USING BTREE,
  CONSTRAINT `kategori_produk` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of produk
-- ----------------------------
INSERT INTO `produk` (`id`, `kategori_id`, `nama`, `harga`, `foto`, `detail`, `ketersediaan_stok`) VALUES (1, 1, 'urban elegance', 399999, 'Model_9.jpeg', 'Nikmati kelembutan roti dengan tekstur renyah di luar dan lembut di dalam, berpadu dengan rasa manis yang khas. Roti ini terinspirasi dari roti tradisional Jepang, memberikan sensasi makan yang unik di setiap gigitan.', 'tersedia');
INSERT INTO `produk` (`id`, `kategori_id`, `nama`, `harga`, `foto`, `detail`, `ketersediaan_stok`) VALUES (2, 1, 'couture collective', 499999, 'Model_dua.jpg', 'Roti panggang yang sempurna untuk menemani pagi Anda! Dengan lapisan luar yang garing dan isi yang lembut, Toast ini bisa disantap dengan berbagai topping sesuai selera, dari selai hingga cokelat.', 'tersedia');
INSERT INTO `produk` (`id`, `kategori_id`, `nama`, `harga`, `foto`, `detail`, `ketersediaan_stok`) VALUES (3, 2, 'sew chic', 379999, 'Model_tiga.jpg', 'Croissant renyah dan buttery, dipadu dengan kreasi rasa inovatif yang menggugah selera. Dengan bentuk dan tekstur yang unik, Croissant Wave hadir dengan sentuhan khas yang pasti membuat Anda ketagihan.', 'tersedia');
INSERT INTO `produk` (`id`, `kategori_id`, `nama`, `harga`, `foto`, `detail`, `ketersediaan_stok`) VALUES (4, 2, 'sassy stitches', 499999, 'Model_empat.jpg', 'Dessert lucu dengan tampilan imut, berisi krim lembut yang lumer di mulut! Paduan rasa manis dan tekstur renyah dari puff pastry membuat Cat Cream Puff jadi pilihan tepat untuk menyenangkan hati.', 'tersedia');
INSERT INTO `produk` (`id`, `kategori_id`, `nama`, `harga`, `foto`, `detail`, `ketersediaan_stok`) VALUES (5, 2, 'panache paradigm', 689999, 'Model_lima.jpeg', 'Camilan khas Spanyol dengan rasa manis dan tekstur renyah di luar, lembut di dalam. Churros kami disajikan dengan taburan gula dan kayu manis, serta dipasangkan dengan cokelat leleh yang memanjakan lidah.', 'tersedia');
INSERT INTO `produk` (`id`, `kategori_id`, `nama`, `harga`, `foto`, `detail`, `ketersediaan_stok`) VALUES (6, 3, 'distinctive duds', 479999, 'Model_6.jpeg', 'Kue bolu lembut yang dipadukan dengan krim vanilla dan potongan stroberi segar, membentuk roll cake yang menggugah selera. Setiap gigitannya menghadirkan sensasi manis dan segar yang pas!', 'tersedia');
INSERT INTO `produk` (`id`, `kategori_id`, `nama`, `harga`, `foto`, `detail`, `ketersediaan_stok`) VALUES (7, 3, 'unique unis', 469999, 'Model_7.jpeg', 'Kue jiggly ala Jepang dengan tekstur super lembut dan rasa manis yang lembut. Baby Castella adalah pilihan tepat untuk cemilan santai yang tidak hanya enak, tetapi juga menggemaskan!', 'tersedia');
INSERT INTO `produk` (`id`, `kategori_id`, `nama`, `harga`, `foto`, `detail`, `ketersediaan_stok`) VALUES (8, 3, 'charming chic', 599999, 'Model_8.jpeg', 'Ciptakan kue mini sesuai selera Anda! Dengan desain yang bisa disesuaikan, Mini Custom Cake cocok untuk berbagai acara spesial. Nikmati kue dengan rasa yang unik dan tampilan yang cantik!', 'tersedia');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'user 1', '123');

SET FOREIGN_KEY_CHECKS = 1;
