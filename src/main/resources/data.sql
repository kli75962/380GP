DELETE FROM user_poll_vote;
DELETE FROM poll_option;
DELETE FROM poll;
DELETE FROM comment;
DELETE FROM lecture;
DELETE FROM course;
DELETE FROM users;
INSERT INTO users (id, username, password, name, email, phone, role)
VALUES
    (1, 'john_doe', '123', 'John Doe', '1@1', '1234567890', 'TEACHER'),
    (2, 'john45645', '123', 'John Doe', '1@123.com', '1234567890', 'TEACHER'),
    (3, 'john123', '123', 'John Doe', '1@13454.com', '1234567890', 'STUDENT'),
    (4, 'jane_smith', 'hashed_password_here', 'Jane Smith', 'jane.smith@example.com', '0987654321', 'ADMIN');

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

-- Insert Polls
INSERT INTO poll (id, question, end_date) VALUES 
(1, 'Which date do you prefer for the mid-term test?', '2025-04-07 23:59:59'),
(2, 'Which topic would you like more practice with?', '2025-04-14 23:59:59');

-- Insert Poll Options for Mid-term Test Date
INSERT INTO poll_option (poll_id, option_id, option_text, vote_count) VALUES
(2, 1, 'April 10, 2025 (Friday)', 15),
(2, 2, 'April 14, 2025 (Monday)', 25),
(2, 3, 'April 17, 2025 (Thursday)', 8),
(2, 4, 'April 21, 2025 (Monday)', 2);


-- Insert Poll Options for Practice Topic
INSERT INTO poll_option (poll_id, option_id, option_text, vote_count) VALUES
(1, 1, 'Spring Boot Security', 12),
(1, 2, 'Database Design', 18),
(1, 3, 'RESTful API Development', 22),
(1, 4, 'Frontend Development', 8);


-- Insert User Poll Votes
INSERT INTO user_poll_vote (user_id, poll_id, option_id) VALUES
(1, 2, 2),  -- Teacher voted for April 14
(2, 2, 2),  -- Another teacher voted for April 14
(3, 2, 1),  -- Student voted for April 10
(4, 2, 3);  -- Admin voted for April 17

