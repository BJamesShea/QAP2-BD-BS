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
    professer_id INT,
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