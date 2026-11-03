CREATE DATABASE Remote_Robotic_Surveillance

CREATE TABLE Operators(
Operator_id		INT PRIMARY KEY,
Operator_name	VARCHAR(20) NOT NULL,
Phone			VARCHAR(13) NOT NULL,
Email			VARCHAR(30),
Username		VARCHAR(20) NOT NULL,
Role			VARCHAR(10) NOT NULL,
Status			VARCHAR(10) NOT NULL
)

INSERT INTO Operators VALUES
(101, 'Praveen Kumar', '9876543210', 'praveen7@gmail.com', 'praveen7', 'Operator', 'Active'),
(102, 'Rahul Sharma', '9123456780', 'rahul@gmail.com', 'rahul102', 'Operator', 'Active'),
(103, 'Priyanka', '9988776655', 'priya78@gmail.com', 'priya53', 'Supervisor', 'Active'),
(104, 'Kiran', '9345678120', 'kiran@gmail.com', 'kiran4', 'Operator', 'Active'),
(105, 'Leeladhar', '8765432109', 'lallu2@gmail.com', 'lallu20', 'Operator', 'Inactive'),
(106, 'Vikram Singh', '9098765432', 'vikram@gmail.com', 'vikram6', 'Supervisor', 'Active'),
(107, 'Anjali Devi', '8899776655', 'anjali@gmail.com', 'anjali7', 'Operator', 'Active'),
(108, 'Rohit Verma', '7788990011', 'rohit@gmail.com', 'rohit108', 'Operator', 'Active'),
(109, 'Neelakanta', '9871234560', 'neela@gmail.com', 'neela55', 'Operator', 'Inactive'),
(110, 'Suresh', '9012345678', 'suresh@gmail.com', 'suresh10', 'Admin', 'Active'),
(111, 'Neha', '8899001122', 'neha@gmail.com', 'neha111', 'Operator', 'Active'),
(112, 'Aditya', '7654321098', 'aditya@gmail.com', 'aditya12', 'Operator', 'Active'),
(113, 'Karthik', '9567890123', 'karthik@gmail.com', 'karthik36', 'Supervisor', 'Inactive'),
(114, 'Manoj', '8234567890', 'manoj@gmail.com', 'manojL23', 'Operator', 'Inactive'),
(115, 'Divya', '9345678901', 'divya@gmail.com', 'divyaP89', 'Operator', 'Active')


CREATE TABLE Robots(
robot_id		 INT PRIMARY KEY,
robot_name		 VARCHAR(20) NOT NULL,
robot_model		 VARCHAR(10),
serial_number    INT UNIQUE NOT NULL,
battery_capacity INT NOT NULL,
current_status   VARCHAR(20),
ip_address		 VARCHAR(15) NOT NULL
)

INSERT INTO Robots VALUES
(201, 'Chitti', 'C100', 500001, 12000, 'Available', '192.168.1.101'),
(202, 'NightEye', 'NV200', 500002, 15000, 'On Mission', '192.168.1.102'),
(203, 'Chitti 2.0', 'C200', 500003, 18000, 'Available', '192.168.1.103'),
(204, 'Optimus', 'GS400', 500004, 20000, 'Maintenance', '192.168.234.104'),
(205, 'Jarvis', 'J500', 500005, 14000, 'On Mission', '192.168.1.105'),
(206, 'Vennala', 'SR600', 500006, 16000, 'Available', '192.168.234.106'),
(207, 'MonitorBot', 'NS700', 500007, 18000, 'Offline', '192.168.1.107'),
(208, 'Groot', 'RG800', 500008, 22000, 'On Mission', '192.168.234.108'),
(209, 'Phoenix', 'DB900', 500009, 25000, 'Available', '192.168.235.109'),
(210, 'Hercules', 'PT100', 500010, 13000, 'Maintenance', '192.168.234.110'),
(211, ' H1', 'RC10', 500011, 17000, 'Available', '192.168.1.111'),
(212, 'SurveyBot', 'SV20', 500012, 19000, 'On Mission', '192.168.1.112'),
(213, 'Secureyt', 'SC330', 500013, 21000, 'Offline', '192.168.1.113'),
(214, 'RescueBot', 'RS440', 500014, 23000, 'Available', '192.168.1.114'),
(215, 'Scout', 'MT550', 500015, 15000, 'Maintenance', '192.168.1.115');

