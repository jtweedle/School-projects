-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-03-24 04:13:20.478

-- tables
-- Table: Ambulance
ALTER TABLE Ambulance DROP FOREIGN KEY Ambulance_Inventory;
ALTER TABLE Calls DROP FOREIGN KEY Calls_Ambulance;
ALTER TABLE Patient DROP FOREIGN KEY Patient_Calls;
ALTER TABLE Employees DROP FOREIGN KEY Employees_Ambulance;
ALTER TABLE Skills DROP FOREIGN KEY Skills_Employees;
DROP TABLE IF EXISTS Ambulance,Calls,Employees,Patient,Inventory,Skills;
CREATE TABLE Ambulance (
    AmbID int NOT NULL,
    Model varchar(50) NOT NULL,
    County varchar(50) NOT NULL,
    Mileage int NOT NULL,
    Inventory_ItemID int NOT NULL,
    CONSTRAINT AmbID PRIMARY KEY (AmbID)
);

-- Table: Calls
CREATE TABLE Calls (
    CallNum int NOT NULL,
    Category varchar(50) NOT NULL,
    Ambulance_AmbID int NOT NULL,
    CONSTRAINT Calls_pk PRIMARY KEY (CallNum)
);

-- Table: Employees
CREATE TABLE Employees (
    EmployeeID int NOT NULL,
    Ambulance_AmbID int NOT NULL,
    Lname varchar(50) NOT NULL,
    Fname varchar(50) NOT NULL,
    Cert varchar(50) NOT NULL,
    CONSTRAINT Employees_pk PRIMARY KEY (EmployeeID)
);

-- Table: Inventory
CREATE TABLE Inventory (
    ItemID int NOT NULL auto_increment,
    Type varchar(50) NOT NULL,
    Count int NULL,
    CONSTRAINT ItemID PRIMARY KEY (ItemID)
);

-- Table: Patient
CREATE TABLE Patient (
    PatientID int NOT NULL,
    FName varchar(50) NOT NULL,
    LName varchar(50) NOT NULL,
    Complaint varchar(50) NOT NULL,
    Destination varchar(50) NOT NULL,
    Calls_CallNum int NOT NULL,
    CONSTRAINT Patient_pk PRIMARY KEY (PatientID)
);


-- foreign keys
-- Reference: Ambulance_Inventory (table: Ambulance)
ALTER TABLE Ambulance ADD CONSTRAINT Ambulance_Inventory FOREIGN KEY Ambulance_Inventory (Inventory_ItemID)
    REFERENCES Inventory (ItemID);

-- Reference: Calls_Ambulance (table: Calls)
ALTER TABLE Calls ADD CONSTRAINT Calls_Ambulance FOREIGN KEY Calls_Ambulance (Ambulance_AmbID)
    REFERENCES Ambulance (AmbID);

-- Reference: Employees_Ambulance (table: Employees)
ALTER TABLE Employees ADD CONSTRAINT Employees_Ambulance FOREIGN KEY Employees_Ambulance (Ambulance_AmbID)
    REFERENCES Ambulance (AmbID);

-- Reference: Patient_Calls (table: Patient)
ALTER TABLE Patient ADD CONSTRAINT Patient_Calls FOREIGN KEY Patient_Calls (Calls_CallNum)
    REFERENCES Calls (CallNum);


