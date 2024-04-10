-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 10, 2024 at 07:22 AM
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
CREATE DATABASE IF NOT EXISTS `babysmile` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `babysmile`;

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `material_quantity` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `material_price` int(11) NOT NULL,
  `material_warehouse_date` date NOT NULL,
  `material_id` char(10) NOT NULL,
  `material_unit_of_measure` char(10) NOT NULL,
  `material_vendor_id` char(10) DEFAULT NULL,
  `material_name` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`material_quantity`, `type_id`, `material_price`, `material_warehouse_date`, `material_id`, `material_unit_of_measure`, `material_vendor_id`, `material_name`) VALUES
(-1, 1, 20000, '2024-03-29', 'HNC212344', 'Sample', 'BC0001', 'ASC'),
(-1, 2, 20000, '2024-03-29', 'HNC41234', 'piece', 'BC0001', 'Paper cut'),
(-1, 2, 20000, '2024-03-29', 'HNC413234', 'pairs', 'BC0001', 'Brakes');

-- --------------------------------------------------------

--
-- Table structure for table `material_types`
--

CREATE TABLE `material_types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `material_types`
--

INSERT INTO `material_types` (`type_id`, `type_name`) VALUES
(1, 'Raw Material'),
(2, 'Office Supplies'),
(3, 'Bycicle Components');

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
  `order_material_id` char(10) NOT NULL,
  `order_vendor_id` char(10) NOT NULL,
  `order_receipt_id` varchar(15) DEFAULT NULL,
  `order_title` varchar(50) NOT NULL,
  `order_note` varchar(100) DEFAULT NULL,
  `order_status` enum('PENDING','APPROVED','DELIVERING','COMPLETED','REJECTED','SUSPENDING','DELETED') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `created_at` datetime NOT NULL,
  `receipt_order_id` bigint(20) NOT NULL,
  `receipt_id` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `expired` bit(1) NOT NULL,
  `id` int(11) NOT NULL,
  `revoked` bit(1) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_type` enum('BEARER') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`expired`, `id`, `revoked`, `user_id`, `token`, `token_type`) VALUES