CREATE TABLE Controls(
control_id      INT PRIMARY KEY,
operator_id     INT FOREIGN KEY (operator_id) REFERENCES Operators(operator_id),
robot_id        INT FOREIGN KEY (robot_id) REFERENCES Robots(robot_id),
date			Date,
start_time      TIME,
end_time        TIME,
control_mode    VARCHAR(15),
control_status  VARCHAR(15)
)

INSERT INTO Controls VALUES
(301, 101, 207, '2026-08-03', '08:15:00', '09:40:00', 'Android', 'Completed'),
(302, 114, 202, '2026-08-07', '14:20:00', '15:10:00', 'Remote', 'Interrupted'),
(303, 106, 213, '2026-08-12', '19:30:00', '21:00:00', 'Android', 'Completed'),
(304, 103, 205, '2026-08-18', '06:45:00', '08:25:00', 'Remote', 'Completed'),
(305, 109, 201, '2026-08-23', '16:10:00', '17:05:00', 'Android', 'Completed'),
(306, 115, 210, '2026-08-29', '11:35:00', '12:20:00', 'Remote', 'Interrupted'),
(307, 102, 214, '2026-09-02', '09:50:00', '11:30:00', 'Android', 'Completed'),
(308, 111, 203, '2026-09-06', '20:15:00', '22:05:00', 'Remote', 'Completed'),
(309, 105, 209, '2026-09-11', '13:25:00', '14:00:00', 'Android', 'Active'),
(310, 108, 215, '2026-09-16', '07:30:00', '09:15:00', 'Remote', 'Completed'),
(311, 113, 204, '2026-09-21', '15:45:00', '16:35:00', 'Android', 'Interrupted'),
(312, 104, 212, '2026-09-25', '18:00:00', '19:40:00', 'Remote', 'Completed'),
(313, 107, 206, '2026-09-28', '10:10:00', '11:55:00', 'Android', 'Completed');

CREATE TABLE Locations(
location_id     INT PRIMARY KEY,
location_name   VARCHAR(30) NOT NULL,
area            VARCHAR(30),
city            VARCHAR(20),
risk_level      INT NOT NULL,
accessibility   VARCHAR(20),
location_type   VARCHAR(20),
description     VARCHAR(100)
)


INSERT INTO Locations VALUES
(401, 'Factory Zone A', 'Production Block', 'Hyderabad', 8, 'Restricted', 'Industrial', 'Heavy machinery operating area'),
(402, 'Warehouse Block B', 'Storage Area', 'Bengaluru', 4, 'Open', 'Warehouse', 'Storage and inventory inspection area'),
(403, 'Disaster Zone 1', 'Collapsed Building', 'Chennai', 10, 'Difficult', 'Disaster', 'Damaged building requiring surveillance'),
(404, 'Forest Area North', 'North Sector', 'Coimbatore', 8, 'Difficult', 'Forest', 'Dense forest area'),
(405, 'Construction Site A', 'Building Zone', 'Pune', 7, 'Restricted', 'Construction', 'Active construction site'),
(406, 'Residential Block C', 'Street 4', 'Delhi', 3, 'Open', 'Residential', 'Residential surveillance area'),
(407, 'Security Gate 1', 'Main Entrance', 'Mumbai', 7, 'Restricted', 'Security Zone', 'Main security entrance'),
(408, 'Parking Area East', 'East Wing', 'Kochi', 2, 'Open', 'Parking', 'Vehicle parking area'),
(409, 'Industrial Yard', 'Equipment Section', 'Visakhapatnam', 8, 'Restricted', 'Industrial', 'Industrial equipment storage area'),
(410, 'Rescue Area 2', 'Emergency Zone', 'Bhopal', 10, 'Difficult', 'Disaster', 'Emergency search and rescue location'),
(411, 'Warehouse Zone C', 'Loading Area', 'Mysuru', 5, 'Open', 'Warehouse', 'Loading and unloading section'),
(412, 'Forest Area South', 'South Sector', 'Dehradun', 9, 'Difficult', 'Forest', 'Remote forest surveillance area'),
(413, 'Factory Storage Unit', 'Storage Block', 'Hyderabad', 6, 'Restricted', 'Industrial', 'Factory material storage section'),
(414, 'Bridge Inspection Site', 'Bridge Section', 'Kolkata', 7, 'Restricted', 'Construction', 'Bridge inspection and monitoring area'),
(415, 'Night Patrol Zone', 'Security Sector', 'Jaipur', 9, 'Restricted', 'Security Zone', 'Area requiring night-time surveillance');

