SET SERVEROUTPUT ON;

--------------1)------------
DECLARE
    v_reg_no STUDENT_24MCA0242.Reg_no%TYPE;
    v_sname STUDENT_24MCA0242.Sname%TYPE;
    v_address STUDENT_24MCA0242.Address%TYPE;
    v_dob STUDENT_24MCA0242.DoB%TYPE;
    v_email STUDENT_24MCA0242.Email%TYPE;
    v_mobile STUDENT_24MCA0242.Mobile%TYPE;
BEGIN
    v_reg_no := '&Enter_Student_Reg_No';
    SELECT Sname, Address, DoB, Email, Mobile
    INTO v_sname, v_address, v_dob, v_email, v_mobile
    FROM STUDENT_24MCA0242 WHERE Reg_no = v_reg_no;

    DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_sname);
    DBMS_OUTPUT.PUT_LINE('Address: ' || v_address);
    DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || v_dob);
    DBMS_OUTPUT.PUT_LINE('Email: ' || v_email);
    DBMS_OUTPUT.PUT_LINE('Mobile: ' || v_mobile);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No student found with Reg_no: ' || v_reg_no);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/


--------------2)------------
DECLARE
    v_prof_id PROFESSOR_24MCA0242.Prof_id%TYPE;
    v_new_mobile PROFESSOR_24MCA0242.Mobile%TYPE;
BEGIN
    v_prof_id := '&Enter_Professor_ID';
    v_new_mobile := '&Enter_New_Mobile_Number';
    UPDATE PROFESSOR_24MCA0242
    SET Mobile = v_new_mobile
    WHERE Prof_id = v_prof_id;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No professor found with Prof_id: ' || v_prof_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Mobile number updated successfully for Prof_id: ' || v_prof_id);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/



--------------3)-------------
DECLARE
    v_grade ENROLL_24MCA0242.Grade%TYPE;
BEGIN
    SELECT Grade 
    INTO v_grade
    FROM ENROLL_24MCA0242
    WHERE Reg_no = '&Enter_Student_Reg_No'
    AND Cls_code = '&Enter_Class_Code';

    CASE v_grade
        WHEN 'S' THEN
            DBMS_OUTPUT.PUT_LINE('Grade is S: Excellent'); 
        WHEN 'A' THEN
            DBMS_OUTPUT.PUT_LINE('Grade is A: Very Good');
        WHEN 'B' THEN
            DBMS_OUTPUT.PUT_LINE('Grade is B: Good');
        WHEN 'C' THEN
            DBMS_OUTPUT.PUT_LINE('Grade is C: Fair');
        WHEN 'D' THEN
            DBMS_OUTPUT.PUT_LINE('Grade is D: Needs Improvement');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Invalid Grade');
    END CASE;
END;
/


---------------------4)-------------
DECLARE
    v_reg_no ENROLL_24MCA0242.Reg_no%TYPE;
    v_s_grade_count NUMBER;
BEGIN
    v_reg_no := '&Enter_Student_Reg_No';
    SELECT COUNT(*)
    INTO v_s_grade_count
    FROM ENROLL_24MCA0242
    WHERE Reg_no = v_reg_no AND Grade = 'S';
    DBMS_OUTPUT.PUT_LINE('Number of ''S'' Grades: ' || v_s_grade_count);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No grades found for Reg_no: ' || v_reg_no);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/


-----------5)-----------------
-----EXPLICIT CURSOR-----------
DECLARE
    CURSOR first_sem_students IS
        SELECT s.Reg_no, s.Sname
        FROM STUDENT_24MCA0242 s
        JOIN ENROLL_24MCA0242 e ON s.Reg_no = e.Reg_no
        JOIN CLASS_24MCA0242 c ON e.Cls_code = c.Cls_code
        JOIN SEMESTER_24MCA0242 sem ON c.Sem_code = sem.Sem_code
        WHERE sem.Sem_code = 'Fall2024-25'
          AND sem.Term = 'Fall'
          AND sem.Year = 2024;
    
    v_reg_no STUDENT_24MCA0242.Reg_no%TYPE;
    v_sname STUDENT_24MCA0242.Sname%TYPE;
BEGIN

    OPEN first_sem_students;
    DBMS_OUTPUT.PUT_LINE('Students in First Semester:');

    LOOP
        FETCH first_sem_students INTO v_reg_no, v_sname;
        EXIT WHEN first_sem_students%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Reg_no: ' || v_reg_no || ', Name: ' || v_sname);
    END LOOP;
    
    CLOSE first_sem_students;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

