DELETE FROM user_poll_vote;
DELETE FROM poll_option;
DELETE FROM poll;
DELETE FROM comment;
DELETE FROM lecture;
DELETE FROM course;
DELETE FROM users;

-- Insert Users
INSERT INTO users (id, username, password, name, email, phone, role)
VALUES
    (1, 'prof_smith', '123', 'Professor Smith', 'smith@university.edu', '1234567890', 'TEACHER'),
    (2, 'dr_jones', '123', 'Dr. Jones', 'jones@university.edu', '2345678901', 'TEACHER'),
    (3, 'student_alice', '123', 'Alice Brown', 'alice@student.edu', '3456789012', 'STUDENT'),
    (4, 'student_bob', '123', 'Bob Wilson', 'bob@student.edu', '4567890123', 'STUDENT'),
    (5, 'student_carol', '123', 'Carol Davis', 'carol@student.edu', '5678901234', 'STUDENT');

-- Insert Courses
INSERT INTO course (id, title) VALUES 
(1, 'Web Applications: Design and Development'),
(2, 'Database Systems'),
(3, 'Software Engineering'),
(4, 'Computer Networks');

-- Insert Lectures
INSERT INTO lecture (id, title, course_id) VALUES 
(1, 'Introduction to Spring Boot', 1),
(2, 'Spring Boot with H2', 1),
(3, 'Jakarta EE Basics', 1),
(4, 'JPA and Transactions', 1),
(5, 'SQL Fundamentals', 2),
(6, 'Database Design', 2),
(7, 'Software Development Lifecycle', 3),
(8, 'Agile Methodology', 3),
(9, 'Network Protocols', 4),
(10, 'Network Security', 4);

-- Insert Comments
INSERT INTO comment (username, content, timestamp, lecture_id) VALUES
('student_alice', 'Great introduction to Spring Boot! Very clear explanation.', CURRENT_TIMESTAMP, 1),
('student_bob', 'Could you provide more examples of @SpringBootApplication?', CURRENT_TIMESTAMP, 1),
('prof_smith', 'I will add more examples in the next lecture.', CURRENT_TIMESTAMP, 1),
('student_carol', 'The H2 database tutorial was very helpful!', CURRENT_TIMESTAMP, 2),
('dr_jones', 'Remember to check the additional resources I posted.', CURRENT_TIMESTAMP, 2),
('student_alice', 'Jakarta EE seems complex but powerful.', CURRENT_TIMESTAMP, 3),
('student_bob', 'The transaction examples were very clear.', CURRENT_TIMESTAMP, 4),
('prof_smith', 'Good questions in class today!', CURRENT_TIMESTAMP, 5),
('student_carol', 'Database design concepts are becoming clearer.', CURRENT_TIMESTAMP, 6),
('dr_jones', 'Excellent progress on the project!', CURRENT_TIMESTAMP, 7);

-- Insert Polls
INSERT INTO poll (id, question, end_date) VALUES 
(1, 'Which date do you prefer for the mid-term test?', '2025-04-07 23:59:59'),
(2, 'Which topic would you like more practice with?', '2025-04-14 23:59:59'),
(3, 'Preferred time for office hours?', '2025-04-21 23:59:59'),
(4, 'Course project presentation format?', '2025-04-28 23:59:59');

-- Insert Poll Options for Mid-term Test Date
INSERT INTO poll_option (poll_id, option_id, option_text, vote_count) VALUES
(1, 1, 'April 10, 2025 (Friday)', 15),
(1, 2, 'April 14, 2025 (Monday)', 25),
(1, 3, 'April 17, 2025 (Thursday)', 8),
(1, 4, 'April 21, 2025 (Monday)', 2);

-- Insert Poll Options for Practice Topic
INSERT INTO poll_option (poll_id, option_id, option_text, vote_count) VALUES
(2, 1, 'Spring Boot Security', 12),
(2, 2, 'Database Design', 18),
(2, 3, 'RESTful API Development', 22),
(2, 4, 'Frontend Development', 8);

-- Insert Poll Options for Office Hours
INSERT INTO poll_option (poll_id, option_id, option_text, vote_count) VALUES
(3, 1, 'Monday 2-4 PM', 10),
(3, 2, 'Wednesday 10-12 AM', 15),
(3, 3, 'Friday 1-3 PM', 8),
(3, 4, 'By appointment', 5);

-- Insert Poll Options for Project Presentation
INSERT INTO poll_option (poll_id, option_id, option_text, vote_count) VALUES
(4, 1, 'In-person presentation', 20),
(4, 2, 'Pre-recorded video', 12),
(4, 3, 'Live online presentation', 15),
(4, 4, 'Written report only', 3);

-- Insert User Poll Votes
INSERT INTO user_poll_vote (user_id, poll_id, option_id) VALUES
(1, 1, 2),  -- Professor Smith voted for April 14
(2, 1, 2),  -- Dr. Jones voted for April 14
(3, 1, 1),  -- Alice voted for April 10
(4, 1, 3),  -- Bob voted for April 17
(5, 1, 2),  -- Carol voted for April 14
(1, 2, 3),  -- Professor Smith voted for RESTful API
(2, 2, 2),  -- Dr. Jones voted for Database Design
(3, 2, 1),  -- Alice voted for Spring Boot Security
(4, 2, 3),  -- Bob voted for RESTful API
(5, 2, 4);  -- Carol voted for Frontend Development