CREATE TABLE Missions(
mission_id       INT PRIMARY KEY,
mission_name     VARCHAR(30) NOT NULL,
mission_type     VARCHAR(25),
robot_id         INT NOT NULL FOREIGN KEY (robot_id) REFERENCES Robots(robot_id),
operator_id      INT NOT NULL FOREIGN KEY (operator_id) REFERENCES Operators(operator_id),
location_id      INT NOT NULL FOREIGN KEY (location_id) REFERENCES Locations(location_id),
mission_date     DATE,
start_time       TIME,
end_time         TIME,
mission_status   VARCHAR(15),
priority INT CHECK (priority BETWEEN 1 AND 5)
)

INSERT INTO Missions VALUES
(501, 'Night Factory Inspection', 'Inspection', 202, 101, 401, '2026-09-01', '20:00:00', '22:15:00', 'Completed', 4),
(502, 'Warehouse Surveillance', 'Surveillance', 205, 102, 402, '2026-09-03', '09:30:00', '11:10:00', 'Completed', 3),
(503, 'Building Search Operation', 'Search', 209, 103, 403, '2026-09-05', '14:00:00', '16:30:00', 'Completed', 5),
(504, 'Forest Patrol', 'Patrol', 206, 104, 404, '2026-09-07', '06:45:00', '09:00:00', 'Completed', 4),
(505, 'Construction Safety Check', 'Inspection', 214, 106, 405, '2026-09-09', '10:15:00', '12:00:00', 'Completed', 4),
(506, 'Residential Security Patrol', 'Surveillance', 201, 107, 406, '2026-09-11', '18:30:00', '20:00:00', 'Completed', 3),
(507, 'Main Gate Monitoring', 'Security', 208, 108, 407, '2026-09-13', '21:00:00', '23:00:00', 'Completed', 4),
(508, 'Parking Area Inspection', 'Inspection', 215, 109, 408, '2026-09-15', '08:00:00', '09:20:00', 'Completed', 1),
(509, 'Industrial Equipment Survey', 'Inspection', 203, 110, 409, '2026-09-17', '11:30:00', '13:15:00', 'Completed', 4),
(510, 'Emergency Rescue Search', 'Rescue', 209, 111, 410, '2026-09-19', '15:00:00', '18:00:00', 'Completed', 5),
(511, 'Warehouse Loading Inspection', 'Inspection', 212, 112, 411, '2026-09-21', '07:30:00', '09:00:00', 'Completed', 3),
(512, 'Forest Surveillance', 'Surveillance', 207, 113, 412, '2026-09-22', '19:00:00', '21:30:00', 'Active', 4),
(513, 'Factory Storage Monitoring', 'Monitoring', 201, 115, 413, '2026-09-24', '13:00:00', '14:45:00', 'Completed', 3),
(514, 'Bridge Safety Inspection', 'Inspection', 204, 106, 414, '2026-09-25', '09:15:00', '11:30:00', 'Completed', 4),
(515, 'Night Security Patrol', 'Patrol', 208, 102, 415, '2026-09-26', '22:00:00', '23:45:00', 'Completed', 4),
(516, 'Factory Emergency Check', 'Emergency', 213, 103, 401, '2026-09-27', '16:00:00', '17:30:00', 'Failed', 5),
(517, 'Warehouse Security Check', 'Security', 211, 108, 402, '2026-09-28', '12:30:00', '14:00:00', 'Completed', 3),
(518, 'Residential Night Monitoring', 'Surveillance', 210, 114, 406, '2026-09-29', '20:30:00', '22:00:00', 'Planned', 2)

CREATE TABLE Camera(
camera_id       INT PRIMARY KEY,
robot_id        INT NOT NULL FOREIGN KEY (robot_id) REFERENCES Robots(robot_id),
camera_model    VARCHAR(25),
camera_type     VARCHAR(20),
resolution      VARCHAR(10),
night_vision    VARCHAR(5),
status          VARCHAR(15)
)