---OR------IMPLICIT CURSOR-----------------
BEGIN
    -- Output student details directly using a SELECT statement with DBMS_OUTPUT
    FOR rec IN (SELECT s.Reg_no, s.Sname
                FROM STUDENT_24MCA0242 s
                JOIN ENROLL_24MCA0242 e ON s.Reg_no = e.Reg_no
                JOIN CLASS_24MCA0242 c ON e.Cls_code = c.Cls_code
                JOIN SEMESTER_24MCA0242 sem ON c.Sem_code = sem.Sem_code
                WHERE sem.Term = 'Fall'
                AND sem.Year = 2024) 
    LOOP
        DBMS_OUTPUT.PUT_LINE('Reg_no: ' || rec.Reg_no || ', Name: ' || rec.Sname);
    END LOOP;
END;
/


-----------6)-----------------

UPDATE CLASS_24MCA0242 SET Prof_id='P0005', sem_code='Win2024-25' WHERE CLS_CODE='CLS21';

DECLARE
    v_prof_id PROFESSOR_24MCA0242.Prof_id%TYPE := '&Enter_Prof_id';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Courses handled by Professor ' || v_prof_id || ' in First Semester (Fall 2024-25):');
    FOR rec IN (
        SELECT c.Crs_name
        FROM CLASS_24MCA0242 cl
        JOIN COURSE_24MCA0242 c ON cl.Crs_code = c.Crs_code
        JOIN SEMESTER_24MCA0242 s ON cl.Sem_code = s.Sem_code
        WHERE cl.Prof_id = v_prof_id
        AND s.Term = 'Fall'
        AND s.Year = 2024
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('- ' || rec.Crs_name);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Courses handled by Professor ' || v_prof_id || ' in Second Semester (Winter 2024-25):');
    FOR rec IN (
        SELECT c.Crs_name
        FROM CLASS_24MCA0242 cl
        JOIN COURSE_24MCA0242 c ON cl.Crs_code = c.Crs_code
        JOIN SEMESTER_24MCA0242 s ON cl.Sem_code = s.Sem_code
        WHERE cl.Prof_id = v_prof_id
        AND s.Term = 'Winter'
        AND s.Year = 2024
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('- ' || rec.Crs_name);
    END LOOP;
END;
/

------TEST P0005


CREATE TABLE ENROLL AS SELECT * FROM ENROLL_24MCA0242;
CREATE TABLE SEMESTER AS SELECT * FROM SEMESTER_24MCA0242;
CREATE TABLE CLASS AS SELECT * FROM CLASS_24MCA0242;

RENAME ENROLL_24MCA0242 TO ENROLL;
RENAME SEMESTER_24MCA0242 TO SEMESTER;
RENAME CLASS_24MCA0242 TO CLASS;

RENAME DEPARTMENT_24MCA0242 TO DEPARTMENT;
RENAME SCHOOL_24MCA0242 TO SCHOOL;

RENAME STUDENT_24MCA0242 TO STUDENT;
RENAME PROFESSOR_24MCA0242 TO PROFESSOR;


DROP TABLE ENROLL;
DROP TABLE SEMESTER;
DROP TABLE CLASS;




-----------7)-----------------
CREATE OR REPLACE TRIGGER check_enroll_date
BEFORE INSERT ON ENROLL_24MCA0242
FOR EACH ROW
DECLARE
    v_sdate SEMESTER_24MCA0242.Sdate%TYPE;
BEGIN
    SELECT Sem.Sdate
    INTO v_sdate
    FROM SEMESTER_24MCA0242 Sem
    JOIN CLASS_24MCA0242 C ON Sem.Sem_code = C.Sem_code
    WHERE C.Cls_code = :NEW.Cls_code;

    IF :NEW.Enroll_time > v_sdate THEN
        RAISE_APPLICATION_ERROR(-20001, 'Enrollment is not allowed after the semester start date.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Invalid class or semester.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Error: ' || SQLERRM);
END;
/


DROP TRIGGER check_enroll_date;

-- TESTING---------
INSERT INTO ENROLL_24MCA0242 (Cls_code, Reg_no, Enroll_time, Grade)
VALUES ('CLS03', 'R0002', TO_DATE('2023-09-15', 'YYYY-MM-DD'), 'A');

INSERT INTO ENROLL_24MCA0242 (Cls_code, Reg_no, Enroll_time, Grade)
VALUES ('CLS03', 'R0002', TO_DATE('2023-05-15', 'YYYY-MM-DD'), 'A');


-----------8)-----------------
SELECT D.SCode, D.Dept_id, S.Scl_name, COUNT(D.Dept_id) OVER (PARTITION BY D.SCode) AS Dept_count
FROM DEPARTMENT_24MCA0242 D
JOIN SCHOOL_24MCA0242 S ON D.SCode = S.SCode;

----------CHECKING UP------------
-------8) MAIN BELOW---------
CREATE OR REPLACE TRIGGER check_department_limit
BEFORE INSERT ON DEPARTMENT_24MCA0242
FOR EACH ROW
DECLARE
    v_dept_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_dept_count
    FROM DEPARTMENT_24MCA0242
    WHERE SCode = :NEW.SCode;

    IF v_dept_count >= 3 THEN
        RAISE_APPLICATION_ERROR(-20003, 'A school cannot have more than 3 departments.');
    END IF;