INSERT INTO Inventory VALUES(100,'Ambulance 1000',1);
INSERT INTO Inventory VALUES(101,'Ambulance 1010',1);
INSERT INTO Inventory VALUES(102,'Ambulance 1020',1);
INSERT INTO Inventory VALUES(103,'Ambulance 1030',1);
INSERT INTO Inventory VALUES(104,'Ambulance 1040',1);
INSERT INTO Inventory VALUES(105,'Ambulance 1050',1);
INSERT INTO Inventory VALUES(106,'Ambulance 1060',1);
INSERT INTO Inventory VALUES(107,'Ambulance 1070',1);
INSERT INTO Inventory VALUES(108,'Ambulance 1080',1);
INSERT INTO Inventory VALUES(109,'Ambulance 1090',1);
INSERT INTO Inventory VALUES(110,'Ambulance 1100',1);
INSERT INTO Inventory VALUES(111,'Ambulance 1110',1);
INSERT INTO Inventory VALUES(112,'Ambulance 1120',1);
INSERT INTO Inventory VALUES(113,'Ambulance 1130',1);
INSERT INTO Inventory VALUES(114,'Ambulance 1140',1);
INSERT INTO Inventory VALUES(001,'Dextrose 50',100);
INSERT INTO Inventory VALUES(002,'Dextrose 25',45);
INSERT INTO Inventory VALUES(003,'Benadryl',208);
INSERT INTO Inventory VALUES(004,'Epinephrine',185);
INSERT INTO Inventory VALUES(005,'Dopamine',54);
INSERT INTO Inventory VALUES(006,'Morphine',45);
INSERT INTO Inventory VALUES(007,'Diazepam',45);
INSERT INTO Inventory VALUES(008,'Midazolam',45);
INSERT INTO Inventory VALUES(009,'Zofran',37);
INSERT INTO Inventory VALUES(010,'Atropine',97);
INSERT INTO Inventory VALUES(011,'Sodium Bicarbonate',56);
INSERT INTO Inventory VALUES(012,'Normal Saline 1L',112);
INSERT INTO Inventory VALUES(013,'Normal Saline 500mL',73);
INSERT INTO Inventory VALUES(014,'Normal Saline 250mL',49);
INSERT INTO Inventory VALUES(015,'Dextrose 5 250mL ',33);
INSERT INTO Inventory VALUES(016,'24g needle',190);
INSERT INTO Inventory VALUES(017,'22g needle',147);
INSERT INTO Inventory VALUES(018,'20g needle',102);
INSERT INTO Inventory VALUES(019,'18g needle',113);
INSERT INTO Inventory VALUES(020,'16g needle',122);
INSERT INTO Inventory VALUES(021,'14g needle',141);
INSERT INTO Inventory VALUES(022,'Tourniquet',203);
INSERT INTO Inventory VALUES(023,'Op site',208);
INSERT INTO Inventory VALUES(024,'Saline lock',202);
INSERT INTO Inventory VALUES(025,'Adult NRB',88);
INSERT INTO Inventory VALUES(025,'Child NRB',76);
INSERT INTO Inventory VALUES(026,'Infant NRB',110);
INSERT INTO Inventory VALUES(027,'Adult NC',92);
INSERT INTO Inventory VALUES(028,'Child NC',82);
INSERT INTO Inventory VALUES(029,'Infant NC',102);
INSERT INTO Inventory VALUES(030,'Oxygen tubing',134);
INSERT INTO Inventory VALUES(031,'Adult AmbuBag',122);
INSERT INTO Inventory VALUES(032,'Child AmbuBag',100);
INSERT INTO Inventory VALUES(033,'Infant AmbuBag',99);
INSERT INTO Inventory VALUES(034,'Capnography',53);
INSERT INTO Ambulance values (1000, 'Van', 'Sunflower', 105000, 100);
INSERT INTO Ambulance values (1010, 'Van', 'Sunflower', 130000, 101);
INSERT INTO Ambulance values (1020, 'Van', 'Sunflower', 54000, 102);
INSERT INTO Ambulance values (1030, 'Box', 'Washington', 180000, 103);
INSERT INTO Ambulance values (1040, 'Box', 'Washington', 210000, 104);
INSERT INTO Ambulance values (1050, 'Box', 'Washington', 198000, 105);
INSERT INTO Ambulance values (1060, 'Van', 'Washington', 38000, 106);
INSERT INTO Ambulance values (1070, 'Van', 'Belzoni', 84000, 107);
INSERT INTO Ambulance values (1080, 'Box', 'Yazoo', 113000, 108);
INSERT INTO Ambulance values (1090, 'Van', 'Yazoo', 178000, 109);
INSERT INTO Ambulance values (1100, 'Van', 'Yazoo', 164100, 110);
INSERT INTO Ambulance values (1110, 'Box', 'Leflore', 83176, 111);
INSERT INTO Ambulance values (1120, 'Box', 'Leflore', 64578, 112);
INSERT INTO Ambulance values (1130, 'Box', 'Leflore', 143897, 113);
INSERT INTO Ambulance values (1140, 'Van', 'Carroll', 23456, 114);
INSERT INTO Calls VALUES (001, 'Emergent', 1000);
INSERT INTO Calls VALUES (002, 'Non-Emergent', 1010);
INSERT INTO Calls VALUES (003, 'Interfacility', 1020);
INSERT INTO Calls VALUES (004, 'Routine', 1030);
INSERT INTO Calls VALUES (005, 'Emergent', 1040);
INSERT INTO Calls VALUES (006, 'Non-Emergent', 1050);
INSERT INTO Calls VALUES (007, 'Interfacility', 1060);
INSERT INTO Calls VALUES (008, 'Routine', 1070);
INSERT INTO Calls VALUES (009, 'Emergent', 1080);
INSERT INTO Calls VALUES (010, 'Emergent', 1090);
INSERT INTO Calls VALUES (011, 'Emergent', 1100);
INSERT INTO Calls VALUES (012, 'Emergent', 1110);
INSERT INTO Calls VALUES (013, 'Emergent', 1120);
INSERT INTO Calls VALUES (014, 'Routine', 1130);
INSERT INTO Calls VALUES (015, 'Non-Emergent', 1140);
INSERT INTO Calls VALUES (016, 'Emergent', 1060);
INSERT INTO Calls VALUES (017, 'Emergent', 1070);
INSERT INTO Calls VALUES (018, 'Emergent', 1080);
INSERT INTO Calls VALUES (019, 'Interfacility', 1060);
INSERT INTO Calls VALUES (020, 'Emergent', 1070);
INSERT INTO Calls VALUES (021, 'Emergent', 1110);
INSERT INTO Calls VALUES (022, 'Emergent', 1120);
INSERT INTO Calls VALUES (023, 'Interfacility', 1130);
INSERT INTO Calls VALUES (024, 'Emergent', 1120);
INSERT INTO Calls VALUES (025, 'Interfacility', 1020);
INSERT INTO Calls VALUES (026, 'Emergent', 1140);
INSERT INTO Calls VALUES (027, 'Emergent', 1080);
INSERT INTO Calls VALUES (028, 'Emergent', 1100);
INSERT INTO Calls VALUES (029, 'Emergent', 1010);
INSERT INTO Calls VALUES (030, 'Routine', 1040);
INSERT INTO Calls VALUES (031, 'Emergent', 1060);
INSERT INTO Calls VALUES (032, 'Emergent', 1070);
INSERT INTO Calls VALUES (033, 'Emergent', 1100);
INSERT INTO Calls VALUES (034, 'Emergent', 1050);
INSERT INTO Calls VALUES (035, 'Interfacility', 1130);
INSERT INTO Employees VALUES (700, 1000, 'Tweedle', 'James', 'Paramedic');
INSERT INTO Employees VALUES (800, 1000, 'Mathews', 'James', 'EMT');
INSERT INTO Employees VALUES (701, 1010, 'Reyes', 'Diego', 'Paramedic');
INSERT INTO Employees VALUES (801, 1010, 'Seals', 'David', 'EMT');
INSERT INTO Employees VALUES (702, 1020, 'Bryant', 'James', 'Paramedic');
INSERT INTO Employees VALUES (802, 1020, 'Bailey', 'Valerie', 'EMT');
INSERT INTO Employees VALUES (703, 1030, 'Burk', 'Richard', 'Paramedic');
INSERT INTO Employees VALUES (803, 1030, 'Lewis', 'Rosa', 'EMT');
INSERT INTO Employees VALUES (704, 1040, 'Frazier', 'John', 'Paramedic');
INSERT INTO Employees VALUES (804, 1040, 'Simpson', 'Devin', 'EMT');
INSERT INTO Employees VALUES (705, 1050, 'Scrivener', 'Ben', 'Paramedic');
INSERT INTO Employees VALUES (805, 1050, 'Cobb', 'Randall', 'EMT');
INSERT INTO Employees VALUES (706, 1060, 'Watson', 'Elliot', 'Paramedic');
INSERT INTO Employees VALUES (806, 1060, 'Seals', 'Jerel', 'EMT');
INSERT INTO Employees VALUES (707, 1070, 'Herbert', 'Clay', 'Paramedic');
INSERT INTO Employees VALUES (807, 1070, 'Harris', 'John', 'EMT');
INSERT INTO Employees VALUES (708, 1080, 'Chapman', 'Marci', 'Paramedic');
INSERT INTO Employees VALUES (808, 1080, 'Porter', 'Keely', 'EMT');
INSERT INTO Employees VALUES (709, 1090, 'Butch', 'Morgan', 'Paramedic');
INSERT INTO Employees VALUES (809, 1090, 'Pryor', 'Colton', 'EMT');
INSERT INTO Employees VALUES (710, 1100, 'Butch', 'Chris', 'Paramedic');
INSERT INTO Employees VALUES (810, 1100, 'Brownlee', 'Devon', 'EMT');
INSERT INTO Employees VALUES (711, 1110, 'Ray', 'Renata', 'Paramedic');
INSERT INTO Employees VALUES (811, 1110, 'McClain', 'Mark', 'EMT');
INSERT INTO Employees VALUES (712, 1120, 'McClain', 'Trace', 'Paramedic');
INSERT INTO Employees VALUES (812, 1120, 'Nail', 'Tyler', 'EMT');
INSERT INTO Employees VALUES (713, 1130, 'Goggins', 'Tyler', 'Paramedic');
INSERT INTO Employees VALUES (813, 1130, 'Dabbs', 'Ridge', 'EMT');
INSERT INTO Employees VALUES (714, 1140, 'Horton', 'Daniel', 'Paramedic');
INSERT INTO Employees VALUES (814, 1140, 'Lewis', 'Darren', 'EMT');
INSERT INTO Patient VALUES (01, 'Mark', 'James', 'Nausea', 'South Sunflower County Hospital',001);
INSERT INTO Patient VALUES (02, 'Shantal', 'Brown', 'Back Pain', 'South Sunflower County Hospital',002);
INSERT INTO Patient VALUES (03, 'Taneka', 'Brown', 'Appendicitis', 'Greenwood Leflore Hospital',003);
INSERT INTO Patient VALUES (04, 'Shelly', 'Lyon', 'Dialysis', 'Fresenius at Greenville',004);
INSERT INTO Patient VALUES (05, 'George', 'Clay', 'Overdose', 'Delta Regional Medical Center',005);
INSERT INTO Patient VALUES (06, 'Lavorsker', 'Green', 'Seizure', 'Delta Regional Medical Center',006);
INSERT INTO Patient VALUES (07, 'Jefferey', 'Mabus', 'CVA', 'St Dominic Hospital',007);
INSERT INTO Patient VALUES (08, 'Howard', 'Stern', 'Wound Care', 'Delta Regional Medical Center-West',008);
INSERT INTO Patient VALUES (09, 'Jarvis', 'Pettis', 'Laceration', 'Baptist-Yazoo',009);
INSERT INTO Patient VALUES (10, 'Crystal', 'Benson', 'Labor', 'University of Mississippi Medical Center',010);
INSERT INTO Patient VALUES (11, 'Fred', 'Floyd', 'Shortness of Breath', 'Baptist-Yazoo',011);
INSERT INTO Patient VALUES (12, 'Betsy', 'Davis', 'Shortness of Breath', 'Greenwood Leflore Hospital',012);
INSERT INTO Patient VALUES (13, 'Minnie', 'Braswell', 'Fall', 'Greenwood Leflore Hospital',013);
INSERT INTO Patient VALUES (14, 'Dennis', 'Braswell', 'Dialysis', 'Fresenius at Greenwood',014);
INSERT INTO Patient VALUES (15, 'Robert', 'Robertson', 'Anxiety', 'Greenwood Leflore Hospital',015);
INSERT INTO Patient VALUES (16, 'Jocelyn', 'Lemus', 'Chest Pain', 'Delta Regional Medical Center',016);
INSERT INTO Patient VALUES (17, 'Erik', 'Talgot', 'Gunshot', 'Delta Regional Medical Hospital',017);
INSERT INTO Patient VALUES (18, 'Gary', 'Stallings', 'Constipation', 'Baptist-Yazoo',018);
INSERT INTO Patient VALUES (19, 'Quintavis', 'Burley', 'Suicidal Ideation', 'Delta Regional Medical Center-West',019);
INSERT INTO Patient VALUES (20, 'Stallisha', 'Williams', 'Depression', 'Delta Regional Medical Center',020);
INSERT INTO Patient VALUES (21, 'Quintaysha', 'Wright', 'Abdominal Pain', 'Greenwood Leflore Hospital',021);
INSERT INTO Patient VALUES (22, 'Jamar', 'Carrothers', 'Ankle Pain', 'Greenwood Leflore Hospital',022);
INSERT INTO Patient VALUES (23, 'Jillian', 'Sartain', 'CVA', 'University of Mississippi Medical Center',023);
INSERT INTO Patient VALUES (24, 'Bill', 'Ramsey', 'Chest Pain', 'Delta Regional Medical Center',024);
INSERT INTO Patient VALUES (25, 'Richard', 'Hutton', 'Tibia Fracture', 'University of Mississippi Medical Center',025);
INSERT INTO Patient VALUES (26, 'Collin', 'McLemore', 'Gout', 'Greenwood Leflore Hospital',026);
INSERT INTO Patient VALUES (27, 'Chandler', 'Riggs', 'Seizure', 'Baptist-Yazoo',027);
INSERT INTO Patient VALUES (28, 'Ashley', 'Mortimer', 'Hypoglycemia', 'Baptist-Yazoo',028);
INSERT INTO Patient VALUES (29, 'Nicole', 'Walrus', 'Anxiety', 'North Sunflower County Hospital',029);
INSERT INTO Patient VALUES (30, 'Sarah', 'Reynolds', 'Doctor Appointment', ' Donahue Family Medicine',030);
INSERT INTO Patient VALUES (31, 'Troy', 'Heath', 'Shoulder pain', 'Delta Regional Medical Center',031);
INSERT INTO Patient VALUES (32, 'Drew', 'Vaughn', 'Overdose', 'Delta Regional Medical Center',032);
INSERT INTO Patient VALUES (33, 'Leon', 'Nelson', 'Shortness of Breath', 'Baptist-Yazoo',033);
INSERT INTO Patient VALUES (34, 'Johnathan', 'Hall', 'Assault', 'Delta Regional Medical Center',034);
INSERT INTO Patient VALUES (35, 'Ruth', 'Bayer', 'Myocardial Infarction', 'University of Mississippi Medical Center',035);