INSERT INTO Camera VALUES
(601, 201, 'GoPro 12', 'Action', '5.3K', 'No', 'Active'),
(602, 202, 'GoPro 11', 'Action', '5.3K', 'No', 'Active'),
(603, 203, 'DJI 4', 'Action', '4K', 'No', 'Active'),
(604, 204, 'Hikvision', 'Security', '4MP', 'Yes', 'Faulty'),
(605, 205, 'GoPro 10', 'Action', '5.3K', 'No', 'Active'),
(606, 206, 'DJI 3', 'Action', '4K', 'No', 'Active'),
(607, 207, 'GoPro 9', 'Action', '5K', 'No', 'Offline'),
(608, 208, 'Hikvision 2CD', 'Security', '4MP', 'Yes', 'Active'),
(609, 209, 'GoPro 12', 'Action', '5.3K', 'No', 'Active'),
(610, 210, 'Hikvision 2CD', 'Security', '4MP', 'Yes', 'Faulty'),
(611, 211, 'DJI Action', 'Action', '4K', 'No', 'Active'),
(612, 212, 'GoPro 11', 'Action', '5.3K', 'No', 'Active'),
(613, 213, 'GoPro 10', 'Action', '5.3K', 'No', 'Offline'),
(614, 214, 'DJI 3', 'Action', '4K', 'No', 'Active'),
(615, 215, 'GoPro 9', 'Action', '5K', 'No', 'Active')

CREATE TABLE Camera_Settings(
setting_id      INT PRIMARY KEY,
camera_id       INT NOT NULL FOREIGN KEY (camera_id) REFERENCES Camera(camera_id),
resolution      VARCHAR(10),
night_mode      VARCHAR(10),
zoom_level      INT,
recording_mode  VARCHAR(15)
)

INSERT INTO Camera_Settings VALUES
(701, 601, '5.3K', 'Off', 1, 'Continuous'),
(702, 602, '5.3K', 'Off', 2, 'Continuous'),
(703, 603, '4K', 'Off', 1, 'Motion'),
(704, 604, '4MP', 'On', 4, 'Continuous'),
(705, 605, '5.3K', 'Off', 2, 'Motion'),
(706, 606, '4K', 'Off', 1, 'Continuous'),
(707, 607, '5K', 'Off', 2, 'Motion'),
(708, 608, '4MP', 'On', 5, 'Continuous'),
(709, 609, '5.3K', 'Off', 1, 'Continuous'),
(710, 610, '4MP', 'On', 4, 'Motion')

CREATE TABLE Recordings(
recording_id    INT PRIMARY KEY,
camera_id       INT NOT NULL FOREIGN KEY (camera_id) REFERENCES Camera(camera_id),
mission_id      INT NOT NULL FOREIGN KEY (mission_id) REFERENCES Missions(mission_id),
recording_date  DATE,
start_time      TIME,
end_time        TIME,
file_name       VARCHAR(50)
)

INSERT INTO Recordings VALUES
(801, 602, 501, '2026-09-01', '20:05:00', '22:10:00', 'factory_night.mp4'),
(802, 605, 502, '2026-09-03', '09:35:00', '11:05:00', 'warehouse_cam.mp4'),
(803, 609, 503, '2026-09-05', '14:10:00', '16:20:00', 'building_search.mp4'),
(804, 606, 504, '2026-09-07', '06:50:00', '08:55:00', 'forest_patrol.mp4'),
(805, 614, 505, '2026-09-09', '10:20:00', '11:50:00', 'construction.mp4'),
(806, 601, 506, '2026-09-11', '18:35:00', '19:55:00', 'residential.mp4'),
(807, 608, 507, '2026-09-13', '21:10:00', '22:50:00', 'security_gate.mp4'),
(808, 615, 508, '2026-09-15', '08:05:00', '09:15:00', 'parking_area.mp4'),
(809, 603, 509, '2026-09-17', '11:35:00', '13:10:00', 'industrial.mp4'),
(810, 609, 510, '2026-09-19', '15:10:00', '17:50:00', 'rescue_search.mp4'),
(811, 612, 511, '2026-09-21', '07:35:00', '08:55:00', 'loading_area.mp4'),
(812, 607, 512, '2026-09-22', '19:10:00', '21:20:00', 'forest_night.mp4'),
(813, 601, 513, '2026-09-24', '13:05:00', '14:40:00', 'factory_store.mp4'),
(814, 604, 514, '2026-09-25', '09:20:00', '11:20:00', 'bridge_check.mp4'),
(815, 608, 515, '2026-09-26', '22:05:00', '23:40:00', 'night_patrol.mp4')

