-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2018 at 06:16 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.1.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbmsproj`
--

-- --------------------------------------------------------

--
-- Table structure for table `advisor`
--

CREATE TABLE `advisor` (
  `s_ID` varchar(5) NOT NULL,
  `i_ID` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advisor`
--

INSERT INTO `advisor` (`s_ID`, `i_ID`) VALUES
('12345', '10101'),
('44553', '22222'),
('45678', '22222'),
('00128', '45565'),
('76543', '45565'),
('23121', '76543'),
('98988', '76766'),
('76653', '98345'),
('98765', '98345');

-- --------------------------------------------------------

--
-- Table structure for table `classroom`
--

CREATE TABLE `classroom` (
  `building` varchar(15) NOT NULL,
  `room_number` varchar(7) NOT NULL,
  `capacity` decimal(4,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classroom`
--

INSERT INTO `classroom` (`building`, `room_number`, `capacity`) VALUES
('Packard', '101', '500'),
('Painter', '514', '10'),
('Taylor', '3128', '70'),
('Watson', '100', '30'),
('Watson', '120', '50');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` varchar(8) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `credits` decimal(2,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `title`, `dept_name`, `credits`) VALUES
('BIO-101', 'Intro. to Biology', 'Biology', '4'),
('BIO-301', 'Genetics', 'Biology', '4'),
('BIO-399', 'Computational Biology', 'Biology', '3'),
('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', '4'),
('CS-190', 'Game Design', 'Comp. Sci.', '4'),
('CS-315', 'Robotics', 'Comp. Sci.', '3'),
('CS-319', 'Image Processing', 'Comp. Sci.', '3'),
('CS-347', 'Database System Concepts', 'Comp. Sci.', '3'),
('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', '3'),
('FIN-201', 'Investment Banking', 'Finance', '3'),
('HIS-351', 'World History', 'History', '3'),
('MU-199', 'Music Video Production', 'Music', '3'),
('PHY-101', 'Physical Principles', 'Physics', '4');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_name` varchar(20) NOT NULL,
  `building` varchar(15) DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_name`, `building`, `budget`) VALUES
('Biology', 'Watson', '90000.00'),
('Comp. Sci.', 'Taylor', '100000.00'),
('Elec. Eng.', 'Taylor', '85000.00'),
('Finance', 'Painter', '120000.00'),
('History', 'Painter', '50000.00'),
('Music', 'Packard', '80000.00'),
('Physics', 'Watson', '70000.00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `faculty`
-- (See below for the actual view)
--
CREATE TABLE `faculty` (
`ID` varchar(5)
,`name` varchar(20)
,`dept_name` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `ID` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`ID`, `name`, `dept_name`, `salary`) VALUES
('10101', 'Srinivasan', 'Comp. Sci.', '65000.00'),
('12121', 'Wu', 'Finance', '90000.00'),
('15151', 'Mozart', 'Music', '40000.00'),
('22222', 'Einstein', 'Physics', '95000.00'),
('32343', 'El Said', 'History', '60000.00'),
('33456', 'Gold', 'Physics', '87000.00'),
('44444', 'Temp', 'Comp. Sci.', NULL),
('45565', 'Katz', 'Comp. Sci.', '75000.00'),
('58583', 'Califieri', 'History', '62000.00'),
('76543', 'Singh', 'Finance', '80000.00'),
('76766', 'Crick', 'Biology', '72000.00'),
('83821', 'Brandt', 'Comp. Sci.', '92000.00'),
('98345', 'Kim', 'Elec. Eng.', '80000.00');

-- --------------------------------------------------------

--
-- Table structure for table `prereq`
--

CREATE TABLE `prereq` (
  `course_id` varchar(8) NOT NULL,
  `prereq_id` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prereq`
--

INSERT INTO `prereq` (`course_id`, `prereq_id`) VALUES
('BIO-301', 'BIO-101'),
('BIO-399', 'BIO-101'),
('CS-190', 'CS-101'),
('CS-315', 'CS-101'),
('CS-319', 'CS-101'),
('CS-347', 'CS-101'),
('EE-181', 'PHY-101');

-- --------------------------------------------------------

--
-- Stand-in structure for view `search`
-- (See below for the actual view)
--
CREATE TABLE `search` (
`txt` varchar(28)
);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `building` varchar(15) DEFAULT NULL,
  `room_number` varchar(7) DEFAULT NULL,
  `time_slot_id` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`course_id`, `sec_id`, `semester`, `year`, `building`, `room_number`, `time_slot_id`) VALUES
('BIO-101', '1', 'Summer', '2009', 'Painter', '514', 'B'),
('BIO-301', '1', 'Summer', '2010', 'Painter', '514', 'A'),
('CS-101', '1', 'Fall', '2009', 'Packard', '101', 'H'),
('CS-101', '1', 'Spring', '2010', 'Packard', '101', 'F'),
('CS-190', '1', 'Spring', '2009', 'Taylor', '3128', 'E'),
('CS-190', '2', 'Spring', '2009', 'Taylor', '3128', 'A'),
('CS-315', '1', 'Spring', '2010', 'Watson', '120', 'D'),
('CS-319', '1', 'Spring', '2010', 'Watson', '100', 'B'),
('CS-319', '2', 'Spring', '2010', 'Taylor', '3128', 'C'),
('CS-347', '1', 'Fall', '2009', 'Taylor', '3128', 'A'),
('EE-181', '1', 'Spring', '2009', 'Taylor', '3128', 'C'),
('FIN-201', '1', 'Spring', '2010', 'Packard', '101', 'B'),
('HIS-351', '1', 'Spring', '2010', 'Painter', '514', 'C'),
('MU-199', '1', 'Spring', '2010', 'Packard', '101', 'D'),
('PHY-101', '1', 'Fall', '2009', 'Watson', '100', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `ID` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `tot_cred` decimal(3,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`ID`, `name`, `dept_name`, `tot_cred`) VALUES
('00128', 'Zhang', 'Comp. Sci.', '102'),
('1112', 'Coop', 'Music', '0'),
('12345', 'Shankar', 'Comp. Sci.', '32'),
('19991', 'Brandt', 'History', '80'),
('23121', 'Chavez', 'Finance', '110'),
('44553', 'Peltier', 'Physics', '56'),
('45678', 'Levy', 'Physics', '46'),
('54321', 'Williams', 'Comp. Sci.', '54'),
('55739', 'Sanchez', 'Music', '38'),
('70557', 'Snow', 'Physics', '0'),
('76543', 'Brown', 'Comp. Sci.', '58'),
('76653', 'Aoi', 'Elec. Eng.', '60'),
('98765', 'Bourikas', 'Elec. Eng.', '98'),
('98988', 'Tanaka', 'Biology', '120');

-- --------------------------------------------------------

--
-- Table structure for table `takes`
--

CREATE TABLE `takes` (
  `ID` varchar(5) NOT NULL,
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `grade` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `takes`
--

INSERT INTO `takes` (`ID`, `course_id`, `sec_id`, `semester`, `year`, `grade`) VALUES
('00128', 'CS-101', '1', 'Fall', '2009', 'A'),
('00128', 'CS-347', '1', 'Fall', '2009', 'A-'),
('12345', 'CS-101', '1', 'Fall', '2009', 'C'),
('12345', 'CS-190', '2', 'Spring', '2009', 'A'),
('12345', 'CS-315', '1', 'Spring', '2010', 'A'),
('12345', 'CS-347', '1', 'Fall', '2009', 'A'),
('19991', 'HIS-351', '1', 'Spring', '2010', 'B'),
('23121', 'FIN-201', '1', 'Spring', '2010', 'C+'),
('44553', 'PHY-101', '1', 'Fall', '2009', 'B-'),
('45678', 'CS-101', '1', 'Fall', '2009', 'F'),
('45678', 'CS-101', '1', 'Spring', '2010', 'B+'),
('45678', 'CS-319', '1', 'Spring', '2010', 'B'),
('54321', 'CS-101', '1', 'Fall', '2009', 'A-'),
('54321', 'CS-190', '2', 'Spring', '2009', 'B+'),
('55739', 'MU-199', '1', 'Spring', '2010', 'A-'),
('76543', 'CS-101', '1', 'Fall', '2009', 'A'),
('76543', 'CS-319', '2', 'Spring', '2010', 'A'),
('76653', 'EE-181', '1', 'Spring', '2009', 'C'),
('98765', 'CS-101', '1', 'Fall', '2009', 'C-'),
('98765', 'CS-315', '1', 'Spring', '2010', 'B'),
('98988', 'BIO-101', '1', 'Summer', '2009', 'A'),
('98988', 'BIO-301', '1', 'Summer', '2010', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teaches`
--

CREATE TABLE `teaches` (
  `ID` varchar(5) NOT NULL,
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` decimal(4,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teaches`
--

INSERT INTO `teaches` (`ID`, `course_id`, `sec_id`, `semester`, `year`) VALUES
('10101', 'CS-101', '1', 'Fall', '2009'),
('10101', 'CS-315', '1', 'Spring', '2010'),
('10101', 'CS-347', '1', 'Fall', '2009'),
('12121', 'FIN-201', '1', 'Spring', '2010'),
('15151', 'MU-199', '1', 'Spring', '2010'),
('22222', 'PHY-101', '1', 'Fall', '2009'),
('32343', 'HIS-351', '1', 'Spring', '2010'),
('45565', 'CS-101', '1', 'Spring', '2010'),
('45565', 'CS-319', '1', 'Spring', '2010'),
('76766', 'BIO-101', '1', 'Summer', '2009'),
('76766', 'BIO-301', '1', 'Summer', '2010'),
('83821', 'CS-190', '1', 'Spring', '2009'),
('83821', 'CS-190', '2', 'Spring', '2009'),
('83821', 'CS-319', '2', 'Spring', '2010'),
('98345', 'EE-181', '1', 'Spring', '2009');

-- --------------------------------------------------------

--
-- Table structure for table `time_slot`
--

CREATE TABLE `time_slot` (
  `time_slot_id` varchar(4) NOT NULL,
  `day` varchar(1) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time_slot`
--

INSERT INTO `time_slot` (`time_slot_id`, `day`, `start_time`, `end_time`) VALUES
('A', 'F', '08:00:00', '09:00:00'),
('A', 'M', '08:00:00', '09:00:00'),
('A', 'W', '08:00:00', '09:00:00'),
('B', 'F', '09:00:00', '10:00:00'),
('B', 'F', '10:00:00', '11:00:00'),
('B', 'M', '09:00:00', '10:00:00'),
('B', 'M', '10:00:00', '11:00:00'),
('B', 'W', '09:00:00', '10:00:00'),
('B', 'W', '10:00:00', '11:00:00'),
('D', 'F', '11:00:00', '12:00:00'),
('D', 'M', '11:00:00', '12:00:00'),
('D', 'W', '11:00:00', '12:00:00'),
('E', 'R', '01:00:00', '02:00:00'),
('E', 'T', '01:00:00', '02:00:00'),
('F', 'R', '02:00:00', '03:00:00'),
('F', 'T', '01:00:00', '02:00:00'),
('G', 'F', '03:00:00', '04:00:00'),
('G', 'M', '02:00:00', '03:00:00'),
('G', 'W', '02:00:00', '03:00:00'),
('H', 'W', '03:00:00', '04:00:00');

-- --------------------------------------------------------

--
-- Structure for view `faculty`
--
DROP TABLE IF EXISTS `faculty`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `faculty`  AS  select `instructor`.`ID` AS `ID`,`instructor`.`name` AS `name`,`instructor`.`dept_name` AS `dept_name` from `instructor` ;

-- --------------------------------------------------------

--
-- Structure for view `search`
--
DROP TABLE IF EXISTS `search`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `search`  AS  (select concat(`time_slot`.`time_slot_id`,'|',`time_slot`.`day`,'|',`time_slot`.`start_time`,'|',`time_slot`.`end_time`) AS `txt` from `time_slot`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advisor`
--
ALTER TABLE `advisor`
  ADD PRIMARY KEY (`s_ID`),
  ADD KEY `i_ID` (`i_ID`);

--
-- Indexes for table `classroom`
--
ALTER TABLE `classroom`
  ADD PRIMARY KEY (`building`,`room_number`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `dept_name` (`dept_name`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_name`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `dept_name` (`dept_name`);

--
-- Indexes for table `prereq`
--
ALTER TABLE `prereq`
  ADD PRIMARY KEY (`course_id`,`prereq_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`course_id`,`sec_id`,`semester`,`year`),
  ADD KEY `building` (`building`,`room_number`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `dept_name` (`dept_name`);

--
-- Indexes for table `takes`
--
ALTER TABLE `takes`
  ADD PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  ADD KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`);

--
-- Indexes for table `teaches`
--
ALTER TABLE `teaches`
  ADD PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  ADD KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`);

--
-- Indexes for table `time_slot`
--
ALTER TABLE `time_slot`
  ADD PRIMARY KEY (`time_slot_id`,`day`,`start_time`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advisor`
--
ALTER TABLE `advisor`
  ADD CONSTRAINT `advisor_ibfk_1` FOREIGN KEY (`i_ID`) REFERENCES `instructor` (`ID`) ON DELETE SET NULL,
  ADD CONSTRAINT `advisor_ibfk_2` FOREIGN KEY (`s_ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE SET NULL;

--
-- Constraints for table `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE SET NULL;

--
-- Constraints for table `prereq`
--
ALTER TABLE `prereq`
  ADD CONSTRAINT `prereq_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE;

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `section_ibfk_2` FOREIGN KEY (`building`,`room_number`) REFERENCES `classroom` (`building`, `room_number`) ON DELETE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE SET NULL;

--
-- Constraints for table `takes`
--
ALTER TABLE `takes`
  ADD CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`course_id`,`sec_id`,`semester`,`year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`) ON DELETE CASCADE,
  ADD CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `teaches`
--
ALTER TABLE `teaches`
  ADD CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`course_id`,`sec_id`,`semester`,`year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`),
  ADD CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `instructor` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `teaches_ibfk_3` FOREIGN KEY (`course_id`,`sec_id`,`semester`,`year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
