DROP DATABASE IF EXISTS Hackathon;
CREATE DATABASE Hackathon;
USE Hackathon;

CREATE TABLE Creator(
creator_id VARCHAR(5) PRIMARY KEY,
creator_name VARCHAR(100) NOT NULL,
creator_email VARCHAR(100) NOT NULL UNIQUE,
creator_phone VARCHAR(15) NOT NULL UNIQUE,
creator_platform VARCHAR(50) NOT NULL 
);

CREATE TABLE Studio(
studio_id VARCHAR(5) PRIMARY KEY ,
studio_name VARCHAR(100) NOT NULL,
studio_location VARCHAR(100) NOT NULL,
studio_price DECIMAL(10,2) NOT NULL,
studio_status VARCHAR(20) NOT NULL
);

CREATE TABLE LiveSession(
session_id INT PRIMARY KEY AUTO_INCREMENT,
creator_id VARCHAR(5) NOT NULL,
studio_id VARCHAR(5) NOT NULL,
session_date DATE,
duration_hours INT,
FOREIGN KEY (creator_id) REFERENCES Creator(creator_id),
FOREIGN KEY (studio_id) REFERENCES Studio(studio_id)
);

CREATE TABLE Payment(
payment_id INT PRIMARY KEY AUTO_INCREMENT,
session_id INT,
payment_method VARCHAR(50) NOT NULL,
payment_amount DECIMAL(10,2) NOT NULL,
payment_date DATE,
FOREIGN KEY (session_id) REFERENCES LiveSession(session_id)
);

INSERT INTO Creator( creator_id,creator_name,creator_email,creator_phone,creator_platform)
VALUES
('CR01','NGUYEN VAN A','a@live.com','0901111111','Tiktok'),
('CR02','TRAN THI B','b@live.com','0902222222','Youtube'),
('CR03','LE MINH C','c@live.com','0903333333','Facebook'),
('CR04','PHAM THI D','d@live.com','0904444444','Tiktok'),
('CR05','VU HOANG E','e@live.com','0905555555','Shopee Live');

INSERT INTO Studio(studio_id,studio_name,studio_location,studio_price,studio_status)
VALUES
('ST01','Studio A','HA NOI','20.00','Available'),
('ST02','Studio b','HCM','25.00','Available'),
('ST03','Studio C','DANANG','30.00','Booked'),
('ST04','Studio D','HA NOI','22.00','Available'),
('ST05','Studio E','CAN THO','18.00','Maintenance');

INSERT INTO LiveSession(session_id,creator_id,studio_id,session_date,duration_hours)
VALUES
('1','CR01','ST01','2025-05-01','3'),
('2','CR02','ST02','2025-05-02','4'),
('3','CR03','ST03','2025-05-03','2'),
('4','CR04','ST04','2025-05-04','5'),
('5','CR05','ST05','2025-05-05','1');

INSERT INTO Payment(payment_id,session_id,payment_method,payment_amount,payment_date)
VALUES
('1','1','Cash','60.00','2025-05-01'),
('2','2','Credit Card','100.00','2025-05-02'),
('3','3','Bank Transfer','60.00','2025-05-03'),
('4','4','Credit Card','110.00','2025-05-04'),
('5','5','Cash','25.00','2025-05-05');

UPDATE Creator
SET creator_platform = 'Youtube'
WHERE creator_id = 'CR03';

UPDATE Studio
SET studio_status = 'Available',
	studio_price = studio_price * 0.9
WHERE studio_id = 'ST05';

SELECT*
FROM Studio
WHERE studio_status = 'Available' AND studio_price > 20;

SELECT*
FROM Creator
WHERE creator_platform = 'Tiktok';

SELECT* 
FROM Payment
WHERE payment_method = 'Credit Card'
LIMIT 3;



