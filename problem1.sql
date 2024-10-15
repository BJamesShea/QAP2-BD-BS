CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
     first_name VARCHAR(50) NOT NULL,
     last_name VARCHAR(50) NOT NULL,
     email VARCHAR(100) NOT NULL,
     school_enrollment_date DATE
);

CREATE TABLE professors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(100)
);

CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_description VARCHAR(300),
    professor_id INT,
    FOREIGN KEY (professor_id) REFERENCES professors(id)
);

CREATE TABLE enrollments(
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES  students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

INSERT INTO students (first_name, last_name, email, school_enrollment_date) VALUES
('Nell', 'Crain', 'nellcrain@thohh.com', '1999-01-02'), --Haunting of Hill House the greatest TV show ever made
('Dani', 'Clayton', 'daniclayton@thobm.com', '1928-11-04'), --Haunting of Bly Manor the second greatest TV show ever made
('Paul', 'Hill', 'paulhill@midnightmass.com', '1991-02-17'), --Midnight Mass the third greatest TV show ever made
('Robert', 'Baratheon', 'robbaratheon@got.com', '1674-07-20'),
('Barney', 'Stinson', 'barnetstinson@himym.com', '1987-10-11');

INSERT INTO professors (first_name, last_name, department) VALUES
('Barack', 'Obama', 'Presidential debate'),
('Justin', 'Trudeau', 'Hockey'),
('Albert', 'Einstein', 'Basic Math'),
('John', 'Mayer', 'Advanced Music');


INSERT INTO courses (course_name, course_description, professor_id) VALUES
('Presidential Decate 1001', 'Learn how to be presidential', 1),
('Hockey 2002', 'Become Wayne Gretzky', 2),
('Basic Math 1103', 'Quick Maths', 3),
('Advanced Music 4001', 'Advanced Music Theory aka; play Gravity 100 times in a row', 4);



INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1,1, '2024-07-11'), -- Nell
(2,2, '2024-07-10'), -- Dani
(3,3, '2024-07-09'), -- Paul
(4,1, '2024-07-12'), -- Robert
(5,2, '2024-07-10'); -- Barney

SELECT 
    CONCAT(students.first_name, ' ', students.last_name) AS full_name
FROM students
JOIN enrollments ON students.id = enrollments.student_id
JOIN courses ON enrollments.course_id = courses.id
WHERE courses.course_name = 'Hockey 2002';



SELECT
    courses.course_name,
    CONCAT(professors.first_name, ' ', professors.last_name) AS professor_name
FROM courses
JOIN professors ON courses.professor_id = professors.id;


SELECT 
    DISTINCT courses.course_name
FROM courses
JOIN enrollments ON courses.id = enrollments.course_id;

