-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2024 at 01:26 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vms`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `student_sex` enum('Male','Female') NOT NULL,
  `student_shift` enum('Full Time','Part Time') NOT NULL,
  `student_position` enum('President','Vice President') NOT NULL,
  `year_of_study` enum('Year One','Year Two','Year Three','Year Four','Year Five') NOT NULL,
  `department` varchar(100) NOT NULL,
  `student_phone` varchar(15) NOT NULL,
  `student_password` varchar(255) NOT NULL,
  `student_email` varchar(255) NOT NULL,
  `student_image` longtext NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `student_id`, `student_name`, `student_sex`, `student_shift`, `student_position`, `year_of_study`, `department`, `student_phone`, `student_password`, `student_email`, `student_image`, `create_date`) VALUES
(11, 'HU004441', 'Abuubakar Mohamed Muhdin', 'Male', 'Part Time', 'President', 'Year Five', 'Software Engineering', '0615546003', '1740', '', './uploads/candidates/Abuubakar Mohamed Muhdin_about-image_645125242.jpg', '2024-10-23 05:57:52'),
(12, 'HU003128', 'Abdirahmaan Osmaan Ahemd', 'Male', 'Part Time', 'President', 'Year Five', 'Software Engineering', '123', '8756', 'taamir.mm@gmail.com', './uploads/candidates/Abdirahmaan Osmaan Ahemd_abdirahman_759876046.jpg', '2024-10-23 10:29:01'),
(13, 'HU00111', 'Unkown Student', 'Male', 'Part Time', 'Vice President', 'Year Five', 'Political Science', '123', '2357', 'affanacademy0@gmail.com', './uploads/candidates/Unkown Student_baner3_16804750.png', '2024-10-23 10:43:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_token` text NOT NULL,
  `user_role` varchar(255) NOT NULL DEFAULT 'user',
  `user_image` longtext NOT NULL,
  `screen_password` varchar(255) NOT NULL,
  `screen_status` varchar(255) NOT NULL DEFAULT 'false',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`, `user_token`, `user_role`, `user_image`, `screen_password`, `screen_status`, `create_date`) VALUES
('User000', 'abuubakar', 'taamir.mm@gmail.com', '123', 'verified', 'Admin', '', '', 'false', '2024-09-07 06:15:29');

-- --------------------------------------------------------

--
-- Table structure for table `voters`
--

CREATE TABLE `voters` (
  `id` int(11) NOT NULL,
  `student_id` varchar(255) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `student_sex` enum('Male','Female') NOT NULL,
  `student_shift` enum('Full Time','Part Time') NOT NULL,
  `year_of_study` enum('Year One','Year Two','Year Three','Year Four','Year Five') NOT NULL,
  `department` varchar(100) NOT NULL,
  `student_phone` varchar(255) NOT NULL,
  `student_password` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voters`
--

INSERT INTO `voters` (`id`, `student_id`, `student_name`, `student_sex`, `student_shift`, `year_of_study`, `department`, `student_phone`, `student_password`, `create_date`) VALUES
(3, 'HU004441', 'Abuubakar Mohamed', 'Male', 'Part Time', 'Year Four', 'Software Engineering', '0615545003', '6780', '2024-10-22 14:00:05');

-- --------------------------------------------------------

--
-- Table structure for table `vots`
--

CREATE TABLE `vots` (
  `id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `position` varchar(255) NOT NULL,
  `vote_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `voters`
--
ALTER TABLE `voters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vots`
--
ALTER TABLE `vots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voter_id` (`voter_id`),
  ADD KEY `candidate_id` (`candidate_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `voters`
--
ALTER TABLE `voters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vots`
--
ALTER TABLE `vots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vots`
--
ALTER TABLE `vots`
  ADD CONSTRAINT `vots_ibfk_1` FOREIGN KEY (`voter_id`) REFERENCES `voters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vots_ibfk_2` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
