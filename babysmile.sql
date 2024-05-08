-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 08, 2024 at 05:35 AM
-- Server version: 5.5.65-MariaDB
-- PHP Version: 8.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `babysmile`
--

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `material_id` char(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `material_name` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `material_price` int(11) NOT NULL,
  `material_quantity` int(11) NOT NULL,
  `material_unit_of_measure` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `material_warehouse_date` date NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `material_vendor_id` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`material_id`, `material_name`, `material_price`, `material_quantity`, `material_unit_of_measure`, `material_warehouse_date`, `type_id`, `material_vendor_id`) VALUES
('1B0001', '1Pair Bicycle Brake Handle', 300000, -1, 'pair', '2024-05-08', 1, 'EC0001'),
('A10001', 'AA 1.2V x6 Battery Pack', 45000, -1, 'Pack', '2024-05-07', 3, 'EC0001'),
('GI0001', 'Giấy in A4 Double A', 50000, -1, 'Pack', '2024-05-07', 3, 'EC0001'),
('SM0001', 'Sample Mat 1', 20000, -1, 'Cái', '2024-05-07', 2, 'EC0001'),
('SM0002', 'Sample Mat 1', 20000, -1, 'Cái', '2024-05-07', 2, 'EC0001'),
('SM0003', 'Sample Mat 1', 20000, -1, 'Cái', '2024-05-08', 2, 'EC0001');

-- --------------------------------------------------------

--
-- Table structure for table `material_exports`
--

