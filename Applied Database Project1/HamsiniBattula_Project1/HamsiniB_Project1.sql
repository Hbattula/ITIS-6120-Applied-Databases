Create database EMedRec;

Use EMedRec;

-- TABLES CREATION --

CREATE TABLE Patient (
  pid INT PRIMARY KEY,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  dob DATE,
  address VARCHAR(100),
  phone_number VARCHAR(20),
  insurance VARCHAR(50),
  emergencycontactname VARCHAR(50),
  emergencycontactphone VARCHAR(20)
);
 select * from Patient;
 
 
 CREATE TABLE provider (
  providerid INT PRIMARY KEY,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  specialty VARCHAR(50),
  phno VARCHAR(20),
  facilityloc VARCHAR(100)
);

select * from provider;


CREATE TABLE visit (
  vid INT PRIMARY KEY,
  pid INT,
  providerid INT,
  visitdate DATE,
  visittime TIME,
  facilityloc VARCHAR(100),
  FOREIGN KEY (pid) REFERENCES Patient(pid),
  FOREIGN KEY (providerid) REFERENCES Provider(providerid)
);

select * from visit;


CREATE TABLE clinicalcare (
  ccid INT PRIMARY KEY,
  vid INT,
  symptoms TEXT,
  dischargediagnosis TEXT,
  prescriptions TEXT,
  examresults TEXT,
  procedureresults TEXT,
  FOREIGN KEY (vid) REFERENCES visit(vid)
);


select * from clinicalcare;


CREATE TABLE appointment (
  aid INT PRIMARY KEY,
  pid INT,
  providerid INT,
  appointmentdate DATE,
  appointmenttime TIME,
  appointmenttype VARCHAR(50),
  appointmentnotes TEXT,
  FOREIGN KEY (pid) REFERENCES Patient(pid),
  FOREIGN KEY (providerid) REFERENCES provider(providerid)
);

select * from appointment;

CREATE TABLE ExamRoom (
  eid INT PRIMARY KEY,
  examroomname VARCHAR(50),
  facilityloc VARCHAR(100),
  examroomnotes TEXT
);

select * from ExamRoom;

CREATE TABLE bed (
  bedid INT PRIMARY KEY,
  bedname VARCHAR(50),
  bednote TEXT
);

select * from bed;

CREATE TABLE supplies (
  supplyid INT PRIMARY KEY,
  supplyname VARCHAR(50),
  supplytype VARCHAR(50),
  supplyquantity INT
);

select * from supplies;

CREATE TABLE Billing (
  billingid INT PRIMARY KEY,
  vid INT,
  pid INT,
  providerid INT,
  billingdate DATE,
  billingamount DECIMAL(10,2),
  billingnotes TEXT,
  FOREIGN KEY (vid) REFERENCES visit(vid),
  FOREIGN KEY (pid) REFERENCES Patient(pid),
  FOREIGN KEY (providerid) REFERENCES provider(providerid)
);

select * from billing;




INSERT INTO Patient (pid, firstname, lastname, dob, address, phone_number, insurance, emergencycontactname, emergencycontactphone) 
VALUES 
  (1, 'Sachin', 'Tendulkar', '1973-04-24', 'Mumbai', '1234567890', 'Reliance', 'Anjali Tendulkar', '9876543210'),
  (2, 'Virat', 'Kohli', '1988-11-05', 'Delhi', '2345678901', 'Bajaj Allianz', 'Anushka Sharma', '8765432109'),
  (3, 'Rohit', 'Sharma', '1987-04-30', 'Mumbai', '3456789012', 'LIC', 'Ritika Sajdeh', '7654321098'),
  (4, 'Mahendra', 'Singh Dhoni', '1981-07-07', 'Ranchi', '4567890123', 'ICICI Lombard', 'Sakshi Dhoni', '6543210987'),
  (5, 'Sourav', 'Ganguly', '1972-07-08', 'Kolkata', '5678901234', 'HDFC Ergo', 'Dona Ganguly', '5432109876'),
  (6, 'Anil', 'Kumble', '1970-10-17', 'Bengaluru', '6789012345', 'Tata AIG', 'Chethana Kumble', '4321098765'),
  (7, 'Virender', 'Sehwag', '1978-10-20', 'Delhi', '7890123456', 'Birla Sun Life', 'Aarti Sehwag', '3210987654'),
  (8, 'Harbhajan', 'Singh', '1980-07-03', 'Jalandhar', '8901234567', 'New India Assurance', 'Geeta Basra', '2109876543'),
  (9, 'Yuvraj', 'Singh', '1981-12-12', 'Chandigarh', '9012345678', 'SBI Life', 'Hazel Keech', '1098765432'),
  (10, 'Gautam', 'Gambhir', '1981-10-14', 'Delhi', '0123456789', 'United India Insurance', 'Natasha Jain', '0987654321'),
  (11, 'Irfan', 'Pathan', '1984-10-27', 'Baroda', '2345678901', 'National Insurance', 'Safa Baig', '9876543210'),
  (12, 'Ajinkya', 'Rahane', '1988-06-06', 'Mumbai', '3456789012', 'Oriental Insurance', 'Radhika Dhopavkar', '8765432109'),
  (13, 'Shikhar', 'Dhawan', '1985-12-05', 'Delhi', '4567890123', 'ICICI Prudential', 'Ayesha Mukherjee', '7654321098'),
  (14, 'Ravichandran', 'Ashwin', '1986-09-17', 'Chennai', '5678901234', 'Max Bupa', 'Prithi Narayanan', '6543210987'),
  (15, 'Kapil', 'Dev', '1984-04-30;', 'Hyderabad', '7999997781','YSI', 'Uma kelly', '25678921342');
  
  select * from Patient;
  
