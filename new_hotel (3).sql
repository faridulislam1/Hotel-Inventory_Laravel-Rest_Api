-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2024 at 02:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new_hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `AddressLine` varchar(255) NOT NULL,
  `CityName` varchar(255) NOT NULL,
  `CountryCode` varchar(255) NOT NULL,
  `PostalCode` varchar(255) NOT NULL,
  `StreetNmbr` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `AddressLine`, `CityName`, `CountryCode`, `PostalCode`, `StreetNmbr`, `created_at`, `updated_at`) VALUES
(1, 'Mirpur', 'saver', '435', '4565', '56356', '2024-02-05 04:01:15', '2024-02-05 04:01:15');

-- --------------------------------------------------------

--
-- Table structure for table `agency_infos`
--

CREATE TABLE `agency_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `travel_itinerary_add_info_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `city` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_id`, `city`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dhaka', '2024-02-05 02:34:33', '2024-02-05 02:34:33'),
(2, 2, 'Dhaka', '2024-02-05 02:34:59', '2024-02-05 02:34:59'),
(3, 3, 'Tempore beatae arch', '2024-02-05 02:57:30', '2024-02-05 02:57:30');

-- --------------------------------------------------------

--
-- Table structure for table `contact_numbers`
--

CREATE TABLE `contact_numbers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `NameNumber` varchar(255) NOT NULL,
  `Phone` varchar(255) NOT NULL,
  `PhoneUseType` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_numbers`
--

INSERT INTO `contact_numbers` (`id`, `NameNumber`, `Phone`, `PhoneUseType`, `created_at`, `updated_at`) VALUES
(1, '456', '435', '345', '2024-02-05 04:01:15', '2024-02-05 04:01:15');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country`, `created_at`, `updated_at`) VALUES
(1, 'Bangladesh', '2024-02-05 02:34:33', '2024-02-05 02:34:33'),
(2, 'Bangladesh', '2024-02-05 02:34:59', '2024-02-05 02:34:59'),
(3, 'Nulla cum sed repreh', '2024-02-05 02:57:30', '2024-02-05 02:57:30');

-- --------------------------------------------------------

--
-- Table structure for table `create_passenger_name_record_r_q_s`
--

CREATE TABLE `create_passenger_name_record_r_q_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `targetCity` varchar(255) NOT NULL,
  `haltOnAirPriceError` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_infos`
--

