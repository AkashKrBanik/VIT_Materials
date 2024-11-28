CREATE TABLE PROFESSOR_24MCA0242 (
    Prof_id VARCHAR2(5),
    Prof_name VARCHAR2(30) NOT NULL,
    Email VARCHAR2(30) NOT NULL,
    Mobile NUMBER(10) NOT NULL,
    Specialty VARCHAR2(30),
    Dept_id VARCHAR2(5),
    CONSTRAINT pk_professor PRIMARY KEY (Prof_id),
    CONSTRAINT uq_prof_email UNIQUE (Email),
    CONSTRAINT uq_prof_mobile UNIQUE (Mobile),
    CONSTRAINT ck_prof_email CHECK (INSTR(Email, '@') > 1),
    CONSTRAINT ck_prof_mobile CHECK (LENGTH(Mobile) = 10)
);

ALTER TABLE PROFESSOR_24MCA0242 
ADD CONSTRAINT fk_prof_dept FOREIGN KEY (Dept_id) REFERENCES DEPARTMENT_24MCA0242 (Dept_id);

ALTER TABLE PROFESSOR_24MCA0242 DROP CONSTRAINT fk_prof_dept;

ALTER TABLE PROFESSOR_24MCA0242 DISABLE CONSTRAINT fk_prof_dept;
ALTER TABLE DEPARTMENT_24MCA0242 DISABLE CONSTRAINT fk_dept_prof;

ALTER TABLE PROFESSOR_24MCA0242 ENABLE CONSTRAINT fk_prof_dept;
ALTER TABLE DEPARTMENT_24MCA0242 ENABLE CONSTRAINT fk_dept_prof;


INSERT INTO PROFESSOR_24MCA0242 (Prof_id,Prof_name,Email,Mobile,Specialty,Dept_id) VALUES ('&Prof_id','&Prof_name','&Email','&Mobile','&Specialty','&Dept_id');

INSERT INTO PROFESSOR_24MCA0242 (Prof_id, Prof_name, Email, Mobile, Specialty, Dept_id) 
VALUES ('P0001', 'Dr. Ravi Kumar', 'ravi.kumar@uni.edu', '9876543210', 'Data Science', 'D0001');

INSERT INTO PROFESSOR_24MCA0242 (Prof_id, Prof_name, Email, Mobile, Specialty, Dept_id) 
VALUES ('P0002', 'Dr. Neha Sharma', 'neha.sharma@uni.edu', '9876543211', 'Machine Learning', 'D0002');

INSERT INTO PROFESSOR_24MCA0242 (Prof_id, Prof_name, Email, Mobile, Specialty, Dept_id) 
VALUES ('P0003', 'Dr. Arjun Mehta', 'arjun.mehta@uni.edu', '9876543212', 'Cybersecurity', 'D0003');

INSERT INTO PROFESSOR_24MCA0242 (Prof_id, Prof_name, Email, Mobile, Specialty, Dept_id) 
VALUES ('P0004', 'Dr. Priya Singh', 'priya.singh@uni.edu', '9876543213', 'Artificial Intelligence', 'D0004');

INSERT INTO PROFESSOR_24MCA0242 (Prof_id, Prof_name, Email, Mobile, Specialty, Dept_id) 
VALUES ('P0005', 'Dr. Suresh Gupta', 'suresh.gupta@uni.edu', '9876543214', 'Cloud Computing', 'D0005');

***************************************************************************************************************************************


CREATE TABLE SCHOOL_24MCA0242 (
    SCode VARCHAR2(5),
    Scl_name VARCHAR2(10) NOT NULL,
    Prof_id VARCHAR2(5),
    Location VARCHAR2(50),
    CONSTRAINT pk_school PRIMARY KEY (SCode),
    CONSTRAINT fk_school_prof FOREIGN KEY (Prof_id) REFERENCES PROFESSOR_24MCA0242 (Prof_id)
);

INSERT INTO SCHOOL_24MCA0242 (Scode,Scl_name,Prof_id,Location) VALUES ('&Scode','&Scl_name','&Prof_id','&Location');


INSERT INTO SCHOOL_24MCA0242 (SCode, Scl_name, Prof_id, Location) 
VALUES ('S0001', 'Science', 'P0001', 'Mumbai');

INSERT INTO SCHOOL_24MCA0242 (SCode, Scl_name, Prof_id, Location) 
VALUES ('S0002', 'Arts', 'P0002', 'Delhi');

INSERT INTO SCHOOL_24MCA0242 (SCode, Scl_name, Prof_id, Location) 
VALUES ('S0003', 'Commerce', 'P0003', 'Bangalore');

INSERT INTO SCHOOL_24MCA0242 (SCode, Scl_name, Prof_id, Location) 
VALUES ('S0004', 'Engineering', 'P0004', 'Hyderabad');

INSERT INTO SCHOOL_24MCA0242 (SCode, Scl_name, Prof_id, Location) 
VALUES ('S0005', 'Law', 'P0005', 'Chennai');





***************************************************************************************************************************************

CREATE TABLE DEPARTMENT_24MCA0242 (
    Dept_id VARCHAR2(5),
    Dname VARCHAR2(50) NOT NULL,
    SCode VARCHAR2(5),
    Prof_id VARCHAR2(5),
    CONSTRAINT pk_department PRIMARY KEY (Dept_id),
    CONSTRAINT fk_dept_school FOREIGN KEY (SCode) REFERENCES SCHOOL_24MCA0242 (SCode),
    CONSTRAINT fk_dept_prof FOREIGN KEY (Prof_id) REFERENCES PROFESSOR_24MCA0242 (Prof_id)
);

INSERT INTO DEPARTMENT_24MCA0242 (Dept_id,Dname,Scode,Prof_id) VALUES ('&Dept_id','&Dname','&Scode','&Prof_id');


INSERT INTO DEPARTMENT_24MCA0242 (Dept_id, Dname, SCode, Prof_id) 
VALUES ('D0001', 'Computer Science', 'S0001', 'P0001');

INSERT INTO DEPARTMENT_24MCA0242 (Dept_id, Dname, SCode, Prof_id) 
VALUES ('D0002', 'Mechanical Engineering', 'S0004', 'P0002');

INSERT INTO DEPARTMENT_24MCA0242 (Dept_id, Dname, SCode, Prof_id) 
VALUES ('D0003', 'Physics', 'S0001', 'P0003');

INSERT INTO DEPARTMENT_24MCA0242 (Dept_id, Dname, SCode, Prof_id) 
VALUES ('D0004', 'Electrical Engineering', 'S0004', 'P0004');

INSERT INTO DEPARTMENT_24MCA0242 (Dept_id, Dname, SCode, Prof_id) 
VALUES ('D0005', 'Civil Engineering', 'S0004', 'P0005');


****************************************************************************************************************************************

CREATE TABLE COURSE_24MCA0242 (
    Crs_code VARCHAR2(5),
    Crs_name VARCHAR2(50) NOT NULL,
    Description VARCHAR2(50),
    Credits NUMBER(2) NOT NULL,
    Hours NUMBER(3) NOT NULL,
    CONSTRAINT pk_course PRIMARY KEY (Crs_code)
);

INSERT INTO COURSE_24MCA0242 (Crs_code,Crs_name,Description,Credits,Hours) VALUES ('&Crs_code','&Crs_name','&Description','&Credits','&Hours');


INSERT INTO COURSE_24MCA0242 (Crs_code, Crs_name, Description, Credits, Hours) 
VALUES ('CRS01', 'Data Structures', 'Introduction to Data Structures', 4, 40);

INSERT INTO COURSE_24MCA0242 (Crs_code, Crs_name, Description, Credits, Hours) 
VALUES ('CRS02', 'Operating Systems', 'Study of Operating Systems', 3, 33);

INSERT INTO COURSE_24MCA0242 (Crs_code, Crs_name, Description, Credits, Hours) 
VALUES ('CRS03', 'Database Management', 'Database Concepts and SQL', 5, 55);

INSERT INTO COURSE_24MCA0242 (Crs_code, Crs_name, Description, Credits, Hours) 
VALUES ('CRS04', 'Algorithms', 'Design and Analysis of Algorithms', 4, 45);

INSERT INTO COURSE_24MCA0242 (Crs_code, Crs_name, Description, Credits, Hours) 
VALUES ('CRS05', 'Artificial Intelligence', 'Introduction to AI Concepts', 5, 60);


***************************************************************************************************************************************

CREATE TABLE STUDENT_24MCA0242 (
    Reg_no VARCHAR2(5),
    Sname VARCHAR2(30) NOT NULL,
    Address VARCHAR2(50),
    DoB DATE NOT NULL,
    Email VARCHAR2(30) NOT NULL,
    Mobile NUMBER(10) NOT NULL,
    Dept_id VARCHAR2(5),
    Prof_id VARCHAR2(5),
    CONSTRAINT pk_student PRIMARY KEY (Reg_no),
    CONSTRAINT fk_student_dept FOREIGN KEY (Dept_id) REFERENCES DEPARTMENT_24MCA0242 (Dept_id),
    CONSTRAINT fk_student_prof FOREIGN KEY (Prof_id) REFERENCES PROFESSOR_24MCA0242 (Prof_id),
    CONSTRAINT uq_student_email UNIQUE (Email),
    CONSTRAINT uq_student_mobile UNIQUE (Mobile),
    CONSTRAINT ck_student_email CHECK (INSTR(Email, '@') > 1),
    CONSTRAINT ck_student_mobile CHECK (LENGTH(Mobile) = 10)
);

