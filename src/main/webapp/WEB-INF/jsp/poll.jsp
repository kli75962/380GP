<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Poll - COMPS 380F</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f8fa;
        }
        .header {
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 30px;
        }
        h1 {
            margin: 0;
            font-size: 1.8em;
        }
        .nav {
            display: flex;
            gap: 15px;
            margin: 20px 0;
        }
        .nav a {
            color: #3498db;
            text-decoration: none;
            font-weight: 600;
        }
        .nav a:hover {
            text-decoration: underline;
        }
        .poll-container {
            background-color: white;
            padding: 25px;
            border-radius: 5px;
            margin-bottom: 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .poll-question {
            font-size: 1.3em;
            color: #2c3e50;
            margin-bottom: 20px;
            font-weight: 600;
        }
        .poll-option {
            display: block;
            margin: 15px 0;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #f8f9fa;
            cursor: pointer;
            transition: all 0.3s;
        }
        .poll-option:hover {
            background-color: #e1f0fa;
            border-color: #3498db;
        }
        .poll-option.selected {
            background-color: #e1f0fa;
            border-left: 4px solid #3498db;
            font-weight: 600;
        }
        .vote-count {
            font-size: 0.9em;
            color: #7f8c8d;
            margin-top: 5px;
        }
        .poll-actions {
            margin-top: 20px;
        }
        button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }
        button:hover {
            background-color: #2980b9;
        }
        .comment-section {
            margin-top: 40px;
        }
        .comment-form {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 30px;
        }
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 10px;
            min-height: 100px;
        }
        .comment {
            border-left: 3px solid #3498db;
            padding: 15px;
            margin-bottom: 20px;
            background-color: #f8f9fa;
        }
        .comment-header {
            font-weight: bold;
            margin-bottom: 10px;
            color: #2c3e50;
        }
        .comment-meta {
            font-size: 0.9em;
            color: #7f8c8d;
            margin-bottom: 5px;
        }
        .role-teacher {
            color: #e74c3c;
        }
        .role-ta {
            color: #f39c12;
        }
        .role-student {
            color: #27ae60;
        }
        .login-prompt {
            text-align: center;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 5px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Web Applications: Design and Development</h1>
    </div>

    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="index.jsp">Lectures</a>
        <a href="poll.jsp">Polls</a>
    </div>

    <div class="poll-container">
        <div class="poll-question">Which date do you prefer for the mid-term test?</div>
        
        <form>
            <label class="poll-option">
                <input type="radio" name="pollOption" value="1"> April 10, 2025 (Friday)
                <div class="vote-count">15 votes (30%)</div>
            </label>
            
            <label class="poll-option selected">
                <input type="radio" name="pollOption" value="2" checked> April 14, 2025 (Monday)
                <div class="vote-count">25 votes (50%)</div>
            </label>
            
            <label class="poll-option">
                <input type="radio" name="pollOption" value="3"> April 17, 2025 (Thursday)
                <div class="vote-count">8 votes (16%)</div>
            </label>
            
            <label class="poll-option">
                <input type="radio" name="pollOption" value="4"> April 21, 2025 (Monday)
                <div class="vote-count">2 votes (4%)</div>
            </label>
            
            <div class="poll-actions">
                <button type="submit">Submit Vote</button>
                <button type="button">Change Vote</button>
            </div>
        </form>
    </div>

    <div class="comment-section">
        <h2>Discussion</h2>
        
        <div class="comment-form">
            <h3>Post a Comment</h3>
            <textarea placeholder="Share your thoughts about this poll..."></textarea>
            <div>
                <button type="submit">Post Comment</button>
            </div>
        </div>

        <h3>Previous Comments</h3>
        
        <div class="comment">
            <div class="comment-header">
                <span class="role-teacher">Prof. Johnson (Instructor)</span>
            </div>
            <div class="comment-meta">Posted on March 15, 2025</div>
            <div class="comment-body">
                "Please vote for your preferred date. The test will be 2 hours long and cover all material up to lecture 8."
            </div>
        </div>

        <div class="comment">
            <div class="comment-header">
                <span class="role-student">Sarah M. (Student)</span>
            </div>
            <div class="comment-meta">Posted on March 18, 2025</div>
            <div class="comment-body">
                "I prefer Monday dates as it gives us the weekend to prepare. What does everyone else think?"
            </div>
        </div>
    </div>
</body>
</html>