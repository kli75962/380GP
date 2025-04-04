DELETE FROM users;

INSERT INTO users (username, password, name, email, phone, role)
VALUES
    ('john_doe', '123', 'John Doe', '1@1', '1234567890', 'STUDENT'),
    ('jane_smith', 'hashed_password_here', 'Jane Smith', 'jane.smith@example.com', '0987654321', 'ADMIN');
