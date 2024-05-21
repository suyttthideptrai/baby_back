-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 21, 2024 at 08:32 PM
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
  `material_vendor_id` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hidden_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`material_id`, `material_name`, `material_price`, `material_quantity`, `material_unit_of_measure`, `material_warehouse_date`, `type_id`, `material_vendor_id`, `hidden_status`) VALUES
('1B0001', 'vat lieuasd', 300000, 200, 'pa', '2024-05-31', 2, 'EC0001', 0),
('1B0002', '1Pair Bicycle Brake Handle', 1200000, -1, 'a', '2024-05-21', 1, 'AC0001', 0),
('A10001', 'AA 1.2V x6 Battery Pack', 45000, 4, 'Pack', '2024-05-07', 3, 'EC0001', 0),
('AS0001', 'asdasd', 20000, 1, 'asdas', '2024-05-20', 1, 'AC0001', 0),
('AS0002', 'asdasd', 20000, 1, 'asdas', '2024-05-20', 1, 'AC0001', 0),
('CX0001', 'Cây xăng', 1200000, 6, 'cây', '2024-05-12', 2, 'AC0001', 0),
('GI0001', 'Giấy in A4 Double A', 50000, 90, 'Pack', '2024-05-07', 3, 'EC0001', 0);

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

--
-- Dumping data for table `material_exports`
--

