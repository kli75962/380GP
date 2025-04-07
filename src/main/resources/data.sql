DELETE FROM users;
-- Delete comments first
DELETE FROM comment;

-- Delete lecture download links next
DELETE FROM lecture_download_links;

-- Delete lectures
DELETE FROM lecture;

-- Delete courses last
DELETE FROM course;

INSERT INTO users (username, password, name, email, phone, role)
VALUES
    ('john doe', '123', 'John Doe', '1@1', '1234567890', 'TEACHER'),
    ('jane smith', 'hashed_password_here', 'Jane Smith', 'jane.smith@example.com', '0987654321', 'ADMIN');

-- Insert Courses
INSERT INTO course (id, title) VALUES (1, 'Web Applications: Design and Development');

-- Insert Lectures
INSERT INTO lecture (id, title, course_id) VALUES (1, 'Introduction to Spring Boot', 1);
INSERT INTO lecture (id, title, course_id) VALUES (2, 'Spring Boot with H2', 1);
INSERT INTO lecture (id, title, course_id) VALUES (3, 'Jakarta EE Basics', 1);
INSERT INTO lecture (id, title, course_id) VALUES (4, 'JPA and Transactions', 1);

-- Insert Comments
INSERT INTO comment (username, content, timestamp, lecture_id) VALUES
('alice', 'Great intro!', CURRENT_TIMESTAMP, 1),
('bob', 'Could you explain more about @SpringBootApplication?', CURRENT_TIMESTAMP, 1),
('teacher_mike', 'I added more notes on slide 5.', CURRENT_TIMESTAMP, 1),
('charlie', 'Helpful H2 tutorial, thanks!', CURRENT_TIMESTAMP, 2),
('alice', 'Jakarta EE is quite verbose 😅', CURRENT_TIMESTAMP, 3);