INSERT INTO provider (providerid, firstname, lastname, specialty, phno, facilityloc) VALUES
(1, 'Aarav', 'Kumar', 'Pediatrician', '9876543210', 'Mumbai'),
(2, 'Aryan', 'Shah', 'Dentist', '8765432109', 'Delhi'),
(3, 'Ishaan', 'Patel', 'Cardiologist', '7654321098', 'Bangalore'),
(4, 'Aadi', 'Singh', 'Oncologist', '6543210987', 'Hyderabad'),
(5, 'Advait', 'Nair', 'Psychiatrist', '5432109876', 'Chennai'),
(6, 'Anaya', 'Gupta', 'Neurologist', '4321098765', 'Kolkata'),
(7, 'Arnav', 'Sharma', 'Orthopedic Surgeon', '3210987654', 'Pune'),
(8, 'Avni', 'Jain', 'Endocrinologist', '2109876543', 'Jaipur'),
(9, 'Dev', 'Mishra', 'Gynecologist', '1098765432', 'Ahmedabad'),
(10, 'Ishanvi', 'Chakraborty', 'Dermatologist', '0987654321', 'Surat'),
(11, 'Kavya', 'Rao', 'ENT Specialist', '9876543210', 'Lucknow'),
(12, 'Krish', 'Reddy', 'Rheumatologist', '8765432109', 'Chandigarh'),
(13, 'Myra', 'Thakur', 'Ophthalmologist', '7654321098', 'Indore'),
(14, 'Navya', 'Gandhi', 'Nephrologist', '6543210987', 'Nagpur'),
(15, 'Vihaan', 'Verma', 'Pulmonologist', '5432109876', 'Bhopal');


select * from provider;

INSERT INTO visit (vid, pid, providerid, visitdate, visittime, facilityloc) VALUES
(1, 1, 2, '2023-03-24', '09:00:00', 'Delhi'),
(2, 3, 1, '2023-03-25', '10:30:00', 'Mumbai'),
(3, 2, 5, '2023-03-26', '11:45:00', 'Chennai'),
(4, 4, 3, '2023-03-27', '13:15:00', 'Bangalore'),
(5, 5, 7, '2023-03-28', '14:30:00', 'Pune'),
(6, 6, 4, '2023-03-29', '15:45:00', 'Hyderabad'),
(7, 7, 9, '2023-03-30', '16:30:00', 'Ahmedabad'),
(8, 8, 12, '2023-03-31', '17:15:00', 'Chandigarh'),
(9, 9, 6, '2023-04-01', '09:00:00', 'Kolkata'),
(10, 10, 8, '2023-04-02', '10:30:00', 'Jaipur'),
(11, 11, 13, '2023-04-03', '11:45:00', 'Indore'),
(12, 12, 10, '2023-04-04', '13:15:00', 'Surat'),
(13, 13, 15, '2023-04-05', '14:30:00', 'Bhopal'),
(14, 14, 11, '2023-04-06', '15:45:00', 'Lucknow'),
(15, 15, 14, '2023-04-07', '16:30:00', 'Nagpur');


select * from visit;