CREATE TABLE Sensors(
    sensor_id       INT PRIMARY KEY,
    robot_id        INT NOT NULL FOREIGN KEY (robot_id) REFERENCES Robots(robot_id),
    sensor_type     VARCHAR(20),
    sensor_model    VARCHAR(25),
    status          VARCHAR(15)
)

INSERT INTO Sensors VALUES
(901, 201, 'Temperature', 'DHT22', 'Active'),
(902, 202, 'Gas', 'MQ2', 'Active'),
(903, 203, 'Ultrasonic', 'R4', 'Active'),
(904, 204, 'Motion', 'PIR', 'Faulty'),
(905, 205, 'Distance', 'LX', 'Active'),
(906, 206, 'Temperature', 'DHT11', 'Active'),
(907, 207, 'Motion', 'PIR', 'Offline'),
(908, 208, 'Gas', 'MQ1', 'Active'),
(909, 209, 'Ultrasonic', 'SR04', 'Active'),
(910, 210, 'Temperature', 'DHT22', 'Faulty'),
(911, 211, 'Distance', 'LX', 'Active'),
(912, 212, 'Gas', 'MQ2', 'Active'),
(913, 213, 'Motion', 'PIR', 'Offline'),
(914, 214, 'Temperature', 'DHT11', 'Active'),
(915, 215, 'Ultrasonic', 'R4', 'Active')

CREATE TABLE Sensor_Readings(
    reading_id INT PRIMARY KEY,
    sensor_id INT NOT NULL FOREIGN KEY REFERENCES Sensors(sensor_id),
    mission_id INT NOT NULL FOREIGN KEY REFERENCES Missions(mission_id),
    reading_date DATE,
    reading_time TIME,
    reading_value DECIMAL(10,2),
    unit VARCHAR(10)
)
INSERT INTO Sensor_Readings VALUES
(1001, 901, 501, '2026-09-01', '20:20:00', 32.50, 'C'),
(1002, 902, 502, '2026-09-03', '09:50:00', 18.40, 'ppm'),
(1003, 903, 503, '2026-09-05', '14:25:00', 6.80, 'm'),
(1004, 904, 504, '2026-09-07', '07:10:00', 1.00, 'detected'),
(1005, 905, 505, '2026-09-09', '10:40:00', 4.25, 'm'),
(1006, 906, 506, '2026-09-11', '18:55:00', 29.80, 'C'),
(1007, 907, 507, '2026-09-13', '21:25:00', 1.00, 'detected'),
(1008, 908, 508, '2026-09-15', '08:20:00', 12.60, 'ppm'),
(1009, 909, 509, '2026-09-17', '11:55:00', 8.45, 'm'),
(1010, 910, 510, '2026-09-19', '15:30:00', 35.20, 'C'),
(1011, 911, 511, '2026-09-21', '07:50:00', 3.75, 'm'),
(1012, 912, 512, '2026-09-22', '19:30:00', 22.30, 'ppm'),
(1013, 913, 513, '2026-09-24', '13:25:00', 0.00, 'detected'),
(1014, 914, 514, '2026-09-25', '09:45:00', 31.60, 'C'),
(1015, 915, 515, '2026-09-26', '22:25:00', 5.20, 'm')


CREATE TABLE Robot_Movements(
    movement_id     INT PRIMARY KEY,
    robot_id        INT NOT NULL FOREIGN KEY (robot_id) REFERENCES Robots(robot_id),
    mission_id      INT NOT NULL FOREIGN KEY (mission_id) REFERENCES Missions(mission_id),
    movement_date   DATE,
    movement_time   TIME,
    distance        DECIMAL(8,2),
    speed           DECIMAL(6,2)
)

