-- DROP DATABASE IF EXISTS moviedb;
-- CREATE DATABASE moviedb;
-- USE moviedb;

-- CREATE TABLE directors (
--     director_id INT PRIMARY KEY AUTO_INCREMENT,
--     name VARCHAR(100)
-- );
-- CREATE TABLE genres (
--     genre_id INT PRIMARY KEY AUTO_INCREMENT,
--     genre_name VARCHAR(50)
-- );
-- CREATE TABLE movies (
--     movie_id INT PRIMARY KEY AUTO_INCREMENT,
--     title VARCHAR(200),
--     release_year INT,
--     genre_id INT,
--     director_id INT,
--     FOREIGN KEY (genre_id) REFERENCES genres(genre_id),
--     FOREIGN KEY (director_id) REFERENCES directors(director_id)
-- );
-- CREATE TABLE ratings (
--     rating_id INT PRIMARY KEY AUTO_INCREMENT,
--     movie_id INT,
--     user_id INT,
--     rating INT,
--     FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
-- );

-- INSERT INTO directors VALUES (1, 'Thomas Hall'),(2, 'Eric Mccarthy'),(3, 'Charles Jackson'),(4, 'Rachel Johnson'),(5, 'Michelle White');
-- INSERT INTO genres VALUES (1, 'Sci-Fi'),(2, 'Drama'),(3, 'Action'),(4, 'Comedy'),(5, 'Thriller');
-- INSERT INTO movies VALUES (1, 'De-engineered local parallelism', 1989, 4, 4),(2, 'Multi-layered human-resource standardization', 2001, 1, 3),(3, 'Persistent impactful interface', 2023, 1, 2),(4, 'Exclusive value-added encoding', 2012, 3, 2),(5, 'User-friendly 24/7 Graphical User Interface', 2015, 3, 4),(6, 'Managed maximized synergy', 1995, 1, 4),(7, 'Function-based empowering knowledge user', 1986, 4, 3),(8, 'Function-based 24/7 circuit', 2000, 3, 3),(9, 'Seamless high-level strategy', 2009, 1, 1),(10, 'Visionary scalable functionalities', 2006, 4, 5),(11, 'Synergized client-server Graphic Interface', 1998, 1, 3),(12, 'Automated analyzing complexity', 2019, 3, 2),(13, 'Virtual fault-tolerant complexity', 2005, 4, 4),(14, 'Function-based well-modulated moderator', 1996, 5, 3),(15, 'Public-key maximized middleware', 1980, 2, 3),(16, 'Seamless real-time orchestration', 1998, 4, 5),(17, 'Sharable systemic initiative', 1988, 3, 3),(18, 'De-engineered systematic customer loyalty', 1992, 2, 4),(19, 'Realigned asynchronous Graphical User Interface', 1989, 2, 4),(20, 'Cross-group explicit intranet', 2018, 5, 1),(21, 'Total content-based collaboration', 2008, 5, 5),(22, 'Persistent secondary support', 1982, 5, 3),(23, 'Digitized modular forecast', 1999, 4, 4),(24, 'Synergized systematic instruction set', 2010, 5, 3),(25, 'User-friendly interactive product', 1984, 5, 2),(26, 'Visionary asynchronous intranet', 2006, 3, 2),(27, 'Fully-configurable bottom-line architecture', 2014, 5, 3),(28, 'Cross-group multi-tasking help-desk', 2008, 4, 1),(29, 'Visionary cohesive synergy', 2010, 5, 3),(30, 'Synchronized fresh-thinking instruction set', 2017, 3, 4),(31, 'User-friendly actuating functionalities', 2010, 5, 4),(32, 'User-friendly cohesive website', 1983, 3, 4),(33, 'Reduced 6thgeneration policy', 1996, 2, 5),(34, 'Pre-emptive motivating approach', 2011, 3, 2),(35, 'Cross-group logistical throughput', 1982, 1, 4),(36, 'Assimilated asynchronous benchmark', 1996, 3, 2),(37, 'Persistent client-server ability', 2019, 1, 4),(38, 'Public-key maximized moderator', 1986, 4, 2),(39, 'Reduced asynchronous array', 2005, 5, 4),(40, 'Reduced multimedia orchestration', 2020, 3, 1),(41, 'Synergized foreground matrices', 1981, 4, 3),(42, 'Organic object-oriented instruction set', 2013, 4, 5),(43, 'User-centric empowering emulation', 2007, 4, 3),(44, 'Enterprise-wide methodical project', 1981, 3, 3),(45, 'Cross-group national extranet', 2000, 4, 1),(46, 'De-engineered neutral task-force', 2010, 1, 3),(47, 'Versatile discrete portal', 2023, 2, 5),(48, 'Phased high-level throughput', 2010, 5, 3),(49, 'Open-source high-level toolset', 1990, 4, 2),(50, 'Expanded executive core', 2017, 2, 1);
-- INSERT INTO ratings VALUES (1, 16, 1021, 7),(2, 21, 1004, 8),(3, 13, 1098, 9),(4, 15, 1038, 8),(5, 7, 1069, 6),(6, 15, 1031, 4),(7, 22, 1034, 10),(8, 37, 1042, 10),(9, 11, 1036, 4),(10, 10, 1035, 6),(11, 25, 1030, 9),(12, 29, 1012, 4),(13, 30, 1081, 1),(14, 42, 1059, 4),(15, 17, 1063, 7),(16, 17, 1010, 5),(17, 17, 1063, 2),(18, 38, 1039, 10),(19, 25, 1025, 3),(20, 29, 1054, 10),(21, 29, 1083, 5),(22, 39, 1007, 3),(23, 50, 1034, 9),(24, 50, 1024, 8),(25, 21, 1049, 4),(26, 25, 1028, 3),(27, 45, 1053, 9),(28, 11, 1017, 1),(29, 19, 1085, 6),(30, 45, 1042, 8),(31, 44, 1089, 1),(32, 37, 1063, 8),(33, 34, 1078, 4),(34, 7, 1079, 5),(35, 30, 1033, 9),(36, 46, 1026, 6),(37, 15, 1008, 1),(38, 33, 1029, 6),(39, 2, 1098, 1),(40, 3, 1049, 3),(41, 21, 1014, 8),(42, 36, 1096, 2),(43, 37, 1058, 6),(44, 10, 1078, 10),(45, 40, 1021, 4),(46, 46, 1096, 2),(47, 9, 1055, 7),(48, 33, 1011, 1),(49, 10, 1064, 8),(50, 46, 1016, 10),(51, 16, 1014, 2),(52, 42, 1053, 8),(53, 28, 1005, 5),(54, 48, 1056, 5),(55, 6, 1071, 3),(56, 3, 1017, 1),(57, 24, 1092, 9),(58, 7, 1058, 6),(59, 31, 1080, 3),(60, 45, 1044, 8),(61, 26, 1031, 7),(62, 10, 1061, 7),(63, 37, 1053, 4),(64, 26, 1018, 3),(65, 43, 1036, 1),(66, 18, 1003, 5),(67, 12, 1025, 5),(68, 2, 1007, 4),(69, 42, 1090, 4),(70, 31, 1075, 9),(71, 8, 1027, 6),(72, 17, 1094, 5),(73, 4, 1089, 1),(74, 50, 1045, 2),(75, 31, 1077, 10),(76, 7, 1063, 5),(77, 38, 1094, 9),(78, 30, 1083, 7),(79, 32, 1066, 4),(80, 14, 1099, 3),(81, 24, 1043, 4),(82, 21, 1072, 2),(83, 32, 1058, 3),(84, 27, 1064, 4),(85, 16, 1026, 2),(86, 28, 1024, 8),(87, 22, 1098, 1),(88, 14, 1005, 9),(89, 29, 1075, 9),(90, 25, 1029, 8),(91, 30, 1024, 7),(92, 47, 1022, 1),(93, 6, 1065, 5),(94, 3, 1012, 9),(95, 29, 1049, 5),(96, 17, 1042, 1),(97, 33, 1014, 6),(98, 16, 1024, 10),(99, 22, 1080, 5),(100, 2, 1094, 3);