INSERT INTO clinicalcare (ccid, vid, symptoms, dischargediagnosis, prescriptions, examresults, procedureresults) VALUES
(1, 1, 'Fever and cough', 'Viral infection', 'Acetaminophen and cough syrup', 'Normal', 'None'),
(2, 2, 'Headache and dizziness', 'Migraine', 'Sumatriptan and naproxen', 'Normal', 'None'),
(3, 3, 'Depression and anxiety', 'Generalized Anxiety Disorder', 'Escitalopram and clonazepam', 'Normal', 'None'),
(4, 4, 'Chest pain and shortness of breath', 'Myocardial infarction', 'Aspirin, nitroglycerin, and metoprolol', 'Elevated troponin levels', 'Angioplasty'),
(5, 5, 'Fatigue and swelling in legs', 'Congestive heart failure', 'Furosemide and lisinopril', 'Elevated BNP levels', 'None'),
(6, 6, 'Tingling and numbness in fingers', 'Carpal tunnel syndrome', 'Wrist splint and naproxen', 'Positive Tinel sign', 'None'),
(7, 7, 'Abdominal pain and nausea', 'Gastritis', 'Omeprazole and sucralfate', 'Normal', 'None'),
(8, 8, 'Joint pain and stiffness', 'Rheumatoid arthritis', 'Methotrexate and prednisone', 'Elevated rheumatoid factor and anti-CCP antibodies', 'None'),
(9, 9, 'Severe headache and vomiting', 'Meningitis', 'Vancomycin, ceftriaxone, and dexamethasone', 'Elevated WBC count and positive Kernig sign', 'Lumbar puncture'),
(10, 10, 'Skin rash and itching', 'Allergic dermatitis', 'Hydrocortisone and antihistamines', 'Erythematous and pruritic rash', 'None'),
(11, 11, 'Ear pain and discharge', 'Otitis media', 'Amoxicillin and ibuprofen', 'Bulging tympanic membrane and purulent discharge', 'None'),
(12, 12, 'Joint swelling and pain', 'Gout', 'Colchicine and indomethacin', 'Elevated serum uric acid levels', 'None'),
(13, 13, 'Shortness of breath and wheezing', 'Asthma', 'Albuterol and fluticasone', 'Decreased peak expiratory flow rate', 'None'),
(14, 14, 'Blurred vision and eye pain', 'Acute angle-closure glaucoma', 'Timolol and pilocarpine', 'Elevated intraocular pressure and shallow anterior chamber', 'Laser iridotomy'),
(15, 15, 'Kidney pain and difficulty urinating', 'Urinary tract infection', 'Ciprofloxacin and phenazopyridine', 'Elevated WBC count and positive urine culture', 'None');


select * from clinicalcare;

INSERT INTO appointment (aid, pid, providerid, appointmentdate, appointmenttime, appointmenttype, appointmentnotes) VALUES
(1, 1, 1, '2023-03-30', '09:00:00', 'Follow-up', 'Patient complained of persistent cough and fever.'),
(2, 2, 2, '2023-04-02', '10:30:00', 'New Patient', 'Patient reported a history of migraines.'),
(3, 3, 3, '2023-04-05', '11:15:00', 'Follow-up', 'Patient reported improvement in symptoms of depression.'),
(4, 4, 4, '2023-04-10', '13:00:00', 'Emergency', 'Patient presented with chest pain and shortness of breath.'),
(5, 5, 5, '2023-04-15', '15:30:00', 'Follow-up', 'Patient reported improvement in symptoms of congestive heart failure.'),
(6, 6, 6, '2023-04-20', '09:45:00', 'New Patient', 'Patient reported tingling and numbness in fingers.'),
(7, 7, 7, '2023-04-25', '11:30:00', 'Follow-up', 'Patient reported improvement in symptoms of gastritis.'),
(8, 8, 8, '2023-04-28', '13:15:00', 'Follow-up', 'Patient reported improvement in symptoms of rheumatoid arthritis.'),
(9, 9, 9, '2023-05-02', '10:00:00', 'Emergency', 'Patient presented with severe headache and vomiting.'),
(10, 10, 10, '2023-05-05', '12:45:00', 'Follow-up', 'Patient reported improvement in symptoms of allergic dermatitis.'),
(11, 11, 11, '2023-05-10', '15:00:00', 'New Patient', 'Patient reported ear pain and discharge.'),
(12, 12, 12, '2023-05-15', '11:30:00', 'Follow-up', 'Patient reported improvement in symptoms of gout.'),
(13, 13, 13, '2023-05-20', '14:15:00', 'Follow-up', 'Patient reported improvement in symptoms of asthma.'),
(14, 14, 14, '2023-05-25', '09:30:00', 'New Patient', 'Patient reported blurred vision and eye pain.'),
(15, 15, 15, '2023-05-30', '11:45:00', 'Follow-up', 'Patient reported improvement in symptoms of urinary tract infection.');


