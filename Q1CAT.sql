CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

CREATE TABLE Subjects (
    subject_name VARCHAR(100) PRIMARY KEY
);

CREATE TABLE Examinations (
    student_id INT,
    subject_name VARCHAR(100),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_name) REFERENCES Subjects(subject_name)
);

-- Insert into Students table
INSERT INTO Students (student_id, student_name) values
(1, 'Alice'),
(2, 'Bob'),
(13, 'John'),
(6, 'Alex');

-- Insert into Subjects table
INSERT INTO Subjects (subject_name) VALUES
('Math'),
('Physics'),
('Programming');

-- Insert into Examinations table
INSERT INTO Examinations (student_id, subject_name) VALUES
(1, 'Math'),
(1, 'Physics'),
(1, 'Programming'),
(2, 'Programming'),
(1, 'Physics'),
(1, 'Math'),
(13, 'Math'),
(13, 'Programming'),
(13, 'Physics'),
(2, 'Math'),
(1, 'Math');

-- Ex1 
SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.student_id) AS attended_exams
FROM 
    Students s
CROSS JOIN
    Subjects sub
LEFT JOIN 
    Examinations e
ON 
    s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY
    s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;