END;
/

DROP TRIGGER check_department_limit;

----------------TESTING------------
INSERT INTO DEPARTMENT_24MCA0242 (Dept_id, Dname, SCode, Prof_id)
VALUES ('D0010', 'Dept 4', 'S0006', 'P0004');


-----------9)-----------------
CREATE OR REPLACE TRIGGER trg_professor_delete
BEFORE DELETE ON PROFESSOR_24MCA0242
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM SCHOOL_24MCA0242
    WHERE Prof_id = :OLD.Prof_id;
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Cannot delete professor: Prof_id is referenced in SCHOOL table.');
    END IF;

    SELECT COUNT(*) INTO v_count
    FROM DEPARTMENT_24MCA0242
    WHERE Prof_id = :OLD.Prof_id;
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Cannot delete professor: Prof_id is referenced in DEPARTMENT table.');
    END IF;

    SELECT COUNT(*) INTO v_count
    FROM CLASS_24MCA0242
    WHERE Prof_id = :OLD.Prof_id;
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Cannot delete professor: Prof_id is referenced in CLASS table.');
    END IF;

    SELECT COUNT(*) INTO v_count
    FROM STUDENT_24MCA0242
    WHERE Prof_id = :OLD.Prof_id;
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Cannot delete professor: Prof_id is referenced in STUDENT table.');
    END IF;
END;
/


-----------TESTING------
DELETE FROM PROFESSOR_24MCA0242 WHERE Prof_id = 'P0003';


-----------10)-----------------
DECLARE
    v_dept_id_P0006 PROFESSOR_24MCA0242.Dept_id%TYPE;
    v_dept_id_P0007 PROFESSOR_24MCA0242.Dept_id%TYPE;
BEGIN
    SELECT Dept_id INTO v_dept_id_P0006
    FROM PROFESSOR_24MCA0242
    WHERE Prof_id = 'P0006';

    SELECT Dept_id INTO v_dept_id_P0007
    FROM PROFESSOR_24MCA0242
    WHERE Prof_id = 'P0007';

    UPDATE PROFESSOR_24MCA0242
    SET Dept_id = CASE
                    WHEN Prof_id = 'P0006' THEN v_dept_id_P0007
                    WHEN Prof_id = 'P0007' THEN v_dept_id_P0006
                  END
    WHERE Prof_id IN ('P0006', 'P0007');

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Departments interchanged successfully between Professors P0006 and P0007.');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('One or both professors not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/


----------------TESTING------------
SELECT Prof_id, Dept_id FROM PROFESSOR_24MCA0242
WHERE Prof_id IN ('P0006', 'P0007');



----------------------11)---------------
CREATE OR REPLACE FUNCTION get_department_head(p_dept_id IN DEPARTMENT_24MCA0242.Dept_id%TYPE)
RETURN PROFESSOR_24MCA0242.Prof_name%TYPE IS
    v_head_name PROFESSOR_24MCA0242.Prof_name%TYPE;

BEGIN
    SELECT p.Prof_name
    INTO v_head_name
    FROM PROFESSOR_24MCA0242 p
    JOIN DEPARTMENT_24MCA0242 d ON p.Prof_id = d.Prof_id
    WHERE d.Dept_id = p_dept_id;
    RETURN v_head_name; 

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    WHEN OTHERS THEN
        RETURN 'Error: ' || SQLERRM; 
END;
/

----------------TESTING------------
DECLARE
    v_head_name PROFESSOR_24MCA0242.Prof_name%TYPE;
BEGIN
    v_head_name := get_department_head('D0003');
    IF v_head_name IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Head of Department D0003: ' || v_head_name);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No head found for Department D0003.');
    END IF;
END;
/


----------------------12)---------------
CREATE OR REPLACE FUNCTION get_student_age(p_reg_no IN STUDENT_24MCA0242.Reg_no%TYPE)
RETURN NUMBER IS
    v_age NUMBER;

BEGIN
    SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, DoB) / 12)
    INTO v_age
    FROM STUDENT_24MCA0242
    WHERE Reg_no = p_reg_no;
    RETURN v_age;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    WHEN OTHERS THEN
        RETURN -1; 
END;
/


------------TESTING-----------
DECLARE
    v_age NUMBER;
BEGIN
    v_age := get_student_age('R0001');

    IF v_age IS NOT NULL AND v_age >= 0 THEN
        DBMS_OUTPUT.PUT_LINE('Age of Student R0001: ' || v_age || ' years');
    ELSIF v_age IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('No student found with Reg_no R0001');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error calculating age');
    END IF;
END;
/

