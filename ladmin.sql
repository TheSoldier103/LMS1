-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 03, 2020 at 09:44 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ladmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `backups`
--

CREATE TABLE `backups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `file_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backup_size` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_title` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `deleted_at`, `created_at`, `updated_at`, `course_title`, `description`, `start_date`, `published`) VALUES
(1, NULL, '2020-07-05 07:07:44', '2020-07-05 11:53:24', 'FirstCourse', 'This is a course for machine learning. You have to listen to the course, else you won\'t be the smartest', '2020-07-25', 1),
(2, NULL, '2020-07-05 11:54:32', '2020-08-02 17:17:11', 'Databases', 'This is a course taken by Mancas on databases', '2020-07-31', 1),
(3, NULL, '2020-08-01 02:00:26', '2020-08-01 02:00:44', 'NewCourse', 'This is a course on Badoo', '2020-08-18', 1),
(4, NULL, '2020-08-02 05:14:20', '2020-08-02 05:14:20', 'Messing_With_Laraadmin', 'this course is to mess with the lara-admin platform', '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `data_elements`
--

CREATE TABLE `data_elements` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `element_nr` decimal(15,1) NOT NULL DEFAULT 0.0,
  `element_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `data_elements`
--

INSERT INTO `data_elements` (`id`, `deleted_at`, `created_at`, `updated_at`, `element_nr`, `element_name`) VALUES
(1, NULL, '2020-07-08 05:10:23', '2020-07-09 12:31:25', '4.1', 'Format'),
(2, NULL, '2020-07-09 12:21:54', '2020-07-09 12:21:54', '1.7', 'Structure'),
(11, NULL, '2020-07-14 08:12:42', '2020-07-14 08:12:42', '1.3', 'Language'),
(12, NULL, '2020-08-01 02:23:00', '2020-08-01 02:23:00', '5.1', 'Interactivity_Type'),
(13, NULL, '2020-08-01 02:23:20', '2020-08-01 02:23:20', '5.3', 'Interactivity_Level'),
(14, NULL, '2020-08-01 02:52:25', '2020-08-01 02:52:25', '5.2', 'Learning_Resource_Type'),
(15, NULL, '2020-08-01 02:53:37', '2020-08-01 02:53:37', '5.8', 'Difficulty'),
(16, NULL, '2020-08-01 02:54:11', '2020-08-01 02:54:11', '5.4', 'Semantic_Density'),
(17, NULL, '2020-08-01 02:54:39', '2020-08-01 02:54:39', '9.1', 'Purpose');

-- --------------------------------------------------------

--
-- Table structure for table `delement_pparameters`
--

CREATE TABLE `delement_pparameters` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `linguistic_term` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parameter` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `data_element` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `metadata_value` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `degree` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '100',
  `interactivity_level` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `delement_pparameters`
--

INSERT INTO `delement_pparameters` (`id`, `deleted_at`, `created_at`, `updated_at`, `linguistic_term`, `parameter`, `data_element`, `metadata_value`, `degree`, `interactivity_level`) VALUES
(1, '2020-08-01 02:59:16', '2020-07-10 12:32:22', '2020-08-01 02:59:16', 'video', 1, 1, 'video', '100', ''),
(2, '2020-08-01 02:59:21', '2020-07-10 12:33:41', '2020-08-01 02:59:21', 'sequential', 2, 2, 'linear', '100', ''),
(3, '2020-08-01 02:59:25', '2020-07-10 12:34:46', '2020-08-01 02:59:25', 'global', 2, 2, 'hierarchical', '100', ''),
(4, '2020-08-01 02:59:33', '2020-07-14 08:14:47', '2020-08-01 02:59:33', 'English', 4, 11, 'en', '100', ''),
(5, '2020-08-01 02:59:36', '2020-07-14 11:16:52', '2020-08-01 02:59:36', 'Romanian', 4, 11, 'ro', '100', ''),
(6, '2020-08-01 02:59:39', '2020-08-01 02:45:16', '2020-08-01 02:59:39', 'active', 2, 12, 'active', '20', 'very low'),
(8, NULL, '2020-08-01 03:01:13', '2020-08-01 03:01:13', 'active', 2, 12, 'active', '40', 'low'),
(9, NULL, '2020-08-01 03:02:11', '2020-08-01 03:02:11', 'active', 2, 12, 'active', '60', 'medium'),
(10, NULL, '2020-08-01 03:02:50', '2020-08-01 03:02:50', 'active', 2, 12, 'active', '80', 'high'),
(11, NULL, '2020-08-01 03:03:30', '2020-08-01 03:03:30', 'active', 2, 12, 'active', '100', 'very high'),
(12, NULL, '2020-08-01 03:04:49', '2020-08-01 03:04:49', 'reflective', 2, 12, 'expositive', '20', 'very low'),
(13, NULL, '2020-08-01 03:05:40', '2020-08-01 03:05:40', 'reflective', 2, 12, 'expositive', '40', 'low'),
(14, NULL, '2020-08-01 03:06:11', '2020-08-01 03:06:11', 'reflective', 2, 12, 'expositive', '60', 'medium'),
(15, NULL, '2020-08-01 03:06:48', '2020-08-01 03:06:48', 'reflective', 2, 12, 'expositive', '80', 'high'),
(16, NULL, '2020-08-01 03:07:23', '2020-08-01 03:07:23', 'reflective', 2, 12, 'expositive', '100', 'very high'),
(17, NULL, '2020-08-01 03:08:22', '2020-08-01 03:08:22', 'activist', 8, 12, 'active', '20', 'very low'),
(18, NULL, '2020-08-01 03:08:47', '2020-08-01 03:08:47', 'activist', 8, 12, 'active', '40', 'low'),
(19, NULL, '2020-08-01 03:10:19', '2020-08-01 03:10:19', 'activist', 8, 12, 'active', '60', 'medium'),
(20, NULL, '2020-08-01 03:10:51', '2020-08-01 03:10:51', 'activist', 8, 12, 'active', '80', 'high'),
(21, NULL, '2020-08-01 03:11:15', '2020-08-01 06:08:17', 'activist', 8, 12, 'active', '100', 'very high'),
(22, NULL, '2020-08-01 03:12:02', '2020-08-01 03:12:02', 'reflector', 8, 12, 'expositive', '20', 'very low'),
(23, NULL, '2020-08-01 03:12:38', '2020-08-01 03:12:38', 'reflector', 8, 12, 'expositive', '40', 'low'),
(24, NULL, '2020-08-01 03:13:39', '2020-08-01 03:13:39', 'reflector', 8, 12, 'expositive', '60', 'medium'),
(25, NULL, '2020-08-01 03:14:25', '2020-08-01 03:14:25', 'reflector', 8, 12, 'expositive', '80', 'high'),
(26, NULL, '2020-08-01 03:15:13', '2020-08-01 03:15:13', 'reflector', 8, 12, 'expositive', '100', 'very high'),
(27, NULL, '2020-08-01 03:16:34', '2020-08-01 03:19:13', 'visual', 2, 14, 'diagram', '100', ''),
(28, NULL, '2020-08-01 03:20:12', '2020-08-01 03:20:12', 'visual', 2, 14, 'figure', '100', ''),
(29, NULL, '2020-08-01 03:21:10', '2020-08-01 03:21:10', 'visual', 2, 14, 'graph', '100', ''),
(30, NULL, '2020-08-01 03:22:07', '2020-08-01 03:22:07', 'verbal', 2, 14, 'narrative text', '100', ''),
(31, NULL, '2020-08-01 03:22:57', '2020-08-01 03:22:57', 'verbal', 2, 14, 'lecture', '100', ''),
(32, NULL, '2020-08-01 03:23:36', '2020-08-01 03:23:36', 'visual', 2, 1, 'video', '100', ''),
(33, NULL, '2020-08-01 03:24:32', '2020-08-01 03:24:32', 'sequential', 2, 2, 'linear', '100', ''),
(34, NULL, '2020-08-01 03:26:03', '2020-08-01 03:26:03', 'simulation', 1, 14, 'simulation', '100', ''),
(35, NULL, '2020-08-01 03:26:36', '2020-08-01 03:26:36', 'text/image', 1, 14, 'diagram', '100', ''),
(36, NULL, '2020-08-01 03:27:08', '2020-08-01 06:07:32', 'text/image', 1, 14, 'figure', '100', ''),
(37, NULL, '2020-08-01 03:27:40', '2020-08-01 03:27:40', 'text/image', 1, 14, 'graph', '100', ''),
(38, NULL, '2020-08-01 03:28:20', '2020-08-01 06:08:57', 'text/image', 1, 14, 'narrative text', '100', ''),
(39, NULL, '2020-08-01 03:29:33', '2020-08-01 03:29:33', 'text/image', 1, 14, 'lecture', '100', ''),
(40, NULL, '2020-08-01 03:30:18', '2020-08-01 03:30:18', 'video', 1, 1, 'video', '100', ''),
(41, NULL, '2020-08-01 03:30:39', '2020-08-01 03:30:39', 'sound', 1, 1, 'audio', '100', ''),
(42, NULL, '2020-08-01 03:31:16', '2020-08-01 03:31:16', 'text/image', 1, 1, 'text', '100', ''),
(43, NULL, '2020-08-01 03:31:39', '2020-08-01 03:32:21', 'text/image', 1, 1, 'image', '100', ''),
(44, NULL, '2020-08-01 03:33:00', '2020-08-01 03:33:00', 'simulation', 1, 1, 'application', '100', ''),
(45, NULL, '2020-08-01 03:33:36', '2020-08-01 03:33:36', 'simulation', 1, 1, 'example', '100', ''),
(46, NULL, '2020-08-01 03:34:42', '2020-08-01 03:34:42', 'English', 4, 11, 'en', '100', ''),
(47, NULL, '2020-08-01 03:35:11', '2020-08-01 03:35:11', 'Romanian', 4, 11, 'ro', '100', ''),
(48, NULL, '2020-08-01 03:36:57', '2020-08-01 03:36:57', 'global', 2, 2, 'hierarchical', '100', ''),
(49, NULL, '2020-08-01 03:38:13', '2020-08-01 03:38:13', 'beginner', 3, 15, 'very easy', '100', ''),
(50, NULL, '2020-08-01 03:39:27', '2020-08-01 03:39:27', 'beginner', 3, 15, 'easy', '80', ''),
(51, NULL, '2020-08-01 03:40:19', '2020-08-01 03:40:19', 'intermediate', 3, 15, 'medium', '100', ''),
(52, NULL, '2020-08-01 03:40:56', '2020-08-01 03:42:07', 'advanced', 3, 15, 'difficult', '100', ''),
(53, NULL, '2020-08-01 03:41:48', '2020-08-01 03:41:48', 'advanced', 3, 15, 'very difficult', '100', ''),
(54, NULL, '2020-08-01 03:43:19', '2020-08-01 03:43:19', 'breadth-first', 6, 2, 'hierarchical', '100', ''),
(55, NULL, '2020-08-01 03:44:30', '2020-08-01 03:44:30', 'depth-first', 6, 2, 'hierarchical', '100', ''),
(56, NULL, '2020-08-01 03:45:44', '2020-08-01 03:45:44', 'low', 5, 16, 'very low', '100', ''),
(57, NULL, '2020-08-01 03:46:47', '2020-08-01 03:46:47', 'low', 5, 16, 'low', '100', ''),
(58, NULL, '2020-08-01 03:47:53', '2020-08-01 03:47:53', 'moderate', 5, 16, 'medium', '100', ''),
(59, NULL, '2020-08-01 03:48:36', '2020-08-01 03:48:36', 'high', 5, 16, 'high', '100', ''),
(60, NULL, '2020-08-01 03:49:05', '2020-08-01 03:49:05', 'high', 5, 16, 'very high', '100', ''),
(61, NULL, '2020-08-01 03:50:02', '2020-08-01 03:50:57', 'objectivist', 7, 17, 'educational objective', '100', ''),
(62, NULL, '2020-08-01 03:51:55', '2020-08-01 03:51:55', 'competencies_based', 7, 17, 'competency', '100', '');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `course_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `rating` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `deleted_at`, `created_at`, `updated_at`, `course_id`, `user_id`, `rating`) VALUES
(3, NULL, '2020-08-01 09:27:55', '2020-08-01 09:27:55', 1, 3, 0),
(4, NULL, '2020-08-01 11:16:27', '2020-08-01 11:19:55', 2, 3, 5),
(5, NULL, '2020-08-01 12:29:14', '2020-08-01 12:29:14', 1, 1, 0),
(6, NULL, '2020-08-02 17:15:56', '2020-08-02 17:15:56', 2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `la_configs`
--

CREATE TABLE `la_configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `section` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `la_configs`
--

INSERT INTO `la_configs` (`id`, `key`, `section`, `value`, `created_at`, `updated_at`) VALUES
(1, 'sitename', '', 'LaraAdmin 1.0', '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(2, 'sitename_part1', '', 'Lara', '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(3, 'sitename_part2', '', 'Admin 1.0', '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(4, 'sitename_short', '', 'LA', '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(5, 'site_description', '', 'LaraAdmin is a open-source Laravel Admin Panel for quick-start Admin based applications and boilerplate for CRM or CMS systems.', '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(6, 'sidebar_search', '', '1', '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(7, 'show_messages', '', '1', '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(8, 'show_notifications', '', '1', '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(9, 'show_tasks', '', '1', '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(10, 'show_rightsidebar', '', '1', '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(11, 'skin', '', 'skin-white', '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(12, 'layout', '', 'fixed', '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(13, 'default_email', '', 'test@example.com', '2020-07-04 21:46:18', '2020-07-04 21:46:18');

-- --------------------------------------------------------

--
-- Table structure for table `la_menus`
--

CREATE TABLE `la_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'module',
  `parent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `hierarchy` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `la_menus`
--

INSERT INTO `la_menus` (`id`, `name`, `url`, `icon`, `type`, `parent`, `hierarchy`, `created_at`, `updated_at`) VALUES
(1, 'Team', '#', 'fa-group', 'custom', 0, 7, '2020-07-04 21:46:15', '2020-08-01 07:28:08'),
(2, 'Users', 'users', 'fa-group', 'module', 1, 1, '2020-07-04 21:46:15', '2020-07-09 13:14:15'),
(3, 'Uploads', 'uploads', 'fa-files-o', 'module', 0, 6, '2020-07-04 21:46:15', '2020-08-01 07:27:39'),
(6, 'Roles', 'roles', 'fa-user-plus', 'module', 1, 2, '2020-07-04 21:46:15', '2020-07-09 13:14:15'),
(8, 'Permissions', 'permissions', 'fa-magic', 'module', 1, 3, '2020-07-04 21:46:15', '2020-07-09 13:14:15'),
(9, 'Courses', 'courses', 'fa fa-folder-open', 'module', 22, 1, '2020-07-05 06:52:34', '2020-08-01 07:27:39'),
(10, 'Lessons', 'lessons', 'fa fa-file', 'module', 22, 2, '2020-07-05 11:51:57', '2020-08-01 07:27:42'),
(11, 'Learning_Objects', 'learning_objects', 'fa fa-file-o', 'module', 22, 3, '2020-07-08 04:19:38', '2020-08-01 07:27:49'),
(12, 'Data_Elements', 'data_elements', 'fa fa-cube', 'module', 24, 2, '2020-07-08 04:27:10', '2020-08-01 07:28:04'),
(15, 'P_Parameters', 'p_parameters', 'fa fa-cube', 'module', 24, 1, '2020-07-09 13:06:07', '2020-08-01 07:27:58'),
(19, 'DElement_PParameters', 'delement_pparameters', 'fa fa-cube', 'module', 24, 3, '2020-07-10 12:30:31', '2020-08-01 07:28:08'),
(20, 'Quizzes', 'quizzes', 'fa fa-list-alt', 'module', 0, 5, '2020-07-15 11:32:27', '2020-08-01 07:27:39'),
(21, 'Questions', 'questions', 'fa fa-superscript', 'module', 0, 4, '2020-07-20 07:05:46', '2020-08-01 07:27:39'),
(22, 'Courses', 'http://', 'fa-cube', 'custom', 0, 2, '2020-08-01 07:26:24', '2020-08-01 07:28:18'),
(23, 'Users', 'users', 'fa-group', 'module', 0, 1, '2020-08-01 07:26:37', '2020-08-01 07:28:15'),
(24, 'Parameters', '#', 'fa-cube', 'custom', 0, 3, '2020-08-01 07:27:17', '2020-08-01 07:28:18');

-- --------------------------------------------------------

--
-- Table structure for table `learning_objects`
--

CREATE TABLE `learning_objects` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lo_title` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `file` int(11) NOT NULL DEFAULT 0,
  `lesson_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `concept` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `learning_objects`
--

INSERT INTO `learning_objects` (`id`, `deleted_at`, `created_at`, `updated_at`, `lo_title`, `file`, `lesson_id`, `concept`) VALUES
(1, NULL, '2020-07-08 05:09:17', '2020-07-13 05:56:08', 'LO1', 3, 2, 'a'),
(2, NULL, '2020-07-13 12:44:58', '2020-07-13 12:44:58', 'LO2', 3, 1, 'b'),
(3, NULL, '2020-08-01 07:30:00', '2020-08-01 07:30:00', 'LO3', 6, 1, 'c'),
(4, '2020-08-02 17:35:42', NULL, '2020-08-02 17:35:42', 'LO4', 6, 3, 'The Motivation & Applications of Machine Learning'),
(5, NULL, NULL, NULL, 'LO4', 6, 3, 'The Motivation & Applications of Machine Learning'),
(6, NULL, NULL, NULL, 'LO5', 6, 3, 'The Motivation & Applications of Machine Learning'),
(7, NULL, NULL, NULL, 'LO6', 6, 3, 'The Logistics of the Class'),
(8, NULL, NULL, NULL, 'LO7', 3, 3, 'The Logistics of the Class'),
(9, NULL, NULL, NULL, 'LO8', 3, 3, 'The Definition of Machine Learning'),
(10, NULL, NULL, NULL, 'LO9', 3, 3, 'The Definition of Machine Learning'),
(11, NULL, NULL, NULL, 'LO10', 6, 3, 'The Overview of Supervised Learning'),
(12, NULL, NULL, NULL, 'LO11', 3, 3, 'The Overview of Supervised Learning'),
(13, NULL, NULL, NULL, 'LO12', 3, 3, 'The Overview of Learning Theory'),
(14, NULL, NULL, NULL, 'LO13', 3, 3, 'The Overview of Learning Theory'),
(15, NULL, NULL, NULL, 'LO14', 3, 3, 'The Overview of Learning Theory'),
(16, NULL, NULL, NULL, 'LO15', 6, 3, 'The Overview of Unsupervised Learning'),
(17, NULL, NULL, NULL, 'LO16', 3, 3, 'The Overview of Unsupervised Learning'),
(18, NULL, NULL, NULL, 'LO17', 6, 3, 'The Overview of Reinforcement Learning'),
(19, NULL, NULL, '2020-08-02 17:34:45', 'LO18', 1, 3, 'The Overview of Reinforcement Learning'),
(20, NULL, NULL, '2020-08-02 17:35:05', 'LO19', 6, 3, 'The Overview of Reinforcement Learning'),
(21, NULL, NULL, NULL, 'LO20', 1, 4, 'An Application of Supervised Learning Autonomous Deriving'),
(22, NULL, NULL, NULL, 'LO21', 1, 4, 'An Application of Supervised Learning Autonomous Deriving'),
(23, NULL, NULL, NULL, 'LO22', 3, 4, 'ALVINN'),
(24, NULL, NULL, NULL, 'LO23', 6, 4, 'ALVINN'),
(25, NULL, NULL, NULL, 'LO24', 1, 4, 'Linear Regression'),
(26, NULL, NULL, NULL, 'LO25', 6, 4, 'Linear Regression'),
(27, NULL, NULL, NULL, 'LO26', 1, 4, 'Gradient Descent'),
(28, NULL, NULL, NULL, 'LO27', 3, 4, 'Gradient Descent'),
(29, NULL, NULL, NULL, 'LO28', 6, 4, 'Batch Gradient Descent'),
(30, NULL, NULL, NULL, 'LO29', 1, 4, 'Batch Gradient Descent'),
(31, NULL, NULL, NULL, 'LO30', 6, 4, 'Stochastic Gradient Descent (Incremental Descent)'),
(32, NULL, NULL, NULL, 'LO31', 3, 4, 'Stochastic Gradient Descent (Incremental Descent)'),
(33, NULL, NULL, NULL, 'LO32', 1, 4, 'Matrix Derivative Notation for Deriving Normal Equations'),
(34, NULL, NULL, NULL, 'LO33', 6, 4, 'Matrix Derivative Notation for Deriving Normal Equations'),
(35, NULL, NULL, NULL, 'LO34', 3, 4, 'Derivation of Normal Equations'),
(36, NULL, NULL, NULL, 'LO35', 1, 4, 'Derivation of Normal Equations');

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lesson_title` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `description` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `lesson_image` int(11) NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `full_text` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `deleted_at`, `created_at`, `updated_at`, `lesson_title`, `course_id`, `description`, `published`, `lesson_image`, `position`, `full_text`) VALUES
(1, NULL, '2020-07-05 11:52:56', '2020-08-02 17:12:59', 'Introduction', 1, 'This is an introduction to machine Learning', 1, 2, 1, 'The standard Lorem Ipsum passage, used since the 1500s\r\n\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\nSection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n'),
(2, NULL, '2020-07-05 11:54:03', '2020-08-01 15:42:31', 'SupervisedLearning', 1, 'This is the lessons for supervised learning', 1, 2, 2, 'Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"'),
(3, NULL, '2020-08-02 17:14:45', '2020-08-02 17:18:20', 'FirstLesson', 2, 'This is the first lesson for Databases taken by Professor', 1, 1, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(4, NULL, '2020-08-02 17:15:30', '2020-08-02 17:17:51', 'SecondLesson', 2, 'This is the second lesson taken by Professor on Databases', 1, 2, 2, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).');

-- --------------------------------------------------------

--
-- Table structure for table `lesson_students`
--

CREATE TABLE `lesson_students` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lesson_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lesson_students`
--

INSERT INTO `lesson_students` (`id`, `deleted_at`, `created_at`, `updated_at`, `lesson_id`, `user_id`) VALUES
(1, NULL, '2020-08-01 13:37:42', '2020-08-01 13:37:42', 1, 1),
(2, NULL, '2020-08-01 13:49:30', '2020-08-01 13:49:30', 2, 1),
(3, NULL, '2020-08-02 17:18:43', '2020-08-02 17:18:43', 3, 1),
(4, NULL, '2020-09-01 07:48:06', '2020-09-01 07:48:06', 4, 1),
(5, NULL, '2020-09-02 08:43:43', '2020-09-02 08:43:43', 1, 3),
(6, NULL, '2020-09-02 13:15:23', '2020-09-02 13:15:23', 2, 3),
(7, NULL, '2020-09-02 13:27:52', '2020-09-02 13:27:52', 3, 3),
(8, NULL, '2020-09-02 13:31:08', '2020-09-02 13:31:08', 4, 3),
(9, NULL, '2020-09-02 14:16:22', '2020-09-02 14:16:22', 1, 2),
(10, NULL, '2020-09-02 14:16:49', '2020-09-02 14:16:49', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `lo_properties`
--

CREATE TABLE `lo_properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lo` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `language` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `interactivity_type` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `interactivity_level` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `resource_type` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `format` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `structure` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `difficulty` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `semantic_density` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `purpose` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lo_properties`
--

INSERT INTO `lo_properties` (`id`, `deleted_at`, `created_at`, `updated_at`, `lo`, `language`, `interactivity_type`, `interactivity_level`, `resource_type`, `format`, `structure`, `difficulty`, `semantic_density`, `purpose`) VALUES
(10, NULL, NULL, NULL, 1, 'en', 'active', 'medium', 'diagram', 'video', 'linear', 'very easy', 'very low', 'educational objective'),
(11, NULL, NULL, NULL, 2, 'en', 'active', 'high', 'lecture', 'video', 'linear', 'difficult', 'very low', 'educational objective'),
(12, NULL, NULL, NULL, 4, 'en', 'active', 'high', 'lecture', 'video', 'linear', 'easy', 'very low', 'educational objective'),
(13, NULL, NULL, NULL, 5, 'en', 'expositive', 'high', 'narrative text', 'text', 'linear', 'difficult', 'high', 'educational objective'),
(14, NULL, NULL, NULL, 6, 'en', 'active', 'high', 'lecture', 'video', 'linear', 'very difficult', 'very high', 'educational objective'),
(15, NULL, NULL, NULL, 7, 'en', 'expositive', 'high', 'narrative text', 'text', 'linear', 'medium', 'medium', 'educational objective'),
(16, NULL, NULL, NULL, 8, 'en', 'active', 'high', 'simulation', 'video', 'linear', 'difficult', 'high', 'educational objective'),
(17, NULL, NULL, NULL, 9, 'en', 'expositive', 'high', 'narrative text', 'text', 'hierarchical', 'difficult', 'high', 'educational objective'),
(18, NULL, NULL, NULL, 10, 'en', 'active', 'high', 'lecture', 'video', 'linear', 'difficult', 'high', 'competency'),
(19, NULL, NULL, NULL, 11, 'en', 'expositive', 'high', 'narrative text', 'text', 'linear', 'difficult', 'high', 'educational objective'),
(20, NULL, NULL, NULL, 12, 'en', 'expositive', 'high', 'narrative text', 'text', 'linear', 'medium', 'medium', 'educational objective'),
(21, NULL, NULL, NULL, 13, 'en', 'active', 'high', 'lecture', 'video', 'linear', 'easy', 'very low', 'educational objective'),
(22, NULL, NULL, NULL, 14, 'en', 'active', 'high', 'lecture', 'video', 'linear', 'difficult', 'high', 'educational objective'),
(23, NULL, NULL, NULL, 15, 'en', 'expositive', 'high', 'narrative text', 'text', 'linear', 'difficult', 'high', 'educational objective'),
(24, NULL, NULL, NULL, 16, 'en', 'active', 'high', 'lecture', 'video', 'linear', 'medium', 'medium', 'educational objective'),
(25, NULL, NULL, NULL, 17, 'en', 'active', 'high', 'lecture', 'video', 'linear', 'difficult', 'high', 'competency'),
(26, NULL, NULL, NULL, 18, 'en', 'expositive', 'high', 'simulation', 'video', 'linear', 'difficult', 'high', 'educational objective'),
(27, NULL, NULL, NULL, 19, 'en', 'active', 'high', 'lecture', 'video', 'linear', 'difficult', 'high', 'educational objective'),
(28, NULL, NULL, NULL, 20, 'en', 'active', 'high', 'lecture', 'video', 'hierarchical', 'difficult', 'high', 'educational objective'),
(29, NULL, NULL, NULL, 21, 'en', 'expositive', 'high', 'narrative text', 'text', 'hierarchical', 'difficult', 'high', 'competency'),
(30, NULL, NULL, NULL, 22, 'en', 'active', 'high', 'lecture', 'video', 'linear', 'difficult', 'high', 'educational objective'),
(31, NULL, NULL, NULL, 23, 'en', 'expositive', 'high', 'narrative text', 'text', 'linear', 'difficult', 'high', 'educational objective'),
(32, NULL, NULL, NULL, 24, 'en', 'expositive', 'high', 'lecture', 'video', 'linear', 'easy', 'very low', 'competency'),
(33, NULL, NULL, NULL, 25, 'en', 'expositive', 'high', 'narrative text', 'text', 'linear', 'difficult', 'high', 'educational objective'),
(34, NULL, NULL, NULL, 26, 'en', 'active', 'high', 'lecture', 'video', 'linear', 'difficult', 'high', 'educational objective'),
(35, NULL, NULL, NULL, 27, 'en', 'active', 'high', 'lecture', 'video', 'linear', 'medium', 'medium', 'educational objective'),
(36, NULL, NULL, NULL, 28, 'en', 'active', 'high', 'lecture', 'video', 'linear', 'difficult', 'high', 'educational objective'),
(37, NULL, NULL, NULL, 29, 'en', 'active', 'high', 'lecture', 'video', 'linear', 'very difficult', 'very high', 'competency'),
(38, NULL, NULL, NULL, 30, 'en', 'expositive', 'high', 'simulation', 'video', 'linear', 'very difficult', 'very low', 'educational objective'),
(39, NULL, NULL, NULL, 31, 'en', 'active', 'high', 'lecture', 'video', 'linear', 'medium', 'medium', 'educational objective'),
(40, NULL, NULL, NULL, 32, 'en', 'expositive', 'high', 'narrative text', 'text', 'hierarchical', 'medium', 'medium', 'educational objective'),
(41, NULL, NULL, NULL, 33, 'en', 'expositive', 'high', 'narrative text', 'text', 'linear', 'difficult', 'high', 'competency'),
(42, NULL, NULL, NULL, 34, 'en', 'active', 'high', 'lecture', 'video', 'linear', 'very difficult', 'very high', 'competency');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_05_26_050000_create_modules_table', 1),
('2014_05_26_055000_create_module_field_types_table', 1),
('2014_05_26_060000_create_module_fields_table', 1),
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2014_12_01_000000_create_uploads_table', 1),
('2016_05_26_064006_create_departments_table', 1),
('2016_05_26_064007_create_employees_table', 1),
('2016_05_26_064446_create_roles_table', 1),
('2016_07_05_115343_create_role_user_table', 1),
('2016_07_06_140637_create_organizations_table', 1),
('2016_07_07_134058_create_backups_table', 1),
('2016_07_07_134058_create_menus_table', 1),
('2016_09_10_163337_create_permissions_table', 1),
('2016_09_10_163520_create_permission_role_table', 1),
('2016_09_22_105958_role_module_fields_table', 1),
('2016_09_22_110008_role_module_table', 1),
('2016_10_06_115413_create_la_configs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_db` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `view_col` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fa_icon` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `is_gen` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `label`, `name_db`, `view_col`, `model`, `controller`, `fa_icon`, `is_gen`, `created_at`, `updated_at`) VALUES
(1, 'Users', 'Users', 'users', 'name', 'User', 'UsersController', 'fa-group', 1, '2020-07-04 21:46:10', '2020-07-04 21:46:18'),
(2, 'Uploads', 'Uploads', 'uploads', 'name', 'Upload', 'UploadsController', 'fa-files-o', 1, '2020-07-04 21:46:10', '2020-07-04 21:46:18'),
(5, 'Roles', 'Roles', 'roles', 'name', 'Role', 'RolesController', 'fa-user-plus', 1, '2020-07-04 21:46:11', '2020-07-04 21:46:18'),
(7, 'Backups', 'Backups', 'backups', 'name', 'Backup', 'BackupsController', 'fa-hdd-o', 1, '2020-07-04 21:46:13', '2020-07-04 21:46:18'),
(8, 'Permissions', 'Permissions', 'permissions', 'name', 'Permission', 'PermissionsController', 'fa-magic', 1, '2020-07-04 21:46:14', '2020-07-04 21:46:18'),
(9, 'Courses', 'Courses', 'courses', 'course_title', 'Course', 'CoursesController', 'fa-folder-open', 1, '2020-07-05 06:50:30', '2020-07-05 06:52:34'),
(10, 'Lessons', 'Lessons', 'lessons', 'lesson_title', 'Lesson', 'LessonsController', 'fa-file', 1, '2020-07-05 11:48:18', '2020-07-05 11:51:58'),
(11, 'Enrollments', 'Enrollments', 'enrollments', 'student', 'Enrollment', 'EnrollmentsController', 'fa-cube', 0, '2020-07-06 20:54:13', '2020-07-06 20:55:33'),
(13, 'Learning_Objects', 'Learning_Objects', 'learning_objects', 'lo_title', 'Learning_Object', 'Learning_ObjectsController', 'fa-file-o', 1, '2020-07-06 21:19:25', '2020-07-08 04:19:38'),
(14, 'Data_Elements', 'Data_Elements', 'data_elements', 'element_name', 'Data_Element', 'Data_ElementsController', 'fa-cube', 1, '2020-07-08 04:21:16', '2020-07-09 13:43:32'),
(18, 'P_Parameters', 'P_Parameters', 'p_parameters', 'parameter', 'P_Parameter', 'P_ParametersController', 'fa-cube', 1, '2020-07-09 13:05:35', '2020-07-09 13:06:07'),
(19, 'DElement_PParameters', 'DElement_PParameters', 'delement_pparameters', 'linguistic_term', 'DElement_PParameter', 'DElement_PParametersController', 'fa-cube', 1, '2020-07-09 13:45:24', '2020-07-10 12:30:31'),
(21, 'LO_Properties', 'LO_Properties', 'lo_properties', 'lo', 'LO_Property', 'LO_PropertiesController', 'fa-cube', 0, '2020-07-14 08:19:31', '2020-07-14 08:21:37'),
(22, 'Quizzes', 'Quizzes', 'quizzes', 'title', 'Quiz', 'QuizzesController', 'fa-list-alt', 1, '2020-07-15 11:30:26', '2020-07-15 11:32:27'),
(23, 'Questions', 'Questions', 'questions', 'question', 'Question', 'QuestionsController', 'fa-superscript', 1, '2020-07-15 11:36:20', '2020-07-20 07:05:46'),
(24, 'Test_Results', 'Test_Results', 'test_results', '', 'Test_Result', 'Test_ResultsController', 'fa-tasks', 0, '2020-07-20 08:18:36', '2020-07-20 08:18:36'),
(27, 'Lesson_Students', 'Lesson_Students', 'lesson_students', '', 'Lesson_Student', 'Lesson_StudentsController', 'fa-cube', 0, '2020-08-01 13:33:12', '2020-08-01 13:33:12'),
(28, 'User_Preferences', 'User_Preferences', 'user_preferences', '', 'User_Preference', 'User_PreferencesController', 'fa-barcode', 0, '2020-08-02 15:37:16', '2020-08-02 15:37:16'),
(29, 'User_Course_Values', 'User_Course_Values', 'user_course_values', '', 'User_Course_Value', 'User_Course_ValuesController', 'fa-arrows-alt', 0, '2020-08-02 16:04:02', '2020-08-02 16:04:02');

-- --------------------------------------------------------

--
-- Table structure for table `module_fields`
--

CREATE TABLE `module_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `colname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `module` int(10) UNSIGNED NOT NULL,
  `field_type` int(10) UNSIGNED NOT NULL,
  `unique` tinyint(1) NOT NULL DEFAULT 0,
  `defaultvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `minlength` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `maxlength` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `popup_vals` text COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `module_fields`
--

INSERT INTO `module_fields` (`id`, `colname`, `label`, `module`, `field_type`, `unique`, `defaultvalue`, `minlength`, `maxlength`, `required`, `popup_vals`, `sort`, `created_at`, `updated_at`) VALUES
(1, 'name', 'Name', 1, 16, 0, '', 5, 250, 1, '', 0, '2020-07-04 21:46:10', '2020-07-04 21:46:10'),
(2, 'context_id', 'Context', 1, 13, 0, '0', 0, 0, 0, '', 0, '2020-07-04 21:46:10', '2020-07-04 21:46:10'),
(3, 'email', 'Email', 1, 8, 1, '', 0, 250, 0, '', 0, '2020-07-04 21:46:10', '2020-07-04 21:46:10'),
(4, 'password', 'Password', 1, 17, 0, '', 6, 250, 1, '', 0, '2020-07-04 21:46:10', '2020-07-04 21:46:10'),
(6, 'name', 'Name', 2, 16, 0, '', 5, 250, 1, '', 0, '2020-07-04 21:46:10', '2020-07-04 21:46:10'),
(7, 'path', 'Path', 2, 19, 0, '', 0, 250, 0, '', 0, '2020-07-04 21:46:10', '2020-07-04 21:46:10'),
(8, 'extension', 'Extension', 2, 19, 0, '', 0, 20, 0, '', 0, '2020-07-04 21:46:10', '2020-07-04 21:46:10'),
(9, 'caption', 'Caption', 2, 19, 0, '', 0, 250, 0, '', 0, '2020-07-04 21:46:10', '2020-07-04 21:46:10'),
(10, 'user_id', 'Owner', 2, 7, 0, '1', 0, 0, 0, '@users', 0, '2020-07-04 21:46:10', '2020-07-04 21:46:10'),
(11, 'hash', 'Hash', 2, 19, 0, '', 0, 250, 0, '', 0, '2020-07-04 21:46:10', '2020-07-04 21:46:10'),
(12, 'public', 'Is Public', 2, 2, 0, '0', 0, 0, 0, '', 0, '2020-07-04 21:46:10', '2020-07-04 21:46:10'),
(30, 'name', 'Name', 5, 16, 1, '', 1, 250, 1, '', 0, '2020-07-04 21:46:11', '2020-07-04 21:46:11'),
(31, 'display_name', 'Display Name', 5, 19, 0, '', 0, 250, 1, '', 0, '2020-07-04 21:46:11', '2020-07-04 21:46:11'),
(32, 'description', 'Description', 5, 21, 0, '', 0, 1000, 0, '', 0, '2020-07-04 21:46:11', '2020-07-04 21:46:11'),
(33, 'parent', 'Parent Role', 5, 7, 0, '1', 0, 0, 0, '@roles', 0, '2020-07-04 21:46:11', '2020-07-04 21:46:11'),
(46, 'name', 'Name', 7, 16, 1, '', 0, 250, 1, '', 0, '2020-07-04 21:46:13', '2020-07-04 21:46:13'),
(47, 'file_name', 'File Name', 7, 19, 1, '', 0, 250, 1, '', 0, '2020-07-04 21:46:13', '2020-07-04 21:46:13'),
(48, 'backup_size', 'File Size', 7, 19, 0, '0', 0, 10, 1, '', 0, '2020-07-04 21:46:13', '2020-07-04 21:46:13'),
(49, 'name', 'Name', 8, 16, 1, '', 1, 250, 1, '', 0, '2020-07-04 21:46:14', '2020-07-04 21:46:14'),
(50, 'display_name', 'Display Name', 8, 19, 0, '', 0, 250, 1, '', 0, '2020-07-04 21:46:14', '2020-07-04 21:46:14'),
(51, 'description', 'Description', 8, 21, 0, '', 0, 1000, 0, '', 0, '2020-07-04 21:46:14', '2020-07-04 21:46:14'),
(52, 'course_title', 'Course Title', 9, 19, 1, '', 0, 256, 1, '', 0, '2020-07-05 06:51:06', '2020-07-05 06:51:06'),
(53, 'description', 'Description', 9, 22, 0, '', 0, 256, 0, '', 0, '2020-07-05 06:51:35', '2020-07-05 06:51:35'),
(54, 'start_date', 'Start Date', 9, 4, 0, '', 0, 0, 0, '', 0, '2020-07-05 06:51:52', '2020-07-05 06:51:52'),
(55, 'published', 'Published', 9, 2, 0, '', 0, 0, 0, '', 0, '2020-07-05 06:52:11', '2020-07-05 06:52:11'),
(56, 'type', 'Type', 1, 7, 0, '', 0, 0, 0, '@roles', 0, '2020-07-05 07:12:28', '2020-07-05 07:12:28'),
(57, 'lesson_title', 'Lesson Title', 10, 19, 0, '', 0, 256, 1, '', 0, '2020-07-05 11:48:54', '2020-07-05 11:48:54'),
(58, 'course_id', 'Course', 10, 7, 0, '', 0, 0, 0, '@courses', 0, '2020-07-05 11:49:24', '2020-07-27 05:09:10'),
(59, 'description', 'Description', 10, 22, 0, '', 0, 256, 0, '', 0, '2020-07-05 11:49:56', '2020-07-05 11:49:56'),
(60, 'published', 'Published', 10, 2, 0, '', 0, 0, 0, '', 0, '2020-07-05 11:50:25', '2020-07-05 11:50:25'),
(61, 'lesson_image', 'Lesson Image', 10, 12, 0, '', 0, 0, 0, '', 0, '2020-07-05 11:50:58', '2020-07-05 11:50:58'),
(62, 'course_id', 'Course', 11, 7, 0, '', 0, 0, 0, '@courses', 0, '2020-07-06 20:54:47', '2020-07-27 11:29:55'),
(63, 'user_id', 'Student', 11, 7, 0, '', 0, 0, 0, '@users', 0, '2020-07-06 20:55:12', '2020-07-27 11:30:27'),
(64, 'rating', 'Rating', 11, 13, 0, '', 0, 11, 0, '', 0, '2020-07-06 20:58:44', '2020-07-06 20:58:44'),
(66, 'lo_title', 'LO Title', 13, 19, 1, '', 0, 256, 1, '', 2, '2020-07-06 21:20:14', '2020-07-06 21:20:14'),
(70, 'file', 'File', 13, 9, 0, '', 0, 0, 1, '', 4, '2020-07-08 04:17:35', '2020-07-08 04:17:35'),
(71, 'element_nr', 'Element Nr.', 14, 6, 0, '', 0, 11, 1, '', 0, '2020-07-08 04:22:25', '2020-07-09 12:28:56'),
(72, 'element_name', 'Element Name', 14, 19, 0, '', 0, 256, 1, '', 0, '2020-07-08 04:23:24', '2020-07-08 04:23:24'),
(81, 'parameter', 'Parameter', 18, 19, 1, '', 0, 256, 1, '', 0, '2020-07-09 13:05:58', '2020-07-09 13:05:58'),
(82, 'linguistic_term', 'Linguistic Term', 19, 19, 0, '', 0, 256, 1, '', 1, '2020-07-09 13:47:41', '2020-07-09 13:47:41'),
(83, 'parameter', 'Parameter', 19, 7, 0, '', 0, 0, 1, '@p_parameters', 2, '2020-07-09 13:48:21', '2020-07-09 13:48:21'),
(84, 'data_element', 'Data Element', 19, 7, 0, '', 0, 0, 1, '@data_elements', 3, '2020-07-09 13:55:24', '2020-07-09 13:55:24'),
(85, 'metadata_value', 'Metadata Value', 19, 19, 0, '', 0, 256, 1, '', 4, '2020-07-09 13:56:11', '2020-07-09 13:56:11'),
(86, 'degree', 'Degree', 19, 7, 0, '100', 0, 0, 0, '[\"20\",\"40\",\"60\",\"80\",\"100\"]', 6, '2020-07-09 13:56:55', '2020-08-02 10:10:10'),
(87, 'lesson_id', 'Lesson', 13, 7, 0, '', 0, 0, 0, '@lessons', 1, '2020-07-13 05:55:09', '2020-08-01 19:29:39'),
(91, 'lo', 'Learning Object', 21, 7, 0, '', 0, 0, 0, '@learning_objects', 0, '2020-07-14 08:20:50', '2020-07-14 08:20:50'),
(92, 'language', 'Language', 21, 19, 0, '', 0, 256, 0, '', 0, '2020-07-14 08:21:23', '2020-07-14 08:21:23'),
(93, 'title', 'Title', 22, 19, 1, '', 0, 256, 1, '', 0, '2020-07-15 11:31:14', '2020-07-15 11:31:14'),
(94, 'description', 'Description', 22, 21, 0, '', 0, 0, 0, '', 0, '2020-07-15 11:31:47', '2020-07-15 11:31:47'),
(95, 'published', 'Published', 22, 2, 0, '', 0, 0, 0, '', 0, '2020-07-15 11:32:15', '2020-07-15 11:32:15'),
(96, 'question', 'Question', 23, 19, 1, '', 0, 256, 1, '', 0, '2020-07-15 11:37:08', '2020-07-15 11:37:08'),
(97, 'score', 'Score', 23, 13, 0, '', 0, 11, 0, '', 0, '2020-07-15 11:37:52', '2020-07-15 11:37:52'),
(98, 'position', 'Position', 10, 13, 0, '1', 0, 11, 0, '', 0, '2020-07-27 05:15:12', '2020-07-27 05:15:12'),
(102, 'interactivity_level', 'Interactivity Level', 19, 7, 0, '', 0, 0, 0, '[\"low\",\"very low\",\"medium\",\"high\",\"very high\",\"-\"]', 5, '2020-08-01 02:39:50', '2020-08-01 03:17:50'),
(103, 'interactivity_type', 'Interactivity Type', 21, 19, 0, '', 0, 256, 0, '', 0, '2020-08-01 06:41:52', '2020-08-01 06:41:52'),
(104, 'interactivity_level', 'Interactivity Level', 21, 19, 0, '', 0, 256, 0, '', 0, '2020-08-01 06:53:49', '2020-08-01 06:53:49'),
(105, 'resource_type', 'Resource Type', 21, 19, 0, '', 0, 256, 0, '', 0, '2020-08-01 06:58:21', '2020-08-01 06:58:21'),
(106, 'format', 'Format', 21, 19, 0, '', 0, 256, 0, '', 0, '2020-08-01 06:59:34', '2020-08-01 06:59:34'),
(107, 'structure', 'Structure', 21, 19, 0, '', 0, 256, 0, '', 0, '2020-08-01 07:01:04', '2020-08-01 07:01:21'),
(108, 'difficulty', 'Difficulty', 21, 19, 0, '', 0, 256, 0, '', 0, '2020-08-01 07:01:39', '2020-08-01 07:01:51'),
(109, 'semantic_density', 'Semantic Density', 21, 19, 0, '', 0, 256, 0, '', 0, '2020-08-01 07:02:16', '2020-08-01 07:02:16'),
(110, 'purpose', 'Purpose', 21, 19, 0, '', 0, 256, 0, '', 0, '2020-08-01 07:03:19', '2020-08-01 07:03:19'),
(113, 'lesson_id', 'Lesson', 27, 7, 0, '', 0, 0, 0, '@lessons', 0, '2020-08-01 13:33:40', '2020-08-01 13:33:40'),
(114, 'user_id', 'Student', 27, 7, 0, '', 0, 0, 0, '@users', 0, '2020-08-01 13:34:49', '2020-08-01 13:34:49'),
(115, 'full_text', 'Full Text', 10, 21, 0, '', 0, 0, 0, '', 0, '2020-08-01 15:36:59', '2020-08-01 15:36:59'),
(116, 'user_id', 'User', 28, 7, 0, '', 0, 0, 0, '@users', 0, '2020-08-02 15:38:32', '2020-08-02 15:38:32'),
(117, 'ar_fsls', 'AR_FSLS', 28, 19, 0, '', 0, 256, 0, '', 0, '2020-08-02 15:39:37', '2020-08-02 15:39:37'),
(118, 'ar_fsls_degree', 'AR FSLS Degree', 28, 13, 0, '', 0, 11, 0, '', 0, '2020-08-02 15:40:01', '2020-08-02 15:40:01'),
(119, 'vv_fsls', 'VV_FSLS', 28, 19, 0, '', 0, 256, 0, '', 0, '2020-08-02 15:40:53', '2020-08-02 15:40:53'),
(120, 'sg_fsls', 'SG_FSLS', 28, 19, 0, '', 0, 256, 0, '', 0, '2020-08-02 15:43:21', '2020-08-02 15:43:21'),
(121, 'ar_honey_mumford', 'AR Honey-Mumford', 28, 19, 0, '', 0, 256, 0, '', 0, '2020-08-02 15:44:13', '2020-08-02 15:45:17'),
(122, 'ar_hm_degree', 'AR HM Degree', 28, 13, 0, '', 0, 11, 0, '', 0, '2020-08-02 15:44:57', '2020-08-02 15:44:57'),
(123, 'media_preference', 'Media Preference', 28, 19, 0, '', 0, 256, 0, '', 0, '2020-08-02 15:46:35', '2020-08-02 15:46:35'),
(124, 'nav_preference', 'Nav Preference', 28, 19, 0, '', 0, 256, 0, '', 0, '2020-08-02 15:47:31', '2020-08-02 15:47:31'),
(125, 'user_id', 'User', 29, 7, 0, '', 0, 0, 0, '@users', 0, '2020-08-02 16:04:37', '2020-08-02 16:04:37'),
(126, 'course_id', 'Course', 29, 7, 0, '', 0, 0, 0, '@courses', 0, '2020-08-02 16:04:59', '2020-08-02 16:04:59'),
(127, 'language', 'Language', 29, 19, 0, '', 0, 256, 0, '', 0, '2020-08-02 16:05:38', '2020-08-02 16:05:38'),
(128, 'level_of_knowledge', 'Level of Knowledge', 29, 19, 0, '', 0, 256, 0, '', 0, '2020-08-02 16:06:10', '2020-08-02 16:06:10'),
(129, 'motivation_level', 'Motivation Level', 29, 19, 0, '', 0, 256, 0, '', 0, '2020-08-02 16:06:38', '2020-08-02 16:06:38'),
(130, 'pedagogical_app', 'Pedagogical App', 29, 19, 0, '', 0, 256, 0, '', 0, '2020-08-02 16:07:23', '2020-08-02 16:07:23'),
(131, 'concept', 'Concept', 13, 19, 0, '', 0, 256, 0, '', 3, '2020-08-02 17:25:28', '2020-08-02 17:25:28');

-- --------------------------------------------------------

--
-- Table structure for table `module_field_types`
--

CREATE TABLE `module_field_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `module_field_types`
--

INSERT INTO `module_field_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Address', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(2, 'Checkbox', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(3, 'Currency', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(4, 'Date', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(5, 'Datetime', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(6, 'Decimal', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(7, 'Dropdown', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(8, 'Email', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(9, 'File', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(10, 'Float', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(11, 'HTML', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(12, 'Image', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(13, 'Integer', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(14, 'Mobile', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(15, 'Multiselect', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(16, 'Name', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(17, 'Password', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(18, 'Radio', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(19, 'String', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(20, 'Taginput', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(21, 'Textarea', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(22, 'TextField', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(23, 'URL', '2020-07-04 21:46:09', '2020-07-04 21:46:09'),
(24, 'Files', '2020-07-04 21:46:09', '2020-07-04 21:46:09');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('admin@admin.com', '9c8282d44192be2a3d6dca0507da5ecaa5b1324ec425257a22ab3360083ef8c7', '2020-07-16 11:57:06'),
('ufuomaapoki@gmail.com', 'f2207c337b75a956c87c237f9eb921e6dcb39cd02cbde84742cc3d6deec91974', '2020-07-20 08:31:52');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN_PANEL', 'Admin Panel', 'Admin Panel Permission', NULL, '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(2, 'Student_Panel', 'Student Panel', 'Panel for Students', NULL, '2020-07-05 07:03:26', '2020-07-05 07:03:26');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `p_parameters`
--

CREATE TABLE `p_parameters` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parameter` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `p_parameters`
--

INSERT INTO `p_parameters` (`id`, `deleted_at`, `created_at`, `updated_at`, `parameter`) VALUES
(1, NULL, '2020-07-09 13:41:36', '2020-07-09 13:41:36', 'Media_Preference'),
(2, NULL, '2020-07-09 13:42:10', '2020-07-09 13:42:10', 'Felder_Silverman_LS'),
(3, NULL, '2020-07-09 13:42:36', '2020-07-09 13:42:36', 'Level_of_knowledge'),
(4, NULL, '2020-07-14 08:14:19', '2020-07-14 08:14:19', 'Language_Preference'),
(5, NULL, '2020-08-01 02:56:16', '2020-08-01 02:56:16', 'Motivation_Level'),
(6, NULL, '2020-08-01 02:56:49', '2020-08-01 02:56:49', 'Navigation_Preference'),
(7, NULL, '2020-08-01 02:57:07', '2020-08-01 02:57:07', 'Pedagogical_Approach'),
(8, NULL, '2020-08-01 02:57:45', '2020-08-01 02:58:22', 'Honey_Mumford_Learning_Style');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `question` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `score` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `parent`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'SUPER_ADMIN', 'Super Admin', 'Full Access Role', 1, NULL, '2020-07-04 21:46:15', '2020-07-04 21:46:15'),
(2, 'Instructor', 'Instructor', 'Users who administer a course', 2, NULL, '2020-07-05 06:53:53', '2020-07-05 06:54:04'),
(3, 'Student', 'Student', 'Users who are enrolled in a course', 3, NULL, '2020-07-05 06:54:24', '2020-07-05 06:54:33');

-- --------------------------------------------------------

--
-- Table structure for table `role_module`
--

CREATE TABLE `role_module` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `module_id` int(10) UNSIGNED NOT NULL,
  `acc_view` tinyint(1) NOT NULL,
  `acc_create` tinyint(1) NOT NULL,
  `acc_edit` tinyint(1) NOT NULL,
  `acc_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_module`
--

INSERT INTO `role_module` (`id`, `role_id`, `module_id`, `acc_view`, `acc_create`, `acc_edit`, `acc_delete`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, 1, '2020-07-04 21:46:15', '2020-07-04 21:46:15'),
(2, 1, 2, 1, 1, 1, 1, '2020-07-04 21:46:15', '2020-07-04 21:46:15'),
(5, 1, 5, 1, 1, 1, 1, '2020-07-04 21:46:17', '2020-07-04 21:46:17'),
(7, 1, 7, 1, 1, 1, 1, '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(8, 1, 8, 1, 1, 1, 1, '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(9, 1, 9, 1, 1, 1, 1, '2020-07-05 06:52:34', '2020-07-05 06:52:34'),
(10, 2, 8, 1, 1, 1, 0, '2020-07-05 07:01:33', '2020-07-05 07:01:33'),
(11, 3, 8, 1, 0, 0, 0, '2020-07-05 07:01:33', '2020-07-05 07:01:33'),
(12, 2, 5, 1, 0, 0, 0, '2020-07-05 07:06:35', '2020-07-05 07:06:35'),
(13, 3, 5, 1, 0, 0, 0, '2020-07-05 07:06:35', '2020-07-05 07:06:35'),
(14, 2, 9, 1, 1, 1, 0, '2020-07-05 07:07:18', '2020-07-05 07:07:18'),
(15, 3, 9, 1, 0, 0, 0, '2020-07-05 07:07:18', '2020-07-05 07:07:18'),
(16, 1, 10, 1, 1, 1, 1, '2020-07-05 11:51:58', '2020-07-05 11:51:58'),
(17, 1, 13, 1, 1, 1, 1, '2020-07-08 04:19:38', '2020-07-08 04:19:38'),
(18, 1, 14, 1, 1, 1, 1, '2020-07-08 04:27:10', '2020-07-08 04:27:10'),
(21, 1, 18, 1, 1, 1, 1, '2020-07-09 13:06:07', '2020-07-09 13:06:07'),
(22, 1, 19, 1, 1, 1, 1, '2020-07-10 12:30:31', '2020-07-10 12:30:31'),
(23, 1, 22, 1, 1, 1, 1, '2020-07-15 11:32:27', '2020-07-15 11:32:27'),
(24, 1, 23, 1, 1, 1, 1, '2020-07-20 07:05:46', '2020-07-20 07:05:46');

-- --------------------------------------------------------

--
-- Table structure for table `role_module_fields`
--

CREATE TABLE `role_module_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED NOT NULL,
  `access` enum('invisible','readonly','write') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_module_fields`
--

INSERT INTO `role_module_fields` (`id`, `role_id`, `field_id`, `access`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'write', '2020-07-04 21:46:15', '2020-07-04 21:46:15'),
(2, 1, 2, 'write', '2020-07-04 21:46:15', '2020-07-04 21:46:15'),
(3, 1, 3, 'write', '2020-07-04 21:46:15', '2020-07-04 21:46:15'),
(4, 1, 4, 'write', '2020-07-04 21:46:15', '2020-07-04 21:46:15'),
(6, 1, 6, 'write', '2020-07-04 21:46:15', '2020-07-04 21:46:15'),
(7, 1, 7, 'write', '2020-07-04 21:46:15', '2020-07-04 21:46:15'),
(8, 1, 8, 'write', '2020-07-04 21:46:15', '2020-07-04 21:46:15'),
(9, 1, 9, 'write', '2020-07-04 21:46:15', '2020-07-04 21:46:15'),
(10, 1, 10, 'write', '2020-07-04 21:46:15', '2020-07-04 21:46:15'),
(11, 1, 11, 'write', '2020-07-04 21:46:15', '2020-07-04 21:46:15'),
(12, 1, 12, 'write', '2020-07-04 21:46:15', '2020-07-04 21:46:15'),
(30, 1, 30, 'write', '2020-07-04 21:46:17', '2020-07-04 21:46:17'),
(31, 1, 31, 'write', '2020-07-04 21:46:17', '2020-07-04 21:46:17'),
(32, 1, 32, 'write', '2020-07-04 21:46:17', '2020-07-04 21:46:17'),
(33, 1, 33, 'write', '2020-07-04 21:46:17', '2020-07-04 21:46:17'),
(46, 1, 46, 'write', '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(47, 1, 47, 'write', '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(48, 1, 48, 'write', '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(49, 1, 49, 'write', '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(50, 1, 50, 'write', '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(51, 1, 51, 'write', '2020-07-04 21:46:18', '2020-07-04 21:46:18'),
(52, 1, 52, 'write', '2020-07-05 06:51:06', '2020-07-05 06:51:06'),
(53, 1, 53, 'write', '2020-07-05 06:51:35', '2020-07-05 06:51:35'),
(54, 1, 54, 'write', '2020-07-05 06:51:52', '2020-07-05 06:51:52'),
(55, 1, 55, 'write', '2020-07-05 06:52:12', '2020-07-05 06:52:12'),
(56, 2, 49, 'invisible', '2020-07-05 07:01:33', '2020-07-05 07:01:33'),
(57, 2, 50, 'invisible', '2020-07-05 07:01:33', '2020-07-05 07:01:33'),
(58, 2, 51, 'invisible', '2020-07-05 07:01:33', '2020-07-05 07:01:33'),
(59, 3, 49, 'invisible', '2020-07-05 07:01:33', '2020-07-05 07:01:33'),
(60, 3, 50, 'invisible', '2020-07-05 07:01:33', '2020-07-05 07:01:33'),
(61, 3, 51, 'invisible', '2020-07-05 07:01:33', '2020-07-05 07:01:33'),
(62, 2, 30, 'invisible', '2020-07-05 07:06:35', '2020-07-05 07:06:35'),
(63, 2, 31, 'invisible', '2020-07-05 07:06:35', '2020-07-05 07:06:35'),
(64, 2, 32, 'invisible', '2020-07-05 07:06:35', '2020-07-05 07:06:35'),
(65, 2, 33, 'invisible', '2020-07-05 07:06:35', '2020-07-05 07:06:35'),
(66, 3, 30, 'invisible', '2020-07-05 07:06:35', '2020-07-05 07:06:35'),
(67, 3, 31, 'invisible', '2020-07-05 07:06:35', '2020-07-05 07:06:35'),
(68, 3, 32, 'invisible', '2020-07-05 07:06:35', '2020-07-05 07:06:35'),
(69, 3, 33, 'invisible', '2020-07-05 07:06:35', '2020-07-05 07:06:35'),
(70, 2, 52, 'write', '2020-07-05 07:07:18', '2020-07-05 07:07:18'),
(71, 2, 53, 'write', '2020-07-05 07:07:18', '2020-07-05 07:07:18'),
(72, 2, 54, 'write', '2020-07-05 07:07:18', '2020-07-05 07:07:18'),
(73, 2, 55, 'invisible', '2020-07-05 07:07:18', '2020-07-05 07:07:18'),
(74, 3, 52, 'readonly', '2020-07-05 07:07:18', '2020-07-05 07:07:18'),
(75, 3, 53, 'readonly', '2020-07-05 07:07:18', '2020-07-05 07:07:18'),
(76, 3, 54, 'readonly', '2020-07-05 07:07:18', '2020-07-05 07:07:18'),
(77, 3, 55, 'readonly', '2020-07-05 07:07:18', '2020-07-05 07:07:18'),
(78, 1, 56, 'write', '2020-07-05 07:12:28', '2020-07-05 07:12:28'),
(79, 1, 57, 'write', '2020-07-05 11:48:55', '2020-07-05 11:48:55'),
(80, 1, 58, 'write', '2020-07-05 11:49:24', '2020-07-05 11:49:24'),
(81, 1, 59, 'write', '2020-07-05 11:49:56', '2020-07-05 11:49:56'),
(82, 1, 60, 'write', '2020-07-05 11:50:25', '2020-07-05 11:50:25'),
(83, 1, 61, 'write', '2020-07-05 11:50:58', '2020-07-05 11:50:58'),
(84, 1, 62, 'write', '2020-07-06 20:54:49', '2020-07-06 20:54:49'),
(85, 1, 63, 'write', '2020-07-06 20:55:12', '2020-07-06 20:55:12'),
(86, 1, 64, 'write', '2020-07-06 20:58:44', '2020-07-06 20:58:44'),
(88, 1, 66, 'write', '2020-07-06 21:20:14', '2020-07-06 21:20:14'),
(92, 1, 70, 'write', '2020-07-08 04:17:35', '2020-07-08 04:17:35'),
(93, 1, 71, 'write', '2020-07-08 04:22:25', '2020-07-08 04:22:25'),
(94, 1, 72, 'write', '2020-07-08 04:23:24', '2020-07-08 04:23:24'),
(103, 1, 81, 'write', '2020-07-09 13:05:58', '2020-07-09 13:05:58'),
(104, 1, 82, 'write', '2020-07-09 13:47:41', '2020-07-09 13:47:41'),
(105, 1, 83, 'write', '2020-07-09 13:48:21', '2020-07-09 13:48:21'),
(106, 1, 84, 'write', '2020-07-09 13:55:24', '2020-07-09 13:55:24'),
(107, 1, 85, 'write', '2020-07-09 13:56:11', '2020-07-09 13:56:11'),
(108, 1, 86, 'write', '2020-07-09 13:56:55', '2020-07-09 13:56:55'),
(109, 1, 87, 'write', '2020-07-13 05:55:10', '2020-07-13 05:55:10'),
(113, 1, 91, 'write', '2020-07-14 08:20:50', '2020-07-14 08:20:50'),
(114, 1, 92, 'write', '2020-07-14 08:21:23', '2020-07-14 08:21:23'),
(115, 1, 93, 'write', '2020-07-15 11:31:14', '2020-07-15 11:31:14'),
(116, 1, 94, 'write', '2020-07-15 11:31:47', '2020-07-15 11:31:47'),
(117, 1, 95, 'write', '2020-07-15 11:32:15', '2020-07-15 11:32:15'),
(118, 1, 96, 'write', '2020-07-15 11:37:08', '2020-07-15 11:37:08'),
(119, 1, 97, 'write', '2020-07-15 11:37:52', '2020-07-15 11:37:52'),
(120, 1, 98, 'write', '2020-07-27 05:15:12', '2020-07-27 05:15:12'),
(124, 1, 102, 'write', '2020-08-01 02:39:51', '2020-08-01 02:39:51'),
(125, 1, 103, 'write', '2020-08-01 06:41:52', '2020-08-01 06:41:52'),
(126, 1, 104, 'write', '2020-08-01 06:53:49', '2020-08-01 06:53:49'),
(127, 1, 105, 'write', '2020-08-01 06:58:21', '2020-08-01 06:58:21'),
(128, 1, 106, 'write', '2020-08-01 06:59:34', '2020-08-01 06:59:34'),
(129, 1, 107, 'write', '2020-08-01 07:01:05', '2020-08-01 07:01:05'),
(130, 1, 108, 'write', '2020-08-01 07:01:40', '2020-08-01 07:01:40'),
(131, 1, 109, 'write', '2020-08-01 07:02:16', '2020-08-01 07:02:16'),
(132, 1, 110, 'write', '2020-08-01 07:03:19', '2020-08-01 07:03:19'),
(135, 1, 113, 'write', '2020-08-01 13:33:40', '2020-08-01 13:33:40'),
(136, 1, 114, 'write', '2020-08-01 13:34:49', '2020-08-01 13:34:49'),
(137, 1, 115, 'write', '2020-08-01 15:36:59', '2020-08-01 15:36:59'),
(138, 1, 116, 'write', '2020-08-02 15:38:32', '2020-08-02 15:38:32'),
(139, 1, 117, 'write', '2020-08-02 15:39:37', '2020-08-02 15:39:37'),
(140, 1, 118, 'write', '2020-08-02 15:40:02', '2020-08-02 15:40:02'),
(141, 1, 119, 'write', '2020-08-02 15:40:53', '2020-08-02 15:40:53'),
(142, 1, 120, 'write', '2020-08-02 15:43:21', '2020-08-02 15:43:21'),
(143, 1, 121, 'write', '2020-08-02 15:44:13', '2020-08-02 15:44:13'),
(144, 1, 122, 'write', '2020-08-02 15:44:57', '2020-08-02 15:44:57'),
(145, 1, 123, 'write', '2020-08-02 15:46:35', '2020-08-02 15:46:35'),
(146, 1, 124, 'write', '2020-08-02 15:47:31', '2020-08-02 15:47:31'),
(147, 1, 125, 'write', '2020-08-02 16:04:37', '2020-08-02 16:04:37'),
(148, 1, 126, 'write', '2020-08-02 16:04:59', '2020-08-02 16:04:59'),
(149, 1, 127, 'write', '2020-08-02 16:05:38', '2020-08-02 16:05:38'),
(150, 1, 128, 'write', '2020-08-02 16:06:10', '2020-08-02 16:06:10'),
(151, 1, 129, 'write', '2020-08-02 16:06:38', '2020-08-02 16:06:38'),
(152, 1, 130, 'write', '2020-08-02 16:07:23', '2020-08-02 16:07:23'),
(153, 1, 131, 'write', '2020-08-02 17:25:28', '2020-08-02 17:25:28');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tester`
--

CREATE TABLE `tester` (
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `caption` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `hash` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `name`, `path`, `extension`, `caption`, `user_id`, `hash`, `public`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '4.jpg', '/opt/lampp/htdocs/ladmin/storage/uploads/2020-07-05-094336-4.jpg', 'jpg', '', 1, 'jnh11znmko0quipor3fb', 0, NULL, '2020-07-05 06:43:36', '2020-07-05 06:43:36'),
(2, '3.jpeg', '/opt/lampp/htdocs/ladmin/storage/uploads/2020-07-05-094336-3.jpeg', 'jpeg', '', 1, '20rjjpre17xjplsarydn', 0, NULL, '2020-07-05 06:43:36', '2020-07-05 06:43:36'),
(3, '2.jpg', '/opt/lampp/htdocs/ladmin/storage/uploads/2020-07-05-094336-2.jpg', 'jpg', '', 1, 'rowcd43thwxrxus16hbc', 0, NULL, '2020-07-05 06:43:36', '2020-07-05 06:43:36'),
(4, '1.jpg', '/opt/lampp/htdocs/ladmin/storage/uploads/2020-07-05-094336-1.jpg', 'jpg', '', 1, '94tbhmexegw9fu9hibqh', 0, NULL, '2020-07-05 06:43:36', '2020-07-05 06:43:36'),
(5, 'LMS.pdf', '/opt/lampp/htdocs/ladmin/storage/uploads/2020-07-05-094909-LMS.pdf', 'pdf', '', 1, '4idzmi7pixexg78zcwtj', 0, NULL, '2020-07-05 06:49:09', '2020-07-05 06:49:09'),
(6, 'LMS.pdf', '/opt/lampp/htdocs/ladmin/storage/uploads/2020-08-01-102907-LMS.pdf', 'pdf', '', 1, 'hhoeomwclc9n7xr5gaoq', 0, NULL, '2020-08-01 07:29:07', '2020-08-01 07:29:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `context_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `context_id`, `email`, `password`, `remember_token`, `deleted_at`, `created_at`, `updated_at`, `type`) VALUES
(1, 'Admin', 1, 'admin@admin.com', '$2y$10$ZZruNhWe698blkfyzQthAOYWNsALXxR0rj.EwWaHeD9ZEPubXd/T.', 'ziIR2zoyQyGSU1izibhJkujuM7oqyZcwhG5co4xpe9KwbHFDRnX4DRRUqmZQ', NULL, '2020-07-04 21:47:36', '2020-09-02 08:41:24', 1),
(2, 'Humam', 0, 'humam@lms.com', '$2y$10$ZZruNhWe698blkfyzQthAOYWNsALXxR0rj.EwWaHeD9ZEPubXd/T.', 'OTKZHavsUrlVqnPjL6atRhfocTG5vO4yTe4oiVk8Z0aatLh3PNhGJYjoLfJg', NULL, NULL, '2020-08-22 12:18:42', 3),
(3, 'Student103', 1, 'student@student.com', '$2y$10$ZZruNhWe698blkfyzQthAOYWNsALXxR0rj.EwWaHeD9ZEPubXd/T.', 'utvExcCZviO0FARjisy5VLwDbg9JchV7MVtl0QM5fZZxHulnEzVri0wIoJEo', NULL, NULL, '2020-09-02 14:15:14', 3),
(5, 'Corina_M', 0, 'corina.meojeed@yahoo.com', '$2y$10$67Csx97IyuVq7dx7pyCJROh4H20kt/hq/hgFyTxUtWakqb8EMC48q', 'VXdUjaU0oyglBwNiOnbXcVBwCcgAv1eDmVgfvvFEZnFq8WUlnFmUVTQzJhTA', NULL, '2020-08-31 05:04:57', '2020-09-01 13:10:31', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_course_values`
--

CREATE TABLE `user_course_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `course_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `language` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `level_of_knowledge` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `motivation_level` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `pedagogical_app` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_course_values`
--

INSERT INTO `user_course_values` (`id`, `deleted_at`, `created_at`, `updated_at`, `user_id`, `course_id`, `language`, `level_of_knowledge`, `motivation_level`, `pedagogical_app`) VALUES
(1, NULL, NULL, NULL, 2, 2, 'English', 'advanced', 'high', 'competencies_based'),
(2, NULL, NULL, NULL, 5, 2, 'Romanian', 'intermediate', 'high', 'objectivist'),
(3, NULL, NULL, NULL, 3, 2, 'English', 'beginner', 'moderate', 'objectivist');

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE `user_preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `ar_fsls` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ar_fsls_degree` int(10) UNSIGNED NOT NULL,
  `vv_fsls` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `sg_fsls` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ar_honey_mumford` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ar_hm_degree` int(10) UNSIGNED NOT NULL,
  `media_preference` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `nav_preference` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_preferences`
--

INSERT INTO `user_preferences` (`id`, `deleted_at`, `created_at`, `updated_at`, `user_id`, `ar_fsls`, `ar_fsls_degree`, `vv_fsls`, `sg_fsls`, `ar_honey_mumford`, `ar_hm_degree`, `media_preference`, `nav_preference`) VALUES
(1, NULL, NULL, NULL, 5, '', 20, 'visual', '', '', 20, 'text/image', 'breadth-first'),
(2, NULL, NULL, NULL, 2, 'reflective', 80, 'verbal', 'sequential', 'reflector', 80, 'sound', 'depth-first'),
(3, NULL, NULL, NULL, 3, 'reflective', 100, 'visual', 'sequential', 'activist', 100, 'simulation', 'breadth-first');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backups`
--
ALTER TABLE `backups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `backups_name_unique` (`name`),
  ADD UNIQUE KEY `backups_file_name_unique` (`file_name`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_elements`
--
ALTER TABLE `data_elements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delement_pparameters`
--
ALTER TABLE `delement_pparameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delement_pparameters_parameter_foreign` (`parameter`),
  ADD KEY `delement_pparameters_data_element_foreign` (`data_element`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enrollments_course_foreign` (`course_id`),
  ADD KEY `enrollments_student_foreign` (`user_id`);

--
-- Indexes for table `la_configs`
--
ALTER TABLE `la_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `la_menus`
--
ALTER TABLE `la_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `learning_objects`
--
ALTER TABLE `learning_objects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `learning_objects_lesson_foreign` (`lesson_id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_course_foreign` (`course_id`);

--
-- Indexes for table `lesson_students`
--
ALTER TABLE `lesson_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_students_lesson_id_foreign` (`lesson_id`),
  ADD KEY `lesson_students_user_id_foreign` (`user_id`);

--
-- Indexes for table `lo_properties`
--
ALTER TABLE `lo_properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lo_properties_lo_foreign` (`lo`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_fields`
--
ALTER TABLE `module_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_fields_module_foreign` (`module`),
  ADD KEY `module_fields_field_type_foreign` (`field_type`);

--
-- Indexes for table `module_field_types`
--
ALTER TABLE `module_field_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `p_parameters`
--
ALTER TABLE `p_parameters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`),
  ADD KEY `roles_parent_foreign` (`parent`);

--
-- Indexes for table `role_module`
--
ALTER TABLE `role_module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_module_role_id_foreign` (`role_id`),
  ADD KEY `role_module_module_id_foreign` (`module_id`);

--
-- Indexes for table `role_module_fields`
--
ALTER TABLE `role_module_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_module_fields_role_id_foreign` (`role_id`),
  ADD KEY `role_module_fields_field_id_foreign` (`field_id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploads_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_type_foreign` (`type`);

--
-- Indexes for table `user_course_values`
--
ALTER TABLE `user_course_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_course_values_user_id_foreign` (`user_id`),
  ADD KEY `user_course_values_course_id_foreign` (`course_id`);

--
-- Indexes for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_preferences_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `backups`
--
ALTER TABLE `backups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `data_elements`
--
ALTER TABLE `data_elements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `delement_pparameters`
--
ALTER TABLE `delement_pparameters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `la_configs`
--
ALTER TABLE `la_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `la_menus`
--
ALTER TABLE `la_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `learning_objects`
--
ALTER TABLE `learning_objects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lesson_students`
--
ALTER TABLE `lesson_students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `lo_properties`
--
ALTER TABLE `lo_properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `module_fields`
--
ALTER TABLE `module_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `module_field_types`
--
ALTER TABLE `module_field_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `p_parameters`
--
ALTER TABLE `p_parameters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_module`
--
ALTER TABLE `role_module`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `role_module_fields`
--
ALTER TABLE `role_module_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_course_values`
--
ALTER TABLE `user_course_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_preferences`
--
ALTER TABLE `user_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delement_pparameters`
--
ALTER TABLE `delement_pparameters`
  ADD CONSTRAINT `delement_pparameters_data_element_foreign` FOREIGN KEY (`data_element`) REFERENCES `data_elements` (`id`),
  ADD CONSTRAINT `delement_pparameters_parameter_foreign` FOREIGN KEY (`parameter`) REFERENCES `p_parameters` (`id`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_course_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `enrollments_student_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `learning_objects`
--
ALTER TABLE `learning_objects`
  ADD CONSTRAINT `learning_objects_lesson_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`);

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_course_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Constraints for table `lesson_students`
--
ALTER TABLE `lesson_students`
  ADD CONSTRAINT `lesson_students_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`),
  ADD CONSTRAINT `lesson_students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `lo_properties`
--
ALTER TABLE `lo_properties`
  ADD CONSTRAINT `lo_properties_lo_foreign` FOREIGN KEY (`lo`) REFERENCES `learning_objects` (`id`);

--
-- Constraints for table `module_fields`
--
ALTER TABLE `module_fields`
  ADD CONSTRAINT `module_fields_field_type_foreign` FOREIGN KEY (`field_type`) REFERENCES `module_field_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `module_fields_module_foreign` FOREIGN KEY (`module`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `roles` (`id`);

--
-- Constraints for table `role_module`
--
ALTER TABLE `role_module`
  ADD CONSTRAINT `role_module_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_module_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_module_fields`
--
ALTER TABLE `role_module_fields`
  ADD CONSTRAINT `role_module_fields_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `module_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_module_fields_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `uploads`
--
ALTER TABLE `uploads`
  ADD CONSTRAINT `uploads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_type_foreign` FOREIGN KEY (`type`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_course_values`
--
ALTER TABLE `user_course_values`
  ADD CONSTRAINT `user_course_values_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `user_course_values_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD CONSTRAINT `user_preferences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
