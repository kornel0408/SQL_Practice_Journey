-- *********************************************************************
--         TABLE RELATED QUERIES (ALTER Command)
-- *********************************************************************

-- -------------------------------------------------------------------
--           CREATING TABLE                                           
-- --------------------------------------------------------------------
CREATE TABLE student_records (
    id INT,
    name VARCHAR(30),
    course VARCHAR(20),
    marks INT
);

-- -------------------------------------------------------------------
-- INSERTING DATA                                                   
-- -------------------------------------------------------------------
INSERT INTO student_records VALUES
(1, 'Ravi', 'BCA', 75),
(2, 'Anita', 'BBA', 82),
(3, 'Suresh', 'BCA', 68),
(4, 'Meena', 'BCom', 90),
(5, 'Arjun', 'BCA', 55),
(6, 'Neha', 'BBA', 77),
(7, 'Rahul', 'BCom', 84),
(8, 'Pooja', 'BCA', 73);

-- =======================================================================
-- QUERIES FOR REAL WORLD PROBLEMS
-- =======================================================================

-- 1. Add column age.
ALTER TABLE student_records
ADD COLUMN age INT NOT NULL;

-- 2. Add column email.
ALTER TABLE student_records
ADD COLUMN email VARCHAR(30);

-- 3. Add column status with default 'active'.
ALTER TABLE student_records
ADD COLUMN status_ VARCHAR(20) DEFAULT 'active';

-- 4. Add column phone_number NOT NULL.
ALTER TABLE student_records
ADD COLUMN phone_number INT NOT NULL;

-- 5. Rename column name → student_name.
ALTER TABLE student_records
CHANGE COLUMN name student_name VARCHAR(40); 

-- 6. Change marks datatype to BIGINT.
ALTER TABLE student_records
MODIFY marks BIGINT;

-- 7. Increase course size to VARCHAR(50).
DESC student_records; -- showa table schema

ALTER TABLE student_records
MODIFY course VARCHAR(50);

-- 8. Drop column email.
ALTER TABLE student_records
DROP COLUMN email;

-- 9. Drop column age.
ALTER TABLE student_records
DROP COLUMN age;

-- 10. Rename table to college_students.
ALTER TABLE student_records
RENAME TO college_students;

-- 11. Make phone_number UNIQUE.
DESC college_students;

ALTER TABLE college_students
MODIFY phone_number int UNIQUE;

-- 12. Make id PRIMARY KEY.
ALTER TABLE college_students
MODIFY id INT PRIMARY KEY;

-- 13. Add column joining_date.
ALTER TABLE college_students
ADD COLUMN joining_date DATE ;

-- 14. Add column attendance default 0.
ALTER TABLE college_students
ADD COLUMN attendance INT DEFAULT 0;

-- 15. Add column address.
ALTER TABLE college_students
ADD COLUMN address VARCHAR(100);