INSERT INTO Robot_Movements VALUES
(1101, 202, 501, '2026-09-01', '20:30:00', 125.50, 2.80),
(1102, 205, 502, '2026-09-03', '10:00:00', 85.75, 1.90),
(1103, 209, 503, '2026-09-05', '14:45:00', 62.40, 1.50),
(1104, 206, 504, '2026-09-07', '07:30:00', 210.80, 3.20),
(1105, 214, 505, '2026-09-09', '10:55:00', 95.25, 2.10),
(1106, 201, 506, '2026-09-11', '19:10:00', 145.60, 2.50),
(1107, 208, 507, '2026-09-13', '21:40:00', 78.35, 1.80),
(1108, 215, 508, '2026-09-15', '08:35:00', 54.90, 1.40),
(1109, 203, 509, '2026-09-17', '12:10:00', 130.45, 2.70),
(1110, 209, 510, '2026-09-19', '16:00:00', 185.70, 2.30),
(1111, 212, 511, '2026-09-21', '08:15:00', 72.80, 1.60),
(1112, 207, 512, '2026-09-22', '20:05:00', 160.25, 2.00),
(1113, 201, 513, '2026-09-24', '13:40:00', 110.90, 2.40),
(1114, 204, 514, '2026-09-25', '10:20:00', 98.65, 1.90),
(1115, 208, 515, '2026-09-26', '22:45:00', 175.30, 2.60)

CREATE TABLE Battery_Status(
    battery_id      INT PRIMARY KEY,
    robot_id        INT NOT NULL FOREIGN KEY (robot_id) REFERENCES Robots(robot_id),
    mission_id      INT FOREIGN KEY (mission_id) REFERENCES Missions(mission_id),
    battery_level   INT,
    battery_status  VARCHAR(15),
    battery_health  VARCHAR(15)
)
INSERT INTO Battery_Status VALUES
(1201, 202, 501, 82, 'Good', 'Excellent'),
(1202, 205, 502, 74, 'Normal', 'Good'),
(1203, 209, 503, 91, 'Good', 'Excellent'),
(1204, 206, 504, 68, 'Normal', 'Good'),
(1205, 214, 505, 85, 'Good', 'Excellent'),
(1206, 201, 506, 61, 'Normal', 'Good'),
(1207, 208, 507, 55, 'Low', 'Good'),
(1208, 215, 508, 88, 'Good', 'Excellent'),
(1209, 203, 509, 72, 'Normal', 'Good'),
(1210, 209, 510, 64, 'Normal', 'Good'),
(1211, 212, 511, 79, 'Good', 'Excellent'),
(1212, 207, 512, 42, 'Low', 'Fair'),
(1213, 201, 513, 70, 'Normal', 'Good'),
(1214, 204, 514, 35, 'Critical', 'Poor'),
(1215, 208, 515, 58, 'Low', 'Fair')


CREATE TABLE Communication_Logs(
    communication_id INT PRIMARY KEY,
    robot_id         INT NOT NULL FOREIGN KEY (robot_id) REFERENCES Robots(robot_id),
    mission_id       INT FOREIGN KEY (mission_id) REFERENCES Missions(mission_id),
    communication_date DATE,
    connection_type  VARCHAR(15),
    communication_status VARCHAR(15)
)

INSERT INTO Communication_Logs VALUES
(1301, 202, 501, '2026-09-01', 'WiFi', 'Stable'),
(1302, 205, 502, '2026-09-03', 'WiFi', 'Stable'),
(1303, 209, 503, '2026-09-05', 'Radio', 'Stable'),
(1304, 206, 504, '2026-09-07', 'WiFi', 'Interrupted'),
(1305, 214, 505, '2026-09-09', 'Radio', 'Stable'),
(1306, 201, 506, '2026-09-11', 'WiFi', 'Stable'),
(1307, 208, 507, '2026-09-13', 'Radio', 'Stable'),
(1308, 215, 508, '2026-09-15', 'WiFi', 'Weak'),
(1309, 203, 509, '2026-09-17', 'WiFi', 'Stable'),
(1310, 209, 510, '2026-09-19', 'Radio', 'Stable'),
(1311, 212, 511, '2026-09-21', 'WiFi', 'Stable'),
(1312, 207, 512, '2026-09-22', 'Radio', 'Lost'),
(1313, 201, 513, '2026-09-24', 'WiFi', 'Stable'),
(1314, 204, 514, '2026-09-25', 'Radio', 'Weak'),
(1315, 208, 515, '2026-09-26', 'WiFi', 'Stable')

CREATE TABLE Mission_Logs(
    log_id          INT PRIMARY KEY,
    mission_id      INT NOT NULL FOREIGN KEY (mission_id) REFERENCES Missions(mission_id),
    log_date        DATE,
    log_time        TIME,
    event_type      VARCHAR(20),
    event_description VARCHAR(100)
)

