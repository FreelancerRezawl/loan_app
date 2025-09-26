-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 26, 2025 at 11:24 PM
-- Server version: 11.4.8-MariaDB
-- PHP Version: 8.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdworldb_maindatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `password`, `created_at`) VALUES
(1, 'admin@yourloan.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2025-08-25 19:12:06'),
(3, 'mdainulislam411@gmail.com', '$2y$10$3rXYUqX1l6rGikGM6s7VK.RX3s1gnN5n2Gh/dpDPfItlXzTmF8Odm', '2025-09-04 06:23:29'),
(4, 'help.rezawl71@gmail.com', '$2y$10$qrsyI3IbsziAjSGPCB8SFuUBD.6WjPxjYNpNQD9nK0bZOc6waMxvC', '2025-09-17 05:53:24');

-- --------------------------------------------------------

--
-- Table structure for table `admin_logs`
--

CREATE TABLE `admin_logs` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_content`
--

CREATE TABLE `app_content` (
  `id` int(11) NOT NULL,
  `key` varchar(100) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `method` enum('bKash','Nagad') NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `slip_path` varchar(255) NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `method`, `amount`, `slip_path`, `status`, `created_at`) VALUES
(1, 1, 'bKash', 18.00, 'deposit_user1_1757151789593.png', 'Approved', '2025-09-06 09:43:10'),
(2, 1, 'bKash', 18.00, 'deposit_user1_1757172129218.png', 'Pending', '2025-09-06 15:22:09'),
(3, 1, 'bKash', 1888.00, 'deposit_user1_1757172160906.png', 'Rejected', '2025-09-06 15:22:40'),
(4, 1, 'bKash', 5000.00, 'deposit_user1_1757175057926.jpg', 'Pending', '2025-09-06 16:10:57'),
(5, 1, 'bKash', 5000.00, 'deposit_user1_1757175353190.jpg', 'Pending', '2025-09-06 16:15:53'),
(6, 1, 'bKash', 50000.00, 'deposit_user1_1757175378242.png', 'Pending', '2025-09-06 16:16:18'),
(7, 1, 'bKash', 500000.00, 'deposit_user1_1757175798522.jpeg', 'Pending', '2025-09-06 16:23:18'),
(8, 1, 'bKash', 500000.00, 'deposit_user1_1757176217505.png', 'Approved', '2025-09-06 16:30:17');

-- --------------------------------------------------------

--
-- Table structure for table `deposit_settings`
--

CREATE TABLE `deposit_settings` (
  `id` int(11) NOT NULL CHECK (`id` = 1),
  `payable_amt` decimal(12,2) NOT NULL DEFAULT 0.00,
  `bkash_agent` varchar(32) NOT NULL DEFAULT '',
  `nagad_agent` varchar(32) NOT NULL DEFAULT '',
  `note_html` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposit_settings`
--

INSERT INTO `deposit_settings` (`id`, `payable_amt`, `bkash_agent`, `nagad_agent`, `note_html`, `is_active`, `updated_by`, `updated_at`) VALUES
(1, 0.00, '01771600779', '01771600778', 'আপনার একাউন্টে টাকা পাঠানোর জন্য ব্যাংক ফি প্রদান করতে হবে,<br>নিচের দেওয়া নাম্বারে ক্যাশ-আউট করুন', 1, 1, '2025-09-23 21:38:49');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `user_id` int(11) NOT NULL,
  `nid_front` varchar(255) DEFAULT NULL,
  `nid_back` varchar(255) DEFAULT NULL,
  `user_photo` varchar(255) DEFAULT NULL,
  `nominee_photo` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`user_id`, `nid_front`, `nid_back`, `user_photo`, `nominee_photo`, `signature`) VALUES