CREATE TABLE `customer_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `hotel` varchar(255) NOT NULL,
  `embed_code` varchar(255) NOT NULL,
  `landmark` varchar(255) NOT NULL,
  `rating` varchar(255) NOT NULL,
  `Single_image` text NOT NULL,
  `multiple_image` text NOT NULL,
  `address` varchar(255) NOT NULL,
  `highlights` varchar(255) NOT NULL,
  `long_decription` longtext NOT NULL,
  `currency` varchar(255) NOT NULL,
  `term_condition` text NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `litetitude` varchar(255) NOT NULL,
  `facilities` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `city_id`, `country_id`, `hotel`, `embed_code`, `landmark`, `rating`, `Single_image`, `multiple_image`, `address`, `highlights`, `long_decription`, `currency`, `term_condition`, `longitude`, `litetitude`, `facilities`, `created_at`, `updated_at`) VALUES
(3, 3, 3, 'Qui sint commodo vol', 'Provident mollitia', 'Qui aliquam necessit', 'option1', 'upload/product-images/1707123450_download (1) - Copy.jpeg', 'a:2:{i:0;s:38:\"upload/product-other-images/30091.jfif\";i:1;s:38:\"upload/product-other-images/13694.jpeg\";}', 'Quis labore ipsa no', 'Error amet alias di', 'Ut commodi autem dol', 'AED (Dubai)', 'Minima laboris at ut', 'Amet sint cumque vo', 'Ullamco ad sit volu', 'Swimming Pool,Airport Shuttle,Bar,Restaurant,Free Parking,Free Wi-Fi,Good Breakfast,Kitchen,Terrace,Air Conditioning,Garden', '2024-02-05 02:57:30', '2024-02-05 02:57:30');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(31, '2014_10_12_000000_create_users_table', 1),
(32, '2014_10_12_100000_create_password_resets_table', 1),
(33, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(106, '2019_08_19_000000_create_failed_jobs_table', 2),
(107, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(108, '2023_12_20_053242_create_sessions_table', 2),
(109, '2024_01_24_112835_create_countries_table', 2),
(110, '2024_01_24_112845_create_cities_table', 2),
(111, '2024_01_28_071010_create_hotels_table', 2),
(112, '2024_01_28_071027_create_rooms_table', 2),
(113, '2024_02_01_080504_create_create_passenger_name_record_r_q_s_table', 2),
(114, '2024_02_01_080542_create_agency_infos_table', 2),
(115, '2024_02_01_080617_create_addresses_table', 2),
(116, '2024_02_01_080712_create_state_county_provs_table', 2),
(117, '2024_02_01_080749_create_customer_infos_table', 2),
(118, '2024_02_01_080856_create_contact_numbers_table', 2),
(119, '2024_02_01_080942_create_person_names_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `person_names`
--

CREATE TABLE `person_names` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_info_id` bigint(20) UNSIGNED NOT NULL,
  `NameNumber` varchar(255) NOT NULL,
  `PassengerType` varchar(255) NOT NULL,
  `GivenName` varchar(255) NOT NULL,
  `Surname` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hotel_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` int(11) NOT NULL,
  `room_num` varchar(255) NOT NULL,
  `available_capacity` varchar(255) NOT NULL,
  `max_capacity` varchar(255) NOT NULL,
  `refundable` varchar(255) NOT NULL,
  `non_refundable` varchar(255) NOT NULL,
  `refundable_break` varchar(255) NOT NULL,
  `refundable_nonbreak` varchar(255) NOT NULL,
  `extra_bed` varchar(255) DEFAULT NULL,
  `room_size` varchar(255) NOT NULL,
  `bed_type` varchar(255) DEFAULT NULL,
  `cancellation_policy` varchar(255) NOT NULL,
  `room_available` varchar(255) NOT NULL,
  `room_facilities` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `hotel_id`, `city_id`, `room_num`, `available_capacity`, `max_capacity`, `refundable`, `non_refundable`, `refundable_break`, `refundable_nonbreak`, `extra_bed`, `room_size`, `bed_type`, `cancellation_policy`, `room_available`, `room_facilities`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 'Eiusmod minima molli', '20', '50', '98', '43', '85', '37', 'n', '32', 'Queen Bed', 'Consequatur deserun', '89', 'City View,Air Conditioning,En-suite Bathroom,Minibar,Private Suite,Pool View,Landmark View,Free Toiletries,Private Bathroom,Balcony,Telephone', NULL, NULL),
(2, 3, 3, 'Et ex est laudantiu', '96', '61', '73', '11', '58', '29', 'n', '68', 'King Bed,Queen Bed', 'Blanditiis sapiente', '25', 'Soundproofing,Minibar,Free Wi-Fi,Pool View,Pool View,Rooftop Pool,Private Kitchen,Private Bathroom,Telephone,Mountain View', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('3UH0ahbc48tWA6FMeJNzfBFb2Dz2buajPFvkmUY5', NULL, '127.0.0.1', 'PostmanRuntime/7.36.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHN2azl4cERsMlEzZlV1QktWbEJERzd0MUdYOXRoaW5jdHI3dWk3UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1707123384),
('pM4l49UMgAtghTyycEcZ4b5cRXM40xQ4s3zyTxNf', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiZ1hBcHF4UWMyOE80TlE0dG9nQ2FIc1hsRlJJQWNqM0s5ZjZKdkV1USI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMzOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbWFuYWdlLXVzZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJEFqZUhicG9xTlM4TXZvTkxlMDk2ei5UakgydlpydlRiRVlsUjZaazNxblNZNGd0R1k5MHJTIjt9', 1707134393),
('PzBxGMsBJ3YKjvbw1bPFCOIiGpQ0MBireipYIHzN', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiQ3FIeW9tU3FKYmg1QW1DdXQ1azZZNnVlS1FzZll6ZFh6bkR5WUlaNCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjYyOiJodHRwOi8vbG9jYWxob3N0L3Zpc2FfdGJwL0hvdGVsLXBkZi9Ib3RlbDExL3B1YmxpYy9hZGQtaXRlbmFyeSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkQWplSGJwb3FOUzhNdm9OTGUwOTZ6LlRqSDJ2WnJ2VGJFWWxSNlprM3FuU1k0Z3RHWTkwclMiO30=', 1707122885);

-- --------------------------------------------------------

--
-- Table structure for table `state_county_provs`
--

CREATE TABLE `state_county_provs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `agency_info_id` bigint(20) UNSIGNED NOT NULL,
  `StateCode` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `state_county_provs`