INSERT INTO STUDENT_24MCA0242 (Reg_no,Sname,Address,DoB,Email,Mobile,Dept_id,Prof_id) VALUES ('&Reg_no','&Sname','&Address',TO_DATE('&DoB','YYYY-MM-DD'),'&Email','&Mobile','&Dept_id','&Prof_id');

INSERT INTO STUDENT_24MCA0242 (Reg_no, Sname, Address, DoB, Email, Mobile, Dept_id, Prof_id) 
VALUES ('R0001', 'Amit Verma', 'Mumbai', TO_DATE('1998-05-12', 'YYYY-MM-DD'), 'amit.verma@student.edu', '9876543215', 'D0001', 'P0001');

INSERT INTO STUDENT_24MCA0242 (Reg_no, Sname, Address, DoB, Email, Mobile, Dept_id, Prof_id) 
VALUES ('R0002', 'Sunita Desai', 'Delhi', TO_DATE('1999-07-20', 'YYYY-MM-DD'), 'sunita.desai@student.edu', '9876543216', 'D0002', 'P0002');

INSERT INTO STUDENT_24MCA0242 (Reg_no, Sname, Address, DoB, Email, Mobile, Dept_id, Prof_id) 
VALUES ('R0003', 'Rahul Singh', 'Bangalore', TO_DATE('1997-11-30', 'YYYY-MM-DD'), 'rahul.singh@student.edu', '9876543217', 'D0003', 'P0003');

INSERT INTO STUDENT_24MCA0242 (Reg_no, Sname, Address, DoB, Email, Mobile, Dept_id, Prof_id) 
VALUES ('R0004', 'Pooja Reddy', 'Hyderabad', TO_DATE('1996-02-15', 'YYYY-MM-DD'), 'pooja.reddy@student.edu', '9876543218', 'D0004', 'P0004');

INSERT INTO STUDENT_24MCA0242 (Reg_no, Sname, Address, DoB, Email, Mobile, Dept_id, Prof_id) 
VALUES ('R0005', 'Anil Kumar', 'Chennai', TO_DATE('1998-09-05', 'YYYY-MM-DD'), 'anil.kumar@student.edu', '9876543219', 'D0005', 'P0005');


****************************************************************************************************************************************

CREATE TABLE PROGRAMME_24MCA0242 (
    Prog_code VARCHAR2(5),
    Prog_name VARCHAR2(30) NOT NULL,
    Prog_preamble VARCHAR2(50),
    Scode VARCHAR2(5),
    Dept_id VARCHAR2(5),
    CONSTRAINT pk_programme PRIMARY KEY (Prog_code),
    CONSTRAINT fk_prog_school FOREIGN KEY (Scode) REFERENCES SCHOOL_24MCA0242 (SCode),
    CONSTRAINT fk_prog_dept FOREIGN KEY (Dept_id) REFERENCES DEPARTMENT_24MCA0242 (Dept_id)
);

INSERT INTO PROGRAMME_24MCA0242 (Prog_code,Prog_name,Prog_preamble,Scode,Dept_id) VALUES ('&Prog_code','&Prog_name','&Prog_preamble','&Scode','&Dept_id');

INSERT INTO PROGRAMME_24MCA0242 (Prog_code, Prog_name, Prog_preamble, SCode, Dept_id) 
VALUES ('PRG01', 'B.Tech CSE', 'Computer Science and Engineering', 'S0001', 'D0001');

INSERT INTO PROGRAMME_24MCA0242 (Prog_code, Prog_name, Prog_preamble, SCode, Dept_id) 
VALUES ('PRG02', 'B.Tech ME', 'Mechanical Engineering', 'S0004', 'D0002');

INSERT INTO PROGRAMME_24MCA0242 (Prog_code, Prog_name, Prog_preamble, SCode, Dept_id) 
VALUES ('PRG03', 'B.Sc Physics', 'Bachelor of Science in Physics', 'S0001', 'D0003');

INSERT INTO PROGRAMME_24MCA0242 (Prog_code, Prog_name, Prog_preamble, SCode, Dept_id) 
VALUES ('PRG04', 'B.Tech EE', 'Electrical Engineering', 'S0004', 'D0004');

INSERT INTO PROGRAMME_24MCA0242 (Prog_code, Prog_name, Prog_preamble, SCode, Dept_id) 
VALUES ('PRG05', 'B.Tech CE', 'Civil Engineering', 'S0004', 'D0005');


****************************************************************************************************************************************

CREATE TABLE SEMESTER_24MCA0242 (
    Sem_code VARCHAR2(10),
    Term VARCHAR2(5) CHECK (Term IN ('Winter', 'Fall')),
    Year NUMBER(4) NOT NULL,
    Sdate DATE NOT NULL,
    Edate DATE NOT NULL,
    CONSTRAINT pk_semester PRIMARY KEY (Sem_code),
    CONSTRAINT ck_sem_code CHECK (Sem_code LIKE 'Win%' OR Sem_code LIKE 'Fall%')
);

ALTER TABLE SEMESTER_24MCA0242 MODIFY (Term Varchar2(10));

INSERT INTO SEMESTER_24MCA0242 (Sem_code,Term,Year,Sdate,Edate) VALUES ('&Sem_code','&Term','&Year',TO_DATE('&Sdate','YYYY-MM-DD'),TO_DATE('&Edate','YYYY-MM-DD'));