(1, 'nid_front_user1_1757182323902.jpeg', 'nid_back_user1_1757182328791.jpg', 'user_photo_user1_1757182328813.jpg', 'nominee_photo_user1_1757182328201.jpg', 'signature_user1_1757182328300.jpg'),
(4, 'nid_front_user4_1756380870344.jpg', 'nid_back_user4_1756380870109.jpg', 'user_photo_user4_1756380870487.jpg', 'nominee_photo_user4_1756380871798.jpg', 'signature_user4_1756380872586.jpg'),
(5, 'nid_front_user5_1756812492377.jpg', 'nid_back_user5_1756812492524.jpg', 'user_photo_user5_1756812492568.jpg', 'nominee_photo_user5_1756812492148.jpg', 'signature_user5_1756812492648.jpg'),
(9, 'nid_front_user9_1756381113421.jpg', 'nid_back_user9_1756381113512.jpg', 'user_photo_user9_1756381113483.jpg', 'nominee_photo_user9_1756381114668.jpg', 'signature_user9_1756381115897.jpg'),
(14, 'nid_front_user14_1756893004440.jpg', 'nid_back_user14_1756893004470.jpg', 'user_photo_user14_1756893004261.jpg', 'nominee_photo_user14_1756893004898.jpg', 'signature_user14_1756893005357.jpg'),
(16, 'nid_front_user16_1756967314278.jpg', 'nid_back_user16_1756967314335.jpg', 'user_photo_user16_1756967314552.jpg', 'nominee_photo_user16_1756967314577.jpg', 'signature_user16_1756967314297.jpg'),
(17, 'nid_front_user17_1757021115487.jpg', 'nid_back_user17_1757021115872.jpg', 'user_photo_user17_1757021115127.jpg', 'nominee_photo_user17_1757021115421.jpg', 'signature_user17_1757021115603.png'),
(19, 'nid_front_user19_1756984693211.jpg', 'nid_back_user19_1756984693526.jpg', 'user_photo_user19_1756984693990.jpg', 'nominee_photo_user19_1756984693843.jpg', 'signature_user19_1756984693949.jpg'),
(20, 'nid_front_user20_1757005693652.jpg', 'nid_back_user20_1757005693182.jpg', 'user_photo_user20_1757005693432.jpg', 'nominee_photo_user20_1757005693230.jpg', 'signature_user20_1757005693144.jpg'),
(21, 'nid_front_user21_1757013204206.jpg', 'nid_back_user21_1757013204415.jpg', 'user_photo_user21_1757013204829.jpg', 'nominee_photo_user21_1757013204768.jpg', 'signature_user21_1757013204287.jpg'),
(23, 'nid_front_user23_1757051317920.jpg', 'nid_back_user23_1757051317447.jpg', 'user_photo_user23_1757051317534.jpg', 'nominee_photo_user23_1757051317743.jpg', 'signature_user23_1757051317858.jpg'),
(24, 'nid_front_user24_1757178329470.jpg', 'nid_back_user24_1757178329771.jpg', 'user_photo_user24_1757178329552.jpg', 'nominee_photo_user24_1757178329181.jpg', 'signature_user24_1757178329200.jpg'),
(25, 'nid_front_user25_1757178321152.jpg', 'nid_back_user25_1757178321735.jpg', 'user_photo_user25_1757178321683.jpg', 'nominee_photo_user25_1757178321407.jpg', 'signature_user25_1757178321388.jpg'),
(26, 'nid_front_user26_1757187546566.jpg', 'nid_back_user26_1757187546296.jpg', 'user_photo_user26_1757187546527.jpg', 'nominee_photo_user26_1757187546439.jpg', 'signature_user26_1757187546200.jpg'),
(28, 'nid_front_user28_1757189516415.jpg', 'nid_back_user28_1757189516138.jpg', 'user_photo_user28_1757189516113.jpg', 'nominee_photo_user28_1757189516424.jpg', 'signature_user28_1757189516569.jpg'),
(29, 'nid_front_user29_1757270804429.png', 'nid_back_user29_1757270804669.png', 'user_photo_user29_1757270804408.png', 'nominee_photo_user29_1757270804656.png', 'signature_user29_1757270804359.jpg'),
(30, 'nid_front_user30_1757502191922.jpg', 'nid_back_user30_1757502192807.jpg', 'user_photo_user30_1757502193885.jpg', 'nominee_photo_user30_1757502193807.jpg', 'signature_user30_1757502193958.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `loan_requests`
--

CREATE TABLE `loan_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `duration_months` int(11) DEFAULT NULL,
  `interest_rate` decimal(5,2) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `method` enum('bKash','Nagad','Rocket','Bank') DEFAULT NULL,
  `account_number` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Pending','Process','Success','Fail') DEFAULT 'Pending',
  `reason` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_requests`
--

INSERT INTO `loan_requests` (`id`, `user_id`, `loan_id`, `amount`, `duration_months`, `interest_rate`, `total_amount`, `method`, `account_number`, `status`, `reason`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1000.00, 6, 10.00, 1100.00, 'bKash', '01771600778', 'Success', '', '2025-08-25 21:05:32', '2025-09-02 10:18:52'),
(2, 9, 2, 1000.00, 6, 10.00, 1100.00, 'Bank', '8575469547', 'Success', '', '2025-08-28 11:40:23', '2025-09-02 10:20:01'),
(3, 5, 1, 55000.00, 5, 10.00, 60500.00, 'bKash', '332', 'Pending', NULL, '2025-09-02 11:28:34', '2025-09-02 11:28:34'),
(4, 5, 1, 55000.00, 5, 10.00, 60500.00, 'bKash', '2346354353', 'Pending', '', '2025-09-02 11:28:44', '2025-09-02 12:46:33'),
(5, 13, 2, 1000.00, 6, 10.00, 1100.00, 'Nagad', '01678965432', 'Success', '', '2025-09-03 08:20:01', '2025-09-03 12:23:44'),
(6, 1, NULL, 1000000.00, 28, 16.00, 1160000.00, 'bKash', '01771600778', 'Pending', NULL, '2025-09-04 04:45:47', '2025-09-04 04:45:47'),
(7, 1, NULL, 1000000.00, 28, 12.00, 1120000.00, 'bKash', '01771600778', 'Pending', NULL, '2025-09-04 04:48:48', '2025-09-04 04:48:48'),
(8, 1, NULL, 1000000.00, 12, 12.00, 1120000.00, 'bKash', '01771600778', 'Pending', NULL, '2025-09-04 04:49:10', '2025-09-04 04:49:10'),
(9, 1, NULL, 50000.00, 12, 12.00, 56000.00, 'bKash', '', 'Pending', NULL, '2025-09-04 04:59:16', '2025-09-04 04:59:16'),
(10, 1, NULL, 50000.00, 12, 0.20, 50100.00, 'Rocket', '01771600778', 'Fail', '', '2025-09-04 05:24:11', '2025-09-04 05:29:34'),
(11, 1, NULL, 2000000.00, 12, 0.20, 2004000.00, 'Nagad', '01771600778', 'Pending', NULL, '2025-09-04 09:18:42', '2025-09-04 09:18:42'),
(12, 1, NULL, 2000000.00, 12, 0.20, 2004000.00, 'Nagad', '01771600778', 'Pending', NULL, '2025-09-04 09:25:46', '2025-09-04 09:25:46'),
(13, 1, NULL, 50000.00, 12, 0.20, 50100.00, 'Rocket', '01771600778', 'Pending', NULL, '2025-09-04 09:33:35', '2025-09-04 09:33:35'),
(14, 1, NULL, 50000.00, 12, 0.20, 50100.00, 'Rocket', '01771600778', 'Pending', NULL, '2025-09-04 09:34:48', '2025-09-04 09:34:48'),
(15, 1, NULL, 1700000.00, 12, 0.20, 1703400.00, 'Nagad', '01771600111', 'Pending', NULL, '2025-09-04 09:35:26', '2025-09-04 09:35:26'),
(16, 1, NULL, 200000.00, 60, 0.20, 200400.00, 'bKash', '01862374095', 'Pending', NULL, '2025-09-04 09:43:10', '2025-09-04 09:43:10'),
(17, 18, NULL, 2000000.00, 12, 0.20, 2004000.00, 'Nagad', '01771600778', 'Pending', NULL, '2025-09-04 10:12:25', '2025-09-04 10:12:25'),
(18, 20, NULL, 300000.00, 12, 0.20, 300600.00, 'bKash', '01817565655', 'Pending', NULL, '2025-09-04 17:09:19', '2025-09-04 17:09:19'),
(19, 1, NULL, 350000.00, 12, 0.20, 350700.00, 'bKash', '01771600778', 'Pending', NULL, '2025-09-04 18:23:35', '2025-09-04 18:23:35'),
(20, 1, NULL, 100000.00, 12, 0.20, 100200.00, 'Rocket', '01771600778', 'Pending', NULL, '2025-09-04 19:03:31', '2025-09-04 19:03:31'),
(21, 1, NULL, 100000.00, 12, 0.20, 100200.00, 'Nagad', '01771600778', 'Process', '', '2025-09-04 19:18:45', '2025-09-04 20:25:01'),
(22, 1, NULL, 1750000.00, 12, 0.20, 1753500.00, 'Rocket', '01771600778', 'Pending', NULL, '2025-09-04 21:03:10', '2025-09-04 21:03:10'),
(23, 1, NULL, 100000.00, 12, 0.20, 100200.00, 'Rocket', '01771600778', 'Success', '', '2025-09-04 21:17:29', '2025-09-04 21:23:40'),
(24, 1, NULL, 50000.00, 12, 0.20, 50100.00, 'Bank', 'Bank: AB BANK | Branch: ab | Holder: hsb | Ac: 4103161502419961 | Routing: 128', 'Pending', NULL, '2025-09-04 21:22:52', '2025-09-04 21:22:52'),
(25, 1, NULL, 1600000.00, 12, 0.20, 1603200.00, 'Bank', 'Bank: AB BANK | Branch: chndra | Holder: md rezawl | Ac: 4103161502419961 | Routing: 128', 'Pending', NULL, '2025-09-04 21:23:27', '2025-09-04 21:23:27'),
(26, 17, NULL, 800000.00, 60, 0.20, 801600.00, 'Bank', 'Bank: ডাচ বাংলা ব্যাংক | Branch: শিবপুর | Holder: আকাশ | Ac: 8214536758', 'Success', '', '2025-09-04 21:26:30', '2025-09-05 06:36:32'),
(27, 1, NULL, 1850000.00, 60, 0.20, 1853700.00, 'bKash', '01771600778', 'Success', '', '2025-09-04 21:44:12', '2025-09-04 21:45:11'),
(28, 23, NULL, 1000000.00, 60, 0.20, 1002000.00, 'Bank', 'Bank: ইসলামী ব্যাংক | Branch: সাপাহার | Holder: সোহেল রানা | Ac: 205000063541758', 'Success', '', '2025-09-05 05:49:46', '2025-09-05 06:44:53'),
(29, 24, NULL, 50000.00, 12, 0.20, 50100.00, 'bKash', '01875123123', 'Success', '', '2025-09-06 17:05:54', '2025-09-06 17:12:08'),
(30, 25, NULL, 1000000.00, 60, 0.20, 1002000.00, 'Bank', 'Bank: Islami bank | Branch: Naogoan | Holder: Md Delwar | Ac: 20508865321542', 'Success', '', '2025-09-06 17:07:26', '2025-09-06 17:12:17'),
(31, 26, NULL, 50000.00, 12, 0.20, 50100.00, 'Bank', 'Bank: Dutch bangla bank | Branch: Ctg | Holder: Raju | Ac: 23456790 | Routing: 6578567', 'Pending', NULL, '2025-09-06 19:40:09', '2025-09-06 19:40:09'),
(32, 27, NULL, 100000.00, 12, 0.20, 100200.00, 'Nagad', '01862374095', 'Pending', NULL, '2025-09-06 19:41:18', '2025-09-06 19:41:18'),
(33, 28, NULL, 100000.00, 12, 0.20, 100200.00, 'bKash', '01817123456', 'Pending', NULL, '2025-09-06 20:12:14', '2025-09-06 20:12:14'),
(34, 29, NULL, 50000.00, 12, 0.20, 50100.00, 'Bank', 'Bank: sonali bank limited | Branch: dhaka | Holder: halim uddin | Ac: 456215858574452 | Routing: 5554444', 'Process', '', '2025-09-07 18:47:38', '2025-09-09 09:39:04'),
(35, 30, NULL, 200000.00, 24, 0.20, 200400.00, 'Bank', 'Bank: রুপালি | Branch: বজার রোড বরিশাল | Holder: মনির  খান | Ac: 3251011006303', 'Pending', NULL, '2025-09-10 11:06:59', '2025-09-10 11:06:59');

-- --------------------------------------------------------

--
-- Table structure for table `loan_settings`
--

CREATE TABLE `loan_settings` (
  `id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `duration_months` int(11) NOT NULL,
  `interest_rate` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_settings`
--

INSERT INTO `loan_settings` (`id`, `amount`, `duration_months`, `interest_rate`, `created_at`) VALUES
(1, 55000.00, 5, 10.00, '2025-08-25 21:04:39'),
(2, 1000.00, 6, 10.00, '2025-08-25 21:04:50');

-- --------------------------------------------------------

--
-- Table structure for table `money_receipts`
--

CREATE TABLE `money_receipts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `receipt_no` varchar(50) NOT NULL,
  `receipt_date` date NOT NULL,
  `payer_name` varchar(200) NOT NULL,
  `amount_bdt` decimal(12,2) NOT NULL,
  `amount_words` varchar(500) NOT NULL,
  `purpose_for` varchar(200) NOT NULL,
  `account_type` varchar(100) NOT NULL,
  `paid_flag` tinyint(1) NOT NULL DEFAULT 1,
  `signature_date` date DEFAULT NULL,
  `signature_path` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `money_receipts`
--

INSERT INTO `money_receipts` (`id`, `receipt_no`, `receipt_date`, `payer_name`, `amount_bdt`, `amount_words`, `purpose_for`, `account_type`, `paid_flag`, `signature_date`, `signature_path`, `created_at`, `updated_at`) VALUES
(1, '457821', '2025-09-13', 'MD. ARIKUR ISLAM', 15983.00, 'Fifteen Thousand Nine Hundred and Eighty Three Taka Only', 'Installment', 'Bkash', 1, '2025-09-13', 'uploads/signatures/1757749872_2__2_.png', '2025-09-13 07:51:12', '2025-09-13 07:51:12');

-- --------------------------------------------------------

--
-- Table structure for table `nominee_info`
--

CREATE TABLE `nominee_info` (
  `user_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `relationship` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nominee_info`
--

INSERT INTO `nominee_info` (`user_id`, `name`, `mobile`, `relationship`) VALUES
(1, 'Alex', '0177169806', 'রেজাউল korim'),
(4, 'mst. sbiha', '017564875', 'wife'),
(5, 'shahida', '0172586744', 'wife'),
(9, 'Mst. sufia Begum', '01728947584', 'Wife'),
(14, 'sabrina', '01740856176', 'sister'),
(16, 'Amena begum', '01740856176', 'Ma'),
(17, 'Mst. Parvin sultana', '01723574486', 'Wife'),
(19, 'নাসরিন খাতুন', '01725428536', 'স্ত্রী'),
(20, 'Hasib', '01817123789', 'Brother'),
(21, 'নদী', '01405254238', 'স্ত্রী'),
(23, 'মুন্নি', '01742354875', 'স্ত্রী'),
(24, 'Hi', '01817147258', 'Bro'),
(25, 'Reshmi', '01742512354', 'Wife'),
(26, 'Rohim', '01817232323', 'Bro'),
(28, 'Rohim', '01817123456', 'Bro'),
(29, 'jubir', '01817456789', 'brother'),
(30, 'মনির খান  Monirkhan', '01736766665', 'স্ত্রী  শামিমাSamima');

-- --------------------------------------------------------

--
-- Table structure for table `personal_info`
--

CREATE TABLE `personal_info` (
  `user_id` int(11) NOT NULL,
  `nid` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `job` varchar(50) DEFAULT NULL,
  `income` decimal(10,2) DEFAULT NULL,
  `family_members` int(11) DEFAULT NULL,
  `earning_members` int(11) DEFAULT NULL,
  `loan_purpose` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `present_address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `house_own` varchar(10) DEFAULT NULL,
  `car_own` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personal_info`
--

INSERT INTO `personal_info` (`user_id`, `nid`, `address`, `job`, `income`, `family_members`, `earning_members`, `loan_purpose`, `name`, `mobile`, `present_address`, `permanent_address`, `house_own`, `car_own`) VALUES
(1, '1234567890', 'Dhaka', 'student', 10000.00, 5, 5, 'গরু পালন', 'MD REJAWL', '01771600778', '', '', 'হ্যাঁ', 'হ্যাঁ'),
(4, '8965247561', 'rajshahi', 'job', 50000.00, 5, 2, 'গৃহ স্থাপন', NULL, NULL, NULL, NULL, NULL, NULL),
(5, '867985456', NULL, 'job', 50000.00, 5, 2, 'ব্যবসা', 'Md.Ainul Islam', '01723574486', 'Rajshahi', 'Rajshahi', NULL, NULL),
(9, 'Md. Ainul Islam ', 'Rajshahi', 'job', 35000.00, 5, 1, 'ব্যবসা', NULL, NULL, NULL, NULL, NULL, NULL),
(14, '85797445612', NULL, 'business', 35000.00, 5, 2, 'ব্যবসা', 'wb', '01740856176', 'naogoan', 'naogoan', NULL, NULL),
(16, '8537451285', NULL, 'Job', 38000.00, 5, 2, 'ব্যবসা', 'Welcome', '01741349685', 'Dhaka', 'Rajshahi', NULL, NULL),
(17, '7985321542', NULL, 'Job', 45000.00, 5, 2, 'ব্যবসা', 'Md. Ainul islam', '01718949148', 'Joypurhat', 'Natore', 'হ্যাঁ', 'না'),
(19, '8565214275', NULL, 'চাকুরী', 50000.00, 5, 2, 'ব্যবসা', 'মোঃ সোলায়মান আলী', '01849281265', 'বদরগাছি', 'নাটোর', 'হ্যাঁ', 'না'),
(20, '1236548899', NULL, 'Job', 20000.00, 5, 1, 'ব্যবসা', 'Halim', '01817123789', 'Halim', 'Halim', 'হ্যাঁ', 'না'),
(21, '8523654782', NULL, 'চাকুরী', 42000.00, 3, 1, 'ব্যবসা', 'আকাশ', '01726003750', 'শিবপুর', 'শিবপুর', 'হ্যাঁ', 'না'),
(23, '8524154237', NULL, 'চাকুরী', 50000.00, 4, 1, 'গরু ক্রয়', 'সোহেল রানা', '01774081354', 'সাপাহার', 'সাপাহার', 'হ্যাঁ', 'না'),
(24, '12345678', NULL, 'Job', 20000.00, 5, 1, 'Business', 'Hello', '01817147258', 'Feni', 'Feni', 'হ্যাঁ', 'না'),
(25, '8653214785', NULL, 'Business', 50000.00, 5, 2, 'Business', 'Delowar', '01715637348', 'Naogoan', 'Natore', 'হ্যাঁ', 'না'),
(26, '01817232323', NULL, 'Job', 20000.00, 5, 1, 'Business', 'Raju', '', 'Ctg', 'Ctg', 'হ্যাঁ', 'না'),
(28, '255566668', NULL, 'Job', 20000.00, 5, 1, 'Business', 'Nane', '01817123456', 'Tungi', 'Tungi', 'হ্যাঁ', 'না'),
(29, '456987123', NULL, 'job', 20000.00, 6, 2, 'Business', 'halim uddin', '01817456789', 'feni', 'feni', 'হ্যাঁ', 'না'),
(30, '7320696276', NULL, 'চাকুরী', 20000.00, 4, 1, 'জমি কিনব', 'মনির খান', '01736766665', 'গ্রাম বাহের চর পোস্ট মোল্লার হাট উপজেলা হিজলা জেলা বরিশাল', 'ঐ', 'হ্যাঁ', 'না');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` enum('male','female') DEFAULT 'male',
  `photo_url` varchar(255) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `bank_method` varchar(50) DEFAULT NULL,
  `bank_account` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `bank_name` varchar(50) DEFAULT NULL,
  `branch_name` varchar(50) DEFAULT NULL,
  `account_holder` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `mobile`, `password`, `bank_method`, `bank_account`, `created_at`, `bank_name`, `branch_name`, `account_holder`) VALUES
(1, 'MD REZA', '01771600778', '$2y$11$LPXxD7mO1ljSa0RqK.WtmOflCEUzmUbGr54AN7RjsLCfMS0uCwYGK', 'Nagad', '01771600778', '2025-08-25 20:04:45', NULL, NULL, NULL),
(3, 'Gorila', '01818456123', '$2y$10$2XAAv6Z8Bf2WPHAE98gV7O5XH/tSPZGdw/dIIGSgGn2u.xJoefLVq', NULL, NULL, '2025-08-26 04:47:47', NULL, NULL, NULL),
(4, 'halim', '01817456123', '$2y$10$EvUiDYBI5/J8IHLPtHHome54mwYnj0zVhdaDA07YU9h564zINuFfa', NULL, NULL, '2025-08-26 05:55:54', NULL, NULL, NULL),
(5, 'MD AINUL Islam', '01723574486', '$2y$10$3fkIwT4xviOXM.057Kxc7uhaeyMxH.lCtjTF6ZPsQmS1EW4.4zXpS', NULL, NULL, '2025-08-27 07:22:48', NULL, NULL, NULL),
(9, 'Md.Ainul Islam', '01723574489', '$2y$10$A8IKhbdaELCCbRdaFLnGd.IzwIto9W5R.b1CCkR97qA9jXHxrYLLS', 'Bank', '8574758475', '2025-08-28 11:36:15', 'dutch Bangla Bank', 'rajshahi Branch', 'Md.Ainul Islam'),
(10, 'Jovi69', '01643497131', '$2y$10$c3zjBoq4X83W1IAJpM5Mhe1thaM2Y8UJ3S2V/TMbbpYSLMguzVz0m', NULL, NULL, '2025-08-28 14:25:02', NULL, NULL, NULL),
(13, 'Jojo', '01751243625', '$2y$10$t8b2LzPvdFsDnnyHq/QORuIMkYSzVVax8H4jvTLHxymN/OURyyGKa', NULL, NULL, '2025-09-03 08:18:59', NULL, NULL, NULL),
(14, 'wb', '01740856176', '$2y$10$l/ISIgODzKUr686iAH2BpucqUc4WVe2N3G8AAx/.bVG05Oa9zG1ya', NULL, NULL, '2025-09-03 09:46:21', NULL, NULL, NULL),
(16, 'Welcome', '01741349685', '$2y$10$24GCxm7qh.0f6RwvKs1qVeV2w9PEYfr51sTWfVxTfvrn2Yo1Q1..6', NULL, NULL, '2025-09-04 06:23:28', NULL, NULL, NULL),
(17, 'Md.Ainul islam', '01718949148', '$2y$10$SOMG.V7bBqbQXgsyIDASj.I9HHzdmSQtc/b8J6ALpTmqRT7vau1N6', NULL, NULL, '2025-09-04 09:38:20', NULL, NULL, NULL),
(18, 'Abdul malek', '01771600776', '$2y$10$nwvW/w21XhP.d5KhUKOvseA.gUs9R.1zrnQ59lqJrGDFHLK/Ann1C', NULL, NULL, '2025-09-04 10:08:12', NULL, NULL, NULL),
(19, 'মোঃ সোলায়মান আলী', '01849281265', '$2y$10$hJaYPL8B82OBWTs5j50fJ.4OBBn3mT6rMq2MDTj.DEHG1BTbg5ENG', NULL, NULL, '2025-09-04 10:40:39', NULL, NULL, NULL),
(20, 'Halim', '01817123789', '$2y$10$X0wDWTz0DH0BG1nVCsCPDuJdxUFvXyM1cZkJhzbeWQtfKBB6an1Se', NULL, NULL, '2025-09-04 17:05:08', NULL, NULL, NULL),
(21, 'আকাশ', '01726003750', '$2y$10$jQjo1E3O6Dt6cOZXp77JTOrIZvPOv1ZHoHZ.BNZWu11hMNmQ3TKwW', NULL, NULL, '2025-09-04 19:09:38', NULL, NULL, NULL),
(22, 'Alex', '01781600778', '$2y$10$it1KnEZRpReCNqMNY95Lbe0fhXMbIikp9FO57POB4fmSM72mwto2O', NULL, NULL, '2025-09-04 21:47:06', NULL, NULL, NULL),
(23, 'সোহেল রানা', '01774081354', '$2y$10$i8m5TDmg4/jfmD9pruzEuO29q8KSf0JVjDxPAsgViWro5qO1YmoXa', NULL, NULL, '2025-09-05 05:44:20', NULL, NULL, NULL),
(24, 'Hello', '01817147258', '$2y$10$ODbdgZEWwQwEHjHYVt.aPOrSJBteOKRdDKfpiU4rC6Ro7PPW9203.', NULL, NULL, '2025-09-06 17:01:59', NULL, NULL, NULL),
(25, 'Delowar', '01715637348', '$2y$10$AIN2PIpmtuBm6nRbc/S7qugTZTnJp8VDJ/YKXV/3FZc6U58l8l6a.', NULL, NULL, '2025-09-06 17:02:30', NULL, NULL, NULL),
(26, 'Raju', '01817232323', '$2y$10$Sg6ufm1V8O0p1oyVvSNu1u9B6lXFF8COcfegqDL1Gbto7Oe6lAtze', NULL, NULL, '2025-09-06 19:36:30', NULL, NULL, NULL),
(27, 'Mazidul', '01331600778', '$2y$10$18HaT0ArxOwY9qshOhfhTuU0YeMXWe4/at/pWmKuD9O8n0g6bYaWG', NULL, NULL, '2025-09-06 19:40:22', NULL, NULL, NULL),
(28, 'Name', '01817123456', '$2y$10$yhShf62Ism.hrMSfl6XuW.t08gaaMG9oA7UnlrJLIVObE8y0KTrsK', NULL, NULL, '2025-09-06 20:10:35', NULL, NULL, NULL),
(29, 'halim uddin', '01817456789', '$2y$10$xTtV53q7xcDbfnOGcXvs7.PbAkK0dO4/0lqlZ5PO7T7EOSNdox68G', NULL, NULL, '2025-09-07 18:44:23', NULL, NULL, NULL),
(30, 'মনির খান', '01736766665', '$2y$10$KxeYg.zA60dGyyaxRglbdu72F.XFzAytHsrzvl9bbN0SRHgX/mbmG', NULL, NULL, '2025-09-10 10:53:37', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_status_extra`
--

CREATE TABLE `user_status_extra` (
  `user_id` int(11) NOT NULL,
  `label` varchar(191) NOT NULL,
  `value` varchar(191) NOT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_status_extra`
--

INSERT INTO `user_status_extra` (`user_id`, `label`, `value`, `updated_at`) VALUES
(1, 'মান', '50', '2025-09-23 21:52:25'),
(23, '', '1500', '2025-09-06 15:48:41'),
(24, '', '', '2025-09-06 17:11:37'),
(29, '', '5000', '2025-09-09 10:12:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_content`
--
ALTER TABLE `app_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_settings`
--
ALTER TABLE `deposit_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `loan_requests`
--
ALTER TABLE `loan_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `loan_id` (`loan_id`);

--
-- Indexes for table `loan_settings`
--
ALTER TABLE `loan_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `money_receipts`
--
ALTER TABLE `money_receipts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_receipt_no` (`receipt_no`);

--
-- Indexes for table `nominee_info`
--
ALTER TABLE `nominee_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `personal_info`
--
ALTER TABLE `personal_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `user_status_extra`
--
ALTER TABLE `user_status_extra`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_logs`
--
ALTER TABLE `admin_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_content`
--
ALTER TABLE `app_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `loan_requests`
--
ALTER TABLE `loan_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `loan_settings`
--
ALTER TABLE `loan_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `money_receipts`
--
ALTER TABLE `money_receipts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `loan_requests`
--
ALTER TABLE `loan_requests`
  ADD CONSTRAINT `loan_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `loan_requests_ibfk_2` FOREIGN KEY (`loan_id`) REFERENCES `loan_settings` (`id`);

--
-- Constraints for table `nominee_info`
--
ALTER TABLE `nominee_info`
  ADD CONSTRAINT `nominee_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `personal_info`
--
ALTER TABLE `personal_info`
  ADD CONSTRAINT `personal_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_status_extra`
--
ALTER TABLE `user_status_extra`
  ADD CONSTRAINT `fk_user_status_extra_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