CREATE TABLE `material_exports` (
  `export_id` bigint(20) NOT NULL,
  `export_date` datetime(6) NOT NULL,
  `export_quantity` int(11) NOT NULL,
  `export_material_id` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `material_types`
--

CREATE TABLE `material_types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `material_types`
--

INSERT INTO `material_types` (`type_id`, `type_name`) VALUES
(1, 'Bộ phận xe'),
(2, 'Nguyên vật liệu'),
(3, 'Văn phòng phẩm');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_approved_date` datetime(6) DEFAULT NULL,
  `order_delivery_date` datetime(6) DEFAULT NULL,
  `order_issued_date` datetime(6) NOT NULL,
  `order_status` tinyint(4) NOT NULL,
  `order_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_total_price` bigint(20) DEFAULT NULL,
  `order_user_id` int(10) NOT NULL,
  `order_vendor_id` char(15) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_approved_date`, `order_delivery_date`, `order_issued_date`, `order_status`, `order_title`, `order_total_price`, `order_user_id`, `order_vendor_id`) VALUES
('OD0001', NULL, '2024-05-16 07:00:00.000000', '2024-05-07 19:30:58.000000', 0, 'Order văn phòng phẩm tuần 3', 590000, 1, 'EC0001'),
('OD0002', NULL, '2024-05-23 07:00:00.000000', '2024-05-07 21:03:17.000000', 0, 'sample order hihi haha', 5000000, 1, 'EC0001'),
('OD0003', NULL, '2024-05-17 07:00:00.000000', '2024-05-08 11:04:11.000000', 0, 'Order 123', 345000, 1, 'EC0001');

-- --------------------------------------------------------

--
-- Table structure for table `order_materials`
--

CREATE TABLE `order_materials` (
  `order_material_id` bigint(20) NOT NULL,
  `order_material_status` tinyint(4) NOT NULL,
  `order_material_actual_quantity` int(11) NOT NULL,
  `order_material_price_per_unit` bigint(20) NOT NULL,
  `order_material_quantity` int(11) NOT NULL,
  `material_id` char(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` char(8) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_materials`
--

INSERT INTO `order_materials` (`order_material_id`, `order_material_status`, `order_material_actual_quantity`, `order_material_price_per_unit`, `order_material_quantity`, `material_id`, `order_id`) VALUES
(1, 0, 0, 45000, 2, 'A10001', 'OD0001'),
(2, 0, 0, 50000, 10, 'GI0001', 'OD0001'),
(3, 0, 0, 50000, 100, 'GI0001', 'OD0002'),
(9, 0, 0, 300000, 1, '1B0001', 'OD0003'),
(10, 0, 0, 45000, 1, 'A10001', 'OD0003');

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `receipt_id` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `receipt_creator_id` int(10) NOT NULL,
  `receipt_order_id` char(8) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_items`
--

CREATE TABLE `receipt_items` (
  `receipt_item_id` bigint(20) NOT NULL,
  `receipt_item_quantity` int(11) NOT NULL,
  `order_material_id` bigint(20) NOT NULL,
  `receipt_id` char(8) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `expired` bit(1) NOT NULL,
  `revoked` bit(1) NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_type` enum('BEARER') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id`, `expired`, `revoked`, `token`, `token_type`, `user_id`) VALUES
(1, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTA4NDEwOCwiZXhwIjoxNzE1MTcwNTA4fQ.WoaB798vMwhb1tCU8GXjA123BkhDQmdUhw2HLIxG-IQ', 'BEARER', 1),
(2, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTA4NDExMSwiZXhwIjoxNzE1MTcwNTExfQ.xnXXPSbWirBpc-JUcoXyQ2iIHRQzKqgy6sc0XbLWlzw', 'BEARER', 1),
(52, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTA5MDQyNSwiZXhwIjoxNzE1MTc2ODI1fQ.5fn8IHTe6LF1xGKYd-UvRdlhYU9KYj-cinf0RhpI87M', 'BEARER', 1),
(53, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTA5MTM4NCwiZXhwIjoxNzE1MTc3Nzg0fQ.G6lTsviyqQQz4YhvLP2K4HK-Tx7XJTaClBtsXL8GVyc', 'BEARER', 1),
(54, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTA5MTc2MCwiZXhwIjoxNzE1MTc4MTYwfQ.Z-9-PPD2A-nxmElm79Lop6Zn8G9jV4SB8FWNmzdye_A', 'BEARER', 1),
(55, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTA5MTgxNiwiZXhwIjoxNzE1MTc4MjE2fQ.YfL_gQp8aCetQg9Emp8qUjgozlYYcXCq8bkJcv5MKdo', 'BEARER', 1),
(56, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTA5MTk3MiwiZXhwIjoxNzE1MTc4MzcyfQ.zOk9HeEJqHAotWKhCg3gSi5vVNHYi9Cozugfg1O6iOo', 'BEARER', 1),
(57, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTA5MjMzNiwiZXhwIjoxNzE1MTc4NzM2fQ.Ww0zs-wY9RGmCpGRZQHj81TMMriDcXiNN2KdLGM_uVM', 'BEARER', 1),
(58, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTA5MjcwNCwiZXhwIjoxNzE1MTc5MTA0fQ.D97C7kwAcSVYDAmfE-qMDQzceC4xyNQyBRc5hLUBQ7s', 'BEARER', 1),
(59, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTA5MzI4MSwiZXhwIjoxNzE1MTc5NjgxfQ.1b2RskZmepS2-o25NvApedZ3FUOxJ7A7QI4oznVNpxw', 'BEARER', 1),
(60, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTA5MzQ5OSwiZXhwIjoxNzE1MTc5ODk5fQ.jL1A25fckv57IPAwp5_SANrIWBrmk1yCWedwdF9HawM', 'BEARER', 1),
(61, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTA5MzU3OCwiZXhwIjoxNzE1MTc5OTc4fQ.9uq-Y05pzuKPQKN25_11ji6PqBylXzwdhlBi2PS9Cos', 'BEARER', 1),
(102, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTA5NDA0OSwiZXhwIjoxNzE1MTgwNDQ5fQ.YgqMvg33Jm1ql9RNvjE4emR2TJT1I8LkF7lHgXSVzyM', 'BEARER', 1),
(152, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTEzNzEyMiwiZXhwIjoxNzE1MjIzNTIyfQ.w26n0BgAR5Nc1wKo-O3dNlh1Sp1F7eVS1kyJbQQ2ljU', 'BEARER', 1),
(154, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTE0MDM2MCwiZXhwIjoxNzE1MjI2NzYwfQ.7__UTvG7wNrywyLjTMYaWtoAM9a0hRrvfQHGTK7zZjk', 'BEARER', 1),
(155, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTE0MDM5OCwiZXhwIjoxNzE1MjI2Nzk4fQ.FOKT_UAFIaaASAE1PbkDb4wJvojt_ZCUzwtJ3MRD8jk', 'BEARER', 1),
(156, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTE0MDcwMCwiZXhwIjoxNzE1MjI3MTAwfQ.wU9vDsTC4wpFl8mx7To1VxytBCSF9DBa3rLom1CeVVM', 'BEARER', 1),
(157, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTE0MTM2MywiZXhwIjoxNzE1MjI3NzYzfQ._S9VnNydzf3Afy6nlvawtl-p-uz3-0HZqhYn9pggeBE', 'BEARER', 1),
(158, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTE0MzA4OSwiZXhwIjoxNzE1MjI5NDg5fQ.q-vkuYhDF_HVirA40tBMNb-RWGqudM2NsMQ-kIeCVlY', 'BEARER', 1),
(159, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTE0MzYxMiwiZXhwIjoxNzE1MjMwMDEyfQ.WmMaFE7L7Cwr3ZvsaoSwz_bBDgksi5WgtoCA9zsZkYM', 'BEARER', 1),
(160, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTE0NjAyMiwiZXhwIjoxNzE1MjMyNDIyfQ.XUHAYGl6PHTHnK-1QaoRgZBQ7GZZ5Fy28zHR-NOFkh8', 'BEARER', 1);

-- --------------------------------------------------------

--
-- Table structure for table `token_seq`
--

CREATE TABLE `token_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `token_seq`
--

INSERT INTO `token_seq` (`next_val`) VALUES
(251);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('ADM','NON_STAFF','PRD','IND','PUD') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_real_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `password`, `phone_number`, `role`, `user_address`, `user_email`, `user_real_name`, `username`) VALUES
(1, '$2a$10$EPEHqHsDl361tjhDcL8Xju/DVEH6uILsQrsau3cXK50K9XO8ZJbGO', '0999999999', 'ADM', 'babysmile_admin', 'babysmile_admin', 'babysmile_admin', 'babysmile_admin');

-- --------------------------------------------------------

--
-- Table structure for table `users_seq`
--

CREATE TABLE `users_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_seq`
--

INSERT INTO `users_seq` (`next_val`) VALUES
(51);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `vendor_id` char(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_order_budget` int(11) NOT NULL DEFAULT '0',
  `vendor_phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_status` enum('ACTIVE','INACTIVE','INORDER') COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_tax_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`vendor_id`, `vendor_address`, `vendor_email`, `vendor_name`, `vendor_order_budget`, `vendor_phone`, `vendor_status`, `vendor_tax_code`) VALUES
('EC0001', '159 Nguyễn Trãi', 'sample@email.com', 'EVEREADY CO', 0, '99910232', 'ACTIVE', 'aow1023995'),
('EC0002', '159 Nguyễn Trãi', 'sample@email.com', 'EVEREADY CO 2', 0, '99910232', 'INACTIVE', 'aow1023995');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_supplied_types`
--

CREATE TABLE `vendor_supplied_types` (
  `id` bigint(20) NOT NULL,
  `material_type_id` int(11) NOT NULL,
  `vendor_id` char(15) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_supplied_types`
--

INSERT INTO `vendor_supplied_types` (`id`, `material_type_id`, `vendor_id`) VALUES
(1, 3, 'EC0001'),
(2, 2, 'EC0001'),
(3, 1, 'EC0001');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`material_id`),
  ADD KEY `FK5093fls8u6emq9666xtacdj0q` (`type_id`),
  ADD KEY `FKpbdexnvwm9c46tq56yhvcggxu` (`material_vendor_id`);

--
-- Indexes for table `material_exports`
--
ALTER TABLE `material_exports`
  ADD PRIMARY KEY (`export_id`),
  ADD KEY `FKcoq43tm85ecpwxd4k4n007npb` (`export_material_id`);

--
-- Indexes for table `material_types`
--
ALTER TABLE `material_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `FKp1maxb2lt3d3y2yajbw6yqwck` (`order_user_id`),
  ADD KEY `FKhpqcxtla1rr6pdvwo2d9gcul` (`order_vendor_id`);

--
-- Indexes for table `order_materials`
--
ALTER TABLE `order_materials`
  ADD PRIMARY KEY (`order_material_id`),
  ADD KEY `FKmc5d4e2mrb9naxq0qlcww2g3v` (`material_id`),
  ADD KEY `FKl6kk86urr9nej38u2kum26q0a` (`order_id`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`receipt_id`),
  ADD KEY `FKoiiyib8os10es6ric22xwu9qg` (`receipt_creator_id`),
  ADD KEY `FKtje7ir4x40d1rx360q6vpsgw0` (`receipt_order_id`);

--
-- Indexes for table `receipt_items`
--
ALTER TABLE `receipt_items`
  ADD PRIMARY KEY (`receipt_item_id`),
  ADD UNIQUE KEY `UK_ljo8smpcd43ne429b66w0sbum` (`order_material_id`),
  ADD KEY `FKmyfhuc1y0sjqe2geey8jx9nc2` (`receipt_id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_pddrhgwxnms2aceeku9s2ewy5` (`token`),
  ADD KEY `FKj8rfw4x0wjjyibfqq566j4qng` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`vendor_id`);

--
-- Indexes for table `vendor_supplied_types`
--
ALTER TABLE `vendor_supplied_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9wxdqi2c4iqx3wookvb42x8uh` (`material_type_id`),
  ADD KEY `FKs6b9t88f42x2jt9yb7brrjxwc` (`vendor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `material_exports`
--
ALTER TABLE `material_exports`
  MODIFY `export_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `material_types`
--
ALTER TABLE `material_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_materials`
--
ALTER TABLE `order_materials`
  MODIFY `order_material_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `receipt_items`
--
ALTER TABLE `receipt_items`
  MODIFY `receipt_item_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_supplied_types`
--
ALTER TABLE `vendor_supplied_types`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `FKpbdexnvwm9c46tq56yhvcggxu` FOREIGN KEY (`material_vendor_id`) REFERENCES `vendors` (`vendor_id`),
  ADD CONSTRAINT `FK5093fls8u6emq9666xtacdj0q` FOREIGN KEY (`type_id`) REFERENCES `material_types` (`type_id`);

--
-- Constraints for table `material_exports`
--
ALTER TABLE `material_exports`
  ADD CONSTRAINT `FKcoq43tm85ecpwxd4k4n007npb` FOREIGN KEY (`export_material_id`) REFERENCES `materials` (`material_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FKhpqcxtla1rr6pdvwo2d9gcul` FOREIGN KEY (`order_vendor_id`) REFERENCES `vendors` (`vendor_id`),
  ADD CONSTRAINT `FKp1maxb2lt3d3y2yajbw6yqwck` FOREIGN KEY (`order_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_materials`
--
ALTER TABLE `order_materials`
  ADD CONSTRAINT `FKl6kk86urr9nej38u2kum26q0a` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `FKmc5d4e2mrb9naxq0qlcww2g3v` FOREIGN KEY (`material_id`) REFERENCES `materials` (`material_id`);

--
-- Constraints for table `receipts`
--
ALTER TABLE `receipts`
  ADD CONSTRAINT `FKtje7ir4x40d1rx360q6vpsgw0` FOREIGN KEY (`receipt_order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `FKoiiyib8os10es6ric22xwu9qg` FOREIGN KEY (`receipt_creator_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `receipt_items`
--
ALTER TABLE `receipt_items`
  ADD CONSTRAINT `FKmyfhuc1y0sjqe2geey8jx9nc2` FOREIGN KEY (`receipt_id`) REFERENCES `receipts` (`receipt_id`),
  ADD CONSTRAINT `FKo0b8b51tud7a15kxosyrpy3v9` FOREIGN KEY (`order_material_id`) REFERENCES `order_materials` (`order_material_id`);

--
-- Constraints for table `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `FKj8rfw4x0wjjyibfqq566j4qng` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `vendor_supplied_types`
--
ALTER TABLE `vendor_supplied_types`
  ADD CONSTRAINT `FKs6b9t88f42x2jt9yb7brrjxwc` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`vendor_id`),
  ADD CONSTRAINT `FK9wxdqi2c4iqx3wookvb42x8uh` FOREIGN KEY (`material_type_id`) REFERENCES `material_types` (`type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