(b'0', 1, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NTE4MjUsImV4cCI6MTcxMjY1MzAyNX0.n6ZDgmwNPIN4m4ZZNjdtwb0il4ozQwJ88L-H7x0UKBo', 'BEARER'),
(b'0', 2, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NTE4MzAsImV4cCI6MTcxMjY1MzAzMH0.q2P_Me8yyi60_Wbl93wOaJqWzK3yG-Zbx3bS1RZMi_A', 'BEARER'),
(b'0', 3, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NTI5NTEsImV4cCI6MTcxMjY1NDE1MX0.GVl4YFaajOmVxR98wYGYd1HjOtV78yunR24W0U0-2qU', 'BEARER'),
(b'0', 4, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NTMxMzIsImV4cCI6MTcxMjY1NDMzMn0.Jm1nrVAm5o7xjyjC6tMZhd68BzVSBgW87yXxmbkwq70', 'BEARER'),
(b'0', 5, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NTM0NDEsImV4cCI6MTcxMjY1NDY0MX0.aPdDvlvaLDqeeh2sy_0rkDHjL-t23QBxRFKX8swKheM', 'BEARER'),
(b'0', 6, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NTQ0NDgsImV4cCI6MTcxMjY1NTY0OH0.xcvEk8TC6DEBZUVSY2Z5_C1isVq0RuqNjAzhopG4_-o', 'BEARER'),
(b'0', 52, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NTYzMTYsImV4cCI6MTcxMjY1NzUxNn0.gxggEo9vkg2GT_XE8IWC9o-U-jccUjOeyX7Xu7nq2lM', 'BEARER'),
(b'0', 53, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NTkxNDgsImV4cCI6MTcxMjY2MDM0OH0.toean9AWZw-Cmv5mR5B7twbS8Pxybztgq0tktsd3Mck', 'BEARER'),
(b'0', 54, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NTk1NDcsImV4cCI6MTcxMjY2MDc0N30.5ntBs3cJlrgYFgm3YeS27fC3IZd4nx0iXRyrnlrZVpQ', 'BEARER'),
(b'0', 55, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NjI1MjcsImV4cCI6MTcxMjY2MzcyN30.Mqt-ffRgMt8c6Qys6jqhxDilQIFi97mV3AJokAjXi4Y', 'BEARER'),
(b'0', 102, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NjM5MjIsImV4cCI6MTcxMjY2NTEyMn0.41kxDEiQMlZA6Km_xXi-8sX0qq3_M1aTxqonBN2cCtA', 'BEARER'),
(b'0', 152, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NjQyMzQsImV4cCI6MTcxMjY2NTQzNH0.s-NBpsDBh82A_RtmHVtP8iaeAVEmpmg7D_063ggWsC0', 'BEARER'),
(b'0', 153, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NjQ5MzgsImV4cCI6MTcxMjY2NjEzOH0.KbkVkNZjpJodbyEm68AZAgPJLaskrQVpMcNWd4iGQnw', 'BEARER'),
(b'0', 154, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NjUwMTcsImV4cCI6MTcxMjY2NjIxN30.GNCGtPU8qPMiiPDycptET-hySswhHoCPMniUJ882Rkg', 'BEARER'),
(b'0', 155, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NjU1MzAsImV4cCI6MTcxMjY2NjczMH0.CxMQC0msnkC-LieAMgCPPdY5eGKfMe-bwZ5OLx9nAtk', 'BEARER'),
(b'0', 156, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NjY2NjYsImV4cCI6MTcxMjY2Nzg2Nn0.Rb0DLhrbcgnWoyevWVvnXSuNJnrcHiXU6kkBylrEtzY', 'BEARER'),
(b'0', 157, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NjcxOTgsImV4cCI6MTcxMjY2ODM5OH0.x9wkvn_UcsyvwSa4sjTCWtWJwsccLRKRr3LC1LQOFm0', 'BEARER'),
(b'0', 158, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NjcyOTUsImV4cCI6MTcxMjY2ODQ5NX0.rF2aoiRFqSsHsj93Svhr9oRKyFoGYSl_9pLU8kay8aI', 'BEARER'),
(b'0', 159, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NjgwMDYsImV4cCI6MTcxMjY2OTIwNn0.fr7agJOqe6zyv1atH45nOZWJ8XPIS2436yfHWVXjkq0', 'BEARER'),
(b'0', 160, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NjgxNDEsImV4cCI6MTcxMjY2OTM0MX0.jE441RtKV14cV3Zr6zfqOge6awxsZ59DQQ9k5vEfrVQ', 'BEARER'),
(b'0', 161, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2Njg0MjksImV4cCI6MTcxMjY2OTYyOX0.Z1QLTBtALld0EnUlmRgSPOikqDLu6AmeOlmER2EQhdo', 'BEARER'),
(b'0', 202, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2Njk2MDMsImV4cCI6MTcxMjY3MDgwM30.Kt3xrapf8dwpmoAyPsSzLMQs3vz8OIdg4TyCi5nF64c', 'BEARER'),
(b'0', 203, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2Njk3ODQsImV4cCI6MTcxMjY3MDk4NH0.U52eGz3T3kXW4p1XfmitAFykYnZFj31o4toT90sq8mI', 'BEARER'),
(b'0', 204, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NzA2NTgsImV4cCI6MTcxMjY3MTg1OH0.2yMVxeWSwCEDF8Vkn8quDyZ6UwK84RxpDFXWyDRB2-g', 'BEARER'),
(b'0', 205, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NzEyNTYsImV4cCI6MTcxMjY3MjQ1Nn0.LxGqN79NJJjG4muamTSYSqGf6ifjwyT04D9nYrYhoKI', 'BEARER'),
(b'0', 206, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NzQyMTksImV4cCI6MTcxMjY3NTQxOX0.Ekslp-DA21UgbdaaYmX1m1aS28LG_mNQtoKfhbOqok0', 'BEARER'),
(b'0', 207, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2NzQzNDAsImV4cCI6MTcxMjY3NTU0MH0.djjQ0E9qqPPbl_qAYo_yQU-OsH7_Zqrg2gCf3J-6e-I', 'BEARER'),
(b'0', 208, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2Nzk2NTcsImV4cCI6MTcxMjY4MDg1N30.G1QIC4oelpjiqOc9QS2BYHRR3cD-qlC96Ez_FzQ4nj0', 'BEARER'),
(b'0', 252, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2OTMxNDUsImV4cCI6MTcxMjY5NDM0NX0.CyE1zjxM23UtowXPixb5WR0oICmttOm5h-Q5sxMuaQQ', 'BEARER'),
(b'0', 253, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2OTMyOTAsImV4cCI6MTcxMjY5NDQ5MH0.bNdT0MCQLMOhcTHJOUzI6eUEk4tUl9MrFRPw87zL_Mk', 'BEARER'),
(b'0', 254, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2OTM0MTUsImV4cCI6MTcxMjY5NDYxNX0.5u7BLJ0QZKnOfkz2mRL3p_TpHpETbKQcFZ6MB4ANOgg', 'BEARER'),
(b'0', 255, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2OTM3MDQsImV4cCI6MTcxMjY5NDkwNH0.pQuaqAYPU4UojmZu-_pcQrFAIN0iV2Z5mGyfBupbMq4', 'BEARER'),
(b'0', 256, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2OTU5MzQsImV4cCI6MTcxMjY5NzEzNH0.XNNmfKAvXKIc5rFLpp3cX4yqcUEQiZj2TgPKl14NOcw', 'BEARER'),
(b'0', 257, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI2OTU5NDAsImV4cCI6MTcxMjY5NzE0MH0.FmMEWLXzfyZ-cex-lHWoAVwmLCuUC8vGGdJLeJ3d9lk', 'BEARER'),
(b'0', 258, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI3MjY5MDYsImV4cCI6MTcxMjcyODEwNn0.1pGRzvGtsS-FVeEIgx8oRNp765wBEABLKJQhr7Dfd4Q', 'BEARER'),
(b'0', 260, b'0', 1, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiYWJ5c21pbGVfYWRtaW4iLCJpYXQiOjE3MTI3Mjc5ODgsImV4cCI6MTcxMjcyOTE4OH0.LIH6t21th4bcGUnTd7wprQcail3-f4ugKdmXlMI1lH8', 'BEARER');

-- --------------------------------------------------------

--
-- Table structure for table `token_seq`
--

CREATE TABLE `token_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `token_seq`
--

INSERT INTO `token_seq` (`next_val`) VALUES
(351);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` char(10) NOT NULL,
  `user_address` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_real_name` varchar(50) NOT NULL,
  `username` varchar(255) NOT NULL,
  `role` enum('ADM','PRD','PUD','IND') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `password`, `phone_number`, `user_address`, `user_email`, `user_real_name`, `username`, `role`) VALUES
(1, '$2a$10$ZgJXbFAveVG1eZr2JRjhG.ktjnmZn.eqKVLOO.Y5MKuCztPw8wu6u', '0999999999', 'babysmile_admin', 'babysmile_admin', 'babysmile_admin', 'babysmile_admin', 'ADM');

-- --------------------------------------------------------

--
-- Table structure for table `users_seq`
--

CREATE TABLE `users_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `vendor_id` char(10) NOT NULL,
  `vendor_tax_code` varchar(15) DEFAULT NULL,
  `vendor_name` varchar(50) NOT NULL,
  `vendor_address` varchar(255) NOT NULL,
  `vendor_email` varchar(255) NOT NULL,
  `vendor_phone` varchar(10) NOT NULL,
  `vendor_status` enum('ACTIVE','INACTIVE','INORDER') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`vendor_order_budget`, `vendor_id`, `vendor_tax_code`, `vendor_name`, `vendor_address`, `vendor_email`, `vendor_phone`, `vendor_status`) VALUES
(0, 'BC0001', 'gta123236d', 'ABCDE', '12 City Roadasd', 'cc@gmail.com', '099999668', 'INORDER'),
(0, 'CD0001', '1001011-3123', 'DD FACTORY', '121 Nguyen Binh Khiem', 'dd.corp@gmail.com', '0111111111', 'INORDER'),
(0, 'XYZ0001', '213012041', 'DE Company', '159 Dsadasd', 'sample@email.com', '099910232', 'INACTIVE'),
(0, 'YZ0012', 'asdasdasd', 'YZ FACTORY', 'km 9 Nguyen Trai', 'ntienthanhn@gmail.com', '0364829936', 'INACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_supplied_types`
--

CREATE TABLE `vendor_supplied_types` (
  `material_type_id` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `vendor_id` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_supplied_types`
--

INSERT INTO `vendor_supplied_types` (`material_type_id`, `id`, `vendor_id`) VALUES
(1, 1, 'BC0001'),
(2, 2, 'BC0001');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