DROP DATABASE IF EXISTS clinicdb;
CREATE DATABASE clinicdb;
USE clinicdb;

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    specialty VARCHAR(100)
);
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    dob DATE
);
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);
CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT,
    description VARCHAR(100),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

INSERT INTO doctors VALUES (1, 'Joshua Stokes', 'Cardiology'),(2, 'Destiny Henderson', 'Neurology'),(3, 'Michael Alexander', 'Pediatrics'),(4, 'Edward Smith', 'Orthopedics'),(5, 'Courtney Hall', 'Dermatology');
INSERT INTO patients VALUES (1, 'Lisa Martin', '1968-09-26'),(2, 'Martin Hall', '2005-05-31'),(3, 'Bill Lloyd', '1939-04-30'),(4, 'Brenda Jackson', '1981-02-20'),(5, 'Valerie Stone', '1971-11-29'),(6, 'Kenneth Gill', '2001-03-27'),(7, 'Antonio Garcia', '1941-12-07'),(8, 'Margaret Garcia', '2002-12-12'),(9, 'Megan Aguilar', '2002-01-19'),(10, 'Robert Turner', '1993-12-24'),(11, 'Taylor Shaw', '1946-07-14'),(12, 'Ronald Cooper', '1988-12-11'),(13, 'Lisa Orr', '1978-09-25'),(14, 'Tamara Smith', '1994-06-15'),(15, 'Alexander Miller', '1957-06-27'),(16, 'Richard Johnson', '1993-12-04'),(17, 'Angela Fields', '1972-06-03'),(18, 'Stephanie Martin', '2000-02-14'),(19, 'Wendy Rice', '1970-07-28'),(20, 'Martin Jones', '2006-11-29'),(21, 'Kimberly Allison', '1947-01-08'),(22, 'Angela White MD', '1997-06-12'),(23, 'Jacqueline Dawson', '1980-07-30'),(24, 'Eugene Hanson', '2003-10-14'),(25, 'Jean Mcmahon', '1982-06-07'),(26, 'Tammy Ali', '1955-05-10'),(27, 'Felicia Evans', '1967-11-11'),(28, 'Elizabeth Lowery', '1981-09-21'),(29, 'Carrie Taylor MD', '1995-09-09'),(30, 'John Gonzalez', '1946-07-12'),(31, 'Victor Davis', '1991-12-23'),(32, 'Jennifer Weber', '1993-10-24'),(33, 'John Tucker', '2004-08-28'),(34, 'Maria Lopez', '1981-12-26'),(35, 'Faith Newman', '1999-01-08'),(36, 'Nicole Lewis', '1957-01-21'),(37, 'Daniel Mitchell', '1962-06-21'),(38, 'William Stark', '1994-11-30'),(39, 'Tara Yates', '1959-01-11'),(40, 'Bobby Palmer', '1985-03-18'),(41, 'Lori Wilson', '1969-03-28'),(42, 'Donna Martinez', '1981-01-22'),(43, 'Matthew Carter', '1940-03-28'),(44, 'Thomas Perez', '1998-06-04'),(45, 'Tiffany Ball', '1968-03-10'),(46, 'Brandy Dixon', '1998-07-10'),(47, 'Samantha Lewis', '2000-05-26'),(48, 'William Mata', '2006-07-03'),(49, 'Aaron Garrett', '1973-05-14'),(50, 'Adam Walker', '2005-08-07');
INSERT INTO appointments VALUES (1, 39, 1, '2024-10-08'),(2, 39, 3, '2024-07-04'),(3, 43, 5, '2025-03-16'),(4, 46, 2, '2024-09-30'),(5, 45, 1, '2025-01-02'),(6, 26, 5, '2024-08-27'),(7, 20, 5, '2024-12-29'),(8, 19, 4, '2024-10-26'),(9, 3, 1, '2024-10-04'),(10, 13, 4, '2024-08-26'),(11, 34, 3, '2024-07-19'),(12, 12, 4, '2024-08-30'),(13, 22, 4, '2024-07-13'),(14, 25, 2, '2024-11-01'),(15, 20, 4, '2025-03-30'),(16, 26, 4, '2024-05-12'),(17, 13, 3, '2025-01-16'),(18, 4, 2, '2025-03-13'),(19, 40, 4, '2025-03-10'),(20, 2, 2, '2024-06-12'),(21, 28, 2, '2024-09-21'),(22, 15, 4, '2024-11-15'),(23, 26, 3, '2024-05-01'),(24, 28, 4, '2024-06-02'),(25, 1, 1, '2025-02-25'),(26, 46, 5, '2024-10-20'),(27, 48, 2, '2024-09-09'),(28, 25, 2, '2024-09-07'),(29, 20, 3, '2025-02-02'),(30, 35, 2, '2024-04-17'),(31, 24, 4, '2024-09-15'),(32, 7, 3, '2024-05-20'),(33, 34, 1, '2024-11-05'),(34, 1, 3, '2025-02-24'),(35, 32, 1, '2024-12-05'),(36, 45, 1, '2024-05-11'),(37, 38, 1, '2024-06-21'),(38, 44, 3, '2024-10-15'),(39, 18, 5, '2024-11-06'),(40, 25, 4, '2024-09-10'),(41, 46, 4, '2024-12-03'),(42, 48, 5, '2025-03-13'),(43, 41, 2, '2024-11-03'),(44, 45, 5, '2024-11-08'),(45, 38, 2, '2024-08-15'),(46, 49, 1, '2024-08-03'),(47, 33, 1, '2025-03-24'),(48, 20, 3, '2024-05-19'),(49, 32, 1, '2024-11-21'),(50, 28, 4, '2024-04-28');
INSERT INTO treatments VALUES (1, 1, 'X-Ray'),(2, 2, 'Blood Test'),(3, 3, 'Checkup'),(4, 4, 'Checkup'),(5, 5, 'X-Ray'),(6, 6, 'Blood Test'),(7, 7, 'X-Ray'),(8, 8, 'X-Ray'),(9, 9, 'Checkup'),(10, 10, 'Blood Test'),(11, 11, 'X-Ray'),(12, 12, 'Checkup'),(13, 13, 'X-Ray'),(14, 14, 'X-Ray'),(15, 15, 'Ultrasound'),(16, 16, 'MRI'),(17, 17, 'Ultrasound'),(18, 18, 'X-Ray'),(19, 19, 'MRI'),(20, 20, 'MRI'),(21, 21, 'X-Ray'),(22, 22, 'Checkup'),(23, 23, 'X-Ray'),(24, 24, 'Blood Test'),(25, 25, 'X-Ray'),(26, 26, 'Ultrasound'),(27, 27, 'X-Ray'),(28, 28, 'MRI'),(29, 29, 'Ultrasound'),(30, 30, 'Ultrasound'),(31, 31, 'Blood Test'),(32, 32, 'Ultrasound'),(33, 33, 'X-Ray'),(34, 34, 'Ultrasound'),(35, 35, 'MRI'),(36, 36, 'Blood Test'),(37, 37, 'MRI'),(38, 38, 'MRI'),(39, 39, 'MRI'),(40, 40, 'Checkup'),(41, 41, 'X-Ray'),(42, 42, 'Blood Test'),(43, 43, 'Checkup'),(44, 44, 'MRI'),(45, 45, 'Blood Test'),(46, 46, 'Blood Test'),(47, 47, 'MRI'),(48, 48, 'MRI'),(49, 49, 'MRI'),(50, 50, 'X-Ray');






