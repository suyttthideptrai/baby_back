-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 24, 2024 at 01:05 AM
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
  `material_quantity` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `material_price` int(11) NOT NULL,
  `material_warehouse_date` date NOT NULL,
  `material_unit_of_measure` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `material_id` char(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `material_vendor_id` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `material_name` char(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`material_quantity`, `type_id`, `material_price`, `material_warehouse_date`, `material_unit_of_measure`, `material_id`, `material_vendor_id`, `material_name`) VALUES
(-1, 3, 1200000, '2024-04-24', 'pair', '1B1713920601', 'YF1713920535', '1Pair Bicycle Brake Handle');

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
(1, 'Văn phòng phẩm'),
(2, 'Nguyên vật liệu'),
(3, 'Bộ phận xe');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_quantity` int(11) NOT NULL,
  `order_delivery_date` datetime(6) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_issued_date` datetime(6) NOT NULL,
  `order_total_price` bigint(20) NOT NULL,
  `order_user_id` int(10) NOT NULL,
  `order_material_id` char(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_receipt_id` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_vendor_id` char(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_note` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_status` enum('PENDING','APPROVED','DELIVERING','COMPLETED','REJECTED','SUSPENDING','DELETED') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `created_at` datetime NOT NULL,
  `receipt_order_id` bigint(20) NOT NULL,
  `receipt_id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `expired` bit(1) NOT NULL,
  `id` int(11) NOT NULL,
  `revoked` bit(1) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_type` enum('BEARER') COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`expired`, `id`, `revoked`, `user_id`, `token`, `token_type`) VALUES
(b'0', 1, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxMzg4NTc1MCwiZXhwIjoxNzEzOTcyMTUwfQ.cEeWqigYVWuaikNVqBmrW1N39tGrce1ksuZjG3m2yDo', 'BEARER'),
(b'0', 2, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxMzg4NTc1OCwiZXhwIjoxNzEzOTcyMTU4fQ.i6OD_vsGbr3JYn0QHSoRAN9dphqaHp1VcHQHRQv-co4', 'BEARER'),
(b'0', 3, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxMzg4NTk2NSwiZXhwIjoxNzEzOTcyMzY1fQ.yK03O2U1n6jc8-jHLGLBR1k-1hfbmucSn-60HckkNbU', 'BEARER'),
(b'0', 4, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxMzg4NjAyMywiZXhwIjoxNzEzOTcyNDIzfQ.uJC2uxQ4dvrhpsp-IAca86t1vLg6WpS9l8GqgSgx6GE', 'BEARER'),
(b'0', 5, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxMzg5MDQ5OCwiZXhwIjoxNzEzOTc2ODk4fQ.knB9_eal4PpYGcOOhTgkuL1minekV7CodIF7yaSGYgo', 'BEARER'),
(b'0', 6, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxMzg5MDc2NSwiZXhwIjoxNzEzOTc3MTY1fQ.QffnFxJLfsdYOxWBLmeyMU-oW3YwpoRcwgWV_AqzmJo', 'BEARER'),
(b'0', 7, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxMzg5MTA2MCwiZXhwIjoxNzEzOTc3NDYwfQ.yI_It5ePDciBzwvvp6avJ4VeevU2XdtUN-2nvOysnX8', 'BEARER'),
(b'0', 8, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxMzg5MTk3NCwiZXhwIjoxNzEzOTc4Mzc0fQ.Yqp4xQGPbukiPii95TMTxjBtq58O4oOJeLyZVMzDexY', 'BEARER'),
(b'0', 9, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxMzg5Mzg2MiwiZXhwIjoxNzEzOTgwMjYyfQ.BGfVBp5MYOxoT9w6Q7j14SV52ene317uOJP7VRCJ5Vk', 'BEARER'),
(b'0', 52, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxMzkxOTM0OSwiZXhwIjoxNzE0MDA1NzQ5fQ.xF_er4bQ8donZvUdXHwkfHKbMBcc8wpoH2d4oJzLmsY', 'BEARER'),
(b'0', 53, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxMzkyMDA3NCwiZXhwIjoxNzE0MDA2NDc0fQ.Y4gv4iOU0DbxoegexGDkW-zxYpGVm-ODxapgv0JPlus', 'BEARER');

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
  `user_address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_real_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('ADM','NON_STAFF','PRD','IND','PUD') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `password`, `phone_number`, `user_address`, `user_email`, `user_real_name`, `username`, `role`) VALUES
(1, '$2a$10$fNK5LXGaj0BvHCB568vpuukeKdyUUkyUkR1RpDXhIru/ijyr9ub2u', '0999999999', 'babysmile_admin', 'babysmile_admin', 'babysmile_admin', 'babysmile_admin', 'ADM');

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
  `vendor_order_budget` int(11) NOT NULL DEFAULT '0',
  `vendor_id` char(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_tax_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_status` enum('ACTIVE','INACTIVE','INORDER') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`vendor_order_budget`, `vendor_id`, `vendor_tax_code`, `vendor_name`, `vendor_address`, `vendor_email`, `vendor_phone`, `vendor_status`) VALUES
(0, 'YF1713920535', '12345678abc', 'YZ FACTORY', 'km 9 Nguyen Trai', 'nguyen@gmail.com', '0999102312', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_supplied_types`
--

CREATE TABLE `vendor_supplied_types` (
  `material_type_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `vendor_id` char(15) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_supplied_types`
--

INSERT INTO `vendor_supplied_types` (`material_type_id`, `id`, `vendor_id`) VALUES
(3, 4, 'YF1713920535');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `FK5093fls8u6emq9666xtacdj0q` FOREIGN KEY (`type_id`) REFERENCES `material_types` (`type_id`),
  ADD CONSTRAINT `FKpbdexnvwm9c46tq56yhvcggxu` FOREIGN KEY (`material_vendor_id`) REFERENCES `vendors` (`vendor_id`);

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
  ADD CONSTRAINT `FK9wxdqi2c4iqx3wookvb42x8uh` FOREIGN KEY (`material_type_id`) REFERENCES `material_types` (`type_id`),
  ADD CONSTRAINT `FKs6b9t88f42x2jt9yb7brrjxwc` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`vendor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