INSERT INTO `material_exports` (`export_id`, `export_date`, `export_quantity`, `export_material_id`) VALUES
(1, '2024-05-11 17:54:28.000000', 1, 'A10001'),
(2, '2024-05-11 18:18:11.000000', 1, 'GI0001'),
(3, '2024-05-11 18:18:37.000000', 1, 'GI0001'),
(4, '2024-05-11 18:20:22.000000', 10, 'GI0001'),
(5, '2024-05-21 23:06:13.000000', 4, '1B0001'),
(6, '2024-05-21 23:06:13.000000', 2, 'A10001'),
(7, '2024-05-21 23:06:41.000000', 2, '1B0001'),
(8, '2024-05-21 23:06:41.000000', 2, 'A10001'),
(9, '2024-05-21 23:06:41.000000', 9, 'GI0001'),
(10, '2024-05-21 23:26:09.000000', 1, 'AS0001');

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
  `order_vendor_id` char(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hidden_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_approved_date`, `order_delivery_date`, `order_issued_date`, `order_status`, `order_title`, `order_total_price`, `order_user_id`, `order_vendor_id`, `hidden_status`) VALUES
('OD0001', NULL, '2024-05-16 07:00:00.000000', '2024-05-07 19:30:58.000000', 2, 'Order văn phòng phẩm tuần 3', 590000, 1, 'EC0001', 1),
('OD0002', NULL, '2024-05-23 07:00:00.000000', '2024-05-07 21:03:17.000000', 2, 'sample order hihi haha', 5000000, 1, 'EC0001', 1),
('OD0003', NULL, '2024-05-17 07:00:00.000000', '2024-05-08 11:04:11.000000', 2, 'Order 123', 345000, 1, 'EC0001', 1),
('OD0004', NULL, '2024-05-15 07:00:00.000000', '2024-05-12 18:28:51.000000', 0, 'Order 3 cây xăng cho nhân viên đổ free', 3600000, 1, 'AC0001', 1),
('OD0005', NULL, '2024-05-17 07:00:00.000000', '2024-05-13 22:43:02.000000', 1, 'sample order hihi haha', 41500000, 1, 'EC0001', 0),
('OD0006', NULL, '2024-05-24 07:00:00.000000', '2024-05-20 23:04:43.000000', 0, 'sample order hihi haha', 660000, 1, 'AC0001', 0),
('OD0007', NULL, '2024-05-29 07:00:00.000000', '2024-05-20 23:19:22.000000', 1, 'asdasd', 45900000, 1, 'EC0001', 0),
('OD0008', NULL, '2024-05-22 17:04:11.000000', '2024-05-20 23:42:21.000000', 1, 'asdasdasd', 2025000, 1, 'EC0001', 0),
('OD0009', NULL, '2024-05-25 07:00:00.000000', '2024-05-21 17:17:52.000000', 1, 'Order week 4', 223000000, 1, 'AC0001', 0),
('OD0010', NULL, '2024-05-25 07:00:00.000000', '2024-05-21 23:19:00.000000', 1, 'cay xangs', 24000000, 1, 'AC0001', 0),
('OD0011', NULL, '2024-05-23 07:00:00.000000', '2024-05-21 23:25:02.000000', 2, 'aaaa', 40000, 1, 'AC0001', 0);

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
(1, 2, 2, 45000, 2, 'A10001', 'OD0001'),
(2, 2, 10, 50000, 10, 'GI0001', 'OD0001'),
(3, 2, 100, 50000, 100, 'GI0001', 'OD0002'),
(9, 2, 1, 300000, 1, '1B0001', 'OD0003'),
(10, 2, 1, 45000, 1, 'A10001', 'OD0003'),
(11, 0, 0, 1200000, 3, 'CX0001', 'OD0004'),
(12, 2, 100, 300000, 100, '1B0001', 'OD0005'),
(13, 1, 1, 45000, 200, 'A10001', 'OD0005'),
(14, 1, 1, 50000, 50, 'GI0001', 'OD0005'),
(15, 0, 0, 20000, 22, 'AS0001', 'OD0006'),
(16, 0, 0, 20000, 11, 'AS0002', 'OD0006'),
(17, 2, 120, 300000, 120, '1B0001', 'OD0007'),
(18, 1, 2, 45000, 220, 'A10001', 'OD0007'),
(19, 2, 5, 45000, 5, 'A10001', 'OD0008'),
(20, 1, 3, 300000, 6, '1B0001', 'OD0008'),
(21, 0, 0, 20000, 11112, 'AS0001', 'OD0009'),
(22, 1, 1, 20000, 38, 'AS0002', 'OD0009'),
(23, 1, 6, 1200000, 20, 'CX0001', 'OD0010'),
(24, 2, 2, 20000, 2, 'AS0001', 'OD0011');

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `receipt_id` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `receipt_creator_id` int(10) NOT NULL,
  `receipt_order_id` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hidden_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `receipts`
--

INSERT INTO `receipts` (`receipt_id`, `created_at`, `receipt_creator_id`, `receipt_order_id`, `hidden_status`) VALUES
('GR0001', '2024-05-10 17:41:37', 1, 'OD0001', 1),
('GR0002', '2024-05-11 10:42:51', 1, 'OD0002', 1),
('GR0003', '2024-05-11 10:43:11', 1, 'OD0002', 1),
('GR0005', '2024-05-11 15:28:52', 1, 'OD0002', 1),
('GR0007', '2024-05-13 22:22:46', 1, 'OD0003', 1),
('GR0008', '2024-05-13 22:43:22', 1, 'OD0005', 1),
('GR0009', '2024-05-20 21:03:15', 1, 'OD0005', 0),
('GR0010', '2024-05-20 23:20:29', 1, 'OD0007', 0),
('GR0011', '2024-05-20 23:21:02', 1, 'OD0007', 0),
('GR0012', '2024-05-21 00:17:31', 1, 'OD0008', 0),
('GR0013', '2024-05-21 00:18:13', 1, 'OD0008', 0),
('GR0014', '2024-05-21 00:19:45', 1, 'OD0008', 0),
('GR0015', '2024-05-21 16:49:24', 1, 'OD0008', 0),
('GR0016', '2024-05-21 17:18:05', 1, 'OD0009', 0),
('GR0017', '2024-05-21 23:20:19', 1, 'OD0010', 0),
('GR0018', '2024-05-21 23:25:29', 1, 'OD0011', 0);

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

--
-- Dumping data for table `receipt_items`
--

INSERT INTO `receipt_items` (`receipt_item_id`, `receipt_item_quantity`, `order_material_id`, `receipt_id`) VALUES
(1, 1, 1, 'GR0001'),
(2, 1, 2, 'GR0001'),
(3, 10, 3, 'GR0002'),
(4, 10, 3, 'GR0003'),
(7, 80, 3, 'GR0005'),
(10, 0, 9, 'GR0007'),
(11, 1, 10, 'GR0007'),
(12, 10, 12, 'GR0008'),
(13, 0, 13, 'GR0008'),
(14, 0, 14, 'GR0008'),
(15, 90, 12, 'GR0009'),
(16, 1, 13, 'GR0009'),
(17, 1, 14, 'GR0009'),
(18, 5, 17, 'GR0010'),
(19, 1, 18, 'GR0010'),
(20, 115, 17, 'GR0011'),
(21, 1, 18, 'GR0011'),
(22, 1, 19, 'GR0012'),
(23, 0, 20, 'GR0012'),
(24, 3, 19, 'GR0013'),
(25, 1, 20, 'GR0013'),
(26, 1, 19, 'GR0014'),
(27, 1, 20, 'GR0014'),
(28, 1, 20, 'GR0015'),
(29, 1, 22, 'GR0016'),
(30, 6, 23, 'GR0017'),
(31, 2, 24, 'GR0018');

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
(160, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTE0NjAyMiwiZXhwIjoxNzE1MjMyNDIyfQ.XUHAYGl6PHTHnK-1QaoRgZBQ7GZZ5Fy28zHR-NOFkh8', 'BEARER', 1),
(202, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTIyMTk3MSwiZXhwIjoxNzE1MzA4MzcxfQ.SBU1VKGbRph8E_wsLRGZ7GS_kFZ4XW0tCA6Z-3NTNsk', 'BEARER', 1),
(203, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTIyMjY1NiwiZXhwIjoxNzE1MzA5MDU2fQ.WvR1dycgehFSBd2PKlbxrw-SGBot7nvmQN2b_JAUskw', 'BEARER', 1),
(204, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTIyMjcxNCwiZXhwIjoxNzE1MzA5MTE0fQ.yJDR5TgX6GIqReikR-GIAj1sDP0y9F_y3NDcR3Iu-zU', 'BEARER', 1),
(205, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTIyMzc1NCwiZXhwIjoxNzE1MzEwMTU0fQ.VFTSRhAWfVs3OcKctInvLKIvXR6YdS6kppkQIEF99fk', 'BEARER', 1),
(206, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTIyMzk0MiwiZXhwIjoxNzE1MzEwMzQyfQ.W6B7FqB6IUrrxZdX9G7EJOdIDFhekPzGl2aDox58HGk', 'BEARER', 1),
(207, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTIzMjQ4MywiZXhwIjoxNzE1MzE4ODgzfQ.E-dTbI_Uh_5BlZozRZnWuREBQ93uuXtB2UET2T_UWjM', 'BEARER', 1),
(208, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTIzNzkxNSwiZXhwIjoxNzE1MzI0MzE1fQ.GbTxrVdHC8ASGTZVJIBRF_FqOSowt1Ki4QVLHZmOIDo', 'BEARER', 1),
(209, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTIzNzk5MywiZXhwIjoxNzE1MzI0MzkzfQ.4miNUQQzo5rMSoO1abxMHUxCc36w2hdOfi3Ike-Sk54', 'BEARER', 1),
(210, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTIzODYyNSwiZXhwIjoxNzE1MzI1MDI1fQ.ZMlXgZPDZR7Opuohfpci7bx33ZSS1pADi8BUo2oUXZo', 'BEARER', 1),
(211, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTIzODcyNiwiZXhwIjoxNzE1MzI1MTI2fQ.k1Xp7lqo47oYufBldXtywtx1tj3Ge37u5XXfzf7WPjA', 'BEARER', 1),
(252, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTMzNDY0MywiZXhwIjoxNzE1NDIxMDQzfQ.ZwJFmNy9xhYPV03-vUhac_OU-BOHzu7hbV59ttrdcd0', 'BEARER', 1),
(253, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTMzNjUyNywiZXhwIjoxNzE1NDIyOTI3fQ.rbt4gZaj179Zs5anwzdluAeEeTs1LlUjGshTS_nUGWE', 'BEARER', 1),
(254, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTMzNjkxNCwiZXhwIjoxNzE1NDIzMzE0fQ.O4au8l5FTZhzOQvwl-bYgwm5MAag1iRmbYd4YrfNXzs', 'BEARER', 1),
(255, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTMzOTY2MiwiZXhwIjoxNzE1NDI2MDYyfQ.NPhdi3QIkGQE-rNm3UVNk5AUDziRNKSyHC9M8QjijWM', 'BEARER', 1),
(256, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTMzOTcwOCwiZXhwIjoxNzE1NDI2MTA4fQ.OpDGnwmAx7Pu87_LlafTJ-GJe8PdvnbsHYJPoNSASB8', 'BEARER', 1),
(257, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTMzOTczMiwiZXhwIjoxNzE1NDI2MTMyfQ.VRy3rra_y3-AWyh7FHMsbgT9gKKYlMg4XsCsCXo4sCk', 'BEARER', 1),
(258, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTMzOTc2MSwiZXhwIjoxNzE1NDI2MTYxfQ.pYqJrHP0SKZU85vgvGY4Q4t9RjSyNBy5VfAVVWJV_xU', 'BEARER', 1),
(259, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTM0MzIzMCwiZXhwIjoxNzE1NDI5NjMwfQ.ew3j5MA6p4gr4ByEQb-JkZ4xZ2fOlBV2QqCkkchMeX8', 'BEARER', 1),
(302, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTM5ODk1MCwiZXhwIjoxNzE1NDg1MzUwfQ.oU0CynnUVJwnf67UsFZ9BW7o5tk-iIYhluf_kPmvupU', 'BEARER', 1),
(303, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQwMDQyNywiZXhwIjoxNzE1NDg2ODI3fQ.e9_WrWRFHKpQG_pT8fHnOh1SqcPo9dWigsq_PqTUSSY', 'BEARER', 1),
(304, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQwMjMwMywiZXhwIjoxNzE1NDg4NzAzfQ.U4WyRyKiRMyQKgQYur0MWCwcK0KGTue0oZ4xER1dpTk', 'BEARER', 1),
(305, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQxMzk2NSwiZXhwIjoxNzE1NTAwMzY1fQ.Uo-P4kvXU33UqHeUJt0aopf5ROPTjYm4XZ-KpRigew0', 'BEARER', 1),
(306, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQxNDAzNiwiZXhwIjoxNzE1NTAwNDM2fQ.-MVVpm6uKrcxsQp87ZkDH8y0xt_ec8OZ72qP8E0uz1U', 'BEARER', 1),
(307, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQxNDA3MCwiZXhwIjoxNzE1NTAwNDcwfQ.49eUydrGeIpokaz7mUpJf-HBMZEvaxhfnNV7J3ekwFI', 'BEARER', 1),
(308, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQxNDExNSwiZXhwIjoxNzE1NTAwNTE1fQ.b4AXl1DhyRS3jStCUnHBoJtxnJ94ratQ8R608VVTX0U', 'BEARER', 1),
(352, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQxNDc1MywiZXhwIjoxNzE1NTAxMTUzfQ.zrjGJ5CsbbOU3yAJg44MQEHIZD_2bcK7dpY0By3PtDw', 'BEARER', 1),
(402, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQxNTA5NywiZXhwIjoxNzE1NTAxNDk3fQ.lfTxPrUl36t7egf5217X6KKUl_eC8yGis2EiRB2yYnE', 'BEARER', 1),
(403, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQxNTI4NiwiZXhwIjoxNzE1NTAxNjg2fQ.IRc9C1VGE0sLT7KIBcmqlVhwh3rnVc3ZWdFc6fcl5zk', 'BEARER', 1),
(404, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQxNTM3MSwiZXhwIjoxNzE1NTAxNzcxfQ.t_bZFPHEuTSTCO06pj6l_jvyx9DiYu0k8dzlwTY2pOQ', 'BEARER', 1),
(405, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQxNTQwOCwiZXhwIjoxNzE1NTAxODA4fQ.E0nPZqAVCwxyXVhA5QFaJ34b0IaVCxDqImAryiFpi00', 'BEARER', 1),
(406, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQxNjE2MiwiZXhwIjoxNzE1NTAyNTYyfQ.454YvWL3D-x01R8QlcKh6NA8pGvB6ytMKKPvmW1EnDg', 'BEARER', 1),
(407, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQxNjg2MSwiZXhwIjoxNzE1NTAzMjYxfQ.ygBvevT5RKxRwdIEjYkHCfCIb0Vu7C5D5u7evtH3n0k', 'BEARER', 1),
(408, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQxNzU4NiwiZXhwIjoxNzE1NTAzOTg2fQ.MxIYkvaQgABSBKX6ly9oKyIL8__cdnZmgZ4Tnhm9Ykg', 'BEARER', 1),
(409, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQxNzU5MiwiZXhwIjoxNzE1NTAzOTkyfQ.3-5hbsteN8s4XScqw_Bi7VewfeM8WHWR-uf9UM_C-Qg', 'BEARER', 1),
(410, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQxNzYwMywiZXhwIjoxNzE1NTA0MDAzfQ.M_DdGvsI4vq4mrVoOA7JVHJxuwAvyqP3Jrk-0bPA2wo', 'BEARER', 1),
(452, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQyMjgxMiwiZXhwIjoxNzE1NTA5MjEyfQ.5j0i__kMIzoBZt8QGwonb69HEMGXGQQ-jXf27oXHtNE', 'BEARER', 1),
(502, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQyNjc2NywiZXhwIjoxNzE1NTEzMTY3fQ.fe7Glvev7M9PGqnfwKkTIDoZhDYrkAYnbMXYclMew9g', 'BEARER', 1),
(552, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQ5MDAxOCwiZXhwIjoxNzE1NTc2NDE4fQ.cQfAiGs5qyJn_aDz_P42b2Ohei1HXeALEz0hrVdKdkE', 'BEARER', 1),
(553, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQ5MDM0MSwiZXhwIjoxNzE1NTc2NzQxfQ.zgvKFUsbbmg2bfLx4RXP6xeAuhVJgZHY0p-sXP9OJU4', 'BEARER', 1),
(554, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQ5MTM5MywiZXhwIjoxNzE1NTc3NzkzfQ.MOjygH7vEpuhbb4ioWe3QvvBu0KWfRKSHAlfIUh0kxo', 'BEARER', 1),
(555, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQ5MjEwNiwiZXhwIjoxNzE1NTc4NTA2fQ.IRmCI5Gxyt_ZTOpOig9CQ8IH6_hItWZJSqf32TllZ4U', 'BEARER', 1),
(556, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQ5MjI1MCwiZXhwIjoxNzE1NTc4NjUwfQ.BNl58GdTfp-C-dSth8lygjodI7WikH8c2gzuo4UJetw', 'BEARER', 1),
(557, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQ5MjI4NywiZXhwIjoxNzE1NTc4Njg3fQ.6fy43M33QRCMPmcureMGQCAmM1n_hVdZSwenkhlVWeA', 'BEARER', 1),
(558, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQ5MjM4MywiZXhwIjoxNzE1NTc4NzgzfQ.DAGznS02bf1p_EZYF0MYan5Swr0Zz5XwEg65EkZW6pI', 'BEARER', 1),
(559, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTQ5MjUzNSwiZXhwIjoxNzE1NTc4OTM1fQ.TR8ZO9aRhWsXA_CyXF7dcI2TWl22sGeATDQ69A5mNXg', 'BEARER', 1),
(560, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUwMDMwOSwiZXhwIjoxNzE1NTg2NzA5fQ.N2NW3XDgRvkMLkfe5pfJc6Eg7xLCN7gffPQGKR1O9eA', 'BEARER', 1),
(561, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUwMjQ0MCwiZXhwIjoxNzE1NTg4ODQwfQ.Mai6dt4J-dsxJ0uVQGHCtx2DaQ-eapbS5vK9K-uEOwk', 'BEARER', 1),
(562, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUwMzMwNSwiZXhwIjoxNzE1NTg5NzA1fQ.EfCGNkJD5pZO9il8WfhnCaqOa9syJPC7MfItbWhHY9g', 'BEARER', 1),
(563, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUwMzcxMCwiZXhwIjoxNzE1NTkwMTEwfQ.pvoiUdd7Fya3epnW7Sk3hVdQwzDLf9xwozHo1p2i0-g', 'BEARER', 1),
(564, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUwMzkwMCwiZXhwIjoxNzE1NTkwMzAwfQ.uwx1THrRqnFFNimRytiaB5ne6YHECdlNrK2zyrq7D64', 'BEARER', 1),
(565, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUwNDY0NiwiZXhwIjoxNzE1NTkxMDQ2fQ.ebzy7zrG56_QdauO-MhbgyycKYItOsXPe0ei7BRE3Y0', 'BEARER', 1),
(566, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUwNTI3OSwiZXhwIjoxNzE1NTkxNjc5fQ.-b0xbHmbeVNnXPqjyYKNRxHnJx8m8bWkgb2cACcdYCU', 'BEARER', 1),
(567, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUwNTMwMCwiZXhwIjoxNzE1NTkxNzAwfQ.izf0hcs3ijocRdUZfWzRjcpvAo9l65ARKaVpFWteq6g', 'BEARER', 1),
(568, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUwNTQ2MCwiZXhwIjoxNzE1NTkxODYwfQ.GDSgUcGVlnl6V6rztfnDSPEfDijtectw41xrPtCvQaE', 'BEARER', 1),
(569, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUwNTQ5MiwiZXhwIjoxNzE1NTkxODkyfQ.P03oDO5bPO81gRkmpAjCetJopqLw-Fyxeiyq-K51ZVg', 'BEARER', 1),
(570, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUwNTUxMiwiZXhwIjoxNzE1NTkxOTEyfQ.229gJ2U2YjmubvtaIeTsdHJhLvm5WojaFCh8J5_EiEo', 'BEARER', 1),
(571, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUwNjA2MiwiZXhwIjoxNzE1NTkyNDYyfQ.o4MGr6V-vn-53Lm0eCv4aFDeBH1XyvOIylslnXT6Xns', 'BEARER', 1),
(572, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUwNjA3NSwiZXhwIjoxNzE1NTkyNDc1fQ.TYWkD-jg3Cy00jpAR1t47c6_9m1q0UHNj-i3OfNsbws', 'BEARER', 1),
(573, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUwNjE5NywiZXhwIjoxNzE1NTkyNTk3fQ.kzO2DPFJ4cre9vTRCKs8Mke83nMggeP_49CMNBeuDII', 'BEARER', 1),
(574, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUwNjQxMCwiZXhwIjoxNzE1NTkyODEwfQ.pTBCaNswhtYUVbkH-L0Q80UcGWLm_4Mn1zXWpH0ocRs', 'BEARER', 1),
(575, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUwNjY5MCwiZXhwIjoxNzE1NTkzMDkwfQ.k0qfNToSacT32Gm4CWd-joFxL0hlbnUVbAy68dl1bbk', 'BEARER', 1),
(576, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUwODA4NSwiZXhwIjoxNzE1NTk0NDg1fQ.Xptqvvo6eXWPVLMSYzmxOPgai9JBLj8fqsczDOBJfdo', 'BEARER', 1),
(577, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUwODEwNSwiZXhwIjoxNzE1NTk0NTA1fQ.A-9q7wtlFRvBxJQnRfVziaJokmQI13Wd7M37ys2Mz-E', 'BEARER', 1),
(578, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUwOTY4MywiZXhwIjoxNzE1NTk2MDgzfQ.ytfsWNE3qR77iNPVLS8f3wCurTnmYFzOp3D4lqPMRB8', 'BEARER', 1),
(579, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxMDQ3MiwiZXhwIjoxNzE1NTk2ODcyfQ.GQ1GaBIjQ_onZB_G48IA5NYaQvrLMugdDMMy5cNaT_0', 'BEARER', 1),
(580, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxMDUyOCwiZXhwIjoxNzE1NTk2OTI4fQ.zIb8dL2NmZbCof_qYEnX-5DB7WdgDHoaxSoHq6NWJv4', 'BEARER', 1),
(581, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxMDcyMiwiZXhwIjoxNzE1NTk3MTIyfQ.xKbdCRkMiAC31ylBqz2-qDEJ-lhJfqAQ0n6t4__QIW4', 'BEARER', 1),
(582, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxMDkwOSwiZXhwIjoxNzE1NTk3MzA5fQ.3AOfOVWweZHh37wqxiIK8TisUBiaBHt7MojDyUiIsx8', 'BEARER', 1),
(583, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxMTE3MywiZXhwIjoxNzE1NTk3NTczfQ.Tgx3GWeiSaSGU-wp9vbDOu6WWQDyBP2RBrWAmilJLAQ', 'BEARER', 1),
(584, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxMTM2MCwiZXhwIjoxNzE1NTk3NzYwfQ._2Os6HSibV-qaUuBMyR3nII1wuyzbonWCA-EgtR1os4', 'BEARER', 1),
(585, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxMjIzMywiZXhwIjoxNzE1NTk4NjMzfQ.T45xoEyiFeMNSWsfK40SsfeEIJZqEK9D3cL7LaQ1srI', 'BEARER', 1),
(586, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxMjI0NSwiZXhwIjoxNzE1NTk4NjQ1fQ.B63N4SO5h07ljt6-SXY9R47vmDFB4MOPg44UCL-KAYY', 'BEARER', 1),
(587, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxMjMyNywiZXhwIjoxNzE1NTk4NzI3fQ.UnowbJ_ShuCXw8952QErnxU-jS2Y8TdsO29ka84iWsQ', 'BEARER', 1),
(588, b'1', b'1', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxMjQ5OSwiZXhwIjoxNzE1NTk4ODk5fQ.H4XuDUnGOUd7vlDi36zqszK1XHQ0CkrM8ajcPZ3wWSU', 'BEARER', 1),
(589, b'1', b'1', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxMjU1MiwiZXhwIjoxNzE1NTk4OTUyfQ.NmTxqCHEPjqCu9ueCvuXnm4V6O3e2SZ3llDWTBllpbA', 'BEARER', 1),
(590, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxMjc5NCwiZXhwIjoxNzE1NTk5MTk0fQ.cokF7W0aRmLbhRo2a6PTxi21aDCwpMAsPN91JGwAwXg', 'BEARER', 1),
(591, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxMjkwMywiZXhwIjoxNzE1NTk5MzAzfQ.oZ-K239GlZwtNVHrJASZ95z8JSDefYiUd5hYYTZtkaE', 'BEARER', 1),
(592, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxMjkzNSwiZXhwIjoxNzE1NTk5MzM1fQ.0uacGm-ZetWuK-lR70HRw6G19VnEDFqzuq8GophbqcE', 'BEARER', 1),
(593, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxMjk5MCwiZXhwIjoxNzE1NTk5MzkwfQ.J16zNZcQk0RxQR9DUdHmkUw2nSPDpCOvG9SIxDDkkns', 'BEARER', 1),
(594, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxMzAyNywiZXhwIjoxNzE1NTk5NDI3fQ.uTAlrNJAGXKQ6gpfeunJxiOCjjGxVv12IKtxw-6_PJk', 'BEARER', 1),
(595, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxMzA5MywiZXhwIjoxNzE1NTk5NDkzfQ.yht4jSug_aZgBgTfH1Z_iENWbYJVi1LAVAv1bo4RgjQ', 'BEARER', 1),
(596, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxNDY5NywiZXhwIjoxNzE1NjAxMDk3fQ.NT6XelRozFd49x_4wjWs3Ikumk4u7PQsuOEiNcNG8Ok', 'BEARER', 1),
(597, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxNjg3MywiZXhwIjoxNzE1NjAzMjczfQ.FsF1sphZqLK6DQxUghX5PkUtDTMPY-TyfqGVWCPw6P8', 'BEARER', 1),
(598, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUxNjg4MCwiZXhwIjoxNzE1NjAzMjgwfQ.h3BifpveuFDV59w3CMmeNxQeuUs7S2Xzpd8UCSNFUYY', 'BEARER', 1),
(602, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUyMzY5NywiZXhwIjoxNzE1NjEwMDk3fQ.xfNTpwbSokuSLO89cfFjv-RZS_uTOCkruadgN75hRsg', 'BEARER', 1),
(603, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTUyMzgwNiwiZXhwIjoxNzE1NjEwMjA2fQ.BYp-B9TlsBNBk0WmqplHdRnihBCx2kNyKA4AXxZCCoU', 'BEARER', 1),
(652, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiSU5EIl0sInN1YiI6ImJhYnlzbWlsZV9pbmQiLCJpYXQiOjE3MTU2MTIxNjEsImV4cCI6MTcxNTY5ODU2MX0.oohcJbqY5xHaoi-U3KEpKnVsmledfCvNH0yBQLBzbBA', 'BEARER', 2),
(653, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiUFVEIl0sInN1YiI6ImJhYnlzbWlsZV9wdWQiLCJpYXQiOjE3MTU2MTIyMDYsImV4cCI6MTcxNTY5ODYwNn0._krN0GLdKHBnENc_5uIvc-TnA5qW-Jze5qpXUPUp3kw', 'BEARER', 3),
(654, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTYxMjIzOCwiZXhwIjoxNzE1Njk4NjM4fQ.2j7YLl1eqSlvE4vtsQo3Z4aHy8d5A6VB4G2nqxYgzW4', 'BEARER', 1),
(655, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiSU5EIl0sInN1YiI6ImJhYnlzbWlsZV9pbmQiLCJpYXQiOjE3MTU2MTIyNTMsImV4cCI6MTcxNTY5ODY1M30.jbsj3JSFQns8QM8qJ6uigL2n-9leJBmun5R0dsMrH3w', 'BEARER', 2),
(656, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiUFVEIl0sInN1YiI6ImJhYnlzbWlsZV9wdWQiLCJpYXQiOjE3MTU2MTIzMDksImV4cCI6MTcxNTY5ODcwOX0.Di8qR9tQTWCNXT0lVmVN232g6LXdD1HpdWMga1E1K0w', 'BEARER', 3),
(657, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTYxMjYyNCwiZXhwIjoxNzE1Njk5MDI0fQ.7Hl6mltK5qBw5iq3lF5S4NYMQbVYnRzzbFDV1D-cYOI', 'BEARER', 1),
(658, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiSU5EIl0sInN1YiI6ImJhYnlzbWlsZV9pbmQiLCJpYXQiOjE3MTU2MTMxOTAsImV4cCI6MTcxNTY5OTU5MH0.2ZCvY8kB7rIx-ZZEKqBSb3GTP_BvDWdNIFWp8ZXtLpY', 'BEARER', 2),
(659, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTYxMzMwNSwiZXhwIjoxNzE1Njk5NzA1fQ.encqrdiiMCkDBiC2jtybg7yAYTFUgu7ZzpS8gHbhdxw', 'BEARER', 1),
(660, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiSU5EIl0sInN1YiI6ImJhYnlzbWlsZV9pbmQiLCJpYXQiOjE3MTU2MTQyNzksImV4cCI6MTcxNTcwMDY3OX0.KOtLramWu6ItIrRcDJ-LcIhcQOgVToK5b0_NZfQBcp0', 'BEARER', 2),
(661, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTYxNDUwMiwiZXhwIjoxNzE1NzAwOTAyfQ.rfSZYbNXfxX37Yn8BDtSx9rpyWDNMMDL_ytT7P9pICo', 'BEARER', 1),
(662, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTYxNTI1MCwiZXhwIjoxNzE1NzAxNjUwfQ.iWg_ukezV6X7xjqSmhcToc_CmkT8m4SQNxX8Puj7R4Q', 'BEARER', 1),
(663, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTYxNjg2MywiZXhwIjoxNzE1NzAzMjYzfQ.DeehaPchPZWtT7BRhw8mmCK7au3nVJCL-EqltAoelgs', 'BEARER', 1),
(702, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTc3ODQ1MCwiZXhwIjoxNzE1ODY0ODUwfQ.XX1YvktbL7x15V2ulTY-GoekXijMGeiT4OXmAuQIREU', 'BEARER', 1),
(703, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTc3OTYxMiwiZXhwIjoxNzE1ODY2MDEyfQ.I2JdAJbHaSYBbWSjtM7Uvssv4xyXUBniNUBlIRGHCfY', 'BEARER', 1),
(704, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTc4MTQ3MSwiZXhwIjoxNzE1ODY3ODcxfQ.Uz3vpufOVnV-hlVdIVJKhmuKp7i0r9NY6pG3PPZrNJc', 'BEARER', 1),
(705, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTc4MTcyNywiZXhwIjoxNzE1ODY4MTI3fQ.KKjotMA0FkR3_vBszBse54nZjmLjecGF2WHpt_r7f4M', 'BEARER', 1),
(706, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTc4MjUzOSwiZXhwIjoxNzE1ODY4OTM5fQ.ExDE9xuJtQIlSVPQtHJeSi6-CtD5OMpyyF0CUVNdn8A', 'BEARER', 1),
(707, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTc4MzkyOCwiZXhwIjoxNzE1ODcwMzI4fQ.hYfIU_KB845a9lVJ8hy49ulbFJu1krLVrP1DZv8FkYo', 'BEARER', 1),
(708, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTc4Mzk2NCwiZXhwIjoxNzE1ODcwMzY0fQ.dhnFc6YIjelv2h2St-rMJcC1jnJWmHcKgOdp6CulIws', 'BEARER', 1),
(709, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTc4NDQ4OSwiZXhwIjoxNzE1ODcwODg5fQ.ih4EONjOr1dFWYQZrM3JPzE2OIpEg3OOaehye6gJvtw', 'BEARER', 1),
(710, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTc4NDY1NiwiZXhwIjoxNzE1ODcxMDU2fQ.8t6vY-F5KCWOPUjDCkm6t7kWrjrgWPXi-yyGY4U284M', 'BEARER', 1),
(711, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTc4NDcyOCwiZXhwIjoxNzE1ODcxMTI4fQ.TqyqOATujGFU0up838ytkhYzc7aZXJbIQLrfPFOApA0', 'BEARER', 1),
(712, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTc4NTc0NCwiZXhwIjoxNzE1ODcyMTQ0fQ.6A7XiVbmG9iqbni8RgLV0Sq2pLp8NVMoC-CYHQNBE9Q', 'BEARER', 1),
(713, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTc4OTUzNSwiZXhwIjoxNzE1ODc1OTM1fQ.AdtAKBx5eInNms9-UJJRoFoB6wPNWKHo1B1gDoi0v6Q', 'BEARER', 1),
(752, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTk1ODM3NywiZXhwIjoxNzE2MDQ0Nzc3fQ.X-WcDBdzCtqne3RyB_DMGQez2uDmzPl5jOtrQOM4Sdg', 'BEARER', 1),
(753, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNTk1ODQxMCwiZXhwIjoxNzE2MDQ0ODEwfQ.5m0hTQsSwq1RIyOc6wC5Imr97QCPkYFy2dNlecCaCAo', 'BEARER', 1),
(802, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjEwMTE3MCwiZXhwIjoxNzE2MTg3NTcwfQ.zChyzrk0BV96nOfNIFb0lpdwdfhRXyR7mXRJs9_SZfQ', 'BEARER', 1),
(803, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjEwMjM4MywiZXhwIjoxNzE2MTg4NzgzfQ.SBaSASf9oyT5SNoHfpk_xnCveJrKdSOfs8XLX4m4_Ks', 'BEARER', 1),
(852, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjIwOTAzMCwiZXhwIjoxNzE2Mjk1NDMwfQ.8VgVytxElLqnIiMpknPv1dVqcj8f22V0E-jyUBRY8fM', 'BEARER', 1),
(853, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjIxMTQ1NywiZXhwIjoxNzE2Mjk3ODU3fQ.O2wYIGdQUuG0hI-z3gCBsC5A3-2DuwIs5PeTHusrokI', 'BEARER', 1),
(854, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjIxMjg2NCwiZXhwIjoxNzE2Mjk5MjY0fQ.5pGGuSdVzNXXkZUfoQfMbzrg6U1IKYlMs13fK3n0y0g', 'BEARER', 1),
(855, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjIxNTM1NiwiZXhwIjoxNzE2MzAxNzU2fQ.LNAeBxmjUuFiJE7xkdXqb8WbZTk38HHo5Tb4Ye0OS6k', 'BEARER', 1),
(856, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjIyMjc1MywiZXhwIjoxNzE2MzA5MTUzfQ.gwkaC9Tp0yxa8dgTyu9h9uLfzFUJsfB4teimFUTewyo', 'BEARER', 1),
(857, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjIyNDczMCwiZXhwIjoxNzE2MzExMTMwfQ.hFVp_aTXtGcAP1z333PkWT9KSQX6lU3Mqqqj-CsE_IM', 'BEARER', 1),
(858, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjIyNjU1OSwiZXhwIjoxNzE2MzEyOTU5fQ.FXIhwQOux9MG4G66LIjV5FDw4yXU6wFCclZ4zjaRHFM', 'BEARER', 1),
(902, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjI3OTk1OCwiZXhwIjoxNzE2MzY2MzU4fQ.WPgUKhx0NWrb2fyz27ZdUc7Qg30CjLKexWuK5QvHfR0', 'BEARER', 1),
(952, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjI4MTIxMCwiZXhwIjoxNzE2MzY3NjEwfQ.112SOxhdc-2DUvuWFWQOnEziodCFN92DVleOUByMNYw', 'BEARER', 1),
(1002, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjI4MTUyMSwiZXhwIjoxNzE2MzY3OTIxfQ.u-xGl9IV_rYuFgOytattECCFQcF-IQWvS5BeKhvV4m4', 'BEARER', 1),
(1052, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjI4MjI5MiwiZXhwIjoxNzE2MzY4NjkyfQ.BvR1P6sI7Yf8ZiBFuDkZ7Jw0h64gw7bgKfKJzgiIRqw', 'BEARER', 1),
(1053, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjI4Mzk0NywiZXhwIjoxNzE2MzcwMzQ3fQ.hkXOxET5i0UivAGHER7fdpt3SVf3r8Phvr9oB7P_v6k', 'BEARER', 1),
(1054, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjI4NDczMiwiZXhwIjoxNzE2MzcxMTMyfQ.cfcePzSBLIMUEU33clHjNks0Bu9StuH_xcqE3JlGdmk', 'BEARER', 1),
(1055, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjI4NTU5MiwiZXhwIjoxNzE2MzcxOTkyfQ.mwmsqPdjYYYneSbKuEQ5dJHGO4PhPgLNLGEH5R88YKQ', 'BEARER', 1),
(1056, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjI4NTg2NywiZXhwIjoxNzE2MzcyMjY3fQ.ZWdrLHxFPkxgBdytzlBarRQOIfHzeN_DtP3Zucl-zHE', 'BEARER', 1),
(1057, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjMwMDA4MSwiZXhwIjoxNzE2Mzg2NDgxfQ.HwMQmdhFByfc-P_pnXqzIxGK_F1U0dmrI9M8wFQ3BDk', 'BEARER', 1),
(1102, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjMwMzkyNiwiZXhwIjoxNzE2MzkwMzI2fQ.WHNa6CkeAVrJkH4zjPlM4jbznJ4c4sK4wCMq2JgS9KA', 'BEARER', 1),
(1103, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjMwNDI0OCwiZXhwIjoxNzE2MzkwNjQ4fQ.fGIDP2f01hC8pdenANX_1J0Sz57CZJf_Liti0UgrIqQ', 'BEARER', 1),
(1104, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjMwNDI5NSwiZXhwIjoxNzE2MzkwNjk1fQ.YqT-RLLhP54F6-FAsKCI0OkbwOFPFx4Z_UAMZuv7xd4', 'BEARER', 1),
(1105, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjMwNDQzOSwiZXhwIjoxNzE2MzkwODM5fQ.oKVMQoRlX4TnHGn7I4wCQQfjnnhxQW0WmDhAFRbwDi8', 'BEARER', 1),
(1152, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjMwNzc4NCwiZXhwIjoxNzE2Mzk0MTg0fQ.o6b6BoReo678p6kWhuCITNd3wpf3bC_Jykf4trR3-R4', 'BEARER', 1),
(1153, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjMwODQxMCwiZXhwIjoxNzE2Mzk0ODEwfQ.PAeQ9hEk45cdZmOc0xFiUBJ34S2aeTC7XXpjXk6N-5A', 'BEARER', 1),
(1154, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjMxMDE5MSwiZXhwIjoxNzE2Mzk2NTkxfQ.3Fbt0oPbBnpE4aMEEIhIQbaMOJeez7AXQyZIE7vqV4o', 'BEARER', 1),
(1202, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjMxODU0NywiZXhwIjoxNzE2NDA0OTQ3fQ.z6Q3-MoUujDjsgKgDrWOlG9LmIK67JM29359i_5WoqI', 'BEARER', 1),
(1252, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjMxOTMwOCwiZXhwIjoxNzE2NDA1NzA4fQ.cv6v6RyUJfzPWErPQ3EJpAUhRDVRb5BB6zn4DrhgjCw', 'BEARER', 1),
(1302, b'0', b'0', 'eyJhbGciOiJIUzI1NiJ9.eyJyb2wiOlsiQURNIl0sInN1YiI6ImJhYnlzbWlsZV9hZG1pbiIsImlhdCI6MTcxNjMyMjUzNywiZXhwIjoxNzE2NDA4OTM3fQ.qQa0MskVfhyIvoI_ZMVynCHOXyPCjdmDejrIISRfIKY', 'BEARER', 1);

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
(1401);

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
(1, '$2a$10$EPEHqHsDl361tjhDcL8Xju/DVEH6uILsQrsau3cXK50K9XO8ZJbGO', '0999999999', 'ADM', 'babysmile_admin', 'babysmile_admin', 'babysmile_admin', 'babysmile_admin'),
(2, '$2a$10$GrQnAPmsMQXpOMm1WvSkD.16wRecMulvcZSomjyYKXpjriByrON6O', '0999999999', 'IND', 'babysmile_ind', 'babysmile_ind', 'babysmile_ind', 'babysmile_ind'),
(3, '$2a$10$g7yUzrEtBjejtXrgIEGC1OEL4XjVbb4Es5vMLVlK/WYGT8n/JHGFi', '0999999999', 'PUD', 'babysmile_pud', 'babysmile_pud', 'babysmile_pud', 'babysmile_pud');

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
(101);

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
  `vendor_status` tinyint(4) NOT NULL,
  `vendor_tax_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hidden_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`vendor_id`, `vendor_address`, `vendor_email`, `vendor_name`, `vendor_order_budget`, `vendor_phone`, `vendor_status`, `vendor_tax_code`, `hidden_status`) VALUES
