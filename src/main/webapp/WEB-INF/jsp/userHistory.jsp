<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>My History</title>
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
        h1, h2 {
            margin: 0;
            font-size: 1.8em;
        }
        h2 {
            font-size: 1.4em;
            color: #2980b9;
            border-bottom: 2px solid #3498db;
            padding-bottom: 8px;
            margin: 25px 0 15px 0;
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
        .history-container {
            background-color: white;
            padding: 25px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .history-item {
            padding: 15px;
            border-left: 3px solid #3498db;
            margin-bottom: 15px;
            background-color: #f8f9fa;
        }
        .history-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
        }
        .history-title {
            font-weight: 600;
            color: #2c3e50;
        }
        .history-date {
            color: #7f8c8d;
            font-size: 0.9em;
        }
        .history-content {
            margin-top: 5px;
        }
        .history-type {
            display: inline-block;
            padding: 2px 8px;
            border-radius: 12px;
            font-size: 0.8em;
            font-weight: 600;
            margin-right: 8px;
        }
        .type-comment {
            background-color: #e1f0fa;
            color: #2980b9;
        }
        .type-vote {
            background-color: #e8f5e9;
            color: #27ae60;
        }
        .empty-message {
            text-align: center;
            color: #7f8c8d;
            padding: 30px 0;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>My Activity History</h1>
    </div>

    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="userEdit.jsp">Edit Profile</a>
    </div>

    <div class="history-container">
        <h2>Recent Comments</h2>
        
        <div class="history-item">
            <div class="history-header">
                <span class="history-title">Introduction to Web Development</span>
                <span class="history-date">March 18, 2025</span>
            </div>
            <div class="history-content">
                <span class="history-type type-comment">Comment</span>
                "Thank you for the materials! I found the diagram on page 12 particularly helpful..."
            </div>
        </div>

        <div class="history-item">
            <div class="history-header">
                <span class="history-title">Spring Framework Overview</span>
                <span class="history-date">March 22, 2025</span>
            </div>
            <div class="history-content">
                <span class="history-type type-comment">Comment</span>
                "Could you clarify the difference between @Controller and @RestController annotations?"
            </div>
        </div>

        <h2>Recent Votes</h2>
        
        <div class="history-item">
            <div class="history-header">
                <span class="history-title">Mid-term Test Date Preference</span>
                <span class="history-date">March 15, 2025</span>
            </div>
            <div class="history-content">
                <span class="history-type type-vote">Vote</span>
                You selected: "April 14, 2025 (Monday)"
            </div>
        </div>

        <div class="history-item">
            <div class="history-header">
                <span class="history-title">Practice Session Topics</span>
                <span class="history-date">March 10, 2025</span>
            </div>
            <div class="history-content">
                <span class="history-type type-vote">Vote</span>
                You selected: "Database Connectivity"
            </div>
        </div>
    </div>
</body>
</html>