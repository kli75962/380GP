DELETE FROM users;

INSERT INTO users (username, password, name, email, phone, role)
VALUES
    ('john_doe', 'hashed_password_here', 'John Doe', 'john.doe@example.com', '1234567890', 'USER'),
    ('jane_smith', 'hashed_password_here', 'Jane Smith', 'jane.smith@example.com', '0987654321', 'ADMIN');
