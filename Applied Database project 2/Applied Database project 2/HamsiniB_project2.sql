Use EMedRec;

DELIMITER $$
CREATE PROCEDURE get_all_patients()
BEGIN
    SELECT * FROM Patient;
END$$
DELIMITER ;

# Create a users table in the database
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

insert into users(id,username,password) values
(1,'root','root');

# Create a roles table in the database
CREATE TABLE roles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE

);

DELIMITER $$
CREATE PROCEDURE insertPatient(
  IN pid INT,
  IN firstname VARCHAR(50),
  IN lastname VARCHAR(50),
  IN dob DATE,
  IN address VARCHAR(100),
  IN phone_number VARCHAR(20),
  IN insurance VARCHAR(50),
  IN emergencycontactname VARCHAR(50),
  IN emergencycontactphone VARCHAR(20)
)
BEGIN
  INSERT INTO Patient (pid, firstname, lastname, dob, address, phone_number, insurance, emergencycontactname, emergencycontactphone) 
  VALUES (pid, firstname, lastname, dob, address, phone_number, insurance, emergencycontactname, emergencycontactphone);
END;
$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insertProvider(
  IN providerid INT,
  IN firstname VARCHAR(50),
  IN lastname VARCHAR(50),
  IN specialty VARCHAR(50),
  IN phno VARCHAR(20),
  IN facilityloc VARCHAR(100)
)
BEGIN
  INSERT INTO Provider (providerid, firstname, lastname, specialty, phno, facilityloc) 
  VALUES (providerid, firstname, lastname, specialty, phno, facilityloc);
END;
$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insertVisit(
  IN vid INT,
  IN pid INT,
  IN providerid INT,
  IN visitdate DATE,
  IN visittime TIME,
  IN facilityloc VARCHAR(100)
)
BEGIN
  INSERT INTO Visit (vid, pid, providerid, visitdate, visittime, facilityloc) 
  VALUES (vid, pid, providerid, visitdate, visittime, facilityloc);
END;
$$
DELIMITER ;

select * from visit;

DELIMITER $$
CREATE PROCEDURE insertClinicalCare(
  IN ccid INT,
  IN vid INT,
  IN symptoms TEXT,
  IN dischargediagnosis TEXT,
  IN prescriptions TEXT,
  IN examresults TEXT,
  IN procedureresults TEXT
)
BEGIN
  INSERT INTO ClinicalCare (ccid, vid, symptoms, dischargediagnosis, prescriptions, examresults, procedureresults) 
  VALUES (ccid, vid, symptoms, dischargediagnosis, prescriptions, examresults, procedureresults);
END;
$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insertExamRoom(
  IN eid INT,
  IN examroomname VARCHAR(50),
  IN facilityloc VARCHAR(100),
  IN examroomnotes TEXT
)
BEGIN
  INSERT INTO ExamRoom (eid, examroomname, facilityloc, examroomnotes) 
  VALUES (eid, examroomname, facilityloc, examroomnotes);
END;
$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE `getPatientById` (IN pid INT)
BEGIN
SELECT * FROM Patient WHERE pid = pid;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE get_all_patients()
BEGIN
    SELECT * FROM Patient;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE get_thepatients(IN pid INT)
BEGIN
    SELECT * FROM Patient WHERE pid = pid;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE update_patient(
    IN patient_id INT,
    IN firstname VARCHAR(50),
    IN lastname VARCHAR(50),
    IN dob DATE,
    IN address VARCHAR(100),
    IN phone_number VARCHAR(20),
    IN insurance VARCHAR(50),
    IN emergencycontactname VARCHAR(50),
    IN emergencycontactphone VARCHAR(20)
)
BEGIN
    UPDATE Patient
    SET
        firstname = firstname,
        lastname = lastname,
        dob = dob,
        address = address,
        phone_number = phone_number,
        insurance = insurance,
        emergencycontactname = emergencycontactname,
        emergencycontactphone = emergencycontactphone
    WHERE pid = patient_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE delete_thepatient(
    IN patient_id INT
)
BEGIN
    DELETE FROM Patient WHERE pid = patient_id;
END $$
DELIMITER ;

CREATE TABLE AuditTrail (
  id INT AUTO_INCREMENT PRIMARY KEY,
  userid INT,
  datetime DATETIME,
  action VARCHAR(255)
);

CREATE TRIGGER Patient_AuditTrail
AFTER INSERT ON Patient
FOR EACH ROW
BEGIN
    INSERT INTO AuditTrail (userid, datetime, action)
    VALUES (CURRENT_USER(), NOW(), 'insert');
END;


-- Created view --
CREATE VIEW VisitDetails AS
SELECT visit.vid, visit.pid, visit.providerid, visit.visitdate, visit.visittime,
       visit.facilityloc, clinicalcare.symptoms, clinicalcare.dischargediagnosis,
       clinicalcare.prescriptions, clinicalcare.examresults, clinicalcare.procedureresults
FROM visit
JOIN clinicalcare ON visit.vid = clinicalcare.vid;


-- Created Index --
CREATE INDEX idx_visitdate ON visit (visitdate);
