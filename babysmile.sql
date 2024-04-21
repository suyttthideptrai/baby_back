-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 21, 2024 at 02:45 PM
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
('GH1713701529', 'Gia Huy', 0, -1, '1', '2024-04-21', 1, 'AC1713700543'),
('GH1713701568', 'Gia Huy', 0, -1, '1', '2024-04-21', 1, 'AC1713700543'),
('SM1713700714', 'Sample Mat 2', 520000, -1, 'pieces', '2024-04-21', 1, 'AC1713700543'),
('SM1713701507', 'Sample Mat 2', 520000, -1, 'pieces', '2024-04-22', 1, 'AC1713700543');

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
(1, 'Bycicle Components'),
(2, 'Office Supplies'),
(3, 'Raw Material');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) NOT NULL,
  `order_delivery_date` datetime(6) NOT NULL,
  `order_issued_date` datetime(6) NOT NULL,
  `order_note` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_status` enum('PENDING','APPROVED','DELIVERING','COMPLETED','REJECTED','SUSPENDING','DELETED') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_total_price` bigint(20) NOT NULL,
  `order_quantity` int(11) NOT NULL,
  `order_material_id` char(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_receipt_id` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_user_id` int(10) NOT NULL,
  `order_vendor_id` char(15) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `receipt_id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `receipt_order_id` bigint(20) NOT NULL
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
(1, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTM2OTM5MjAsImV4cCI6MTcxMzc4MDMyMH0.rro7dsXmLoH-1FyKbAJ_JT1B-IIwt_z_SGI3RpOt37k', 'BEARER', 1),
(2, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTM2OTQ3NTcsImV4cCI6MTcxMzc4MTE1N30.U6F2FuncrykiMbH5t5JpMZhVS5iW_nF8FTOjymQlChY', 'BEARER', 1),
(52, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxMzY5NDg5OSwiZXhwIjoxNzEzNzgxMjk5fQ.LaoI0D0zlvYmezTCihm5K1BOJ-Vsb4K3e-Kqo3KybHM', 'BEARER', 1),
(53, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxMzcwMDUzMCwiZXhwIjoxNzEzNzg2OTMwfQ.LnVOhDRN8PGhOktRLOQrvjvBEJCwgMNYWViZqxEpvdI', 'BEARER', 1);

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
(151);

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
(1, '$2a$10$xUJwY7SUCIp1gMko2EYklOx85TqBr5DH5xgtSy2oy9kOb61G92gEG', '0999999999', 'ADM', 'babysmile_admin', 'babysmile_admin', 'babysmile_admin', 'babysmile_admin');

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
('AC1713700543', 'sample addreess', 'sample@email.com', 'ABC comp', 0, '99910232', 'INACTIVE', 'asdasdasd312');

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
(1, 1, 'AC1713700543');

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
-- Indexes for table `material_types`
--
ALTER TABLE `material_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `UK_rowcrb0ey5qflkf2l3dm0vidc` (`order_receipt_id`),
  ADD KEY `FKmj86tbmlpd9u677hcy69f53td` (`order_material_id`),
  ADD KEY `FKp1maxb2lt3d3y2yajbw6yqwck` (`order_user_id`),
  ADD KEY `FKhpqcxtla1rr6pdvwo2d9gcul` (`order_vendor_id`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`receipt_id`),
  ADD KEY `FKtje7ir4x40d1rx360q6vpsgw0` (`receipt_order_id`);

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
-- AUTO_INCREMENT for table `material_types`
--
ALTER TABLE `material_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_supplied_types`
--
ALTER TABLE `vendor_supplied_types`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FKhpqcxtla1rr6pdvwo2d9gcul` FOREIGN KEY (`order_vendor_id`) REFERENCES `vendors` (`vendor_id`),
  ADD CONSTRAINT `FKjcyge9r4x5w9ikyodtdfe2arq` FOREIGN KEY (`order_receipt_id`) REFERENCES `receipts` (`receipt_id`),
  ADD CONSTRAINT `FKmj86tbmlpd9u677hcy69f53td` FOREIGN KEY (`order_material_id`) REFERENCES `materials` (`material_id`),
  ADD CONSTRAINT `FKp1maxb2lt3d3y2yajbw6yqwck` FOREIGN KEY (`order_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `receipts`
--
ALTER TABLE `receipts`
  ADD CONSTRAINT `FKtje7ir4x40d1rx360q6vpsgw0` FOREIGN KEY (`receipt_order_id`) REFERENCES `orders` (`order_id`);

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