select * from appointment;

INSERT INTO ExamRoom (eid, examroomname, facilityloc, examroomnotes) VALUES
(1, 'Exam Room 1', 'Main Clinic', 'Standard exam room with basic equipment.'),
(2, 'Exam Room 2', 'Main Clinic', 'Standard exam room with basic equipment.'),
(3, 'Exam Room 3', 'Main Clinic', 'Standard exam room with basic equipment.'),
(4, 'Exam Room 4', 'Main Clinic', 'Standard exam room with basic equipment.'),
(5, 'Exam Room 5', 'Main Clinic', 'Standard exam room with basic equipment.'),
(6, 'Exam Room 6', 'Specialty Clinic', 'Specialized exam room for eye exams.'),
(7, 'Exam Room 7', 'Specialty Clinic', 'Specialized exam room for physical therapy.'),
(8, 'Exam Room 8', 'Specialty Clinic', 'Specialized exam room for dermatology.'),
(9, 'Exam Room 9', 'Specialty Clinic', 'Specialized exam room for cardiology.'),
(10, 'Exam Room 10', 'Emergency Department', 'Exam room equipped for emergency situations.'),
(11, 'Exam Room 11', 'Emergency Department', 'Exam room equipped for emergency situations.'),
(12, 'Exam Room 12', 'Emergency Department', 'Exam room equipped for emergency situations.'),
(13, 'Exam Room 13', 'Radiology Department', 'Exam room equipped for radiology procedures.'),
(14, 'Exam Room 14', 'Radiology Department', 'Exam room equipped for radiology procedures.'),
(15, 'Exam Room 15', 'Radiology Department', 'Exam room equipped for radiology procedures.');


select * from ExamRoom;

INSERT INTO bed (bedid, bedname, bednote) VALUES
(1, 'Bed 1', 'Standard hospital bed with adjustable height and headrest.'),
(2, 'Bed 2', 'Standard hospital bed with adjustable height and headrest.'),
(3, 'Bed 3', 'Standard hospital bed with adjustable height and headrest.'),
(4, 'Bed 4', 'Standard hospital bed with adjustable height and headrest.'),
(5, 'Bed 5', 'Standard hospital bed with adjustable height and headrest.'),
(6, 'Bed 6', 'Standard hospital bed with adjustable height and headrest.'),
(7, 'Bed 7', 'Standard hospital bed with adjustable height and headrest.'),
(8, 'Bed 8', 'Standard hospital bed with adjustable height and headrest.'),
(9, 'Bed 9', 'Standard hospital bed with adjustable height and headrest.'),
(10, 'Bed 10', 'Standard hospital bed with adjustable height and headrest.'),
(11, 'Bed 11', 'Standard hospital bed with adjustable height and headrest.'),
(12, 'Bed 12', 'Standard hospital bed with adjustable height and headrest.'),
(13, 'Bed 13', 'Standard hospital bed with adjustable height and headrest.'),
(14, 'Bed 14', 'Standard hospital bed with adjustable height and headrest.'),
(15, 'Bed 15', 'Standard hospital bed with adjustable height and headrest.');

select * from bed;

INSERT INTO supplies (supplyid, supplyname, supplytype, supplyquantity) VALUES
(1, 'Band-Aids', 'First Aid', 100),
(2, 'Gauze', 'First Aid', 50),
(3, 'Surgical Masks', 'PPE', 200),
(4, 'Gloves', 'PPE', 500),
(5, 'Face Shields', 'PPE', 50),
(6, 'Syringes', 'Medical Equipment', 100),
(7, 'Blood Pressure Cuff', 'Medical Equipment', 10),
(8, 'Stethoscope', 'Medical Equipment', 10),
(9, 'Wheelchair', 'Medical Equipment', 5),
(10, 'Crutches', 'Medical Equipment', 5),
(11, 'Catheter', 'Medical Equipment', 20),
(12, 'EKG Machine', 'Medical Equipment', 2),
(13, 'Pulse Oximeter', 'Medical Equipment', 10),
(14, 'Thermometer', 'Medical Equipment', 50),
(15, 'IV Bags', 'Medical Equipment', 50);