('AC0001', '159 Đỗ Ngọc Dua', 'asdfasjf@kaf.comasd', 'asdasd', 0, '0364829936', 2, '4568155465sa', 0),
('AC0002', '159 Đỗ Ngọc Duasd', 'sample@email.casom', 'ABC comp1', 0, '999102322', 2, '4568155465asd', 0),
('DC0001', 'asd01234ksad', 'sample@email.casom', 'DE Company', 0, '023141243', 1, '4568155465asd', 0),
('EC0001', '159 Nguyễn Trãi', 'sample@email.com', 'EVEREADY CO', 0, '99910232', 2, 'aow1023995', 0),
('EC0002', '159 Nguyễn Trãi', 'sample@email.com', 'EVEREADY CO 2', 0, '99910232', 1, 'aow1023995', 0);

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
(3, 1, 'EC0001'),
(4, 2, 'AC0001'),
(5, 1, 'AC0001'),
(6, 1, 'AC0002');

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
  ADD KEY `FKmyfhuc1y0sjqe2geey8jx9nc2` (`receipt_id`),
  ADD KEY `UK_ljo8smpcd43ne429b66w0sbum` (`order_material_id`) USING BTREE;

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
  MODIFY `export_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `material_types`
--
ALTER TABLE `material_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_materials`
--
ALTER TABLE `order_materials`
  MODIFY `order_material_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `receipt_items`
--
ALTER TABLE `receipt_items`
  MODIFY `receipt_item_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `vendor_supplied_types`
--
ALTER TABLE `vendor_supplied_types`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  ADD CONSTRAINT `FKoiiyib8os10es6ric22xwu9qg` FOREIGN KEY (`receipt_creator_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `FKtje7ir4x40d1rx360q6vpsgw0` FOREIGN KEY (`receipt_order_id`) REFERENCES `orders` (`order_id`);

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
  ADD CONSTRAINT `FK9wxdqi2c4iqx3wookvb42x8uh` FOREIGN KEY (`material_type_id`) REFERENCES `material_types` (`type_id`),
  ADD CONSTRAINT `FKs6b9t88f42x2jt9yb7brrjxwc` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`vendor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