--

INSERT INTO `state_county_provs` (`id`, `agency_info_id`, `StateCode`, `created_at`, `updated_at`) VALUES
(1, 1, '123456', '2024-02-05 04:01:15', '2024-02-05 04:01:15');

-- --------------------------------------------------------

--
-- Table structure for table `travel_itinerary_add_infos`
--

CREATE TABLE `travel_itinerary_add_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `create_passenger_name_record_rq_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `current_team_id`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$AjeHbpoqNS8MvoNLe096z.TjH2vZrvTbEYlR6Zk3qnSY4gtGY90rS', NULL, '2024-01-28 06:39:49', '2024-01-28 06:39:49'),
(2, 'farid', 'farid@gmail.com', NULL, '$2y$10$HCrdLkYjY6iBizArXlPqe.rqkivwCugN7/tftDkPEpwnWtbe/Q3Ii', NULL, '2024-01-28 22:35:34', '2024-01-28 22:35:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agency_infos`
--
ALTER TABLE `agency_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agency_infos_travel_itinerary_add_info_id_foreign` (`travel_itinerary_add_info_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_country_id_foreign` (`country_id`);

--
-- Indexes for table `contact_numbers`
--
ALTER TABLE `contact_numbers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `create_passenger_name_record_r_q_s`
--
ALTER TABLE `create_passenger_name_record_r_q_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_infos`
--
ALTER TABLE `customer_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotels_city_id_foreign` (`city_id`),
  ADD KEY `hotels_country_id_foreign` (`country_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `person_names`
--
ALTER TABLE `person_names`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_names_customer_info_id_foreign` (`customer_info_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_hotel_id_foreign` (`hotel_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `state_county_provs`
--
ALTER TABLE `state_county_provs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state_county_provs_agency_info_id_foreign` (`agency_info_id`);

--
-- Indexes for table `travel_itinerary_add_infos`
--
ALTER TABLE `travel_itinerary_add_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `agency_infos`
--
ALTER TABLE `agency_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact_numbers`
--
ALTER TABLE `contact_numbers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `create_passenger_name_record_r_q_s`
--
ALTER TABLE `create_passenger_name_record_r_q_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_infos`
--
ALTER TABLE `customer_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `person_names`
--
ALTER TABLE `person_names`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `state_county_provs`
--
ALTER TABLE `state_county_provs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `travel_itinerary_add_infos`
--
ALTER TABLE `travel_itinerary_add_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agency_infos`
--
ALTER TABLE `agency_infos`
  ADD CONSTRAINT `agency_infos_travel_itinerary_add_info_id_foreign` FOREIGN KEY (`travel_itinerary_add_info_id`) REFERENCES `travel_itinerary_add_infos` (`id`);

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `hotels_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `hotels_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `person_names`
--
ALTER TABLE `person_names`
  ADD CONSTRAINT `person_names_customer_info_id_foreign` FOREIGN KEY (`customer_info_id`) REFERENCES `customer_infos` (`id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`);

--
-- Constraints for table `state_county_provs`
--
ALTER TABLE `state_county_provs`
  ADD CONSTRAINT `state_county_provs_agency_info_id_foreign` FOREIGN KEY (`agency_info_id`) REFERENCES `addresses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
