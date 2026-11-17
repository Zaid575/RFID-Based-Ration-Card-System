-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 16, 2024 at 05:15 PM
-- Server version: 10.11.8-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u910794608_certificate`
--

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`id`, `name`, `status`) VALUES
(1, 'KIT’s, College of Engineering (Autonomous), Kolhapur', 1),
(2, 'Dr. J. J. Magdum College of Engineering, Jaysingpur', 1),
(3, 'Marathwada Mitra Mandal\'s College of Engineering, Pune', 1),
(4, 'D. Y. Patil Agriculture & Technical University, Talsande, Kolhapur', 1),
(5, 'Karmaveer Bhaurao Patil College of Engineering, Satara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(25) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `name`, `username`, `password`, `type`, `status`) VALUES
(1, 'SVL Automations', 'info@svlautomations.in', '4fc4abd869e9cab28f4b5af8282ba27a', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `workshopid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `mobile` varchar(25) NOT NULL,
  `college_name` varchar(250) NOT NULL,
  `class` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `registration_date` datetime NOT NULL,
  `verification_code` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `workshopid`, `name`, `email`, `mobile`, `college_name`, `class`, `status`, `registration_date`, `verification_code`) VALUES
(1, 1, 'Shailesh Dinde', 'shdinde@gmail.com', '8888763563', 'KIT COEK, Kolhapur', 'Third Year', 2, '2024-03-22 00:00:00', 'AEF-8D1-869'),
(2, 1, 'Akanksha Mahesh Arsekar', 'akankshaarsekar1627@gmail.com', '09975216571', 'Kolhapur Institute of Technology\'s College of engineering ', 'Third Year', 2, '2024-03-23 00:00:00', 'C40-849-9C0'),
(3, 1, 'Abid Mahat ', 'aabidmahat72@gmail.com', '7559153594', 'Kolhapur Institute of technology ', 'Third Year', 2, '2024-03-23 00:00:00', 'A3E-D12-A92'),
(4, 1, 'Omkar Rajaram mali ', 'omkarmali648@gmail.com', '7447742766', 'Dr.D.Y.Patil college of engineering salokhenagar kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', 'AA9-416-82F'),
(5, 1, 'Aditya Arun Patil ', 'patiladitya2307@gmail.com', '7499325521', 'KIT\'s College Of Engineering, Kolhapur.', 'Third Year', 2, '2024-03-23 00:00:00', '2EC-E7B-842'),
(6, 1, 'Uday Mahadev Sonar Pattar ', 'udaysonar2004@gmail.com', '8180819711', 'KIT\'s College of Engineering ', 'Third Year', 2, '2024-03-23 00:00:00', 'EF4-F1C-D68'),
(7, 1, 'Siddhant Ankush Bodake', 'siddhant07092003@gmail.com', '09529768851', 'KIT\'s College of Engineering, Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', 'D03-71C-9BE'),
(8, 1, 'Pratik Vishwanath Shetake', 'pratikshetake.37@gmail.com', '7030032928', 'Kolhapur Institute of Technology\'s College of Engineering', 'Third Year', 2, '2024-03-23 00:00:00', 'FDE-E24-471'),
(9, 1, 'Arya Mahesh Dhavale ', 'aryadhavale2003@gmail.com', '7020812379', 'KIT COLLEGE OF ENGINEERING ', 'Third Year', 2, '2024-03-23 00:00:00', '6BE-D18-D2A'),
(10, 1, 'SWARAJ GAJANAN CHAVAN ', 'swarajgc1428@gmail.com', '8485042101', 'KIT\'S college of engineering, Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', 'EA4-602-312'),
(11, 1, 'Sejal Anil Mali', 'sejalmali2311@gmail.com', '07676573309', 'KIT College of engineering kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '2E4-32C-D96'),
(12, 1, 'Vaibhavi Manoj Desai', 'vaibhavimd0812@gmail.com', '9730665321', 'KIT college of engineering,Kolhapur', 'Third Year', 2, '2024-03-23 00:00:00', '9BF-176-213'),
(13, 1, 'Sufiya Mulla', 'sufiyamulla2019@gmail.com', '7666641121', 'Kolhapur Institute of Technology\'s collage of engineering (autonomous), kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', 'C4D-0FE-0A4'),
(14, 1, 'Rahul Sunil Sardesai ', 'sardesairahul07@gmail.com', '7249372975', 'KIT College of engineering kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', 'D02-122-726'),
(15, 1, 'Akhilesh Ravindra Huddar', 'akhileshhuddar729@gmail.com', '7385334953', 'Kolhapur Institute of Technology ', 'Third Year', 2, '2024-03-23 00:00:00', 'FB8-526-631'),
(16, 1, 'Rutuja Rama Patil ', 'patilrutu1063@gmail.com', '9022174177', 'Kolhapur Institute of Technology\'s College of Engineering Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', 'DB7-782-774'),
(17, 1, 'Akanksha Ashok Farakte', 'akankshafarakte1207@gmail.com', '8007098335', 'Kolhapur Institute of Technology College of Engineering, Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', 'B13-7D3-14D'),
(18, 1, 'Patil Vaishnavi Sanjay ', 'vaishnavipatil7733@gmail.com', '8412967733', 'Dr.D.Y.Patil Pratishthan\'s College of Engineering Salokhenagar Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '50B-954-A48'),
(19, 1, 'Pratik Prakash Bhandare', 'bhandarepratik83@gmail.com', '9637810053', 'KIT College of engineering Kolhapur', 'Third Year', 2, '2024-03-23 00:00:00', '72D-C1C-365'),
(20, 1, 'Anuja Raghunandan Deshpande ', 'deshpandeanuja24@gmail.com', '7020512197', 'KIT\'s College of Engineering(Autonomous), Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '019-A8D-CDF'),
(21, 1, 'SHREYAS SUNIL BAGAVE', 'shreyashbagave95@gmail.com', '9067933268', 'Kolhapur Institute of Technology,kolhapur', 'Third Year', 2, '2024-03-23 00:00:00', '30A-A41-38E'),
(22, 1, 'Sanika Yashwant Gaikwad ', 'sanikagaikwad159@gmail.com', '7666755032', 'KIT\'s College of Engineering Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', 'E1B-4D6-43F'),
(23, 1, 'Rohan Sunil Sardesdai', 'rohansardesai04@gmail.com', '9022228467', 'KIT college of engineering, Kolhapur', 'Third Year', 2, '2024-03-23 00:00:00', '35B-67B-A9A'),
(24, 1, 'Ashwini Balasaheb Patil ', 'fhalgunipatil454@gmail.com', '08275117683', 'KIT college of Engineering ', 'Third Year', 2, '2024-03-23 00:00:00', '2B0-953-FC1'),
(25, 1, 'Rutuja Nandkishor Warke ', 'warkerutuja@gmail.com', '9356371226', 'KIT\'s College of Engineering, Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', 'D26-9E8-895'),
(26, 1, 'Shreya Santosh Veer ', 'shreyaveer2004@gmail.com', '9022623350', 'Dr.D.Y.Patil college of engineering salokhenagar kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '841-0FD-BBB'),
(27, 1, 'Aryan Udhir Dubey ', 'aryan.udhirdubey2003@gmail.com', '8010384049', 'KIT COLLEGE OF ENGINEERING ', 'Third Year', 2, '2024-03-23 00:00:00', '548-2FA-BBA'),
(28, 1, 'Utkarsha Umesh Patil', 'utkarshapatil0806@gmail.com', '9322028233', 'Kolhapur Institute of Technology College of Engineering , Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '06D-4F1-D51'),
(29, 1, 'Shreya Sanjay Pungaonkar ', 'pungaonkarshreya@gmail.com', '9168575733', 'Kit\'s college of engineering kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '9D6-FE9-DB6'),
(30, 1, 'SANIKA GANPATI NARVEKAR', 'narvekarsanika901@gmail.com', '8080273188', 'Sant Gajanan Maharaj College Of Engineering Mahagaon ', 'Third Year', 2, '2024-03-23 00:00:00', 'D1F-093-1A3'),
(31, 1, 'Komal Ramrao Jadhav', 'komal01rj@gmail.com', '7249474292', 'KIT\'s College of Engineering(Autonomous), Kolhapur', 'Third Year', 2, '2024-03-23 00:00:00', '85B-800-5B8'),
(32, 1, 'Urmi Rahul Patil', 'urmipatil752@gmail.com', '8888267222', 'KIT\'s College of Engineering', 'Third Year', 2, '2024-03-23 00:00:00', '7BB-AFA-F0D'),
(33, 1, 'Dhanashree Santosh Kadam ', 'dskadam.2002@gmail.com', '7666564630', 'Kolhapur Institute of Technology’s College of Engineering, Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '46A-8DB-417'),
(34, 1, 'Shreya Sapkal ', 'shreeyasapkal@gmail.com', '9022676858', 'Dr.D.Y.PATIL PRATISHTHAN\'S COLLEGE OF ENGINEERING SALOKHE NAGAR KOLHAPUR ', 'Third Year', 2, '2024-03-23 00:00:00', '410-4F0-C3C'),
(35, 1, 'Sanika Shrikant Joshi ', 'sanikasjoshi12@gmail.com', '8459570755', 'Kolhapur institute of technology College of engineering Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '5AF-AB8-CC4'),
(36, 1, 'Prathamesh  Ravindra Garate', 'prgarate15@gmail.com', '8788379800', 'KIT college of engineering kolhapur', 'Third Year', 2, '2024-03-23 00:00:00', '9B8-8CA-8B1'),
(37, 1, 'Siddhesh Vilas Khandekar', 'siddheshkhandekar19112001@gmail.com', '8007010679', 'KIT\'s College of Engineering Kolhapur', 'Third Year', 2, '2024-03-23 00:00:00', '974-34E-7F5'),
(38, 1, 'Prathamesh Sachin Nale', 'prathameshnale7515@gmail.com', '9307336562', 'Kolhapur Institute of technology ', 'Third Year', 2, '2024-03-23 00:00:00', 'D74-707-E3E'),
(39, 1, 'BHAKTI PRAKASH AYAREKAR ', 'bhaktiayarekar@gmail.com', '9359887109', 'KIT college of Engineering, Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '995-78A-5A6'),
(40, 1, 'Shashank Suresh Swami', 'shashankswamiomom@gmail.com', '9420355638', 'KIT\'s College of Engineering Kolhapur', 'Third Year', 2, '2024-03-23 00:00:00', '526-A9A-592'),
(41, 1, 'Ankita Tanaji Yadav ', 'atyadav403@gmail.com', '9356969191', 'KIT\'S College of Engineering, Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '33B-73F-F70'),
(42, 1, 'Sophia Zakir Makandar', 'sofimakandar1803@gmail.com', '9260549682', 'Kolhapur Institute of Technology,  College of Engineering,  Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', 'A7A-B1C-80C'),
(43, 1, 'Vaishnavi Kiran Kesarkar ', 'vaishnavikesarkar111@gmail.com', '8080248448', 'Kolhapur Institute of Technology\'s College of Engineering,Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', 'DCD-01F-6B0'),
(44, 1, 'Aarti Lahu Patil', 'aartipatil00283@gmail.com', '9922987066', 'Kolhapur Institute of technology', 'Third Year', 2, '2024-03-23 00:00:00', 'C87-2B5-C92'),
(45, 1, 'Rohan Sachidanand Chopade', 'rohanchopade2621@gmail.com', '8999181197', 'KIT\'s College of Engineering, Kolhapur', 'Third Year', 2, '2024-03-23 00:00:00', 'E95-C30-E25'),
(46, 1, 'KASHID SHIVAM SANJAY ', 'shivamkashidsk88@gmail.com', '8805878700', 'Kolhapur institute of technology', 'Third Year', 2, '2024-03-23 00:00:00', 'A19-75D-B66'),
(47, 1, 'Rutuja Rahul Padekar ', 'rutuja.padekar963@gmail.com', '9766246585', 'KIT College of engineering Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '8D8-365-1A9'),
(48, 1, 'Ranjana Baburao Pandhare ', 'pandhareranjana9@gmail.com', '9021358527', 'KIT s college of engineering, kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '457-195-597'),
(49, 1, 'Simran Mahamadusuf Jamadar', 'simranjamadar2912@gmail.com', '9373953080', 'Kolhapur Institute of Technology\'s College of Engineering,Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '043-F63-A0D'),
(50, 1, 'Mohammadsaad Jamadar', 'saadjamadar0858@gmail.com', '9404288592', 'Kolhapur Institute of Technology College of Engineering, Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '065-D2D-BA7'),
(51, 1, 'Sarvesh Padwal', 'sarvesh00544@gmail.com', '7773918137', 'KIT College of engineering, Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '1A2-F80-273'),
(52, 1, 'Shruti Kamble', 'shrutikamble9860@gmail.com', '9890597067', 'KIT\'s College of Engineering Kolhapur', 'Third Year', 2, '2024-03-23 00:00:00', '75A-6B4-3CD'),
(53, 1, 'Aishwarya Sanjay Pavane', 'aishwaryapavane@gmail.com', '8265007161', 'KITs College Of Engineering Kolhapur.', 'Third Year', 2, '2024-03-23 00:00:00', '76C-E20-F15'),
(54, 1, 'Samiksha Pramod Mongale', 'samikshamongale15@gmail.com', '8767143440', 'KIT College of engineering, Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '973-D4C-3D1'),
(55, 1, 'DHIRAJ YUVRAJ JADHAV ', 'dhirajjadhav8669@gmail.com', '8669725172', 'Sant Gajanan Maharaj college of engineering mahagaon ', 'Third Year', 2, '2024-03-23 00:00:00', '39A-E10-3F3'),
(56, 1, 'Kiran Gungaji Nikam', 'nikamsarkar464@gmail.con', '8975952690', 'Sant Gajanan Maharaj college of Engineering, Mahagaon, Gadhinglaj', 'Third Year', 2, '2024-03-23 00:00:00', 'FB4-3D2-483'),
(57, 1, 'Naresh Kamble', 'nareshkamble85@gmail.com', '9890455842', 'Kolhapur Institute of Technology College of Engineering (Autonomous), Kolhapur', 'Third Year', 2, '2024-03-23 00:00:00', '1D9-DCA-68B'),
(58, 1, 'Soham Sandeep Mangore', 'mangoresoham@gmail.com', '8830753409', 'Kolhapur Institute of Technology\'s College of Engineering, Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', 'CEC-49A-AEF'),
(59, 1, 'Sakshi Vinod Potdar', 'sakshipotdar95@gmail.com', '9022139116', 'KIT College of Engineering, Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '72B-F17-DD2'),
(60, 1, 'Shrinivas Prashant Nashte', 'nashteshrinivas@gmail.com', '7350612382', 'Kolhapur institute of technology,kolhapur', 'Third Year', 2, '2024-03-23 00:00:00', '48D-088-EB1'),
(61, 1, 'Maithili Nivrutti Patil', 'maithilipatil45@gmail.com', '7378482276', 'KIT college of Engineering, Kolhapur', 'Third Year', 2, '2024-03-23 00:00:00', '37D-23E-89B'),
(62, 1, 'Om Shivrudra Gatade', 'omgatade974@gmail.com', '9422044577', 'Kolhapur Institute of Engineering Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', 'DBD-0F9-5EB'),
(63, 1, 'SUMEET ARUN KURBETTI', 'sumeetkurbetti04@gmail.com', '8390275462', 'KOLHAPUR INSTITUTE OF TECHNOLOGY \'S COLLEGE OF ENGINEERING ', 'Third Year', 2, '2024-03-23 00:00:00', '7FB-D1E-E6C'),
(64, 1, 'Kaveri Shivputra Kumbhar ', 'kaverikumbhar200415@gmail.com', '7249751953', 'Sant Gajanan Maharaj College of Engineering Mahagaon ', 'Third Year', 2, '2024-03-23 00:00:00', '51B-10E-A47'),
(65, 1, 'Mohammadsaad Hidayat Jamadar', 'msaadjamadar@gmail.com', '9404288592', 'Kolhapur institute of technology College of engineering Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '93A-5DB-CCB'),
(66, 1, 'Sushant Sadashiv More', 'sushantmore1503@gmail.com', '8767605022', 'Kolhapur institute of technology, Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', 'F20-969-151'),
(67, 1, 'Shreeya Pravin Joshi ', 'shreeya2702@gmail.com', '9158354769', 'KIT\'s College Of Engineering, Kolhapur.', 'Third Year', 2, '2024-03-23 00:00:00', '5BD-394-622'),
(68, 1, 'Vaishnavi Ravsaheb Powar ', 'vaishnavipowar0104@gmail.com', '8010172756', 'Sant Gajanan Maharaj College of engineering ', 'Third Year', 2, '2024-03-23 00:00:00', '57A-A0B-254'),
(69, 1, 'Om Rajendra Kharmate ', 'omkharmate85@gmail.com', '8482934044', 'Kolhapur Institute of Technology, Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '4FC-9A9-AD1'),
(70, 1, 'Sneha Sunil Magdum', 'magdumsneha53@gmail.com', '9579819944', 'Kolhapur Institute of Technology\'s College of Engineering Kolhapur', 'Third Year', 2, '2024-03-23 00:00:00', '04E-43F-373'),
(71, 1, 'Sakshi Patankar', 'sakshipatankar2003@gmail.com', '8767868660', 'Kolhapur institute of technology college of engineering ', 'Third Year', 2, '2024-03-23 00:00:00', 'EDB-247-711'),
(72, 1, 'Vaishnavi Shivaji Patil', 'vaishnavipatil8246@gmail.com', '9420134552', 'Kolhapur Institute of technology, kolhapur', 'Third Year', 2, '2024-03-23 00:00:00', '7F4-036-2F2'),
(73, 1, 'Neelam Wagare', 'nilamvagare@gmail.com', '8007969155', 'KIT\'s college of engineering ', 'Third Year', 2, '2024-03-23 00:00:00', '02B-795-7DB'),
(74, 1, 'Patil Seema Mallinath ', 'seemapatil242003@gmail.com', '9579964491', 'Kolhapur Institute of technology, Kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', 'D64-FA9-F43'),
(75, 1, 'Prachi Gopal Lad', 'prachilad82@gmail.com', '9371838702', 'Sant Gajanan Maharaj college of engineering mahagaon ', 'Third Year', 2, '2024-03-23 00:00:00', 'E80-177-BD1'),
(76, 1, 'Preeti Devanahalli ', 'preetidevanahalli26@gmail.com', '9945005791', 'KIT college of engineering ', 'Third Year', 2, '2024-03-23 00:00:00', 'CD8-899-FAB'),
(77, 1, 'Aditya Dundappa Patil ', 'patiladitya0321@gmail.com', '9011989833', 'Kit\'s college of engineering, kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '668-825-087'),
(78, 1, 'Shravani Sachin Desai', 'desaishravanis9090@email.com', '7298019090', 'Bharati Vidyapeeth College of engineering kolhapur ', 'Third Year', 2, '2024-03-23 00:00:00', '65A-B2A-4AE'),
(79, 1, 'Sakshi Suhas Chougule ', 'chougulesakshi95@gmail.com', '8180805416', 'KIT College of Engineering Kolhapur', 'Third Year', 2, '2024-03-24 00:00:00', 'DA3-6D0-4B5'),
(80, 1, 'Prachi Mahavir Patil', 'prachimp.02@gmail.com', '9021116301', 'KIT college , kolhapur', 'Third Year', 2, '2024-03-24 00:00:00', '65A-F43-596'),
(81, 1, 'Muaaj Nesarikar ', 'muaajnesarikar@gmail.com', '7620729775', 'KIT\'S COLLEGE OF ENGINEERING KOLHAPUR ', 'Third Year', 2, '2024-03-24 00:00:00', 'B22-292-89B'),
(82, 1, 'Dnyanadev Gajarkar ', 'jayeshgajarkar@gmail.com', '9307297339', 'Kolhapur institute of technology college of engineering ', 'Third Year', 2, '2024-03-24 00:00:00', 'FD4-3B0-819'),
(83, 1, 'Manish kumar yadav ', 'manishyadav62995@gmail.com', '6299515059', 'KIT\'S College Of Engineering (Autonomous) - Kolhapur', 'Third Year', 2, '2024-03-24 00:00:00', '28E-FD9-AA9'),
(84, 1, 'Parth Sarnobat', 'parthsarnobat05@gmail.com', '7972384249', 'KIT\'s college of engineering, Kolhapur', 'Third Year', 2, '2024-03-24 00:00:00', '543-B47-AA8'),
(85, 1, 'Yash Satish Waghurdekar ', 'yash.waghurdekar1@gmail.com', '9420925797', 'Kolhapur Institute of Technology ', 'Third Year', 2, '2024-03-24 00:00:00', '340-67C-6E7'),
(86, 1, 'Aditya Satish Patil ', 'patiladitya937@gmail.com', '8830284501', 'Kolhapur Institute of Technology College of Engineering,Kolhapur.', 'Third Year', 2, '2024-03-24 00:00:00', '91B-944-DAC'),
(87, 1, 'Bhakti Prakash Ayarekar', 'ayarekar.bhakti@kitcoek.in', '9359887109', 'KIT College,Kolhapur', 'Third Year', 2, '2024-03-24 00:00:00', '6CD-12F-82D'),
(88, 1, 'Aditya Arun Patil ', 'patiladitya4052@gmail.com', '7499325521', 'KIT\'s College Of Engineering, Kolhapur.', 'Third Year', 2, '2024-03-24 00:00:00', '5DA-49E-2BF'),
(89, 1, 'Suhani Thombare ', 'suhanithombare15@gmail.com', '7420840760', 'KIT\'s college of Engineering ', 'Third Year', 2, '2024-03-24 00:00:00', 'D2C-20A-C4C'),
(90, 1, 'Shruti Ganesh Ghorpade', 'shrutighorpade99@gmail.com', '8855898999', 'KIT\'S COLLEGE OF ENGINEERING ', 'Third Year', 2, '2024-03-24 00:00:00', '74B-4FA-9F5'),
(91, 1, 'Sumed Vinayak Sarnaik ', 'sumedsarnaik@gmail.com', '8329084643', 'KIT’s college of engineering, Kolhapur ', 'Third Year', 2, '2024-03-24 00:00:00', '017-BEB-C12'),
(92, 1, 'Vaishnavi Ankush Patil', '3vaishnavi3@gmail.com', '9309769152', 'KIT College of Engineering ', 'Third Year', 2, '2024-03-24 00:00:00', 'FE1-1A0-1BD'),
(93, 1, 'Nandini Nitin Tipkurle ', 'nandinitipkurle@gmail.com', '9322880574', 'Kit\'s college of engineering ', 'Third Year', 2, '2024-03-24 00:00:00', '154-F5D-7A7'),
(94, 1, 'Harshvardhan suresh lambe ', 'lambeharsh21@gmail.com', '07219657893', 'Kolhapur Institute of technology, kolhapur', 'Third Year', 2, '2024-03-24 00:00:00', '257-017-B1B'),
(95, 1, 'Samarth Sandip Desai', 'samarthdesai0803@gmail.com', '7387672355', 'Kit\'s college of engineering ', 'Third Year', 2, '2024-03-24 00:00:00', '994-64F-B89'),
(96, 1, 'Onkar Tanajirao Bhokare ', 'omkarbhokare666@gmail.com', '9172676824', 'Kolhapur Institute of technology (Autonomous)Kolhapur ', 'Third Year', 2, '2024-03-24 00:00:00', 'B92-D18-6F4'),
(97, 1, 'Rajvardhan Govind Patil ', 'rajvardhan2273@gmail.com', '9307834969', 'Kolhapur Institute of Technology\'s College of Engineering, Kolhapur ', 'Third Year', 2, '2024-03-24 00:00:00', '56A-AF9-839'),
(98, 1, 'Chinmay Kulkarni', 'chinmaykulkarni1705@gmail.com', '8087016789', 'KIT\'s College of Engineering, Kolhapur ', 'Third Year', 2, '2024-03-24 00:00:00', '1E9-AC3-92E'),
(99, 1, 'Snehal Shivaji Patil', 'patilsnehal262003@gmail.com', '7276548893', 'SGMCOE ', 'Third Year', 2, '2024-03-24 00:00:00', '988-E61-3BD'),
(100, 2, 'Shailesh Dinde', 'shdinde@gmail.com', '8888763563', 'JJM COE', 'Third Year', 2, '2024-03-26 00:00:00', '119-7B3-06E'),
(101, 2, 'Akanksha Vasant Gaikwad ', 'akankshagaikwad321@gmail.com', '9730946343', 'Dr.J.J.Magdum College of Engineering Jaysingpur ', 'Third Year', 2, '2024-03-26 00:00:00', '04C-02D-9BC'),
(102, 2, 'Prathamesh Bavannavar ', 'prathameshbavannavar@gmail.com', '9665070052', 'Dr.J.J.Magdum college of engineering,Jaysingpur ', 'Third Year', 2, '2024-03-26 00:00:00', '112-1A2-183'),
(103, 2, 'Aryan Baburao Chougule', 'aryanchougule12@gmail.com', '9325265022', 'Dr. J. J. Magdum College Of Engineering, Jaysingpur ', 'Third Year', 2, '2024-03-26 00:00:00', 'F2F-7A1-3CE'),
(104, 2, 'Sammed Subhash Tippanawar', 'sammedtippanawar@gmail.com', '7350500879', 'Dr J J Magdum College of Engineering ', 'Third Year', 2, '2024-03-26 00:00:00', 'F3B-9B5-5E1'),
(105, 2, 'Jadhav Pratik Prakash ', 'jadhavpratik2205@gmail.com', '8080962617', 'Dr. J J Magdum College of engineering, Jaysingpur ', 'Third Year', 2, '2024-03-26 00:00:00', 'F91-124-6ED'),
(106, 2, 'Siddharth Kulkarni ', 'siddharthkulkarni48@gmail.com', '7499932578', 'Dr JJ Magdum College of Engineering ', 'Third Year', 2, '2024-03-26 00:00:00', '8D4-122-A1E'),
(107, 2, 'Sai Sachil Pawar', 'saipawar1218@gmail.com', '8421917764', 'Dr.J.J.Magdum college of engineering jaysingpur ', 'Third Year', 2, '2024-03-27 00:00:00', 'A3F-AE5-EAB'),
(108, 2, 'Pranav Shrikant Salokhe ', 'pranavsalokhe008@gmail.com', '7057074705', 'Dr J J Magdum College Of Engineering ', 'Third Year', 2, '2024-03-27 00:00:00', '15D-960-D13'),
(109, 2, 'Aishwarya Nagnath Manglekar ', 'manglekaraishwarya@gmail.com', '8767205002', 'DR.J.J.Magdum College of Engineering ', 'Third Year', 2, '2024-03-27 00:00:00', '5F9-DB3-2BE'),
(110, 2, 'Dipali Ganpati zite ', 'dipalizite7@gmail.com', '8080375116', 'Dr.J.J.magdum college of engineering jaysingpur ', 'Third Year', 2, '2024-03-27 00:00:00', '69D-95E-F71'),
(111, 2, 'Tanushree Sharad Shinde', 'shindetanushree181@gmail.com', '07219160730', 'Dr J.J.Magdum college of engineering ', 'Third Year', 2, '2024-03-27 00:00:00', 'CE6-F29-808'),
(112, 2, 'Adityaraj Jayant Desai', 'adityajd991@gmail.com', '8806837814', 'Dr.J.J.Magdum College Of Engineering ,Jaysingpur ', 'Third Year', 2, '2024-03-27 00:00:00', '0AC-FBA-737'),
(113, 2, 'Prathamesh Santosh Ghorapade', 'pghorapade17@gmail.com', '9021146316', 'Dr. J. J. Magdum College Of Engineering, Jaysingpur', 'Third Year', 2, '2024-03-27 00:00:00', 'A67-115-336'),
(114, 2, 'Somnath yuvraj Khade ', 'khadesomnath2004@gmail.com', '9359816296', 'Dr J J magdum college of engineering Jaysingpur ', 'Third Year', 2, '2024-03-27 00:00:00', '29A-17D-E5C'),
(115, 2, 'Nikita Dnyaneshwar Dhond ', 'dhondnikita25@gmail.com', '8275977376', 'Dr. J. J. Magdum College of Engineering,Jaysingpur ', 'Third Year', 2, '2024-03-27 00:00:00', '010-19A-4E9'),
(116, 2, 'Rutuja Ravsaheb Awale', 'rutujaawale797@gmail.com', '7378302977', 'Dr .j j magdum college of Engineering,jaysingpur.', 'Third Year', 2, '2024-03-27 00:00:00', '39C-90F-BEA'),
(117, 2, 'Harshvardhan Rajaram Yadav ', 'hyharshyadav88@gmail.com', '9764437011', 'Dr JJ MAGDUM COLLEGE OF ENGINEERING ', 'Third Year', 2, '2024-03-27 00:00:00', '006-4CD-848'),
(118, 2, 'Rohini Ashok Mengane ', 'menganerohini2201@gmail.com', '7387374590', 'Dr. J. J. Magadum College of engineering, Jaysinpur ', 'Third Year', 2, '2024-03-27 00:00:00', '164-3FE-43F'),
(119, 2, 'Srushti Ravindra Chalke ', 'srushtichalke0319@gmail.com', '9307570037', 'Dr.J J Magdum College of Engineering, Jaysingpur ', 'Third Year', 2, '2024-03-27 00:00:00', '6EF-47F-6C3'),
(120, 2, 'Gayatri Mahesh Suryawanshi ', 'gayatrisuryawanshi1610@gmail.com', '9405136379', 'Dr. J J Magdum College oF Engineering Jaysingpur ', 'Third Year', 2, '2024-03-27 00:00:00', '9FF-EA6-376'),
(121, 2, 'Neha Dagadu Kadam ', 'nehakadam286@gmail.com', '7058371891', 'J. J. Magdum College of Engineering , Jaysingpur ', 'Third Year', 2, '2024-03-27 00:00:00', 'C34-369-1A7'),
(122, 2, 'Smita Kumar shindewale ', 'smitashindewale2001@gmail.com', '7385836075', 'Dr.j.j.magdum college of engineering ', 'Third Year', 2, '2024-03-27 00:00:00', 'A66-E18-634'),
(123, 2, 'Ranjit Prataprao Patil ', 'ranjitppatil10@gmail.com', '7507559790', 'Dr.J.J.Magdum college of engineering Jaysingpur ', 'Third Year', 2, '2024-03-27 00:00:00', '73E-0C4-0C6'),
(124, 2, 'Hrishikesh Venkatesh Jyothi ', 'jyothihrishikesh@gmail.com', '9699406465', 'Dr .j j magdum college of engineering ', 'Third Year', 2, '2024-03-27 00:00:00', '45F-733-350'),
(125, 2, 'Pratik Tanaji Javale ', 'pratikjavale712@gmail.com', '7058864788', 'Dr. JJ Magdhum collage of engineering ', 'Third Year', 2, '2024-03-27 00:00:00', 'C49-AC6-10C'),
(126, 2, 'Aarifa hajrat jagirdar ', 'aarifajagirdar@gmail.com', '8855026004', 'J J Magdum college of engineering jaisinhpur.', 'Third Year', 2, '2024-03-27 00:00:00', '518-A8C-BD5'),
(127, 2, 'Shreya gholap', 'shreyagholap2003@gmail.com', '8237642219', 'Dr.J J Magdum College of engineering Jaysingpur ', 'Third Year', 2, '2024-03-27 00:00:00', '2A0-6B4-7B4'),
(128, 2, 'Sharwari Shrikant Kulkarni', 'sharwarikulkarni1906@gmail.com', '8766989732', 'Dr J J Magdum College of engineering jaysingpur', 'Third Year', 2, '2024-03-27 00:00:00', 'A42-7D6-D8A'),
(129, 2, 'Sanika Balu Mohite ', 'mohiteb204@gmail.com', '8767396598', 'Dr.J.J.Magdum college of engineering jaysingpur ', 'Third Year', 2, '2024-03-27 00:00:00', '1A9-22F-AC4'),
(130, 1, 'Manikeri Saurabh Pandurang ', 'manikerisaurabh@gmail.com', '7559300805', 'Sant Gajanan Maharaj college of engineering Mahagaon ', 'Third Year', 2, '2024-03-27 00:00:00', '0CE-5E4-7D5'),
(131, 2, 'Ritesh Patil', 'riteshpatil8007@gmail.com', '8007626904', 'Dr.J J Magdum College of Engineering Jaysingpur', 'Third Year', 2, '2024-03-27 00:00:00', 'D8D-14F-2D0'),
(132, 2, 'Abdulfaiz Shaikh', 'abdulfaizshaikh55@gmail.com', '8208226809', 'Dr. J. J. Magdum College of Engineering', 'Third Year', 2, '2024-03-27 00:00:00', '100-085-9A5'),
(133, 2, 'Prajwal Pratap Gaste', 'gasteprajwal10@gmail.com', '8605269309', 'Dr. J. J. Magdum College of Engineering Jaysingur ', 'Third Year', 2, '2024-03-27 00:00:00', '07C-D5B-4FF'),
(134, 2, 'Sayyadhasham Hussainbasha Kazi ', 'hashamkazi3106@gmail.com', '9890786130', 'Dr J.J Magdum College of Engineering ', 'Third Year', 2, '2024-03-27 00:00:00', '2FD-412-B1A'),
(135, 2, 'pruthviraj patil ', 'pruthvirajpatil3255@gmail.com', '9356285841', 'Dr. J J Magdum College of engineering  Jaysingpur ', 'Third Year', 2, '2024-03-27 00:00:00', '555-E92-046'),
(136, 2, 'Aryan Jaysing Patil ', 'aryanpatil9700@gmail.com', '9168539009', 'Dr. J. J. Magdum College of Engineering, Jaysingpur ', 'Third Year', 2, '2024-03-27 00:00:00', '132-EE3-887'),
(137, 2, 'Chavan Vaishnavi Sanjay ', 'sc930104@gmail.com', '7447534568', 'Dr.J.J.Magdum College of Engineering,Jaysingpur. ', 'Third Year', 2, '2024-03-27 00:00:00', 'A28-6EA-3B8'),
(138, 2, 'TAHURA SIKANDAR SHAIKH', 'tahurashaikh37@gmail.com', '8080006343', 'J J MAGDUM COLLEGE OF ENGINEERING JAYSINGHPUR ', 'Third Year', 2, '2024-03-27 00:00:00', '4DA-3C9-F1E'),
(139, 2, 'Sharyu Shambhu Mali ', 'sharyumali63@gmail.com', '8767018167', 'Dr.j.j magdum college of Engineering, jaysingpur ', 'Third Year', 2, '2024-03-27 00:00:00', '6A2-1D2-F19'),
(140, 2, 'Anurag Kurane', 'kuraneanurag02@gmail.com', '08530906206', 'Dr J J Magdum College of Engineering ', 'Third Year', 2, '2024-03-27 00:00:00', '2FA-612-9FD'),
(141, 2, 'Tushar Suresh Gidde', 'tushargidde007@gmail.com', '9518947453', 'Dr JJ magdum collage of engineering', 'Third Year', 2, '2024-03-27 00:00:00', 'FC3-3CB-60F'),
(142, 2, 'Sanjana Suresh Kagwade', 'sanjanakagwade2403@gmail.com', '8468897716', 'Dr JJ Magdum College of Engineering Jaysingpur ', 'Third Year', 2, '2024-03-28 00:00:00', '0C5-2EC-42F'),
(143, 2, 'Prathamesh Prakash Pujari', 'prathameshpujari1003@gmail.com', '9373279394', 'Dr. JJ magdum college of engineering, jaysingpur ', 'Third Year', 2, '2024-03-28 00:00:00', '073-0D7-A6E'),
(144, 2, 'Pranav Vishwanath Shikarkhane ', 'shikarkhane.pranav@gmail.com', '9665090586', 'Dr.J.J.Magdum College Of Engineering ', 'Third Year', 2, '2024-03-29 00:00:00', 'BC9-D63-900'),
(145, 2, 'Ashish Shashikant Thipkurle ', 'ashishthipkurle2k19@gmail.com', '9860084406', 'Dr. J.J.Magdum college of engineering, Jaysingpur ', 'Third Year', 2, '2024-03-29 00:00:00', 'E33-C2B-E54'),
(146, 2, 'Raktade Aakash Jotiram ', 'aakashraktade@gmail.com', '9324336977', 'Dr. J. J. Magdum College of Engineering ', 'Third Year', 2, '2024-03-29 00:00:00', 'DA4-9D4-8FB'),
(147, 2, 'Aishwarya Rajeshappa Salmote ', 'aishwaryasalmote@gmail.com', '9699078951', 'Dr.J J Magdum college of engineering jaysingpur ', 'Third Year', 2, '2024-03-29 00:00:00', '57B-94E-2B7'),
(148, 2, 'Sourabh Bhimrao Mohite', 'sourabhmohite9696@gmail.com', '8604869696', 'JJ MAGDUM college of engineering Jaysingpur', 'Third Year', 2, '2024-04-03 00:00:00', '7D4-EBD-BBA'),
(149, 3, 'Shailesh Dinde', 'shdinde@gmail.com', '8888763563', 'KIT COEK, Kolhapur', 'Fourth Year', 2, '2024-05-07 00:00:00', '9F7-054-0BC'),
(150, 3, 'Shailesh Dinde', 'shdinde+1@gmail.com', '8888763563', 'KIT COEK, Kolhapur', 'Third Year', 2, '2024-05-07 00:00:00', '19B-154-100'),
(151, 4, 'Shailesh Dinde', 'shdinde@gmail.com', '8888763563', 'KIT COEK, Kolhapur', 'Second Year', 2, '2024-05-14 00:00:00', '7B4-1C0-9D9'),
(152, 4, 'Rutuja Rajendra Tate ', 'rutujatate2909@gmail.com', '9146192001', 'DYP Atu talsande kolhapur ', 'First Year', 2, '2024-05-14 00:00:00', 'F19-A6F-26A'),
(153, 4, 'Ashitosh Krushnarao Inamdar ', 'ashitoshinamdar@gmail.com', '7020653773', 'D.Y.Patil agriculture and technical university ', 'First Year', 2, '2024-05-14 00:00:00', 'FB4-D1E-52F'),
(154, 4, 'Gaurav Gundurao Patil ', 'gauravpatil5375@gmail.com', '9595606027', 'D Y  PATIL ,Talsande', 'First Year', 2, '2024-05-14 00:00:00', '7F4-A74-180'),
(155, 4, 'Pallavi Nandkumar Mali ', 'malipallavi586@gmail.com', '8975332299', 'D.Y Patil Agricultural and Technical University, Talasande ', 'First Year', 2, '2024-05-14 00:00:00', '8BB-22E-563'),
(156, 4, 'Arbaj Panhalkar ', 'arbajpanhalkar19@gmail.com', '9370329224', 'School of Engineering & Technology', 'First Year', 2, '2024-05-14 00:00:00', 'E19-0DF-9A2'),
(157, 4, 'Chavan yash sanjay', 'yashc9503@gmail.com', '7720909790', 'D Y Patil College of Engineering and Technology Talsande', 'First Year', 2, '2024-05-14 00:00:00', '35F-46E-6C4'),
(158, 4, 'Jilani pathan ', 'pjilani4566@gmail.com', '7620144566', 'DYP College talsande', 'First Year', 2, '2024-05-14 00:00:00', '91A-6F9-7E1'),
(159, 4, 'Abrar Mirje', 'abrarmirje5@gmail.com', '9307812483', 'DR. D.Y.PATIL AGRICULTURAL AND TECHNICAL UNIVERSITY ', 'First Year', 2, '2024-05-14 00:00:00', 'CF5-029-0E1'),
(160, 4, 'Dhanashree Sunil Shete', 'shetedhanashree450@gmail.com', '7028976873', 'D.Y.Patil agrictural and technical university Talsande', 'First Year', 2, '2024-05-14 00:00:00', '058-542-3CF'),
(161, 4, 'Aarambhi Sanjay Shingade', 'aarambhishingade317@gmail.com', '7410767536', 'D y patil college talsande', 'First Year', 2, '2024-05-14 00:00:00', '241-746-B46'),
(162, 4, 'Uday pawar ', 'udaypawar4515@gmail.com', '9834314080', 'Dyp', 'First Year', 2, '2024-05-14 00:00:00', 'E3A-67F-10A'),
(163, 4, 'Akanksha Anil patole ', 'patoleakanksha179@gmail.com', '9421846882', 'D Y Patil Agriculture and Technical University talsande ', 'First Year', 2, '2024-05-14 00:00:00', 'A26-F37-7B0'),
(164, 4, 'Kajal Anil Sutar.', 'sutarkajal457@gmail.com', '7756836558', 'D Y Patil Agricultural and Technical University,Talsande', 'First Year', 2, '2024-05-14 00:00:00', '5E0-9C4-409'),
(165, 4, 'Anushka Vijay Chopade ', 'anushkachopade62@gmail.com', '9766468221', 'D Y Patil Agriculture and Technical University, Talsande ', 'First Year', 2, '2024-05-14 00:00:00', 'E01-84F-842'),
(166, 4, 'Aditya Dhanaji Arbune', 'adityaarbune23@gmail.com', '8856048789', 'D. Y. Patil Agriculture and Technical University, Talsande.', 'First Year', 2, '2024-05-14 00:00:00', 'E67-B4D-987'),
(167, 4, 'SUTAR GHANSHAM BHIMRAO', 'sutarghansham294@gmail.com', '7620380547', 'DYPATIL ATU', 'First Year', 2, '2024-05-14 00:00:00', '167-563-BF1'),
(168, 4, 'Sharayu Sanjay patil', 'sharayupatil2626@gmail.com', '9309741894', 'D.Y.Patil College Of Engg & Polytechnic, Talsande', 'First Year', 2, '2024-05-14 00:00:00', 'D35-4B4-7A1'),
(169, 4, 'Neha Sunil Thombare ', 'df.vpn.23@gmail.com', '7757880896', 'DY Patil Agricultural and Technical University Talsande ', 'First Year', 2, '2024-05-14 00:00:00', '552-E32-83A'),
(170, 4, 'Kausen Patwekar', 'kausenpatwekar7535@gmail.com', '9921997389', 'D Y Patil Agricultural And Technical University ,Talsande', 'First Year', 2, '2024-05-14 00:00:00', '6A4-2B8-046'),
(171, 4, 'Abhishek Bhalchandra Magdum ', 'abhishekmagdum03@gmail.com', '9529392285', 'D. Y. Patil Agriculture And Technical University Talsande ', 'First Year', 2, '2024-05-14 00:00:00', '785-22C-07E'),
(172, 4, 'Sayali Subhash Kalekar ', 'sayalikalekar438@gmail.com', '8767270946', 'D.Y.Patil Agriculture and technical institute,talasande', 'First Year', 2, '2024-05-14 00:00:00', '6A1-943-6FB'),
(173, 4, 'Rushikesh Krantikumar More ', 'rushikeshmore140@gmail.com', '9503603666', 'D.Y.patil college of engineering and technology ', 'First Year', 2, '2024-05-14 00:00:00', '947-AAA-7D4'),
(174, 4, 'Shahrukh Dilawar Sanadi', 'shahrukhsanadi9999@gmail.com', '9766634034', 'D Y PATIL ENGINEERING AND TECHNOLOGY UNIVERSITY TALSANDE ', 'First Year', 2, '2024-05-14 00:00:00', '5C7-3D3-FD1'),
(175, 4, 'Patil Aditya Balaso ', 'adityapatil9355@gmail.com', '8149342322', 'D Y Patil Agriculture And Engineering college Talsande Kolhapur ', 'First Year', 2, '2024-05-14 00:00:00', 'CA2-DA5-400'),
(176, 4, 'SUMIT SUNIL GURAV.', 'sumitgurav8181@gmail.com', '9552769401', 'D.Y.Patil Agriculture & Technical University , Talsande', 'First Year', 2, '2024-05-14 00:00:00', 'CF0-A1F-DDE'),
(177, 4, 'Dhanashree Rajendra khot', 'dhanukhot1511@gmail.com', '9356778022', 'D.Y.Patil  Engineering and technology University', 'First Year', 2, '2024-05-14 00:00:00', 'E14-D57-4B2'),
(178, 4, 'Priyanka Prakash Chavan ', 'priyankachavan4707@gmail.com', '9307474707', 'D.Y.Patil College Talsande', 'First Year', 2, '2024-05-14 00:00:00', '8D5-59B-D36'),
(179, 4, 'Pritee Gajanan Awale ', 'priteeawale8@gmail.com', '9531180015', 'DY Patil College Of Agriculture And Technology ', 'First Year', 2, '2024-05-14 00:00:00', '539-404-F1C'),
(180, 4, 'Prashant Ananda Awati', 'prashantawati8661@gmail.com', '9325383033', 'D Y Patil College Kolhapur ', 'First Year', 2, '2024-05-14 00:00:00', '44B-7F6-02A'),
(181, 4, 'Gautam Ashok Pokar', 'gautampokar556@gmail.com', '8208919127', 'D Y Patil Agriculture and Technical University ', 'First Year', 2, '2024-05-14 00:00:00', '077-E50-F04'),
(182, 4, 'Shruti Sandip Patil ', 'shrutipatil5537@gmail.com', '7558587241', 'D.Y.Patil College Talsande ', 'First Year', 2, '2024-05-14 00:00:00', 'D4A-5E4-8B3'),
(183, 4, 'Neha Ranjit Nalage', 'nalageneha@gmail.com', '9404985343', 'D.Y.Patil Agriculture and Technical University, Talasande', 'First Year', 2, '2024-05-14 00:00:00', '099-15B-F6E'),
(184, 4, 'Vaishnavi Kadgonda Patil ', 'vaishnavikpatil2929@gmail.com', '9022685124', 'D.Y.Patil Agriculture and Technical University ', 'First Year', 2, '2024-05-14 00:00:00', '2B6-424-16A'),
(185, 4, 'Shruti Jitendra Patil ', 'Shrutijpatil2611@gmail.com', '7666046196', 'Dy patil ', 'First Year', 2, '2024-05-14 00:00:00', 'B33-614-B9E'),
(186, 4, 'Vishwnath Baburao Lakhan', 'vishulakhan6027@gmail.com', '9112126027', 'DY Patil College Talsande, Kolhapur', 'First Year', 2, '2024-05-14 00:00:00', '390-B12-106'),
(187, 4, 'SAHIL SANJAY JADHAV', 'sahiljadhav702@gmail.com', '9403982618', 'D Y Patil Agriculture and Technical  University ', 'First Year', 2, '2024-05-15 00:00:00', 'DDF-701-915'),
(188, 4, 'Nikita Mahavir Bhilawade ', 'nikitabhilawade2007@gmail.com', '9527580677', 'D.Y.patil college, Talasande ', 'First Year', 2, '2024-05-15 00:00:00', 'DC7-E0A-3D6'),
(189, 4, 'Shubham Shashikant Mane ', 'maneshubham201@gmail.com', '9036320586', 'D Y patil Agriculture and technical University Talsande Kolhapur ', 'First Year', 2, '2024-05-15 00:00:00', '6B3-151-424'),
(190, 4, 'Omkar Shrikant Mane ', 'maneomkar8907@gmail.com', '7498742908', 'D Y Patil College Talsande ', 'First Year', 2, '2024-05-15 00:00:00', '55D-75B-DD7'),
(191, 4, 'Sangram Sunil Shinde ', 'sangramshinde7007@gmail.com', '9156602715', 'D. Y. Patil Agriculture and Technical University Talsande ', 'First Year', 2, '2024-05-15 00:00:00', 'DB9-10D-A15'),
(192, 4, 'Rushikesh Manohar Ghatage ', 'rushighatage181800@gmail.com', '7410181800', 'D Y Patil Agriculture and Technical University,Talsande', 'First Year', 2, '2024-05-15 00:00:00', 'B45-CE7-069'),
(193, 4, 'Aruna  Khanderao Londhe', 'arunalondhe@2028gmail.com', '9130196024', 'D.Y.patil Engineering and technical University Talsande.', 'First Year', 2, '2024-05-15 00:00:00', '536-BAF-175'),
(194, 4, 'Tanishka Sachin Bhosale', 'tanishkabhosale2003@gmail.com', '09370126026', 'D. Y. Patil Talsande', 'First Year', 2, '2024-05-15 00:00:00', '40F-FCF-523'),
(195, 4, 'Monika Dasharath Bhosale ', 'monikabhosale2002@gmail.com', '8308528402', 'D.Y.Patil Talsande', 'First Year', 2, '2024-05-15 00:00:00', '860-074-F89'),
(196, 4, 'Aruna  Khanderao Londhe', 'arunalondhe2028@gmail.com', '9130196024', 'D.Y.patil Engineering and technical University Talsande.', 'First Year', 2, '2024-05-15 00:00:00', 'B7E-EF8-1C2'),
(197, 4, 'Madhura Mahadev Khot ', 'madhurakhot2003@gmail.com', '9022386121', 'D.Y.Patil college, Talsande ', 'First Year', 2, '2024-05-15 00:00:00', 'C29-9A3-415'),
(198, 4, 'Priyanka Houserao Mali', 'piyumali2311@gmail.com', '8180915999', 'DY Patil college talsande', 'First Year', 2, '2024-05-15 00:00:00', 'A13-81B-5F0'),
(199, 4, 'Ghorpade Mrunali Mohan ', 'ghorpademrunali06@gmail.com', '7219530250', 'D.Y.Patil, Talsande ', 'First Year', 2, '2024-05-15 00:00:00', 'DDA-63F-35A'),
(200, 4, 'Yadav pragati prakash', 'pragatiyadav089@gmail.com', '9322500730', 'D. Y. Patil Talsande', 'First Year', 2, '2024-05-15 00:00:00', '5E4-261-E60'),
(201, 4, 'Pramila Balaso Kavade ', 'kavadepramila1102@gmail.com', '8600136722', 'D Y Patil AGRICULTURE and TECHNICAL UNIVERSITY TALSANDE ', 'First Year', 2, '2024-05-15 00:00:00', '1F1-CFE-0DE'),
(202, 4, 'Vishal Dilip Patil', 'vishalpatil2212000@gmail.com', '9552305774', 'D y patil University talsande ', 'First Year', 2, '2024-05-15 00:00:00', '172-21E-AEE'),
(203, 4, 'Shivprasad abaso chendake ', 'shivprasadchendake45@gmail.com', '9021600400', 'Dypatil college talsande', 'First Year', 2, '2024-05-15 00:00:00', '35C-CE5-A30'),
(204, 4, 'Gafar Mahamadshafiq Desai ', 'gafardesai768@gmail.com', '9307325462', 'DYP-ATU Talsande ', 'First Year', 2, '2024-05-15 00:00:00', '095-B8C-5FE'),
(205, 4, 'Shubham Madhukar Mali', 'shubhammali4562@gmail.com', '7720825330', 'D.Y.Patil Agriculture and Technical University Talsande ', 'First Year', 2, '2024-05-15 00:00:00', 'F1F-963-F9C'),
(206, 4, 'Sagar Sunil Bhosale ', 'bhosalesagar215@gmail.com', '8530375692', 'D.Y.Patil Agricultural & Technical University, Talsande', 'First Year', 2, '2024-05-15 00:00:00', '1A9-D01-613'),
(207, 4, 'Abhishek Ashok Rajoba ', 'abhishekrajoba3935@gmail.com', '9359031364', 'D.Y.Patil agriculture and technical University Talsande ', 'First Year', 2, '2024-05-15 00:00:00', '39B-A91-5CB'),
(208, 4, 'Pritesh Shivanand Mudase', 'priteshmudase@gmail.com', '9529002735', 'D Y Patil AGRICULTURE AND TECHNICAL UNIVERSITY TALSANDE', 'First Year', 2, '2024-05-15 00:00:00', '153-C92-F49'),
(209, 4, 'Prathmesh Arvind Kumbhar ', 'prathmeshkumbhar9842@gmail.com', '9130859842', 'D Y PATIL Agriculture & Technical University ', 'First Year', 2, '2024-05-15 00:00:00', 'C6C-1C2-9CD'),
(210, 4, 'Saalemahamad Sadik Momin', 'saalimmomin099@gmail.com', '7028501431', 'DYP Talsande', 'First Year', 2, '2024-05-15 00:00:00', '0CE-7FF-CB6'),
(211, 4, 'Nadim Faruk Devale', 'devalenadim@gmail.com', '8421844224', 'DYP Talsande', 'First Year', 2, '2024-05-15 00:00:00', 'C87-F70-12E'),
(212, 4, 'Shubhangi Baban Shirtode ', 'shubhangishirtode16@gmail.com', '9579948382', 'Dyp agriculture & technical University,talsande', 'First Year', 2, '2024-05-15 00:00:00', '91D-BD3-CB1'),
(213, 4, 'Omkar Anil Tandale ', 'omkartandale725@gmail.com', '8830457008', 'D.Y.Patil agriculture and technology university, Talsande ', 'First Year', 2, '2024-05-15 00:00:00', 'D70-CBD-ED2'),
(214, 4, 'SNEHAL SANJAY HANMANT', 'snehalhanmant7718@gmail.com', '7798631558', 'D.Y.Patil Agriculture And Technology University,Talsande', 'First Year', 2, '2024-05-15 00:00:00', '57F-DD7-80C'),
(215, 4, 'Alvira Najir Sayyad', 'alvirasayyad27@gmail.com', '8788075027', 'D.Y.Patil Agriculture and Technology University Talsande ', 'First Year', 2, '2024-05-15 00:00:00', '669-756-CF2'),
(216, 4, 'omkar sampatrao  mali', 'maliomkar860@gmail.com', '9307682092', 'D.Y.Patil college  talasnde ', 'First Year', 2, '2024-05-15 00:00:00', '758-579-FCE'),
(217, 4, 'Shambhuraj subhash khot ', 'Shambhurajkhot02@gmail.com', '7666642996', 'D. Y. PATIL COLLEGE OF ENGINEERING AND TECHNOLOGY ', 'First Year', 2, '2024-05-15 00:00:00', '2F2-76C-5C7'),
(218, 4, 'Manish Anil Pawar', 'manishpawar200212@gmail.com', '9322642494', 'D. Y. Patil College talsande', 'First Year', 2, '2024-05-15 00:00:00', '668-15F-AE7'),
(219, 4, 'Shambhuraj subhash khot ', 'Shambhurajkhot29@gmail.com', '7666642996', 'D. Y. PATIL ENGINEERING AND TECHNOLOGY ', 'First Year', 2, '2024-05-15 00:00:00', '3AD-54F-B0D'),
(220, 4, 'Prathmesh bajirao thombare ', 'prathmeshthombre4@gmail.com', '8484953490', 'Dy Patil agriculture and technical university ', 'First Year', 2, '2024-05-15 00:00:00', '8FF-B7A-968'),
(221, 4, 'Ganesh dinkar zende', 'zendeganesh168@gmail.com', '7249127395', 'Dyp agriculture and technical university talsande', 'First Year', 2, '2024-05-15 00:00:00', '27F-672-A6E'),
(222, 4, 'Aarya Vivek Pawar', 'aaryapawar129@gmail.com', '7775820246', 'D.Y Patil Agriculture and Technical University, Talsande.', 'First Year', 2, '2024-05-15 00:00:00', 'B71-349-030'),
(223, 5, 'Shailesh Dinde', 'shdinde@gmail.com', '8888763563', 'KIT COEK, Kolhapur', 'First Year', 2, '2024-05-15 00:00:00', '796-696-09F'),
(224, 4, 'Anekar Rohan Krishna', 'rohananekar1234@gmail.com', '9422844047', 'DYP Agriculture and Technical University Talsande', 'First Year', 2, '2024-05-15 00:00:00', 'AF9-E40-6F7'),
(225, 4, 'Pooja Rajendra Chougule ', 'chougulep483@gmail.com', '9284783421', 'D Y PATIL Agriculture and Technical University ', 'First Year', 2, '2024-05-16 00:00:00', '769-E78-51C'),
(226, 4, 'Abhishek Rajeev Khondre. ', 'abhikhondre11@gmail.com', '7028586324', 'DY Patil ', 'First Year', 2, '2024-05-16 00:00:00', 'FB9-404-B2F'),
(227, 5, 'Sayali jagtap', 'sayalijagtap.j28@gmail.com', '8983455767', 'DYP-ATU', 'Second Year', 2, '2024-05-16 00:00:00', 'EEB-3EF-334'),
(228, 5, 'Anuja Salunkhe', 'anusalunkhe23@gmail.com', '8698876245', 'D.Y.Patil Agriculture & Technical University ', 'Second Year', 2, '2024-05-16 00:00:00', 'FF1-BD9-452'),
(229, 5, 'Vaishnavi Mahesh wali ', 'Vaishnaviwali21@gmail.com', '8483034918', 'DYPATIL Agricultural and Technical university, Talsande ', 'Second Year', 2, '2024-05-16 00:00:00', 'A61-93D-F31'),
(230, 4, 'Pratik Prasad Mahadik', 'pratikmahadik6611@gmail.com', '9545005903', 'D Y Patil Agriculture and Technical University Talsande ', 'First Year', 2, '2024-05-16 00:00:00', '6E8-E66-739'),
(231, 4, 'Omkar Sanjay Shinde ', 'omkarshinde1772@gmail.com', '8805005118', 'DYP Technical and agricultural college,Talsande ', 'First Year', 2, '2024-05-16 00:00:00', 'DDC-3D8-DE0'),
(232, 5, 'Shruti Anil Done ', 'shrutidone09@gmail.com', '9371524722', 'DYP-ATU talsande ', 'Second Year', 2, '2024-05-16 00:00:00', '640-FF0-A92'),
(233, 5, 'Shruti Anil Done ', 'doneneha01@gmail.com', '9371524722', 'DYP-ATU talsande ', 'Second Year', 2, '2024-05-16 00:00:00', '477-B1A-35B'),
(234, 4, 'Shruti Anil Done ', 'doneneha01@gmail.com', '9371524722', 'DYP-ATU talsande ', 'Second Year', 2, '2024-05-16 00:00:00', '0D0-059-8C9'),
(235, 5, 'Pratiksha Balasaheb Patil ', 'pratikshapatilbnd@gmail.com', '8951298065', 'DYPatil college talsande', 'Second Year', 2, '2024-05-16 00:00:00', 'DFA-F54-BFE'),
(236, 5, 'Siddhi Sunil Ganbavale', 'ganbavalesiddhi02@gmail.com', '9404336717', 'D.Y.Patil Agriculture and Technical University,Talsande,Kolhapur', 'Second Year', 2, '2024-05-16 00:00:00', 'EFD-A7B-35E'),
(237, 5, 'Vishakha Vijay Desai', 'vvdesai2003@gmail.com', '9359268277', 'D.Y.Patil Agriculture and Technical University Talsande', 'Second Year', 2, '2024-05-16 00:00:00', '34B-2AD-7DC'),
(238, 5, 'Vighnesha Sandip Karvekar', 'karvekarvighnesha@gmail.com', '7499656825', 'D.Y. Patil Agriculture and Technical University Talsande', 'Second Year', 2, '2024-05-16 00:00:00', '646-990-81B'),
(239, 5, 'Samruddhi sanjay patil', 'samruddhi2392@gmail.com', '9604919453', 'D Y P Agriculture &  Technical University Thalsande', 'Second Year', 2, '2024-05-16 00:00:00', 'AAF-B02-969'),
(240, 5, 'VIVEK DURGULE ', 'vdurgule31@gmail.com', '9112251225', 'D.Y. PATIL, ATU, TALSANDE ', 'Second Year', 2, '2024-05-16 00:00:00', '5BA-975-59D'),
(241, 5, 'APURVA ANIL JADHAV', 'apurvajad2626@gmail.com', '9699149586', 'D. Y. Patil Agriculture & Technical University, Talsande', 'Second Year', 2, '2024-05-16 00:00:00', '2B9-F3A-B95'),
(242, 5, 'Sonali Bhauso Vidure', 'viduresonali@gmail.com', '8180939354', 'DYP-ATU, Talsande', 'Second Year', 2, '2024-05-16 00:00:00', '889-17D-13C'),
(243, 5, 'Manik sambhaji kumbhar', 'kaushalkumbhar07@gmail.com', '7276406282', 'DYP-ATU,talsande', 'Second Year', 2, '2024-05-16 00:00:00', '6E5-045-D8B'),
(244, 5, 'Ashraf Jamadar', 'ashrafjamadar707@gmail.com', '8805442778', 'DY Patil agriculture and technical University (ATU) ', 'Second Year', 2, '2024-05-16 00:00:00', 'B7A-E77-9CC'),
(245, 5, 'Apeksha Dipak Jagtap ', 'apekshajagtap27@gmail.com', '8793521553', 'D. Y. Patil ATU', 'Second Year', 2, '2024-05-16 00:00:00', 'F70-834-3DD'),
(246, 5, 'Omkar Mahadev Mali ', 'omkarmali0814@gmail.com', '8010827376', 'D Y Patil college of engineering and technology, Talsande ', 'Second Year', 2, '2024-05-16 00:00:00', 'C65-896-482'),
(247, 5, 'Priyanka Ravindra Jangam ', 'jangampriyanka4@gmail.com', '9579230174', 'D Y Patil Agriculture and Technical University,Talsande, Kolhapur ', 'Second Year', 2, '2024-05-16 00:00:00', '52B-2FD-174'),
(248, 5, 'Veena tanaji patil ', 'pveena@020gmail.com', '8010656441', 'School of Engineerring and technology, talasande', 'Second Year', 2, '2024-05-16 00:00:00', '022-E19-00C'),
(249, 5, 'Shantanu Ganpati Kumbhar', 'shantanukumbhar210@gmail.com', '8767739911', 'DYP-ATU , TALSANDE', 'Second Year', 2, '2024-05-16 00:00:00', 'D36-219-21D'),
(250, 5, 'Sanika Satej Parit ', 'sanikaparit8@gmail.com', '8530878350', 'D Y Patil Agriculture & Technology University Talsande', 'Second Year', 2, '2024-05-16 00:00:00', '281-950-AAC'),
(251, 5, 'Saniya Ambi', 'saniyaambi9@gmail.com', '9975889416', 'D Y Patil Agriculture and Technical University, Talsande', 'Second Year', 2, '2024-05-16 00:00:00', '61C-AF8-005'),
(252, 5, 'Vaishnavi Vinayak Shinde ', 'vaishnavishinde2052@gmail.com', '8275142525', 'D Y Patil Agriculture and Technical University Talasande ', 'Second Year', 2, '2024-05-16 00:00:00', '6ED-BD1-D99'),
(253, 5, 'Siddhartha Bhalchandra patil', 'patilsiddhartha784@gmail.com', '8010560960', 'D.Y.Patil College Of Agriculture And Technical University', 'Second Year', 2, '2024-05-16 00:00:00', '508-A0D-F57'),
(254, 5, 'Kaushal Kiran Kadam', 'kaushalkadam5722@gmail.com', '7028664041', 'Dy Patil Agriculture and Technical University Talsande, Kolhapur.', 'Second Year', 2, '2024-05-16 00:00:00', '65E-881-0F6'),
(255, 5, 'SAMRUDDHI RAJARAM PATIL', 'patilsamruddhi777@gmail.com', '7796853592', 'D.Y.Patil Agriculture & Technical University Talsande', 'Second Year', 2, '2024-05-16 00:00:00', 'AAA-8D0-B64'),
(256, 5, 'Pranirta Arun Patil', 'patilpanu8093@gmail.com', '9370119819', 'D.Y.Patil College Of Agriculture And Technical University', 'Second Year', 2, '2024-05-16 00:00:00', '847-965-452'),
(257, 4, 'Pranita Prakash Patil ', 'pranitapatil9350@gmail.com', '9423951917', 'DYP College, Talsande ', 'First Year', 2, '2024-05-16 00:00:00', 'C3A-A89-4DA'),
(259, 5, 'Abhijeet Bajirao Chavan', 'chavanabhijee411@gmail.com', '7507449825', 'D Y Patil engineering & Techanical collage ,Talsande', 'Second Year', 2, '2024-05-16 00:00:00', '5C2-012-1D4'),
(260, 5, 'Sakshi Anil Borgaonkar ', 'sakshianilborgaonkar287@gmail.com', '7028236605', ' Dyp talsande ', 'Second Year', 2, '2024-05-16 00:00:00', '440-DC9-234'),
(261, 5, 'Sakshi Sandip Patil ', 'sakshipatil9104@gmail.com', '7028624489', 'D. Y. Patil agriculture and technical University', 'Second Year', 2, '2024-05-16 00:00:00', 'C43-F18-70B'),
(262, 4, 'Aishwarya Dhanaji Yadav', 'aishwaryayadav2722@gmail.com', '9359232722', 'D. Y. Patil  Agriculture And Technical University,Talsande', 'First Year', 2, '2024-05-16 00:00:00', '503-B3D-390'),
(263, 5, 'Tushar Uttam Desai', 'TusharDesai8308@gmail.com', '9607471513', 'D. Y. Patil agriculture and technical University', 'Second Year', 2, '2024-05-16 00:00:00', '984-A8C-8AF'),
(264, 5, 'Tushar Uttam Desai', 'sp1378952@gmail.com', '7028624489', 'D. Y. Patil agriculture and technical University', 'Second Year', 2, '2024-05-16 00:00:00', '8C9-D62-995'),
(265, 5, 'Omkar Krushnat Mali', 'maliomkar4262@gmail.com', '7410544262', 'DYP ATU Talsande', 'Second Year', 2, '2024-05-16 00:00:00', 'BAE-9D0-792'),
(266, 4, 'Mokashi amruta balasaheb', '2122amrutamokashi@gmail.com', '7498776946', 'D.Y Patil agriculture and technical university talsande ', 'First Year', 2, '2024-05-16 00:00:00', 'AD0-082-CCA'),
(267, 4, 'Vaishnavi Maruti Pawar ', 'vaishnavipawar1717@gmail.com', '8767626435', 'D Y Patil Agriculture & Technical University Talsande ', 'First Year', 2, '2024-05-17 00:00:00', '0FA-AA1-D32'),
(268, 5, 'Pooja Prakash Solase ', 'poojasolase08@gmail.com', '7499114811', 'D.Y.Patil Agriculture and Technical University,Talsande.', 'Second Year', 2, '2024-05-17 00:00:00', '3B9-087-C5D'),
(269, 5, 'Kunal Babaso mali ', 'kunalmali526@gmail.com', '9404974148', 'D Y Patil College of Engineering and Technology, Talsande', 'Second Year', 2, '2024-05-17 00:00:00', 'BA1-2EC-7A0'),
(270, 5, 'SHRUTI SAYAJI JADHAV ', 'jadhavshruti581@gmail.com', '9579328856', 'D Y PATIL AGRICULTURAL & TECHNICAL UNIVERSITY, TALSANDE', 'Second Year', 2, '2024-05-17 00:00:00', '0F0-2EE-0E3'),
(271, 5, 'SANIKA PRADEEP JADHAV ', 'sanikajadhav382@gmail.com', '8459769466', 'D Y PATIL AGRICULTURE & TECHNICAL UNIVERSITY, TALSANDE', 'Second Year', 2, '2024-05-17 00:00:00', 'BB8-449-B2A'),
(272, 5, 'Akanksha Ananda Chile', 'chileakankasha007@gmail.com', '7887521819', 'DYP-ATU', 'Second Year', 2, '2024-05-17 00:00:00', '2D1-78D-FD3'),
(273, 5, 'Radhika kashinath vhanmane ', 'vhanmaneradhika4@gmail.com', '9518732007', 'DYP-ATU', 'Second Year', 2, '2024-05-17 00:00:00', '59E-BDE-3B3'),
(274, 5, 'Pranali  Prakash Patil', 'ppranali366@gmail.com', '7776842517', 'DYP-ATU', 'Second Year', 2, '2024-05-17 00:00:00', 'E6D-9C8-2B0'),
(275, 5, 'Sayali Bhimrao Gavali ', 'gavalisayali2004@gmail.com', '7768813102', 'DYP-ATU', 'Second Year', 2, '2024-05-17 00:00:00', '955-944-1E9'),
(276, 5, 'Aditi Rajaram Patil ', 'patiladiti498@gmail.com', '9699250781', 'DYP patil agriculture and technical University ', 'Second Year', 2, '2024-05-17 00:00:00', '65C-730-3AE'),
(277, 5, 'Vaishnavi Vinayak Shinde ', 'vaishnavi23092004@gmail.com', '8275142525', 'D Y Patil Agriculture and Technical University Talasande ', 'Second Year', 2, '2024-05-17 00:00:00', '152-9D8-64D'),
(278, 4, 'Abhinandan Baburao Khaware', 'khawareabhi6@gmail.com', '7057659418', 'D Y patil University talsande', 'First Year', 2, '2024-05-18 00:00:00', 'A4F-727-8A3'),
(279, 5, 'Prem chavan', 'premchavan1465@gmail.com', '7758874505', 'D Y Patil collage talsande', 'Second Year', 2, '2024-05-18 00:00:00', '3DD-18B-16C'),
(280, 5, 'Priyanka Rajaram Chougule ', 'rajaramchougule60@gmail.com', '8767046368', 'Dr. D. Y. Patil agricultural and technical university Talsande ', 'Second Year', 2, '2024-05-18 00:00:00', '236-F84-358'),
(281, 5, 'Sneha Ananda Chougule', 'chougulesneha2004@gmail.com', '8010825966', 'Dyp-atu talsande', 'Second Year', 2, '2024-05-18 00:00:00', '983-228-18E');
INSERT INTO `student` (`id`, `workshopid`, `name`, `email`, `mobile`, `college_name`, `class`, `status`, `registration_date`, `verification_code`) VALUES
(282, 5, 'Shweta Bharat Chivate ', 'shwetachivate123@gmail.com', '9022413731', 'D.Y.PATIL Agriculture & Technical University,Talsande', 'Second Year', 2, '2024-05-18 00:00:00', '029-F85-BE5'),
(283, 5, 'Rutuja Yuvaraj patil ', 'prutuja572@gmail.com', '9370081512', 'D.y.patil agricultural and technical University Talsande', 'Second Year', 2, '2024-05-18 00:00:00', 'EF2-5F1-6EC'),
(284, 5, 'Priti Deepak chougule ', 'priti.chougule1045@gmail.com', '8806214107', 'D y.patil agriculture and technical University talsande', 'Second Year', 2, '2024-05-18 00:00:00', '665-E98-5C1'),
(285, 5, 'Tushar Dhanaji Narute', 'narutetushar15@gmail.com', '8767189248', 'D.Y.Patil Agriculture And Technical University talsande', 'Second Year', 2, '2024-05-18 00:00:00', 'EE5-B3D-C1C'),
(286, 5, 'Salokhe Shubham Arun ', 'shubhamsalokhe180@gmail.com', '8767181233', 'D Y Patil Agriculture and Technical University,Talsande', 'Second Year', 2, '2024-05-18 00:00:00', '7C3-574-7E0'),
(287, 4, 'Digvijaysinh Ravindra Bhosale ', 'digvijaysinhbhosale961@gmail.com', '7387344634', 'D.Y.Patil University ', 'First Year', 2, '2024-05-18 00:00:00', '27F-D7F-E72'),
(288, 5, 'Salokhe Shubham Arun ', 'shubhamsalokhe461@gmail.com', '8767181233', 'D Y Patil Agriculture and Technical University,Talsande', 'Second Year', 2, '2024-05-18 00:00:00', 'A5E-949-4A4'),
(289, 6, 'Shailesh Dinde', 'shdinde@gmail.com', '8888763563', 'KIT COEK, Kolhapur', 'Second Year', 2, '2024-05-18 00:00:00', '4A3-4CD-04C'),
(290, 5, 'Sana Jahangeer pinjari ', 'sanapinjari9192@gmail.com', '7020735177', 'D.Y.Patil Talsande', 'Second Year', 2, '2024-05-19 00:00:00', '210-DE0-95F'),
(291, 6, 'Eshwari Amit Chavan ', 'eshwarichavan08@gmail.com', '9119431875', 'KBPCOES ', 'Third Year', 2, '2024-05-19 00:00:00', '0C9-C2F-79B'),
(292, 6, 'Kshirsagar Pranali Vikas', 'ipranalikshirsagar@gmail.com', '07507244861', 'Karmaveer Bhaurao Patil College Of Engineering Satara', 'Third Year', 2, '2024-05-19 00:00:00', '768-1EF-03E'),
(293, 6, 'Deshmukh Sharvari Hiroji ', 'sharvari0205@gmail.com', '9764020503', 'Karmaveer bhaurao patil college of engineering satara', 'Third Year', 2, '2024-05-19 00:00:00', 'F3E-145-906'),
(294, 6, 'Vedantika Gharge', 'vedantikagharge24@gmail.com', '9175797321', 'Karmveer bhaurao patil college of engineering satara', 'Third Year', 2, '2024-05-19 00:00:00', '3EE-2E6-655'),
(295, 6, 'Laxman Ramchandra Mane', 'laxmanmane9545@gmail.com', '918767597059', 'Karmaveer Bhaurao Patil College Of Engineering Satara', 'Third Year', 2, '2024-05-19 00:00:00', '121-757-13A'),
(296, 6, 'Patel Prachi Vinod ', 'prachipatel5887@gmail.com', '7410102869', 'Karmaveer Bhaurao Patil College Of Engineering Satara ', 'Third Year', 2, '2024-05-19 00:00:00', '518-CD5-5FB'),
(297, 6, 'PRATHAM SAGAR MALVADE', 'prathammalvadepm11@gmail.com', '9657260248', 'Karmaveer Bhaurao Patil College of Engineering satara ', 'Third Year', 2, '2024-05-19 00:00:00', '0ED-1DC-9FF'),
(298, 6, 'Avanti Rajendra Salunkhe ', 'avantisalunkhe150@gmail.com', '7620650914', 'KBPCOE Satara ', 'Third Year', 2, '2024-05-19 00:00:00', '0B2-CB8-B33'),
(299, 6, 'RAJ ASHOK SABALE', 'sabaleraj744@gmail.com', '7558550310', 'Karmaveer Bhaurao Patil College of Engineering Satara ', 'Third Year', 2, '2024-05-19 00:00:00', '5E0-18B-353'),
(300, 6, 'Chinmay Deepak Pol', 'chinmaypol04@gmail.com', '8261955808', 'KBP College of Engineering Satara', 'Third Year', 2, '2024-05-19 00:00:00', 'DA6-AE9-06A'),
(301, 6, 'Swastik Bhosale', 'swastik2003bhosale@gmail.com', '9284433797', 'Karmaveer Bhaurao Patil College of engineering Satara ', 'Third Year', 2, '2024-05-19 00:00:00', '441-3B6-67B'),
(302, 6, 'SHARAYU GANESH PATIL ', 'sharayupatil0503@gmail.com', '9970652677', 'Karmaveer Bhaurao Patil College of Engineering, Satara ', 'Third Year', 2, '2024-05-19 00:00:00', 'F2A-963-BED'),
(303, 6, 'Aayan Javid Sayyad', 'aayansayyad19@gmail.com', '8805296210', 'Karmaveer Bhaurao Patil College of Engineering,Satara', 'Third Year', 2, '2024-05-19 00:00:00', 'C1C-AF2-F17'),
(304, 6, 'Patil Pranit', 'pranitpatil225@gmail.com', '7709332063', 'Kbp college of engineering,satara', 'Third Year', 2, '2024-05-19 00:00:00', '784-713-770'),
(305, 6, 'Rutuja Navnath Mulik ', 'rutujamulik2003@gmail.com', '9850374558', 'Karmveer bhaurao patil college of engineering satara ', 'Third Year', 2, '2024-05-19 00:00:00', '6C4-CB7-EDB'),
(306, 6, 'Prabhakar Pratap Awate', 'prabhuawate123@gmail.com', '9146506489', 'Karmaveer Bhaurao Patil College of Engineering Satara ', 'Third Year', 2, '2024-05-19 00:00:00', '9F5-E74-3E5'),
(307, 6, 'Manasvi Vikas Dhumal ', 'dhumalmanasvi9@gmail.com', '8390869796', 'KBPCOES', 'Third Year', 2, '2024-05-19 00:00:00', '35C-D0D-C14'),
(308, 6, 'Suhani santosh shinde', 'shindesuhani205@gmail.com', '8766613078', 'Kbpcoes', 'Third Year', 2, '2024-05-19 00:00:00', '0E4-C51-177'),
(309, 6, 'Aryanraje Maharudra Dhokale', 'aryanrajedhokale19@gmail.com', '9405167120', 'Karmveer Bhaurao Patil College Of Engineering,satara.', 'Third Year', 2, '2024-05-19 00:00:00', '3BB-E7B-B7E'),
(310, 6, 'Taralekar Shreyas Mahesh', 'shreyastaralekar28@gmail.com', '9359996215', 'K.B.P College of Engineering,Satara', 'Third Year', 2, '2024-05-19 00:00:00', '0CF-F28-E13'),
(311, 6, 'Pratik Nagesh Mote ', 'pratikmote5394@gmail.com', '9359724207', 'Karmaveer Bhaurao Patil College Of Engineering Satara ', 'Third Year', 2, '2024-05-19 00:00:00', '13D-37B-8E3'),
(312, 6, 'kaustubh iparkar', 'kaustubhiparkar@gmail.com', '9665373281', 'Karmveer Bhaurao Patil College of Engineering Satara.', 'Third Year', 2, '2024-05-19 00:00:00', '9B8-EF2-35B'),
(313, 6, 'Shubham Vitthal Shinde', 'shubhamshinde6287@gmail.com', '7447578845', 'Karmveer bhaurao patil college of engineering,satara', 'Third Year', 2, '2024-05-19 00:00:00', 'E66-B0D-47F'),
(314, 6, 'Vishwajeet Dipak Kadam ', 'vishukadam0703@gmail.com', '8180840912', 'Kbp college of engineering ', 'Third Year', 2, '2024-05-19 00:00:00', 'B43-439-8C6'),
(315, 6, 'Aarya Abhijeet Gharge ', 'aaryagharge2002@gmail.com', '8806146898', 'Karmaveer Bhaurao patil college of engineering satara', 'Third Year', 2, '2024-05-19 00:00:00', '9AB-267-56E'),
(316, 6, 'Ayan Adam Pathan', 'ayanpathan150150@gmail.com', '9657795886', 'Karamveer Bhauro Patil College of Engineering, Satara', 'Third Year', 2, '2024-05-19 00:00:00', '620-521-F00'),
(317, 6, 'Aditya Vinayak Shinde', 'shindeaditya609@gmail.com', '8421949010', 'Karmaveer bhaurao patil college of engineering', 'Third Year', 2, '2024-05-19 00:00:00', 'FC4-5D9-F43'),
(318, 6, 'Ajinkya Dhane', 'ajinkyadhane12@gmail.com', '8446355907', 'Karamveer Bhauro Patil College of Engineering', 'Third Year', 2, '2024-05-19 00:00:00', '506-BB1-FC9'),
(319, 6, 'Atharva Amol Ghadge ', 'atharvaghadge423@gmail.com', '8263008052', 'Karmaveer Bhaurao Patil College of Engineering Satara ', 'Third Year', 2, '2024-05-19 00:00:00', '7C0-83C-FE2'),
(320, 6, 'Pranita Prabhakar Yewale', 'pranitayewale2488@gmail.com', '9923457352', 'KBP College of Engineering, Satara', 'Third Year', 2, '2024-05-20 00:00:00', '81B-D07-BBF'),
(321, 6, 'Shivam Zanjurne', 'z.shivam093@gmail.com', '7744930127', 'Karmaveer Bhaurao Patil College Of Engineering Satara', 'Third Year', 2, '2024-05-20 00:00:00', '852-969-AF7'),
(322, 6, 'pruthviraj patil', 'pruthvipatil26@gmail.com', '9763033032', 'KBP COES', 'Second Year', 2, '2024-05-20 00:00:00', '15D-EA6-F69'),
(323, 6, 'Utkarsha santosh patil ', 'patilutkarsha975@gmail.com', '8799948264', 'Karmveer Bhaurao college of engineering satara ', 'Third Year', 2, '2024-05-20 00:00:00', '851-5D5-795'),
(324, 6, 'Sourabh Sadashiv Patil', 'sourabhp2624@gmail.com', '9284496720', 'Karnaveer Bhaurao Patil College Of Engineering Satara', 'Third Year', 2, '2024-05-20 00:00:00', '61C-F97-AE9'),
(325, 6, 'VISHAl SUBHASH MANE', 'vm371905@gmail.com', '8956684591', 'Karmveer bhaurao patil college of engineering satara ', 'Third Year', 2, '2024-05-20 00:00:00', 'C6F-BD7-5AE'),
(326, 6, 'Adil Ismail Shaikh ', 'adilshaikh4635@gmail.com', '8459389662', 'Karmaveer Bhaurao Patil College of Engineering, Satara.', 'Third Year', 2, '2024-05-20 00:00:00', '70E-4A9-97D'),
(327, 6, 'Mohit Nitin Hol', 'holmohit@gmail.com', '8180009487', 'Karmaveer Bhaurao patil COE Satara', 'Third Year', 2, '2024-05-20 00:00:00', 'EC4-BCA-E8D'),
(328, 6, 'Avishkar Vilas Bhujbal ', 'avishkar.033@gmail.com', '8625801974', 'Karmaveer Bhaurao patil college of engineering satara ', 'Third Year', 2, '2024-05-20 00:00:00', '06E-AAE-B69'),
(329, 6, 'Om Ajay Pawar ', 'ompawar3000@gmail.com', '8208024158', 'Karmaveer bhaurao patil college of engineering satara ', 'Third Year', 2, '2024-05-20 00:00:00', '101-7C9-AA9'),
(330, 6, 'Prathmesh Anil Sankpal', 'prathmeshsankpal483@gmail.com', '7249022505', 'Karmaveer Bhaurao Patil College of Engineering Satara ', 'Third Year', 2, '2024-05-20 00:00:00', '30E-465-30F'),
(331, 6, 'Ritesh Prakash Mane', 'riteshmane402@gmail.com', '7775079182', 'Karmveer bhaurao patil college of engineering satara', 'Third Year', 2, '2024-05-20 00:00:00', '784-593-5B5'),
(332, 6, 'Abhishek Ravindra Sonawane ', 'abhishekrsonawane2002@gmail.com', '8177963325', 'Karmaveer Bhaurao Patil College of Engineering, Satara ', 'Third Year', 2, '2024-05-20 00:00:00', 'B18-E69-EFE'),
(333, 6, 'Geetesh Gajendra Barge ', 'geeteshbarge@gmail.com', '7821980495', 'Karmaveer Bhaurao Patil College of Engineering Satara', 'Third Year', 2, '2024-05-20 00:00:00', '91B-E96-68B'),
(334, 6, 'Nishant Ganesh Yadav ', 'nishantyadav0309@gmail.com', '7219247633', 'KBPCOES, Satara ', 'Third Year', 2, '2024-05-20 00:00:00', '77E-719-66E'),
(335, 6, 'Renu Rajendra Patil ', 'renurpatil.in@gmail.com', '9422090697', 'Karmaveer Bhaurao Patil College of Engineering satara ', 'Third Year', 2, '2024-05-20 00:00:00', 'E14-64E-72F'),
(336, 6, 'Anuj Mane', 'anujmane4243@gmail.com', '7499978854', 'KBPCOE, Satara', 'Third Year', 2, '2024-05-20 00:00:00', 'B8D-D1F-574'),
(337, 6, 'Vedant satish kadole', 'vedantkadole@gmail.com', '9623225009', 'Karmaveer Bhaurao patil college of engineering, satara', 'Third Year', 2, '2024-05-20 00:00:00', '82F-ECD-B1F'),
(338, 6, 'Vinayak Gharge', 'ghargevinayak2003@gmail.com', '8005975806', 'Karmaveer Bhaurao Patil College of Engineering, Satara', 'Third Year', 2, '2024-05-20 00:00:00', '459-72F-7E2'),
(339, 6, 'Pranav Suresh Dhanawade ', 'pranavdhanawade136@gmail.com', '9146759584', 'Karmaveer bhaurao  patil college of engineering satara', 'Third Year', 2, '2024-05-20 00:00:00', '48B-91B-5FB'),
(340, 6, 'Parth Vivek Muchandi', 'parth.muchaudi@kbpcoes.edu.in', '8888546625', 'Karmaveer Bhaurao Patil College of Engineering ', 'Third Year', 2, '2024-05-20 00:00:00', '332-DB1-A45'),
(341, 6, 'Mansi Sanjeet Mane ', 'mansimane2907@gmail.com', '9975482907', 'Karmaveer Bhaurao Patil College of Engineering Satara ', 'Third Year', 2, '2024-05-20 00:00:00', 'E5C-909-B4C'),
(342, 6, 'Aishwarya Kiran Pawar ', '992002aishwarya@gmail.com', '7666709407', 'Karmaveer Bhaurao Patil College of Engineering, Satara.', 'Third Year', 2, '2024-05-20 00:00:00', '8AA-E30-3C0'),
(343, 6, 'Sanika Dilip Prabhune ', 'sanikaprabhune1603@gmail.com', '9021343713', 'Karmaveer Bhaurao Patil College of Engineering,  Satara', 'Third Year', 2, '2024-05-20 00:00:00', '81F-5E2-FE0'),
(344, 6, 'Omprakash Nilkanth Todkari ', 'omprakashtodkari14@gmail.com', '7350354567', 'Karmaveer bhaurao patil college of engineering Satara ', 'Third Year', 2, '2024-05-20 00:00:00', 'FE3-1EE-D61'),
(345, 6, 'Shreya Vitthal Swami ', 'shreyaswami.ss@gmail.com', '8956131040', 'KBP college of engineering, Satara', 'Third Year', 2, '2024-05-20 00:00:00', 'C41-5BB-CFA'),
(346, 4, 'Laxman Ramchandra Mane ', 'laxmanmane9545@gmail.com', '8767597059', 'KBPCOE SATARA ', 'Third Year', 2, '2024-05-20 00:00:00', 'CC9-491-8A1'),
(347, 6, 'Aaditi pramod bhosale', 'aaditibhosale5@qmail.com', '8830987445', 'K.B.P.collage of engineering satara', 'Third Year', 2, '2024-05-20 00:00:00', '359-A42-614'),
(348, 6, 'Vaishnavi Dipak Kashid ', 'vaishnavikashid2021@gmail.com', '8605519694', 'Karmveer Bhaurao Patil College of engineering satara ', 'Third Year', 2, '2024-05-20 00:00:00', '754-3E9-9D3'),
(349, 6, 'Omkar Sayaji Jadhav ', 'omkarjadhav1052003@gmail.com', '7218934522', 'KBPCOES', 'Third Year', 2, '2024-05-20 00:00:00', 'C18-AAF-825'),
(350, 6, 'Monali Mahavir Madane ', 'madanemonali2306@gmail.com', '8261031047', 'Karmveer bhaurao patil college of engineering satara ', 'Third Year', 2, '2024-05-20 00:00:00', '246-F0E-547'),
(351, 6, 'Rutika Vinod Shelar', 'shelarutika21@gmail.com', '9172627827', 'Karmaveer Bhaurao Patil College of Engineering, Satara', 'Third Year', 2, '2024-05-20 00:00:00', '845-79B-F52'),
(352, 6, 'Soham Jayant Nikam ', 'sohamnikam2202@gmail.com', '9421624131', 'Karmaveer Bhaurao Patil college of engineering satara ', 'Third Year', 2, '2024-05-20 00:00:00', 'D6A-C3E-A48'),
(353, 6, 'Farkat Tejal Parshuram', 'tejalfarkat2430@gmail.com', '8446433013', 'Karmveer Bhaurao Patil College of Engineering Satara', 'Third Year', 2, '2024-05-20 00:00:00', '2B8-678-593'),
(354, 6, 'Viraj Jayawant Kadam', 'kadam.viraj135@gmail.com', '08380815946', 'karmveer Bhaurao Patil College Of Engineering, Satara', 'Third Year', 2, '2024-05-20 00:00:00', '8D1-253-15B'),
(355, 6, 'Shweta Mahesh Dhanawade', 'shwetadhanawade66@gmail.com', '9699973119', 'Karmveer bhaurao patil college of engineering  satara ', 'Third Year', 2, '2024-05-20 00:00:00', '483-3B5-D8C'),
(356, 6, 'Pragati Shahir Nangare ', 'pragatinangare12@gmail.com', '7588637497', 'Karmaveer bhaurao patil college of engineering satara', 'Third Year', 2, '2024-05-20 00:00:00', '89C-CDD-C93'),
(357, 6, 'Atharva Audumber Chinke ', 'atharvachinke799@gmail.com', '9022459223', 'Karmaveer Bhaurao Patil College of Engineering Satara ', 'Third Year', 2, '2024-05-20 00:00:00', '776-36E-F46'),
(358, 6, 'Vrushali Ashok Ghutugade', 'vrushalighutugade62@gmail.com', '7397905424', 'KARMVEER BHAURAO PATIL COLLEGE OF ENGINEERING SATARA', 'Third Year', 2, '2024-05-20 00:00:00', 'B8C-24A-696'),
(359, 6, 'Bhosale Ankita Anil', 'ankitabhosale9795@gmail.com', '07387913689', 'KBP college of engineering Satara ', 'Third Year', 2, '2024-05-20 00:00:00', '0F5-0B7-1EC'),
(360, 6, 'Jadhav Sohan Shankar ', 'sohanjadhav291002@gmail.com', '9356078328', 'Kbp clg of engineering satara', 'Third Year', 2, '2024-05-20 00:00:00', '22B-7C2-BDA'),
(361, 6, 'Tejas Prashant Deshmukh ', '43tejasdeshmukh@gmail.com', '9022987568', 'Karmveer bhaurao Patil college of engineering satara ', 'Third Year', 2, '2024-05-20 00:00:00', '794-5AF-2A7'),
(362, 6, 'Pranali Shivaji Mane ', 'pranalimane7498@gmail.com', '7498699369', 'Karmaveer Bhaurao Patil College of Engineering, Satara ', 'Third Year', 2, '2024-05-20 00:00:00', '35A-227-5F2'),
(363, 6, 'Anushka Nitin Rajemahadik ', 'anurajemahadik@gmail.com', '8788115808', 'Karmveer bhaurao patil college of engineering satara ', 'Third Year', 2, '2024-05-20 00:00:00', 'BE9-34D-566'),
(364, 6, 'ABHISHEK NETAJI DISALE', 'abhishekndisale@gmail.com', '8623056457', 'Karmaveer bhaurao patil college of engineering,satara', 'Third Year', 2, '2024-05-20 00:00:00', '833-7D8-D93'),
(365, 6, 'Mayuri Ankush Bhosale ', 'bmayuri1211@gmail.com', '7756803047', 'Karmaveer bhaurao Patil college of engineering satara ', 'Third Year', 2, '2024-05-20 00:00:00', 'C3A-E23-61B'),
(366, 6, 'Jadhav Sakshi Sudhir ', 'sakshijadhav5535@gmail.com', '8983095535', 'Karmaveer Bhaurao Patil College of Engineering,Satara', 'Third Year', 2, '2024-05-20 00:00:00', '02C-E00-C06'),
(367, 6, 'Vasudha Bharat Sabale ', 'sabalenayan44@gmail.com', '8308899409', 'Karmaveer Bhauraov Patil College of Engineering,Satara', 'Third Year', 2, '2024-05-20 00:00:00', 'DAE-DC6-F74'),
(368, 6, 'Sanchit Maruti Magar ', 'magarsanchit9@gmail.com', '9146024764', 'K.B.P.C.O.E.Satara', 'Third Year', 2, '2024-05-20 00:00:00', '53E-F7C-3B0'),
(369, 6, 'Pawar Arati Namdev ', 'aratipawar2003@gmail.com', '9545606183', 'Karmaveer Bhaurao Patil College Of Engineering Satara ', 'Third Year', 2, '2024-05-20 00:00:00', 'C57-415-CFB'),
(370, 6, 'Shravani Dhavalikar', 'shravanimd107@gmail.com', '9156818336', 'Karmveer Bhaurao Patil college of Engineering, satara', 'Third Year', 2, '2024-05-20 00:00:00', 'B81-912-FAB'),
(371, 6, 'Anubhav Vikas Gaikwad ', 'anubhavgaikwad19@gmail.com', '8975247348', 'Rayat Shikshan Sanstha\'s, Karmaveer Bhaurao Patil College of Engineering, Satara', 'Third Year', 2, '2024-05-20 00:00:00', '230-7AF-685'),
(372, 6, 'Shreeya Anil Shete ', 'shreeyashete06@gmail.com', '9075901995', 'Karmaveer bhaurao patil college of engineering satara', 'Third Year', 2, '2024-05-20 00:00:00', '846-4AA-241'),
(373, 6, 'Sakshi Nandkishor Tat', 'sakshisquare3002@gmail.com', '9325058328', 'KBPCOES', 'Third Year', 2, '2024-05-20 00:00:00', 'BB3-2DF-3A0'),
(374, 6, 'Muhammad Sami Javed Shaikh', 'samishaikh0203@gmail.com', '9322505185', 'Karamveer Bhauro Patil College of Engineering, Satara.', 'Third Year', 2, '2024-05-20 00:00:00', 'B0A-48C-D66'),
(375, 6, 'Barge Aarti Vijaykumar ', 'aartibarge54321@gmail.com', '8767215460', 'Karmaveer Bhaurao Patil college of Engineering, Satara ', 'Third Year', 2, '2024-05-20 00:00:00', '2AE-D67-E14'),
(376, 6, 'Kshitija Rohidas Mane ', 'kshitijamane11@gmail.com', '9112451436', 'KBP college of engineering, Satara ', 'Third Year', 2, '2024-05-20 00:00:00', '8F7-30C-D0F'),
(377, 6, 'Anisha Shamrao Thorat ', 'xxanishathorat@gmail.com', '7448031944', 'Karmveer Bhaurao Patil college of Engineering Satara ', 'Third Year', 2, '2024-05-20 00:00:00', '1C6-985-551'),
(378, 6, 'Krushika Pravin jagadale ', 'krushikajagadale201@gmail.com', '8421162360', 'Karmaveer bhaurau Patil college of engineering satara ', 'Third Year', 2, '2024-05-20 00:00:00', '248-906-114'),
(379, 6, 'Sanap Swapnali Sanjay ', 'swapnalisanap01@gmail.com', '9552621356', 'Karmveer Bhaurao Patil College of Engineering Satara ', 'Third Year', 2, '2024-05-20 00:00:00', '5BD-FE1-A41'),
(380, 6, 'SUYASH DATTATRY NIKAM', 'nikamsuyash@177gmail.com', '9356872795', 'Kbp collage of engg of satara ', 'Third Year', 2, '2024-05-20 00:00:00', '1B7-FFC-43A'),
(381, 6, 'Soham Pralhad Pawar ', 'sohamp2573@gmail.com', '7058790336', 'Karmaveer Bhaurao patil college of engineering Satara ', 'Third Year', 2, '2024-05-20 00:00:00', '536-83B-5C8'),
(382, 6, 'Ganesh Shivaji Jadhav ', 'ganeshjadhav7089@gmail.com', '7498374067', 'Karmveer bhaurav patil college of engineering satara ', 'Third Year', 2, '2024-05-20 00:00:00', 'CDF-5A4-188'),
(383, 6, 'Aniket Ramesh Pawar ', 'apawar2222002@gmail.com', '7620760289', 'Karmaveer Bhaurao Patil College Of Engineering,Satara', 'Third Year', 2, '2024-05-20 00:00:00', 'FD8-F12-93A'),
(384, 6, 'Abhijit Arun Pawar', 'abhipawar2909@gmail.com', '8308038321', 'Karmaveer Bhaurao Patil College of engineering, Satara', 'Third Year', 2, '2024-05-20 00:00:00', '1DD-3AD-AD8'),
(385, 6, 'Poonam Nanachand Mane ', 'pmane3072@gmail.com', '8446101862', 'KBPCOES ', 'Third Year', 2, '2024-05-20 00:00:00', '1F6-6BA-7D0'),
(386, 6, 'Yash Avinash Bhosale', 'bhosaleyash292003@gmail.com', '9284239315', 'Kbp college of engineer', 'Third Year', 2, '2024-05-20 00:00:00', 'A7B-FE2-307'),
(387, 4, 'Patil Rutuja Digambar ', 'rutpatil2023@gmail.com', '7040484795', 'D.Y.Patil Agriculture and Technical University , Talsande ', 'First Year', 2, '2024-05-20 00:00:00', '1FA-8F4-6D4'),
(388, 6, 'Laxmi subhash ranjane', 'laxmiranjane5@gmail.com', '9373281299', 'Karmaveer bhaurao patil college of engineering satara', 'Third Year', 2, '2024-05-20 00:00:00', 'C24-97F-6CB'),
(389, 6, 'Sanika Jaywant kadam ', 'sanikajkadam1@gmail.com', '8308913639', 'Karmaveer Bhaurao Patil College of engineering satara ', 'Third Year', 2, '2024-05-21 00:00:00', '0EF-DF9-3D7'),
(390, 6, 'Siddhesh More ', 'siddheshmore2003@gmail.com', '8459729181', 'KBPCOE Satara ', 'Third Year', 2, '2024-05-21 00:00:00', '1F2-435-238'),
(391, 6, 'Aditya katekar', 'adityakatekar.2003@gmail.com', '9309714494', 'Karmaveer Bhaurao Patil College of Engineering Satara ', 'Third Year', 2, '2024-05-21 00:00:00', '336-C14-9AA'),
(392, 4, 'Gitanjali Ramesh Naidu', 'naidugitanjali32@gmail.com', '8459719385', 'D.Y.Patil College,Talsande', 'First Year', 2, '2024-05-21 00:00:00', 'EBB-D83-9A4'),
(393, 6, 'Sumit Mukesh Khodake', 'sumitmukeshkhodke.1@gmail.com', '7744083139', 'Karmaveer bhaurao patil college of engineering', 'Third Year', 2, '2024-05-21 00:00:00', 'C9F-58B-61F'),
(394, 6, 'Rohan Uttam Ghorpade', 'rohanghorpade05@gmail.com', '9607475665', 'Karmaveer Bhaurao Patil college of engineering,satara', 'Third Year', 2, '2024-05-21 00:00:00', '08C-CD3-596'),
(395, 6, 'Abhijit Sadashiv Thengal ', 'thengalabhijit0@gmail.com', '7620323493', 'Karmaveer Bhaurao Patil College Of Engineering Satara', 'Third Year', 2, '2024-05-21 00:00:00', '9C0-9B1-752'),
(396, 6, 'Abhijit Sadashiv Thengal ', 'thengalabhijit84@gmail.com', '7620323493', 'Karmaveer Bhaurao Patil College Of Engineering Satara', 'Third Year', 2, '2024-05-21 00:00:00', '444-C0B-9CA'),
(397, 6, 'Amey Sadashiv Raut ', 'ameyraut0021@gmail.com', '8308390957', 'KBP College of Engineering Satara ', 'Third Year', 2, '2024-05-21 00:00:00', 'C53-FCD-999'),
(398, 6, 'Nanasaheb Sukhadev Virkar', 'nanasahebvirkar1516@gmail.com', '8530250975', 'Karmveer bhavrao patil collage of engineering satara', 'Third Year', 2, '2024-05-21 00:00:00', '30A-B99-A90'),
(399, 4, 'Suraj Dadu Chougule', 'surajchougule9872@gmail.com', '8380934839', 'DY.Patil ', 'First Year', 2, '2024-05-22 00:00:00', 'C7E-BD8-84E'),
(400, 6, 'Ganesh Sudhir Bhise ', 'ganeshbhise2003@gmail.com', '9970266296', 'Karmveer Bhaurao Patil Collage of Engineering Satara ', 'Third Year', 2, '2024-05-22 00:00:00', '2DD-9D2-440'),
(401, 6, 'Shubham Sanjay khandare ', 'Shubhamsanjaykhandare@gmail.com', '8805650334', 'K B.P Engineering College of satara', 'Third Year', 2, '2024-05-22 00:00:00', '895-1FF-9F9'),
(402, 6, 'Mangesh Khopade', 'khopadess17@gmail.com', '9022857896', 'Karmaveer Bhaurao Patil College Of Engineering Satara', 'Third Year', 2, '2024-05-22 00:00:00', '2BB-F22-273'),
(403, 6, 'Mrunali Anil Watkar ', 'mwatkar.2025@gmail.com', '8857836059', 'Karmaveer Bhaurao Patil College of Engineering,Satara', 'Third Year', 2, '2024-05-22 00:00:00', '67D-78D-97A'),
(404, 6, 'Jay Anil shinde ', 'jay554261@gmail.com', '8767258243', 'Karmveer bhaurav patil college of engineering satara ', 'Second Year', 2, '2024-06-03 00:00:00', '2ED-F6A-57A'),
(405, 6, 'Rohan Rajendra Rode', 'rohanrode7216@gmail.com', '8177617216', 'Karmaveer Bhaurao Patil college of Engineering Satara', 'Second Year', 2, '2024-06-03 00:00:00', '069-A15-497'),
(406, 6, 'Onkar Gajanan Shinde', 'onkarshinde2200@gmail.com', '7385554027', 'Karmveer Bhaurao Patil College Of Engineering Satara', 'Second Year', 2, '2024-06-03 00:00:00', '406-E2D-7B0'),
(407, 6, 'Jyotiram Rajendra Kokane', 'jyotiramkokane113@gmail.com', '9322665344', 'Karmveer bhaurao patil college of engineering satara.', 'Second Year', 2, '2024-06-03 00:00:00', 'D38-0AD-DED'),
(408, 6, 'Abhayraj Bhausaheb Gaikwad', 'abhayrajbgaikwad@gmail.com', '9665539263', 'Karmaveer Bhaurao Patil College of Engineering, Satara', 'Second Year', 2, '2024-06-03 00:00:00', 'C60-D43-DC3'),
(409, 6, 'Atharv Sarang Jadhav ', 'atharvjadhav212004@gmail.com', '8483981081', 'Karmveer Bhaurao Patil College Of Engineering,Satara ', 'Second Year', 2, '2024-06-03 00:00:00', '069-27D-631'),
(410, 6, 'Varad Ramesh  gole ', 'rameshgole9900@gmail.com', '8329056093', 'Karmveer bhau Rao Patil college of engineering ', 'Second Year', 2, '2024-06-03 00:00:00', '3EF-9BF-B0A'),
(411, 6, 'Karan Vishnu gite ', 'karangite28@gmail.com', '8999855754', 'Karmveer bhaurav Patil College of engineering Satara', 'Second Year', 2, '2024-06-03 00:00:00', '652-E7A-F4F'),
(412, 6, 'Karan Vishnu gite ', 'karangite28@gamil.com', '8999855754', 'Karmveer bhaurav Patil College engineering Satara', 'Second Year', 2, '2024-06-03 00:00:00', 'E94-676-C09'),
(413, 6, 'Sushant Dipak Shinde', 'sushantshinde2004@gmail.com', '7028235206', 'Karmaveer bhaurao patil college of engineering satara ', 'Second Year', 2, '2024-06-03 00:00:00', '7DB-68E-BB8'),
(414, 6, 'Jazaa Shahid Mujawar ', 'jazaamujawar@gmail.com', '7666410221', 'K. B. P college of engineering, satara', 'Second Year', 2, '2024-06-04 00:00:00', '329-CA6-A9D'),
(415, 6, 'Pratik Rajendra Satpute', 'prsatpute2005@gmail.com', '7758085389', 'Karmaveer Bhaurav patil College of Engineering,Satara', 'Second Year', 2, '2024-06-05 00:00:00', 'D4D-82E-0C3'),
(418, 6, 'Chaitanya Raju Jagadale', 'chaitanyajagdale8@gmail.com', '7499540977', 'Karmaveer Bhaurao Patil college of engineering Satara ', 'Third Year', 2, '2024-06-06 00:00:00', '7C8-A2E-CEE'),
(419, 6, 'Vishakha Uddesh Jagtap ', 'vishakhajagtap1232@gmail.com', '8625984408', 'KBP college of engineering Satara ', 'Third Year', 2, '2024-06-06 00:00:00', 'B8D-6E0-01D'),
(420, 6, 'Londe Prasad Nagnath ', 'lopr112001@gmail.com', '8275831936', 'Karmveer bhaurav Patil college of engineering satara ', 'Third Year', 2, '2024-06-06 00:00:00', '56D-89C-DFC'),
(421, 6, 'Prasanna Motiram Kasabe ', 'prasannakasabe@gmail.com', '7796812583', 'Karmveer bhaurao patil college of engineering satara ', 'Third Year', 2, '2024-06-06 00:00:00', '28F-0C8-8F9'),
(422, 6, 'Ruturaj Sandip Jadhav ', 'rutujadhav071@gmail.com', '8262973511', 'KBPCOE Satara', 'Third Year', 2, '2024-06-06 00:00:00', 'CC8-F1F-7C3');

-- --------------------------------------------------------

--
-- Table structure for table `workshop`
--

CREATE TABLE `workshop` (
  `id` int(11) NOT NULL,
  `collegeid` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `days` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `type` enum('Workshop','Internship','Seminar','') NOT NULL DEFAULT 'Workshop',
  `certificate_second_line` text DEFAULT NULL,
  `approver` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workshop`
--

INSERT INTO `workshop` (`id`, `collegeid`, `name`, `days`, `start_date`, `end_date`, `file_name`, `status`, `type`, `certificate_second_line`, `approver`) VALUES
(1, 1, 'Mastering Data Structures for Efficient Programming', 5, '2024-03-20', '2024-03-24', '1_22-03-2024 19-31-47.jpg', 0, 'Workshop', 'has successfully completed Five day’s hands-on training on', 0),
(2, 2, 'Python Programming For Data Science', 5, '2024-03-16', '2024-03-24', '2_26-03-2024 23-21-49.jpg', 0, 'Workshop', 'has successfully completed Five day’s hands-on training on', 0),
(3, 3, 'Web-application deployment using AWS Cloud', 1, '2024-05-03', '2024-05-03', '3_07-05-2024 22-33-27.jpg', 0, 'Seminar', 'has successfully completed One day hands-on training on', 0),
(4, 4, 'IoT Fundamentals with Arduino', 2, '2024-04-24', '2024-05-08', '4_14-05-2024 20-10-39.jpg', 0, 'Workshop', 'has successfully completed Two day’s hands-on training on', 0),
(5, 4, 'Dynamic Web Design with PHP & MySQL', 2, '2024-05-14', '2024-05-16', '4_15-05-2024 22-42-03.jpg', 0, 'Workshop', 'has successfully completed Two day’s hands-on training on', 0),
(6, 5, 'IoT Exploration with Arduino and Raspberry Pi', 1, '2024-05-19', '2024-05-19', '5_18-05-2024 22-08-54.jpg', 0, 'Workshop', 'has successfully completed One day hands-on training on', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `verification_code` (`verification_code`);

--
-- Indexes for table `workshop`
--
ALTER TABLE `workshop`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `college`
--
ALTER TABLE `college`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=423;

--
-- AUTO_INCREMENT for table `workshop`
--
ALTER TABLE `workshop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
