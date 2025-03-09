-- Show all databases
SHOW DATABASES;

-- Use the correct database
USE studentmanagement1;

-- Show all tables
SHOW TABLES;

-- Show all data from 'courses' table
SELECT * FROM courses;

-- Create 'Students3' table (if not already created)
CREATE TABLE IF NOT EXISTS Students3 (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    math_score INT CHECK(math_score BETWEEN 0 AND 100),
    science_score INT CHECK(science_score BETWEEN 0 AND 100),
    english_score INT CHECK(english_score BETWEEN 0 AND 100)
);

-- Insert data into Students3
INSERT INTO Students3 (name, math_score, science_score, english_score)
VALUES 
('tarun', 85, 90, 89),
('raghul', 82, 88, 95),
('nandha', 88, 99, 78),
('irfan', 89, 98, 87);

-- Show all students
SELECT * FROM Students3;

-- Get Top 2 Students by Total Score
SELECT student_id, name, math_score, science_score, english_score,
       (math_score + science_score + english_score) AS total_score
FROM Students3
ORDER BY total_score DESC
LIMIT 2;

-- Get Average Math Score of Students with Math Score > 70
SELECT AVG(math_score) AS avg_math_score
FROM Students3
WHERE math_score > 70;

-- Get Average Total Score (Fixed Calculation)
SELECT AVG(math_score + science_score + english_score) AS avg_total_score
FROM Students3
WHERE (math_score + science_score + english_score) BETWEEN 250 AND 300;

-- Get Second Highest Math Score (Fixed)
SELECT MAX(math_score) AS second_highest_math_score
FROM Students3
WHERE math_score < (SELECT MAX(math_score) FROM Students3);