select * from supplies;


INSERT INTO Billing (billingid, vid, pid, providerid, billingdate, billingamount, billingnotes) VALUES
(1, 1, 1, 1, '2022-02-10', 125.50, 'Initial Consultation'),
(2, 2, 2, 2, '2022-02-12', 75.00, 'Follow-up Visit'),
(3, 3, 3, 3, '2022-02-15', 200.00, 'Diagnostic Tests'),
(4, 4, 4, 4, '2022-02-18', 300.00, 'Surgery'),
(5, 5, 5, 5, '2022-02-20', 50.00, 'Flu Shot'),
(6, 6, 6, 6, '2022-02-22', 150.00, 'Physical Exam'),
(7, 7, 7, 7, '2022-02-25', 100.00, 'Follow-up Visit'),
(8, 8, 8, 8, '2022-02-28', 75.00, 'Routine Check-up'),
(9, 9, 9, 9, '2022-03-02', 225.00, 'Lab Work'),
(10, 10, 10, 10, '2022-03-05', 500.00, 'Specialty Consultation'),
(11, 11, 11, 11, '2022-03-08', 150.00, 'Follow-up Visit'),
(12, 12, 12, 12, '2022-03-11', 250.00, 'MRI Scan'),
(13, 13, 13, 13, '2022-03-14', 75.00, 'Routine Check-up'),
(14, 14, 14, 14, '2022-03-17', 100.00, 'Follow-up Visit'),
(15, 15, 15, 15, '2022-03-20', 50.00, 'Vaccination');

select * from billing;


UPDATE Patient
SET phone_number = '123-456-7890'
WHERE pid = 1;

select * from Patient;

SELECT * FROM Patient
WHERE lastname = 'Kohli';

UPDATE provider
SET phno = '555-5678'
WHERE providerid = 1;

select * from provider;


INSERT INTO visit (vid, pid, providerid, visitdate, visittime, facilityloc)
VALUES (16, 2, 2, '2022-01-01', '10:00:00', 'Hospital A');

select * from visit;

UPDATE visit
SET facilityloc = 'Hospital B'
WHERE vid = 1;

select * from visit;

UPDATE clinicalcare
SET prescriptions = 'Aspirin, Clopidogrel'
WHERE ccid = 1;

select * from clinicalcare;

SELECT * FROM clinicalcare
WHERE dischargediagnosis = 'Myocardial infarction';





SELECT * FROM Patient WHERE firstname LIKE '%Virat%' OR lastname LIKE '%Kohli%';


SELECT * FROM Patient WHERE pid = 1;

SELECT * FROM appointment
JOIN Patient ON appointment.pid = Patient.pid
WHERE Patient.firstname LIKE '%Gautam%' OR Patient.lastname LIKE '%Gambhir%';

SELECT * FROM appointment WHERE appointmenttype LIKE '%Follow-up%';

SELECT * FROM ExamRoom WHERE eid = 7;

SELECT * FROM supplies WHERE supplyid = 8;

SELECT * FROM Billing WHERE billingid = 9;







SELECT Patient.firstname, Patient.lastname, visit.visitdate, clinicalcare.dischargediagnosis
FROM Patient
JOIN visit ON Patient.pid = visit.pid
JOIN clinicalcare ON visit.vid = clinicalcare.vid
WHERE clinicalcare.dischargediagnosis = 'Viral infection';

SELECT Patient.firstname, Patient.lastname, visit.visitdate
FROM Patient
JOIN visit ON Patient.pid = visit.pid
WHERE visit.visitdate = '2023-03-24';


SELECT Patient.firstname, Patient.lastname, visit.visitdate, provider.firstname, provider.lastname
FROM Patient
JOIN visit ON Patient.pid = visit.pid
JOIN provider ON visit.providerid = provider.providerid
WHERE provider.firstname = 'Avni' AND provider.lastname = 'Jain';

SELECT Patient.firstname, Patient.lastname, clinicalcare.dischargediagnosis
FROM Patient
JOIN visit ON Patient.pid = visit.pid
JOIN clinicalcare ON visit.vid = clinicalcare.vid
WHERE clinicalcare.dischargediagnosis IS NOT NULL AND visit.visitdate IN (
  SELECT MIN(visitdate)
  FROM visit
  WHERE pid = Patient.pid
  GROUP BY pid
  HAVING COUNT(*) >= 0
);




select * from clinicalcare;