DROP DATABASE IF EXISTS bankdb;
CREATE DATABASE bankdb;
USE bankdb;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    amount DECIMAL(10,2),
    timestamp DATE,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

INSERT INTO customers VALUES (1, 'Anna Stephens', 'chavezdiana@davis.com'),(2, 'Brittany Willis', 'jason45@yahoo.com'),(3, 'Shawn Patel', 'georgepowell@fields-franklin.net'),(4, 'Barbara Johnson', 'johnjones@tyler-holloway.com'),(5, 'Trevor Hunter', 'xbrown@hotmail.com'),(6, 'Garrett Mccoy', 'vnguyen@hotmail.com'),(7, 'Brian Myers', 'wilkinshenry@ramos-rodriguez.com'),(8, 'Eugene Walker', 'daniellesnow@perez.com'),(9, 'Krista Rodriguez', 'gina60@jackson.com'),(10, 'Kathleen Peterson', 'pjones@livingston.net'),(11, 'John Evans', 'john94@gmail.com'),(12, 'Matthew Salas', 'yjones@hotmail.com'),(13, 'Maria Shelton', 'sarahpatterson@jenkins.info'),(14, 'Joshua Hopkins', 'kingandrea@hotmail.com'),(15, 'Tammy Wilcox', 'rogermorris@price.com'),(16, 'Mark Hoover', 'lriggs@michael-coleman.info'),(17, 'Brittany Hartman', 'zhernandez@stanley.info'),(18, 'Jennifer Ramirez', 'deborah18@adams-perez.com'),(19, 'Rachel Vang', 'nicholaswilliams@yahoo.com'),(20, 'Michael Griffin', 'fgonzalez@hotmail.com'),(21, 'Thomas Glover', 'iellis@gmail.com'),(22, 'John Rivera', 'dannychaney@hotmail.com'),(23, 'Randy Montgomery', 'cynthiatownsend@gmail.com'),(24, 'Robert Lee', 'eschmidt@mason.com'),(25, 'Robert Barrett', 'dwilliams@key-grant.com'),(26, 'Vincent Johnson', 'karenfitzgerald@yahoo.com'),(27, 'Amy Ortiz', 'kempbrandi@faulkner.com'),(28, 'Shelby Adams', 'rothmichael@hotmail.com'),(29, 'Nathan Heath', 'shahnicole@bennett.net'),(30, 'Tammy Meadows', 'wpatel@stone.org');
INSERT INTO accounts VALUES (1, 28, 7985.88),(2, 27, 2472.28),(3, 1, 7886.51),(4, 13, 5327.65),(5, 3, 4503.98),(6, 20, 7477.28),(7, 17, 4155.99),(8, 29, 5212.28),(9, 19, 9245.25),(10, 26, 6027.57),(11, 10, 5162.02),(12, 9, 6732.64),(13, 14, 6537.73),(14, 21, 5729.55),(15, 24, 3576.24),(16, 24, 6142.79),(17, 4, 5080.48),(18, 15, 9400.87),(19, 12, 4170.19),(20, 3, 2316.61),(21, 17, 9766.4),(22, 21, 2915.54),(23, 7, 6890.1),(24, 11, 2240.39),(25, 29, 5684.48),(26, 8, 7991.92),(27, 14, 1759.45),(28, 11, 1624.76),(29, 2, 7249.18),(30, 30, 8525.02),(31, 14, 6135.67),(32, 20, 5282.5),(33, 15, 2124.63),(34, 3, 4103.95),(35, 23, 3693.76),(36, 28, 835.68),(37, 3, 2397.54),(38, 26, 3213.74),(39, 27, 5931.89),(40, 19, 1001.35),(41, 12, 2690.9),(42, 29, 6113.69),(43, 18, 2763.65),(44, 10, 6717.27),(45, 23, 6233.2),(46, 5, 9967.03),(47, 12, 2284.12),(48, 3, 7824.2),(49, 14, 6918.47),(50, 19, 280.08);
INSERT INTO transactions VALUES (1, 15, 298.31, '2025-03-15'),(2, 37, -195.59, '2025-02-23'),(3, 3, 237.63, '2025-02-08'),(4, 47, 762.65, '2025-04-11'),(5, 17, 74.5, '2025-01-21'),(6, 35, 486.22, '2025-01-17'),(7, 20, 813.95, '2025-04-09'),(8, 14, -443.36, '2025-02-11'),(9, 12, 186.59, '2025-02-22'),(10, 42, -322.83, '2025-04-10'),(11, 49, 849.08, '2025-04-11'),(12, 36, 393.61, '2025-02-08'),(13, 28, 559.44, '2025-03-30'),(14, 22, 880.8, '2025-03-10'),(15, 45, 272.79, '2025-04-10'),(16, 8, 354.63, '2025-04-04'),(17, 27, -120.49, '2025-01-30'),(18, 10, 11.02, '2025-04-07'),(19, 36, 265.25, '2025-02-21'),(20, 40, -4.59, '2025-04-09'),(21, 11, -226.7, '2025-03-18'),(22, 13, -278.67, '2025-03-30'),(23, 46, 346.0, '2025-03-31'),(24, 49, 322.91, '2025-03-26'),(25, 28, -485.06, '2025-04-11'),(26, 49, 626.35, '2025-03-14'),(27, 15, 5.58, '2025-02-17'),(28, 42, 766.61, '2025-03-21'),(29, 39, 709.44, '2025-03-07'),(30, 11, 221.46, '2025-03-07'),(31, 14, 842.62, '2025-01-28'),(32, 35, 903.22, '2025-01-29'),(33, 33, 54.26, '2025-02-01'),(34, 7, 0.53, '2025-01-27'),(35, 4, -232.85, '2025-01-18'),(36, 5, -158.37, '2025-03-16'),(37, 31, 882.14, '2025-02-18'),(38, 25, 575.1, '2025-03-24'),(39, 16, 616.26, '2025-02-28'),(40, 10, -450.36, '2025-02-19'),(41, 3, -98.29, '2025-02-02'),(42, 21, 954.15, '2025-02-28'),(43, 5, -390.03, '2025-03-30'),(44, 13, -55.36, '2025-01-19'),(45, 1, -117.59, '2025-02-05'),(46, 21, 683.04, '2025-02-14'),(47, 35, 238.71, '2025-03-28'),(48, 14, -480.41, '2025-03-12'),(49, 26, -388.72, '2025-02-11'),(50, 38, 40.3, '2025-02-17'),(51, 29, -326.76, '2025-04-03'),(52, 12, 310.26, '2025-03-30'),(53, 29, 112.16, '2025-02-07'),(54, 37, 1.43, '2025-03-03'),(55, 36, 557.78, '2025-03-17'),(56, 39, -145.58, '2025-04-01'),(57, 42, -162.69, '2025-02-18'),(58, 29, -85.98, '2025-02-18'),(59, 33, 406.64, '2025-01-17'),(60, 36, 122.24, '2025-01-21'),(61, 49, -488.98, '2025-02-11'),(62, 17, 972.01, '2025-03-27'),(63, 30, 112.37, '2025-02-11'),(64, 6, -116.74, '2025-03-24'),(65, 49, 489.97, '2025-01-27'),(66, 29, -5.47, '2025-02-15'),(67, 29, 292.23, '2025-03-28'),(68, 44, -177.99, '2025-03-25'),(69, 27, 701.6, '2025-02-28'),(70, 43, 628.05, '2025-03-17'),(71, 10, -14.85, '2025-03-19'),(72, 44, -36.69, '2025-01-31'),(73, 24, 379.24, '2025-01-27'),(74, 15, 239.26, '2025-03-31'),(75, 10, 985.39, '2025-01-19'),(76, 34, 307.54, '2025-02-25'),(77, 16, -179.7, '2025-04-12'),(78, 20, 211.75, '2025-04-09'),(79, 11, 950.87, '2025-02-22'),(80, 31, -135.66, '2025-02-23'),(81, 7, -21.7, '2025-03-13'),(82, 38, 500.69, '2025-03-13'),(83, 27, 975.12, '2025-03-25'),(84, 46, -274.93, '2025-01-21'),(85, 18, -432.84, '2025-02-22'),(86, 47, 833.06, '2025-03-04'),(87, 16, -291.01, '2025-01-20'),(88, 41, 718.63, '2025-04-10'),(89, 41, 923.41, '2025-03-21'),(90, 14, 133.15, '2025-04-12'),(91, 28, 611.65, '2025-01-25'),(92, 49, -403.76, '2025-01-23'),(93, 23, -64.26, '2025-03-30'),(94, 34, 425.5, '2025-04-08'),(95, 4, 153.43, '2025-01-19'),(96, 10, 894.77, '2025-02-12'),(97, 48, 862.52, '2025-03-26'),(98, 4, -148.06, '2025-03-01'),(99, 32, 11.97, '2025-02-23'),(100, 2, 95.39, '2025-04-07');