INSERT INTO Mission_Logs VALUES
(1401, 501, '2026-09-01', '20:25:00', 'Started', 'Mission Started'),
(1402, 502, '2026-09-03', '09:55:00', 'Inspection', 'Area Inspected'),
(1403, 503, '2026-09-05', '14:30:00', 'Detection', 'Movement Detected'),
(1404, 504, '2026-09-07', '07:20:00', 'Patrol', 'Forest Covered'),
(1405, 505, '2026-09-09', '10:50:00', 'Inspection', 'Equipment Checked'),
(1406, 506, '2026-09-11', '19:05:00', 'Patrol', 'Area Patrolled'),
(1407, 507, '2026-09-13', '21:35:00', 'Monitoring', 'Gate Monitored'),
(1408, 508, '2026-09-15', '08:30:00', 'Inspection', 'Parking Inspected'),
(1409, 509, '2026-09-17', '12:00:00', 'Survey', 'Equipment Surveyed'),
(1410, 510, '2026-09-19', '15:45:00', 'Rescue', 'Survivor Detected'),
(1411, 511, '2026-09-21', '08:10:00', 'Inspection', 'Loading Checked'),
(1412, 512, '2026-09-22', '20:00:00', 'Patrol', 'Forest Patrolled'),
(1413, 513, '2026-09-24', '13:30:00', 'Monitoring', 'Storage Monitored'),
(1414, 514, '2026-09-25', '10:15:00', 'Inspection', 'Bridge Inspected'),
(1415, 515, '2026-09-26', '22:35:00', 'Patrol', 'Security Patrolled')

CREATE TABLE Robot_Status_History(
    history_id      INT PRIMARY KEY,
    robot_id        INT NOT NULL FOREIGN KEY (robot_id) REFERENCES Robots(robot_id),
    status_date     DATE,
    status          VARCHAR(20),
    remarks         VARCHAR(100)
)

INSERT INTO Robot_Status_History VALUES
(1501, 201, '2026-09-01', 'Available', 'Ready for operation'),
(1502, 202, '2026-09-01', 'On Mission', 'Factory inspection started'),
(1503, 203, '2026-09-04', 'Available', 'Mission completed'),
(1504, 204, '2026-09-10', 'Maintenance', 'Scheduled maintenance'),
(1505, 205, '2026-09-03', 'On Mission', 'Warehouse surveillance'),
(1506, 206, '2026-09-07', 'Available', 'Forest patrol completed'),
(1507, 207, '2026-09-22', 'Offline', 'Communication lost'),
(1508, 208, '2026-09-13', 'On Mission', 'Security patrol started'),
(1509, 209, '2026-09-19', 'On Mission', 'Rescue mission started'),
(1510, 210, '2026-09-15', 'Maintenance', 'Battery service required'),
(1511, 211, '2026-09-28', 'Available', 'Security mission completed'),
(1512, 212, '2026-09-21', 'On Mission', 'Warehouse inspection started'),
(1513, 213, '2026-09-27', 'Offline', 'Mission failure reported'),
(1514, 214, '2026-09-09', 'On Mission', 'Construction inspection started'),
(1515, 215, '2026-09-15', 'Available', 'Parking inspection completed')

CREATE TABLE Maintenance(
    maintenance_id  INT PRIMARY KEY,
    robot_id        INT NOT NULL FOREIGN KEY (robot_id) REFERENCES Robots(robot_id),
    maintenance_date DATE,
    maintenance_type VARCHAR(25),
    maintenance_status VARCHAR(15)
)
INSERT INTO Maintenance VALUES
(1601, 204, '2026-08-05', 'Battery Service', 'Completed'),
(1602, 210, '2026-08-12', 'Motor Check', 'Completed'),
(1603, 215, '2026-08-20', 'Camera Service', 'Completed'),
(1604, 207, '2026-08-25', 'Communication Check', 'Completed'),
(1605, 204, '2026-09-10', 'Motor Repair', 'In Progress'),
(1606, 201, '2026-09-15', 'Battery Replacement', 'Completed'),
(1607, 213, '2026-09-18', 'Sensor Check', 'Pending'),
(1608, 215, '2026-09-20', 'Camera Repair', 'Completed'),
(1609, 207, '2026-09-23', 'Network Repair', 'In Progress'),
(1610, 204, '2026-09-28', 'System Inspection', 'Pending')

