-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 24, 2024 at 09:01 AM
-- Server version: 8.3.0
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-inertia-listing-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1732344114;', 1732344114),
('356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1732344114),
('da4b9237bacccdf19c0760cab7aec4a8359010b0:timer', 'i:1732463180;', 1732463180),
('da4b9237bacccdf19c0760cab7aec4a8359010b0', 'i:1;', 1732463180),
('77de68daecd823babbb58edb1c8e14d7106e83bb:timer', 'i:1732622085;', 1732622085),
('77de68daecd823babbb58edb1c8e14d7106e83bb', 'i:1;', 1732622085);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `listings`
--

DROP TABLE IF EXISTS `listings`;
CREATE TABLE IF NOT EXISTS `listings` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listings_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `listings`
--

INSERT INTO `listings` (`id`, `user_id`, `title`, `desc`, `tags`, `email`, `link`, `image`, `approved`, `created_at`, `updated_at`) VALUES
(35, 3, 'Exercitationem aliqu', 'Aut cupidatat volupt', 'Nobis,sit,tempor,des', 'vawozyret@mailinator.com', 'https://web.whatsapp.com/', 'images/listing/qQ0QxaWZsvF2l53Sd4ZbpHJ7p4rz9Ut0KuDShA58.jpg', 0, '2024-11-26 10:26:10', '2024-11-26 10:56:25'),
(34, 3, 'Consequatur qui tene', 'Ut aut do voluptatemUt aut do voluptatemUt aut do voluptatemUt aut do voluptatemUt aut do voluptatemUt aut do voluptatem', 'Consectetur,quasi', 'rome@mailinator.com', 'https://www.facebook.com/', 'images/listing/V5rJEmZAx2cDKO9nV8GSJzBCDTDg6c3XFhde7gOt.jpg', 1, '2024-11-26 06:35:52', '2024-11-26 10:57:08'),
(26, 1, 'Voluptatem Ipsa fa updated one more', 'Labore beatae quis f', 'Iure,velit,sequi', 'bygeponyse@mailinator.com', 'https://acoonator.com', 'images/listing/hHKnYWOf4NSDtflchXMEDdO3jHVtMRt5APWdWNfr.jpg', 1, '2024-11-23 00:33:35', '2024-11-24 08:29:42'),
(29, 1, 'Sunt similique ut s', 'Nobis et aut magni i', 'Nulla,quos,quas qu', 'wogyj@mailinator.com', 'https://web.whatsapp.com/', 'images/listing/aLFyFOEqAS862CjmsCLAh09RzqABqs7ILrQzKiZj.jpg', 1, '2024-11-24 08:30:30', '2024-11-24 08:30:30'),
(30, 1, 'Ut tempore aut nemo', 'Nihil necessitatibusNihil necessitatibusNihil necessitatibusNihil necessitatibusNihil necessitatibusNihil necessitatibusNihil necessitatibusNihil necessitatibusNihil necessitatibus', 'Asperiores,explicabo', 'notewul@mailinator.com', 'https://web.whatsapp.com/', 'images/listing/vj9fxJFTsq2qtQnHf5b2YSfCaqwRK57eDWHCdOaS.jpg', 1, '2024-11-24 08:31:17', '2024-11-24 08:31:17'),
(31, 2, 'In blanditiis quia o', 'Rerum vero exercitatRerum vero exercitatRerum vero exercitatRerum vero exercitatRerum vero exercitatRerum vero exercitatRerum vero exercitat', 'Praesentium,velit', 'lepuvi@mailinator.com', 'https://www.facebook.com/', 'images/listing/pNUCHJtWDIuKIKuU1dVcy56hubEnAvZ8536uiBSv.jpg', 1, '2024-11-24 08:34:24', '2024-11-24 08:34:24'),
(32, 2, 'Illum tenetur dolor', 'Qui ipsam amet suntQui ipsam amet suntQui ipsam amet suntQui ipsam amet suntQui ipsam amet suntQui ipsam amet suntQui ipsam amet suntQui ipsam amet sunt', 'Est,nostrud,anim,qu', 'bigysyd@mailinator.com', 'https://www.youtube.com/watch?v=eAISWYevv18&list=PL38wFHH4qYZUdIKP9jG371N3G4kbWAg2c&index=31', 'images/listing/i0dIi9mbRn7kmNp9F758oKKxrvE3PnZ8of9xfEpf.jpg', 1, '2024-11-24 08:35:01', '2024-11-24 08:35:01'),
(33, 2, 'Velit sunt non qui', 'Et nemo maiores quisEt nemo maiores quisEt nemo maiores quisEt nemo maiores quisEt nemo maiores quisEt nemo maiores quisEt nemo maiores quisEt nemo maiores quis', 'Id,labore,officiis', 'zosipaw@mailinator.com', 'https://www.youtube.com/watch?v=eAISWYevv18&list=PL38wFHH4qYZUdIKP9jG371N3G4kbWAg2c&index=31', 'images/listing/DwiWHlN38WCm4cx62iFfAYvsLQmJiAWFdSqEFRA6.jpg', 1, '2024-11-24 08:35:34', '2024-11-24 08:35:34'),
(28, 1, 'Dicta nesciunt qui', 'Qui voluptate illo qQui voluptate illo qQui voluptate illo qQui voluptate illo qQui voluptate illo qQui voluptate illo qQui voluptate illo q', 'Omnis,vel,voluptates', 'diku@mailinator.com', 'https://www.facebook.com/', 'images/listing/L8LazYCZnsFqKda2lZzLqU5YarYTvr4slRpesJht.jpg', 1, '2024-11-24 08:23:28', '2024-11-24 08:23:28');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_02_050716_create_listings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('UT5b1BvGsgVq9wPCdsGKr1sR4xcoIAl05NB1PTAy', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRE1ocURDRGFLZnNnck5ob1BFRUNOZjNOWmhYTTUxbUxZTnV4OXZCbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MztzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyOToiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluLzMiO31zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjI3OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYWRtaW4iO319', 1732640267);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Bijoy Saha', 'bijoy@gmail.com', '2024-11-15 00:53:10', '$2y$12$0BxsdPDHQX1qhOMxVbyC9OxJM249LP0eyncouD/LRXi9oXgUHBVRi', 'qfUhh7XVorhHpbhoGUxVHznghyzUoZqihWBIspdcPra3viQZJmXRGvxRgj2z', 'general', '2024-11-01 23:41:56', '2024-11-15 00:53:10'),
(2, 'manik', 'manik@gmail.com', '2024-11-01 23:41:56', '$2y$12$V5IOR/fll3A0zVOe4cF1VeisuYkdleHLG/.Fu1Ox8S1X6kO0huTQO', 'DPZDLcUoWegkWIoDxe3LWEMIPl00QEiH2pwQjJrAybX6Ixgwow2wYVp0ZLtg', 'general', '2024-11-01 23:41:56', '2024-11-26 10:57:25'),
(3, 'admin', 'admin@gmail.com', '2024-11-26 05:54:17', '$2y$12$6cU7QszyWL2w0iWRGJy6peG0sZe7v8Bh.bGv2GIfjDC8PkSgmeKpK', NULL, 'admin', '2024-11-26 05:23:36', '2024-11-26 05:54:17');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
