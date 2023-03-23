-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 10, 2023 at 03:53 PM
-- Server version: 10.5.19-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `roedu_judo`
--

-- --------------------------------------------------------

--
-- Table structure for table `clubajj`
--

CREATE TABLE `clubajj` (
  `ID` int(11) NOT NULL,
  `Nume` varchar(46) DEFAULT NULL,
  `Judet` varchar(15) DEFAULT NULL,
  `Adresa` varchar(72) DEFAULT NULL,
  `contactPerson` text NOT NULL,
  `clubEmail` text NOT NULL,
  `afiliatFRJ` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `afiliatAJJ` text NOT NULL,
  `coach1Name` text NOT NULL,
  `coach2Name` text NOT NULL,
  `coach3Name` text NOT NULL,
  `webAddress` text NOT NULL,
  `fbAddress` text NOT NULL,
  `socialAccount` text NOT NULL,
  `dojo1Address` text NOT NULL,
  `dojo1ContactPers` text NOT NULL,
  `dojo1Email` text NOT NULL,
  `dojo1TatamiMP` text NOT NULL,
  `dojo1AgeGroups` text NOT NULL,
  `dojo2Address` text NOT NULL,
  `dojo2ContactPers` text NOT NULL,
  `dojo2Email` text NOT NULL,
  `dojo2TatamiMP` text NOT NULL,
  `dojo2AgeGroups` text NOT NULL,
  `dojo3Address` text NOT NULL,
  `dojo3ContactPers` text NOT NULL,
  `dojo3Email` text NOT NULL,
  `dojo3TatamiMP` text NOT NULL,
  `dojo3AgeGroups` text NOT NULL,
  `clubInfoSupl` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `clubajj`
--

INSERT INTO `clubajj` (`ID`, `Nume`, `Judet`, `Adresa`, `contactPerson`, `clubEmail`, `afiliatFRJ`, `afiliatAJJ`, `coach1Name`, `coach2Name`, `coach3Name`, `webAddress`, `fbAddress`, `socialAccount`, `dojo1Address`, `dojo1ContactPers`, `dojo1Email`, `dojo1TatamiMP`, `dojo1AgeGroups`, `dojo2Address`, `dojo2ContactPers`, `dojo2Email`, `dojo2TatamiMP`, `dojo2AgeGroups`, `dojo3Address`, `dojo3ContactPers`, `dojo3Email`, `dojo3TatamiMP`, `dojo3AgeGroups`, `clubInfoSupl`) VALUES
('CS Unirea Alba Iulia', 'Alba', 'str. S. Severus, 38A, Alba Iulia', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS V.I.R.F.', 'Alba', 'str. Olteniei, nr. 15, Alba Iulia', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS LPS Alba Iulia', 'Alba', 'str. Vanatorilor, nr. 2, Alba Iulia', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('ACS Victoria Felnac', 'Arad', 'sat Felnac, Com. Felnac', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Arad', 'Arad', 'str. Lucian Blaga, nr. 20, Arad', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Club Sportiv Soimii Lipova', 'Arad', 'str. Bugariu, nr. 1, oras Lipova', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Podgoria Ghioroc', 'Arad', 'comuna Ghioroc', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Unirea Santana', 'Arad', 'str. Muncii, nr. 120 bis, Santana, Arad', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Victoria Nadlac', 'Arad', 'str. George Cosbuc, nr. 56, Nadlac', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Zerind', 'Arad', 'comuna Zerind, nr. 1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSU Arad', 'Arad', 'str. Elena Dragoi, nr. 2, camera 13, Arad', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Judo Club " Lazar Loghin"', 'Arad', 'str. Spicului, nr. 17, Arad', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('ACS Judo Arad', 'Arad', 'str. Teodor Pacateanu, nr, 5, Arad', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS Gloria Arad', 'Arad', 'str. Rusu Sirianu, nr. 6, Arad', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AJJ Arad', 'Arad', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Muscel Campulung', 'Arges', 'str. I. Mihalache, nr. 22, Campulung', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Nipon Judo Club', 'Arges', 'str. Valea Glimbocului, nr. 96, Bascov', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Dacia Mioveni', 'Arges', 'bd. Dacia, bl. G1, parter, Mioveni', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Royal Motors Pitesti', 'Arges', 'str. Nicolae Balcescu, nr. 185, Pitesti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS "Preda" Pitesti ', 'Arges ', 'sat Smeura, nr. 156B, comuna Mosoaia', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Pitesti', 'Arges', 'str. Costache Negri, nr. 26, Pitesti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSU Pitesti', 'Arges', 'str. Gheorghe Doja, nr. 41, Pitesti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('LPS Viitorul Pitesti', 'Arges', 'str. Traian, nr. 14, Pitesti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('FC Arges', 'Arges', 'bd. Petrochimistilor Nr. 29, Pitesti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('SCM Bacau', 'Bacau', 'str. Theodor Aman, nr. 94, Bacau', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('ACS Alternativ', 'Bacau', 'str. Garii, nr. 46, Hemeius', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Bronx Power Lifting Bacau', 'Bacau', 'str. Chimiei, nr. 2, sc. B, ap. 16, Bacau', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Onesti', 'Bacau', 'str. Perchiului, nr. 3, Onesti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS Onesti', 'Bacau', 'bd. Republicii, nr. 3, Onesti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Judo Club Royal Bacau', 'Bacau', 'str. 9 Mai, nr. 80, sc. A, ap. 16, Bacau', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Palatul Copiilor Bacau', 'Bacau', 'str. Oituz, nr. 24, Bacau', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Club Sportiv Stiinta Municipal Bacau', 'Bacau', 'Str. Letea, nr. 17, Bacau', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AJJ Bacau', 'Bacau', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia "Clubul Sportiv Viitorul Bors"', 'Bihor', 'comuna Bors, nr. 200, Bihor', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Crisul Oradea', 'Bihor', 'str. Lazar, nr. 1, Oradea', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Oradea', 'Bihor', 'str. Piata Unirii, nr. 1, Oradea', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Judo Club Liberty Oradea', 'Bihor', 'str. Republicii, nr. 3-5, Oradea', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('LPS-CSS Bihorul Oradea', 'Bihor', 'str. M. Basarab, nr. 4, Oradea', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Club Sportiv Olimpikus Oradea', 'Bihor ', 'str. Doina, nr. 34, Oradea', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Club Sportiv Gym Oradea ', 'Bihor ', 'str. Emanoil Gojdu, nr. 3A, Oradea', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AJJ Bihor', 'Bihor', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AS Clubul de Judo si Arte Martiale', 'Bistrita-Nasaud', 'str. Crinilor, nr. 1, ap. 11, Bistrita', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Drumarul Bistrita', 'Bistrita-Nasaud', 'str. Cuza Voda, nr. 17A, Bistrita', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Braila', 'Braila', 'str. Carantina, nr. 4, Braila', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Alpin Judo Club Brasov', 'Brasov', 'str. Sitei, nr. 60, ap. 7, Brasov', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Club Sportiv Kame Judo', 'Brasov', 'Str. Merilor, Nr.5B7, Camera 1, Brasov', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS Dinamo Brasov', 'Brasov', 'str. Nicopole, nr. 34, Brasov', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Fagaras', 'Brasov', 'str. Republicii, nr. 3, Fagaras', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Club Sportiv Local "Teliu"', 'Brasov', 'str. Tudor Vladimirescu, nr. 449, loc. Teliu, Brasov', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS Fagaras', 'Brasov', 'str. Scolii, nr. 1, Fagaras', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Arte Martiale Hontai', 'Bucuresti', 'CS "Lia Manoliu", Bd. Basarabia, nr. 37-38, sect. 2, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS ASPOL Bucuresti', 'Bucuresti', 'str. Huedin, nr. 6, sector 4, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Dinamo Bucuresti', 'Bucuresti', 'sos. Stefan cel Mare, nr. 7-9, sector 2, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Luca`s Team', 'Bucuresti', 'Intrarea Azimei, nr. 14, sector 5, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Metrorex Bucuresti', 'Bucuresti', 'str. Dinicu Golescu, nr. 38, sector 1, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Motiuashi Bucuresti', 'Bucuresti', 'Str. Cuisoarei, Nr. 4, Sect. 2, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Rapid Bucuresti', 'Bucuresti', 'sos. Giulesti, nr. 18, sector 6, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS UNEFS Bucuresti', 'Bucuresti', 'str. Constantin Noica, nr. 140, sector 6, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSA Steaua Bucuresti', 'Bucuresti', 'bd. Ghencea, nr. 35, sector 6, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS 1 Bucuresti', 'Bucuresti', 'bd. Ion Mihalache, nr. 162, sector 1, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS 2 Bucuresti', 'Bucuresti', 'bd. Ferdinand, nr. 128, sector 2, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS 3 Steaua Bucuresti', 'Bucuresti', 'bd. Ghencea, nr. 35, sector 6, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS 4 Bucuresti', 'Bucuresti', 'aleea Buchetului, nr. 5, sector 3, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS 5 Bucuresti', 'Bucuresti', 'Calea Plevnei, nr. 124, sector 6, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('LPS Grup Scolar Industrial Mircea Eliade', 'Bucuresti', 'Splaiul Independentei, nr. 315-317, sector 6, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Club Sportiv Gendai-Budo', 'Bucuresti', 'str.Doljesti,nr. 5, sector 2, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Club Sportiv "Zimbrii Bucuresti"', 'Bucuresti', 'str. Novaci, nr. 5, bl. P55, sc. 1, et. 2, ap. 9, sect. 5, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Clubul Sportiv Scorseze', 'Bucuresti', 'Intr. Patrulei,nr. 8,demisol,', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Bucuresti', 'Bucuresti', 'Calea Victoriei, nr. 126, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Club Sportiv Kibu Judo', 'Bucuresti', 'str. Adrian Fulga, nr. 38, sect. 6, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Club Sportiv Meteor ', 'Bucuresti', 'str. Lucretiu Patrascanu, nr. 7, bl. G2, sc. 1, ap. 5, parter ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Judo Club Sportiv AMV', 'Bucuresti', 'sos, Berceni, Nr. 39, Bl. 107, Sc. 2, Et.3. Ap.77, Sect. 4, Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AMJ Bucuresti', 'Bucuresti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Ramnicu Sarat', 'Buzau', 'str. Nicolae Balcescu, nr. 2, Ramnicu Sarat', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Metalul Beta Buzau', 'Buzau', 'str. Maresal Averescu, nr. 1, Buzau', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AJJ Buzau', 'Buzau', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Energetica Caransebes', 'Caras-Severin', 'Splaiul Independentei, nr. 2A, Caransebes', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Muncitorul Resita', 'Caras-Severin', 'str. Fintinilor, nr. 1, Resita', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AJJ Caras Severin', 'Caras-Severin', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Cluj Napoca', 'Cluj', 'Piata Unirii, nr. 22, Cluj Napoca', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Palatul Copiilor Cluj', 'Cluj', 'str. Bilascu, nr. 23, Cluj Napoca', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Campia Turzii', 'Cluj', 'str. Piata Mihai Viteazu, nr. 8, Campia Turzii', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS Clubul Copiilor Huedin', 'Cluj', 'str. Horea, nr. 78-80, Huedin', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS Viitorul Cluj', 'Cluj', 'str. Mihail Kogalniceanu, nr. 16, Cluj Napoca', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSU Cluj', 'Cluj', 'str. Pavlov, nr. 23, Cluj Napoca', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Club Sportiv Judo Napoca', 'Cluj', 'str. Grigore Alexandrescu, nr. 32, ap. 17, jud. Cluj', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('LPS Cluj Napoca', 'Cluj', 'str. Arinilor, nr. 9, Cluj Napoca', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Club Sportiv Activ Judo ', 'Cluj', 'str. Liviu Rebreanu, nr. 24, Campia Turzii', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AJJ Cluj', 'Cluj', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Agigea', 'Constanta', 'str. Bujorului, nr. 11, Agigea', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Navodari', 'Constanta', 'Str. Constantei, Nr.11, Navodari', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Timur Gelal Constanta', 'Constanta', 'str. Medeea,nr. 24A, Constanta', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Sparta Techirghiol', 'Constanta', 'b-dul. Victoriei, nr. 15, Constanta', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Club Sportiv "Pantheon"', 'Constanta', 'b-dul Mamaia, nr. 160, Constanta', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Clubul Sportiv Medgidia', 'Constanta', 'str. Podgoriilor, nr. 1A, Medgidia, jud. Constanta', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Club Sportiv Pontica', 'Constanta', 'aleea Arges, nr. 2, bl. T6, et. 1, ap. 12, Constanta', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('LPS Nicolae Rotaru Constanta', 'Constanta', 'str. Ion Corvin, nr. 2, Constanta', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Club Sportiv "Marina "Constanta', 'Constanta', 'b-dul. Aurel Vlaicu, nr. 19, bl. B2, sc. C, ap. 54', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Club Sportiv Constanta Judo Academy ', 'Constanta', 'b-dul. I.C Bratianu, nr. 125, bl. Pav 5, sc. A, ap. 19 ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Sfantu Gheorghe', 'Covasna', 'str. Stadionului, nr. 12, Sf. Gheorghe', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Club Sportiv Samurai Ops', 'Covasna', 'str. Pescarilor, nr. 30, ap. 42, Sf. Gheorghe, Covasna', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS Nagy Mozes Targu Secuiesc', 'Covasna', 'str. Kanta, nr. 23, Targu Secuiesc', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('ACS Capricorn Team', 'Dambovita', 'Sat Samurcas, Parcela CC si A, Tarla 2', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Otelul Targoviste', 'Dambovita', 'sos. Gaesti, nr. 9-11, Targoviste', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Targoviste', 'Dambovita', 'Calea Campulung, nr. 74, Targoviste', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Targoviste', 'Dambovita', 'str. Revolutiei, nr. 8B, Targoviste', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS Targoviste', 'Dambovita', 'str. Maior Brezisanu, Targoviste', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AJJ Dambovita', 'Dambovita', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Independenta Calafat', 'Dolj', 'str. HCC, nr. 4, Calafat', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Craiova', 'Dolj', 'b-dul. Stirbei Voda, nr. 9, Craiova', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSU Craiova', 'Dolj', 'str. Gheorghe Doja, nr. 2, Craiova', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('LPS Petrache Triscu Craiova', 'Dolj', 'str. Tudor Vladimirescu, nr. 9, Craiova', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS Galati', 'Galati', 'str. Muresului, nr. 2, Galati', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Galati', 'Galati', 'Str. George Cosbuc, Nr. 253', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('ACS FCM Giurgiu', 'Giurgiu', 'str. Gradinarului, nr. 16, Giurgiu', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Giurgiu', 'Giurgiu', 'str. Pacii, nr. 60, Giurgiu', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Clubul Harghita Judo Club', 'Harghita', 'str. Jigodin, nr. 47, Miercurea Ciuc', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Terra Miercurea Ciuc', 'Harghita', 'str. Progresului, nr. 18, Miercurea Ciuc', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM VSK Csiksereda Miercurea Ciuc', 'Harghita', 'str. Stadionului,nr. 3,camera 7', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS Miercurea Ciuc', 'Harghita', 'str. Toplita, nr. 20, Miercurea Ciuc', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('SC Miercurea Ciuc', 'Harghita', 'str. N. Balcescu, nr. 9, Miercurea Ciuc', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Club Sportiv Judo Sandominic', 'Harghita', 'sat Sandominic, nr. 57, comuna Sandominic', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AJJ Harghita', 'Harghita', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('ACS Judo Club Deva', 'Hunedoara', 'Aleea Motilor, bloc P4, sc. 3, ap. 54, Deva', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('LPS Cetate Deva', 'Hunedoara', 'str. Axente Sever, nr. 3, Deva', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('SC Sakura Deva', 'Hunedoara', 'str. Marasesti, nr. 30, Deva', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('SCM Deva', 'Hunedoara', 'str. Octavian Goga, nr. 1, Deva', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AJJ Hunedoara', 'Hunedoara', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Politehnica Iasi', 'Iasi', 'str. Lascar Catargiu, nr. 38, Iasi', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Vladeni Iasi', 'Iasi', 'sat Vladeni, bl. G1, sc. A, et. 2, ap. 5', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Iasi', 'Iasi', 'str. Smardan, nr. 5, Iasi', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS Unirea Iasi', 'Iasi', 'str. Sarariei, nr. 189, Iasi', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AJJ Iasi', 'Iasi', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Club Sportiv Mako Ryu Gim', 'Ilfov', 'str. Zorilor, nr. 57, Popesti Leordeni', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Orasenesc Borsa', 'Maramures', 'str. Lazuci, nr. 1A, Borsa', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Baia Mare', 'Maramures', 'str. Unirii, nr. 14A, Baia Mare', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Clubul Copiilor si Elevilor Strehaia', 'Mehedinti', 'str. Eroilor, nr. 4, Strehaia', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Strehaia', 'Mehedinti', 'Str. Stadionului, Nr. 2B, Strehaia', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Drobeta Turnu Severin', 'Mehedinti', 'str. Traian, nr. 114, Drobeta Turnu Severin', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AJJ Mehedinti', 'Mehedinti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('ACS Hikaritori Mures', 'Mures', 'str. Margaretelor, nr. 12, Sancraiul de Mures', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('ASC Dimas Targu Mures', 'Mures', 'str. Teatrului, nr.5, ap.10', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AS-CS "Takenoko"', 'Mures', 'str. Koos Ferenc, nr. 2A, Reghin, Mures', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AS-CS Samurai Florii de Cires', 'Mures', 'Sat Voiniceni, nr. 48A, Comuna Ceausu de Campie', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Bushi Shindo Targu Mures', 'Mures', 'str. Brasovului, nr. 5A, Targu Mures', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('LPS Roman', 'Neamt', 'str. Tineretului, nr. 24, Roman', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Aluminiu ALRO Slatina', 'Olt', 'str. Pitesti, nr. 116, Slatina', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS Slatina', 'Olt', 'str. Toamnei, nr. 108, Slatina', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Slatina', 'Olt', 'Str. Constantin Brancoveanu, Nr. 3', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('LPS Slatina', 'Olt', 'str. Toamnei, nr. 10, Slatina', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Club Sportiv Falk', 'Olt', 'str. Ecaterina Teodoroiu, Slatina', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AJJ Olt', 'Olt', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('ACS Tesila', 'Prahova', 'com. Valea Doftanei, sat Tesila, str. Setu, nr. 1259A, Prahova', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS CFR Ploiesti', 'Prahova', 'Piata 1 Decembrie 1918, nr. 1, Ploiesti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Neculai Dragan Brebu', 'Prahova', 'sat Brebu Megiesesc, nr 54, Prahova', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Petrom Ploiesti', 'Prahova', 'str. Mihai Eminescu, nr. 7, Aripa Nord, Ploiesti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Ploiesti', 'Prahova', 'str. Milcov, nr. 1, Ploiesti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Petrolistul  Boldesti ', 'Prahova', 'str. Aleea Clubului,nr. 3, Boldesti-Scaieni,jud.Prahova', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS Ploiesti', 'Prahova', 'str. Stefan cel Mare, nr. 5, Ploiesti', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AJJ Prahova', 'Prahova', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Vidalis Zalau', 'Salaj', 'bd. Mihai Viteazul, nr. 100A, Zalau', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Sport Club Municipal Zalau ', 'Salaj', 'Piata Iuliu Maniu, nr. 3, Zalau ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Fusle Security', 'Satu-Mare', 'str. Magnoliei, Satu Mare', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS UNIO Satu Mare', 'Satu-Mare', 'str. Lucian Blaga, nr. 64, Satu Mare', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('ACS Judo Master Satu Mare', 'Satu-Mare', 'str. Ady Endre, nr. 11, Satu Mare', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Satu Mare', 'Satu-Mare', 'str. Wolfenbuttel, nr. 6, Satu Mare', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AJJ Satu Mare', 'Satu-Mare', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('ACS Pangratikon Sibiu', 'Sibiu', 'str. Ilarie Munteanu, Bl. B, Sc. 1, Et. 1, Ap. 10, Oras Avrig, Sat Mirsa', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Temerarul Sibiu', 'Sibiu', 'str. Valea Aurie, nr. 5, ap. 3, Sibiu', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Sibiu', 'Sibiu', 'str. Vasile Aaron, nr. 20, Sibiu', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS Soimii Sibiu', 'Sibiu', 'str. General Magheru, nr. 18, Sibiu', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Club Sportiv Miado`s', 'Sibiu', 'bdl. Victoriei, nr. 42, Sibiu ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Club  Sportiv Senchu Sibiu', 'Sibiu', 'str. Poiana, nr. 5, bl. 47, ap. 15, Sibiu ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AJJ Sibiu', 'Sibiu', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('ACS Shinzo Ran ', 'Suceava', 'str. Lazar Vicol, bl. E42, sc. B, ap. 7, Suceava', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('ACS Somuz Falticeni', 'Suceava', 'str. Armatei, nr. 1-3, Falticeni', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS Gura Humorului', 'Suceava', 'bd. Bucovina, Gura Humorului', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS ABC Judo Club Alexandria', 'Teleorman', 'str. Victoriei, nr. 1, Alexandria', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS Alexandria', 'Teleorman', 'str. Carpati, nr. 15, Alexandria', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AJJ Teleorman', 'Teleorman', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Club Sportiv Comunal Dumbravita', 'Timis', 'str. Mihai Eminescu, Nr.73, Dumbravita', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Phoenix Timisoara', 'Timis', 'str. Closca, nr. 70, Timisoara', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Promotrica Timisoara', 'Timis', 'Calea Aradului, nr. 36, Timisoara', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSS Lugoj', 'Timis', 'str. Timisorii, nr. 51-57, Lugoj', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Judo Club Timisoara', 'Timis', 'str. Martir R. Tasala, bl. E5, ap. 18, Timisoara', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Asociatia Club Sportiv  "Sentoki"', 'Timis', 'str. Atomului, nr. 4, Timisoara', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Palatul Copiilor Timisoara', 'Timis', 'str. Dobrogeanu Gherea, nr. 44, Timisoara', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('ACS Academia de Judo Timisoara', 'Timis', 'str. Fructelor, nr. 9, Camera 1, Timisoara', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Palatul Copiilor Tulcea', 'Tulcea', 'str. Dobrogeanu Gherea, nr. 44, Tulcea', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Chimia Ramnicu Valcea', 'Valcea', 'bd. Nicolae Balcescu, nr. 24, Ramnicu Valcea', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AJJ Valcea', 'Valcea', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Viitorul Vaslui', 'Vaslui', 'str. Decebal, nr. 1, Vaslui', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CS Unirea Focsani', 'Vrancea', 'Aleea Stadionului, nr. 2, Focsani', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('CSM Focsani 2007', 'Vrancea', 'bdl. Unirii, Focsani ', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('LPS  Focsani', 'Vrancea', 'str. 1 Decembrie 1918, nr. 33, Focsani', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('ACS "Mondo Sport" Focsani', 'Vrancea', 'str. 1 Decembrie 1918, nr. 35, , Focsani', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('Club Sportiv Scolar Focsani', 'Vrancea', 'str. 1 Decembrie 1918, nr. 33, Focsani', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AJJ Vrancea', 'Vrancea', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', true),
('AS 07navodari', 'Constanta', 'Bv Mamaia Nord, Centrul de Afaceri, Spatiul 01-05, Navodari, 905700', '0241700000 / Lazar Stefan / Presedinte', 'contact@07navodari.ro', 'NU', 'NU', 'Lazar Stefan', 'Mihalcea Daniel', 'nu exista detalii', 'www.07navodari.ro', 'www.facebook.ro/07navodari', 'whatsapp tel : 4 07navodari ( 0762863274 )', 'Strada Sanatatii, nr 2, Sala de sport Liceu Lazar Edeleanu, Navodari, Constanta, 905700', '0723306978 / Lazar Stefan / Antrenor', 'contact@07navodari.ro', '60', '5-10 ani / Marti, Joi  18:00 - 19:3011-15 ani / Marti, Joi  19:30 - 21:00', ', , , ,', 'nu exista detalii', 'nu exista detalii', 'nu exista detalii', '', ', , , ,', 'nu exista detalii', 'nu exista detalii', 'nu exista detalii', '', '', true),
('AS KAI SHIN PITESTI', 'Arges', 'Calea Câmpulungului , nr 32C, Mioveni, 110147', '0732571188 / Rusu Gabriel', 'imobgabrielru@yahoo.com', 'NU', 'DA', 'Rusu Gabriel', 'nu exista detalii', 'nu exista detalii', 'https://kaishinjudo.wordpress.com/', 'Rusu Gabriel', 'nu exista detalii', 'Str.Stadionului nr 43, , Pitesti, Arges, 110408', '0732571188 / Rusu Gabriel', 'imobgabrielru@yahoo.com', '160', 'Copii 4 - 16 aniLuni - Miercuri - Vineri19.00 - 20.30', ', , , ,', 'nu exista detalii', 'nu exista detalii', 'nu exista detalii', '', ', , , ,', 'nu exista detalii', 'nu exista detalii', 'nu exista detalii', '', '', true);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clubajj`
--
ALTER TABLE `clubajj`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clubajj`
--
ALTER TABLE `clubajj`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