INSERT INTO Maintenance VALUES
(1611, 215, '2026-10-01', 'Camera Repair', 'In Progress'),
(1612, 202, '2026-10-02', 'Network Repair', 'Pending'),
(1613, 203, '2026-10-03', 'Motor Check', 'Completed'),
(1614, 210, '2026-10-04', 'Battery Service', 'Completed'),
(1615, 212, '2026-10-05', 'Sensor Check', 'Completed'),
(1616, 208, '2026-10-06', 'System Inspection', 'Pending'),
(1617, 201, '2026-10-07', 'Communication Check', 'Completed'),
(1618, 203, '2026-10-08', 'Camera Service', 'Completed')

CREATE TABLE Component_Failures(
    failure_id      INT PRIMARY KEY,
    robot_id        INT NOT NULL FOREIGN KEY (robot_id) REFERENCES Robots(robot_id),
    failure_date    DATE,
    component_name  VARCHAR(25),
    failure_type    VARCHAR(30),
    severity        INT CHECK (severity BETWEEN 1 AND 5),
    status          VARCHAR(15)
)

INSERT INTO Component_Failures VALUES
(1701, 204, '2026-08-06', 'Motor', 'Overheating', 4, 'Resolved'),
(1702, 210, '2026-08-13', 'Battery', 'Low Capacity', 3, 'Resolved'),
(1703, 207, '2026-08-26', 'Network Module', 'Connection Loss', 4, 'Open'),
(1704, 215, '2026-09-01', 'Camera', 'Image Failure', 3, 'Resolved'),
(1705, 213, '2026-09-18', 'Sensor', 'Sensor Failure', 4, 'Open'),
(1706, 204, '2026-09-10', 'Motor', 'Motor Failure', 5, 'In Progress'),
(1707, 210, '2026-09-15', 'Battery', 'Battery Failure', 4, 'Resolved'),
(1708, 207, '2026-09-22', 'Network Module', 'Signal Loss', 5, 'Open'),
(1709, 215, '2026-09-20', 'Camera', 'Focus Failure', 2, 'Resolved'),
(1710, 213, '2026-09-27', 'Control Unit', 'System Failure', 5, 'Open')

CREATE TABLE Mission_Reports(
    report_id       INT PRIMARY KEY,
    mission_id      INT NOT NULL FOREIGN KEY (mission_id) REFERENCES Missions(mission_id),
    report_date     DATE,
    mission_result  VARCHAR(20),
    incidents       INT,
    report_summary  VARCHAR(150)
)

INSERT INTO Mission_Reports VALUES
(1801, 501, '2026-09-01', 'Successful', 0, 'Factory inspection completed'),
(1802, 502, '2026-09-03', 'Successful', 0, 'Warehouse surveillance completed'),
(1803, 503, '2026-09-05', 'Successful', 1, 'Building search completed'),
(1804, 504, '2026-09-07', 'Successful', 0, 'Forest patrol completed'),
(1805, 505, '2026-09-09', 'Successful', 0, 'Safety inspection completed'),
(1806, 506, '2026-09-11', 'Successful', 0, 'Residential patrol completed'),
(1807, 507, '2026-09-13', 'Successful', 0, 'Gate monitoring completed'),
(1808, 508, '2026-09-15', 'Successful', 0, 'Parking inspection completed'),
(1809, 509, '2026-09-17', 'Successful', 1, 'Equipment issue detected'),
(1810, 510, '2026-09-19', 'Successful', 2, 'Rescue search completed'),
(1811, 511, '2026-09-21', 'Successful', 0, 'Loading inspection completed'),
(1812, 512, '2026-09-22', 'In Progress', 1, 'Forest surveillance ongoing'),
(1813, 513, '2026-09-24', 'Successful', 0, 'Storage monitoring completed'),
(1814, 514, '2026-09-25', 'Successful', 0, 'Bridge inspection completed'),
(1815, 515, '2026-09-26', 'Successful', 0, 'Night patrol completed'),
(1816, 516, '2026-09-27', 'Failed', 2, 'Emergency check failed'),
(1817, 517, '2026-09-28', 'Successful', 0, 'Security check completed')