INSERT INTO SEMESTER_24MCA0242 (Sem_code, Term, Year, Sdate, Edate) 
VALUES ('Win2024', 'Winter', 2024, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-05-15', 'YYYY-MM-DD'));

INSERT INTO SEMESTER_24MCA0242 (Sem_code, Term, Year, Sdate, Edate) 
VALUES ('Fall2024', 'Fall', 2024, TO_DATE('2024-08-10', 'YYYY-MM-DD'), TO_DATE('2024-12-20', 'YYYY-MM-DD'));

INSERT INTO SEMESTER_24MCA0242 (Sem_code, Term, Year, Sdate, Edate) 
VALUES ('Win2023', 'Winter', 2023, TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-05-20', 'YYYY-MM-DD'));

INSERT INTO SEMESTER_24MCA0242 (Sem_code, Term, Year, Sdate, Edate) 
VALUES ('Fall2023', 'Fall', 2023, TO_DATE('2023-08-15', 'YYYY-MM-DD'), TO_DATE('2023-12-25', 'YYYY-MM-DD'));

INSERT INTO SEMESTER_24MCA0242 (Sem_code, Term, Year, Sdate, Edate) 
VALUES ('Win2022', 'Winter', 2022, TO_DATE('2022-01-20', 'YYYY-MM-DD'), TO_DATE('2022-05-25', 'YYYY-MM-DD'));


****************************************************************************************************************************************

CREATE TABLE CLASS_24MCA0242 (
    Cls_code VARCHAR2(5),
    Slot VARCHAR2(10) NOT NULL,
    Stime TIMESTAMP(0) NOT NULL,
    Etime TIMESTAMP(0) NOT NULL,
    Crs_code VARCHAR2(5),
    Prof_id VARCHAR2(5),
    Room_no VARCHAR2(10),
    Sem_code VARCHAR2(10),
    Day_of_week VARCHAR2(10),
    CONSTRAINT pk_class PRIMARY KEY (Cls_code),
    CONSTRAINT fk_class_course FOREIGN KEY (Crs_code) REFERENCES COURSE_24MCA0242 (Crs_code),
    CONSTRAINT fk_class_prof FOREIGN KEY (Prof_id) REFERENCES PROFESSOR_24MCA0242 (Prof_id),
    CONSTRAINT fk_class_sem FOREIGN KEY (Sem_code) REFERENCES SEMESTER_24MCA0242 (Sem_code)
);

INSERT INTO CLASS_24MCA0242 (Cls_code,Slot,Stime,Etime,Crs_code,Prof_id,Room_no,Sem_code,Day_of_week) VALUES ('&Cls_code','&Slot',TO_TIMESTAMP('&Stime','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('&Etime','YYYY-MM-DD HH24:MI:SS'),'&Crs_code','&Prof_id','&Room_no','&Sem_code','&Day_of_week');


INSERT INTO CLASS_24MCA0242 (Cls_code, Slot, Stime, Etime, Crs_code, Prof_id, Room_no, Sem_code, Day_of_week)
VALUES ('CLS01', 'A1', TO_TIMESTAMP ('2024-08-20 09:00:00','YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2024-08-20 10:30:00','YYYY-MM-DD HH24:MI:SS'), 'CRS01', 'P0001', 'SJT201', 'Fall2024', 'Monday'); -------ALSO CORRECT

INSERT INTO CLASS_24MCA0242 (Cls_code, Slot, Stime, Etime, Crs_code, Prof_id, Room_no, Sem_code, Day_of_week)
VALUES ('CLS02', 'B1', TIMESTAMP '2024-08-20 11:00:00', TIMESTAMP '2024-08-20 12:30:00', 'CRS02', 'P0002', 'SMV102', 'Fall2024', 'Wednesday');

INSERT INTO CLASS_24MCA0242 (Cls_code, Slot, Stime, Etime, Crs_code, Prof_id, Room_no, Sem_code, Day_of_week)
VALUES ('CLS03', 'C1', TIMESTAMP '2024-08-21 09:00:00', TIMESTAMP '2024-08-21 10:30:00', 'CRS03', 'P0003', 'TT103', 'Fall2024', 'Thursday');

INSERT INTO CLASS_24MCA0242 (Cls_code, Slot, Stime, Etime, Crs_code, Prof_id, Room_no, Sem_code, Day_of_week)
VALUES ('CLS04', 'D1', TIMESTAMP '2024-08-22 14:00:00', TIMESTAMP '2024-08-22 15:30:00', 'CRS04', 'P0004', 'SJT104', 'Fall2024', 'Friday');

INSERT INTO CLASS_24MCA0242 (Cls_code, Slot, Stime, Etime, Crs_code, Prof_id, Room_no, Sem_code, Day_of_week)
VALUES ('CLS05', 'E1', TIMESTAMP '2024-08-23 09:00:00', TIMESTAMP '2024-08-23 10:30:00', 'CRS05', 'P0005', 'TT105', 'Fall2024', 'Monday');



****************************************************************************************************************************************


CREATE TABLE ENROLL_24MCA0242 (
    Cls_code VARCHAR2(5),
    Reg_no VARCHAR2(5),
    Enroll_time TIMESTAMP(0) NOT NULL,
    Grade CHAR(1) CHECK (Grade IN ('S', 'A', 'B', 'C', 'D')),
    CONSTRAINT pk_enroll PRIMARY KEY (Cls_code, Reg_no),
    CONSTRAINT fk_enroll_class FOREIGN KEY (Cls_code) REFERENCES CLASS_24MCA0242 (Cls_code) ON DELETE CASCADE,
    CONSTRAINT fk_enroll_student FOREIGN KEY (Reg_no) REFERENCES STUDENT_24MCA0242 (Reg_no) ON DELETE CASCADE
);

INSERT INTO ENROLL_24MCA0242 (Cls_code,Reg_no,Enroll_time,Grade) VALUES ('&Cls_code','&Reg_no',TO_TIMESTAMP('&Enroll_time','YYYY-MM-DD HH24:MI:SS'),'&Grade');


INSERT INTO ENROLL_24MCA0242 (Cls_code, Reg_no, Enroll_time, Grade) 
VALUES ('CLS01', 'R0001', TO_TIMESTAMP('2021-01-05 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'A');

INSERT INTO ENROLL_24MCA0242 (Cls_code, Reg_no, Enroll_time, Grade) 
VALUES ('CLS02', 'R0002', TO_TIMESTAMP('2021-08-08 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'B');

INSERT INTO ENROLL_24MCA0242 (Cls_code, Reg_no, Enroll_time, Grade) 
VALUES ('CLS03', 'R0003', TO_TIMESTAMP('2022-01-12 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'S');

INSERT INTO ENROLL_24MCA0242 (Cls_code, Reg_no, Enroll_time, Grade) 
VALUES ('CLS04', 'R0004', TO_TIMESTAMP('2022-08-10 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'C');

INSERT INTO ENROLL_24MCA0242 (Cls_code, Reg_no, Enroll_time, Grade) 
VALUES ('CLS05', 'R0005', TO_TIMESTAMP('2023-01-18 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'D');


****************************************************************************************************************************************


CREATE TABLE STUDENT_VISA_24MCA0242 (
    Reg_no VARCHAR2(5),
    Visa_status VARCHAR2(10),
    CONSTRAINT pk_student_visa PRIMARY KEY (Reg_no),
    CONSTRAINT fk_student_visa FOREIGN KEY (Reg_no) REFERENCES STUDENT_24MCA0242 (Reg_no)
);

INSERT INTO STUDENT_VISA_24MCA0242 (Reg_no,Visa_status) VALUES ('&Reg_no','&Visa_status');


INSERT INTO STUDENT_VISA_24MCA0242 (Reg_no, Visa_status) 
VALUES ('R0001', 'Approved');

INSERT INTO STUDENT_VISA_24MCA0242 (Reg_no, Visa_status) 
VALUES ('R0002', 'Pending');

INSERT INTO STUDENT_VISA_24MCA0242 (Reg_no, Visa_status) 
VALUES ('R0003', 'Approved');

INSERT INTO STUDENT_VISA_24MCA0242 (Reg_no, Visa_status) 
VALUES ('R0004', 'Expired');

INSERT INTO STUDENT_VISA_24MCA0242 (Reg_no, Visa_status) 
VALUES ('R0005', 'Pending');



****************************************************************************************************************************************


DROP TABLE PROFESSOR_24MCA0242;
DROP TABLE DEPARTMENT_24MCA0242;
DROP TABLE SCHOOL_24MCA0242;
DROP TABLE COURSE_24MCA0242;
DROP TABLE STUDENT_24MCA0242;
DROP TABLE PROGRAMME_24MCA0242;
DROP TABLE SEMESTER_24MCA0242;
DROP TABLE CLASS_24MCA0242;
DROP TABLE ENROLL_24MCA0242;
DROP TABLE STUDENT_VISA_24MCA0242;

********************** Q4 ***************************************************
4(i)--------

SELECT UPPER(Prof_name) AS Uppercase_Prof_Name FROM PROFESSOR_24MCA0242;

SELECT LOWER(Email) AS Lowercase_Email FROM PROFESSOR_24MCA0242;

SELECT INITCAP(Speciality) AS Capitalized_Speciality FROM PROFESSOR_24MCA0242;

SELECT Prof_name, LENGTH(Prof_name) AS Name_Length FROM PROFESSOR_24MCA0242;

SELECT Prof_id, LPAD(Prof_id, 10, 'PROF_') AS Padded_Prof_ID FROM PROFESSOR_24MCA0242;

SELECT Prof_id, RPAD(Prof_id, 10, '*') AS Padded_Prof_Name FROM PROFESSOR_24MCA0242;

SELECT Prof_name,LTRIM(Prof_name, 'Dr. ') AS LTrimmed_Prof_Name FROM PROFESSOR_24MCA0242;

SELECT RTRIM(Prof_name, 'a') AS RTrimmed_Prof_Name FROM PROFESSOR_24MCA0242;

SELECT TRIM('Dr. ' FROM Prof_name) AS Trimmed_Prof_Name FROM PROFESSOR_24MCA0242;

******************************

INSERT INTO SCHOOL_24MCA0242 (SCode, Scl_name, Prof_id, Location) 
VALUES ('S0006', 'Law', 'P0005',NULL);

4(ii)---The NVL function replaces a NULL value with a specified replacement value. It is commonly used in Oracle databases. NVL(column_name,value)
(a)  SELECT SCode, NVL(Location, 'No Location Provided') AS Location FROM SCHOOL_24MCA0242;

---The NULLIF function compares two expressions and returns NULL if they are equal; otherwise, it returns the first expression. 
---Eg: SELECT NULLIF(salary, 0) AS result FROM employees; 
---If salary is 0, it returns NULL. Otherwise, it returns the salary.
(b)  SELECT SCode, NULLIF(Location, 'No Location Provided') AS Location FROM SCHOOL_24MCA0242;
---------

4(iii)  SELECT Sname FROM STUDENT_24MCA0242 WHERE EXTRACT(MONTH FROM DOB) = 2;

4(iv)  SELECT Sname FROM STUDENT_24MCA0242 WHERE DOB = TO_DATE('1998-05-12', 'YYYY-MM-DD');

4(v)  SELECT Sname, TO_CHAR(DoB, 'Day, Month dd, yyyy') AS Formatted_DoB FROM STUDENT_24MCA0242 WHERE Reg_no = 'R0003';

4(vi)  SELECT Cls_code, TO_CHAR(Stime, 'HH24:MI') AS S_Hr_Min, TO_CHAR(Etime, 'HH24:MI') AS E_Hr_Min FROM CLASS_24MCA0242 WHERE Cls_code = 'CLS01'; 

***********************************************************************

UPDATE SEMESTER_24MCA0242 
SET Sem_code = 'Fall2024-25', Year = 2024, Sdate = TO_DATE('2024-07-02', 'YYYY-MM-DD'), Edate = TO_DATE('2025-12-28', 'YYYY-MM-DD') 
WHERE Sem_code = 'Fall2024';

UPDATE SEMESTER_24MCA0242 
SET Year = 2017, Sdate = TO_DATE('2017-12-05', 'YYYY-MM-DD'), Edate = TO_DATE('2018-04-25', 'YYYY-MM-DD') 
WHERE Sem_code = 'Win2017';


INSERT INTO SEMESTER_24MCA0242 (Sem_code, Term, Year, Sdate, Edate) 
VALUES ('Win2024', 'Winter', 2024, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-05-15', 'YYYY-MM-DD'));

INSERT INTO SEMESTER_24MCA0242 (Sem_code, Term, Year, Sdate, Edate) 
VALUES ('Fall2024', 'Fall', 2024, TO_DATE('2024-08-10', 'YYYY-MM-DD'), TO_DATE('2024-12-20', 'YYYY-MM-DD'));

INSERT INTO SEMESTER_24MCA0242 (Sem_code, Term, Year, Sdate, Edate) 
VALUES ('Win2023', 'Winter', 2023, TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-05-20', 'YYYY-MM-DD'));

INSERT INTO SEMESTER_24MCA0242 (Sem_code, Term, Year, Sdate, Edate) 
VALUES ('Fall2023', 'Fall', 2023, TO_DATE('2023-08-15', 'YYYY-MM-DD'), TO_DATE('2023-12-25', 'YYYY-MM-DD'));

INSERT INTO SEMESTER_24MCA0242 (Sem_code, Term, Year, Sdate, Edate) 
VALUES ('Win2022', 'Winter', 2022, TO_DATE('2022-01-20', 'YYYY-MM-DD'), TO_DATE('2022-05-25', 'YYYY-MM-DD'));
********************************

4(vii) SELECT Sem_code, TO_CHAR(Sdate, 'Day') AS Start_Day_of_Week, TO_CHAR(Edate, 'Day') AS End_Day_of_Week FROM SEMESTER_24MCA0242 WHERE Sem_code = 'Win2017-18';


4(viii)  SELECT Sem_code, ROUND((Edate - Sdate) / 7, 2) AS Duration_in_Weeks FROM SEMESTER_24MCA0242 WHERE Sem_code = 'Win2017-18';

--also possible date
INSERT INTO STUDENT (Reg_no, Sname, Address, DoB, Email, 
Mobile, Dept_id, Prof_id) VALUES ('R0099', 'Samay Raina', 'Pune', TO_DATE('25-12-2012', 'DD-MM-YYYY'), 'samay.rainaL@student.edu', '9876500888', 'D0002', 'P0002'); 


INSERT INTO STUDENT_24MCA0242 (Reg_no, Sname, Address, DoB, Email, Mobile, Dept_id, Prof_id) VALUES ('R0007', 'Samay Raina', 'Pune', TO_DATE('2003-05-12', 'YYYY-MM-DD'), 'samay.raina@student.edu', '9876543888', 'D0002', 'P0002');

SELECT Sname, TO_CHAR(DOB, 'DD/MM/YY') AS Formatted_DoB FROM STUDENT_24MCA0242 WHERE Reg_no = 'R0007';

UPDATE STUDENT_24MCA0242 SET DoB = TO_DATE('2001-08-15', 'YYYY-MM-DD') 
WHERE Reg_no = 'R0006';

***************************************

SELECT CEIL(AVG(Duration)) AS Ceil_Duration_Weeks FROM (SELECT (Edate - Sdate) * 7 AS Duration FROM SEMESTER_24MCA0242 WHERE Sem_code = 'Win2024-25');

SELECT CEIL(AVG(Credits)) AS Ceil_Avg_Credits FROM COURSE_24MCA0242;

SELECT FLOOR(AVG(Duration)) AS Floor_Duration_Weeks FROM (SELECT (Edate - Sdate) * 7 AS Duration FROM SEMESTER_24MCA0242 WHERE Sem_code = 'Win2024-25');

SELECT AVG(Duration) AS Avg_Duration,FLOOR(AVG(Duration)) AS Floor_Duration_Weeks FROM (SELECT (Edate - Sdate) * 7 AS Duration FROM SEMESTER_24MCA0242 WHERE Sem_code = 'Win2024-25');


SELECT AVG(Credits) AS Avg_Credits, FLOOR(AVG(Credits)) AS Floor_Avg_Credits FROM COURSE_24MCA0242;

SELECT AVG(Credits) AS Avg_Credits, CEIL(AVG(Credits)) AS Ceil_Avg_Credits FROM COURSE_24MCA0242;

SELECT TRUNC(AVG(Credits)) AS Truncated_Avg_Credits FROM COURSE_24MCA0242;

SELECT MIN(Credits) AS Min_Credits FROM COURSE_24MCA0242;

SELECT MAX(Credits) AS Max_Credits FROM COURSE_24MCA0242;

SELECT AVG(Credits) AS Avg_Credits FROM COURSE_24MCA0242;

SELECT COUNT(*) AS Total_Students FROM STUDENT_24MCA0242;

******************************************************
5-------

SELECT Sname, Email, Address FROM STUDENT_24MCA0242 WHERE Address = 'Katpadi' AND SUBSTR(Sname, 3, 1) = 'l';


SELECT Sname, Email, Address FROM STUDENT_24MCA0242 WHERE Address = 'Katpadi' AND Sname LIKE '__l%';

5_2
SELECT Sname, Email, Address FROM STUDENT_24MCA0242 WHERE Address NOT IN('Tamil Nadu');

5_3
SELECT Sname, Email, Address FROM STUDENT_24MCA0242 WHERE Address NOT LIKE '%India';


INSERT INTO STUDENT_24MCA0242 (Reg_no, Sname, Address, DoB, Email, Mobile, Dept_id, Prof_id) 
VALUES ('R0012', 'John Doe', 'New York, USA', TO_DATE('1999-04-18', 'YYYY-MM-DD'), 'john.doe@student.edu', '5234567890', 'D0001', 'P0001');

INSERT INTO STUDENT_24MCA0242 (Reg_no, Sname, Address, DoB, Email, Mobile, Dept_id, Prof_id) 
VALUES ('R0011', 'Maria Garcia', 'Madrid, Spain', TO_DATE('2000-09-12', 'YYYY-MM-DD'), 'maria.garcia@student.edu', '6987654321', 'D0002', 'P0002');

--------------------
5_4

INSERT INTO DEPARTMENT_24MCA0242 (Dept_id, Dname, Scode, Prof_id) 
VALUES ('D0006', 'Medicine', 'S0007', 'P0006');

INSERT INTO SCHOOL_24MCA0242 (Scode, Scl_name, Prof_id, Location) 
VALUES ('S0007', 'School of Medicine', 'P0006', 'Delhi');

INSERT INTO PROFESSOR_24MCA0242 (Prof_id, Prof_name, Email, Mobile, Specialty, Dept_id) 
VALUES ('P0006', 'Dr. Ramesh Iyer', 'ramesh.iyer@medschool.edu', '9876503215', 'Neuroscience', 'D0006');

SELECT P.Prof_name, P.Specialty, S.Scl_name FROM PROFESSOR_24MCA0242 P JOIN DEPARTMENT_24MCA0242 D ON P.Dept_id = D.Dept_id JOIN SCHOOL_24MCA0242 S ON D.Scode = S.Scode WHERE S.Scl_name = 'School of Medicine';





*************************************************************
******************DISABLING FOREIGN KEY CONSTRAINTS******************************************
*************************************************************
-- Disable Foreign Key Constraints in STUDENT_24MCA0242
ALTER TABLE STUDENT_24MCA0242 DISABLE CONSTRAINT FK_STUDENT_PROF;
ALTER TABLE STUDENT_24MCA0242 DISABLE CONSTRAINT FK_STUDENT_DEPT;

-- Disable Foreign Key Constraints in SCHOOL_24MCA0242
ALTER TABLE SCHOOL_24MCA0242 DISABLE CONSTRAINT FK_SCHOOL_PROF;

-- Disable Foreign Key Constraints in PROGRAMME_24MCA0242
ALTER TABLE PROGRAMME_24MCA0242 DISABLE CONSTRAINT FK_PROG_DEPT;
ALTER TABLE PROGRAMME_24MCA0242 DISABLE CONSTRAINT FK_PROG_SCHOOL;

-- Disable Foreign Key Constraints in PROFESSOR_24MCA0242
ALTER TABLE PROFESSOR_24MCA0242 DISABLE CONSTRAINT FK_PROF_DEPT;

-- Disable Foreign Key Constraints in ENROLL_24MCA0242
ALTER TABLE ENROLL_24MCA0242 DISABLE CONSTRAINT FK_ENROLL_STUDENT;
ALTER TABLE ENROLL_24MCA0242 DISABLE CONSTRAINT FK_ENROLL_CLASS;

-- Disable Foreign Key Constraints in DEPARTMENT_24MCA0242
ALTER TABLE DEPARTMENT_24MCA0242 DISABLE CONSTRAINT FK_DEPT_PROF;
ALTER TABLE DEPARTMENT_24MCA0242 DISABLE CONSTRAINT FK_DEPT_SCHOOL;

-- Disable Foreign Key Constraints in CLASS_24MCA0242
ALTER TABLE CLASS_24MCA0242 DISABLE CONSTRAINT FK_CLASS_SEM;
ALTER TABLE CLASS_24MCA0242 DISABLE CONSTRAINT FK_CLASS_PROF;
ALTER TABLE CLASS_24MCA0242 DISABLE CONSTRAINT FK_CLASS_COURSE;

-- Disable Foreign Key Constraint in STUDENT_VISA_24MCA0242
ALTER TABLE STUDENT_VISA_24MCA0242 DISABLE CONSTRAINT FK_STUDENT_VISA;


****************************************************************
******************************************************************
*******************************************************************

5_5 SELECT Scl_name,Prof_name FROM SCHOOL_24MCA0242,PROFESSOR_24MCA0242 WHERE SCHOOL_24MCA0242.Prof_id=PROFESSOR_24MCA0242.Prof_id;

5_6
SELECT Crs_code AS Course_code, Crs_name AS Course_name, Description AS Course_description FROM COURSE_24MCA0242 ORDER BY Crs_code;

SELECT Crs_code, Crs_name, Description FROM COURSE_24MCA0242 ORDER BY Crs_code;

5_7
UPDATE STUDENT_24MCA0242 SET Mobile=&Mobile WHERE Reg_no='&Reg_no';

5_8
SELECT * FROM Enroll_24MCA0242;

DELETE FROM ENROLL_24MCA0242 WHERE Cls_code = '&Cls_code' AND Reg_no = '&Reg_no';

SELECT * FROM Enroll_24MCA0242;

ROLLBACK;

SELECT * FROM Enroll_24MCA0242;

5_9
CREATE TABLE COURSE_DUPLICATE AS SELECT * FROM COURSE_24MCA0242;

5_10
CREATE VIEW Student_Course_Professor_View AS
SELECT 
    s.Reg_no, 
    s.Sname, 
    c.Crs_code, 
    c.Crs_name, 
    p.Prof_name
FROM 
    STUDENT_24MCA0242 s
JOIN 
    ENROLL_24MCA0242 e ON s.Reg_no = e.Reg_no
JOIN 
    CLASS_24MCA0242 cl ON e.Cls_code = cl.Cls_code
JOIN 
    COURSE_24MCA0242 c ON cl.Crs_code = c.Crs_code
JOIN 
    PROFESSOR_24MCA0242 p ON cl.Prof_id = p.Prof_id;


CREATE VIEW Student_Course_Professor_View AS SELECT s.Reg_no, s.Sname, c.Crs_code, c.Crs_name, p.Prof_name FROM STUDENT_24MCA0242 s JOIN ENROLL_24MCA0242 e ON s.Reg_no = e.Reg_no JOIN CLASS_24MCA0242 cl ON e.Cls_code = cl.Cls_code JOIN COURSE_24MCA0242 c ON cl.Crs_code = c.Crs_code JOIN PROFESSOR_24MCA0242 p ON cl.Prof_id = p.Prof_id;

SELECT * FROM Student_Course_Professor_View;


5_11

SELECT Room_no, Slot, Stime, Etime, TO_CHAR(Etime - Stime, 'HH24:MI') AS Duration FROM CLASS_24MCA0242 WHERE Day_of_week = 'Wednesday' ORDER BY Room_no DESC;

SELECT Room_no, Slot, Stime, Etime, 
EXTRACT(HOUR FROM (Etime - Stime)) || ':' || 
EXTRACT(MINUTE FROM (Etime - Stime)) AS Duration
FROM CLASS_24MCA0242 WHERE Day_of_week = 'Wednesday' ORDER BY Room_no DESC;

5_12

SELECT s.Sname, e.Grade, c.Crs_name
FROM STUDENT_24MCA0242 s, ENROLL_24MCA0242 e, CLASS_24MCA0242 cl, COURSE_24MCA0242 c, SEMESTER_24MCA0242 sem
WHERE s.Reg_no = e.Reg_no
AND e.Cls_code = cl.Cls_code
AND cl.Crs_code = c.Crs_code
AND cl.Sem_code = sem.Sem_code
AND sem.Term = 'Fall2017-18'
AND sem.Year = 2017;


INSERT INTO SEMESTER_24MCA0242 (Sem_code, Term, Year, Sdate, Edate)
VALUES ('Fall2017-18', 'Fall', 2017, TO_DATE('2017-08-10', 'YYYY-MM-DD'), TO_DATE('2017-12-20', 'YYYY-MM-DD'));

**************5_12**********

-- Inserting Fall 2017-18 semesters
INSERT INTO SEMESTER_24MCA0242 (Sem_code, Term, Year, Sdate, Edate)
VALUES ('Fall2017_1', 'Fall', 2017, TO_DATE('2017-08-10', 'YYYY-MM-DD'), TO_DATE('2017-12-20', 'YYYY-MM-DD'));

INSERT INTO SEMESTER_24MCA0242 (Sem_code, Term, Year, Sdate, Edate)
VALUES ('Fall2017_2', 'Fall', 2017, TO_DATE('2017-08-15', 'YYYY-MM-DD'), TO_DATE('2017-12-25', 'YYYY-MM-DD'));

INSERT INTO SEMESTER_24MCA0242 (Sem_code, Term, Year, Sdate, Edate)
VALUES ('Fall2017_3', 'Fall', 2017, TO_DATE('2017-09-01', 'YYYY-MM-DD'), TO_DATE('2017-12-31', 'YYYY-MM-DD'));

-- Insert new class records for Fall 2017-18
INSERT INTO CLASS_24MCA0242 (Cls_code, Slot, Stime, Etime, Crs_code, Prof_id, Room_no, Sem_code, Day_of_week)
VALUES ('CLS06', 'F1', TO_DATE('2017-08-16 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2017-08-16 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'CRS01', 'P0001', 'SJT202', 'Fall2017-18', 'Wednesday');

INSERT INTO CLASS_24MCA0242 (Cls_code, Slot, Stime, Etime, Crs_code, Prof_id, Room_no, Sem_code, Day_of_week)
VALUES ('CLS07', 'G1', TO_DATE('2017-08-17 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2017-08-17 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'CRS02', 'P0002', 'SMV103', 'Fall2017-18', 'Thursday');

INSERT INTO CLASS_24MCA0242 (Cls_code, Slot, Stime, Etime, Crs_code, Prof_id, Room_no, Sem_code, Day_of_week)
VALUES ('CLS08', 'H1', TO_DATE('2017-08-18 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2017-08-18 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'CRS03', 'P0003', 'TT106', 'Fall2017-18', 'Friday');

-- Insert enrollment records for the new classes
INSERT INTO ENROLL_24MCA0242 (Cls_code, Reg_no, Enroll_time, Grade)
VALUES ('CLS06', 'R0001', TO_TIMESTAMP('2017-08-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'A');

INSERT INTO ENROLL_24MCA0242 (Cls_code, Reg_no, Enroll_time, Grade)
VALUES ('CLS07', 'R0002', TO_TIMESTAMP('2017-08-11 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'B');

INSERT INTO ENROLL_24MCA0242 (Cls_code, Reg_no, Enroll_time, Grade)
VALUES ('CLS08', 'R0003', TO_TIMESTAMP('2017-08-12 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'C');


-- Query to display student names, grades, and course names for Fall 2017-18
SELECT s.Sname, e.Grade, c.Crs_name FROM STUDENT_24MCA0242 s
JOIN ENROLL_24MCA0242 e ON s.Reg_no = e.Reg_no
JOIN CLASS_24MCA0242 cl ON e.Cls_code = cl.Cls_code
JOIN COURSE_24MCA0242 c ON cl.Crs_code = c.Crs_code
JOIN SEMESTER_24MCA0242 sem ON cl.Sem_code = sem.Sem_code
WHERE sem.Sem_code = 'Fall2017-18';

***************************************************************
*********************************************
5_13

INSERT INTO COURSE_24MCA0242 (Crs_code, Crs_name, Description, Credits, Hours) VALUES ('CRS06', 'Database Systems', 'Database Management Systems', 4, 40),('CRS07', 'Operating Systems', 'Study of Operating Systems', 3, 33);

INSERT INTO CLASS_24MCA0242 (Cls_code, Slot, Stime, Etime, Crs_code, Prof_id, Room_no, Sem_code, Day_of_week)
VALUES
  ('CLS06', 'A1', TIMESTAMP '2016-08-02 09:00:00', TIMESTAMP '2016-08-02 10:30:00', 'CRS06', 'P0001', 'Room101', 'Fall2016', 'Tuesday'),
  ('CLS07', 'B1', TIMESTAMP '2016-08-03 11:00:00', TIMESTAMP '2016-08-03 12:30:00', 'CRS07', 'P0002', 'Room102', 'Fall2016', 'Wednesday');

  INSERT INTO ENROLL_24MCA0242 (Cls_code, Reg_no, Enroll_time, Grade)
VALUES
  ('CLS06', 'R0001', TO_TIMESTAMP('2016-08-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'A'),
  ('CLS07', 'R0001', TO_TIMESTAMP('2016-08-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'B');



--
INSERT INTO SEMESTER_24MCA0242 (Sem_code, Term, Year, Sdate, Edate)
VALUES ('Fall2016', 'Fall', 2016, TO_DATE('2016-08-01', 'YYYY-MM-DD'), TO_DATE('2016-12-31', 'YYYY-MM-DD'));



SELECT s.Sname
FROM STUDENT_24MCA0242 s
JOIN ENROLL_24MCA0242 e ON s.Reg_no = e.Reg_no
JOIN CLASS_24MCA0242 c ON e.Cls_code = c.Cls_code
JOIN COURSE_24MCA0242 cr ON c.Crs_code = cr.Crs_code
JOIN SEMESTER_24MCA0242 sem ON c.Sem_code = sem.Sem_code
WHERE sem.Term = 'Fall'
  AND sem.Year = 2016
  AND cr.Crs_name IN ('Database Systems', 'Operating Systems')
GROUP BY s.Sname;


SELECT * FROM PROFESSOR_24MCA0242;
SELECT * FROM SCHOOL_24MCA0242;
SELECT * FROM DEPARTMENT_24MCA0242;
SELECT * FROM COURSE_24MCA0242;
SELECT * FROM CLASS_24MCA0242;
SELECT * FROM SEMESTER_24MCA0242;
SELECT * FROM STUDENT_24MCA0242;
SELECT * FROM ENROLL_24MCA0242;
SELECT * FROM STUDENT_VISA_24MCA0242;
SELECT * FROM PROGRAMME_24MCA0242;


////////////////////////////////////////////////
///////////////////////////////////////////////////

INSERT INTO COURSE_24MCA0242 (Crs_code, Crs_name, Description, Credits, Hours) VALUES ('CRS06', 'Database Systems', 'Introduction to Database Systems', 5, 50);
INSERT INTO COURSE_24MCA0242 (Crs_code, Crs_name, Description, Credits, Hours) VALUES ('CRS07', 'Operating Systems', 'Advanced Study of Operating Systems', 4, 40);

-- Add new students
INSERT INTO STUDENT_24MCA0242 (Reg_no, Sname, Address, DoB, Email, Mobile, Dept_id, Prof_id) VALUES ('R0006', 'Rajesh Kumar', 'Mumbai', TO_DATE('1998-05-10', 'YYYY-MM-DD'), 'rajesh.kumar@student.edu', '9876543220', 'D0001', 'P0001');
-- Add new students
INSERT INTO STUDENT_24MCA0242 (Reg_no, Sname, Address, DoB, Email, Mobile, Dept_id, Prof_id) VALUES ('R0007', 'Priya Patel', 'Delhi', TO_DATE('1999-09-10', 'YYYY-MM-DD'), 'priya.patel@student.edu', '9876543221', 'D0002', 'P0002');

-- Update existing student records if necessary
UPDATE STUDENT_24MCA0242 SET DoB = TO_DATE('1997-10-10', 'YYYY-MM-DD') WHERE Reg_no = 'R0001';




-- Enroll students in courses
INSERT INTO ENROLL_24MCA0242 (Cls_code, Reg_no, Enroll_time, Grade) VALUES ('CLS06', 'R0006', TO_TIMESTAMP('2017-11-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'A');
INSERT INTO ENROLL_24MCA0242 (Cls_code, Reg_no, Enroll_time, Grade) VALUES ('CLS07', 'R0007', TO_TIMESTAMP('2017-11-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'B');

-- Register students in Winter 17-18
INSERT INTO SEMESTER_24MCA0242 (Sem_code, Term, Year, Sdate, Edate) VALUES ('Win1718', 'Winter', 2017, TO_DATE('2017-01-10', 'YYYY-MM-DD'), TO_DATE('2018-05-15', 'YYYY-MM-DD'));

-- Update classes to include new semester data
INSERT INTO CLASS_24MCA0242 (Cls_code, Slot, Stime, Etime, Crs_code, Prof_id, Room_no, Sem_code, Day_of_week) VALUES ('CLS06', 'F1', TIMESTAMP '2017-01-20 09:00:00', TIMESTAMP '2017-01-20 10:30:00', 'CRS06', 'P0001', 'SJT201', 'Win1718', 'Monday');
INSERT INTO CLASS_24MCA0242 (Cls_code, Slot, Stime, Etime, Crs_code, Prof_id, Room_no, Sem_code, Day_of_week) VALUES ('CLS07', 'F2', TIMESTAMP '2017-01-21 11:00:00', TIMESTAMP '2017-01-21 12:30:00', 'CRS07', 'P0002', 'SJT202', 'Win1718', 'Tuesday');



DATA CORRECTED----------------------------------------------------------------------------------------

5_13
Schema is: 
PROFESSOR_24MCA0242(Prof_id, Prof_name, Email, Mobile, Specialty, Dept_id)  
SCHOOL_24MCA0242(SCode, Scl_name, Prof_id, Location) 
DEPARTMENT_24MCA0242(Dept_id, Dname, SCode, Prof_id) 
COURSE_24MCA0242(Crs_code, Crs_name, Description, Credits, Hours)    
CLASS_24MCA0242(Cls_code, Slot, Stime, Etime, Crs_code, Prof_id, Room_no, Sem_code, Day_of_week) 
SEMESTER_24MCA0242(Sem_code, Term, Year, Sdate, Edate)  
STUDENT_24MCA0242(Reg_no, Sname, Address, DoB, Email, Mobile, Dept_id, Prof_id) 
ENROLL_24MCA0242(Cls_code, Reg_no, Enroll_time, Grade) 
STUDENT_VISA_24MCA0242(Reg_no, Visa_status) 
PROGRAMME_24MCA0242(Prog_code, Prog_name, Prog_preamble, Scode, Dept_id) 


INSERT INTO CLASS_24MCA0242 (Cls_code, Slot, Stime, Etime, Crs_code, Prof_id, Room_no, Sem_code, Day_of_week) 
VALUES ('CLS11', 'A1', TIMESTAMP '2018-01-20 09:00:00', TIMESTAMP '2018-01-20 10:30:00', 'CRS03', 'P0001', 'SJT201', 'Win2017-18', 'Monday');

INSERT INTO CLASS_24MCA0242 (Cls_code, Slot, Stime, Etime, Crs_code, Prof_id, Room_no, Sem_code, Day_of_week) 
VALUES ('CLS12', 'B1', TIMESTAMP '2018-01-21 11:00:00', TIMESTAMP '2018-01-21 12:30:00', 'CRS02', 'P0002', 'SMV102', 'Win2017-18', 'Tuesday');



INSERT INTO ENROLL_24MCA0242 (Cls_code, Reg_no, Enroll_time, Grade) 
VALUES ('CLS21', 'R0001', TO_TIMESTAMP('2018-01-05 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'A');

INSERT INTO ENROLL_24MCA0242 (Cls_code, Reg_no, Enroll_time, Grade) 
VALUES ('CLS22', 'R0002', TO_TIMESTAMP('2018-01-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'B');

SELECT s.SNAME FROM STUDENT_24MCA0242 s
JOIN ENROLL_24MCA0242 e ON s.REG_No = e.REG_No
JOIN CLASS_24MCA0242 c ON e.CLS_Code = c.CLS_Code
JOIN COURSE_24MCA0242 cr ON c.CRS_Code = cr.CRS_Code
WHERE c.SEM_CODE = 'Win2017-18' AND cr.CRS_NAME = 'Database Systems' AND s.REG_No NOT IN (
    SELECT e.REG_No FROM ENROLL_24MCA0242 e
    JOIN CLASS_24MCA0242 c ON e.CLS_Code = c.CLS_Code
    JOIN COURSE_24MCA0242 cr ON c.CRS_Code = cr.CRS_Code
    WHERE c.SEM_CODE = 'Win2017-18' AND cr.CRS_NAME = 'Operating Systems');

------------------------------------
5_15

-- Calculate total credits per student
WITH StudentCredits AS (
    SELECT s.REG_No, s.SNAME, SUM(cr.Credits) AS TotalCredits FROM STUDENT_24MCA0242 s
    JOIN ENROLL_24MCA0242 e ON s.REG_No = e.REG_No
    JOIN CLASS_24MCA0242 c ON e.CLS_Code = c.CLS_Code
    JOIN COURSE_24MCA0242 cr ON c.CRS_Code = cr.CRS_Code
    WHERE c.SEM_CODE = 'Win2017-18' GROUP BY s.REG_No, s.SNAME), MaxCredits AS (SELECT MAX(TotalCredits) AS MaxTotalCredits FROM StudentCredits) SELECT REG_No, SNAME
FROM StudentCredits WHERE TotalCredits = (SELECT MaxTotalCredits FROM MaxCredits);


5_16
SELECT cr.Crs_name AS CourseName, c.Slot AS Slot, p.Prof_name AS FacultyName, COUNT(e.Reg_no) AS NumberOfStudents FROM COURSE_24MCA0242 cr
JOIN CLASS_24MCA0242 c ON cr.Crs_code = c.Crs_code
JOIN ENROLL_24MCA0242 e ON c.Cls_code = e.Cls_code
JOIN PROFESSOR_24MCA0242 p ON c.Prof_id = p.Prof_id 
GROUP BY cr.Crs_name, c.Slot, p.Prof_name ORDER BY cr.Crs_name, c.Slot, p.Prof_name;

5_17
WITH ProfCourses AS (
    SELECT c.Crs_code FROM CLASS_24MCA0242 c
    JOIN PROFESSOR_24MCA0242 p ON c.Prof_id = p.Prof_id
    WHERE p.Prof_name = 'Prof. O''Brien' AND c.SEM_CODE = 'Win2017-18'
)
SELECT s.Sname FROM STUDENT_24MCA0242 s
JOIN ENROLL_24MCA0242 e ON s.REG_No = e.REG_No
JOIN CLASS_24MCA0242 c ON e.CLS_Code = c.CLS_Code
WHERE c.Crs_code IN (SELECT Crs_code FROM ProfCourses) GROUP BY s.Sname HAVING COUNT(DISTINCT c.Crs_code) = (SELECT COUNT(*) FROM ProfCourses);


5_18
-- Update the enrollment timestamp for students in the Database Management course (CRS03)
UPDATE ENROLL_24MCA0242
SET ENROLL_TIME = TO_TIMESTAMP('2017-11-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
WHERE Cls_code = 'CLS03';


SELECT e.Reg_no, s.Sname, cr.Crs_name FROM ENROLL_24MCA0242 e
JOIN CLASS_24MCA0242 c ON e.CLS_Code = c.CLS_Code
JOIN COURSE_24MCA0242 cr ON c.CRS_Code = cr.CRS_Code
JOIN STUDENT_24MCA0242 s ON e.Reg_no = s.Reg_no
WHERE cr.Crs_name = 'Database Systems' AND TRUNC(e.Enroll_time) = TO_DATE('2017-11-17', 'YYYY-MM-DD');


5_19

SELECT e.Reg_no, s.Sname, cr.Crs_name, e.Grade FROM ENROLL_24MCA0242 e
JOIN CLASS_24MCA0242 c ON e.Cls_code = c.Cls_code
JOIN COURSE_24MCA0242 cr ON c.Crs_code = cr.Crs_code
JOIN STUDENT_24MCA0242 s ON e.Reg_no = s.Reg_no
JOIN SEMESTER_24MCA0242 sem ON c.Sem_code = sem.Sem_code
WHERE s.Reg_no = 'R0005' AND cr.Crs_name = 'Artificial Intelligence' AND sem.Sem_code = 'Fall2024-25'; 

5_20
SELECT d.Dname AS Department_Name, p.Prof_name AS Professor_Name FROM DEPARTMENT_24MCA0242 d
JOIN PROFESSOR_24MCA0242 p ON d.Prof_id = p.Prof_id;

5_21
SELECT s.Scl_name AS School_Name FROM SCHOOL_24MCA0242 s
JOIN STUDENT_24MCA0242 st ON s.Prof_id = st.Prof_id
GROUP BY s.Scl_name HAVING COUNT(st.Reg_no) > 7000;

5_22

INSERT INTO DEPARTMENT_24MCA0242 (Dept_id, Dname, SCode, Prof_id)
VALUES ('D0008', 'Department of Surgery', 'S0006', 'P0006');
INSERT INTO DEPARTMENT_24MCA0242 (Dept_id, Dname, SCode, Prof_id)
VALUES ('D0009', 'Department of Medicine', 'S0006', 'P0006');


STUDENT_24MCA0242(Reg_no, Sname, Address, DoB, Email, Mobile, Dept_id, Prof_id) 

INSERT INTO STUDENT_24MCA0242 (Reg_no, Sname, Address, DoB, Email, Mobile, Dept_id, Prof_id)
VALUES ('R0014', 'Alice Smith', 'New Delhi', TO_DATE('1998-06-15', 'YYYY-MM-DD'), 'alice.smith@student.edu', '9876543230', 'D0008', 'P0006');
INSERT INTO STUDENT_24MCA0242 (Reg_no, Sname, Address, DoB, Email, Mobile, Dept_id, Prof_id)
VALUES ('R0015', 'Bob Johnson', 'New Delhi', TO_DATE('1999-08-20', 'YYYY-MM-DD'), 'bob.johnson@student.edu', '9876543231', 'D0008', 'P0006');
INSERT INTO STUDENT_24MCA0242 (Reg_no, Sname, Address, DoB, Email, Mobile, Dept_id, Prof_id)
VALUES ('R0016', 'Charlie Davis', 'New Delhi', TO_DATE('2000-04-25', 'YYYY-MM-DD'), 'charlie.davis@student.edu', '9876543232', 'D0009', 'P0006');
INSERT INTO STUDENT_24MCA0242 (Reg_no, Sname, Address, DoB, Email, Mobile, Dept_id, Prof_id)
VALUES ('R0017', 'Dana Evans', 'New Delhi', TO_DATE('1997-12-10', 'YYYY-MM-DD'), 'dana.evans@student.edu', '9876543233', 'D0009', 'P0006');



-- Calculate the average student count for departments under the School of Medicine
WITH Avg_Student_Count AS (
    SELECT AVG(Student_Count) AS Avg_Count
    FROM (
        SELECT d.Dept_id, COUNT(st.Reg_no) AS Student_Count
        FROM DEPARTMENT_24MCA0242 d
        JOIN SCHOOL_24MCA0242 s ON d.SCode = s.SCode
        JOIN STUDENT_24MCA0242 st ON d.Dept_id = st.Dept_id
        WHERE s.Scl_name = 'School of Medicine'
        GROUP BY d.Dept_id
    )
),
Departments_Above_Avg AS (
    SELECT d.Dname AS Dept_Name, COUNT(st.Reg_no) AS Dept_Student_Count
    FROM DEPARTMENT_24MCA0242 d
    JOIN SCHOOL_24MCA0242 s ON d.SCode = s.SCode
    JOIN STUDENT_24MCA0242 st ON d.Dept_id = st.Dept_id
    WHERE s.Scl_name = 'School of Medicine'
    GROUP BY d.Dept_id, d.Dname
    HAVING COUNT(st.Reg_no) > (SELECT Avg_Count FROM Avg_Student_Count)
)
SELECT Dept_Name
FROM Departments_Above_Avg;


-- Check departments under the School of Medicine
SELECT *
FROM DEPARTMENT_24MCA0242 d
JOIN SCHOOL_24MCA0242 s ON d.SCode = s.SCode
WHERE s.Scl_name = 'School of Medicine';

SELECT *
FROM STUDENT_24MCA0242 st
JOIN DEPARTMENT_24MCA0242 d ON st.Dept_id = d.Dept_id
JOIN SCHOOL_24MCA0242 s ON d.SCode = s.SCode
WHERE s.Scl_name = 'School of Medicine';

-------------------------------------------------

SELECT d.Dname FROM DEPARTMENT_24MCA0242 d
JOIN SCHOOL_24MCA0242 sc ON d.SCode = sc.SCode
JOIN STUDENT_24MCA0242 s ON d.Dept_id = s.Dept_id
WHERE sc.Scl_name = 'School of Medicine' GROUP BY d.Dname HAVING COUNT(s.Reg_no) > (SELECT AVG(Student_Count) FROM ( SELECT d.Dept_id, COUNT(s.Reg_no) AS Student_Count FROM DEPARTMENT_24MCA0242 d JOIN SCHOOL_24MCA0242 sc ON d.SCode = sc.SCode JOIN STUDENT_24MCA0242 s ON d.Dept_id = s.Dept_id WHERE sc.Scl_name = 'School of Medicine' GROUP BY d.Dept_id));


5_23
SELECT e.Reg_no, SUM(cr.Credits) AS Total_Credits FROM ENROLL_24MCA0242 e
JOIN CLASS_24MCA0242 c ON e.Cls_code = c.Cls_code
JOIN COURSE_24MCA0242 cr ON c.Crs_code = cr.Crs_code
JOIN SEMESTER_24MCA0242 s ON c.Sem_code = s.Sem_code
WHERE e.Reg_no = 'R0001' AND s.Term = 'Winter' AND s.Year = 2017 GROUP BY e.Reg_no;

5_24
SELECT e.Reg_no, c.Crs_code, cr.Crs_name, e.Grade
FROM ENROLL_24MCA0242 e
JOIN CLASS_24MCA0242 c ON e.Cls_code = c.Cls_code
JOIN COURSE_24MCA0242 cr ON c.Crs_code = cr.Crs_code
JOIN SEMESTER_24MCA0242 s ON c.Sem_code = s.Sem_code
WHERE e.Reg_no = 'R0006'
  AND s.Term = 'Fall2017-18'
  AND s.Year = 2017; 



SELECT s.Reg_no, s.Sname, s.Address, s.DoB, s.Email, s.Mobile
FROM ENROLL_24MCA0242 e
JOIN CLASS_24MCA0242 c ON e.Cls_code = c.Cls_code
JOIN SEMESTER_24MCA0242 s ON c.Sem_code = s.Sem_code
JOIN STUDENT_24MCA0242 s ON e.Reg_no = s.Reg_no
WHERE s.Term = 'Fall2017-18'
  AND s.Year = 2017;

SELECT e.Reg_no, c.Crs_code, e.Grade
FROM ENROLL_24MCA0242 e
JOIN CLASS_24MCA0242 c ON e.Cls_code = c.Cls_code
JOIN SEMESTER_24MCA0242 s ON c.Sem_code = s.Sem_code
WHERE s.Sem_code = 'Fall2017-18';


SELECT e.Reg_no,
       e.Grade,
       c.Crs_code,
       s.Term AS Semester,
       s.Year AS Academic_Year
FROM ENROLL_24MCA0242 e
JOIN CLASS_24MCA0242 c ON e.Cls_code = c.Cls_code
JOIN SEMESTER_24MCA0242 s ON c.Sem_code = s.Sem_code
WHERE s.Term = 'Fall2017-18'
  AND s.Year = 2017
  AND e.Reg_no = 'R0001';

SELECT e.Reg_no, e.Grade, c.Crs_code, s.Term AS Semester, s.Year AS Academic_Year FROM ENROLL_24MCA0242 e 
JOIN CLASS_24MCA0242 c ON e.Cls_code = c.Cls_code
JOIN SEMESTER_24MCA0242 s ON c.Sem_code = s.Sem_code
WHERE s.Term = 'Fall' AND s.Year = 2017 AND e.Reg_no = 'R0003'; 

25
SELECT DISTINCT cr.Crs_name FROM COURSE_24MCA0242 cr
LEFT JOIN CLASS_24MCA0242 c ON cr.Crs_code = c.Crs_code
LEFT JOIN SEMESTER_24MCA0242 s ON c.Sem_code = s.Sem_code
WHERE s.Term IS NULL OR s.Term <> 'Winter' OR s.Year <> 2017;

26
UPDATE CLASS_24MCA0242 SET Stime = Stime + INTERVAL '10' MINUTE, Etime = Etime + INTERVAL '10' MINUTE WHERE Sem_code = (SELECT Sem_code FROM SEMESTER_24MCA0242 WHERE Term = 'Fall' AND Year = 2017);

-- Display the updated start and end dates for Fall 2024–2025 semester
SELECT Cls_code, Slot, Stime AS Updated_Start_Time, Etime AS Updated_End_Time, Crs_code, Prof_id, Room_no, Sem_code, Day_of_week FROM CLASS_24MCA0242 WHERE Sem_code = (SELECT Sem_code FROM SEMESTER_24MCA0242 WHERE Term = 'Fall' AND Year = 2017);


27
-- Update Fall 2024–2025 semester dates based on Fall 2023–2024 dates

UPDATE SEMESTER_24MCA0242 
SET Sdate = (SELECT Sdate + INTERVAL '7' DAY FROM SEMESTER_24MCA0242 WHERE Term = 'Fall' AND Year = 2023), 
Edate = (SELECT Edate + INTERVAL '7' DAY FROM SEMESTER_24MCA0242 WHERE Term = 'Fall' AND Year = 2023) 
WHERE Term = 'Fall' AND Year = 2024;

-- Display the updated start and end dates for Fall 2024–2025 semester
SELECT Sem_code, Term, Year, Sdate, Edate FROM SEMESTER_24MCA0242 WHERE Term = 'Fall' AND Year = 2024;

28
-- Insert new 'S' grades for R0001
INSERT INTO ENROLL_24MCA0242 (Cls_code, Reg_no, Enroll_time, Grade)
VALUES ('CLS11', 'R0001', TO_TIMESTAMP('2024-01-10 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'S');

INSERT INTO ENROLL_24MCA0242 (Cls_code, Reg_no, Enroll_time, Grade)
VALUES  ('CLS12', 'R0001', TO_TIMESTAMP('2024-01-12 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'S');
INSERT INTO ENROLL_24MCA0242 (Cls_code, Reg_no, Enroll_time, Grade)
VALUES ('CLS13', 'R0001', TO_TIMESTAMP('2024-01-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'S');

UPDATE ENROLL_24MCA0242
SET Grade = 'S'
WHERE Reg_no = 'R0001'
AND CLS_Code IN ('CLS16', 'CLS17'); 



UPDATE ENROLL_24MCA0242 e
SET e.Grade = 'S' WHERE e.CLS_Code IN (SELECT CLS_Code FROM (SELECT CLS_Code FROM ENROLL_24MCA0242 WHERE Reg_no = 'R0001' AND Grade <> 'S' ORDER BY Enroll_time) WHERE ROWNUM <= 3);

29

-- Replace 'R0001' with the student's registration number
SELECT DISTINCT c.Slot, c.Day_of_week
FROM CLASS_24MCA0242 c
LEFT JOIN ENROLL_24MCA0242 e 
    ON c.Cls_code = e.Cls_code
    AND e.Reg_no = 'R0001'
WHERE e.Cls_code IS NULL;

30
-- Replace 'Monday' with the specific day of the week
SELECT s.Sname FROM STUDENT_24MCA0242 s
JOIN ENROLL_24MCA0242 e ON s.Reg_no = e.Reg_no
JOIN CLASS_24MCA0242 c ON e.Cls_code = c.Cls_code
WHERE c.Day_of_week = 'Monday' AND c.Stime >= TO_TIMESTAMP('12:00:00', 'HH24:MI:SS')
GROUP BY s.Sname HAVING COUNT(DISTINCT c.Day_of_week) = 1
AND SUM(CASE WHEN c.Stime >= TO_TIMESTAMP('12:00:00', 'HH24:MI:SS') THEN 1 ELSE 0 END) = COUNT(c.Day_of_week);


31
ALTER TABLE CLASS_24MCA0242 ADD Duration INTERVAL DAY(0) TO SECOND(0);

UPDATE CLASS_24MCA0242 SET Duration = Etime - Stime;

SELECT Cls_code, Slot, Stime, Etime, Duration FROM CLASS_24MCA0242;

32

ALTER TABLE SEMESTER_24MCA0242 ADD SemesterDuration NUMBER;
UPDATE SEMESTER_24MCA0242 SET SemesterDuration = Edate - Sdate;
SELECT Sem_code, Term, Year, Sdate, Edate, SemesterDuration FROM SEMESTER_24MCA0242;

33
SELECT s.Reg_no, s.Sname, p.Prog_name FROM STUDENT_24MCA0242 s
JOIN PROGRAMME_24MCA0242 p ON s.Dept_id = p.Dept_id WHERE p.Prog_name = 'MCA';

34
SELECT p.Prog_name, s.Scl_name FROM PROGRAMME_24MCA0242 p
JOIN DEPARTMENT_24MCA0242 d ON p.Dept_id = d.Dept_id
JOIN SCHOOL_24MCA0242 s ON d.SCode = s.SCode;

35
SELECT d.Dname AS Department_Name, p.Prog_name AS Program_Name FROM DEPARTMENT_24MCA0242 d JOIN PROGRAMME_24MCA0242 p ON d.Dept_id = p.Dept_id;


36
SELECT Scl_name
FROM (
    SELECT s.Scl_name, COUNT(st.Reg_no) AS student_count
    FROM SCHOOL_24MCA0242 s
    JOIN DEPARTMENT_24MCA0242 d ON s.SCode = d.SCode
    JOIN STUDENT_24MCA0242 st ON d.Dept_id = st.Dept_id
    GROUP BY s.Scl_name
    ORDER BY student_count DESC)
WHERE ROWNUM = 1;




15
WITH StudentCredits AS (
    SELECT s.REG_No, s.SNAME, SUM(cr.Credits) AS TotalCredits
    FROM STUDENT_24MCA0242 s
    JOIN ENROLL_24MCA0242 e ON s.REG_No = e.REG_No
    JOIN CLASS_24MCA0242 c ON e.CLS_Code = c.CLS_Code
    JOIN COURSE_24MCA0242 cr ON c.CRS_Code = cr.CRS_Code
    WHERE c.SEM_CODE = 'Win2017-18'
    GROUP BY s.REG_No, s.SNAME
),
MaxCredits AS (
    SELECT MAX(TotalCredits) AS MaxTotalCredits
    FROM StudentCredits
)
SELECT sc.REG_No, sc.SNAME, sc.TotalCredits
FROM StudentCredits sc
JOIN MaxCredits mc ON sc.TotalCredits = mc.MaxTotalCredits;


--
SELECT s.REG_No, s.SNAME, SUM(cr.Credits) AS TotalCredits
FROM STUDENT_24MCA0242 s
JOIN ENROLL_24MCA0242 e ON s.REG_No = e.REG_No
JOIN CLASS_24MCA0242 c ON e.CLS_Code = c.CLS_Code
JOIN COURSE_24MCA0242 cr ON c.CRS_Code = cr.CRS_Code
WHERE c.SEM_CODE = 'Win2017-18'
GROUP BY s.REG_No, s.SNAME
HAVING SUM(cr.Credits) = (
    SELECT MAX(TotalCredits)
    FROM (
        SELECT SUM(cr.Credits) AS TotalCredits
        FROM STUDENT_24MCA0242 s
        JOIN ENROLL_24MCA0242 e ON s.REG_No = e.REG_No
        JOIN CLASS_24MCA0242 c ON e.CLS_Code = c.CLS_Code
        JOIN COURSE_24MCA0242 cr ON c.CRS_Code = cr.CRS_Code
        WHERE c.SEM_CODE = 'Win2017-18'
        GROUP BY s.REG_No
    )
);


UPDATE PROFESSOR_24MCA0242
SET PROF_NAME = 'Prof. O Brien'
WHERE PROF_NAME = 'Prof. O"Brien';

SELECT s.SNAME
FROM STUDENT_24MCA0242 s
JOIN ENROLL_24MCA0242 e ON s.REG_No = e.REG_No
JOIN CLASS_24MCA0242 c ON e.CLS_Code = c.CLS_Code
JOIN PROFESSOR_24MCA0242 p ON c.Prof_id = p.Prof_id
WHERE p.Prof_name = 'Prof. O Brien'
  AND c.SEM_CODE = 'Win2017-18'
GROUP BY s.SNAME
HAVING COUNT(DISTINCT c.CRS_Code) = (
    SELECT COUNT(DISTINCT c.CRS_Code)
    FROM CLASS_24MCA0242 c
    JOIN PROFESSOR_24MCA0242 p ON c.Prof_id = p.Prof_id
    WHERE p.Prof_name = 'Prof. O Brien'
      AND c.SEM_CODE = 'Win2017-18'
);


22

INSERT INTO STUDENT_24MCA0242 (Reg_no, Sname, Address, DOB, Email, Mobile, Dept_id, Prof_id) VALUES ('R0018', 'Sushant Verma', 'Kolkata, India', TO_DATE('2001-03-14', 'YYYY-MM-DD'), 'sushant.verma@student.edu', '9876543234', 'D0008', 'P0006');
INSERT INTO STUDENT_24MCA0242 (Reg_no, Sname, Address, DOB, Email, Mobile, Dept_id, Prof_id) VALUES ('R0019', 'Rina Sethi', 'Kolkata, India', TO_DATE('2000-11-29', 'YYYY-MM-DD'), 'rina.sethi@student.edu', '9876543235', 'D0008', 'P0006');
INSERT INTO STUDENT_24MCA0242 (Reg_no, Sname, Address, DOB, Email, Mobile, Dept_id, Prof_id) VALUES ('R0020', 'Vikram Patel', 'Kolkata, India', TO_DATE('1999-07-20', 'YYYY-MM-DD'), 'vikram.patel@student.edu', '9876543236', 'D0009', 'P0006');
INSERT INTO STUDENT_24MCA0242 (Reg_no, Sname, Address, DOB, Email, Mobile, Dept_id, Prof_id) VALUES ('R0021', 'Ankita Sharma', 'Kolkata, India', TO_DATE('1998-09-15', 'YYYY-MM-DD'), 'ankita.sharma@student.edu', '9876543237', 'D0009', 'P0006');

UPDATE DEPARTMENT_24MCA0242
SET Dname = 'Department of Internal Meds'
WHERE Dname = 'Department of Medicine'
  AND SCode = (SELECT SCode FROM SCHOOL_24MCA0242 WHERE Scl_name = 'School of Medicine');

